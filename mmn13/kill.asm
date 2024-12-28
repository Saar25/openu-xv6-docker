
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	bb 01 00 00 00       	mov    $0x1,%ebx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 2c                	jle    4f <main+0x4f>
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit(1);
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	pushl  (%edi,%ebx,4)

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit(1);
  }
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  31:	e8 8a 02 00 00       	call   2c0 <atoi>
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 fa 04 00 00       	call   538 <kill>

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit(1);
  }
  for(i=1; i<argc; i++)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	39 de                	cmp    %ebx,%esi
  43:	75 e3                	jne    28 <main+0x28>
    kill(atoi(argv[i]));
  exit(0);
  45:	83 ec 0c             	sub    $0xc,%esp
  48:	6a 00                	push   $0x0
  4a:	e8 b9 04 00 00       	call   508 <exit>
main(int argc, char **argv)
{
  int i;

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
  4f:	50                   	push   %eax
  50:	50                   	push   %eax
  51:	68 38 0b 00 00       	push   $0xb38
  56:	6a 02                	push   $0x2
  58:	e8 63 06 00 00       	call   6c0 <printf>
    exit(1);
  5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  64:	e8 9f 04 00 00       	call   508 <exit>
  69:	66 90                	xchg   %ax,%ax
  6b:	66 90                	xchg   %ax,%ax
  6d:	66 90                	xchg   %ax,%ax
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 45 08             	mov    0x8(%ebp),%eax
  77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
  a5:	8b 55 08             	mov    0x8(%ebp),%edx
  a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ab:	0f b6 02             	movzbl (%edx),%eax
  ae:	0f b6 19             	movzbl (%ecx),%ebx
  b1:	84 c0                	test   %al,%al
  b3:	75 1e                	jne    d3 <strcmp+0x33>
  b5:	eb 29                	jmp    e0 <strcmp+0x40>
  b7:	89 f6                	mov    %esi,%esi
  b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  c0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  c6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	89 f1                	mov    %esi,%ecx
  d3:	38 d8                	cmp    %bl,%al
  d5:	74 e9                	je     c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  d7:	29 d8                	sub    %ebx,%eax
}
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5e                   	pop    %esi
  e6:	5d                   	pop    %ebp
  e7:	c3                   	ret    
  e8:	90                   	nop
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	8b 55 08             	mov    0x8(%ebp),%edx
  f8:	53                   	push   %ebx
  f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
  fc:	0f b6 32             	movzbl (%edx),%esi
  ff:	89 f0                	mov    %esi,%eax
 101:	84 c0                	test   %al,%al
 103:	74 67                	je     16c <strncmp+0x7c>
 105:	0f b6 19             	movzbl (%ecx),%ebx
 108:	89 f0                	mov    %esi,%eax
 10a:	38 d8                	cmp    %bl,%al
 10c:	75 65                	jne    173 <strncmp+0x83>
 10e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 111:	89 f0                	mov    %esi,%eax
 113:	0f b6 f0             	movzbl %al,%esi
 116:	89 f0                	mov    %esi,%eax
 118:	83 eb 01             	sub    $0x1,%ebx
 11b:	75 14                	jne    131 <strncmp+0x41>
 11d:	eb 25                	jmp    144 <strncmp+0x54>
 11f:	90                   	nop
 120:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 124:	89 f1                	mov    %esi,%ecx
 126:	38 c8                	cmp    %cl,%al
 128:	75 26                	jne    150 <strncmp+0x60>
 12a:	83 eb 01             	sub    $0x1,%ebx
 12d:	89 f9                	mov    %edi,%ecx
 12f:	74 2f                	je     160 <strncmp+0x70>
    p++, q++;
 131:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 134:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 137:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 13a:	84 c0                	test   %al,%al
 13c:	75 e2                	jne    120 <strncmp+0x30>
 13e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 142:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 144:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 145:	29 f0                	sub    %esi,%eax
}
 147:	5e                   	pop    %esi
 148:	5f                   	pop    %edi
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret    
 14b:	90                   	nop
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	0f b6 f1             	movzbl %cl,%esi
 153:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 154:	29 f0                	sub    %esi,%eax
}
 156:	5e                   	pop    %esi
 157:	5f                   	pop    %edi
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	0f b6 f0             	movzbl %al,%esi
 163:	89 f0                	mov    %esi,%eax
 165:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 166:	29 f0                	sub    %esi,%eax
}
 168:	5e                   	pop    %esi
 169:	5f                   	pop    %edi
 16a:	5d                   	pop    %ebp
 16b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 16c:	31 c0                	xor    %eax,%eax
 16e:	0f b6 31             	movzbl (%ecx),%esi
 171:	eb d1                	jmp    144 <strncmp+0x54>
 173:	0f b6 c0             	movzbl %al,%eax
 176:	0f b6 f3             	movzbl %bl,%esi
 179:	eb c9                	jmp    144 <strncmp+0x54>
 17b:	90                   	nop
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 39 00             	cmpb   $0x0,(%ecx)
 189:	74 12                	je     19d <strlen+0x1d>
 18b:	31 d2                	xor    %edx,%edx
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c2 01             	add    $0x1,%edx
 193:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 197:	89 d0                	mov    %edx,%eax
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 19d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <memset>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	89 d0                	mov    %edx,%eax
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	74 1d                	je     1fe <strchr+0x2e>
    if(*s == c)
 1e1:	38 d3                	cmp    %dl,%bl
 1e3:	89 d9                	mov    %ebx,%ecx
 1e5:	75 0d                	jne    1f4 <strchr+0x24>
 1e7:	eb 17                	jmp    200 <strchr+0x30>
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	38 ca                	cmp    %cl,%dl
 1f2:	74 0c                	je     200 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	0f b6 10             	movzbl (%eax),%edx
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1fe:	31 c0                	xor    %eax,%eax
}
 200:	5b                   	pop    %ebx
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 216:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
 21b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 220:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 223:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 226:	7d 30                	jge    258 <gets+0x48>
    cc = read(0, &c, 1);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	6a 01                	push   $0x1
 22d:	56                   	push   %esi
 22e:	6a 00                	push   $0x0
 230:	e8 eb 02 00 00       	call   520 <read>
    if(cc < 1)
 235:	83 c4 10             	add    $0x10,%esp
 238:	85 c0                	test   %eax,%eax
 23a:	7e e7                	jle    223 <gets+0x13>
      continue;
    buf[i++] = c;
 23c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 240:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 243:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 245:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 248:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 24a:	74 0c                	je     258 <gets+0x48>
 24c:	3c 0d                	cmp    $0xd,%al
 24e:	74 08                	je     258 <gets+0x48>
 250:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 256:	7c d0                	jl     228 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 25f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 262:	5b                   	pop    %ebx
 263:	5e                   	pop    %esi
 264:	5f                   	pop    %edi
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	pushl  0x8(%ebp)
 27d:	e8 c6 02 00 00       	call   548 <open>
  if(fd < 0)
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	pushl  0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 c9 02 00 00       	call   560 <fstat>
 297:	89 c6                	mov    %eax,%esi
  close(fd);
 299:	89 1c 24             	mov    %ebx,(%esp)
 29c:	e8 8f 02 00 00       	call   530 <close>
  return r;
 2a1:	83 c4 10             	add    $0x10,%esp
 2a4:	89 f0                	mov    %esi,%eax
}
 2a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2b5:	eb ef                	jmp    2a6 <stat+0x36>
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 11             	movsbl (%ecx),%edx
 2ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 2cd:	3c 09                	cmp    $0x9,%al
 2cf:	b8 00 00 00 00       	mov    $0x0,%eax
 2d4:	77 1f                	ja     2f5 <atoi+0x35>
 2d6:	8d 76 00             	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2e3:	83 c1 01             	add    $0x1,%ecx
 2e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ea:	0f be 11             	movsbl (%ecx),%edx
 2ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2f5:	5b                   	pop    %ebx
 2f6:	5d                   	pop    %ebp
 2f7:	c3                   	ret    
 2f8:	90                   	nop
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
 305:	8b 5d 10             	mov    0x10(%ebp),%ebx
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30e:	85 db                	test   %ebx,%ebx
 310:	7e 14                	jle    326 <memmove+0x26>
 312:	31 d2                	xor    %edx,%edx
 314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 318:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 31c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 31f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 322:	39 da                	cmp    %ebx,%edx
 324:	75 f2                	jne    318 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 326:	5b                   	pop    %ebx
 327:	5e                   	pop    %esi
 328:	5d                   	pop    %ebp
 329:	c3                   	ret    
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000330 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	83 ec 04             	sub    $0x4,%esp
 339:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 33c:	83 f9 00             	cmp    $0x0,%ecx
 33f:	7e 76                	jle    3b7 <itoa+0x87>
 341:	89 cb                	mov    %ecx,%ebx
 343:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 345:	bf 67 66 66 66       	mov    $0x66666667,%edi
 34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 350:	89 d8                	mov    %ebx,%eax
 352:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 355:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 358:	f7 ef                	imul   %edi
 35a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 35d:	29 da                	sub    %ebx,%edx
 35f:	89 d3                	mov    %edx,%ebx
 361:	75 ed                	jne    350 <itoa+0x20>
        length++;
 363:	89 f3                	mov    %esi,%ebx
 365:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 368:	bf 67 66 66 66       	mov    $0x66666667,%edi
 36d:	8b 75 08             	mov    0x8(%ebp),%esi
 370:	eb 0a                	jmp    37c <itoa+0x4c>
 372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 378:	85 db                	test   %ebx,%ebx
 37a:	7e 25                	jle    3a1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 37c:	89 c8                	mov    %ecx,%eax
 37e:	f7 ef                	imul   %edi
 380:	89 c8                	mov    %ecx,%eax
 382:	c1 f8 1f             	sar    $0x1f,%eax
 385:	c1 fa 02             	sar    $0x2,%edx
 388:	29 c2                	sub    %eax,%edx
 38a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 38d:	01 c0                	add    %eax,%eax
 38f:	29 c1                	sub    %eax,%ecx
 391:	83 c1 30             	add    $0x30,%ecx
 394:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 398:	83 eb 01             	sub    $0x1,%ebx
 39b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 39d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 39f:	7f d7                	jg     378 <itoa+0x48>
 3a1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 3a4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 3a6:	8b 7d 08             	mov    0x8(%ebp),%edi
 3a9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 3ad:	83 c4 04             	add    $0x4,%esp
 3b0:	89 f0                	mov    %esi,%eax
 3b2:	5b                   	pop    %ebx
 3b3:	5e                   	pop    %esi
 3b4:	5f                   	pop    %edi
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3b7:	75 12                	jne    3cb <itoa+0x9b>
        buf[0] = '0';
 3b9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 3bc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 3c1:	c6 00 30             	movb   $0x30,(%eax)
 3c4:	b8 01 00 00 00       	mov    $0x1,%eax
 3c9:	eb db                	jmp    3a6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3cb:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 3cd:	31 f6                	xor    %esi,%esi
 3cf:	eb d5                	jmp    3a6 <itoa+0x76>
 3d1:	eb 0d                	jmp    3e0 <strcat>
 3d3:	90                   	nop
 3d4:	90                   	nop
 3d5:	90                   	nop
 3d6:	90                   	nop
 3d7:	90                   	nop
 3d8:	90                   	nop
 3d9:	90                   	nop
 3da:	90                   	nop
 3db:	90                   	nop
 3dc:	90                   	nop
 3dd:	90                   	nop
 3de:	90                   	nop
 3df:	90                   	nop

