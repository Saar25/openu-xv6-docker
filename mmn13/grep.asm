
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  18:	83 ec 08             	sub    $0x8,%esp
  1b:	53                   	push   %ebx
  1c:	57                   	push   %edi
  1d:	e8 3e 00 00 00       	call   60 <matchhere>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	75 1f                	jne    48 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  29:	0f be 13             	movsbl (%ebx),%edx
  2c:	84 d2                	test   %dl,%dl
  2e:	74 0c                	je     3c <matchstar+0x3c>
  30:	83 c3 01             	add    $0x1,%ebx
  33:	83 fe 2e             	cmp    $0x2e,%esi
  36:	74 e0                	je     18 <matchstar+0x18>
  38:	39 f2                	cmp    %esi,%edx
  3a:	74 dc                	je     18 <matchstar+0x18>
  return 0;
}
  3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3f:	5b                   	pop    %ebx
  40:	5e                   	pop    %esi
  41:	5f                   	pop    %edi
  42:	5d                   	pop    %ebp
  43:	c3                   	ret    
  44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  48:	8d 65 f4             	lea    -0xc(%ebp),%esp
// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  4b:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5f                   	pop    %edi
  53:	5d                   	pop    %ebp
  54:	c3                   	ret    
  55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000060 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	57                   	push   %edi
  64:	56                   	push   %esi
  65:	53                   	push   %ebx
  66:	83 ec 0c             	sub    $0xc,%esp
  69:	8b 45 08             	mov    0x8(%ebp),%eax
  6c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
  6f:	0f b6 18             	movzbl (%eax),%ebx
  72:	84 db                	test   %bl,%bl
  74:	74 63                	je     d9 <matchhere+0x79>
    return 1;
  if(re[1] == '*')
  76:	0f be 50 01          	movsbl 0x1(%eax),%edx
  7a:	80 fa 2a             	cmp    $0x2a,%dl
  7d:	74 7b                	je     fa <matchhere+0x9a>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
  7f:	80 fb 24             	cmp    $0x24,%bl
  82:	75 08                	jne    8c <matchhere+0x2c>
  84:	84 d2                	test   %dl,%dl
  86:	0f 84 8a 00 00 00    	je     116 <matchhere+0xb6>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  8c:	0f b6 37             	movzbl (%edi),%esi
  8f:	89 f1                	mov    %esi,%ecx
  91:	84 c9                	test   %cl,%cl
  93:	74 5b                	je     f0 <matchhere+0x90>
  95:	38 cb                	cmp    %cl,%bl
  97:	74 05                	je     9e <matchhere+0x3e>
  99:	80 fb 2e             	cmp    $0x2e,%bl
  9c:	75 52                	jne    f0 <matchhere+0x90>
    return matchhere(re+1, text+1);
  9e:	83 c7 01             	add    $0x1,%edi
  a1:	83 c0 01             	add    $0x1,%eax
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  a4:	84 d2                	test   %dl,%dl
  a6:	74 31                	je     d9 <matchhere+0x79>
    return 1;
  if(re[1] == '*')
  a8:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
  ac:	80 fb 2a             	cmp    $0x2a,%bl
  af:	74 4c                	je     fd <matchhere+0x9d>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
  b1:	80 fa 24             	cmp    $0x24,%dl
  b4:	75 04                	jne    ba <matchhere+0x5a>
  b6:	84 db                	test   %bl,%bl
  b8:	74 5c                	je     116 <matchhere+0xb6>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  ba:	0f b6 37             	movzbl (%edi),%esi
  bd:	89 f1                	mov    %esi,%ecx
  bf:	84 c9                	test   %cl,%cl
  c1:	74 2d                	je     f0 <matchhere+0x90>
  c3:	80 fa 2e             	cmp    $0x2e,%dl
  c6:	74 04                	je     cc <matchhere+0x6c>
  c8:	38 d1                	cmp    %dl,%cl
  ca:	75 24                	jne    f0 <matchhere+0x90>
  cc:	0f be d3             	movsbl %bl,%edx
    return matchhere(re+1, text+1);
  cf:	83 c7 01             	add    $0x1,%edi
  d2:	83 c0 01             	add    $0x1,%eax
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  d5:	84 d2                	test   %dl,%dl
  d7:	75 cf                	jne    a8 <matchhere+0x48>
    return 1;
  d9:	b8 01 00 00 00       	mov    $0x1,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
  de:	8d 65 f4             	lea    -0xc(%ebp),%esp
  e1:	5b                   	pop    %ebx
  e2:	5e                   	pop    %esi
  e3:	5f                   	pop    %edi
  e4:	5d                   	pop    %ebp
  e5:	c3                   	ret    
  e6:	8d 76 00             	lea    0x0(%esi),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
  f3:	31 c0                	xor    %eax,%eax
}
  f5:	5b                   	pop    %ebx
  f6:	5e                   	pop    %esi
  f7:	5f                   	pop    %edi
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
  fa:	0f be d3             	movsbl %bl,%edx
    return matchstar(re[0], re+2, text);
  fd:	83 ec 04             	sub    $0x4,%esp
 100:	83 c0 02             	add    $0x2,%eax
 103:	57                   	push   %edi
 104:	50                   	push   %eax
 105:	52                   	push   %edx
 106:	e8 f5 fe ff ff       	call   0 <matchstar>
 10b:	83 c4 10             	add    $0x10,%esp
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 10e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 111:	5b                   	pop    %ebx
 112:	5e                   	pop    %esi
 113:	5f                   	pop    %edi
 114:	5d                   	pop    %ebp
 115:	c3                   	ret    
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
 116:	31 c0                	xor    %eax,%eax
 118:	80 3f 00             	cmpb   $0x0,(%edi)
 11b:	0f 94 c0             	sete   %al
 11e:	eb be                	jmp    de <matchhere+0x7e>

00000120 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	56                   	push   %esi
 124:	53                   	push   %ebx
 125:	8b 75 08             	mov    0x8(%ebp),%esi
 128:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 12b:	80 3e 5e             	cmpb   $0x5e,(%esi)
 12e:	75 11                	jne    141 <match+0x21>
 130:	eb 2c                	jmp    15e <match+0x3e>
 132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
 138:	83 c3 01             	add    $0x1,%ebx
 13b:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 13f:	74 16                	je     157 <match+0x37>
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 141:	83 ec 08             	sub    $0x8,%esp
 144:	53                   	push   %ebx
 145:	56                   	push   %esi
 146:	e8 15 ff ff ff       	call   60 <matchhere>
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	85 c0                	test   %eax,%eax
 150:	74 e6                	je     138 <match+0x18>
      return 1;
 152:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text++ != '\0');
  return 0;
}
 157:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15a:	5b                   	pop    %ebx
 15b:	5e                   	pop    %esi
 15c:	5d                   	pop    %ebp
 15d:	c3                   	ret    

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 15e:	83 c6 01             	add    $0x1,%esi
 161:	89 75 08             	mov    %esi,0x8(%ebp)
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 164:	8d 65 f8             	lea    -0x8(%ebp),%esp
 167:	5b                   	pop    %ebx
 168:	5e                   	pop    %esi
 169:	5d                   	pop    %ebp

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 16a:	e9 f1 fe ff ff       	jmp    60 <matchhere>
 16f:	90                   	nop

