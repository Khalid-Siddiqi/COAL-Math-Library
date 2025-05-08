// Status:

//1) for remainder                (DONE)
//2) for swap                        (Done)
//3) for maxvaluefromarray           (Done)
//4) for Fibonacci                          (Done)
//5) M to CM                                 (Done)
//6) KM TO METER                      (Done)
//7) product of two numbers         (Done)     
//8)  add all elements of array:    
//19) leap year                             (Done)
//12) - 18) 			    (done)
//21) GCD                                    (done)

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//General INPUT ARRAY & OUTPT ARRAY

Input_array Proc ,arr:DWORD,length1:DWORD,type1:DWORD

mov esi, arr
mov ecx,length1
mwrite <"========= ENTER VALUES IN ARRAY =========">
call CRLF

L1:
call readdec
mov [esi],eax
add esi,type1
Loop L1

ret
Input_array ENDP

display_array PROC ,arr:DWORD,length1:DWORD,type1:DWORD

call CRLF
mwrite<"========= ARRAY ========= ">
call CRLF
mov eax,0
mov esi,arr
mov ecx,length1

L1:
mov eax,[esi]
call writedec
mov al,"	"
call writechar
add esi,type1
Loop L1

call CRLF
ret
display_array ENDP

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

1);for remainder

remainder PROTO, yno1:dword,yno2:dword
.data
no1 dword ?
no2 dword ?
.code
main proc
mwrite <"Enter the First Number: ">
call readdec
mov no1,eax
mwrite <"Enter the Second  Number : ">
call readdec
mov no2,eax
INVOKE remainder , no1 , no2
exit
main endp

remainder PROC, yno1:dword,yno2:dword
mov eax,yno1
mov ebx,yno2
mov edx,0
idiv ebx
mov eax,edx 
mwrite <"Remainder: ">
call writedec
ret
remainder endp
END main


xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

2) ;for swap

INCLUDE Irvine32.inc
INCLUDE Macros.inc

SwapFunc PROTO, yval1:DWORD,yval2:DWORD
.data
val1 DWORD ?
val2 DWORD ?
temp DWORD 0


.code
main PROC
mwrite<"Enter FIRST VALUE IS: ">
call readint
mov val1,eax
mwrite<"ENTER SECOND VALUE IS: ">
call readint
mov val2,eax
INVOKE SwapFunc ,val1,val2
exit
main endp

SwapFunc PROC, yval1:DWORD,yval2:DWORD
mov eax,0
mwrite<" ======== BEFORE SWAPPING ======= ">
call crlf
call crlf
mov eax,yval1
mwrite<"YOUR FIRST VALUE IS: ">
call WriteInt
call crlf
mov eax,yval2
mwrite<"YOUR FIRST VALUE IS: ">
call WriteInt

;Swaping start
call crlf
call crlf
mwrite<" ======== After SWAPPING ======= ">
call crlf
call crlf
mov ecx,yval1
mov ebx,yval2
mov yval1,ebx
mov eax,yval1
mwrite<"YOUR FIRST VALUE IS: ">
call WriteInt
call crlf
mov yval2,ecx
mov eax,yval2
mwrite<"YOUR FIRST VALUE IS: ">
call WriteInt
SwapFunc endp
END main
;for changing
mov eax,yval1
mov ebx,yval2
mov ecx,yval1
mov eax,yval2
mov ebx,ecx

call crlf
mov edx,OFFSET mymsg4
call WriteString
call crlf

mov edx,OFFSET mymsg2
call WriteString
call WriteInt
call crlf

mov eax,ebx
mov edx,OFFSET mymsg3
call WriteString
call WriteInt

ret
SwapFunc ENDP

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

3) ;for maxvaluefromarray
INCLUDE Irvine32.inc
INCLUDE Macros.inc

MyMaxArrayFunc PROTO, array:DWORD,size1:DWORD
.data
ans DWORD 0
tot DWORD ?
arrayx DWORD 100 DUP(?)

.code
main PROC
mwrite <"ENTER THE LENGTH FOR THE ARRAY: ">
call readdec
mov esi, offset arrayx
mov ecx,eax
mwrite <"ENTER THE VALUES IN ARRAY: ">
L1:
call readdec
mov [esi],eax
add esi,type arrayx
Loop L1
mwrite<"YOUR ARRAY IS: ">
invoke displayarray ,ADDR arrayx
invoke MyMaxArrayFunc, ADDR arrayx,lengthof arrayx
main ENDP