000003e0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	8b 45 08             	mov    0x8(%ebp),%eax
 3e8:	53                   	push   %ebx
 3e9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 3ec:	80 38 00             	cmpb   $0x0,(%eax)
 3ef:	74 38                	je     429 <strcat+0x49>
 3f1:	31 c9                	xor    %ecx,%ecx
 3f3:	90                   	nop
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3f8:	83 c1 01             	add    $0x1,%ecx
 3fb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 3ff:	89 ca                	mov    %ecx,%edx
 401:	75 f5                	jne    3f8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 403:	0f b6 1e             	movzbl (%esi),%ebx
 406:	84 db                	test   %bl,%bl
 408:	74 16                	je     420 <strcat+0x40>
 40a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 40d:	31 d2                	xor    %edx,%edx
 40f:	90                   	nop
                dest[i + j] = source[j];
 410:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 413:	83 c2 01             	add    $0x1,%edx
 416:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 41a:	84 db                	test   %bl,%bl
 41c:	75 f2                	jne    410 <strcat+0x30>
 41e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 420:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 424:	5b                   	pop    %ebx
 425:	5e                   	pop    %esi
 426:	5f                   	pop    %edi
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 429:	31 d2                	xor    %edx,%edx
 42b:	31 c9                	xor    %ecx,%ecx
 42d:	eb d4                	jmp    403 <strcat+0x23>
 42f:	90                   	nop

