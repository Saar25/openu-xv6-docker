
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  11:	e8 3a 00 00 00       	call   50 <forktest>
  16:	83 ec 0c             	sub    $0xc,%esp
  19:	6a 00                	push   $0x0
  1b:	e8 b8 05 00 00       	call   5d8 <exit>

00000020 <printf>:

#define N  1000

int
printf(int fd, const char *s, ...)
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	53                   	push   %ebx
  24:	83 ec 10             	sub    $0x10,%esp
  27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  return write(fd, s, strlen(s));
  2a:	53                   	push   %ebx
  2b:	e8 20 02 00 00       	call   250 <strlen>
  30:	83 c4 0c             	add    $0xc,%esp
  33:	50                   	push   %eax
  34:	53                   	push   %ebx
  35:	ff 75 08             	pushl  0x8(%ebp)
  38:	e8 bb 05 00 00       	call   5f8 <write>
}
  3d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  40:	c9                   	leave  
  41:	c3                   	ret    
  42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000050 <forktest>:

void
forktest(void)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  54:	31 db                	xor    %ebx,%ebx
  return write(fd, s, strlen(s));
}

void
forktest(void)
{
  56:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  59:	68 d0 06 00 00       	push   $0x6d0
  5e:	6a 01                	push   $0x1
  60:	e8 bb ff ff ff       	call   20 <printf>
  65:	83 c4 10             	add    $0x10,%esp
  68:	eb 17                	jmp    81 <forktest+0x31>
  6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
  70:	0f 84 83 00 00 00    	je     f9 <forktest+0xa9>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  76:	83 c3 01             	add    $0x1,%ebx
  79:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  7f:	74 4f                	je     d0 <forktest+0x80>
    pid = fork();
  81:	e8 4a 05 00 00       	call   5d0 <fork>
    if(pid < 0)
  86:	85 c0                	test   %eax,%eax
  88:	79 e6                	jns    70 <forktest+0x20>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit(1);
  }

  for(; n > 0; n--){
  8a:	85 db                	test   %ebx,%ebx
  8c:	74 18                	je     a6 <forktest+0x56>
  8e:	66 90                	xchg   %ax,%ax
    if(wait(0) < 0){
  90:	83 ec 0c             	sub    $0xc,%esp
  93:	6a 00                	push   $0x0
  95:	e8 46 05 00 00       	call   5e0 <wait>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	85 c0                	test   %eax,%eax
  9f:	78 62                	js     103 <forktest+0xb3>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit(1);
  }

  for(; n > 0; n--){
  a1:	83 eb 01             	sub    $0x1,%ebx
  a4:	75 ea                	jne    90 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit(1);
    }
  }

  if(wait(0) != -1){
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	6a 00                	push   $0x0
  ab:	e8 30 05 00 00       	call   5e0 <wait>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 66                	jne    11e <forktest+0xce>
    printf(1, "wait got too many\n");
    exit(1);
  }

  printf(1, "fork test OK\n");
  b8:	83 ec 08             	sub    $0x8,%esp
  bb:	68 02 07 00 00       	push   $0x702
  c0:	6a 01                	push   $0x1
  c2:	e8 59 ff ff ff       	call   20 <printf>
}
  c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ca:	c9                   	leave  
  cb:	c3                   	ret    
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#define N  1000

