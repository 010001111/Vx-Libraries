-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-=-=-=-Bill Prisoner Disassembler Engine-=-=-=-=
-=-=-=-=-=-=-=-=-=-Version 1.1-=-=-=-=-=-=-=-=-=-
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
	(C)oded by 
		Bill Prisoner / TPOC
		     2006
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

		      ��� ���?
		      ========
BPDE  - ������������� ��������������� ������. ���-
��� ��� ���������� � �������, ������� � ������ ��-
������.  ���� ������ ����������� � ���� DLL. �� �-
�����  ����������� ������� obj ����� ��� ������� �
������� Delphi ��� � C++, � ����� ��������� ����-
��� �������������.
		      ���������
		      =========
BPDEDLL.DLL - ���������� ������������ ����������.
���������� ������������ ������������ ������� -
Disasm. ��� �� ��������:
int Disasm(char* Offset,Code* Instruction)
Offset - ��������� �� �������� ������
Instruction - ��������� �� ��������� Code.
��� ���������� ���:
C:
---
typedef struct _Code
{
	short FieldPresents;//For checking presenting fields
	short Prefix;//Prefixes of instruction
	char OpCodeExt;//if first BYTE1 of opcode is 0FH
	short OpCodeWord;//if OpCode is WORD1 - in escape opcodes (or floating point opcodes)
	unsigned char OpCode;//OpCode BYTE
	unsigned char OpCode2;//If OpCode is Two Byte then this field is second byte in the opcode
	unsigned char ModRM;//ModRM BYTE 
	char SIB;//SIB BYTE
	unsigned long Immediate;//Immediate operand 
	unsigned long ImmediateEx;//Second Immediate operand (only ENTER instruction)
	unsigned long Displacement;//Displacement for operand
	unsigned short Segment;//Segment for Pointer operands
	unsigned long RelOffset;//Relative Offset in jump instructions
	long Offset;//Offset for Pointer Operands 
	char InstructionString[50];//Disassembled String
	char Group;//NumberOfGroup(1-16)
	long Flags;//Opcode Flags
	long Length;//Length of instruction
} Code;

Delphi:
-------
PCode = ^_Code;
_Code = packed record
	FieldPresents:word;
	Prefix:word;
	OpCodeExt:byte;
	OpCodeWord:word;
	OpCode:byte;
	OpCode2:byte;
	ModRM:byte;
	SIB:byte;
	Immediate:longint;
	ImmediateEx:longint;
	Displacement:longint;
	Segment:word;
	RelOffset:longint;
	a:longint;//�.�. DLL ���� �������� �� ��
	//�� ���������� �������� ���� ���������, 
	//� ��� ����������� ��� ������� � ��������-
	//��� �����
	InstructionString:array[0..49]of char;
	Group:byte;
	Flags:longint;
	Length:longint;
end;

��� ������ �� ���� ��������� ����� ������ OpCode,
InstructionString � Length.
!!! ����� ������� ������� Disasm �������� ���� ��-
������� Code.!!!

 	               �����
		       =====
������� ������ ���� 2006 ���� � ����� ����� ��� �-
������� � ������� ������ ����� ����, � ����� ����-
���  � ��������� �������������� �� ��������������. 
�����  ��  ��� ����� ������� ������������ � ������ 
������ �� ���������� ��� ������������� �������. �-
��������� ����� ����� ������ ��������� ����������-
����  � ������ ���������� ��� ����� ���� � ���  ��
�����. � ��� ����� ���� �� �������� 100% ��������-
������� ��� ���� ��������� ���� ������ �������� �-
�� �����. ������ ��� ������ ���� ������ � ����� �-
����� ������ � ��� ����������� �����. ����� �����-
���� ���������� ����������� � ����, � ����� �� ���
����������� �������, �� ��� ��� ����� �� ����� ��-
������ ���������� ������. ��������� �������������-
����� ������ ������ ������ ���� � �������� � �� �-
������� ������� ���� � ����� ������� ������. ����-
��� ���� ������� ������� ���������� ����������� �-
����� - Mettalica. ��� ������ ������ � Apocalipti-
ca �������� ������� ������������������, ������ ���
���������������� ������� ����, �� ���������� ����-
��� � ������ ������ ��� �������� � ������������ �-
�� ��������. �� ���� ��������� ������ ��� ��� ���-
��, ����� ���� ���� ���� ��������, ���������, ���-
��� ����� ������, ������� ���� ������� ������ ���-
��  � ������. ���� �������� ��� ����� ����� ������.
�� ������ ���� ������ ������ �� ���������. ���� �-
��� ������ � ����, �������� ���� �� ������ � ����-
���:  "������ �� �� ���� ����?". ������ ����������
�� �������� ��. �� ������� ����� �� ���� ��� ����-
� ������, ���� ���� ���� �� ������� �� ������,  ��
��� ���� �����, � ����� ����� ������ ����? ������-
���� ���� ������ ��������? ������ ����� ����������?
���������� �����, �������  ��������  ��-���������� 
����? ���, �� ������ ����-��, �� �������� ����  ��
������ ���������� � ���� ������, ��������, �������
� ������� ����� ������, ������ � �������. ���� ��-
��, ���� ������. ��� �� ������ ������ - ��� �����-
����,  ��������� ������������� ������,  ����������
��������� ��������� ����������, ��������� ����� �-
���������� �� ��� ������ �� ���������� ��� ������
��������� ���. �� ���� �� ������ ���������, �� ��-
�� ��� ��� ����� ������� ���� �����...
				3:14 �� ������

		      �������
		      =======
��� ���� �������� �� ������, ��������� � ��������-
������.
WWW: http://tpoc.h16.ru
E-MAIL: bill_tpoc@mail.ru
ICQ: 271792804