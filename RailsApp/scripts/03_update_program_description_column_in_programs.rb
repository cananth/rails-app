require 'pg'
class Update
	def initialize conn
		@conn = conn
	end
	def update_operation
		description = [
		"
<b>Reverse words</b>
		
<b>Challenge Description:</b>
						
			Write a program which reverses the words in an input sentence. 
		
<b>Input Sample</b>
						
			The first argument is a file that contains multiple sentences, one per line. Empty lines are also possible. 
			For example: 
						
			Hello World
			Hello CodeEval
		
<b>Output Sample:</b>
						
			Print to stdout each sentence with the reversed words in it, one per line. Empty lines in the input should be ignored. Ensure that there are 
			no trailing empty spaces in each line you print. 
			For example: 
						
			World Hello
			CodeEval Hello
",
						
"
<b>Sum of Digits</b>
	
<b>Challenge Description:</b>	
						
			Given a positive integer, find the sum of its constituent digits. 
		
<b>Input sample:</b>
						
			The first argument will be a path to a filename containing positive integers, one per line. E.g. 
			23
			496
		
<b>Output sample:</b>
						
			Print to stdout, the sum of the numbers that make up the integer, one per line. E.g. 
			5
			19
",
"
<b>Split The Number</b>
		
<b>Challenge Description:</b>

			You are given a number N and a pattern. The pattern consists of lowercase latin letters and one operation + or -. 
			The challenge is to split the number and evaluate it according to this pattern e.g. 
			1232 ab+cd -> a:1, b:2, c:3, d:2 -> 12+32 -> 44 	

<b>Input sample:</b>

			Your program should accept as its first argument a path to a filename. Each line of the file is a test case, containing the number 
			and the pattern separated by a single whitespace. E.g. 
			3413289830 a-bcdefghij
			776 a+bc
			12345 a+bcde
			1232 ab+cd
			90602 a+bcde
		
<b>Output sample:</b>
						
			For each test case print out the result of pattern evaluation. E.g. 
			-413289827
			83
			2346
			44
			611

<b>Constraints:</b> 
						
			N is in range [100, 1000000000] 
",
"
<b>Hidden Digits</b>

<b>Challenge Description:</b>

			In this challenge youre given a random string containing hidden and visible digits. The digits are hidden behind lower case latin 
			letters as follows: 0 is behind 'a', 1 is behind ' b ' etc., 9 is behind 'j'. Any other symbol in the string means nothing and 
			has to be ignored. So the challenge is to find all visible and hidden digits in the string and print them out in order of 
			their appearance. 
		
<b>Input sample:</b>
						
			Your program should accept as its first argument a path to a filename. Each line in this file contains a string. 
			You may assume that there will be no white spaces inside the string. E.g. 
			abcdefghik
			Xa,}A#5N}{xOBwYBHIlH,#W
			(ABW>yy^M{X-K}q,
			6240488
		
<b>Output sample:</b>

			For each test case print out all visible and hidden digits in order of their appearance. 
			Print out NONE in case there is no digits in the string. E.g. 
			012345678
			05
			NONE
			6240488
",
"	
<b>Longest Word</b>

<b>Challenge Description:</b>
						
			In this challenge you need to find the longest word in a sentence. 
			If the sentence has more than one word of the same length you should pick the first one. 
		
<b>Input sample:</b>
						
			Your program should accept as its first argument a path to a filename. Input example is the following 
			Each line has one or more words. Each word is separated by space char. 
						
			some line with text
			another line
		
<b>Output sample:</b>

			Print the longest word in the following way. 
						
			some
			another
",
"
<b>Fizz Buzz</b>
		  
<b>Challenge Description:</b>
 
			Players generally sit in a circle. The first player says the number 1, and each player says next number in turn. However,
			any number divisible by X (for example, three) is replaced by the word fizz, and any divisible by Y (for example, five) by the 
			word buzz. Numbers divisible by both become fizz buzz. A player who hesitates, or makes a mistake is eliminated from the game. 
			Write a program that prints out the final series of numbers where those divisible by X, Y and both are replaced by F for fizz, B 
			for buzz and FB for fizz buzz. 
		  
<b>Input sample:</b>
						
			Your program should accept a file as its first argument. The file contains multiple separated lines; each line contains 3 numbers 
			that are space delimited. The first number is the first divider (X), the second number is the second divider (Y), and the third 
			number is how far you should count (N). You may assume that the input file is formatted correctly and the numbers are valid 
			positive integers. 
			For example: 
			3 5 10
			2 7 15
			
<b>Output sample:</b>
						
			Print out the series 1 through N replacing numbers divisible by X with F, numbers divisible by Y with B and numbers 
			divisible by both with FB. 
			Since the input file contains multiple sets of values, your output should print out one line per set.
			Ensure that there are no trailing empty spaces in each line you print. 
						
			1 2 F 4 B F 7 8 F B
			1 F 3 F 5 F B F 9 F 11 F 13 FB 15

<b>Constraints:</b>
						
			The number of test cases = 20 
			X is in range [1, 20] 
			Y is in range [1, 20] 
			N is in range [21, 100] 
",
						
"
<b>Rightmost Char</b>
		 
<b>Challenge Description:</b>
						
			You are given a string S and a character t. Print out the position of the rightmost occurrence of t (case matters) in S or -1 
			if there is none. The position to be printed out is zero based. 
		
<b>Input sample:</b>
						
			The first argument will ba a path to a filename, containing a string and a character, comma delimited, one per line. 
			Ignore all empty lines in the input file. E.g. 
			Hello World,r
			Hello CodeEval,E
		
<b>Output sample:</b>
						
			Print out the zero based position of the character t in string S, one per line. 
			Do NOT print out empty lines between your output. 

			E.g. 
			8
			10
",						
"
<b>Stepwise word</b>
		
<b>Challenge Description:</b>
						
			Print the longest word in a stepwise manner. 
		
<b>Input sample:</b>
						
			The first argument is a path to a file. Each line contains a test case with a list of words that have different or the same length. 
			For example: 
			cat dog hello
			stop football play
			music is my life
		
<b>Output sample:</b>
						
			Find the longest word in each line and print it in one line in a stepwise manner. Separate each new step with a space. If there are 
			several words of the same length and they are the longest, then print the first word from the list. 
			
			h *e **l ***l ****o
			f *o **o ***t ****b *****a ******l *******l
			m *u **s ***i ****c
		
<b>Constraints:</b>

			The word length is from 1 to 10 characters. 
			The number of words in a line is from 5 to 15. 
			If there are several words of the same length and they are the longest, then print the first word from the list. 
			The number of test cases is 40. 
",					
"
<b>Roller Coaster</b>
		
<b>Challenge Description:</b> 
						
			You are given a piece of text. Your job is to write a program that sets the case of text characters according to the following rules: 
			The first letter of the line should be in uppercase. 
			The next letter should be in lowercase. 
			The next letter should be in uppercase, and so on. 
			Any characters, except for the letters, are ignored during determination of letter case. 
		
<b>Input sample:</b>
						
			The first argument will be a path to a filename containing sentences, one per line. You can assume that all characters are from the 
			English language. 
			
			For example: 
			To be, or not to be: that is the question.
			Whether tis nobler in the mind to suffer.
			The slings and arrows of outrageous fortune.
			Or to take arms against a sea of troubles.
			And by opposing end them, to die: to sleep.
	    
<b>Output sample:</b>

			Print to stdout the RoLlErCoAsTeR case version of the string.
			For example: 
			To Be, Or NoT tO bE: tHaT iS tHe QuEsTiOn.
			WhEtHeR tIs NoBlEr In ThE mInD tO sUfFeR.
			ThE sLiNgS aNd ArRoWs Of OuTrAgEoUs FoRtUnE.
			Or To TaKe ArMs AgAiNsT a SeA oF tRoUbLeS.
			AnD bY oPpOsInG eNd ThEm, To DiE: tO sLeEp.
		
<b>Constraints:</b>

			The length of each piece of text does not exceed 1000 characters. 
",
"
<b>STRING SEARCHING</b>
 
<b>CHALLENGE DESCRIPTION:</b>

			You are given two strings. 
			Determine if the second string is a substring of the first (Do NOT use any substr type library function). 
			The second string may contain an asterisk(*) which should be treated as a regular expression
			i.e. matches zero or more characters. 
			The asterisk can be escaped by a \ char in which case it should be interpreted as a regular '*' character. 
			To summarize: the strings can contain alphabets, numbers, * and \ characters.

<b>INPUT SAMPLE:</b>

			Your program should accept as its first argument a path to a filename. 
			The input file contains two comma delimited strings per line. 
			E.g.
			Hello,ell
			This is good, is
			CodeEval,C*Eval
			Old,Young

<b>OUTPUT SAMPLE:</b>

			If the second string is indeed a substring of the first, print out a 'true'(lowercase), 
			else print out a 'false'(lowercase), one per line.
			E.g.

			true
			true
			true
			false
",
" 
<b>PANGRAMS</b>

<b>CHALLENGE DESCRIPTION:</b>

			The sentence 'A quick brown fox jumps over the lazy dog'
			contains every single letter in the alphabet.
			Such sentences are called pangrams. You are to write a program,
			which takes a sentence, and returns all the letters it is missing 
			(which prevent it from being a pangram). You should ignore the case of the letters in sentence,
			and your return should be all lower case letters, in alphabetical order. You should also ignore all
			non US-ASCII characters.In case the input sentence is already a pangram, print out the string 
			NULL
	
<b>INPUT SAMPLE:</b>

			Your program should accept as its first argument a path to a filename.
			This file will contain several text strings, one per line. E.g.

			A quick brown fox jumps over the lazy 
			dog
			A slow yellow fox crawls under the proactive dog
	
<b>OUTPUT SAMPLE:</b>

			Print out all the letters each string is 
			missing in lowercase, alphabetical order .
			E.g.

			NULL
			bjkmqz
",
"  
<b>SWAP CASE</b> 

<b>CHALLENGE DESCRIPTION:</b>

			Write a program which swaps >letters' case in a sentence.
			All non-letter characters should remain the same.

<b>INPUT SAMPLE:</b>
	
			Your program should accept as its first argument a path to a filename. 
			Input example is the following

			Hello world!	
			JavaScript language 1.8
			A letter

<b>OUTPUT SAMPLE:</b>

			Print results in the following way.
	
			hELLO WORLD!
			jAVAsCRIPT LANGUAGE 1.8
			a LETTER
",						
" 	
<b>DISTINCT SUBSEQUENCES</b>

<b>CHALLENGE DESCRIPTION:</b>

			A subsequence of a given sequence S consists of S with zero or more elements deleted. 
			Formally, a sequence Z = z1z2..zk is a subsequence of X = x1x2...xm, if there exists a 
			strictly increasing sequence of indicies of X such that for all j=1,2,...k 
			we have Xij = Zj. E.g. Z=bcdb is a subsequence of X=abcbdab with corresponding index sequence <2,3,5,7>

<b>INPUT SAMPLE:</b>

			Your program should accept as its first argument a path to a filename.
			Each line in this file contains two comma separated strings. The first is the sequence X and the second is the subsequence Z. 
			E.g.

			1)  babgbag,bag
			2)  rabbbit,rabbit

