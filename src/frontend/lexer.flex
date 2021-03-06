/* You do not need to change anything up here. */
package lexer;

import frontend.Token;
import static frontend.Token.Type.*;

%%

%public
%final
%class Lexer
%function nextToken
%type Token
%unicode
%line
%column

%{
	/* These two methods are for the convenience of rules to create toke objects.
	* If you do not want to use them, delete them
	* otherwise add the code in 
	*/

	private Token token(Token.Type type) {
		return new Token(type, yyline, yycolumn, yytext());
	}

	/* Use this method for rules where you need to process yytext() to get the lexeme of the token.
	 *
	 * Useful for string literals; e.g., the quotes around the literal are part of yytext(),
	 *       but they should not be part of the lexeme.
	 * Quote: "the first and last characters of yytext() should be excluded (use substring)"
	*/
	/*
	private Token token(Token.Type type, String text) {

		if(Token.Type.STRING_LITERAL == type)
		    text = text.substring(1, text.length()-1);
    return new Token(type,  ,text);
	}
	*/
%}

%%
/* put in your rules here.    */
boolean  {return new Token(BOOLEAN, yyline, yycolumn, yytext());}
break  {return new Token(BREAK, yyline, yycolumn, yytext());}
else  {return new Token(ELSE, yyline, yycolumn, yytext());}
false  {return new Token(FALSE, yyline, yycolumn, yytext());}
if  {return new Token(IF, yyline, yycolumn, yytext());}
import  {return new Token(IMPORT, yyline, yycolumn, yytext());}
int  {return new Token(INT, yyline, yycolumn, yytext());}
module  {return new Token(MODULE, yyline, yycolumn, yytext());}
public  {return new Token(PUBLIC, yyline, yycolumn, yytext());}
return  {return new Token(RETURN, yyline, yycolumn, yytext());}
true  {return new Token(TRUE, yyline, yycolumn, yytext());}
type  {return new Token(TYPE, yyline, yycolumn, yytext());}
void  {return new Token(VOID, yyline, yycolumn, yytext());}
while  {return new Token(WHILE, yyline, yycolumn, yytext());}
","  {return new Token(COMMA, yyline, yycolumn, yytext());}
"["  {return new Token(LBRACKET, yyline, yycolumn, yytext());}
"{"  {return new Token(LCURLY, yyline, yycolumn, yytext());}
"("  {return new Token(LPAREN, yyline, yycolumn, yytext());}
"]"  {return new Token(RBRACKET, yyline, yycolumn, yytext());}
"}"  {return new Token(RCURLY, yyline, yycolumn, yytext());}
")"  {return new Token(RPAREN, yyline, yycolumn, yytext());}
";"  {return new Token(SEMICOLON, yyline, yycolumn, yytext());}
"["  {return new Token(LBRACKET, yyline, yycolumn, yytext());}
"{"  {return new Token(LCURLY, yyline, yycolumn, yytext());}
"/"  {return new Token(DIV, yyline, yycolumn, yytext());}
"=="  {return new Token(EQEQ, yyline, yycolumn, yytext());}
"="  {return new Token(EQL, yyline, yycolumn, yytext());}
">="  {return new Token(GEQ, yyline, yycolumn, yytext());}
">"  {return new Token(GT, yyline, yycolumn, yytext());}
"<="  {return new Token(LEQ, yyline, yycolumn, yytext());}
"<"  {return new Token(LT, yyline, yycolumn, yytext());}
"-"  {return new Token(MINUS, yyline, yycolumn, yytext());}
"!=" {return new Token(NEQ, yyline, yycolumn, yytext());}
"+"  {return new Token(PLUS, yyline, yycolumn, yytext());}
"*"  {return new Token(TIMES, yyline, yycolumn, yytext());}

[a-zA-Z][a-zA-Z0-9"_"]*  {return new Token(ID, yyline, yycolumn, yytext());}
[0-9]+ {return new Token(INT_LITERAL, yyline, yycolumn, yytext());}

\"[^\"\n]*\" {String text = yytext(); return new Token(STRING_LITERAL, yyline, yycolumn, text.substring(1, text.length()-1));}

[ ] | \t | \f | \n | \r {}

/* You don't need to change anything below this line. */
.							{ throw new Error("unexpected character '" + yytext() + "'"); }
<<EOF>>						{ return token(EOF); }
