;Ian Fair 
; User: IZF0002
;date: 10/24/19
;Program reads a value from an array then places this value in another array with
;location shifter by a certain amount.


.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data

	input byte 1, 2, 3, 4, 5, 6, 7, 8
	output byte LENGTHOF input DUP(?)
	shift dword 3
.code

main proc

	;Tells loop to what to do and where to start reading
	mov eax, 0
	mov ebx, 0
	mov ecx, shift

	L1: ;This is where loop 1 starts
			NEG ecx
			mov al, input[LENGTHOF input + ecx] ; moves value from input into al
			mov output[ebx], al ; moves value from al into output
			NEG ecx ;update index
			INC ebx ;update index
	loop L1 ;loop it fam

	;Loop iterates shift times.
	mov ecx, LENGTHOF input 
	sub ecx, shift
	mov edx, 0

	L2: ;Start of loop 2 
			mov al, input[edx] ;moves the value from input into al
			mov output[ebx], al ;moves the vale from al into output
			INC ebx ;increments the input index
			INC edx ;increments the output index
	loop L2 ;loops L2 as instructed in word document


invoke ExitProcess, 0
main endp
end main ;ends program