<b>OUTPUT SAMPLE:</b>

			Print out the number of distinct occurrences of Z in X as a subsequence 
			E.g.

			1) 5
			2) 3
",
"
<b>SHORTEST REPETITION</b>

<b>CHALLENGE DESCRIPTION:</b>

			Write a program to determine the shortest repetition in a string. 

			A string is said to have period p if it can be formed by concatenating one or more repetitions of another string of length p.
			For example, the string xyzxyzxyzxyz has period 3, since it is formed by 4 repetitions of the string xyz. 
			It also has periods 6 (two repetitions of xyzxyz) and 12 (one repetition of xyzxyzxyzxyz).
		
<b>INPUT SAMPLE:</b>
			
			Your program should accept as its first argument a path to a filename. Each line will contain a string of up to 80 non-blank 
			characters. 
			
			E.g.
			abcabcabcabc
			bcbcbcbcbcbcbcbcbcbcbcbcbcbc
			dddddddddddddddddddd
			adcdefg

<b>OUTPUT SAMPLE:</b>

			Print out the smallest period of the input string. 
			E.g.

			3
			2
			1
			7
",	
"	
<b>READ MORE</b>

<b>CHALLENGE DESCRIPTION:</b>

			You are given a text. Write a program which outputs its lines according to the following rules:

			If line length is = 55 characters, print it without any changes.
			If the line length is > 55 characters, change it as follows:
			Trim the line to 40 characters.
			If there are spaces   in the resulting string, trim it once again to the last space (the space should be trimmed too).
			Add a string ... <Read More>to the end of the resulting string and print it.