00000170 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
 175:	53                   	push   %ebx
 176:	83 ec 1c             	sub    $0x1c,%esp
 179:	8b 75 08             	mov    0x8(%ebp),%esi
  int n, m;
  char *p, *q;

  m = 0;
 17c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 183:	90                   	nop
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 188:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 18b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 190:	83 ec 04             	sub    $0x4,%esp
 193:	29 c8                	sub    %ecx,%eax
 195:	50                   	push   %eax
 196:	8d 81 20 20 00 00    	lea    0x2020(%ecx),%eax
 19c:	50                   	push   %eax
 19d:	ff 75 0c             	pushl  0xc(%ebp)
 1a0:	e8 4b 06 00 00       	call   7f0 <read>
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	85 c0                	test   %eax,%eax
 1aa:	0f 8e ac 00 00 00    	jle    25c <grep+0xec>
    m += n;
 1b0:	01 45 e4             	add    %eax,-0x1c(%ebp)
    buf[m] = '\0';
    p = buf;
 1b3:	bb 20 20 00 00       	mov    $0x2020,%ebx
  int n, m;
  char *p, *q;

  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
 1b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1bb:	c6 82 20 20 00 00 00 	movb   $0x0,0x2020(%edx)
 1c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 1c8:	83 ec 08             	sub    $0x8,%esp
 1cb:	6a 0a                	push   $0xa
 1cd:	53                   	push   %ebx
 1ce:	e8 cd 02 00 00       	call   4a0 <strchr>
 1d3:	83 c4 10             	add    $0x10,%esp
 1d6:	85 c0                	test   %eax,%eax
 1d8:	89 c7                	mov    %eax,%edi
 1da:	74 3c                	je     218 <grep+0xa8>
      *q = 0;
      if(match(pattern, p)){
 1dc:	83 ec 08             	sub    $0x8,%esp
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
    buf[m] = '\0';
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
 1df:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
 1e2:	53                   	push   %ebx
 1e3:	56                   	push   %esi
 1e4:	e8 37 ff ff ff       	call   120 <match>
 1e9:	83 c4 10             	add    $0x10,%esp
 1ec:	85 c0                	test   %eax,%eax
 1ee:	75 08                	jne    1f8 <grep+0x88>
 1f0:	8d 5f 01             	lea    0x1(%edi),%ebx
 1f3:	eb d3                	jmp    1c8 <grep+0x58>
 1f5:	8d 76 00             	lea    0x0(%esi),%esi
        *q = '\n';
 1f8:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
 1fb:	83 c7 01             	add    $0x1,%edi
 1fe:	83 ec 04             	sub    $0x4,%esp
 201:	89 f8                	mov    %edi,%eax
 203:	29 d8                	sub    %ebx,%eax
 205:	50                   	push   %eax
 206:	53                   	push   %ebx
 207:	89 fb                	mov    %edi,%ebx
 209:	6a 01                	push   $0x1
 20b:	e8 e8 05 00 00       	call   7f8 <write>
 210:	83 c4 10             	add    $0x10,%esp
 213:	eb b3                	jmp    1c8 <grep+0x58>
 215:	8d 76 00             	lea    0x0(%esi),%esi
      }
      p = q+1;
    }
    if(p == buf)
 218:	81 fb 20 20 00 00    	cmp    $0x2020,%ebx
 21e:	74 30                	je     250 <grep+0xe0>
      m = 0;
    if(m > 0){
 220:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 223:	85 c0                	test   %eax,%eax
 225:	0f 8e 5d ff ff ff    	jle    188 <grep+0x18>
      m -= p - buf;
 22b:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 22d:	83 ec 04             	sub    $0x4,%esp
      p = q+1;
    }
    if(p == buf)
      m = 0;
    if(m > 0){
      m -= p - buf;
 230:	2d 20 20 00 00       	sub    $0x2020,%eax
 235:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 238:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
      memmove(buf, p, m);
 23b:	51                   	push   %ecx
 23c:	53                   	push   %ebx
 23d:	68 20 20 00 00       	push   $0x2020
 242:	e8 89 03 00 00       	call   5d0 <memmove>
 247:	83 c4 10             	add    $0x10,%esp
 24a:	e9 39 ff ff ff       	jmp    188 <grep+0x18>
 24f:	90                   	nop
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
      m = 0;
 250:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 257:	e9 2c ff ff ff       	jmp    188 <grep+0x18>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 25c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25f:	5b                   	pop    %ebx
 260:	5e                   	pop    %esi
 261:	5f                   	pop    %edi
 262:	5d                   	pop    %ebp
 263:	c3                   	ret    
 264:	66 90                	xchg   %ax,%ax
 266:	66 90                	xchg   %ax,%ax
 268:	66 90                	xchg   %ax,%ax
 26a:	66 90                	xchg   %ax,%ax
 26c:	66 90                	xchg   %ax,%ax
 26e:	66 90                	xchg   %ax,%ax

00000270 <main>:

int
main(int argc, char *argv[])
{
 270:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 274:	83 e4 f0             	and    $0xfffffff0,%esp
 277:	ff 71 fc             	pushl  -0x4(%ecx)
 27a:	55                   	push   %ebp
 27b:	89 e5                	mov    %esp,%ebp
 27d:	57                   	push   %edi
 27e:	56                   	push   %esi
 27f:	53                   	push   %ebx
 280:	51                   	push   %ecx
 281:	83 ec 18             	sub    $0x18,%esp
 284:	8b 01                	mov    (%ecx),%eax
 286:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
 289:	83 f8 01             	cmp    $0x1,%eax
  }
}

