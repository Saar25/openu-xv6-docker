
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 ba 04 00 00       	call   4d0 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 44 05 00 00       	call   568 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit(0);
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	6a 00                	push   $0x0
  2c:	e8 a7 04 00 00       	call   4d8 <exit>
  31:	66 90                	xchg   %ax,%ax
  33:	66 90                	xchg   %ax,%ax
  35:	66 90                	xchg   %ax,%ax
  37:	66 90                	xchg   %ax,%ax
  39:	66 90                	xchg   %ax,%ax
  3b:	66 90                	xchg   %ax,%ax
  3d:	66 90                	xchg   %ax,%ax
  3f:	90                   	nop

00000040 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  44:	8b 45 08             	mov    0x8(%ebp),%eax
  47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  4a:	89 c2                	mov    %eax,%edx
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  50:	83 c1 01             	add    $0x1,%ecx
  53:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  57:	83 c2 01             	add    $0x1,%edx
  5a:	84 db                	test   %bl,%bl
  5c:	88 5a ff             	mov    %bl,-0x1(%edx)
  5f:	75 ef                	jne    50 <strcpy+0x10>
    ;
  return os;
}
  61:	5b                   	pop    %ebx
  62:	5d                   	pop    %ebp
  63:	c3                   	ret    
  64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000070 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	56                   	push   %esi
  74:	53                   	push   %ebx
  75:	8b 55 08             	mov    0x8(%ebp),%edx
  78:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  7b:	0f b6 02             	movzbl (%edx),%eax
  7e:	0f b6 19             	movzbl (%ecx),%ebx
  81:	84 c0                	test   %al,%al
  83:	75 1e                	jne    a3 <strcmp+0x33>
  85:	eb 29                	jmp    b0 <strcmp+0x40>
  87:	89 f6                	mov    %esi,%esi
  89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  90:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  93:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  96:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  99:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  9d:	84 c0                	test   %al,%al
  9f:	74 0f                	je     b0 <strcmp+0x40>
  a1:	89 f1                	mov    %esi,%ecx
  a3:	38 d8                	cmp    %bl,%al
  a5:	74 e9                	je     90 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a7:	29 d8                	sub    %ebx,%eax
}
  a9:	5b                   	pop    %ebx
  aa:	5e                   	pop    %esi
  ab:	5d                   	pop    %ebp
  ac:	c3                   	ret    
  ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  b2:	29 d8                	sub    %ebx,%eax
}
  b4:	5b                   	pop    %ebx
  b5:	5e                   	pop    %esi
  b6:	5d                   	pop    %ebp
  b7:	c3                   	ret    
  b8:	90                   	nop
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000c0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	8b 55 08             	mov    0x8(%ebp),%edx
  c8:	53                   	push   %ebx
  c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
  cc:	0f b6 32             	movzbl (%edx),%esi
  cf:	89 f0                	mov    %esi,%eax
  d1:	84 c0                	test   %al,%al
  d3:	74 67                	je     13c <strncmp+0x7c>
  d5:	0f b6 19             	movzbl (%ecx),%ebx
  d8:	89 f0                	mov    %esi,%eax
  da:	38 d8                	cmp    %bl,%al
  dc:	75 65                	jne    143 <strncmp+0x83>
  de:	8b 5d 10             	mov    0x10(%ebp),%ebx
  e1:	89 f0                	mov    %esi,%eax
  e3:	0f b6 f0             	movzbl %al,%esi
  e6:	89 f0                	mov    %esi,%eax
  e8:	83 eb 01             	sub    $0x1,%ebx
  eb:	75 14                	jne    101 <strncmp+0x41>
  ed:	eb 25                	jmp    114 <strncmp+0x54>
  ef:	90                   	nop
  f0:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
  f4:	89 f1                	mov    %esi,%ecx
  f6:	38 c8                	cmp    %cl,%al
  f8:	75 26                	jne    120 <strncmp+0x60>
  fa:	83 eb 01             	sub    $0x1,%ebx
  fd:	89 f9                	mov    %edi,%ecx
  ff:	74 2f                	je     130 <strncmp+0x70>
    p++, q++;
 101:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 104:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 107:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 10a:	84 c0                	test   %al,%al
 10c:	75 e2                	jne    f0 <strncmp+0x30>
 10e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 112:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 114:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 115:	29 f0                	sub    %esi,%eax
}
 117:	5e                   	pop    %esi
 118:	5f                   	pop    %edi
 119:	5d                   	pop    %ebp
 11a:	c3                   	ret    
 11b:	90                   	nop
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	0f b6 f1             	movzbl %cl,%esi
 123:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 124:	29 f0                	sub    %esi,%eax
}
 126:	5e                   	pop    %esi
 127:	5f                   	pop    %edi
 128:	5d                   	pop    %ebp
 129:	c3                   	ret    
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 130:	0f b6 f0             	movzbl %al,%esi
 133:	89 f0                	mov    %esi,%eax
 135:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 136:	29 f0                	sub    %esi,%eax
}
 138:	5e                   	pop    %esi
 139:	5f                   	pop    %edi
 13a:	5d                   	pop    %ebp
 13b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 13c:	31 c0                	xor    %eax,%eax
 13e:	0f b6 31             	movzbl (%ecx),%esi
 141:	eb d1                	jmp    114 <strncmp+0x54>
 143:	0f b6 c0             	movzbl %al,%eax
 146:	0f b6 f3             	movzbl %bl,%esi
 149:	eb c9                	jmp    114 <strncmp+0x54>
 14b:	90                   	nop
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 39 00             	cmpb   $0x0,(%ecx)
 159:	74 12                	je     16d <strlen+0x1d>
 15b:	31 d2                	xor    %edx,%edx
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c2 01             	add    $0x1,%edx
 163:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 167:	89 d0                	mov    %edx,%eax
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	5d                   	pop    %ebp
 16c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 16d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	eb 0d                	jmp    180 <memset>
 173:	90                   	nop
 174:	90                   	nop
 175:	90                   	nop
 176:	90                   	nop
 177:	90                   	nop
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	89 d0                	mov    %edx,%eax
 194:	5f                   	pop    %edi
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	53                   	push   %ebx
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	74 1d                	je     1ce <strchr+0x2e>
    if(*s == c)
 1b1:	38 d3                	cmp    %dl,%bl
 1b3:	89 d9                	mov    %ebx,%ecx
 1b5:	75 0d                	jne    1c4 <strchr+0x24>
 1b7:	eb 17                	jmp    1d0 <strchr+0x30>
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c0:	38 ca                	cmp    %cl,%dl
 1c2:	74 0c                	je     1d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	0f b6 10             	movzbl (%eax),%edx
 1ca:	84 d2                	test   %dl,%dl
 1cc:	75 f2                	jne    1c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1ce:	31 c0                	xor    %eax,%eax
}
 1d0:	5b                   	pop    %ebx
 1d1:	5d                   	pop    %ebp
 1d2:	c3                   	ret    
 1d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e6:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e9:	31 db                	xor    %ebx,%ebx
 1eb:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 1f0:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 1f6:	7d 30                	jge    228 <gets+0x48>
    cc = read(0, &c, 1);
 1f8:	83 ec 04             	sub    $0x4,%esp
 1fb:	6a 01                	push   $0x1
 1fd:	56                   	push   %esi
 1fe:	6a 00                	push   $0x0
 200:	e8 eb 02 00 00       	call   4f0 <read>
    if(cc < 1)
 205:	83 c4 10             	add    $0x10,%esp
 208:	85 c0                	test   %eax,%eax
 20a:	7e e7                	jle    1f3 <gets+0x13>
      continue;
    buf[i++] = c;
 20c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 210:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 213:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 215:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 218:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 21a:	74 0c                	je     228 <gets+0x48>
 21c:	3c 0d                	cmp    $0xd,%al
 21e:	74 08                	je     228 <gets+0x48>
 220:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 223:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 226:	7c d0                	jl     1f8 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 22f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 232:	5b                   	pop    %ebx
 233:	5e                   	pop    %esi
 234:	5f                   	pop    %edi
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	pushl  0x8(%ebp)
 24d:	e8 c6 02 00 00       	call   518 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	pushl  0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 c9 02 00 00       	call   530 <fstat>
 267:	89 c6                	mov    %eax,%esi
  close(fd);
 269:	89 1c 24             	mov    %ebx,(%esp)
 26c:	e8 8f 02 00 00       	call   500 <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
 274:	89 f0                	mov    %esi,%eax
}
 276:	8d 65 f8             	lea    -0x8(%ebp),%esp
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 280:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 285:	eb ef                	jmp    276 <stat+0x36>
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 11             	movsbl (%ecx),%edx
 29a:	8d 42 d0             	lea    -0x30(%edx),%eax
 29d:	3c 09                	cmp    $0x9,%al
 29f:	b8 00 00 00 00       	mov    $0x0,%eax
 2a4:	77 1f                	ja     2c5 <atoi+0x35>
 2a6:	8d 76 00             	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2b3:	83 c1 01             	add    $0x1,%ecx
 2b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ba:	0f be 11             	movsbl (%ecx),%edx
 2bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2c5:	5b                   	pop    %ebx
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	90                   	nop
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 db                	test   %ebx,%ebx
 2e0:	7e 14                	jle    2f6 <memmove+0x26>
 2e2:	31 d2                	xor    %edx,%edx
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ef:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f2:	39 da                	cmp    %ebx,%edx
 2f4:	75 f2                	jne    2e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    
 2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
 306:	83 ec 04             	sub    $0x4,%esp
 309:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 30c:	83 f9 00             	cmp    $0x0,%ecx
 30f:	7e 76                	jle    387 <itoa+0x87>
 311:	89 cb                	mov    %ecx,%ebx
 313:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 315:	bf 67 66 66 66       	mov    $0x66666667,%edi
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 320:	89 d8                	mov    %ebx,%eax
 322:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 325:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 328:	f7 ef                	imul   %edi
 32a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 32d:	29 da                	sub    %ebx,%edx
 32f:	89 d3                	mov    %edx,%ebx
 331:	75 ed                	jne    320 <itoa+0x20>
        length++;
 333:	89 f3                	mov    %esi,%ebx
 335:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 338:	bf 67 66 66 66       	mov    $0x66666667,%edi
 33d:	8b 75 08             	mov    0x8(%ebp),%esi
 340:	eb 0a                	jmp    34c <itoa+0x4c>
 342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 348:	85 db                	test   %ebx,%ebx
 34a:	7e 25                	jle    371 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 34c:	89 c8                	mov    %ecx,%eax
 34e:	f7 ef                	imul   %edi
 350:	89 c8                	mov    %ecx,%eax
 352:	c1 f8 1f             	sar    $0x1f,%eax
 355:	c1 fa 02             	sar    $0x2,%edx
 358:	29 c2                	sub    %eax,%edx
 35a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 35d:	01 c0                	add    %eax,%eax
 35f:	29 c1                	sub    %eax,%ecx
 361:	83 c1 30             	add    $0x30,%ecx
 364:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 368:	83 eb 01             	sub    $0x1,%ebx
 36b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 36d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 36f:	7f d7                	jg     348 <itoa+0x48>
 371:	8b 75 f0             	mov    -0x10(%ebp),%esi
 374:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 376:	8b 7d 08             	mov    0x8(%ebp),%edi
 379:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 37d:	83 c4 04             	add    $0x4,%esp
 380:	89 f0                	mov    %esi,%eax
 382:	5b                   	pop    %ebx
 383:	5e                   	pop    %esi
 384:	5f                   	pop    %edi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 387:	75 12                	jne    39b <itoa+0x9b>
        buf[0] = '0';
 389:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 38c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 391:	c6 00 30             	movb   $0x30,(%eax)
 394:	b8 01 00 00 00       	mov    $0x1,%eax
 399:	eb db                	jmp    376 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 39b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 39d:	31 f6                	xor    %esi,%esi
 39f:	eb d5                	jmp    376 <itoa+0x76>
 3a1:	eb 0d                	jmp    3b0 <strcat>
 3a3:	90                   	nop
 3a4:	90                   	nop
 3a5:	90                   	nop
 3a6:	90                   	nop
 3a7:	90                   	nop
 3a8:	90                   	nop
 3a9:	90                   	nop
 3aa:	90                   	nop
 3ab:	90                   	nop
 3ac:	90                   	nop
 3ad:	90                   	nop
 3ae:	90                   	nop
 3af:	90                   	nop