<b>INPUT SAMPLE:<b>
						
			The first argument is a file. The file contains a text.
			For example:
			1  Tom exhibited.
			2  Amy Lawrence was proud and glad, and she tried to make Tom see it in her face - but he wouldn't look.
			3  Tom was tugging at a button-hole and looking sheepish.
			4  Two thousand verses is a great many - very, very great many.
			5  Toms mouth watered for the apple, but he stuck to his work.

<b<OUTPUT SAMPLE:</b>

			Print to stdout the text lines with their length limited according to the rules described above.
			For example:
			1  Tom exhibited.
			2  Amy Lawrence was proud and glad, and... <Read More>
			3  Tom was tugging at a button-hole and looking sheepish.
			4  Two thousand verses is a great many -... <Read More>
			5  Toms mouth watered for the apple, but... <Read More>

<b>CONSTRAINTS:</b>

			The maximum length of a line in the input file is 300 characters.
			There cannot be more than one consequent space character in the input data.
",						
"
<b>TRICK OR TREAT</b>
		 
<b>CHALLENGE DESCRIPTION:</b>

			Everyone knows what Halloween is and how children love it. Children in costumes travel from house to house
			asking for treats with a phrase Trick or treat. After that, they divide the treats equally among all. This year,
			they collected tons of candies, and need your help to share everything equally.
			You know that children receive different number of candies depending on their costume: vampire gets 3
			candies from one house, zombie 4 candies, and witch  5 candies.
			That is, three children in three different costumes get 3+4+5=12 candies from one house.

