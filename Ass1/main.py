keywords = ['abstract', 'assert', 'boolean', 'break', 'byte', 'case', 'catch',
            'char', 'class', 'continue', 'default', 'do', 'double', 'else', 'enum',
            'extends', 'final', 'finally', float, 'for', 'if', 'implements', 'import',
            'instanceof', 'int', 'interface', 'long', 'native', 'new', 'null', 'package',
            'private', 'protected', 'public', 'return', 'short', 'static', 'super', 'switch',
            'void', 'while']
#---------------------------------------------------------------------------------------------

char = "abcdefghijklmnopqrtsuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
num = "0123456789"
delims = [';', '{','}','(',')',']','[', '"', ',', ':']
operator = ['+','-','/','*','<', '>', '^','=', '++', '%', '--', '&', '|', '==', '!=', '&&', '||', '.']

#---------------------------------------------------------------------------------------------

s = ""
with open('CD_1.txt', 'r') as f:        # Reading file
    for line in f:
        for word in line.split(' '):
            s += word
s = list(s)

#---------------------------------------------------------------------------------------------

id, kw, de, op, fs = 0, 0, 0, 0, 0   #Initializing count of all attributes as 0

#---------------------------------------------------------------------------------------------

ch = ""
symtab = []
c = 1  # Default line number starting from 1
print("Line-no\t\tToken\t\tLexemes\t\tToken_Value\n")
for i in range(len(s)-1):
    ch += s[i]
    if ((ch == '\n' and s[i+1] in char) or (ch == '\n' and s[i+1] == '{') or (ch == '\n' and s[i+1] == '}') or
          (ch == '\n' and s[i-1] == ';') or (ch == '\n' and s[i+1] == ')')):
              c += 1
              ch = ""
    elif ch == 'main':
        id += 1 
        print(c,"\t\tIdentifier\t", ch, "\t\t(ID,", id,")")
        if ch not in symtab:
            symtab.append(ch)
        ch = ""
    elif ch == 'println' or ch == 'System' or ch == 'out' or ch == "String" or ch == "args":
        id += 1 
        print(c,"\t\tIdentifier\t", ch, "\t\t(ID,", id,")")
        if ch not in symtab:
            symtab.append(ch)
        ch = ""
    elif ch == 'java' or ch == 'io' or ch == 'util':
        id += 1 
        print(c,"\t\tIdentifier\t", ch, "\t\t(ID,", id,")")
        if ch not in symtab:
            symtab.append(ch)
        ch = ""
    elif ch in keywords:
        kw += 1
        print(c,"\t\tKeyword\t\t", ch, "\t\t(KW,", kw,")")
        ch = ""
    elif ch in delims:
        de += 1
        print(c,"\t\tDelimiter\t", ch, "\t\t(DL,", de,")")
        ch = ""
    elif ch in num:
        print(c,"\t\tConstant\t", ch, "\t\t(C,", ch,")")
        ch = ""
    elif ch in char and s[i+1] in delims:
        id += 1 
        print(c,"\t\tIdentifier\t", ch, "\t\t(ID,", id,")")
        if ch not in symtab:
            symtab.append(ch)
        ch = ""
    elif ch in operator:
        if s[i+1] == '+':
            ch += s[i+1]
            op += 1 
            print(c,"\t\tOperator\t", ch, "\t\t(OP,", op,")")
            ch = ""
        elif s[i+1] == '-':
            ch += s[i+1]
            op += 1 
            print(c,"\t\tOperator\t", ch, "\t\t(OP,", op,")")
            ch = ""
        elif ch == '*' and s[i-1] == '.':
            op += 1 
            print(c,"\t\tOperator\t", ch, "\t\t(OP,", op,")")
            ch = ""
        elif s[i+1] in delims:
            ch = ""
        else:
            op += 1 
            print(c,"\t\tOperator\t", ch, "\t\t(OP,", op,")")
            ch = ""
    elif ch in char and s[i-1] == 's':
        ch = ""
        while s[i] != '{':              # To get class name before {
            ch += s[i]
            i += 1
        id += 1
        print(c,"\t\tIdentifier\t", ch, "\t\t(ID,", id,")")
        if ch not in symtab:
            symtab.append(ch)
    elif ch in char and s[i+1] in operator:
        id += 1
        print(c,"\t\tIdentifier\t", ch, "\t\t(ID,", id,")")
        if ch not in symtab:
            symtab.append(ch)
        ch = ""
    elif s[i] == '{' and s[i+1] == '\n':
        de += 1
        print(c,"\t\tDelimiter\t", s[i], "\t\t(DL,", de,")")
        ch = ""
    elif s[i-1] in char and s[i+1] in num:
        print("Error: ", s[i], " doesn't exists")
        ch = ""

print("\n\nSymbol Table\n")
for i in range(len(symtab)):
    print(i+1, symtab[i])