000003b0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
 3b8:	53                   	push   %ebx
 3b9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 3bc:	80 38 00             	cmpb   $0x0,(%eax)
 3bf:	74 38                	je     3f9 <strcat+0x49>
 3c1:	31 c9                	xor    %ecx,%ecx
 3c3:	90                   	nop
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3c8:	83 c1 01             	add    $0x1,%ecx
 3cb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 3cf:	89 ca                	mov    %ecx,%edx
 3d1:	75 f5                	jne    3c8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 3d3:	0f b6 1e             	movzbl (%esi),%ebx
 3d6:	84 db                	test   %bl,%bl
 3d8:	74 16                	je     3f0 <strcat+0x40>
 3da:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 3dd:	31 d2                	xor    %edx,%edx
 3df:	90                   	nop
                dest[i + j] = source[j];
 3e0:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 3e3:	83 c2 01             	add    $0x1,%edx
 3e6:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 3ea:	84 db                	test   %bl,%bl
 3ec:	75 f2                	jne    3e0 <strcat+0x30>
 3ee:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 3f0:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 3f4:	5b                   	pop    %ebx
 3f5:	5e                   	pop    %esi
 3f6:	5f                   	pop    %edi
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 3f9:	31 d2                	xor    %edx,%edx
 3fb:	31 c9                	xor    %ecx,%ecx
 3fd:	eb d4                	jmp    3d3 <strcat+0x23>
 3ff:	90                   	nop