00000430 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 439:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 43c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 43f:	0f b6 00             	movzbl (%eax),%eax
 442:	84 c0                	test   %al,%al
 444:	88 45 f3             	mov    %al,-0xd(%ebp)
 447:	0f 84 a0 00 00 00    	je     4ed <strstr+0xbd>
 44d:	8b 55 0c             	mov    0xc(%ebp),%edx
 450:	31 c0                	xor    %eax,%eax
 452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 458:	83 c0 01             	add    $0x1,%eax
 45b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 45f:	75 f7                	jne    458 <strstr+0x28>
 461:	89 45 e8             	mov    %eax,-0x18(%ebp)
 464:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 467:	0f b6 07             	movzbl (%edi),%eax
 46a:	84 c0                	test   %al,%al
 46c:	74 68                	je     4d6 <strstr+0xa6>
 46e:	31 d2                	xor    %edx,%edx
 470:	83 c2 01             	add    $0x1,%edx
 473:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 477:	75 f7                	jne    470 <strstr+0x40>
 479:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 47c:	84 c0                	test   %al,%al
 47e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 481:	74 4d                	je     4d0 <strstr+0xa0>
 483:	90                   	nop
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 488:	38 45 f3             	cmp    %al,-0xd(%ebp)
 48b:	75 34                	jne    4c1 <strstr+0x91>
 48d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 490:	83 eb 01             	sub    $0x1,%ebx
 493:	74 4b                	je     4e0 <strstr+0xb0>
 495:	8b 55 0c             	mov    0xc(%ebp),%edx
 498:	89 f8                	mov    %edi,%eax
 49a:	eb 10                	jmp    4ac <strstr+0x7c>
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a0:	3a 4a 01             	cmp    0x1(%edx),%cl
 4a3:	75 1c                	jne    4c1 <strstr+0x91>
 4a5:	83 eb 01             	sub    $0x1,%ebx
 4a8:	89 f2                	mov    %esi,%edx
 4aa:	74 34                	je     4e0 <strstr+0xb0>
    p++, q++;
 4ac:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4af:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 4b2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4b5:	84 c9                	test   %cl,%cl
 4b7:	75 e7                	jne    4a0 <strstr+0x70>
 4b9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 4bd:	84 c0                	test   %al,%al
 4bf:	74 1f                	je     4e0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 4c1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 4c4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 4c7:	74 0d                	je     4d6 <strstr+0xa6>
 4c9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4cc:	84 c0                	test   %al,%al
 4ce:	75 b8                	jne    488 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4d0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 4d4:	eb e7                	jmp    4bd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 4d6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 4d9:	31 c0                	xor    %eax,%eax
}
 4db:	5b                   	pop    %ebx
 4dc:	5e                   	pop    %esi
 4dd:	5f                   	pop    %edi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 4e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 4e3:	83 c4 10             	add    $0x10,%esp
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 4e8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 4ea:	5f                   	pop    %edi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4ed:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4f4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 4fb:	e9 67 ff ff ff       	jmp    467 <strstr+0x37>