MyMaxArrayFunc PROC, array:DWORD,size1:DWORD
mov esi, array
mov eax,0
mov ecx,size1
l1:
cmp eax,[esi]
jg l2
mov eax,[esi]
l2:
add esi,type arrayx
loop l1
mwrite<"MAXIMUM VALUE IN THE ARRAY IS: ">
call writedec
ret
MyMaxArrayFunc ENDP
End main

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

4) fibonacci series

fibonacci PROC

Local First:BYTE,Second:BYTE
mov First,0
mov Second,1

mwrite<"Enter length of series: ">
call Readdec
mov ecx,eax
L1:
mov al,first
add al,second
call WriteDec
mov bl,second
mov first,bl
mov second,al
mov al," "
call Writechar
loop L1

fibonacci ENDP



5) ;M to CM

m_to_cm_no PROTo , yx1:dword  
.data
x1 dword ?
.code
main PROC
mwrite<"ENTER VALUE TO BE CONVERTED: ">
call readdec
mov x1,eax
INVOKE m_to_cm_no , x1  
exit
main ENDP
m_to_cm_no proc , yx1:dword  
mov eax,yx1
imul eax,eax,100
mwrite<"CentiMeter: ">
call writedec
call crlf
ret
m_to_cm_no endp
END main


6) ; KM TO METERS
km_to_m_no PROTo , yx1:dword  
.data
x1 dword ?
.code
main PROC
mwrite<"ENTER VALUE TO BE CONVERTED: ">
call readdec
mov x1,eax
INVOKE km_to_m_no , x1  
exit
main ENDP
km_to_m_no proc , yx1:dword  
mov eax,yx1
imul eax,eax,1000
mwrite<"Meter: ">
call writedec
call crlf
ret
km_to_m_no endp
END main


7) ;product of two numbers:
Product PROTO , yvalm1:dword ,yvalm2:dword
.data
valm1 dword ?
valm2 dword ?

.code
main PROC
mwrite<"ENTER First VALUE : ">
call readdec
mov valm1,eax
mwrite<"ENTER Second VALUE : ">
call readdec
mov valm2,eax
INVOKE Product , valm1 , valm2  
exit
main ENDP
Product proc , yvalm1:dword ,yvalm2:dword 
mov eax,yvalm1
mov ebx,yvalm2
imul ebx
mwrite<"Product: ">
call writedec
call crlf
ret
Product endp
END main


8) ;to add all ements of array:
.data

marray DWORD 100 DUP(?)
mymsga1 BYTE "Enter the length for the size of array: ",0
mymsga2 BYTE "Enter the values in array: ",0
marraylen DWORD ?
tempa DWORD 0

.code

AddArray PROC, len:DWORD
mov ecx,0
mov edx,OFFSET mymsga2
call crlf
call WriteString
mov ecx,len
l1:
call ReadInt
add tempa,eax
loop l1
mov eax,tempa 
call crlf
call WriteInt
ret
AddArray ENDP

9) ;to print the table:
.data

mymsgmt1 BYTE "Enter the number of which you want to see the table: ",0
show1 BYTE " X ",0
show2 BYTE "= ",0
numm DWORD ?
mulval DWORD ?

.code

MULTABLE PROC, mnum:DWORD
mov eax,0
mov ebx,0
mov ecx,0
mov eax,1
mov mulval,eax
mov ecx,10
call crlf
l1:
   mov edx,OFFSET show1
   mov eax,mnum
   call WriteDec
   call WriteString
   mov eax,mulval
   call WriteDec
   mov edx,OFFSET show2
   call WriteString
   mov ebx,eax
   mov eax,mnum
   mul ebx
   call WriteDec
   add ebx,1
   mov mulval,ebx
   call crlf
 loop l1
ret
MULTABLE ENDP

10) ;to add 2 3*3 matrices:
.data

 matrix1a dword 3 dup(0)
 matrix1b dword 3 dup(0)
 matrix1c dword 3 dup(0)

 matrix2a dword 3 dup(0)
 matrix2b dword 3 dup(0)
 matrix2c dword 3 dup(0)


 result1 dword 3 dup(0)
 result2 dword 3 dup(0)
 result3 dword 3 dup(0)
   