int
printf(int fd, const char *s, ...)
{
  return write(fd, s, strlen(s));
  d0:	83 ec 0c             	sub    $0xc,%esp
  d3:	68 10 07 00 00       	push   $0x710
  d8:	e8 73 01 00 00       	call   250 <strlen>
  dd:	83 c4 0c             	add    $0xc,%esp
  e0:	50                   	push   %eax
  e1:	68 10 07 00 00       	push   $0x710
  e6:	6a 01                	push   $0x1
  e8:	e8 0b 05 00 00       	call   5f8 <write>
      exit(0);
  }

  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit(1);
  ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f4:	e8 df 04 00 00       	call   5d8 <exit>
  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit(0);
  f9:	83 ec 0c             	sub    $0xc,%esp
  fc:	6a 00                	push   $0x0
  fe:	e8 d5 04 00 00       	call   5d8 <exit>
    exit(1);
  }

  for(; n > 0; n--){
    if(wait(0) < 0){
      printf(1, "wait stopped early\n");
 103:	83 ec 08             	sub    $0x8,%esp
 106:	68 db 06 00 00       	push   $0x6db
 10b:	6a 01                	push   $0x1
 10d:	e8 0e ff ff ff       	call   20 <printf>
      exit(1);
 112:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 119:	e8 ba 04 00 00       	call   5d8 <exit>
    }
  }

  if(wait(0) != -1){
    printf(1, "wait got too many\n");
 11e:	83 ec 08             	sub    $0x8,%esp
 121:	68 ef 06 00 00       	push   $0x6ef
 126:	6a 01                	push   $0x1
 128:	e8 f3 fe ff ff       	call   20 <printf>
    exit(1);
 12d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 134:	e8 9f 04 00 00       	call   5d8 <exit>
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 14a:	89 c2                	mov    %eax,%edx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	83 c1 01             	add    $0x1,%ecx
 153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 157:	83 c2 01             	add    $0x1,%edx
 15a:	84 db                	test   %bl,%bl
 15c:	88 5a ff             	mov    %bl,-0x1(%edx)
 15f:	75 ef                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 161:	5b                   	pop    %ebx
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 55 08             	mov    0x8(%ebp),%edx
 178:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17b:	0f b6 02             	movzbl (%edx),%eax
 17e:	0f b6 19             	movzbl (%ecx),%ebx
 181:	84 c0                	test   %al,%al
 183:	75 1e                	jne    1a3 <strcmp+0x33>
 185:	eb 29                	jmp    1b0 <strcmp+0x40>
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 190:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 193:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 196:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 199:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 19d:	84 c0                	test   %al,%al
 19f:	74 0f                	je     1b0 <strcmp+0x40>
 1a1:	89 f1                	mov    %esi,%ecx
 1a3:	38 d8                	cmp    %bl,%al
 1a5:	74 e9                	je     190 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1a7:	29 d8                	sub    %ebx,%eax
}
 1a9:	5b                   	pop    %ebx
 1aa:	5e                   	pop    %esi
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1b2:	29 d8                	sub    %ebx,%eax
}
 1b4:	5b                   	pop    %ebx
 1b5:	5e                   	pop    %esi
 1b6:	5d                   	pop    %ebp
 1b7:	c3                   	ret    
 1b8:	90                   	nop
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
 1c5:	8b 55 08             	mov    0x8(%ebp),%edx
 1c8:	53                   	push   %ebx
 1c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 1cc:	0f b6 32             	movzbl (%edx),%esi
 1cf:	89 f0                	mov    %esi,%eax
 1d1:	84 c0                	test   %al,%al
 1d3:	74 67                	je     23c <strncmp+0x7c>
 1d5:	0f b6 19             	movzbl (%ecx),%ebx
 1d8:	89 f0                	mov    %esi,%eax
 1da:	38 d8                	cmp    %bl,%al
 1dc:	75 65                	jne    243 <strncmp+0x83>
 1de:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1e1:	89 f0                	mov    %esi,%eax
 1e3:	0f b6 f0             	movzbl %al,%esi
 1e6:	89 f0                	mov    %esi,%eax
 1e8:	83 eb 01             	sub    $0x1,%ebx
 1eb:	75 14                	jne    201 <strncmp+0x41>
 1ed:	eb 25                	jmp    214 <strncmp+0x54>
 1ef:	90                   	nop
 1f0:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 1f4:	89 f1                	mov    %esi,%ecx
 1f6:	38 c8                	cmp    %cl,%al
 1f8:	75 26                	jne    220 <strncmp+0x60>
 1fa:	83 eb 01             	sub    $0x1,%ebx
 1fd:	89 f9                	mov    %edi,%ecx
 1ff:	74 2f                	je     230 <strncmp+0x70>
    p++, q++;
 201:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 204:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 207:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 20a:	84 c0                	test   %al,%al
 20c:	75 e2                	jne    1f0 <strncmp+0x30>
 20e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 212:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 214:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 215:	29 f0                	sub    %esi,%eax
}
 217:	5e                   	pop    %esi
 218:	5f                   	pop    %edi
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    
 21b:	90                   	nop
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 220:	0f b6 f1             	movzbl %cl,%esi
 223:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 224:	29 f0                	sub    %esi,%eax
}
 226:	5e                   	pop    %esi
 227:	5f                   	pop    %edi
 228:	5d                   	pop    %ebp
 229:	c3                   	ret    
 22a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 230:	0f b6 f0             	movzbl %al,%esi
 233:	89 f0                	mov    %esi,%eax
 235:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 236:	29 f0                	sub    %esi,%eax
}
 238:	5e                   	pop    %esi
 239:	5f                   	pop    %edi
 23a:	5d                   	pop    %ebp
 23b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 23c:	31 c0                	xor    %eax,%eax
 23e:	0f b6 31             	movzbl (%ecx),%esi
 241:	eb d1                	jmp    214 <strncmp+0x54>
 243:	0f b6 c0             	movzbl %al,%eax
 246:	0f b6 f3             	movzbl %bl,%esi
 249:	eb c9                	jmp    214 <strncmp+0x54>
 24b:	90                   	nop
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 39 00             	cmpb   $0x0,(%ecx)
 259:	74 12                	je     26d <strlen+0x1d>
 25b:	31 d2                	xor    %edx,%edx
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c2 01             	add    $0x1,%edx
 263:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 267:	89 d0                	mov    %edx,%eax
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 26d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	eb 0d                	jmp    280 <memset>
 273:	90                   	nop
 274:	90                   	nop
 275:	90                   	nop
 276:	90                   	nop
 277:	90                   	nop
 278:	90                   	nop
 279:	90                   	nop
 27a:	90                   	nop
 27b:	90                   	nop
 27c:	90                   	nop
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	74 1d                	je     2ce <strchr+0x2e>
    if(*s == c)
 2b1:	38 d3                	cmp    %dl,%bl
 2b3:	89 d9                	mov    %ebx,%ecx
 2b5:	75 0d                	jne    2c4 <strchr+0x24>
 2b7:	eb 17                	jmp    2d0 <strchr+0x30>
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c0:	38 ca                	cmp    %cl,%dl
 2c2:	74 0c                	je     2d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2ce:	31 c0                	xor    %eax,%eax
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2e6:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e9:	31 db                	xor    %ebx,%ebx
 2eb:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 2f0:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 2f6:	7d 30                	jge    328 <gets+0x48>
    cc = read(0, &c, 1);
 2f8:	83 ec 04             	sub    $0x4,%esp
 2fb:	6a 01                	push   $0x1
 2fd:	56                   	push   %esi
 2fe:	6a 00                	push   $0x0
 300:	e8 eb 02 00 00       	call   5f0 <read>
    if(cc < 1)
 305:	83 c4 10             	add    $0x10,%esp
 308:	85 c0                	test   %eax,%eax
 30a:	7e e7                	jle    2f3 <gets+0x13>
      continue;
    buf[i++] = c;
 30c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 310:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 313:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 315:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 318:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 31a:	74 0c                	je     328 <gets+0x48>
 31c:	3c 0d                	cmp    $0xd,%al
 31e:	74 08                	je     328 <gets+0x48>
 320:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 323:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 326:	7c d0                	jl     2f8 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 32f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 332:	5b                   	pop    %ebx
 333:	5e                   	pop    %esi
 334:	5f                   	pop    %edi
 335:	5d                   	pop    %ebp
 336:	c3                   	ret    
 337:	89 f6                	mov    %esi,%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 345:	83 ec 08             	sub    $0x8,%esp
 348:	6a 00                	push   $0x0
 34a:	ff 75 08             	pushl  0x8(%ebp)
 34d:	e8 c6 02 00 00       	call   618 <open>
  if(fd < 0)
 352:	83 c4 10             	add    $0x10,%esp
 355:	85 c0                	test   %eax,%eax
 357:	78 27                	js     380 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 359:	83 ec 08             	sub    $0x8,%esp
 35c:	ff 75 0c             	pushl  0xc(%ebp)
 35f:	89 c3                	mov    %eax,%ebx
 361:	50                   	push   %eax
 362:	e8 c9 02 00 00       	call   630 <fstat>
 367:	89 c6                	mov    %eax,%esi
  close(fd);
 369:	89 1c 24             	mov    %ebx,(%esp)
 36c:	e8 8f 02 00 00       	call   600 <close>
  return r;
 371:	83 c4 10             	add    $0x10,%esp
 374:	89 f0                	mov    %esi,%eax
}
 376:	8d 65 f8             	lea    -0x8(%ebp),%esp
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
 37d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 380:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 385:	eb ef                	jmp    376 <stat+0x36>
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 397:	0f be 11             	movsbl (%ecx),%edx
 39a:	8d 42 d0             	lea    -0x30(%edx),%eax
 39d:	3c 09                	cmp    $0x9,%al
 39f:	b8 00 00 00 00       	mov    $0x0,%eax
 3a4:	77 1f                	ja     3c5 <atoi+0x35>
 3a6:	8d 76 00             	lea    0x0(%esi),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3b3:	83 c1 01             	add    $0x1,%ecx
 3b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ba:	0f be 11             	movsbl (%ecx),%edx
 3bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3c0:	80 fb 09             	cmp    $0x9,%bl
 3c3:	76 eb                	jbe    3b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3c5:	5b                   	pop    %ebx
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    
 3c8:	90                   	nop
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
 3d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
 3db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3de:	85 db                	test   %ebx,%ebx
 3e0:	7e 14                	jle    3f6 <memmove+0x26>
 3e2:	31 d2                	xor    %edx,%edx
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3ef:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3f2:	39 da                	cmp    %ebx,%edx
 3f4:	75 f2                	jne    3e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret    
 3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000400 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 04             	sub    $0x4,%esp
 409:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 40c:	83 f9 00             	cmp    $0x0,%ecx
 40f:	7e 76                	jle    487 <itoa+0x87>
 411:	89 cb                	mov    %ecx,%ebx
 413:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 415:	bf 67 66 66 66       	mov    $0x66666667,%edi
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 420:	89 d8                	mov    %ebx,%eax
 422:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 425:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 428:	f7 ef                	imul   %edi
 42a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 42d:	29 da                	sub    %ebx,%edx
 42f:	89 d3                	mov    %edx,%ebx
 431:	75 ed                	jne    420 <itoa+0x20>
        length++;
 433:	89 f3                	mov    %esi,%ebx
 435:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 438:	bf 67 66 66 66       	mov    $0x66666667,%edi
 43d:	8b 75 08             	mov    0x8(%ebp),%esi
 440:	eb 0a                	jmp    44c <itoa+0x4c>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 448:	85 db                	test   %ebx,%ebx
 44a:	7e 25                	jle    471 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 44c:	89 c8                	mov    %ecx,%eax
 44e:	f7 ef                	imul   %edi
 450:	89 c8                	mov    %ecx,%eax
 452:	c1 f8 1f             	sar    $0x1f,%eax
 455:	c1 fa 02             	sar    $0x2,%edx
 458:	29 c2                	sub    %eax,%edx
 45a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 45d:	01 c0                	add    %eax,%eax
 45f:	29 c1                	sub    %eax,%ecx
 461:	83 c1 30             	add    $0x30,%ecx
 464:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 468:	83 eb 01             	sub    $0x1,%ebx
 46b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 46d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 46f:	7f d7                	jg     448 <itoa+0x48>
 471:	8b 75 f0             	mov    -0x10(%ebp),%esi
 474:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 476:	8b 7d 08             	mov    0x8(%ebp),%edi
 479:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 47d:	83 c4 04             	add    $0x4,%esp
 480:	89 f0                	mov    %esi,%eax
 482:	5b                   	pop    %ebx
 483:	5e                   	pop    %esi
 484:	5f                   	pop    %edi
 485:	5d                   	pop    %ebp
 486:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 487:	75 12                	jne    49b <itoa+0x9b>
        buf[0] = '0';
 489:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 48c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 491:	c6 00 30             	movb   $0x30,(%eax)
 494:	b8 01 00 00 00       	mov    $0x1,%eax
 499:	eb db                	jmp    476 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 49b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 49d:	31 f6                	xor    %esi,%esi
 49f:	eb d5                	jmp    476 <itoa+0x76>
 4a1:	eb 0d                	jmp    4b0 <strcat>
 4a3:	90                   	nop
 4a4:	90                   	nop
 4a5:	90                   	nop
 4a6:	90                   	nop
 4a7:	90                   	nop
 4a8:	90                   	nop
 4a9:	90                   	nop
 4aa:	90                   	nop
 4ab:	90                   	nop
 4ac:	90                   	nop
 4ad:	90                   	nop
 4ae:	90                   	nop
 4af:	90                   	nop