<b>INPUT SAMPLE:</b>

			The first argument is a path to a file. Each line includes a test case with number of vampires, zombies, witches,
			and houses that they visited.
			For example:
			Vampires: 1, Zombies: 1, Witches: 1, Houses: 1
			Vampires: 3, Zombies: 2, Witches: 1, Houses: 10

<b>OUTPUT SAMPLE:</b>

			You need to print number of candies that each child will get. If the number is not integer, round it to the lower:
			for example, if the resulting number is 13.666, round it to 13.
			For example:
			14
			2 36

<b>CONSTRAINTS:</b>

			1. Number of vampires, zombies, witches, and houses can be from 0 to 100.
			2. If the final number of candies is not integer, round it to the lower.
			3. The number of test cases is 40.
",
"  
<b>STRING ROTATION</b>

<b>CHALLENGE DESCRIPTION:</b>

			You are given two strings. Determine if the second string is a rotation of the first string.

<b>INPUT SAMPLE:</b>

			Your program should accept as its first argument a path to a filename. 
			Each line in this file contains two comma separated strings. E.g.

			Hello,lloHe
			Basefont,tBasefon
		
<b>OUTPUT SAMPLE:</b>

			Print out True/False if the second string is a rotation of the first. 
			E.g.

			True
			True
",							
"	
<b>TEXT DOLLAR</b>

<b>CHALLENGE DESCRIPTION:</b>

			Credits: This challenge has been authored by Terence Rudkin 

			You are given a positive integer number. 
			This represents the sales made that day in your department store. The payables department however, needs this printed out in english. 
			NOTE: The correct spelling of 40 is Forty. (NOT Fourty)

<b>INPUT SAMPLE:</b>

			Your program should accept as its first argument a path to a filename.The input file contains several lines. 
			Each line is one test case. Each line contains a positive integer. 
			E.g.

			3
			10
			21
			466
			1234

<b>OUTPUT SAMPLE:</b>

			For each set of input produce a single line of output which is the english textual representation of that integer. 
			The output should be unspaced and in Camelcase. Always assume plural quantities. 
			You can also assume that the numbers are < 1000000000 (1 billion). 
			In case of ambiguities e.g. 2200 could be TwoThousandTwoHundredDollars or TwentyTwoHundredDollars, always choose the representation with the
			 larger base i.e. 
			TwoThousandTwoHundredDollars. For the examples shown above, 
			the answer would be:

			ThreeDollars
			TenDollars
			TwentyOneDollars
			FourHundredSixtySixDollars
			OneThousandTwoHundredThirtyFourDollars