00000500 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 500:	b8 01 00 00 00       	mov    $0x1,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <exit>:
SYSCALL(exit)
 508:	b8 02 00 00 00       	mov    $0x2,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <wait>:
SYSCALL(wait)
 510:	b8 03 00 00 00       	mov    $0x3,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <pipe>:
SYSCALL(pipe)
 518:	b8 04 00 00 00       	mov    $0x4,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <read>:
SYSCALL(read)
 520:	b8 05 00 00 00       	mov    $0x5,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <write>:
SYSCALL(write)
 528:	b8 10 00 00 00       	mov    $0x10,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <close>:
SYSCALL(close)
 530:	b8 15 00 00 00       	mov    $0x15,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <kill>:
SYSCALL(kill)
 538:	b8 06 00 00 00       	mov    $0x6,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <exec>:
SYSCALL(exec)
 540:	b8 07 00 00 00       	mov    $0x7,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <open>:
SYSCALL(open)
 548:	b8 0f 00 00 00       	mov    $0xf,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <mknod>:
SYSCALL(mknod)
 550:	b8 11 00 00 00       	mov    $0x11,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <unlink>:
SYSCALL(unlink)
 558:	b8 12 00 00 00       	mov    $0x12,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <fstat>:
SYSCALL(fstat)
 560:	b8 08 00 00 00       	mov    $0x8,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <link>:
SYSCALL(link)
 568:	b8 13 00 00 00       	mov    $0x13,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <mkdir>:
SYSCALL(mkdir)
 570:	b8 14 00 00 00       	mov    $0x14,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <chdir>:
SYSCALL(chdir)
 578:	b8 09 00 00 00       	mov    $0x9,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <dup>:
SYSCALL(dup)
 580:	b8 0a 00 00 00       	mov    $0xa,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <getpid>:
SYSCALL(getpid)
 588:	b8 0b 00 00 00       	mov    $0xb,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <sbrk>:
SYSCALL(sbrk)
 590:	b8 0c 00 00 00       	mov    $0xc,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <sleep>:
SYSCALL(sleep)
 598:	b8 0d 00 00 00       	mov    $0xd,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <uptime>:
SYSCALL(uptime)
 5a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <mount>:
SYSCALL(mount)
 5a8:	b8 16 00 00 00       	mov    $0x16,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <umount>:
SYSCALL(umount)
 5b0:	b8 17 00 00 00       	mov    $0x17,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <printmounts>:
SYSCALL(printmounts)
 5b8:	b8 18 00 00 00       	mov    $0x18,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <printdevices>:
SYSCALL(printdevices)
 5c0:	b8 19 00 00 00       	mov    $0x19,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <unshare>:
SYSCALL(unshare)
 5c8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <usleep>:
SYSCALL(usleep)
 5d0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <ioctl>:
SYSCALL(ioctl)
 5d8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <getppid>:
SYSCALL(getppid)
 5e0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <getcpu>:
SYSCALL(getcpu)
 5e8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <getmem>:
SYSCALL(getmem)
 5f0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <kmemtest>:
SYSCALL(kmemtest)
 5f8:	b8 20 00 00 00       	mov    $0x20,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 609:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 60c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 60f:	85 db                	test   %ebx,%ebx
 611:	0f 84 91 00 00 00    	je     6a8 <printint+0xa8>
 617:	89 d0                	mov    %edx,%eax
 619:	c1 e8 1f             	shr    $0x1f,%eax
 61c:	84 c0                	test   %al,%al
 61e:	0f 84 84 00 00 00    	je     6a8 <printint+0xa8>
    neg = 1;
    x = -xx;
 624:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 626:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 62d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 62f:	31 ff                	xor    %edi,%edi
 631:	8d 75 c7             	lea    -0x39(%ebp),%esi
 634:	eb 0c                	jmp    642 <printint+0x42>
 636:	8d 76 00             	lea    0x0(%esi),%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 640:	89 df                	mov    %ebx,%edi
 642:	31 d2                	xor    %edx,%edx
 644:	8d 5f 01             	lea    0x1(%edi),%ebx
 647:	f7 f1                	div    %ecx
 649:	0f b6 92 54 0b 00 00 	movzbl 0xb54(%edx),%edx
  }while((x /= base) != 0);
 650:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 652:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 655:	75 e9                	jne    640 <printint+0x40>
  if(neg)
 657:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 65a:	85 c0                	test   %eax,%eax
 65c:	74 08                	je     666 <printint+0x66>
    buf[i++] = '-';
 65e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 663:	8d 5f 02             	lea    0x2(%edi),%ebx
 666:	8d 7d d8             	lea    -0x28(%ebp),%edi
 669:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 66d:	89 fa                	mov    %edi,%edx
 66f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 670:	0f b6 08             	movzbl (%eax),%ecx
 673:	83 e8 01             	sub    $0x1,%eax
 676:	83 c2 01             	add    $0x1,%edx
 679:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 67c:	39 f0                	cmp    %esi,%eax
 67e:	75 f0                	jne    670 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 680:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 683:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 688:	57                   	push   %edi
 689:	e8 f2 fa ff ff       	call   180 <strlen>
 68e:	83 c4 0c             	add    $0xc,%esp
 691:	50                   	push   %eax
 692:	57                   	push   %edi
 693:	ff 75 c0             	pushl  -0x40(%ebp)
 696:	e8 8d fe ff ff       	call   528 <write>
}
 69b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69e:	5b                   	pop    %ebx
 69f:	5e                   	pop    %esi
 6a0:	5f                   	pop    %edi
 6a1:	5d                   	pop    %ebp
 6a2:	c3                   	ret    
 6a3:	90                   	nop
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6a8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6aa:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6b1:	e9 79 ff ff ff       	jmp    62f <printint+0x2f>
 6b6:	8d 76 00             	lea    0x0(%esi),%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6cc:	0f b6 06             	movzbl (%esi),%eax
 6cf:	84 c0                	test   %al,%al
 6d1:	0f 84 90 01 00 00    	je     867 <printf+0x1a7>
 6d7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 6da:	31 ff                	xor    %edi,%edi
 6dc:	31 d2                	xor    %edx,%edx
 6de:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6e1:	31 db                	xor    %ebx,%ebx
 6e3:	eb 39                	jmp    71e <printf+0x5e>
 6e5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6e8:	83 f9 25             	cmp    $0x25,%ecx
 6eb:	0f 84 af 00 00 00    	je     7a0 <printf+0xe0>
 6f1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 6f4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6f7:	83 ec 04             	sub    $0x4,%esp
 6fa:	6a 01                	push   $0x1
 6fc:	50                   	push   %eax
 6fd:	ff 75 08             	pushl  0x8(%ebp)
 700:	e8 23 fe ff ff       	call   528 <write>
 705:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 708:	85 c0                	test   %eax,%eax
 70a:	78 35                	js     741 <printf+0x81>
 70c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 70f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 712:	01 c7                	add    %eax,%edi
 714:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 716:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 71a:	84 c0                	test   %al,%al
 71c:	74 21                	je     73f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 71e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 721:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 723:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 726:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 729:	74 bd                	je     6e8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 72b:	83 fa 25             	cmp    $0x25,%edx
 72e:	74 20                	je     750 <printf+0x90>
 730:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 732:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 735:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 737:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 73b:	84 c0                	test   %al,%al
 73d:	75 df                	jne    71e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 73f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 741:	8d 65 f4             	lea    -0xc(%ebp),%esp
 744:	5b                   	pop    %ebx
 745:	5e                   	pop    %esi
 746:	5f                   	pop    %edi
 747:	5d                   	pop    %ebp
 748:	c3                   	ret    
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 750:	83 f9 64             	cmp    $0x64,%ecx
 753:	0f 84 7f 00 00 00    	je     7d8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 759:	0f be d0             	movsbl %al,%edx
 75c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 762:	83 fa 70             	cmp    $0x70,%edx
 765:	74 49                	je     7b0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 767:	83 f9 73             	cmp    $0x73,%ecx
 76a:	0f 84 98 00 00 00    	je     808 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 770:	83 f9 63             	cmp    $0x63,%ecx
 773:	0f 84 c7 00 00 00    	je     840 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 779:	83 f9 25             	cmp    $0x25,%ecx
 77c:	74 6a                	je     7e8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 77e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 781:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 784:	83 ec 04             	sub    $0x4,%esp
 787:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 789:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 78d:	50                   	push   %eax
 78e:	ff 75 08             	pushl  0x8(%ebp)
 791:	e8 92 fd ff ff       	call   528 <write>
 796:	83 c4 10             	add    $0x10,%esp
 799:	e9 6a ff ff ff       	jmp    708 <printf+0x48>
 79e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7a0:	ba 25 00 00 00       	mov    $0x25,%edx
 7a5:	31 c0                	xor    %eax,%eax
 7a7:	eb 89                	jmp    732 <printf+0x72>
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7b8:	6a 00                	push   $0x0
 7ba:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7bd:	8b 45 08             	mov    0x8(%ebp),%eax
 7c0:	8b 16                	mov    (%esi),%edx
        ap++;
 7c2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7c5:	e8 36 fe ff ff       	call   600 <printint>
        ap++;
 7ca:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7cd:	83 c4 10             	add    $0x10,%esp
 7d0:	e9 33 ff ff ff       	jmp    708 <printf+0x48>
 7d5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 7d8:	83 ec 0c             	sub    $0xc,%esp
 7db:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e0:	6a 01                	push   $0x1
 7e2:	eb d6                	jmp    7ba <printf+0xfa>
 7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7e8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 7eb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7ee:	83 ec 04             	sub    $0x4,%esp
 7f1:	6a 01                	push   $0x1
 7f3:	50                   	push   %eax
 7f4:	ff 75 08             	pushl  0x8(%ebp)
 7f7:	e8 2c fd ff ff       	call   528 <write>
 7fc:	83 c4 10             	add    $0x10,%esp
 7ff:	e9 04 ff ff ff       	jmp    708 <printf+0x48>
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 808:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80b:	8b 30                	mov    (%eax),%esi
        ap++;
 80d:	83 c0 04             	add    $0x4,%eax
 810:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 813:	b8 4c 0b 00 00       	mov    $0xb4c,%eax
 818:	85 f6                	test   %esi,%esi
 81a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 81d:	83 ec 0c             	sub    $0xc,%esp
 820:	56                   	push   %esi
 821:	e8 5a f9 ff ff       	call   180 <strlen>
 826:	83 c4 0c             	add    $0xc,%esp
 829:	50                   	push   %eax
 82a:	56                   	push   %esi
 82b:	ff 75 08             	pushl  0x8(%ebp)
 82e:	e8 f5 fc ff ff       	call   528 <write>
 833:	83 c4 10             	add    $0x10,%esp
 836:	e9 cd fe ff ff       	jmp    708 <printf+0x48>
 83b:	90                   	nop
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 840:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 843:	83 ec 04             	sub    $0x4,%esp
 846:	8b 06                	mov    (%esi),%eax
 848:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 84a:	83 c6 04             	add    $0x4,%esi
 84d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 850:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 853:	50                   	push   %eax
 854:	ff 75 08             	pushl  0x8(%ebp)
 857:	e8 cc fc ff ff       	call   528 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 85c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 85f:	83 c4 10             	add    $0x10,%esp
 862:	e9 a1 fe ff ff       	jmp    708 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 867:	31 c0                	xor    %eax,%eax
 869:	e9 d3 fe ff ff       	jmp    741 <printf+0x81>
 86e:	66 90                	xchg   %ax,%ax

