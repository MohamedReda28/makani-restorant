import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:makani/features/payment/data/models/payment_request_model.dart';

import '../../../../../core/services/services/git_it_Service.dart';

class PaymentviewBody extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentviewBody> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController(text: "100");
  final _nameController = TextEditingController(text: "John Doe");
  final _emailController = TextEditingController(text: "john@example.com");
  final _phoneController = TextEditingController(text: "01012345678");

  String _selectedPaymentType = 'visa'; // القيمة الافتراضية

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final request = PaymentRequestModel(
        amount: _amountController.text,
        currency: "EGP",
        customerName: _nameController.text,
        customerEmail: _emailController.text,
        customerPhone: _phoneController.text,
        callbackUrl: "https://yourwebsite.com/callback",
        paymentType: _selectedPaymentType,
      );

      context.read<PaymentCubit>().startPayment(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("بوابة الدفع")),
      body: BlocProvider(
        create: (context) => getIt<PaymentCubit>(),
        child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _amountController,
                      decoration: const InputDecoration(labelText: "المبلغ (جنيه مصري)"),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                      value!.isEmpty ? "يرجى إدخال المبلغ" : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: "الاسم الكامل"),
                      validator: (value) =>
                      value!.isEmpty ? "يرجى إدخال الاسم" : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: "البريد الإلكتروني"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: "رقم الهاتف"),
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                      value!.isEmpty ? "يرجى إدخال رقم الهاتف" : null,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedPaymentType,
                      items: [
                        const DropdownMenuItem(
                          value: 'visa',
                          child: Text("فيزا / ماستركارد"),
                        ),
                        const DropdownMenuItem(
                          value: 'vodafone_cash',
                          child: Text("فودافون كاش"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentType = value!;
                        });
                      },
                      decoration: const InputDecoration(labelText: "طريقة الدفع"),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => _submitForm(context),
                      icon: const Icon(Icons.payment),
                      label: const Text("ابدأ الدفع"),
                    ),
                    const SizedBox(height: 24),
                    if (state is PaymentLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is PaymentSuccess)
                      Card(
                        color: Colors.green.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("✅ تم الدفع بنجاح!", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("رقم العملية: ${state.result.transactionId}"),
                              Text("الرسالة: ${state.result.message}"),
                            ],
                          ),
                        ),
                      ),
                    if (state is PaymentFailed)
                      Card(
                        color: Colors.red.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("❌ فشل في الدفع: ${state.error}"),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}