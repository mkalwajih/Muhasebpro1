import 'dart:convert';
import '../../domain/entities/transaction_request_entity.dart';

class TransactionRequestModel extends TransactionRequestEntity {
  const TransactionRequestModel({
    required super.id,
    required super.requestNumber,
    required super.type,
    required super.status,
    required super.requesterId,
    required super.requesterName,
    super.approverId,
    super.approverName,
    required super.requestDate,
    super.approvalDate,
    required super.description,
    required super.totalAmount,
    super.voucherId,
    super.rejectionReason,
    required super.requestData,
    super.notes,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TransactionRequestModel.fromEntity(TransactionRequestEntity entity) {
    return TransactionRequestModel(
      id: entity.id,
      requestNumber: entity.requestNumber,
      type: entity.type,
      status: entity.status,
      requesterId: entity.requesterId,
      requesterName: entity.requesterName,
      approverId: entity.approverId,
      approverName: entity.approverName,
      requestDate: entity.requestDate,
      approvalDate: entity.approvalDate,
      description: entity.description,
      totalAmount: entity.totalAmount,
      voucherId: entity.voucherId,
      rejectionReason: entity.rejectionReason,
      requestData: entity.requestData,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory TransactionRequestModel.fromJson(Map<String, dynamic> json) {
    return TransactionRequestModel(
      id: json['id'],
      requestNumber: json['requestNumber'],
      type: TransactionRequestType.values.firstWhere(
        (e) => e.toString() == 'TransactionRequestType.${json['type']}',
      ),
      status: TransactionRequestStatus.values.firstWhere(
        (e) => e.toString() == 'TransactionRequestStatus.${json['status']}',
      ),
      requesterId: json['requesterId'],
      requesterName: json['requesterName'],
      approverId: json['approverId'],
      approverName: json['approverName'],
      requestDate: DateTime.parse(json['requestDate']),
      approvalDate: json['approvalDate'] != null ? DateTime.parse(json['approvalDate']) : null,
      description: json['description'],
      totalAmount: json['totalAmount'].toDouble(),
      voucherId: json['voucherId'],
      rejectionReason: json['rejectionReason'],
      requestData: json['requestData'] is String 
          ? jsonDecode(json['requestData']) 
          : json['requestData'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'requestNumber': requestNumber,
      'type': type.toString().split('.').last,
      'status': status.toString().split('.').last,
      'requesterId': requesterId,
      'requesterName': requesterName,
      'approverId': approverId,
      'approverName': approverName,
      'requestDate': requestDate.toIso8601String(),
      'approvalDate': approvalDate?.toIso8601String(),
      'description': description,
      'totalAmount': totalAmount,
      'voucherId': voucherId,
      'rejectionReason': rejectionReason,
      'requestData': jsonEncode(requestData),
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  TransactionRequestModel copyWith({
    String? id,
    String? requestNumber,
    TransactionRequestType? type,
    TransactionRequestStatus? status,
    String? requesterId,
    String? requesterName,
    String? approverId,
    String? approverName,
    DateTime? requestDate,
    DateTime? approvalDate,
    String? description,
    double? totalAmount,
    String? voucherId,
    String? rejectionReason,
    Map<String, dynamic>? requestData,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionRequestModel(
      id: id ?? this.id,
      requestNumber: requestNumber ?? this.requestNumber,
      type: type ?? this.type,
      status: status ?? this.status,
      requesterId: requesterId ?? this.requesterId,
      requesterName: requesterName ?? this.requesterName,
      approverId: approverId ?? this.approverId,
      approverName: approverName ?? this.approverName,
      requestDate: requestDate ?? this.requestDate,
      approvalDate: approvalDate ?? this.approvalDate,
      description: description ?? this.description,
      totalAmount: totalAmount ?? this.totalAmount,
      voucherId: voucherId ?? this.voucherId,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      requestData: requestData ?? this.requestData,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}