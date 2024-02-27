part of '../home.dart';

class _HomeCloud extends StatefulWidget {
  const _HomeCloud();

  @override
  State<_HomeCloud> createState() => __HomeCloudState();
}

class __HomeCloudState extends State<_HomeCloud> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MenuBloc>().state;

    return Column(
      children: [
        Text(
          'Cloud Storage',
          style: context.typographies.heading,
        ),
        const SizedBox(height: 32),
        if (state.isSignedIn) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.cloud_upload_outlined),
                label: const Text('Backup'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.cloud_download_outlined),
                label: const Text('Restore'),
              ),
            ],
          ),
          const SizedBox(height: 64),
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(ListMenuPage.route());
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('View List Menu'),
                Icon(Icons.navigate_next_outlined),
              ],
            ),
          ),
        ] else ...[
          TextFormField(
            initialValue: '',
            onChanged: (v) {
              setState(() {
                email = v;
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Email'),
              floatingLabelStyle: context.typographies.heading,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: '',
            onChanged: (v) {
              password = v;
            },
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Password'),
              floatingLabelStyle: context.typographies.heading,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<MenuBloc>().add(SignIn(email: email, password: password));
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 16),
                Text('Sign In'),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