00000400 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 409:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 40c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 40f:	0f b6 00             	movzbl (%eax),%eax
 412:	84 c0                	test   %al,%al
 414:	88 45 f3             	mov    %al,-0xd(%ebp)
 417:	0f 84 a0 00 00 00    	je     4bd <strstr+0xbd>
 41d:	8b 55 0c             	mov    0xc(%ebp),%edx
 420:	31 c0                	xor    %eax,%eax
 422:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 428:	83 c0 01             	add    $0x1,%eax
 42b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 42f:	75 f7                	jne    428 <strstr+0x28>
 431:	89 45 e8             	mov    %eax,-0x18(%ebp)
 434:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 437:	0f b6 07             	movzbl (%edi),%eax
 43a:	84 c0                	test   %al,%al
 43c:	74 68                	je     4a6 <strstr+0xa6>
 43e:	31 d2                	xor    %edx,%edx
 440:	83 c2 01             	add    $0x1,%edx
 443:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 447:	75 f7                	jne    440 <strstr+0x40>
 449:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 44c:	84 c0                	test   %al,%al
 44e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 451:	74 4d                	je     4a0 <strstr+0xa0>
 453:	90                   	nop
 454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 458:	38 45 f3             	cmp    %al,-0xd(%ebp)
 45b:	75 34                	jne    491 <strstr+0x91>
 45d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 460:	83 eb 01             	sub    $0x1,%ebx
 463:	74 4b                	je     4b0 <strstr+0xb0>
 465:	8b 55 0c             	mov    0xc(%ebp),%edx
 468:	89 f8                	mov    %edi,%eax
 46a:	eb 10                	jmp    47c <strstr+0x7c>
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 470:	3a 4a 01             	cmp    0x1(%edx),%cl
 473:	75 1c                	jne    491 <strstr+0x91>
 475:	83 eb 01             	sub    $0x1,%ebx
 478:	89 f2                	mov    %esi,%edx
 47a:	74 34                	je     4b0 <strstr+0xb0>
    p++, q++;
 47c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 47f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 482:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 485:	84 c9                	test   %cl,%cl
 487:	75 e7                	jne    470 <strstr+0x70>
 489:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 48d:	84 c0                	test   %al,%al
 48f:	74 1f                	je     4b0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 491:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 494:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 497:	74 0d                	je     4a6 <strstr+0xa6>
 499:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 49c:	84 c0                	test   %al,%al
 49e:	75 b8                	jne    458 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4a0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 4a4:	eb e7                	jmp    48d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 4a6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 4a9:	31 c0                	xor    %eax,%eax
}
 4ab:	5b                   	pop    %ebx
 4ac:	5e                   	pop    %esi
 4ad:	5f                   	pop    %edi
 4ae:	5d                   	pop    %ebp
 4af:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 4b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 4b3:	83 c4 10             	add    $0x10,%esp
 4b6:	5b                   	pop    %ebx
 4b7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 4b8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 4ba:	5f                   	pop    %edi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 4c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 4cb:	e9 67 ff ff ff       	jmp    437 <strstr+0x37>