int
main(int argc, char *argv[])
{
 28c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
 28f:	0f 8e 8d 00 00 00    	jle    322 <main+0xb2>
    printf(2, "usage: grep pattern [file ...]\n");
    exit(1);
  }
  pattern = argv[1];
 295:	8b 43 04             	mov    0x4(%ebx),%eax
 298:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
 29b:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 29f:	be 02 00 00 00       	mov    $0x2,%esi

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit(1);
  }
  pattern = argv[1];
 2a4:	89 45 e0             	mov    %eax,-0x20(%ebp)

  if(argc <= 2){
 2a7:	74 63                	je     30c <main+0x9c>
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 2b0:	83 ec 08             	sub    $0x8,%esp
 2b3:	6a 00                	push   $0x0
 2b5:	ff 33                	pushl  (%ebx)
 2b7:	e8 5c 05 00 00       	call   818 <open>
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	85 c0                	test   %eax,%eax
 2c1:	89 c7                	mov    %eax,%edi
 2c3:	78 2c                	js     2f1 <main+0x81>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit(1);
    }
    grep(pattern, fd);
 2c5:	83 ec 08             	sub    $0x8,%esp
  if(argc <= 2){
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
 2c8:	83 c6 01             	add    $0x1,%esi
 2cb:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit(1);
    }
    grep(pattern, fd);
 2ce:	50                   	push   %eax
 2cf:	ff 75 e0             	pushl  -0x20(%ebp)
 2d2:	e8 99 fe ff ff       	call   170 <grep>
    close(fd);
 2d7:	89 3c 24             	mov    %edi,(%esp)
 2da:	e8 21 05 00 00       	call   800 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
 2df:	83 c4 10             	add    $0x10,%esp
 2e2:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
 2e5:	7f c9                	jg     2b0 <main+0x40>
      exit(1);
    }
    grep(pattern, fd);
    close(fd);
  }
  exit(0);
 2e7:	83 ec 0c             	sub    $0xc,%esp
 2ea:	6a 00                	push   $0x0
 2ec:	e8 e7 04 00 00       	call   7d8 <exit>
    exit(0);
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
 2f1:	50                   	push   %eax
 2f2:	ff 33                	pushl  (%ebx)
 2f4:	68 28 0e 00 00       	push   $0xe28
 2f9:	6a 01                	push   $0x1
 2fb:	e8 90 06 00 00       	call   990 <printf>
      exit(1);
 300:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 307:	e8 cc 04 00 00       	call   7d8 <exit>
    exit(1);
  }
  pattern = argv[1];

  if(argc <= 2){
    grep(pattern, 0);
 30c:	52                   	push   %edx
 30d:	52                   	push   %edx
 30e:	6a 00                	push   $0x0
 310:	50                   	push   %eax
 311:	e8 5a fe ff ff       	call   170 <grep>
    exit(0);
 316:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 31d:	e8 b6 04 00 00       	call   7d8 <exit>
{
  int fd, i;
  char *pattern;

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
 322:	51                   	push   %ecx
 323:	51                   	push   %ecx
 324:	68 08 0e 00 00       	push   $0xe08
 329:	6a 02                	push   $0x2
 32b:	e8 60 06 00 00       	call   990 <printf>
    exit(1);
 330:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 337:	e8 9c 04 00 00       	call   7d8 <exit>
 33c:	66 90                	xchg   %ax,%ax
 33e:	66 90                	xchg   %ax,%ax

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 34a:	89 c2                	mov    %eax,%edx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 350:	83 c1 01             	add    $0x1,%ecx
 353:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 357:	83 c2 01             	add    $0x1,%edx
 35a:	84 db                	test   %bl,%bl
 35c:	88 5a ff             	mov    %bl,-0x1(%edx)
 35f:	75 ef                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 361:	5b                   	pop    %ebx
 362:	5d                   	pop    %ebp
 363:	c3                   	ret    
 364:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 36a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 55 08             	mov    0x8(%ebp),%edx
 378:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 37b:	0f b6 02             	movzbl (%edx),%eax
 37e:	0f b6 19             	movzbl (%ecx),%ebx
 381:	84 c0                	test   %al,%al
 383:	75 1e                	jne    3a3 <strcmp+0x33>
 385:	eb 29                	jmp    3b0 <strcmp+0x40>
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 390:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 393:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 396:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 399:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	89 f1                	mov    %esi,%ecx
 3a3:	38 d8                	cmp    %bl,%al
 3a5:	74 e9                	je     390 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3a7:	29 d8                	sub    %ebx,%eax
}
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5e                   	pop    %esi
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    
 3b8:	90                   	nop
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	8b 55 08             	mov    0x8(%ebp),%edx
 3c8:	53                   	push   %ebx
 3c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 3cc:	0f b6 32             	movzbl (%edx),%esi
 3cf:	89 f0                	mov    %esi,%eax
 3d1:	84 c0                	test   %al,%al
 3d3:	74 67                	je     43c <strncmp+0x7c>
 3d5:	0f b6 19             	movzbl (%ecx),%ebx
 3d8:	89 f0                	mov    %esi,%eax
 3da:	38 d8                	cmp    %bl,%al
 3dc:	75 65                	jne    443 <strncmp+0x83>
 3de:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e1:	89 f0                	mov    %esi,%eax
 3e3:	0f b6 f0             	movzbl %al,%esi
 3e6:	89 f0                	mov    %esi,%eax
 3e8:	83 eb 01             	sub    $0x1,%ebx
 3eb:	75 14                	jne    401 <strncmp+0x41>
 3ed:	eb 25                	jmp    414 <strncmp+0x54>
 3ef:	90                   	nop
 3f0:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 3f4:	89 f1                	mov    %esi,%ecx
 3f6:	38 c8                	cmp    %cl,%al
 3f8:	75 26                	jne    420 <strncmp+0x60>
 3fa:	83 eb 01             	sub    $0x1,%ebx
 3fd:	89 f9                	mov    %edi,%ecx
 3ff:	74 2f                	je     430 <strncmp+0x70>
    p++, q++;
 401:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 404:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 407:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 40a:	84 c0                	test   %al,%al
 40c:	75 e2                	jne    3f0 <strncmp+0x30>
 40e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 412:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 414:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 415:	29 f0                	sub    %esi,%eax
}
 417:	5e                   	pop    %esi
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	90                   	nop
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 420:	0f b6 f1             	movzbl %cl,%esi
 423:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 424:	29 f0                	sub    %esi,%eax
}
 426:	5e                   	pop    %esi
 427:	5f                   	pop    %edi
 428:	5d                   	pop    %ebp
 429:	c3                   	ret    
 42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 430:	0f b6 f0             	movzbl %al,%esi
 433:	89 f0                	mov    %esi,%eax
 435:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 436:	29 f0                	sub    %esi,%eax
}
 438:	5e                   	pop    %esi
 439:	5f                   	pop    %edi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 43c:	31 c0                	xor    %eax,%eax
 43e:	0f b6 31             	movzbl (%ecx),%esi
 441:	eb d1                	jmp    414 <strncmp+0x54>
 443:	0f b6 c0             	movzbl %al,%eax
 446:	0f b6 f3             	movzbl %bl,%esi
 449:	eb c9                	jmp    414 <strncmp+0x54>
 44b:	90                   	nop
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 456:	80 39 00             	cmpb   $0x0,(%ecx)
 459:	74 12                	je     46d <strlen+0x1d>
 45b:	31 d2                	xor    %edx,%edx
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	83 c2 01             	add    $0x1,%edx
 463:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 467:	89 d0                	mov    %edx,%eax
 469:	75 f5                	jne    460 <strlen+0x10>
    ;
  return n;
}
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 46d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    
 471:	eb 0d                	jmp    480 <memset>
 473:	90                   	nop
 474:	90                   	nop
 475:	90                   	nop
 476:	90                   	nop
 477:	90                   	nop
 478:	90                   	nop
 479:	90                   	nop
 47a:	90                   	nop
 47b:	90                   	nop
 47c:	90                   	nop
 47d:	90                   	nop
 47e:	90                   	nop
 47f:	90                   	nop

00000480 <memset>:

void*
memset(void *dst, int c, uint n)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 487:	8b 4d 10             	mov    0x10(%ebp),%ecx
 48a:	8b 45 0c             	mov    0xc(%ebp),%eax
 48d:	89 d7                	mov    %edx,%edi
 48f:	fc                   	cld    
 490:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 492:	89 d0                	mov    %edx,%eax
 494:	5f                   	pop    %edi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    
 497:	89 f6                	mov    %esi,%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <strchr>:

char*
strchr(const char *s, char c)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 4aa:	0f b6 10             	movzbl (%eax),%edx
 4ad:	84 d2                	test   %dl,%dl
 4af:	74 1d                	je     4ce <strchr+0x2e>
    if(*s == c)
 4b1:	38 d3                	cmp    %dl,%bl
 4b3:	89 d9                	mov    %ebx,%ecx
 4b5:	75 0d                	jne    4c4 <strchr+0x24>
 4b7:	eb 17                	jmp    4d0 <strchr+0x30>
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c0:	38 ca                	cmp    %cl,%dl
 4c2:	74 0c                	je     4d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 4c4:	83 c0 01             	add    $0x1,%eax
 4c7:	0f b6 10             	movzbl (%eax),%edx
 4ca:	84 d2                	test   %dl,%dl
 4cc:	75 f2                	jne    4c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 4ce:	31 c0                	xor    %eax,%eax
}
 4d0:	5b                   	pop    %ebx
 4d1:	5d                   	pop    %ebp
 4d2:	c3                   	ret    
 4d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <gets>:

char*
gets(char *buf, int max)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4e6:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4e9:	31 db                	xor    %ebx,%ebx
 4eb:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 4f0:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4f3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 4f6:	7d 30                	jge    528 <gets+0x48>
    cc = read(0, &c, 1);
 4f8:	83 ec 04             	sub    $0x4,%esp
 4fb:	6a 01                	push   $0x1
 4fd:	56                   	push   %esi
 4fe:	6a 00                	push   $0x0
 500:	e8 eb 02 00 00       	call   7f0 <read>
    if(cc < 1)
 505:	83 c4 10             	add    $0x10,%esp
 508:	85 c0                	test   %eax,%eax
 50a:	7e e7                	jle    4f3 <gets+0x13>
      continue;
    buf[i++] = c;
 50c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 510:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 513:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 515:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 518:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 51a:	74 0c                	je     528 <gets+0x48>
 51c:	3c 0d                	cmp    $0xd,%al
 51e:	74 08                	je     528 <gets+0x48>
 520:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 523:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 526:	7c d0                	jl     4f8 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 52f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 532:	5b                   	pop    %ebx
 533:	5e                   	pop    %esi
 534:	5f                   	pop    %edi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    
 537:	89 f6                	mov    %esi,%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000540 <stat>:

int
stat(const char *n, struct stat *st)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	56                   	push   %esi
 544:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 545:	83 ec 08             	sub    $0x8,%esp
 548:	6a 00                	push   $0x0
 54a:	ff 75 08             	pushl  0x8(%ebp)
 54d:	e8 c6 02 00 00       	call   818 <open>
  if(fd < 0)
 552:	83 c4 10             	add    $0x10,%esp
 555:	85 c0                	test   %eax,%eax
 557:	78 27                	js     580 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 559:	83 ec 08             	sub    $0x8,%esp
 55c:	ff 75 0c             	pushl  0xc(%ebp)
 55f:	89 c3                	mov    %eax,%ebx
 561:	50                   	push   %eax
 562:	e8 c9 02 00 00       	call   830 <fstat>
 567:	89 c6                	mov    %eax,%esi
  close(fd);
 569:	89 1c 24             	mov    %ebx,(%esp)
 56c:	e8 8f 02 00 00       	call   800 <close>
  return r;
 571:	83 c4 10             	add    $0x10,%esp
 574:	89 f0                	mov    %esi,%eax
}
 576:	8d 65 f8             	lea    -0x8(%ebp),%esp
 579:	5b                   	pop    %ebx
 57a:	5e                   	pop    %esi
 57b:	5d                   	pop    %ebp
 57c:	c3                   	ret    
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 580:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 585:	eb ef                	jmp    576 <stat+0x36>
 587:	89 f6                	mov    %esi,%esi
 589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000590 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	53                   	push   %ebx
 594:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 597:	0f be 11             	movsbl (%ecx),%edx
 59a:	8d 42 d0             	lea    -0x30(%edx),%eax
 59d:	3c 09                	cmp    $0x9,%al
 59f:	b8 00 00 00 00       	mov    $0x0,%eax
 5a4:	77 1f                	ja     5c5 <atoi+0x35>
 5a6:	8d 76 00             	lea    0x0(%esi),%esi
 5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 5b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 5b3:	83 c1 01             	add    $0x1,%ecx
 5b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5ba:	0f be 11             	movsbl (%ecx),%edx
 5bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 5c0:	80 fb 09             	cmp    $0x9,%bl
 5c3:	76 eb                	jbe    5b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 5c5:	5b                   	pop    %ebx
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
 5c8:	90                   	nop
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	56                   	push   %esi
 5d4:	53                   	push   %ebx
 5d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5de:	85 db                	test   %ebx,%ebx
 5e0:	7e 14                	jle    5f6 <memmove+0x26>
 5e2:	31 d2                	xor    %edx,%edx
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 5e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 5ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 5ef:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5f2:	39 da                	cmp    %ebx,%edx
 5f4:	75 f2                	jne    5e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 5f6:	5b                   	pop    %ebx
 5f7:	5e                   	pop    %esi
 5f8:	5d                   	pop    %ebp
 5f9:	c3                   	ret    
 5fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000600 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 04             	sub    $0x4,%esp
 609:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 60c:	83 f9 00             	cmp    $0x0,%ecx
 60f:	7e 76                	jle    687 <itoa+0x87>
 611:	89 cb                	mov    %ecx,%ebx
 613:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 615:	bf 67 66 66 66       	mov    $0x66666667,%edi
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 620:	89 d8                	mov    %ebx,%eax
 622:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 625:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 628:	f7 ef                	imul   %edi
 62a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 62d:	29 da                	sub    %ebx,%edx
 62f:	89 d3                	mov    %edx,%ebx
 631:	75 ed                	jne    620 <itoa+0x20>
        length++;
 633:	89 f3                	mov    %esi,%ebx
 635:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 638:	bf 67 66 66 66       	mov    $0x66666667,%edi
 63d:	8b 75 08             	mov    0x8(%ebp),%esi
 640:	eb 0a                	jmp    64c <itoa+0x4c>
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 648:	85 db                	test   %ebx,%ebx
 64a:	7e 25                	jle    671 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 64c:	89 c8                	mov    %ecx,%eax
 64e:	f7 ef                	imul   %edi
 650:	89 c8                	mov    %ecx,%eax
 652:	c1 f8 1f             	sar    $0x1f,%eax
 655:	c1 fa 02             	sar    $0x2,%edx
 658:	29 c2                	sub    %eax,%edx
 65a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 65d:	01 c0                	add    %eax,%eax
 65f:	29 c1                	sub    %eax,%ecx
 661:	83 c1 30             	add    $0x30,%ecx
 664:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 668:	83 eb 01             	sub    $0x1,%ebx
 66b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 66d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 66f:	7f d7                	jg     648 <itoa+0x48>
 671:	8b 75 f0             	mov    -0x10(%ebp),%esi
 674:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 676:	8b 7d 08             	mov    0x8(%ebp),%edi
 679:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 67d:	83 c4 04             	add    $0x4,%esp
 680:	89 f0                	mov    %esi,%eax
 682:	5b                   	pop    %ebx
 683:	5e                   	pop    %esi
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 687:	75 12                	jne    69b <itoa+0x9b>
        buf[0] = '0';
 689:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 68c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 691:	c6 00 30             	movb   $0x30,(%eax)
 694:	b8 01 00 00 00       	mov    $0x1,%eax
 699:	eb db                	jmp    676 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 69b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 69d:	31 f6                	xor    %esi,%esi
 69f:	eb d5                	jmp    676 <itoa+0x76>
 6a1:	eb 0d                	jmp    6b0 <strcat>
 6a3:	90                   	nop
 6a4:	90                   	nop
 6a5:	90                   	nop
 6a6:	90                   	nop
 6a7:	90                   	nop
 6a8:	90                   	nop
 6a9:	90                   	nop
 6aa:	90                   	nop
 6ab:	90                   	nop
 6ac:	90                   	nop
 6ad:	90                   	nop
 6ae:	90                   	nop
 6af:	90                   	nop

000006b0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	53                   	push   %ebx
 6b9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 6bc:	80 38 00             	cmpb   $0x0,(%eax)
 6bf:	74 38                	je     6f9 <strcat+0x49>
 6c1:	31 c9                	xor    %ecx,%ecx
 6c3:	90                   	nop
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6c8:	83 c1 01             	add    $0x1,%ecx
 6cb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 6cf:	89 ca                	mov    %ecx,%edx
 6d1:	75 f5                	jne    6c8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 6d3:	0f b6 1e             	movzbl (%esi),%ebx
 6d6:	84 db                	test   %bl,%bl
 6d8:	74 16                	je     6f0 <strcat+0x40>
 6da:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 6dd:	31 d2                	xor    %edx,%edx
 6df:	90                   	nop
                dest[i + j] = source[j];
 6e0:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 6e3:	83 c2 01             	add    $0x1,%edx
 6e6:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 6ea:	84 db                	test   %bl,%bl
 6ec:	75 f2                	jne    6e0 <strcat+0x30>
 6ee:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 6f0:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 6f4:	5b                   	pop    %ebx
 6f5:	5e                   	pop    %esi
 6f6:	5f                   	pop    %edi
 6f7:	5d                   	pop    %ebp
 6f8:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 6f9:	31 d2                	xor    %edx,%edx
 6fb:	31 c9                	xor    %ecx,%ecx
 6fd:	eb d4                	jmp    6d3 <strcat+0x23>
 6ff:	90                   	nop