000004b0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	53                   	push   %ebx
 4b9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 4bc:	80 38 00             	cmpb   $0x0,(%eax)
 4bf:	74 38                	je     4f9 <strcat+0x49>
 4c1:	31 c9                	xor    %ecx,%ecx
 4c3:	90                   	nop
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c8:	83 c1 01             	add    $0x1,%ecx
 4cb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 4cf:	89 ca                	mov    %ecx,%edx
 4d1:	75 f5                	jne    4c8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 4d3:	0f b6 1e             	movzbl (%esi),%ebx
 4d6:	84 db                	test   %bl,%bl
 4d8:	74 16                	je     4f0 <strcat+0x40>
 4da:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 4dd:	31 d2                	xor    %edx,%edx
 4df:	90                   	nop
                dest[i + j] = source[j];
 4e0:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 4e3:	83 c2 01             	add    $0x1,%edx
 4e6:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 4ea:	84 db                	test   %bl,%bl
 4ec:	75 f2                	jne    4e0 <strcat+0x30>
 4ee:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 4f0:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 4f4:	5b                   	pop    %ebx
 4f5:	5e                   	pop    %esi
 4f6:	5f                   	pop    %edi
 4f7:	5d                   	pop    %ebp
 4f8:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 4f9:	31 d2                	xor    %edx,%edx
 4fb:	31 c9                	xor    %ecx,%ecx
 4fd:	eb d4                	jmp    4d3 <strcat+0x23>
 4ff:	90                   	nop