000004d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d0:	b8 01 00 00 00       	mov    $0x1,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <exit>:
SYSCALL(exit)
 4d8:	b8 02 00 00 00       	mov    $0x2,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <wait>:
SYSCALL(wait)
 4e0:	b8 03 00 00 00       	mov    $0x3,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <pipe>:
SYSCALL(pipe)
 4e8:	b8 04 00 00 00       	mov    $0x4,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <read>:
SYSCALL(read)
 4f0:	b8 05 00 00 00       	mov    $0x5,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <write>:
SYSCALL(write)
 4f8:	b8 10 00 00 00       	mov    $0x10,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <close>:
SYSCALL(close)
 500:	b8 15 00 00 00       	mov    $0x15,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <kill>:
SYSCALL(kill)
 508:	b8 06 00 00 00       	mov    $0x6,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <exec>:
SYSCALL(exec)
 510:	b8 07 00 00 00       	mov    $0x7,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <open>:
SYSCALL(open)
 518:	b8 0f 00 00 00       	mov    $0xf,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <mknod>:
SYSCALL(mknod)
 520:	b8 11 00 00 00       	mov    $0x11,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <unlink>:
SYSCALL(unlink)
 528:	b8 12 00 00 00       	mov    $0x12,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <fstat>:
SYSCALL(fstat)
 530:	b8 08 00 00 00       	mov    $0x8,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <link>:
SYSCALL(link)
 538:	b8 13 00 00 00       	mov    $0x13,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <mkdir>:
SYSCALL(mkdir)
 540:	b8 14 00 00 00       	mov    $0x14,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <chdir>:
SYSCALL(chdir)
 548:	b8 09 00 00 00       	mov    $0x9,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <dup>:
SYSCALL(dup)
 550:	b8 0a 00 00 00       	mov    $0xa,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <getpid>:
SYSCALL(getpid)
 558:	b8 0b 00 00 00       	mov    $0xb,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <sbrk>:
SYSCALL(sbrk)
 560:	b8 0c 00 00 00       	mov    $0xc,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <sleep>:
SYSCALL(sleep)
 568:	b8 0d 00 00 00       	mov    $0xd,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <uptime>:
SYSCALL(uptime)
 570:	b8 0e 00 00 00       	mov    $0xe,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <mount>:
SYSCALL(mount)
 578:	b8 16 00 00 00       	mov    $0x16,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <umount>:
SYSCALL(umount)
 580:	b8 17 00 00 00       	mov    $0x17,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <printmounts>:
SYSCALL(printmounts)
 588:	b8 18 00 00 00       	mov    $0x18,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <printdevices>:
SYSCALL(printdevices)
 590:	b8 19 00 00 00       	mov    $0x19,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <unshare>:
SYSCALL(unshare)
 598:	b8 1a 00 00 00       	mov    $0x1a,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <usleep>:
SYSCALL(usleep)
 5a0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <ioctl>:
SYSCALL(ioctl)
 5a8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <getppid>:
SYSCALL(getppid)
 5b0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <getcpu>:
SYSCALL(getcpu)
 5b8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <getmem>:
SYSCALL(getmem)
 5c0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <kmemtest>:
SYSCALL(kmemtest)
 5c8:	b8 20 00 00 00       	mov    $0x20,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 5dc:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5df:	85 db                	test   %ebx,%ebx
 5e1:	0f 84 91 00 00 00    	je     678 <printint+0xa8>
 5e7:	89 d0                	mov    %edx,%eax
 5e9:	c1 e8 1f             	shr    $0x1f,%eax
 5ec:	84 c0                	test   %al,%al
 5ee:	0f 84 84 00 00 00    	je     678 <printint+0xa8>
    neg = 1;
    x = -xx;
 5f4:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5f6:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 5fd:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 5ff:	31 ff                	xor    %edi,%edi
 601:	8d 75 c7             	lea    -0x39(%ebp),%esi
 604:	eb 0c                	jmp    612 <printint+0x42>
 606:	8d 76 00             	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 610:	89 df                	mov    %ebx,%edi
 612:	31 d2                	xor    %edx,%edx
 614:	8d 5f 01             	lea    0x1(%edi),%ebx
 617:	f7 f1                	div    %ecx
 619:	0f b6 92 10 0b 00 00 	movzbl 0xb10(%edx),%edx
  }while((x /= base) != 0);
 620:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 622:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 625:	75 e9                	jne    610 <printint+0x40>
  if(neg)
 627:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 62a:	85 c0                	test   %eax,%eax
 62c:	74 08                	je     636 <printint+0x66>
    buf[i++] = '-';
 62e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 633:	8d 5f 02             	lea    0x2(%edi),%ebx
 636:	8d 7d d8             	lea    -0x28(%ebp),%edi
 639:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 63d:	89 fa                	mov    %edi,%edx
 63f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 640:	0f b6 08             	movzbl (%eax),%ecx
 643:	83 e8 01             	sub    $0x1,%eax
 646:	83 c2 01             	add    $0x1,%edx
 649:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 64c:	39 f0                	cmp    %esi,%eax
 64e:	75 f0                	jne    640 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 650:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 653:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 658:	57                   	push   %edi
 659:	e8 f2 fa ff ff       	call   150 <strlen>
 65e:	83 c4 0c             	add    $0xc,%esp
 661:	50                   	push   %eax
 662:	57                   	push   %edi
 663:	ff 75 c0             	pushl  -0x40(%ebp)
 666:	e8 8d fe ff ff       	call   4f8 <write>
}
 66b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66e:	5b                   	pop    %ebx
 66f:	5e                   	pop    %esi
 670:	5f                   	pop    %edi
 671:	5d                   	pop    %ebp
 672:	c3                   	ret    
 673:	90                   	nop
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 678:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 67a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 681:	e9 79 ff ff ff       	jmp    5ff <printint+0x2f>
 686:	8d 76 00             	lea    0x0(%esi),%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000690 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 699:	8b 75 0c             	mov    0xc(%ebp),%esi
 69c:	0f b6 06             	movzbl (%esi),%eax
 69f:	84 c0                	test   %al,%al
 6a1:	0f 84 90 01 00 00    	je     837 <printf+0x1a7>
 6a7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 6aa:	31 ff                	xor    %edi,%edi
 6ac:	31 d2                	xor    %edx,%edx
 6ae:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6b1:	31 db                	xor    %ebx,%ebx
 6b3:	eb 39                	jmp    6ee <printf+0x5e>
 6b5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6b8:	83 f9 25             	cmp    $0x25,%ecx
 6bb:	0f 84 af 00 00 00    	je     770 <printf+0xe0>
 6c1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 6c4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6c7:	83 ec 04             	sub    $0x4,%esp
 6ca:	6a 01                	push   $0x1
 6cc:	50                   	push   %eax
 6cd:	ff 75 08             	pushl  0x8(%ebp)
 6d0:	e8 23 fe ff ff       	call   4f8 <write>
 6d5:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 6d8:	85 c0                	test   %eax,%eax
 6da:	78 35                	js     711 <printf+0x81>
 6dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6df:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 6e2:	01 c7                	add    %eax,%edi
 6e4:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6e6:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 6ea:	84 c0                	test   %al,%al
 6ec:	74 21                	je     70f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 6ee:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 6f1:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 6f3:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 6f6:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 6f9:	74 bd                	je     6b8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 6fb:	83 fa 25             	cmp    $0x25,%edx
 6fe:	74 20                	je     720 <printf+0x90>
 700:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 702:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 705:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 707:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 70b:	84 c0                	test   %al,%al
 70d:	75 df                	jne    6ee <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 70f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 711:	8d 65 f4             	lea    -0xc(%ebp),%esp
 714:	5b                   	pop    %ebx
 715:	5e                   	pop    %esi
 716:	5f                   	pop    %edi
 717:	5d                   	pop    %ebp
 718:	c3                   	ret    
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 720:	83 f9 64             	cmp    $0x64,%ecx
 723:	0f 84 7f 00 00 00    	je     7a8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 729:	0f be d0             	movsbl %al,%edx
 72c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 732:	83 fa 70             	cmp    $0x70,%edx
 735:	74 49                	je     780 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 737:	83 f9 73             	cmp    $0x73,%ecx
 73a:	0f 84 98 00 00 00    	je     7d8 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 740:	83 f9 63             	cmp    $0x63,%ecx
 743:	0f 84 c7 00 00 00    	je     810 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 749:	83 f9 25             	cmp    $0x25,%ecx
 74c:	74 6a                	je     7b8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 74e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 751:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 754:	83 ec 04             	sub    $0x4,%esp
 757:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 759:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 75d:	50                   	push   %eax
 75e:	ff 75 08             	pushl  0x8(%ebp)
 761:	e8 92 fd ff ff       	call   4f8 <write>
 766:	83 c4 10             	add    $0x10,%esp
 769:	e9 6a ff ff ff       	jmp    6d8 <printf+0x48>
 76e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 770:	ba 25 00 00 00       	mov    $0x25,%edx
 775:	31 c0                	xor    %eax,%eax
 777:	eb 89                	jmp    702 <printf+0x72>
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	b9 10 00 00 00       	mov    $0x10,%ecx
 788:	6a 00                	push   $0x0
 78a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 78d:	8b 45 08             	mov    0x8(%ebp),%eax
 790:	8b 16                	mov    (%esi),%edx
        ap++;
 792:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 795:	e8 36 fe ff ff       	call   5d0 <printint>
        ap++;
 79a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 79d:	83 c4 10             	add    $0x10,%esp
 7a0:	e9 33 ff ff ff       	jmp    6d8 <printf+0x48>
 7a5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 7a8:	83 ec 0c             	sub    $0xc,%esp
 7ab:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b0:	6a 01                	push   $0x1
 7b2:	eb d6                	jmp    78a <printf+0xfa>
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7b8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 7bb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7be:	83 ec 04             	sub    $0x4,%esp
 7c1:	6a 01                	push   $0x1
 7c3:	50                   	push   %eax
 7c4:	ff 75 08             	pushl  0x8(%ebp)
 7c7:	e8 2c fd ff ff       	call   4f8 <write>
 7cc:	83 c4 10             	add    $0x10,%esp
 7cf:	e9 04 ff ff ff       	jmp    6d8 <printf+0x48>
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 7d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7db:	8b 30                	mov    (%eax),%esi
        ap++;
 7dd:	83 c0 04             	add    $0x4,%eax
 7e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 7e3:	b8 08 0b 00 00       	mov    $0xb08,%eax
 7e8:	85 f6                	test   %esi,%esi
 7ea:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 7ed:	83 ec 0c             	sub    $0xc,%esp
 7f0:	56                   	push   %esi
 7f1:	e8 5a f9 ff ff       	call   150 <strlen>
 7f6:	83 c4 0c             	add    $0xc,%esp
 7f9:	50                   	push   %eax
 7fa:	56                   	push   %esi
 7fb:	ff 75 08             	pushl  0x8(%ebp)
 7fe:	e8 f5 fc ff ff       	call   4f8 <write>
 803:	83 c4 10             	add    $0x10,%esp
 806:	e9 cd fe ff ff       	jmp    6d8 <printf+0x48>
 80b:	90                   	nop
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 810:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 813:	83 ec 04             	sub    $0x4,%esp
 816:	8b 06                	mov    (%esi),%eax
 818:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 81a:	83 c6 04             	add    $0x4,%esi
 81d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 820:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 823:	50                   	push   %eax
 824:	ff 75 08             	pushl  0x8(%ebp)
 827:	e8 cc fc ff ff       	call   4f8 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 82c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 82f:	83 c4 10             	add    $0x10,%esp
 832:	e9 a1 fe ff ff       	jmp    6d8 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 837:	31 c0                	xor    %eax,%eax
 839:	e9 d3 fe ff ff       	jmp    711 <printf+0x81>
 83e:	66 90                	xchg   %ax,%ax