00000700 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 709:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 70c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 70f:	0f b6 00             	movzbl (%eax),%eax
 712:	84 c0                	test   %al,%al
 714:	88 45 f3             	mov    %al,-0xd(%ebp)
 717:	0f 84 a0 00 00 00    	je     7bd <strstr+0xbd>
 71d:	8b 55 0c             	mov    0xc(%ebp),%edx
 720:	31 c0                	xor    %eax,%eax
 722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 728:	83 c0 01             	add    $0x1,%eax
 72b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 72f:	75 f7                	jne    728 <strstr+0x28>
 731:	89 45 e8             	mov    %eax,-0x18(%ebp)
 734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 737:	0f b6 07             	movzbl (%edi),%eax
 73a:	84 c0                	test   %al,%al
 73c:	74 68                	je     7a6 <strstr+0xa6>
 73e:	31 d2                	xor    %edx,%edx
 740:	83 c2 01             	add    $0x1,%edx
 743:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 747:	75 f7                	jne    740 <strstr+0x40>
 749:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 74c:	84 c0                	test   %al,%al
 74e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 751:	74 4d                	je     7a0 <strstr+0xa0>
 753:	90                   	nop
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 758:	38 45 f3             	cmp    %al,-0xd(%ebp)
 75b:	75 34                	jne    791 <strstr+0x91>
 75d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 760:	83 eb 01             	sub    $0x1,%ebx
 763:	74 4b                	je     7b0 <strstr+0xb0>
 765:	8b 55 0c             	mov    0xc(%ebp),%edx
 768:	89 f8                	mov    %edi,%eax
 76a:	eb 10                	jmp    77c <strstr+0x7c>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 770:	3a 4a 01             	cmp    0x1(%edx),%cl
 773:	75 1c                	jne    791 <strstr+0x91>
 775:	83 eb 01             	sub    $0x1,%ebx
 778:	89 f2                	mov    %esi,%edx
 77a:	74 34                	je     7b0 <strstr+0xb0>
    p++, q++;
 77c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 77f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 782:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 785:	84 c9                	test   %cl,%cl
 787:	75 e7                	jne    770 <strstr+0x70>
 789:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 78d:	84 c0                	test   %al,%al
 78f:	74 1f                	je     7b0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 791:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 794:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 797:	74 0d                	je     7a6 <strstr+0xa6>
 799:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 79c:	84 c0                	test   %al,%al
 79e:	75 b8                	jne    758 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 7a0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 7a4:	eb e7                	jmp    78d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 7a6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 7a9:	31 c0                	xor    %eax,%eax
}
 7ab:	5b                   	pop    %ebx
 7ac:	5e                   	pop    %esi
 7ad:	5f                   	pop    %edi
 7ae:	5d                   	pop    %ebp
 7af:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 7b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 7b3:	83 c4 10             	add    $0x10,%esp
 7b6:	5b                   	pop    %ebx
 7b7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 7b8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 7ba:	5f                   	pop    %edi
 7bb:	5d                   	pop    %ebp
 7bc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 7bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 7c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 7cb:	e9 67 ff ff ff       	jmp    737 <strstr+0x37>

000007d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7d0:	b8 01 00 00 00       	mov    $0x1,%eax
 7d5:	cd 40                	int    $0x40
 7d7:	c3                   	ret    

000007d8 <exit>:
SYSCALL(exit)
 7d8:	b8 02 00 00 00       	mov    $0x2,%eax
 7dd:	cd 40                	int    $0x40
 7df:	c3                   	ret    

000007e0 <wait>:
SYSCALL(wait)
 7e0:	b8 03 00 00 00       	mov    $0x3,%eax
 7e5:	cd 40                	int    $0x40
 7e7:	c3                   	ret    

000007e8 <pipe>:
SYSCALL(pipe)
 7e8:	b8 04 00 00 00       	mov    $0x4,%eax
 7ed:	cd 40                	int    $0x40
 7ef:	c3                   	ret    

000007f0 <read>:
SYSCALL(read)
 7f0:	b8 05 00 00 00       	mov    $0x5,%eax
 7f5:	cd 40                	int    $0x40
 7f7:	c3                   	ret    

000007f8 <write>:
SYSCALL(write)
 7f8:	b8 10 00 00 00       	mov    $0x10,%eax
 7fd:	cd 40                	int    $0x40
 7ff:	c3                   	ret    

00000800 <close>:
SYSCALL(close)
 800:	b8 15 00 00 00       	mov    $0x15,%eax
 805:	cd 40                	int    $0x40
 807:	c3                   	ret    

00000808 <kill>:
SYSCALL(kill)
 808:	b8 06 00 00 00       	mov    $0x6,%eax
 80d:	cd 40                	int    $0x40
 80f:	c3                   	ret    

00000810 <exec>:
SYSCALL(exec)
 810:	b8 07 00 00 00       	mov    $0x7,%eax
 815:	cd 40                	int    $0x40
 817:	c3                   	ret    

00000818 <open>:
SYSCALL(open)
 818:	b8 0f 00 00 00       	mov    $0xf,%eax
 81d:	cd 40                	int    $0x40
 81f:	c3                   	ret    

00000820 <mknod>:
SYSCALL(mknod)
 820:	b8 11 00 00 00       	mov    $0x11,%eax
 825:	cd 40                	int    $0x40
 827:	c3                   	ret    

00000828 <unlink>:
SYSCALL(unlink)
 828:	b8 12 00 00 00       	mov    $0x12,%eax
 82d:	cd 40                	int    $0x40
 82f:	c3                   	ret    

00000830 <fstat>:
SYSCALL(fstat)
 830:	b8 08 00 00 00       	mov    $0x8,%eax
 835:	cd 40                	int    $0x40
 837:	c3                   	ret    

00000838 <link>:
SYSCALL(link)
 838:	b8 13 00 00 00       	mov    $0x13,%eax
 83d:	cd 40                	int    $0x40
 83f:	c3                   	ret    

00000840 <mkdir>:
SYSCALL(mkdir)
 840:	b8 14 00 00 00       	mov    $0x14,%eax
 845:	cd 40                	int    $0x40
 847:	c3                   	ret    

00000848 <chdir>:
SYSCALL(chdir)
 848:	b8 09 00 00 00       	mov    $0x9,%eax
 84d:	cd 40                	int    $0x40
 84f:	c3                   	ret    

00000850 <dup>:
SYSCALL(dup)
 850:	b8 0a 00 00 00       	mov    $0xa,%eax
 855:	cd 40                	int    $0x40
 857:	c3                   	ret    

00000858 <getpid>:
SYSCALL(getpid)
 858:	b8 0b 00 00 00       	mov    $0xb,%eax
 85d:	cd 40                	int    $0x40
 85f:	c3                   	ret    

00000860 <sbrk>:
SYSCALL(sbrk)
 860:	b8 0c 00 00 00       	mov    $0xc,%eax
 865:	cd 40                	int    $0x40
 867:	c3                   	ret    

00000868 <sleep>:
SYSCALL(sleep)
 868:	b8 0d 00 00 00       	mov    $0xd,%eax
 86d:	cd 40                	int    $0x40
 86f:	c3                   	ret    