",	
"
<b>TEXT TO NUMBER</b>

<b>CHALLENGE DESCRIPTION:</b>

			You have a sting which contains a number represented as English text. Your task is to translate these numbers into their integer representation. 
			The numbers can range from negative 999,999,999 to positive 999,999,999. The following is an exhaustive list of English words that your program 
			must account for:
			
			negative,
			zero, one, two, three, four, five, six, seven, eight, nine,
			ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen,
			twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety,
			hundred,
			thousand,
			million
		
<b>INPUT SAMPLE:</b>

			Your program should accept as its first argument a path to a filename. Input example is the following
			fifteen
			negative six hundred thirty eight
			zero
			two million one hundred seven

			- Negative numbers will be preceded by the word negative. 
			- The word hundred is not used when thousand could be. E.g. 1500 is written one thousand five hundred, not fifteen hundred.

<b>OUTPUT SAMPLE:</b>

			Print results in the following way.

			15
			-638
			0
			2000107
",
"
<b>COMPRESSED SEQUENCE</b>
		
<b>CHALLENGE DESCRIPTION:</b>
		
			Assume that someone dictates you a sequence of numbers, and you need to write it down. For brevity, he dictates it as follows: 
			first he dictates the number of consecutive identical numbers, and then - the number itself.
			For example:
			The sequence below
			1 1 3 3 3 2 2 2 2 14 14 14 11 11 11 2
			is dictated as follows:
			two times one, three times three, four times two, three times fourteen, three times eleven, one time two
			and you have to write down the sequence
			2 1 3 3 4 2 3 14 3 11 1 2
			Your task is to write a program that compresses a given sequence using this approach.
		 
<b>INPUT SAMPLE:</b>

			Your program should accept a path to a file as its first argument that contains T number of lines. Each line is a test case
			 represented by a sequence of integers with the length L, where each integer is N separated by a space.

			40 40 40 40 29 29 29 29 29 29 29 29 57 57 92 92 92 92 92 86 86 86 86 86 86 86 86 86 86
			73 73 73 73 41 41 41 41 41 41 41 41 41 41
			1 1 3 3 3 2 2 2 2 14 14 14 11 11 11 2
			7

<b>OUTPUT SAMPLE:</b>
						
			For each test case, print out a compressed sequence of numbers separated by a single space, one per line.
			For example:
			4 40 - 8 29 - 2 57 - 5 92 - 10 86
			4 73 - 10 41
			2 1 - 3 3 - 4 2 - 3 14 - 3 11 - 1 2
			1 7

<b>CONSTRAINTS:</b>
						
			T is in a range from 20 to 50.
			N is in a range from 0 to 99.
			L is in a range from 1 to 400.

",
"
<b>EMAIL VALIDATION</b>
		 
<b>CHALLENGE DESCRIPTION:</b>

		   You are given several strings that 
		   may/may not be valid emails. You should write a regular expression that determines if the email id is a valid email id or not. 
		   You may assume all characters are from the english language.

<b>INPUT SAMPLE:</b>
			
		   Your program should accept as its first argument a filename. This file will contain several text strings, one per line. Ignore all empty lines. E.g. 
		   foo@bar.com
		   this is not an email id
		   admin#codeeval.com
		   good123@bad.com

<b>OUTPUT SAMPLE:</b>
	
		   Print out true (all lowercase) if the string is a valid email. Else print out false (all lowercase). E.g.
		   true
		   false
		   false
		   true
",					
"
<b>JUSTIFY THE TEXT</b>

<b>CHALLENGE DESCRIPTION:</b>
		 
			Write a program that reformats the text into lines of 80 symbols by stretching the text to full line width by adding extra spaces.
			Longer series of spaces should go first. For example:
			if you need to add just one extra space, add it between the first and the second word
			if there are 4 words in a line, and you need 10 spaces to stretch the text up to 80 symbols,
			 add 4 spaces between the first and the second word, 3 spaces between the second and the third word, and 3 spaces between the third 
			 and the fourth word.
			The last line of the paragraph remains unchanged.
	