00000840 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 840:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 841:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 846:	89 e5                	mov    %esp,%ebp
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	53                   	push   %ebx
 84b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 84e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 850:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 853:	39 c8                	cmp    %ecx,%eax
 855:	73 19                	jae    870 <free+0x30>
 857:	89 f6                	mov    %esi,%esi
 859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 860:	39 d1                	cmp    %edx,%ecx
 862:	72 1c                	jb     880 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 864:	39 d0                	cmp    %edx,%eax
 866:	73 18                	jae    880 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 868:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 86c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86e:	72 f0                	jb     860 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 870:	39 d0                	cmp    %edx,%eax
 872:	72 f4                	jb     868 <free+0x28>
 874:	39 d1                	cmp    %edx,%ecx
 876:	73 f0                	jae    868 <free+0x28>
 878:	90                   	nop
 879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 880:	8b 73 fc             	mov    -0x4(%ebx),%esi
 883:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 886:	39 d7                	cmp    %edx,%edi
 888:	74 19                	je     8a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 88a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 88d:	8b 50 04             	mov    0x4(%eax),%edx
 890:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 893:	39 f1                	cmp    %esi,%ecx
 895:	74 23                	je     8ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 897:	89 08                	mov    %ecx,(%eax)
  freep = p;
 899:	a3 00 20 00 00       	mov    %eax,0x2000
}
 89e:	5b                   	pop    %ebx
 89f:	5e                   	pop    %esi
 8a0:	5f                   	pop    %edi
 8a1:	5d                   	pop    %ebp
 8a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8a3:	03 72 04             	add    0x4(%edx),%esi
 8a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a9:	8b 10                	mov    (%eax),%edx
 8ab:	8b 12                	mov    (%edx),%edx
 8ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8b0:	8b 50 04             	mov    0x4(%eax),%edx
 8b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b6:	39 f1                	cmp    %esi,%ecx
 8b8:	75 dd                	jne    897 <free+0x57>
    p->s.size += bp->s.size;
 8ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 8bd:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8ca:	5b                   	pop    %ebx
 8cb:	5e                   	pop    %esi
 8cc:	5f                   	pop    %edi
 8cd:	5d                   	pop    %ebp
 8ce:	c3                   	ret    
 8cf:	90                   	nop

