import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymboo_admin/features/personalization/models/branch_model.dart';
import 'package:gymboo_admin/features/personalization/models/user_model.dart';
import 'package:gymboo_admin/utils/constants/enums.dart';
import 'package:intl/intl.dart';
import 'package:gymboo_admin/utils/constants/colors.dart';

/// Widget que muestra los detalles de un usuario y permite cambiar su branch predeterminado a nivel de sistema
class gbUserDetailDesktop extends StatefulWidget {
  final UserModel userModel;

  const gbUserDetailDesktop({super.key, required this.userModel});


  @override
  State<gbUserDetailDesktop> createState() => _GbUserDetailDesktopState();
}

class _GbUserDetailDesktopState extends State<gbUserDetailDesktop> {
  UserModel? _effectiveUser;
  String? _systemDefaultBranchId;

  @override
  void initState() {
    super.initState();
    _effectiveUser = widget.userModel;
    _initializeSystemDefaultBranch();
  }

  void _initializeSystemDefaultBranch() {
    if (_effectiveUser != null && _effectiveUser!.branches.isNotEmpty) {
      // Primero intentamos encontrar el que está marcado como predeterminado en DB
      final defaultBranch = _effectiveUser!.branches
          .where((branch) => branch.isDefault == "S" || branch.isDefault == "true")
          .toList();

      if (defaultBranch.isNotEmpty) {
        _systemDefaultBranchId = defaultBranch.first.branch;
      } else {
        // Si no hay ninguno marcado como predeterminado, usar el primero activo
        final activeBranches = _effectiveUser!.branches
            .where((branch) => branch.state == "A")
            .toList();

        if (activeBranches.isNotEmpty) {
          _systemDefaultBranchId = activeBranches.first.branch;
        } else if (_effectiveUser!.branches.isNotEmpty) {
          // Si no hay activos, usar el primero de la lista
          _systemDefaultBranchId = _effectiveUser!.branches.first.branch;
        }
      }
    }
  }

  void _setSystemDefaultBranch(BranchModel branch) {
    setState(() {
      _systemDefaultBranchId = branch.branch;
    });

    // Notificar al usuario
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sucursal establecida como predeterminada'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    // Aquí podrías guardar esta preferencia en SharedPreferences o similar
    // para mantenerla entre sesiones
  }

  @override
  Widget build(BuildContext context) {
    // It's null safe here, because we require it in constructor.
    final user = _effectiveUser!;
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cabecera con foto de perfil y nombre
            _buildProfileHeader(user, theme),
            // Detalles del usuario
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sección de información personal
                  _buildSectionTitle('Información Personal', Icons.person_outline),
                  const SizedBox(height: 8),
                  _buildInfoCard([
                    _buildInfoRow(Icons.email_outlined, 'Email', user.email),
                    _buildInfoRow(
                        Icons.phone_outlined, 'Teléfono', user.phoneNumber),
                    _buildInfoRow(
                        Icons.badge_outlined, 'Nombre de usuario', user.username),
                    _buildInfoRow(Icons.admin_panel_settings_outlined, 'Rol',
                        _getRoleName(user.role)),
                  ]),
                  const SizedBox(height: 24),
                  // Sección de cuenta
                  _buildSectionTitle('Información de Cuenta', Icons.access_time),
                  const SizedBox(height: 8),
                  _buildInfoCard([
                    _buildInfoRow(
                        Icons.calendar_today_outlined,
                        'Fecha de creación',
                        user.createdAt != null
                            ? _formatDate(user.createdAt!)
                            : 'No disponible'),
                    _buildInfoRow(
                        Icons.update_outlined,
                        'Última actualización',
                        user.updatedAt != null
                            ? _formatDate(user.updatedAt!)
                            : 'No disponible'),
                  ]),
                  const SizedBox(height: 24),
                  // Sección de sucursales
                  if (user.branches.isNotEmpty) ...[
                    _buildBranchesSection(user),
                  ] else
                    _buildEmptyBranchesMessage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserModel user, ThemeData theme) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            gbColors.neonPink,
            theme.colorScheme.primary.withOpacity(0.7),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: user.profilePicture.isNotEmpty
                  ? NetworkImage(user.profilePicture)
                  : null,
              child: user.profilePicture.isEmpty
                  ? Text(
                _getInitials(user),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              )
                  : null,
            ),
            const SizedBox(height: 16),
            // Nombre completo
            Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            // Badge de rol
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                _getRoleName(user.role),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: children,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value.isNotEmpty ? value : 'No disponible',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: value.isNotEmpty ? Colors.black87 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBranchesSection(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Sucursales', Icons.business),
            Tooltip(
              message:
              'La selección de sucursal predeterminada solo afecta a esta sesión',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Solo para esta sesión',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Lista de sucursales
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: user.branches.length,
          itemBuilder: (context, index) {
            final branch = user.branches[index];
            final isSystemDefault = branch.branch == _systemDefaultBranchId;
            final isDbDefault =
                branch.isDefault == "S" || branch.isDefault == "true";

            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: isSystemDefault
                    ? BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2)
                    : BorderSide.none,
              ),
              elevation: isSystemDefault ? 4 : 1,
              color: isSystemDefault ? Colors.blue.shade50 : null,
              child: ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  branch.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: branch.state == "A"
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        branch.state == "A" ? 'Activa' : 'Inactiva',
                        style: TextStyle(
                          fontSize: 12,
                          color: branch.state == "A"
                              ? Colors.green.shade800
                              : Colors.red.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (isDbDefault)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Predeterminada en base de datos',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange.shade800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                  ],
                ),
                trailing: isSystemDefault
                    ? Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.blue,
                  ),
                )
                    : branch.state == "A"
                    ? IconButton(
                  icon: const Icon(
                    Icons.star_outline,
                    color: Colors.amber,
                  ),
                  tooltip:
                  'Establecer como predeterminada del sistema',
                  onPressed: () =>
                      _setSystemDefaultBranch(branch),
                )
                    : null,
              ),
            );
          },
        ),
        // Explicación adicional
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 4),
          child: Text(
            'Nota: Los cambios en la sucursal predeterminada solo afectan a la sesión actual.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyBranchesMessage() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              Icons.business_center,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            const Text(
              'El usuario no tiene sucursales asignadas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(UserModel user) {
    if (user.firstName.isNotEmpty && user.lastName.isNotEmpty) {
      return '${user.firstName[0]}${user.lastName[0]}'.toUpperCase();
    } else if (user.username.isNotEmpty) {
      return user.username[0].toUpperCase();
    }
    return '?';
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(date);
  }

  String _getRoleName(AppRole role) {
    switch (role) {
      case AppRole.user:
        return 'Usuario';
      case AppRole.admin:
        return 'Administrador';
      default:
        return role.toString().split('.').last;
    }
  }
}