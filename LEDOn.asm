#include "p16f873a.inc"

; CONFIG
; __config 0x3FFA
__CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF
 
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program

START
    bsf 0x03, 5                      ; switch to bank 1 by setting RP0 of STATUS in bank 0
    movlw 0x00                       ; set all pins of PORTB to output by setting all bits of TRISB
    movwf 0x86                       ;   setting pins to o/p is possibly not required due to defaults
    bcf 0x83, 5                      ; switch back to bank 0 by clearing RP0 of STATUS in bank 1
    
    movlw 0xff                       ; Write 1 to all pins of PORTB.
    movwf 0x06			     ; Connecting an LED to any one of the pins should make it glow

    END