string byte "Enter the value in matrix = ", 0
space byte "  ", 0

.code

matrix3by3addition proc

	mov edx, offset string
	call writestring

	mov ebx, 1
	mov esi, 0

	l1:
		cmp ebx, 9
		ja toexit
		call readint

		cmp ebx, 3
		jle le3
		cmp ebx, 6
		jle le6
		; else part above then 6 
		mov matrix1c[esi], eax
		cmp eax, matrix1c[esi]
		je tofinish

		le3:
			mov matrix1a[esi], eax
			cmp matrix1a[esi], eax
			je tofinish
		le6:
			mov matrix1b[esi], eax
		;	cmp matrix1b[esi], eax
		;	je tofinish
		
		tofinish:

		add esi, 4
		inc ebx
		
		cmp esi, 12
		jne move
		mov esi, 0
		move:

	jmp l1
	toexit:


	mov edx, offset string
	call writestring

	mov ebx, 1
	mov esi, 0

	l01:
		cmp ebx, 9
		ja toexit0
		call readint

		cmp ebx, 3
		jle le03
		cmp ebx, 6
		jle le06
		; else part above then 6 
		mov matrix2c[esi], eax
		cmp eax, matrix2c[esi]
		je tofinish0

		le03:
			mov matrix2a[esi], eax
			cmp matrix2a[esi], eax
			je tofinish0
		le06:
			mov matrix2b[esi], eax
		
		tofinish0:

		add esi, 4
		inc ebx
		
		cmp esi, 12
		jne move0
		mov esi, 0
		move0:

	jmp l01
	toexit0:





	mov esi, 0
	mov ecx, 3

	l11:
		mov eax, matrix1a[esi]
		add eax, matrix2a[esi]
		mov result1[esi], eax
		
		mov eax, 0

		mov eax, matrix1b[esi]
		add eax, matrix2b[esi]
		mov result2[esi], eax
		
		mov eax, 0

		mov eax, matrix1c[esi]
		add eax, matrix2c[esi]
		mov result3[esi], eax

		add esi, 4
	loop l11


	call crlf

	mov ecx, 3
	mov esi, 0
	l111:
		
		mov eax, result1[esi]
		call writeint
		mov edx, offset space
		call writestring
		
		add esi, 4
	loop l111
	call crlf

	mov ecx, 3
	mov esi, 0
	l112:
	
		mov eax, result2[esi]
		call writeint
		mov edx, offset space
		call writestring
		add esi, 4
	loop l112

	call crlf

	mov ecx, 3
	mov esi, 0
	l113:

		mov eax, result3[esi]
		call writeint
		mov edx, offset space
		call writestring
		add esi, 4
	loop l113

	call crlf
ret
matrix3by3addition endp

11) ;for quicksort
.data

dat dword 100 dup(?)
cnt dword ?
l dword ?
r dword ?
	
strInput byte "Enter the size of array: ", 0
strInputs byte "Enter the values = ", 0
strSortedArray byte "Sorted array = ", 0
comma byte ", ", 0
sizeN dword 0

.code

quicksort proc
		mov eax,l
		cmp eax,r
	
		jg over
		xor esi,esi;
		xor ebx,ebx;
		mov esi,l;i
		mov ebx,r;j
		mov eax,dat[esi*4]
	
		sort_again:
		cmp ebx,esi;				while (i!=j)
		je over_loop;
			loop_j_again:
				cmp esi,ebx; 			while(i<j)
				jge over_loop
				cmp eax,dat[ebx*4]; 	while (a[j]>=a[l])
				jg loop_i_again
				add ebx ,-1			;		j--
				jmp loop_j_again;	
			loop_i_again:
				cmp esi,ebx; 			while (i<j)
				jge over_loop
				cmp eax,dat[esi*4]; 	while (a[l]>=a[i])
				jl compare;
				add esi,1;					i++
				jmp loop_i_again;
			compare:
				cmp esi,ebx;			if (i>=j)
				jge over_loop;				break
				;	swap(i,j)
				;call swap
				mov edx,dat[esi*4];
				xchg edx,dat[ebx*4];
				xchg edx,dat[esi*4];
		jmp sort_again
		over_loop:
			mov ebx,l;
			;call swap;				swap(i,l)
			mov edx,dat[esi*4];
			xchg edx,dat[ebx*4];
			xchg edx,dat[esi*4];
		
			push esi; push i
			push r  ;push r
			mov r,esi
			add r ,-1
			invoke quicksort;			quicksort(l,i-1);
			pop r
			pop ebx
			mov l,ebx;
			inc l
			invoke quicksort;			quicksort(i+1,r);
		over:
			ret
	quicksort endp