<b>INPUT SAMPLE:</b>

			The first argument is a filename. The input file contains a text.
			For example:
			Hello, World!
			The precise 50-digits value of Pi is 3.1415926535897932384626433832795028841971693993
			7510.
			But he who would be a great man ought to regard, not himself or his interests, but 
			what is just, whether the just act be his own or that of another. Next as to 
			habitations. Such is the tradition.

<b>OUTPUT SAMPLE:</b>
		
			Print to stdout the text, reformatted into lines of 80 symbols by stretching the text to the full line width by adding extra spaces.
			For example:
			Hello, World!
			The         precise         50-digits        value        of        Pi        is
			3.14159265358979323846264338327950288419716939937510.
			But  he  who would be a great man ought to regard, not himself or his interests,
			but what is just, whether the just act be his own or that of another. Next as to
			habitations. Such is the tradition.
",
"
<b>ROBOT MOVEMENTS</b>
		
<b>CHALLENGE DESCRIPTION:</b>

			A robot is located in the upper-left corner of a 4×4 grid. The robot can move either up, down, left, or right, but cannot go to the same location twice.
			 The robot is trying to reach the lower-right corner of the grid. 
			Your task is to find out the number of unique ways to reach the destination.
		 
<b>INPUT SAMPLE:</b>

			There is no input for this program.
		
<b>OUTPUT SAMPLE:</b>
			
			Print out the number of unique ways for the robot to reach its destination. The number should be printed out as an integer =0.
",
"
<b>CRACKING EGGS</b>
		
<b>CHALLENGE DESCRIPTION:</b>
		 
			You have a N story building and K eggs. They are especially strong eggs so they're able to withstand impact up to a certain number
			of floors.
			Your goal is to identify the number of drops you need make to determine number of floors it can withstand.

<b>INPUT SAMPLE:</b>
						
			The first argument will be a path to a filename containing a space separated list of 2 integers, first one is number eggs, 
			second one - number of floors. E.g.
			2 100

<b>OUTPUT SAMPLE:</b>
		 
			The output contains one integer - the worst worst case upper bound on the number of drops you must make to determine this floor.
			14
",
"
<b>ADVANCED CALCULATOR</b>
		
<b>CHALLENGE DESCRIPTION:</b>
		 
			The goal of this challenge is to create an advanced calculator. 
			The following operations should be supported with their order (operator precedence): 
			Pi        Pi number
			e         Euler's number
			sqrt()    Square root
			cos()     Cosine (using radians as an argument)
			sin()     Sine (using radians as an argument)
			tan()     Tangent (using radians as an argument)
			lg()      Decimal logarithm
			ln()      Natural logarithm
			1   ()        Brackets
			2   ||        Absolute value, e.g. |-5 - 10|
			3   !         Factorial
			4   -         Unary minus
			5   ^         Exponent
			6   mod       Modulus divide, e.g. 5 mod 2 = 1 (only integers will be supplied here)
			7   *, /      Multiply, Divide (left-to-right precedence)
			8   +, -      Add, Subtract (left-to-right precedence)

<b>INPUT SAMPLE:</b>
		
			Your program should accept as its first argument a path to a filename. The input file contains several lines. Each line is one test case. Each line contains mathematical expression. E.g.
			250*14.3
			3^6 / 117
			(2.16 - 48.34)^-1
			(59 - 15 + 3*6)/21
			lg(10) + ln(e)
			15*5 mod 2

<b>OUTPUT SAMPLE:</b>

			For each set of input produce a single line of output which is the result of calculation.
			3575
			6.23077
			-0.02165
			2.95238
			2
			15

			Note: Don't use any kind of eval function.

<b>Constraints:</b> 
						
			Each number in input expression is greater than -20,000 and less than 20,000. 
			Each output number is greater than -20,000 and less than 20,000. 
			If output number is a float number it should be rounded to the 5th digit after the dot. 
			E.g 14.132646 gets 14.13265, 14.132644 gets 14.13264, 14.132645 gets 14.13265. 

			If output number has less than 5 digits after the dot you don't need to add zeros. 
			E.g. you need to print 16.34 (and not 16.34000) in case the answer is 16.34. 
			And you need to print 16 (and not 16.00000) in case the answer is 16.
