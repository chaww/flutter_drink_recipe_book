part of '../home.dart';

class _FormLogin extends StatefulWidget {
  const _FormLogin();

  @override
  State<_FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<_FormLogin> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Cloud Storage',
          style: context.typographies.heading,
        ),
        const SizedBox(height: 32),
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
            context.read<SettingsBloc>().add(Login(email: email, password: password));
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
    );
  }
}