12) ;for n power of any number:

.data

str1 byte "Enter the base = ",0
str2 byte "Enter the power = ",0
base dword 0
power dword 0

.code

nPower proc


	;// input base 
	mov edx, offset str1
	call writestring
	call readdec
	mov base, eax


	;// input power 
	mov edx, offset str2
	call writestring
	call readdec
	mov power, eax

	mov ecx, power
	mov eax, 0
	mov eax, base

	l1:
		cmp ecx, 1
		je toExit

		mov ebx, base 
		mul ebx

		dec ecx
	jmp l1


	toExit:


	call crlf
	call writeint

ret 
nPower endp

13) ;for factorial:
.data

strsf1 byte "Enter the number = ",0
strsf2 byte "! is ",0
strsf3 byte "Factorial of ",0
fno dword 0

.code

factorialNumber proc


	;// input factorialNumber
	mov edx, offset strsf1
	call writestring
	call readdec
	mov fno, eax


	mov eax, fno
	dec fno
	mov ecx, fno

	l1:
		mul ecx
	loop l1


	toExit:


	mov edx, offset strsf3
	call writestring

	mov ecx, eax
	inc fno
	mov eax, fno

	call crlf 
	call writedec
	mov edx, offset strsf2
	call writestring

	mov eax, ecx

	call writeint

ret 
factorialNumber endp

14) ;for multiplying elements of array:

.display_array PROTO ,arr:DWORD,length1:DWORD,type1:DWORD
Input_array ProTO ,arrr:DWORD,length1:DWORD,type1:DWORD
array_product proto ,arr:DWORD,length1:DWORD,type1:DWORD

.data
array dword 100 dup(?)
n dword 0

.code

main proc
mwrite <"ENTER THE LENGTH FOR THE ARRAY: ">
call readdec
mov n,eax
INVOKE input_array ,ADDR array,n,Type array
call CRLF
INVOKE display_array ,ADDR array,n,Type array

INVOKE array_product ,ADDR array,n,Type array
mwrite<"Poduct of whole array is: ">
call writeint

exit 
main ENDP

;returns power in eax register
array_product proc ,arr:DWORD,length1:DWORD,type1:DWORD

	mov ecx, length1
	mov esi,arr
	mov eax, 1

	l1:
		imul eax,[esi]
		add esi,type1
	loop l1
ret 
array_product endp
End main


15) ;for standard deviation:
.data

strsod1 byte "Enter the size of array = ",0
strsod2 byte "Total sum of array is ",0
arrsod dword 100 dup(?)
sumsod dword 0
dotsod byte ".",0

.code

standardDeviation proc, val :dword
	
	mov ecx, val
	
	input:
		call readint
		mov arrsod[ecx*type  arrsod], eax
	loop input

	mov ecx, val

	l1:
		mov eax, arrsod[ecx*type arrsod]
		add sumsod, eax

	loop l1



	mov edx,0		; clear dividend, high
	mov eax,sumsod		; dividend, low
	mov ecx,val		; divisor
	div ecx

	mov ebx, edx	

	mov edx , offset strsod2
	call writestring 
	call writeint
	mov edx , offset dotsod
	call writestring
	mov eax, ebx
	call writedec
ret 
standardDeviation endp

subFunction proc
	
	mov edx , offset sstr1
	call writestring
	
	call readint
	mov a, eax

	call readint
	mov b, eax

	mov eax, a

	sub eax, b
	mov result, eax

	mov eax, a
	call writedec

	mov edx , offset substr2
	call writestring

	mov eax, b
	call writedec
	
	mov edx , offset sstr2
	call writestring

	mov eax, result

	call writeint
	
ret 
subFunction endp

