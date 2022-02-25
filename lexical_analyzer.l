int installID (int type, char* temp_yytext){
	int flag=0;
	int row_num;
	int var_scope;
	switch (type) {
		case 1:
			printf("<%s,%s,%d>","STRING CONSTANT",temp_yytext,line_number);
			printf("\n");					 
			break;
		case 2:
			printf("<%s,%s,%d>","KEYWORD",temp_yytext,line_number);
			printf("\n");						 
			break;
		case 3:
				for(int i=0;i<100;i++)
				{
					if(!strcmp(table[i].value,temp_yytext))
					{
						flag=1;
						row_num=i;
						var_scope=table[i].scope_level;
					}
				}
				if(flag==0)
				{
					strcpy (table[sym_table_length].name, "IDENTIFIER");		
					strcpy (table[sym_table_length].value, temp_yytext);
					table[sym_table_length].line_number[0] = line_number;
					table[sym_table_length].count=1;
					table[sym_table_length].scope_level=scope_level;
					strcpy(table[sym_table_length].dtype,curr_dtype);
					table[sym_table_length].var_value=INIT;
					sym_table_length++;
					printf("<%s,%s,%d>","IDENTIFIER",temp_yytext,line_number);
					printf("\n");
				}
				else
				{
					if(scope_level==var_scope)
						table[row_num].line_number[++table[row_num].count]=line_number;
					else if(declaration==1)
					{
						//printf("declaration happening at line number %d\n",line_number);
						strcpy (table[sym_table_length].name, "IDENTIFIER");		
						strcpy (table[sym_table_length].value, temp_yytext);
						table[sym_table_length].line_number[0] = line_number;
						table[sym_table_length].count=1;
						table[sym_table_length].scope_level=scope_level;
						strcpy(table[sym_table_length].dtype,curr_dtype);
						table[sym_table_length].var_value=INIT;
						sym_table_length++;
						printf("<%s,%s,%d>","IDENTIFIER",temp_yytext,line_number);
						printf("\n");
					}
					else
						table[row_num].line_number[++table[row_num].count]=line_number;
				}
			
			break;
		case 4:
			printf("<%s,%s,%d>","UNOP",temp_yytext,line_number);
			printf("\n");						 
			break;	
		case 5:
			printf("<%s,%s,%d>","ARITHOP",temp_yytext,line_number);
			printf("\n");						 
			break;
		case 6:

			printf("<%s,%s,%d>","RELOP",temp_yytext,line_number);
			printf("\n");						 
			break;
		case 7:
			break;
			printf("<%s,%s,%d>","LOGOP",temp_yytext,line_number);
			printf("\n");						 
			break;
		case 8:

			printf("<%s,%s,%d>","DIGIT",temp_yytext,line_number);
			printf("\n");						 
			break;
		case 9:

			printf("<%s,%s,%d>","ASOP",temp_yytext,line_number);
			printf("\n");						 
			break;
		case 10:

			printf("<%s,%s,%d>","OPBRACK",temp_yytext,line_number);
			printf("\n");						 
			break;
		case 11:

			printf("<%s,%s,%d>","CLOSEBRACK",temp_yytext,line_number);
			printf("\n");						 
			break;
	}
	
}