00000870 <uptime>:
SYSCALL(uptime)
 870:	b8 0e 00 00 00       	mov    $0xe,%eax
 875:	cd 40                	int    $0x40
 877:	c3                   	ret    

00000878 <mount>:
SYSCALL(mount)
 878:	b8 16 00 00 00       	mov    $0x16,%eax
 87d:	cd 40                	int    $0x40
 87f:	c3                   	ret    

00000880 <umount>:
SYSCALL(umount)
 880:	b8 17 00 00 00       	mov    $0x17,%eax
 885:	cd 40                	int    $0x40
 887:	c3                   	ret    

00000888 <printmounts>:
SYSCALL(printmounts)
 888:	b8 18 00 00 00       	mov    $0x18,%eax
 88d:	cd 40                	int    $0x40
 88f:	c3                   	ret    

00000890 <printdevices>:
SYSCALL(printdevices)
 890:	b8 19 00 00 00       	mov    $0x19,%eax
 895:	cd 40                	int    $0x40
 897:	c3                   	ret    

00000898 <unshare>:
SYSCALL(unshare)
 898:	b8 1a 00 00 00       	mov    $0x1a,%eax
 89d:	cd 40                	int    $0x40
 89f:	c3                   	ret    

000008a0 <usleep>:
SYSCALL(usleep)
 8a0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 8a5:	cd 40                	int    $0x40
 8a7:	c3                   	ret    

000008a8 <ioctl>:
SYSCALL(ioctl)
 8a8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 8ad:	cd 40                	int    $0x40
 8af:	c3                   	ret    

000008b0 <getppid>:
SYSCALL(getppid)
 8b0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 8b5:	cd 40                	int    $0x40
 8b7:	c3                   	ret    

000008b8 <getcpu>:
SYSCALL(getcpu)
 8b8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 8bd:	cd 40                	int    $0x40
 8bf:	c3                   	ret    

000008c0 <getmem>:
SYSCALL(getmem)
 8c0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 8c5:	cd 40                	int    $0x40
 8c7:	c3                   	ret    

000008c8 <kmemtest>:
SYSCALL(kmemtest)
 8c8:	b8 20 00 00 00       	mov    $0x20,%eax
 8cd:	cd 40                	int    $0x40
 8cf:	c3                   	ret    

000008d0 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 8d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 8dc:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 8df:	85 db                	test   %ebx,%ebx
 8e1:	0f 84 91 00 00 00    	je     978 <printint+0xa8>
 8e7:	89 d0                	mov    %edx,%eax
 8e9:	c1 e8 1f             	shr    $0x1f,%eax
 8ec:	84 c0                	test   %al,%al
 8ee:	0f 84 84 00 00 00    	je     978 <printint+0xa8>
    neg = 1;
    x = -xx;
 8f4:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 8f6:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 8fd:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 8ff:	31 ff                	xor    %edi,%edi
 901:	8d 75 c7             	lea    -0x39(%ebp),%esi
 904:	eb 0c                	jmp    912 <printint+0x42>
 906:	8d 76 00             	lea    0x0(%esi),%esi
 909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 910:	89 df                	mov    %ebx,%edi
 912:	31 d2                	xor    %edx,%edx
 914:	8d 5f 01             	lea    0x1(%edi),%ebx
 917:	f7 f1                	div    %ecx
 919:	0f b6 92 48 0e 00 00 	movzbl 0xe48(%edx),%edx
  }while((x /= base) != 0);
 920:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 922:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 925:	75 e9                	jne    910 <printint+0x40>
  if(neg)
 927:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 92a:	85 c0                	test   %eax,%eax
 92c:	74 08                	je     936 <printint+0x66>
    buf[i++] = '-';
 92e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 933:	8d 5f 02             	lea    0x2(%edi),%ebx
 936:	8d 7d d8             	lea    -0x28(%ebp),%edi
 939:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 93d:	89 fa                	mov    %edi,%edx
 93f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 940:	0f b6 08             	movzbl (%eax),%ecx
 943:	83 e8 01             	sub    $0x1,%eax
 946:	83 c2 01             	add    $0x1,%edx
 949:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 94c:	39 f0                	cmp    %esi,%eax
 94e:	75 f0                	jne    940 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 950:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 953:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 958:	57                   	push   %edi
 959:	e8 f2 fa ff ff       	call   450 <strlen>
 95e:	83 c4 0c             	add    $0xc,%esp
 961:	50                   	push   %eax
 962:	57                   	push   %edi
 963:	ff 75 c0             	pushl  -0x40(%ebp)
 966:	e8 8d fe ff ff       	call   7f8 <write>
}
 96b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 96e:	5b                   	pop    %ebx
 96f:	5e                   	pop    %esi
 970:	5f                   	pop    %edi
 971:	5d                   	pop    %ebp
 972:	c3                   	ret    
 973:	90                   	nop
 974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 978:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 97a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 981:	e9 79 ff ff ff       	jmp    8ff <printint+0x2f>
 986:	8d 76 00             	lea    0x0(%esi),%esi
 989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 999:	8b 75 0c             	mov    0xc(%ebp),%esi
 99c:	0f b6 06             	movzbl (%esi),%eax
 99f:	84 c0                	test   %al,%al
 9a1:	0f 84 90 01 00 00    	je     b37 <printf+0x1a7>
 9a7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 9aa:	31 ff                	xor    %edi,%edi
 9ac:	31 d2                	xor    %edx,%edx
 9ae:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 9b1:	31 db                	xor    %ebx,%ebx
 9b3:	eb 39                	jmp    9ee <printf+0x5e>
 9b5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 9b8:	83 f9 25             	cmp    $0x25,%ecx
 9bb:	0f 84 af 00 00 00    	je     a70 <printf+0xe0>
 9c1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 9c4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 9c7:	83 ec 04             	sub    $0x4,%esp
 9ca:	6a 01                	push   $0x1
 9cc:	50                   	push   %eax
 9cd:	ff 75 08             	pushl  0x8(%ebp)
 9d0:	e8 23 fe ff ff       	call   7f8 <write>
 9d5:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 9d8:	85 c0                	test   %eax,%eax
 9da:	78 35                	js     a11 <printf+0x81>
 9dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9df:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 9e2:	01 c7                	add    %eax,%edi
 9e4:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9e6:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 9ea:	84 c0                	test   %al,%al
 9ec:	74 21                	je     a0f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 9ee:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 9f1:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 9f3:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 9f6:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 9f9:	74 bd                	je     9b8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 9fb:	83 fa 25             	cmp    $0x25,%edx
 9fe:	74 20                	je     a20 <printf+0x90>
 a00:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a02:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 a05:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a07:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 a0b:	84 c0                	test   %al,%al
 a0d:	75 df                	jne    9ee <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 a0f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 a11:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a14:	5b                   	pop    %ebx
 a15:	5e                   	pop    %esi
 a16:	5f                   	pop    %edi
 a17:	5d                   	pop    %ebp
 a18:	c3                   	ret    
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 a20:	83 f9 64             	cmp    $0x64,%ecx
 a23:	0f 84 7f 00 00 00    	je     aa8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 a29:	0f be d0             	movsbl %al,%edx
 a2c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 a32:	83 fa 70             	cmp    $0x70,%edx
 a35:	74 49                	je     a80 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a37:	83 f9 73             	cmp    $0x73,%ecx
 a3a:	0f 84 98 00 00 00    	je     ad8 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 a40:	83 f9 63             	cmp    $0x63,%ecx
 a43:	0f 84 c7 00 00 00    	je     b10 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a49:	83 f9 25             	cmp    $0x25,%ecx
 a4c:	74 6a                	je     ab8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 a4e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 a51:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 a54:	83 ec 04             	sub    $0x4,%esp
 a57:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 a59:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 a5d:	50                   	push   %eax
 a5e:	ff 75 08             	pushl  0x8(%ebp)
 a61:	e8 92 fd ff ff       	call   7f8 <write>
 a66:	83 c4 10             	add    $0x10,%esp
 a69:	e9 6a ff ff ff       	jmp    9d8 <printf+0x48>
 a6e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 a70:	ba 25 00 00 00       	mov    $0x25,%edx
 a75:	31 c0                	xor    %eax,%eax
 a77:	eb 89                	jmp    a02 <printf+0x72>
 a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 a80:	83 ec 0c             	sub    $0xc,%esp
 a83:	b9 10 00 00 00       	mov    $0x10,%ecx
 a88:	6a 00                	push   $0x0
 a8a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 a8d:	8b 45 08             	mov    0x8(%ebp),%eax
 a90:	8b 16                	mov    (%esi),%edx
        ap++;
 a92:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 a95:	e8 36 fe ff ff       	call   8d0 <printint>
        ap++;
 a9a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 a9d:	83 c4 10             	add    $0x10,%esp
 aa0:	e9 33 ff ff ff       	jmp    9d8 <printf+0x48>
 aa5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 aa8:	83 ec 0c             	sub    $0xc,%esp
 aab:	b9 0a 00 00 00       	mov    $0xa,%ecx
 ab0:	6a 01                	push   $0x1
 ab2:	eb d6                	jmp    a8a <printf+0xfa>
 ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ab8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 abb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 abe:	83 ec 04             	sub    $0x4,%esp
 ac1:	6a 01                	push   $0x1
 ac3:	50                   	push   %eax
 ac4:	ff 75 08             	pushl  0x8(%ebp)
 ac7:	e8 2c fd ff ff       	call   7f8 <write>
 acc:	83 c4 10             	add    $0x10,%esp
 acf:	e9 04 ff ff ff       	jmp    9d8 <printf+0x48>
 ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 ad8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 adb:	8b 30                	mov    (%eax),%esi
        ap++;
 add:	83 c0 04             	add    $0x4,%eax
 ae0:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 ae3:	b8 3e 0e 00 00       	mov    $0xe3e,%eax
 ae8:	85 f6                	test   %esi,%esi
 aea:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 aed:	83 ec 0c             	sub    $0xc,%esp
 af0:	56                   	push   %esi
 af1:	e8 5a f9 ff ff       	call   450 <strlen>
 af6:	83 c4 0c             	add    $0xc,%esp
 af9:	50                   	push   %eax
 afa:	56                   	push   %esi
 afb:	ff 75 08             	pushl  0x8(%ebp)
 afe:	e8 f5 fc ff ff       	call   7f8 <write>
 b03:	83 c4 10             	add    $0x10,%esp
 b06:	e9 cd fe ff ff       	jmp    9d8 <printf+0x48>
 b0b:	90                   	nop
 b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b10:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 b13:	83 ec 04             	sub    $0x4,%esp
 b16:	8b 06                	mov    (%esi),%eax
 b18:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 b1a:	83 c6 04             	add    $0x4,%esi
 b1d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 b20:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 b23:	50                   	push   %eax
 b24:	ff 75 08             	pushl  0x8(%ebp)
 b27:	e8 cc fc ff ff       	call   7f8 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 b2c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 b2f:	83 c4 10             	add    $0x10,%esp
 b32:	e9 a1 fe ff ff       	jmp    9d8 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 b37:	31 c0                	xor    %eax,%eax
 b39:	e9 d3 fe ff ff       	jmp    a11 <printf+0x81>
 b3e:	66 90                	xchg   %ax,%ax