divFunction proc
	
	mov edx , offset strd1
	call writestring
	
	call readint
	mov a, eax

	call readint
	mov b, eax

	mov eax, a

	mov edx,0			; clear dividend, high
	mov eax,a			; dividend, low
	mov ecx,b			; divisor
	div ecx



	mov result, eax
	mov rem, edx

	mov eax, a
	call writedec

	mov edx , offset substrd2
	call writestring

	mov eax, b
	call writedec
	
	mov edx , offset strd2
	call writestring

	mov eax, result

	call writedec
	
	mov edx , offset dot
	call writestring

	mov eax, rem
	call writedec


ret 
divFunction endp

16) ;for subtraction:
.data

sstr1 byte "Enter two value (2nd value will be subtract from 1st) = ",0
sstr2 byte " is ",0
substr2 byte " - ",0
a dword 0
b dword 0
result dword 0

.code

17) ;for division:
.data

strd1 byte "Enter two value ( a/b ) = ",0
strd2 byte " is ",0
substrd2 byte " / ",0
rem dword 0
dot byte " ",0

.code

18) ;for minarray:
minOfArray proto ,arr:DWORD,length1:DWORD,type1:DWORD
.data
array dword 100 dup(?)
n dword 0

.code

main proc
mwrite <"ENTER THE LENGTH FOR THE ARRAY: ">
call readdec
mov n,eax
INVOKE input_array ,ADDR array,n,Type array
call CRLF
INVOKE display_array ,ADDR array,n,Type array

INVOKE minOfArray ,ADDR array,n,Type array
mwrite<"Minimum value is: ">
call writeint

exit 
main ENDP


minOfArray proc ,arr:DWORD,length1:DWORD,type1:DWORD
	
	mov esi,arr
	mov ecx, length1
	mov eax,[esi]
	l1:
		cmp eax,[esi]
		jle less
		mov eax, [esi]
		less:
		add esi,type1
	loop l1
ret 
minOfArray endp


19) ;for leapYear:

leap PROTO , yyear1:dword  
.data
year1 dword ?
.code
main PROC
mwrite<"ENTER Year TO BE Checked: ">
call readdec
mov year1,eax
INVOKE leap , year1  
exit
main ENDP
leap proc , yyear1:dword  
mov eax,yyear1
mov ebx,4
mov edx,0
idiv ebx
mov eax,edx
cmp eax,0
je l2
mwrite<"Is not a leap year ">
jmp l3
l2:
call crlf
mwrite<"Is A Leap Year ">
l3:
ret
leap endp
END main



20) ;for sum n average:
.data

intropa			BYTE	" negative numbers ", 0		
getNamepa			BYTE	" your name?", 0		
userIntropa		BYTE	"Thank you and welcome ", 0						
descriptionpa		BYTE	"Enter as many numbers as you would like between -100 and -1 (inclusive)", 0	
descript2pa		BYTE	"When you are done enter a non-negative integer", 0		
userNumspa		SDWORD	?		
temppa			SDWORD	?		
accumpa			SDWORD	1		
userNamepa		BYTE	33		DUP(0)	
newNumpa			BYTE	"Enter Number ", 0 	
notValidpa		BYTE	"I'm sorry that number is less than -100, please enter a valid number", 0
outropa			BYTE	"Thank you for your input, below are your statistics", 0 	
spacepa			BYTE	". ", 0 	
numUsedpa			BYTE	"You entered ", 0 	
numUsed1pa		BYTE	" valid numbers", 0		
totalpa			BYTE	"Sum of values is: ", 0 	
avgpa				BYTE	"The rounded average is: ", 0	
ExtraCpa			BYTE	"Number Lines During User Input", 0 	
exitMsgpa			BYTE	"Thanks for you assistance ", 0	

.code	
Q21 GCD:
gcd1 PROTO , ya:dword,ab:dword  

.data
a dword ?
b dword ?
.code
main PROC
mwrite<"ENTER First No.: ">
call readdec
mov a,eax
mwrite<"ENTER Second No.: ">
call readdec
mov b,eax

INVOKE gcd1 , a,b
exit
main ENDP

gcd1 proc , ya:dword,yb:dword  
mov ecx,1
l1:
mov eax,ya
mov ebx,yb
cmp ebx,eax
je l2
mov ecx,1
cmp eax,ebx
jng l3
mov eax,ya
sub eax,yb
mov eax,ya
jmp l2
l3:
mov eax,yb
sub eax,ya
mov yb,eax
l2:
loop l1
mov eax,yb
mwrite<"GCD Will be: ">
call writedec
ret
gcd1 endp
END main