000008d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8dc:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	8d 78 07             	lea    0x7(%eax),%edi
 8e5:	c1 ef 03             	shr    $0x3,%edi
 8e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8eb:	85 d2                	test   %edx,%edx
 8ed:	0f 84 a3 00 00 00    	je     996 <malloc+0xc6>
 8f3:	8b 02                	mov    (%edx),%eax
 8f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8f8:	39 cf                	cmp    %ecx,%edi
 8fa:	76 74                	jbe    970 <malloc+0xa0>
 8fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 902:	be 00 10 00 00       	mov    $0x1000,%esi
 907:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 90e:	0f 43 f7             	cmovae %edi,%esi
 911:	ba 00 80 00 00       	mov    $0x8000,%edx
 916:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 91c:	0f 46 da             	cmovbe %edx,%ebx
 91f:	eb 10                	jmp    931 <malloc+0x61>
 921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 928:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 92a:	8b 48 04             	mov    0x4(%eax),%ecx
 92d:	39 cf                	cmp    %ecx,%edi
 92f:	76 3f                	jbe    970 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 931:	39 05 00 20 00 00    	cmp    %eax,0x2000
 937:	89 c2                	mov    %eax,%edx
 939:	75 ed                	jne    928 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 93b:	83 ec 0c             	sub    $0xc,%esp
 93e:	53                   	push   %ebx
 93f:	e8 1c fc ff ff       	call   560 <sbrk>
  if(p == (char*)-1)
 944:	83 c4 10             	add    $0x10,%esp
 947:	83 f8 ff             	cmp    $0xffffffff,%eax
 94a:	74 1c                	je     968 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 94c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 94f:	83 ec 0c             	sub    $0xc,%esp
 952:	83 c0 08             	add    $0x8,%eax
 955:	50                   	push   %eax
 956:	e8 e5 fe ff ff       	call   840 <free>
  return freep;
 95b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 961:	83 c4 10             	add    $0x10,%esp
 964:	85 d2                	test   %edx,%edx
 966:	75 c0                	jne    928 <malloc+0x58>
        return 0;
 968:	31 c0                	xor    %eax,%eax
 96a:	eb 1c                	jmp    988 <malloc+0xb8>
 96c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 970:	39 cf                	cmp    %ecx,%edi
 972:	74 1c                	je     990 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 974:	29 f9                	sub    %edi,%ecx
 976:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 979:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 97c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 97f:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 985:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 988:	8d 65 f4             	lea    -0xc(%ebp),%esp
 98b:	5b                   	pop    %ebx
 98c:	5e                   	pop    %esi
 98d:	5f                   	pop    %edi
 98e:	5d                   	pop    %ebp
 98f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 990:	8b 08                	mov    (%eax),%ecx
 992:	89 0a                	mov    %ecx,(%edx)
 994:	eb e9                	jmp    97f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 996:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 99d:	20 00 00 
 9a0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 9a7:	20 00 00 
    base.s.size = 0;
 9aa:	b8 04 20 00 00       	mov    $0x2004,%eax
 9af:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 9b6:	00 00 00 
 9b9:	e9 3e ff ff ff       	jmp    8fc <malloc+0x2c>
 9be:	66 90                	xchg   %ax,%ax