00000500 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 509:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 50c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 50f:	0f b6 00             	movzbl (%eax),%eax
 512:	84 c0                	test   %al,%al
 514:	88 45 f3             	mov    %al,-0xd(%ebp)
 517:	0f 84 a0 00 00 00    	je     5bd <strstr+0xbd>
 51d:	8b 55 0c             	mov    0xc(%ebp),%edx
 520:	31 c0                	xor    %eax,%eax
 522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 528:	83 c0 01             	add    $0x1,%eax
 52b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 52f:	75 f7                	jne    528 <strstr+0x28>
 531:	89 45 e8             	mov    %eax,-0x18(%ebp)
 534:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 537:	0f b6 07             	movzbl (%edi),%eax
 53a:	84 c0                	test   %al,%al
 53c:	74 68                	je     5a6 <strstr+0xa6>
 53e:	31 d2                	xor    %edx,%edx
 540:	83 c2 01             	add    $0x1,%edx
 543:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 547:	75 f7                	jne    540 <strstr+0x40>
 549:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 54c:	84 c0                	test   %al,%al
 54e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 551:	74 4d                	je     5a0 <strstr+0xa0>
 553:	90                   	nop
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 558:	38 45 f3             	cmp    %al,-0xd(%ebp)
 55b:	75 34                	jne    591 <strstr+0x91>
 55d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 560:	83 eb 01             	sub    $0x1,%ebx
 563:	74 4b                	je     5b0 <strstr+0xb0>
 565:	8b 55 0c             	mov    0xc(%ebp),%edx
 568:	89 f8                	mov    %edi,%eax
 56a:	eb 10                	jmp    57c <strstr+0x7c>
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 570:	3a 4a 01             	cmp    0x1(%edx),%cl
 573:	75 1c                	jne    591 <strstr+0x91>
 575:	83 eb 01             	sub    $0x1,%ebx
 578:	89 f2                	mov    %esi,%edx
 57a:	74 34                	je     5b0 <strstr+0xb0>
    p++, q++;
 57c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 57f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 582:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 585:	84 c9                	test   %cl,%cl
 587:	75 e7                	jne    570 <strstr+0x70>
 589:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 58d:	84 c0                	test   %al,%al
 58f:	74 1f                	je     5b0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 591:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 594:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 597:	74 0d                	je     5a6 <strstr+0xa6>
 599:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 59c:	84 c0                	test   %al,%al
 59e:	75 b8                	jne    558 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 5a0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 5a4:	eb e7                	jmp    58d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 5a6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 5a9:	31 c0                	xor    %eax,%eax
}
 5ab:	5b                   	pop    %ebx
 5ac:	5e                   	pop    %esi
 5ad:	5f                   	pop    %edi
 5ae:	5d                   	pop    %ebp
 5af:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 5b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 5b3:	83 c4 10             	add    $0x10,%esp
 5b6:	5b                   	pop    %ebx
 5b7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 5b8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 5ba:	5f                   	pop    %edi
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 5bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 5cb:	e9 67 ff ff ff       	jmp    537 <strstr+0x37>

