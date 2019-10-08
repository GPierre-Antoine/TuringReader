%{

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <iostream>
#include <stdexcept>

int yylex();
void yyerror (char const *s)
{
    throw std::runtime_error(s);
}

%}

%token EOL

%%

expression:
 | expression EOL

%%

int main(){
    try
    {
        yyparse();
    }
    catch(const std::runtime_error &e)
    {
    	std::cerr << "Bison error : " << e.what() << std::endl;
    }
    return 0;
}