000009c0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 9c6:	6a 10                	push   $0x10
 9c8:	6a 02                	push   $0x2
 9ca:	ff 75 08             	pushl  0x8(%ebp)
 9cd:	e8 d6 fb ff ff       	call   5a8 <ioctl>
}
 9d2:	c9                   	leave  
 9d3:	c3                   	ret    
 9d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000009e0 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 9e6:	68 00 10 00 00       	push   $0x1000
 9eb:	6a 02                	push   $0x2
 9ed:	ff 75 08             	pushl  0x8(%ebp)
 9f0:	e8 b3 fb ff ff       	call   5a8 <ioctl>
}
 9f5:	c9                   	leave  
 9f6:	c3                   	ret    
 9f7:	89 f6                	mov    %esi,%esi
 9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a00 <attach_tty>:

int
attach_tty(int tty_fd)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	53                   	push   %ebx
 a04:	83 ec 08             	sub    $0x8,%esp
 a07:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 a0a:	6a 10                	push   $0x10
 a0c:	6a 01                	push   $0x1
 a0e:	53                   	push   %ebx
 a0f:	e8 94 fb ff ff       	call   5a8 <ioctl>
 a14:	83 c4 10             	add    $0x10,%esp
 a17:	85 c0                	test   %eax,%eax
 a19:	78 55                	js     a70 <attach_tty+0x70>
     return -1;

    close(0);
 a1b:	83 ec 0c             	sub    $0xc,%esp
 a1e:	6a 00                	push   $0x0
 a20:	e8 db fa ff ff       	call   500 <close>
    close(1);
 a25:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a2c:	e8 cf fa ff ff       	call   500 <close>
    close(2);
 a31:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a38:	e8 c3 fa ff ff       	call   500 <close>
    if(dup(tty_fd) < 0)
 a3d:	89 1c 24             	mov    %ebx,(%esp)
 a40:	e8 0b fb ff ff       	call   550 <dup>
 a45:	83 c4 10             	add    $0x10,%esp
 a48:	85 c0                	test   %eax,%eax
 a4a:	78 24                	js     a70 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 a4c:	83 ec 0c             	sub    $0xc,%esp
 a4f:	53                   	push   %ebx
 a50:	e8 fb fa ff ff       	call   550 <dup>
 a55:	83 c4 10             	add    $0x10,%esp
 a58:	85 c0                	test   %eax,%eax
 a5a:	78 14                	js     a70 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 a5c:	83 ec 0c             	sub    $0xc,%esp
 a5f:	53                   	push   %ebx
 a60:	e8 eb fa ff ff       	call   550 <dup>
 a65:	83 c4 10             	add    $0x10,%esp
 a68:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 a6b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a6e:	c9                   	leave  
 a6f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 a70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 a75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a78:	c9                   	leave  
 a79:	c3                   	ret    
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a80 <detach_tty>:

int
detach_tty(int tty_fd)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 a86:	6a 20                	push   $0x20
 a88:	6a 01                	push   $0x1
 a8a:	ff 75 08             	pushl  0x8(%ebp)
 a8d:	e8 16 fb ff ff       	call   5a8 <ioctl>
    return 0;
}
 a92:	31 c0                	xor    %eax,%eax
 a94:	c9                   	leave  
 a95:	c3                   	ret    
 a96:	8d 76 00             	lea    0x0(%esi),%esi
 a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000aa0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	53                   	push   %ebx
 aa4:	83 ec 08             	sub    $0x8,%esp
 aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 aaa:	6a 10                	push   $0x10
 aac:	6a 02                	push   $0x2
 aae:	53                   	push   %ebx
 aaf:	e8 f4 fa ff ff       	call   5a8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 ab4:	83 c4 10             	add    $0x10,%esp
 ab7:	85 c0                	test   %eax,%eax
 ab9:	74 1d                	je     ad8 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 abb:	83 ec 04             	sub    $0x4,%esp
 abe:	68 00 10 00 00       	push   $0x1000
 ac3:	6a 01                	push   $0x1
 ac5:	53                   	push   %ebx
 ac6:	e8 dd fa ff ff       	call   5a8 <ioctl>
     return tty_fd;
 acb:	83 c4 10             	add    $0x10,%esp
 ace:	89 d8                	mov    %ebx,%eax
}
 ad0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ad3:	c9                   	leave  
 ad4:	c3                   	ret    
 ad5:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 ad8:	83 ec 0c             	sub    $0xc,%esp
 adb:	53                   	push   %ebx
 adc:	e8 1f fa ff ff       	call   500 <close>
       return -1;
 ae1:	83 c4 10             	add    $0x10,%esp
 ae4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ae9:	eb e5                	jmp    ad0 <connect_tty+0x30>
 aeb:	90                   	nop
 aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000af0 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 af6:	68 00 20 00 00       	push   $0x2000
 afb:	6a 01                	push   $0x1
 afd:	ff 75 08             	pushl  0x8(%ebp)
 b00:	e8 a3 fa ff ff       	call   5a8 <ioctl>
}
 b05:	c9                   	leave  
 b06:	c3                   	ret    