00000870 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 870:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 871:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 876:	89 e5                	mov    %esp,%ebp
 878:	57                   	push   %edi
 879:	56                   	push   %esi
 87a:	53                   	push   %ebx
 87b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 87e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 880:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 883:	39 c8                	cmp    %ecx,%eax
 885:	73 19                	jae    8a0 <free+0x30>
 887:	89 f6                	mov    %esi,%esi
 889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 890:	39 d1                	cmp    %edx,%ecx
 892:	72 1c                	jb     8b0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 894:	39 d0                	cmp    %edx,%eax
 896:	73 18                	jae    8b0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 898:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 89c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89e:	72 f0                	jb     890 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a0:	39 d0                	cmp    %edx,%eax
 8a2:	72 f4                	jb     898 <free+0x28>
 8a4:	39 d1                	cmp    %edx,%ecx
 8a6:	73 f0                	jae    898 <free+0x28>
 8a8:	90                   	nop
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8b6:	39 d7                	cmp    %edx,%edi
 8b8:	74 19                	je     8d3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8bd:	8b 50 04             	mov    0x4(%eax),%edx
 8c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c3:	39 f1                	cmp    %esi,%ecx
 8c5:	74 23                	je     8ea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8c7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8c9:	a3 00 20 00 00       	mov    %eax,0x2000
}
 8ce:	5b                   	pop    %ebx
 8cf:	5e                   	pop    %esi
 8d0:	5f                   	pop    %edi
 8d1:	5d                   	pop    %ebp
 8d2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8d3:	03 72 04             	add    0x4(%edx),%esi
 8d6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d9:	8b 10                	mov    (%eax),%edx
 8db:	8b 12                	mov    (%edx),%edx
 8dd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8e0:	8b 50 04             	mov    0x4(%eax),%edx
 8e3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e6:	39 f1                	cmp    %esi,%ecx
 8e8:	75 dd                	jne    8c7 <free+0x57>
    p->s.size += bp->s.size;
 8ea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 8ed:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8f8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8fa:	5b                   	pop    %ebx
 8fb:	5e                   	pop    %esi
 8fc:	5f                   	pop    %edi
 8fd:	5d                   	pop    %ebp
 8fe:	c3                   	ret    
 8ff:	90                   	nop