00000b40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b41:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 b46:	89 e5                	mov    %esp,%ebp
 b48:	57                   	push   %edi
 b49:	56                   	push   %esi
 b4a:	53                   	push   %ebx
 b4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b4e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b50:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b53:	39 c8                	cmp    %ecx,%eax
 b55:	73 19                	jae    b70 <free+0x30>
 b57:	89 f6                	mov    %esi,%esi
 b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 b60:	39 d1                	cmp    %edx,%ecx
 b62:	72 1c                	jb     b80 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b64:	39 d0                	cmp    %edx,%eax
 b66:	73 18                	jae    b80 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 b68:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b6a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b6c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b6e:	72 f0                	jb     b60 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b70:	39 d0                	cmp    %edx,%eax
 b72:	72 f4                	jb     b68 <free+0x28>
 b74:	39 d1                	cmp    %edx,%ecx
 b76:	73 f0                	jae    b68 <free+0x28>
 b78:	90                   	nop
 b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 b80:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b83:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b86:	39 d7                	cmp    %edx,%edi
 b88:	74 19                	je     ba3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b8a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b8d:	8b 50 04             	mov    0x4(%eax),%edx
 b90:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b93:	39 f1                	cmp    %esi,%ecx
 b95:	74 23                	je     bba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b97:	89 08                	mov    %ecx,(%eax)
  freep = p;
 b99:	a3 00 20 00 00       	mov    %eax,0x2000
}
 b9e:	5b                   	pop    %ebx
 b9f:	5e                   	pop    %esi
 ba0:	5f                   	pop    %edi
 ba1:	5d                   	pop    %ebp
 ba2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 ba3:	03 72 04             	add    0x4(%edx),%esi
 ba6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ba9:	8b 10                	mov    (%eax),%edx
 bab:	8b 12                	mov    (%edx),%edx
 bad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 bb0:	8b 50 04             	mov    0x4(%eax),%edx
 bb3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bb6:	39 f1                	cmp    %esi,%ecx
 bb8:	75 dd                	jne    b97 <free+0x57>
    p->s.size += bp->s.size;
 bba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 bbd:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 bc2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 bc5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 bc8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 bca:	5b                   	pop    %ebx
 bcb:	5e                   	pop    %esi
 bcc:	5f                   	pop    %edi
 bcd:	5d                   	pop    %ebp
 bce:	c3                   	ret    
 bcf:	90                   	nop

