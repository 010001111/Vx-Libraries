USE32
SUB EAX,[EAX]
SUB EBP,[EBP]
SUB [EAX+01FH],EAX
SUB [ECX+012345678H],ECX
SUB [EBP-01FH],ESI
SUB [EBP-012345678H],EBP
LES ESP,[+012345678H]
SUB EBP,[0EDCBA988H]
SUB ESP,EBP
MOV EAX,[01000H]
SHL EDI,0FFH
CALL NEAR [00010000H]
CALL FAR  [00010000H]
CMOVZ EAX,[ECX]