00000900 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	57                   	push   %edi
 904:	56                   	push   %esi
 905:	53                   	push   %ebx
 906:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 909:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 90c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 912:	8d 78 07             	lea    0x7(%eax),%edi
 915:	c1 ef 03             	shr    $0x3,%edi
 918:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 91b:	85 d2                	test   %edx,%edx
 91d:	0f 84 a3 00 00 00    	je     9c6 <malloc+0xc6>
 923:	8b 02                	mov    (%edx),%eax
 925:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 928:	39 cf                	cmp    %ecx,%edi
 92a:	76 74                	jbe    9a0 <malloc+0xa0>
 92c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 932:	be 00 10 00 00       	mov    $0x1000,%esi
 937:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 93e:	0f 43 f7             	cmovae %edi,%esi
 941:	ba 00 80 00 00       	mov    $0x8000,%edx
 946:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 94c:	0f 46 da             	cmovbe %edx,%ebx
 94f:	eb 10                	jmp    961 <malloc+0x61>
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 958:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 95a:	8b 48 04             	mov    0x4(%eax),%ecx
 95d:	39 cf                	cmp    %ecx,%edi
 95f:	76 3f                	jbe    9a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 961:	39 05 00 20 00 00    	cmp    %eax,0x2000
 967:	89 c2                	mov    %eax,%edx
 969:	75 ed                	jne    958 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 96b:	83 ec 0c             	sub    $0xc,%esp
 96e:	53                   	push   %ebx
 96f:	e8 1c fc ff ff       	call   590 <sbrk>
  if(p == (char*)-1)
 974:	83 c4 10             	add    $0x10,%esp
 977:	83 f8 ff             	cmp    $0xffffffff,%eax
 97a:	74 1c                	je     998 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 97c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 97f:	83 ec 0c             	sub    $0xc,%esp
 982:	83 c0 08             	add    $0x8,%eax
 985:	50                   	push   %eax
 986:	e8 e5 fe ff ff       	call   870 <free>
  return freep;
 98b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 991:	83 c4 10             	add    $0x10,%esp
 994:	85 d2                	test   %edx,%edx
 996:	75 c0                	jne    958 <malloc+0x58>
        return 0;
 998:	31 c0                	xor    %eax,%eax
 99a:	eb 1c                	jmp    9b8 <malloc+0xb8>
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a0:	39 cf                	cmp    %ecx,%edi
 9a2:	74 1c                	je     9c0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a4:	29 f9                	sub    %edi,%ecx
 9a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9ac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 9af:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 9b5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9bb:	5b                   	pop    %ebx
 9bc:	5e                   	pop    %esi
 9bd:	5f                   	pop    %edi
 9be:	5d                   	pop    %ebp
 9bf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 08                	mov    (%eax),%ecx
 9c2:	89 0a                	mov    %ecx,(%edx)
 9c4:	eb e9                	jmp    9af <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9c6:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 9cd:	20 00 00 
 9d0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 9d7:	20 00 00 
    base.s.size = 0;
 9da:	b8 04 20 00 00       	mov    $0x2004,%eax
 9df:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 9e6:	00 00 00 
 9e9:	e9 3e ff ff ff       	jmp    92c <malloc+0x2c>
 9ee:	66 90                	xchg   %ax,%ax