00000bd0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	57                   	push   %edi
 bd4:	56                   	push   %esi
 bd5:	53                   	push   %ebx
 bd6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bdc:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 be2:	8d 78 07             	lea    0x7(%eax),%edi
 be5:	c1 ef 03             	shr    $0x3,%edi
 be8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 beb:	85 d2                	test   %edx,%edx
 bed:	0f 84 a3 00 00 00    	je     c96 <malloc+0xc6>
 bf3:	8b 02                	mov    (%edx),%eax
 bf5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bf8:	39 cf                	cmp    %ecx,%edi
 bfa:	76 74                	jbe    c70 <malloc+0xa0>
 bfc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 c02:	be 00 10 00 00       	mov    $0x1000,%esi
 c07:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 c0e:	0f 43 f7             	cmovae %edi,%esi
 c11:	ba 00 80 00 00       	mov    $0x8000,%edx
 c16:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 c1c:	0f 46 da             	cmovbe %edx,%ebx
 c1f:	eb 10                	jmp    c31 <malloc+0x61>
 c21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c2a:	8b 48 04             	mov    0x4(%eax),%ecx
 c2d:	39 cf                	cmp    %ecx,%edi
 c2f:	76 3f                	jbe    c70 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c31:	39 05 00 20 00 00    	cmp    %eax,0x2000
 c37:	89 c2                	mov    %eax,%edx
 c39:	75 ed                	jne    c28 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 c3b:	83 ec 0c             	sub    $0xc,%esp
 c3e:	53                   	push   %ebx
 c3f:	e8 1c fc ff ff       	call   860 <sbrk>
  if(p == (char*)-1)
 c44:	83 c4 10             	add    $0x10,%esp
 c47:	83 f8 ff             	cmp    $0xffffffff,%eax
 c4a:	74 1c                	je     c68 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 c4c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 c4f:	83 ec 0c             	sub    $0xc,%esp
 c52:	83 c0 08             	add    $0x8,%eax
 c55:	50                   	push   %eax
 c56:	e8 e5 fe ff ff       	call   b40 <free>
  return freep;
 c5b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 c61:	83 c4 10             	add    $0x10,%esp
 c64:	85 d2                	test   %edx,%edx
 c66:	75 c0                	jne    c28 <malloc+0x58>
        return 0;
 c68:	31 c0                	xor    %eax,%eax
 c6a:	eb 1c                	jmp    c88 <malloc+0xb8>
 c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 c70:	39 cf                	cmp    %ecx,%edi
 c72:	74 1c                	je     c90 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 c74:	29 f9                	sub    %edi,%ecx
 c76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 c79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 c7c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 c7f:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 c85:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 c88:	8d 65 f4             	lea    -0xc(%ebp),%esp
 c8b:	5b                   	pop    %ebx
 c8c:	5e                   	pop    %esi
 c8d:	5f                   	pop    %edi
 c8e:	5d                   	pop    %ebp
 c8f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 c90:	8b 08                	mov    (%eax),%ecx
 c92:	89 0a                	mov    %ecx,(%edx)
 c94:	eb e9                	jmp    c7f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c96:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 c9d:	20 00 00 
 ca0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 ca7:	20 00 00 
    base.s.size = 0;
 caa:	b8 04 20 00 00       	mov    $0x2004,%eax
 caf:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 cb6:	00 00 00 
 cb9:	e9 3e ff ff ff       	jmp    bfc <malloc+0x2c>
 cbe:	66 90                	xchg   %ax,%ax

00000cc0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 cc0:	55                   	push   %ebp
 cc1:	89 e5                	mov    %esp,%ebp
 cc3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 cc6:	6a 10                	push   $0x10
 cc8:	6a 02                	push   $0x2
 cca:	ff 75 08             	pushl  0x8(%ebp)
 ccd:	e8 d6 fb ff ff       	call   8a8 <ioctl>
}
 cd2:	c9                   	leave  
 cd3:	c3                   	ret    
 cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ce0 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 ce0:	55                   	push   %ebp
 ce1:	89 e5                	mov    %esp,%ebp
 ce3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 ce6:	68 00 10 00 00       	push   $0x1000
 ceb:	6a 02                	push   $0x2
 ced:	ff 75 08             	pushl  0x8(%ebp)
 cf0:	e8 b3 fb ff ff       	call   8a8 <ioctl>
}
 cf5:	c9                   	leave  
 cf6:	c3                   	ret    
 cf7:	89 f6                	mov    %esi,%esi
 cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d00 <attach_tty>:

int
attach_tty(int tty_fd)
{
 d00:	55                   	push   %ebp
 d01:	89 e5                	mov    %esp,%ebp
 d03:	53                   	push   %ebx
 d04:	83 ec 08             	sub    $0x8,%esp
 d07:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 d0a:	6a 10                	push   $0x10
 d0c:	6a 01                	push   $0x1
 d0e:	53                   	push   %ebx
 d0f:	e8 94 fb ff ff       	call   8a8 <ioctl>
 d14:	83 c4 10             	add    $0x10,%esp
 d17:	85 c0                	test   %eax,%eax
 d19:	78 55                	js     d70 <attach_tty+0x70>
     return -1;

    close(0);
 d1b:	83 ec 0c             	sub    $0xc,%esp
 d1e:	6a 00                	push   $0x0
 d20:	e8 db fa ff ff       	call   800 <close>
    close(1);
 d25:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d2c:	e8 cf fa ff ff       	call   800 <close>
    close(2);
 d31:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 d38:	e8 c3 fa ff ff       	call   800 <close>
    if(dup(tty_fd) < 0)
 d3d:	89 1c 24             	mov    %ebx,(%esp)
 d40:	e8 0b fb ff ff       	call   850 <dup>
 d45:	83 c4 10             	add    $0x10,%esp
 d48:	85 c0                	test   %eax,%eax
 d4a:	78 24                	js     d70 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 d4c:	83 ec 0c             	sub    $0xc,%esp
 d4f:	53                   	push   %ebx
 d50:	e8 fb fa ff ff       	call   850 <dup>
 d55:	83 c4 10             	add    $0x10,%esp
 d58:	85 c0                	test   %eax,%eax
 d5a:	78 14                	js     d70 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 d5c:	83 ec 0c             	sub    $0xc,%esp
 d5f:	53                   	push   %ebx
 d60:	e8 eb fa ff ff       	call   850 <dup>
 d65:	83 c4 10             	add    $0x10,%esp
 d68:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 d6b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 d6e:	c9                   	leave  
 d6f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 d70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 d75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 d78:	c9                   	leave  
 d79:	c3                   	ret    
 d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d80 <detach_tty>:

int
detach_tty(int tty_fd)
{
 d80:	55                   	push   %ebp
 d81:	89 e5                	mov    %esp,%ebp
 d83:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 d86:	6a 20                	push   $0x20
 d88:	6a 01                	push   $0x1
 d8a:	ff 75 08             	pushl  0x8(%ebp)
 d8d:	e8 16 fb ff ff       	call   8a8 <ioctl>
    return 0;
}
 d92:	31 c0                	xor    %eax,%eax
 d94:	c9                   	leave  
 d95:	c3                   	ret    
 d96:	8d 76 00             	lea    0x0(%esi),%esi
 d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000da0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 da0:	55                   	push   %ebp
 da1:	89 e5                	mov    %esp,%ebp
 da3:	53                   	push   %ebx
 da4:	83 ec 08             	sub    $0x8,%esp
 da7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 daa:	6a 10                	push   $0x10
 dac:	6a 02                	push   $0x2
 dae:	53                   	push   %ebx
 daf:	e8 f4 fa ff ff       	call   8a8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 db4:	83 c4 10             	add    $0x10,%esp
 db7:	85 c0                	test   %eax,%eax
 db9:	74 1d                	je     dd8 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 dbb:	83 ec 04             	sub    $0x4,%esp
 dbe:	68 00 10 00 00       	push   $0x1000
 dc3:	6a 01                	push   $0x1
 dc5:	53                   	push   %ebx
 dc6:	e8 dd fa ff ff       	call   8a8 <ioctl>
     return tty_fd;
 dcb:	83 c4 10             	add    $0x10,%esp
 dce:	89 d8                	mov    %ebx,%eax
}
 dd0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 dd3:	c9                   	leave  
 dd4:	c3                   	ret    
 dd5:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 dd8:	83 ec 0c             	sub    $0xc,%esp
 ddb:	53                   	push   %ebx
 ddc:	e8 1f fa ff ff       	call   800 <close>
       return -1;
 de1:	83 c4 10             	add    $0x10,%esp
 de4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 de9:	eb e5                	jmp    dd0 <connect_tty+0x30>
 deb:	90                   	nop
 dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000df0 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 df0:	55                   	push   %ebp
 df1:	89 e5                	mov    %esp,%ebp
 df3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 df6:	68 00 20 00 00       	push   $0x2000
 dfb:	6a 01                	push   $0x1
 dfd:	ff 75 08             	pushl  0x8(%ebp)
 e00:	e8 a3 fa ff ff       	call   8a8 <ioctl>
}
 e05:	c9                   	leave  
 e06:	c3                   	ret    