000005d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d0:	b8 01 00 00 00       	mov    $0x1,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <exit>:
SYSCALL(exit)
 5d8:	b8 02 00 00 00       	mov    $0x2,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <wait>:
SYSCALL(wait)
 5e0:	b8 03 00 00 00       	mov    $0x3,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <pipe>:
SYSCALL(pipe)
 5e8:	b8 04 00 00 00       	mov    $0x4,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <read>:
SYSCALL(read)
 5f0:	b8 05 00 00 00       	mov    $0x5,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <write>:
SYSCALL(write)
 5f8:	b8 10 00 00 00       	mov    $0x10,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <close>:
SYSCALL(close)
 600:	b8 15 00 00 00       	mov    $0x15,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <kill>:
SYSCALL(kill)
 608:	b8 06 00 00 00       	mov    $0x6,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <exec>:
SYSCALL(exec)
 610:	b8 07 00 00 00       	mov    $0x7,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <open>:
SYSCALL(open)
 618:	b8 0f 00 00 00       	mov    $0xf,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <mknod>:
SYSCALL(mknod)
 620:	b8 11 00 00 00       	mov    $0x11,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <unlink>:
SYSCALL(unlink)
 628:	b8 12 00 00 00       	mov    $0x12,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <fstat>:
SYSCALL(fstat)
 630:	b8 08 00 00 00       	mov    $0x8,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <link>:
SYSCALL(link)
 638:	b8 13 00 00 00       	mov    $0x13,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <mkdir>:
SYSCALL(mkdir)
 640:	b8 14 00 00 00       	mov    $0x14,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <chdir>:
SYSCALL(chdir)
 648:	b8 09 00 00 00       	mov    $0x9,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <dup>:
SYSCALL(dup)
 650:	b8 0a 00 00 00       	mov    $0xa,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <getpid>:
SYSCALL(getpid)
 658:	b8 0b 00 00 00       	mov    $0xb,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <sbrk>:
SYSCALL(sbrk)
 660:	b8 0c 00 00 00       	mov    $0xc,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <sleep>:
SYSCALL(sleep)
 668:	b8 0d 00 00 00       	mov    $0xd,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <uptime>:
SYSCALL(uptime)
 670:	b8 0e 00 00 00       	mov    $0xe,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <mount>:
SYSCALL(mount)
 678:	b8 16 00 00 00       	mov    $0x16,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <umount>:
SYSCALL(umount)
 680:	b8 17 00 00 00       	mov    $0x17,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <printmounts>:
SYSCALL(printmounts)
 688:	b8 18 00 00 00       	mov    $0x18,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <printdevices>:
SYSCALL(printdevices)
 690:	b8 19 00 00 00       	mov    $0x19,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <unshare>:
SYSCALL(unshare)
 698:	b8 1a 00 00 00       	mov    $0x1a,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <usleep>:
SYSCALL(usleep)
 6a0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <ioctl>:
SYSCALL(ioctl)
 6a8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <getppid>:
SYSCALL(getppid)
 6b0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <getcpu>:
SYSCALL(getcpu)
 6b8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <getmem>:
SYSCALL(getmem)
 6c0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <kmemtest>:
SYSCALL(kmemtest)
 6c8:	b8 20 00 00 00       	mov    $0x20,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    