000009f0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 9f6:	6a 10                	push   $0x10
 9f8:	6a 02                	push   $0x2
 9fa:	ff 75 08             	pushl  0x8(%ebp)
 9fd:	e8 d6 fb ff ff       	call   5d8 <ioctl>
}
 a02:	c9                   	leave  
 a03:	c3                   	ret    
 a04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a10 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 a16:	68 00 10 00 00       	push   $0x1000
 a1b:	6a 02                	push   $0x2
 a1d:	ff 75 08             	pushl  0x8(%ebp)
 a20:	e8 b3 fb ff ff       	call   5d8 <ioctl>
}
 a25:	c9                   	leave  
 a26:	c3                   	ret    
 a27:	89 f6                	mov    %esi,%esi
 a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a30 <attach_tty>:

int
attach_tty(int tty_fd)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	53                   	push   %ebx
 a34:	83 ec 08             	sub    $0x8,%esp
 a37:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 a3a:	6a 10                	push   $0x10
 a3c:	6a 01                	push   $0x1
 a3e:	53                   	push   %ebx
 a3f:	e8 94 fb ff ff       	call   5d8 <ioctl>
 a44:	83 c4 10             	add    $0x10,%esp
 a47:	85 c0                	test   %eax,%eax
 a49:	78 55                	js     aa0 <attach_tty+0x70>
     return -1;

    close(0);
 a4b:	83 ec 0c             	sub    $0xc,%esp
 a4e:	6a 00                	push   $0x0
 a50:	e8 db fa ff ff       	call   530 <close>
    close(1);
 a55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a5c:	e8 cf fa ff ff       	call   530 <close>
    close(2);
 a61:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a68:	e8 c3 fa ff ff       	call   530 <close>
    if(dup(tty_fd) < 0)
 a6d:	89 1c 24             	mov    %ebx,(%esp)
 a70:	e8 0b fb ff ff       	call   580 <dup>
 a75:	83 c4 10             	add    $0x10,%esp
 a78:	85 c0                	test   %eax,%eax
 a7a:	78 24                	js     aa0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 a7c:	83 ec 0c             	sub    $0xc,%esp
 a7f:	53                   	push   %ebx
 a80:	e8 fb fa ff ff       	call   580 <dup>
 a85:	83 c4 10             	add    $0x10,%esp
 a88:	85 c0                	test   %eax,%eax
 a8a:	78 14                	js     aa0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 a8c:	83 ec 0c             	sub    $0xc,%esp
 a8f:	53                   	push   %ebx
 a90:	e8 eb fa ff ff       	call   580 <dup>
 a95:	83 c4 10             	add    $0x10,%esp
 a98:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 a9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a9e:	c9                   	leave  
 a9f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 aa0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 aa5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aa8:	c9                   	leave  
 aa9:	c3                   	ret    
 aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ab0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 ab6:	6a 20                	push   $0x20
 ab8:	6a 01                	push   $0x1
 aba:	ff 75 08             	pushl  0x8(%ebp)
 abd:	e8 16 fb ff ff       	call   5d8 <ioctl>
    return 0;
}
 ac2:	31 c0                	xor    %eax,%eax
 ac4:	c9                   	leave  
 ac5:	c3                   	ret    
 ac6:	8d 76 00             	lea    0x0(%esi),%esi
 ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ad0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	53                   	push   %ebx
 ad4:	83 ec 08             	sub    $0x8,%esp
 ad7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 ada:	6a 10                	push   $0x10
 adc:	6a 02                	push   $0x2
 ade:	53                   	push   %ebx
 adf:	e8 f4 fa ff ff       	call   5d8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 ae4:	83 c4 10             	add    $0x10,%esp
 ae7:	85 c0                	test   %eax,%eax
 ae9:	74 1d                	je     b08 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 aeb:	83 ec 04             	sub    $0x4,%esp
 aee:	68 00 10 00 00       	push   $0x1000
 af3:	6a 01                	push   $0x1
 af5:	53                   	push   %ebx
 af6:	e8 dd fa ff ff       	call   5d8 <ioctl>
     return tty_fd;
 afb:	83 c4 10             	add    $0x10,%esp
 afe:	89 d8                	mov    %ebx,%eax
}
 b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b03:	c9                   	leave  
 b04:	c3                   	ret    
 b05:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 b08:	83 ec 0c             	sub    $0xc,%esp
 b0b:	53                   	push   %ebx
 b0c:	e8 1f fa ff ff       	call   530 <close>
       return -1;
 b11:	83 c4 10             	add    $0x10,%esp
 b14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b19:	eb e5                	jmp    b00 <connect_tty+0x30>
 b1b:	90                   	nop
 b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b20 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
 b23:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 b26:	68 00 20 00 00       	push   $0x2000
 b2b:	6a 01                	push   $0x1
 b2d:	ff 75 08             	pushl  0x8(%ebp)
 b30:	e8 a3 fa ff ff       	call   5d8 <ioctl>
}
 b35:	c9                   	leave  
 b36:	c3                   	ret    
