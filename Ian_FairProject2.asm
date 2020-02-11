;submitter: izf0002
;Date: 10/4/2019
;Follows worksheet instructions
.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;Setup the input array and the shift variable
.data
	input byte 1,2,3,4,5,6,7,8
	shift byte 2
.code
	main proc
	;clear up the registers to make sure there is no old values inside them

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	;set up EAX register with first and second values from the input array
	mov ah, [input]
	add ah, shift + 1
	
	mov al, [input + 1]
	add al, shift + 2
	;set up EBX register with 3rd and 4th values from the input array
	mov bh, [input + 2]
	add bh, shift + 3
	
	mov bl, [input + 3]
	add bl, shift + 4
	;set up ECX register with 5th and 6th values from the input array
	mov ch, [input + 4]
	add ch, shift + 5
	
	mov cl, [input + 5]
	add cl, shift + 6
	;set up EDX register with the 7th and 8th values from the input array
	mov dh, [input + 6]
	add dh, shift + 7
	
	mov dl, [input + 7]
	add dl, shift + 8

	invoke ExitProcess, 0

main endp
end main
