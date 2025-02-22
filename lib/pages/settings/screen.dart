import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:water_tracking/database/setting_db.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingDB = SettingDB();
    final language = useState<String>('system');
    final theme = useState<String>('system');

    // 语言选项
    final languageOptions = [
      {'value': 'system', 'label': 'System Default', 'locale': null},
      {'value': 'en_US', 'label': 'English', 'locale': const Locale('en', 'US')},
      {'value': 'zh_CN', 'label': '中文', 'locale': const Locale('zh', 'CN')},
    ];

    // 主题选项
    final themeOptions = [
      {'value': 'system', 'label': 'System Default', 'icon': Icons.brightness_auto},
      {'value': 'light', 'label': 'Light', 'icon': Icons.light_mode},
      {'value': 'dark', 'label': 'Dark', 'icon': Icons.dark_mode},
    ];

    // 初始化设置
    useEffect(() {
      settingDB.getValue('language').then((value) {
        language.value = value ?? 'system';
      });
      settingDB.getValue('theme').then((value) {
        theme.value = value ?? 'system';
      });
      return null;
    }, []);

    // 应用语言设置
    Future<void> applyLanguage(String value) async {
      language.value = value;
      await settingDB.setValue('language', value);
      
      if (value == 'system') {
        await context.resetLocale();
      } else {
        final parts = value.split('_');
        if (parts.length == 2) {
          await context.setLocale(Locale(parts[0], parts[1]));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'.tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          // 通用设置
          _buildSectionHeader(context, 'General'.tr()),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('language'.tr()),
            subtitle: Text(
              languageOptions.firstWhere(
                (option) => option['value'] == language.value,
                orElse: () => languageOptions.first,
              )['label'] as String,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Choose Language'.tr()),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: languageOptions.map((option) => RadioListTile(
                      title: Text(option['label'] as String),
                      value: option['value'],
                      groupValue: language.value,
                      onChanged: (value) async {
                        if (value != null) {
                          await applyLanguage(value.toString());
                          Navigator.pop(context);
                        }
                      },
                    )).toList(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              themeOptions.firstWhere(
                (option) => option['value'] == theme.value,
                orElse: () => themeOptions.first,
              )['icon'] as IconData,
            ),
            title: const Text('Theme'),
            subtitle: Text(
              themeOptions.firstWhere(
                (option) => option['value'] == theme.value,
                orElse: () => themeOptions.first,
              )['label'] as String,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Choose Theme'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: themeOptions.map((option) => RadioListTile(
                      title: Text(option['label'] as String),
                      value: option['value'],
                      groupValue: theme.value,
                      secondary: Icon(option['icon'] as IconData),
                      onChanged: (value) async {
                        if (value != null) {
                          theme.value = value.toString();
                          await settingDB.setValue('theme', value.toString());
                          // TODO: 应用主题设置
                          Navigator.pop(context);
                        }
                      },
                    )).toList(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_drink),
            title: const Text('Beverage Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/beverage'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Reminder Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/reminder'),
          ),
          const Divider(),

          // 数据设置
          _buildSectionHeader(context, 'Data'),
          ListTile(
            leading: const Icon(Icons.backup),
            title: const Text('WebDAV Backup'),
            subtitle: const Text('Backup your data to WebDAV server'),
            onTap: () {
              // TODO: 实现 WebDAV 备份功能
            },
          ),
          const Divider(),

          // 应用程序
          _buildSectionHeader(context, 'Application'),
          ListTile(
            leading: const Icon(Icons.bug_report_outlined),
            title: const Text('Report Issues'),
            onTap: () async {
              final Uri url = Uri.parse('https://github.com/Mahoo12138/water_tracking');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/about'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