",
"
<b>WORKING EXPERIENCE</b>

<b>CHALLENGE DESCRIPTION:</b>
		 
			You are building a new social platform and want to store user's work experience. You have decided to calculate the total experience of each 
			user in years based on the time periods that they provided.
			Using this approach, you need to be sure that you are taking into account the overlapping time periods in order to retrieve the actual 
			work experience in years.
			For example:
			Jan 2010-Dec 2010
			Jan 2010-Dec 2010
			Two jobs with 12 months of experience each, but actual work experience is 1 year because of the overlapping time periods.
			 The task is to calculate the actual work experience based on the list of time intervals.

<b>INPUT SAMPLE:</b>
	
			Your program should accept a path to a filename as its first argument. Each line of the file contains a list of time periods separated by 
			a semicolon and a single space.
			Each time period is represented as the begin date and the end date. Each date consists of a month as an abbreviated name and a year with 
			century as a decimal number separated by a single space. 
			The begin date and the end date are separated by a hyphen.
			For example:
			Feb 2004-Dec 2009; Sep 2004-Jul 2008
			Aug 2013-Mar 2014; Apr 2013-Aug 2013; Jun 2014-Aug 2015; Apr 2003-Nov 2004; Apr 2014-Jan 2015
			Mar 2003-Jul 2003; Nov 2003-Jan 2004; Apr 1999-Nov 1999
			Apr 1992-Dec 1993; Feb 1996-Sep 1997; Jan 2002-Jun 2002; Sep 2003-Apr 2004; Feb 2010-Nov 2011
			Feb 2004-May 2004; Jun 2004-Jul 2004

<b>OUTPUT SAMPLE:</b>
		
			Print out the actual work experience in years for each test case.
			For example:
			5
			4
			1
			6
			0

<b>CONSTRAINTS:</b>
		
			The number of lines in a file is in a range from 20 to 40.
			The dates are in a range from Jan 1990 to Dec 2020.
			The end date is greater than the begin date.
			The begin date is the first day of a given month, and the end date is the last day of a given month.
",
"
<b>PRIME NUMBERS</b>
			
<b>CHALLENGE DESCRIPTION:</b>
		
			Write a program that takes L and R as input and displays the number of prime numbers that lie 
			between L and R (L and R inclusive) and can be represented as sum of two consecutive prime numbers + 1. 
			Your program should accept a path to a file as its first argument that contains <= 40 number of lines. 
			Each line is a test case represented by a pair of integers.			
			Example:
			Case 1:

					For the input provided as follows:
					1 20
					Output of the program will be:
					2
					Explanation
					13 is a prime number which can be expressed like 5+7+1.
					19 is a prime number which can be expressed like 7+11+1.
					So output is 2.
					Note that 5 and 7 are consecutive primes. Similarly 7 and 11 are consecutive primes.
			Case 2:
					
					For the input provided as follows:
					1 10
					Output of the program will be:
					0
					Explanation
				 `	No prime numbers lie between 1 and 10 that can be represented as sum of two consecutive prime numbers + 1, 
					hence 0 is displayed.
",
"
<b>STACK OPERATION</b>
		
<b>CHALLENGE DESCRIPTION:</b>
						
			Write a program which implements a stack interface for integers. The interface should have push and pop
			functions. Your task is to push a series of integers and then pop and print every alternate integer.
		
<b>INPUT SAMPLE:</b>

			Your program should accept a file as its first argument. The file contains a series of space delimited integers,
			one per line.
			For example:
			1234
			10-234
		
<b>OUTPUT SAMPLE:</b>
		
			Print to stdout every alternate space delimited integer, one per line.
			For example:
			24-2
" ]	
										
		for index in 0..27
			@conn.prepare('statement1', "update	programs set program_description = $1 where id = $2")
			@conn.exec_prepared('statement1', ["#{description[index]}", "#{index + 1}"])
			@conn.exec("DEALLOCATE statement1");
		end
	end
end	
conn = PG.connect(:dbname => 'rails_db',:user => 'postgres', :password =>'postgres')
update_data = Update.new conn
update_data.update_operation
