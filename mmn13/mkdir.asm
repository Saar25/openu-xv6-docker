
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
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
  11:	bf 01 00 00 00       	mov    $0x1,%edi
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 43                	jle    69 <main+0x69>
  26:	8d 76 00             	lea    0x0(%esi),%esi
  29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "Usage: mkdir files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 56 05 00 00       	call   590 <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 14                	js     55 <main+0x55>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit(0);
  4b:	83 ec 0c             	sub    $0xc,%esp
  4e:	6a 00                	push   $0x0
  50:	e8 d3 04 00 00       	call   528 <exit>
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  55:	50                   	push   %eax
  56:	ff 33                	pushl  (%ebx)
  58:	68 6f 0b 00 00       	push   $0xb6f
  5d:	6a 02                	push   $0x2
  5f:	e8 7c 06 00 00       	call   6e0 <printf>
      break;
  64:	83 c4 10             	add    $0x10,%esp
  67:	eb e2                	jmp    4b <main+0x4b>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
  69:	52                   	push   %edx
  6a:	52                   	push   %edx
  6b:	68 58 0b 00 00       	push   $0xb58
  70:	6a 02                	push   $0x2
  72:	e8 69 06 00 00       	call   6e0 <printf>
    exit(1);
  77:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7e:	e8 a5 04 00 00       	call   528 <exit>
  83:	66 90                	xchg   %ax,%ax
  85:	66 90                	xchg   %ax,%ax
  87:	66 90                	xchg   %ax,%ax
  89:	66 90                	xchg   %ax,%ax
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 45 08             	mov    0x8(%ebp),%eax
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  9a:	89 c2                	mov    %eax,%edx
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a0:	83 c1 01             	add    $0x1,%ecx
  a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  a7:	83 c2 01             	add    $0x1,%edx
  aa:	84 db                	test   %bl,%bl
  ac:	88 5a ff             	mov    %bl,-0x1(%edx)
  af:	75 ef                	jne    a0 <strcpy+0x10>
    ;
  return os;
}
  b1:	5b                   	pop    %ebx
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    
  b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	56                   	push   %esi
  c4:	53                   	push   %ebx
  c5:	8b 55 08             	mov    0x8(%ebp),%edx
  c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  cb:	0f b6 02             	movzbl (%edx),%eax
  ce:	0f b6 19             	movzbl (%ecx),%ebx
  d1:	84 c0                	test   %al,%al
  d3:	75 1e                	jne    f3 <strcmp+0x33>
  d5:	eb 29                	jmp    100 <strcmp+0x40>
  d7:	89 f6                	mov    %esi,%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  e0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  e6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  ed:	84 c0                	test   %al,%al
  ef:	74 0f                	je     100 <strcmp+0x40>
  f1:	89 f1                	mov    %esi,%ecx
  f3:	38 d8                	cmp    %bl,%al
  f5:	74 e9                	je     e0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f7:	29 d8                	sub    %ebx,%eax
}
  f9:	5b                   	pop    %ebx
  fa:	5e                   	pop    %esi
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  fd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 100:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 102:	29 d8                	sub    %ebx,%eax
}
 104:	5b                   	pop    %ebx
 105:	5e                   	pop    %esi
 106:	5d                   	pop    %ebp
 107:	c3                   	ret    
 108:	90                   	nop
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	8b 55 08             	mov    0x8(%ebp),%edx
 118:	53                   	push   %ebx
 119:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 11c:	0f b6 32             	movzbl (%edx),%esi
 11f:	89 f0                	mov    %esi,%eax
 121:	84 c0                	test   %al,%al
 123:	74 67                	je     18c <strncmp+0x7c>
 125:	0f b6 19             	movzbl (%ecx),%ebx
 128:	89 f0                	mov    %esi,%eax
 12a:	38 d8                	cmp    %bl,%al
 12c:	75 65                	jne    193 <strncmp+0x83>
 12e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 131:	89 f0                	mov    %esi,%eax
 133:	0f b6 f0             	movzbl %al,%esi
 136:	89 f0                	mov    %esi,%eax
 138:	83 eb 01             	sub    $0x1,%ebx
 13b:	75 14                	jne    151 <strncmp+0x41>
 13d:	eb 25                	jmp    164 <strncmp+0x54>
 13f:	90                   	nop
 140:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 144:	89 f1                	mov    %esi,%ecx
 146:	38 c8                	cmp    %cl,%al
 148:	75 26                	jne    170 <strncmp+0x60>
 14a:	83 eb 01             	sub    $0x1,%ebx
 14d:	89 f9                	mov    %edi,%ecx
 14f:	74 2f                	je     180 <strncmp+0x70>
    p++, q++;
 151:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 154:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 157:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 15a:	84 c0                	test   %al,%al
 15c:	75 e2                	jne    140 <strncmp+0x30>
 15e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 162:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 164:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 165:	29 f0                	sub    %esi,%eax
}
 167:	5e                   	pop    %esi
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	0f b6 f1             	movzbl %cl,%esi
 173:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 174:	29 f0                	sub    %esi,%eax
}
 176:	5e                   	pop    %esi
 177:	5f                   	pop    %edi
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	0f b6 f0             	movzbl %al,%esi
 183:	89 f0                	mov    %esi,%eax
 185:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 186:	29 f0                	sub    %esi,%eax
}
 188:	5e                   	pop    %esi
 189:	5f                   	pop    %edi
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 18c:	31 c0                	xor    %eax,%eax
 18e:	0f b6 31             	movzbl (%ecx),%esi
 191:	eb d1                	jmp    164 <strncmp+0x54>
 193:	0f b6 c0             	movzbl %al,%eax
 196:	0f b6 f3             	movzbl %bl,%esi
 199:	eb c9                	jmp    164 <strncmp+0x54>
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 39 00             	cmpb   $0x0,(%ecx)
 1a9:	74 12                	je     1bd <strlen+0x1d>
 1ab:	31 d2                	xor    %edx,%edx
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	eb 0d                	jmp    1d0 <memset>
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	89 d0                	mov    %edx,%eax
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	74 1d                	je     21e <strchr+0x2e>
    if(*s == c)
 201:	38 d3                	cmp    %dl,%bl
 203:	89 d9                	mov    %ebx,%ecx
 205:	75 0d                	jne    214 <strchr+0x24>
 207:	eb 17                	jmp    220 <strchr+0x30>
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 210:	38 ca                	cmp    %cl,%dl
 212:	74 0c                	je     220 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 214:	83 c0 01             	add    $0x1,%eax
 217:	0f b6 10             	movzbl (%eax),%edx
 21a:	84 d2                	test   %dl,%dl
 21c:	75 f2                	jne    210 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 21e:	31 c0                	xor    %eax,%eax
}
 220:	5b                   	pop    %ebx
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 236:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 239:	31 db                	xor    %ebx,%ebx
 23b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 240:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 243:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 246:	7d 30                	jge    278 <gets+0x48>
    cc = read(0, &c, 1);
 248:	83 ec 04             	sub    $0x4,%esp
 24b:	6a 01                	push   $0x1
 24d:	56                   	push   %esi
 24e:	6a 00                	push   $0x0
 250:	e8 eb 02 00 00       	call   540 <read>
    if(cc < 1)
 255:	83 c4 10             	add    $0x10,%esp
 258:	85 c0                	test   %eax,%eax
 25a:	7e e7                	jle    243 <gets+0x13>
      continue;
    buf[i++] = c;
 25c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 260:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 263:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 265:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 268:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 26a:	74 0c                	je     278 <gets+0x48>
 26c:	3c 0d                	cmp    $0xd,%al
 26e:	74 08                	je     278 <gets+0x48>
 270:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 273:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 276:	7c d0                	jl     248 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 27f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 282:	5b                   	pop    %ebx
 283:	5e                   	pop    %esi
 284:	5f                   	pop    %edi
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 295:	83 ec 08             	sub    $0x8,%esp
 298:	6a 00                	push   $0x0
 29a:	ff 75 08             	pushl  0x8(%ebp)
 29d:	e8 c6 02 00 00       	call   568 <open>
  if(fd < 0)
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	78 27                	js     2d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	ff 75 0c             	pushl  0xc(%ebp)
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	50                   	push   %eax
 2b2:	e8 c9 02 00 00       	call   580 <fstat>
 2b7:	89 c6                	mov    %eax,%esi
  close(fd);
 2b9:	89 1c 24             	mov    %ebx,(%esp)
 2bc:	e8 8f 02 00 00       	call   550 <close>
  return r;
 2c1:	83 c4 10             	add    $0x10,%esp
 2c4:	89 f0                	mov    %esi,%eax
}
 2c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d5:	eb ef                	jmp    2c6 <stat+0x36>
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e7:	0f be 11             	movsbl (%ecx),%edx
 2ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 2ed:	3c 09                	cmp    $0x9,%al
 2ef:	b8 00 00 00 00       	mov    $0x0,%eax
 2f4:	77 1f                	ja     315 <atoi+0x35>
 2f6:	8d 76 00             	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 300:	8d 04 80             	lea    (%eax,%eax,4),%eax
 303:	83 c1 01             	add    $0x1,%ecx
 306:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 30a:	0f be 11             	movsbl (%ecx),%edx
 30d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 315:	5b                   	pop    %ebx
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    
 318:	90                   	nop
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	8b 5d 10             	mov    0x10(%ebp),%ebx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32e:	85 db                	test   %ebx,%ebx
 330:	7e 14                	jle    346 <memmove+0x26>
 332:	31 d2                	xor    %edx,%edx
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 33f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 342:	39 da                	cmp    %ebx,%edx
 344:	75 f2                	jne    338 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    
 34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000350 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 04             	sub    $0x4,%esp
 359:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 35c:	83 f9 00             	cmp    $0x0,%ecx
 35f:	7e 76                	jle    3d7 <itoa+0x87>
 361:	89 cb                	mov    %ecx,%ebx
 363:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 365:	bf 67 66 66 66       	mov    $0x66666667,%edi
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 370:	89 d8                	mov    %ebx,%eax
 372:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 375:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 378:	f7 ef                	imul   %edi
 37a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 37d:	29 da                	sub    %ebx,%edx
 37f:	89 d3                	mov    %edx,%ebx
 381:	75 ed                	jne    370 <itoa+0x20>
        length++;
 383:	89 f3                	mov    %esi,%ebx
 385:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 388:	bf 67 66 66 66       	mov    $0x66666667,%edi
 38d:	8b 75 08             	mov    0x8(%ebp),%esi
 390:	eb 0a                	jmp    39c <itoa+0x4c>
 392:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 398:	85 db                	test   %ebx,%ebx
 39a:	7e 25                	jle    3c1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 39c:	89 c8                	mov    %ecx,%eax
 39e:	f7 ef                	imul   %edi
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	c1 f8 1f             	sar    $0x1f,%eax
 3a5:	c1 fa 02             	sar    $0x2,%edx
 3a8:	29 c2                	sub    %eax,%edx
 3aa:	8d 04 92             	lea    (%edx,%edx,4),%eax
 3ad:	01 c0                	add    %eax,%eax
 3af:	29 c1                	sub    %eax,%ecx
 3b1:	83 c1 30             	add    $0x30,%ecx
 3b4:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3b8:	83 eb 01             	sub    $0x1,%ebx
 3bb:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 3bd:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3bf:	7f d7                	jg     398 <itoa+0x48>
 3c1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 3c4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 3c6:	8b 7d 08             	mov    0x8(%ebp),%edi
 3c9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 3cd:	83 c4 04             	add    $0x4,%esp
 3d0:	89 f0                	mov    %esi,%eax
 3d2:	5b                   	pop    %ebx
 3d3:	5e                   	pop    %esi
 3d4:	5f                   	pop    %edi
 3d5:	5d                   	pop    %ebp
 3d6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3d7:	75 12                	jne    3eb <itoa+0x9b>
        buf[0] = '0';
 3d9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 3dc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 3e1:	c6 00 30             	movb   $0x30,(%eax)
 3e4:	b8 01 00 00 00       	mov    $0x1,%eax
 3e9:	eb db                	jmp    3c6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3eb:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 3ed:	31 f6                	xor    %esi,%esi
 3ef:	eb d5                	jmp    3c6 <itoa+0x76>
 3f1:	eb 0d                	jmp    400 <strcat>
 3f3:	90                   	nop
 3f4:	90                   	nop
 3f5:	90                   	nop
 3f6:	90                   	nop
 3f7:	90                   	nop
 3f8:	90                   	nop
 3f9:	90                   	nop
 3fa:	90                   	nop
 3fb:	90                   	nop
 3fc:	90                   	nop
 3fd:	90                   	nop
 3fe:	90                   	nop
 3ff:	90                   	nop

00000400 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	53                   	push   %ebx
 409:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 40c:	80 38 00             	cmpb   $0x0,(%eax)
 40f:	74 38                	je     449 <strcat+0x49>
 411:	31 c9                	xor    %ecx,%ecx
 413:	90                   	nop
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 418:	83 c1 01             	add    $0x1,%ecx
 41b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 41f:	89 ca                	mov    %ecx,%edx
 421:	75 f5                	jne    418 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 423:	0f b6 1e             	movzbl (%esi),%ebx
 426:	84 db                	test   %bl,%bl
 428:	74 16                	je     440 <strcat+0x40>
 42a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 42d:	31 d2                	xor    %edx,%edx
 42f:	90                   	nop
                dest[i + j] = source[j];
 430:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 433:	83 c2 01             	add    $0x1,%edx
 436:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 43a:	84 db                	test   %bl,%bl
 43c:	75 f2                	jne    430 <strcat+0x30>
 43e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 440:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 444:	5b                   	pop    %ebx
 445:	5e                   	pop    %esi
 446:	5f                   	pop    %edi
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 449:	31 d2                	xor    %edx,%edx
 44b:	31 c9                	xor    %ecx,%ecx
 44d:	eb d4                	jmp    423 <strcat+0x23>
 44f:	90                   	nop

00000450 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 459:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 45c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 45f:	0f b6 00             	movzbl (%eax),%eax
 462:	84 c0                	test   %al,%al
 464:	88 45 f3             	mov    %al,-0xd(%ebp)
 467:	0f 84 a0 00 00 00    	je     50d <strstr+0xbd>
 46d:	8b 55 0c             	mov    0xc(%ebp),%edx
 470:	31 c0                	xor    %eax,%eax
 472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 478:	83 c0 01             	add    $0x1,%eax
 47b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 47f:	75 f7                	jne    478 <strstr+0x28>
 481:	89 45 e8             	mov    %eax,-0x18(%ebp)
 484:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 487:	0f b6 07             	movzbl (%edi),%eax
 48a:	84 c0                	test   %al,%al
 48c:	74 68                	je     4f6 <strstr+0xa6>
 48e:	31 d2                	xor    %edx,%edx
 490:	83 c2 01             	add    $0x1,%edx
 493:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 497:	75 f7                	jne    490 <strstr+0x40>
 499:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 49c:	84 c0                	test   %al,%al
 49e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 4a1:	74 4d                	je     4f0 <strstr+0xa0>
 4a3:	90                   	nop
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a8:	38 45 f3             	cmp    %al,-0xd(%ebp)
 4ab:	75 34                	jne    4e1 <strstr+0x91>
 4ad:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 4b0:	83 eb 01             	sub    $0x1,%ebx
 4b3:	74 4b                	je     500 <strstr+0xb0>
 4b5:	8b 55 0c             	mov    0xc(%ebp),%edx
 4b8:	89 f8                	mov    %edi,%eax
 4ba:	eb 10                	jmp    4cc <strstr+0x7c>
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c0:	3a 4a 01             	cmp    0x1(%edx),%cl
 4c3:	75 1c                	jne    4e1 <strstr+0x91>
 4c5:	83 eb 01             	sub    $0x1,%ebx
 4c8:	89 f2                	mov    %esi,%edx
 4ca:	74 34                	je     500 <strstr+0xb0>
    p++, q++;
 4cc:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4cf:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 4d2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4d5:	84 c9                	test   %cl,%cl
 4d7:	75 e7                	jne    4c0 <strstr+0x70>
 4d9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 4dd:	84 c0                	test   %al,%al
 4df:	74 1f                	je     500 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 4e1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 4e4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 4e7:	74 0d                	je     4f6 <strstr+0xa6>
 4e9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4ec:	84 c0                	test   %al,%al
 4ee:	75 b8                	jne    4a8 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4f0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 4f4:	eb e7                	jmp    4dd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 4f6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 4f9:	31 c0                	xor    %eax,%eax
}
 4fb:	5b                   	pop    %ebx
 4fc:	5e                   	pop    %esi
 4fd:	5f                   	pop    %edi
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 500:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 503:	83 c4 10             	add    $0x10,%esp
 506:	5b                   	pop    %ebx
 507:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 508:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 50a:	5f                   	pop    %edi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 50d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 514:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 51b:	e9 67 ff ff ff       	jmp    487 <strstr+0x37>

00000520 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 520:	b8 01 00 00 00       	mov    $0x1,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <exit>:
SYSCALL(exit)
 528:	b8 02 00 00 00       	mov    $0x2,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <wait>:
SYSCALL(wait)
 530:	b8 03 00 00 00       	mov    $0x3,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <pipe>:
SYSCALL(pipe)
 538:	b8 04 00 00 00       	mov    $0x4,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <read>:
SYSCALL(read)
 540:	b8 05 00 00 00       	mov    $0x5,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <write>:
SYSCALL(write)
 548:	b8 10 00 00 00       	mov    $0x10,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <close>:
SYSCALL(close)
 550:	b8 15 00 00 00       	mov    $0x15,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <kill>:
SYSCALL(kill)
 558:	b8 06 00 00 00       	mov    $0x6,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <exec>:
SYSCALL(exec)
 560:	b8 07 00 00 00       	mov    $0x7,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <open>:
SYSCALL(open)
 568:	b8 0f 00 00 00       	mov    $0xf,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <mknod>:
SYSCALL(mknod)
 570:	b8 11 00 00 00       	mov    $0x11,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <unlink>:
SYSCALL(unlink)
 578:	b8 12 00 00 00       	mov    $0x12,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <fstat>:
SYSCALL(fstat)
 580:	b8 08 00 00 00       	mov    $0x8,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <link>:
SYSCALL(link)
 588:	b8 13 00 00 00       	mov    $0x13,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <mkdir>:
SYSCALL(mkdir)
 590:	b8 14 00 00 00       	mov    $0x14,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <chdir>:
SYSCALL(chdir)
 598:	b8 09 00 00 00       	mov    $0x9,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <dup>:
SYSCALL(dup)
 5a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <getpid>:
SYSCALL(getpid)
 5a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <sbrk>:
SYSCALL(sbrk)
 5b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <sleep>:
SYSCALL(sleep)
 5b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <uptime>:
SYSCALL(uptime)
 5c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <mount>:
SYSCALL(mount)
 5c8:	b8 16 00 00 00       	mov    $0x16,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <umount>:
SYSCALL(umount)
 5d0:	b8 17 00 00 00       	mov    $0x17,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <printmounts>:
SYSCALL(printmounts)
 5d8:	b8 18 00 00 00       	mov    $0x18,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <printdevices>:
SYSCALL(printdevices)
 5e0:	b8 19 00 00 00       	mov    $0x19,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <unshare>:
SYSCALL(unshare)
 5e8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <usleep>:
SYSCALL(usleep)
 5f0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <ioctl>:
SYSCALL(ioctl)
 5f8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <getppid>:
SYSCALL(getppid)
 600:	b8 1d 00 00 00       	mov    $0x1d,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <getcpu>:
SYSCALL(getcpu)
 608:	b8 1e 00 00 00       	mov    $0x1e,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <getmem>:
SYSCALL(getmem)
 610:	b8 1f 00 00 00       	mov    $0x1f,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <kmemtest>:
SYSCALL(kmemtest)
 618:	b8 20 00 00 00       	mov    $0x20,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 629:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 62c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 62f:	85 db                	test   %ebx,%ebx
 631:	0f 84 91 00 00 00    	je     6c8 <printint+0xa8>
 637:	89 d0                	mov    %edx,%eax
 639:	c1 e8 1f             	shr    $0x1f,%eax
 63c:	84 c0                	test   %al,%al
 63e:	0f 84 84 00 00 00    	je     6c8 <printint+0xa8>
    neg = 1;
    x = -xx;
 644:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 646:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 64d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 64f:	31 ff                	xor    %edi,%edi
 651:	8d 75 c7             	lea    -0x39(%ebp),%esi
 654:	eb 0c                	jmp    662 <printint+0x42>
 656:	8d 76 00             	lea    0x0(%esi),%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 660:	89 df                	mov    %ebx,%edi
 662:	31 d2                	xor    %edx,%edx
 664:	8d 5f 01             	lea    0x1(%edi),%ebx
 667:	f7 f1                	div    %ecx
 669:	0f b6 92 94 0b 00 00 	movzbl 0xb94(%edx),%edx
  }while((x /= base) != 0);
 670:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 672:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 675:	75 e9                	jne    660 <printint+0x40>
  if(neg)
 677:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 67a:	85 c0                	test   %eax,%eax
 67c:	74 08                	je     686 <printint+0x66>
    buf[i++] = '-';
 67e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 683:	8d 5f 02             	lea    0x2(%edi),%ebx
 686:	8d 7d d8             	lea    -0x28(%ebp),%edi
 689:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 68d:	89 fa                	mov    %edi,%edx
 68f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 690:	0f b6 08             	movzbl (%eax),%ecx
 693:	83 e8 01             	sub    $0x1,%eax
 696:	83 c2 01             	add    $0x1,%edx
 699:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 69c:	39 f0                	cmp    %esi,%eax
 69e:	75 f0                	jne    690 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 6a0:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 6a3:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 6a8:	57                   	push   %edi
 6a9:	e8 f2 fa ff ff       	call   1a0 <strlen>
 6ae:	83 c4 0c             	add    $0xc,%esp
 6b1:	50                   	push   %eax
 6b2:	57                   	push   %edi
 6b3:	ff 75 c0             	pushl  -0x40(%ebp)
 6b6:	e8 8d fe ff ff       	call   548 <write>
}
 6bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6be:	5b                   	pop    %ebx
 6bf:	5e                   	pop    %esi
 6c0:	5f                   	pop    %edi
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    
 6c3:	90                   	nop
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6c8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6ca:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6d1:	e9 79 ff ff ff       	jmp    64f <printint+0x2f>
 6d6:	8d 76 00             	lea    0x0(%esi),%esi
 6d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6ec:	0f b6 06             	movzbl (%esi),%eax
 6ef:	84 c0                	test   %al,%al
 6f1:	0f 84 90 01 00 00    	je     887 <printf+0x1a7>
 6f7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 6fa:	31 ff                	xor    %edi,%edi
 6fc:	31 d2                	xor    %edx,%edx
 6fe:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 701:	31 db                	xor    %ebx,%ebx
 703:	eb 39                	jmp    73e <printf+0x5e>
 705:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 708:	83 f9 25             	cmp    $0x25,%ecx
 70b:	0f 84 af 00 00 00    	je     7c0 <printf+0xe0>
 711:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 714:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 717:	83 ec 04             	sub    $0x4,%esp
 71a:	6a 01                	push   $0x1
 71c:	50                   	push   %eax
 71d:	ff 75 08             	pushl  0x8(%ebp)
 720:	e8 23 fe ff ff       	call   548 <write>
 725:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 728:	85 c0                	test   %eax,%eax
 72a:	78 35                	js     761 <printf+0x81>
 72c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 72f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 732:	01 c7                	add    %eax,%edi
 734:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 736:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 73a:	84 c0                	test   %al,%al
 73c:	74 21                	je     75f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 73e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 741:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 743:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 746:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 749:	74 bd                	je     708 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 74b:	83 fa 25             	cmp    $0x25,%edx
 74e:	74 20                	je     770 <printf+0x90>
 750:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 752:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 755:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 757:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 75b:	84 c0                	test   %al,%al
 75d:	75 df                	jne    73e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 75f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 761:	8d 65 f4             	lea    -0xc(%ebp),%esp
 764:	5b                   	pop    %ebx
 765:	5e                   	pop    %esi
 766:	5f                   	pop    %edi
 767:	5d                   	pop    %ebp
 768:	c3                   	ret    
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 770:	83 f9 64             	cmp    $0x64,%ecx
 773:	0f 84 7f 00 00 00    	je     7f8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 779:	0f be d0             	movsbl %al,%edx
 77c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 782:	83 fa 70             	cmp    $0x70,%edx
 785:	74 49                	je     7d0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 787:	83 f9 73             	cmp    $0x73,%ecx
 78a:	0f 84 98 00 00 00    	je     828 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 790:	83 f9 63             	cmp    $0x63,%ecx
 793:	0f 84 c7 00 00 00    	je     860 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 799:	83 f9 25             	cmp    $0x25,%ecx
 79c:	74 6a                	je     808 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 79e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 7a1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7a4:	83 ec 04             	sub    $0x4,%esp
 7a7:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 7a9:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 7ad:	50                   	push   %eax
 7ae:	ff 75 08             	pushl  0x8(%ebp)
 7b1:	e8 92 fd ff ff       	call   548 <write>
 7b6:	83 c4 10             	add    $0x10,%esp
 7b9:	e9 6a ff ff ff       	jmp    728 <printf+0x48>
 7be:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7c0:	ba 25 00 00 00       	mov    $0x25,%edx
 7c5:	31 c0                	xor    %eax,%eax
 7c7:	eb 89                	jmp    752 <printf+0x72>
 7c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d8:	6a 00                	push   $0x0
 7da:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	8b 16                	mov    (%esi),%edx
        ap++;
 7e2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7e5:	e8 36 fe ff ff       	call   620 <printint>
        ap++;
 7ea:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7ed:	83 c4 10             	add    $0x10,%esp
 7f0:	e9 33 ff ff ff       	jmp    728 <printf+0x48>
 7f5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 7f8:	83 ec 0c             	sub    $0xc,%esp
 7fb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 800:	6a 01                	push   $0x1
 802:	eb d6                	jmp    7da <printf+0xfa>
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 808:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 80b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 80e:	83 ec 04             	sub    $0x4,%esp
 811:	6a 01                	push   $0x1
 813:	50                   	push   %eax
 814:	ff 75 08             	pushl  0x8(%ebp)
 817:	e8 2c fd ff ff       	call   548 <write>
 81c:	83 c4 10             	add    $0x10,%esp
 81f:	e9 04 ff ff ff       	jmp    728 <printf+0x48>
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 828:	8b 45 d0             	mov    -0x30(%ebp),%eax
 82b:	8b 30                	mov    (%eax),%esi
        ap++;
 82d:	83 c0 04             	add    $0x4,%eax
 830:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 833:	b8 8b 0b 00 00       	mov    $0xb8b,%eax
 838:	85 f6                	test   %esi,%esi
 83a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 83d:	83 ec 0c             	sub    $0xc,%esp
 840:	56                   	push   %esi
 841:	e8 5a f9 ff ff       	call   1a0 <strlen>
 846:	83 c4 0c             	add    $0xc,%esp
 849:	50                   	push   %eax
 84a:	56                   	push   %esi
 84b:	ff 75 08             	pushl  0x8(%ebp)
 84e:	e8 f5 fc ff ff       	call   548 <write>
 853:	83 c4 10             	add    $0x10,%esp
 856:	e9 cd fe ff ff       	jmp    728 <printf+0x48>
 85b:	90                   	nop
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 860:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 863:	83 ec 04             	sub    $0x4,%esp
 866:	8b 06                	mov    (%esi),%eax
 868:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 86a:	83 c6 04             	add    $0x4,%esi
 86d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 870:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 873:	50                   	push   %eax
 874:	ff 75 08             	pushl  0x8(%ebp)
 877:	e8 cc fc ff ff       	call   548 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 87c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 87f:	83 c4 10             	add    $0x10,%esp
 882:	e9 a1 fe ff ff       	jmp    728 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 887:	31 c0                	xor    %eax,%eax
 889:	e9 d3 fe ff ff       	jmp    761 <printf+0x81>
 88e:	66 90                	xchg   %ax,%ax

00000890 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 890:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 896:	89 e5                	mov    %esp,%ebp
 898:	57                   	push   %edi
 899:	56                   	push   %esi
 89a:	53                   	push   %ebx
 89b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 89e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a3:	39 c8                	cmp    %ecx,%eax
 8a5:	73 19                	jae    8c0 <free+0x30>
 8a7:	89 f6                	mov    %esi,%esi
 8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8b0:	39 d1                	cmp    %edx,%ecx
 8b2:	72 1c                	jb     8d0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b4:	39 d0                	cmp    %edx,%eax
 8b6:	73 18                	jae    8d0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8bc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8be:	72 f0                	jb     8b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c0:	39 d0                	cmp    %edx,%eax
 8c2:	72 f4                	jb     8b8 <free+0x28>
 8c4:	39 d1                	cmp    %edx,%ecx
 8c6:	73 f0                	jae    8b8 <free+0x28>
 8c8:	90                   	nop
 8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d6:	39 d7                	cmp    %edx,%edi
 8d8:	74 19                	je     8f3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8dd:	8b 50 04             	mov    0x4(%eax),%edx
 8e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e3:	39 f1                	cmp    %esi,%ecx
 8e5:	74 23                	je     90a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8e9:	a3 00 20 00 00       	mov    %eax,0x2000
}
 8ee:	5b                   	pop    %ebx
 8ef:	5e                   	pop    %esi
 8f0:	5f                   	pop    %edi
 8f1:	5d                   	pop    %ebp
 8f2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8f3:	03 72 04             	add    0x4(%edx),%esi
 8f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f9:	8b 10                	mov    (%eax),%edx
 8fb:	8b 12                	mov    (%edx),%edx
 8fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 900:	8b 50 04             	mov    0x4(%eax),%edx
 903:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 906:	39 f1                	cmp    %esi,%ecx
 908:	75 dd                	jne    8e7 <free+0x57>
    p->s.size += bp->s.size;
 90a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 90d:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 912:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 915:	8b 53 f8             	mov    -0x8(%ebx),%edx
 918:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 91a:	5b                   	pop    %ebx
 91b:	5e                   	pop    %esi
 91c:	5f                   	pop    %edi
 91d:	5d                   	pop    %ebp
 91e:	c3                   	ret    
 91f:	90                   	nop

00000920 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 929:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 92c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 932:	8d 78 07             	lea    0x7(%eax),%edi
 935:	c1 ef 03             	shr    $0x3,%edi
 938:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 93b:	85 d2                	test   %edx,%edx
 93d:	0f 84 a3 00 00 00    	je     9e6 <malloc+0xc6>
 943:	8b 02                	mov    (%edx),%eax
 945:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 948:	39 cf                	cmp    %ecx,%edi
 94a:	76 74                	jbe    9c0 <malloc+0xa0>
 94c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 952:	be 00 10 00 00       	mov    $0x1000,%esi
 957:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 95e:	0f 43 f7             	cmovae %edi,%esi
 961:	ba 00 80 00 00       	mov    $0x8000,%edx
 966:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 96c:	0f 46 da             	cmovbe %edx,%ebx
 96f:	eb 10                	jmp    981 <malloc+0x61>
 971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 978:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 97a:	8b 48 04             	mov    0x4(%eax),%ecx
 97d:	39 cf                	cmp    %ecx,%edi
 97f:	76 3f                	jbe    9c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 981:	39 05 00 20 00 00    	cmp    %eax,0x2000
 987:	89 c2                	mov    %eax,%edx
 989:	75 ed                	jne    978 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 98b:	83 ec 0c             	sub    $0xc,%esp
 98e:	53                   	push   %ebx
 98f:	e8 1c fc ff ff       	call   5b0 <sbrk>
  if(p == (char*)-1)
 994:	83 c4 10             	add    $0x10,%esp
 997:	83 f8 ff             	cmp    $0xffffffff,%eax
 99a:	74 1c                	je     9b8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 99c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 99f:	83 ec 0c             	sub    $0xc,%esp
 9a2:	83 c0 08             	add    $0x8,%eax
 9a5:	50                   	push   %eax
 9a6:	e8 e5 fe ff ff       	call   890 <free>
  return freep;
 9ab:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 9b1:	83 c4 10             	add    $0x10,%esp
 9b4:	85 d2                	test   %edx,%edx
 9b6:	75 c0                	jne    978 <malloc+0x58>
        return 0;
 9b8:	31 c0                	xor    %eax,%eax
 9ba:	eb 1c                	jmp    9d8 <malloc+0xb8>
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9c0:	39 cf                	cmp    %ecx,%edi
 9c2:	74 1c                	je     9e0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9c4:	29 f9                	sub    %edi,%ecx
 9c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9cc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 9cf:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 9d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9db:	5b                   	pop    %ebx
 9dc:	5e                   	pop    %esi
 9dd:	5f                   	pop    %edi
 9de:	5d                   	pop    %ebp
 9df:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 9e0:	8b 08                	mov    (%eax),%ecx
 9e2:	89 0a                	mov    %ecx,(%edx)
 9e4:	eb e9                	jmp    9cf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9e6:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 9ed:	20 00 00 
 9f0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 9f7:	20 00 00 
    base.s.size = 0;
 9fa:	b8 04 20 00 00       	mov    $0x2004,%eax
 9ff:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 a06:	00 00 00 
 a09:	e9 3e ff ff ff       	jmp    94c <malloc+0x2c>
 a0e:	66 90                	xchg   %ax,%ax

00000a10 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 a16:	6a 10                	push   $0x10
 a18:	6a 02                	push   $0x2
 a1a:	ff 75 08             	pushl  0x8(%ebp)
 a1d:	e8 d6 fb ff ff       	call   5f8 <ioctl>
}
 a22:	c9                   	leave  
 a23:	c3                   	ret    
 a24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a30 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 a36:	68 00 10 00 00       	push   $0x1000
 a3b:	6a 02                	push   $0x2
 a3d:	ff 75 08             	pushl  0x8(%ebp)
 a40:	e8 b3 fb ff ff       	call   5f8 <ioctl>
}
 a45:	c9                   	leave  
 a46:	c3                   	ret    
 a47:	89 f6                	mov    %esi,%esi
 a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a50 <attach_tty>:

int
attach_tty(int tty_fd)
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	53                   	push   %ebx
 a54:	83 ec 08             	sub    $0x8,%esp
 a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 a5a:	6a 10                	push   $0x10
 a5c:	6a 01                	push   $0x1
 a5e:	53                   	push   %ebx
 a5f:	e8 94 fb ff ff       	call   5f8 <ioctl>
 a64:	83 c4 10             	add    $0x10,%esp
 a67:	85 c0                	test   %eax,%eax
 a69:	78 55                	js     ac0 <attach_tty+0x70>
     return -1;

    close(0);
 a6b:	83 ec 0c             	sub    $0xc,%esp
 a6e:	6a 00                	push   $0x0
 a70:	e8 db fa ff ff       	call   550 <close>
    close(1);
 a75:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a7c:	e8 cf fa ff ff       	call   550 <close>
    close(2);
 a81:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a88:	e8 c3 fa ff ff       	call   550 <close>
    if(dup(tty_fd) < 0)
 a8d:	89 1c 24             	mov    %ebx,(%esp)
 a90:	e8 0b fb ff ff       	call   5a0 <dup>
 a95:	83 c4 10             	add    $0x10,%esp
 a98:	85 c0                	test   %eax,%eax
 a9a:	78 24                	js     ac0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 a9c:	83 ec 0c             	sub    $0xc,%esp
 a9f:	53                   	push   %ebx
 aa0:	e8 fb fa ff ff       	call   5a0 <dup>
 aa5:	83 c4 10             	add    $0x10,%esp
 aa8:	85 c0                	test   %eax,%eax
 aaa:	78 14                	js     ac0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 aac:	83 ec 0c             	sub    $0xc,%esp
 aaf:	53                   	push   %ebx
 ab0:	e8 eb fa ff ff       	call   5a0 <dup>
 ab5:	83 c4 10             	add    $0x10,%esp
 ab8:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 abb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 abe:	c9                   	leave  
 abf:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 ac0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 ac5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ac8:	c9                   	leave  
 ac9:	c3                   	ret    
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ad0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 ad6:	6a 20                	push   $0x20
 ad8:	6a 01                	push   $0x1
 ada:	ff 75 08             	pushl  0x8(%ebp)
 add:	e8 16 fb ff ff       	call   5f8 <ioctl>
    return 0;
}
 ae2:	31 c0                	xor    %eax,%eax
 ae4:	c9                   	leave  
 ae5:	c3                   	ret    
 ae6:	8d 76 00             	lea    0x0(%esi),%esi
 ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000af0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	53                   	push   %ebx
 af4:	83 ec 08             	sub    $0x8,%esp
 af7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 afa:	6a 10                	push   $0x10
 afc:	6a 02                	push   $0x2
 afe:	53                   	push   %ebx
 aff:	e8 f4 fa ff ff       	call   5f8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 b04:	83 c4 10             	add    $0x10,%esp
 b07:	85 c0                	test   %eax,%eax
 b09:	74 1d                	je     b28 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 b0b:	83 ec 04             	sub    $0x4,%esp
 b0e:	68 00 10 00 00       	push   $0x1000
 b13:	6a 01                	push   $0x1
 b15:	53                   	push   %ebx
 b16:	e8 dd fa ff ff       	call   5f8 <ioctl>
     return tty_fd;
 b1b:	83 c4 10             	add    $0x10,%esp
 b1e:	89 d8                	mov    %ebx,%eax
}
 b20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b23:	c9                   	leave  
 b24:	c3                   	ret    
 b25:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 b28:	83 ec 0c             	sub    $0xc,%esp
 b2b:	53                   	push   %ebx
 b2c:	e8 1f fa ff ff       	call   550 <close>
       return -1;
 b31:	83 c4 10             	add    $0x10,%esp
 b34:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b39:	eb e5                	jmp    b20 <connect_tty+0x30>
 b3b:	90                   	nop
 b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b40 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 b46:	68 00 20 00 00       	push   $0x2000
 b4b:	6a 01                	push   $0x1
 b4d:	ff 75 08             	pushl  0x8(%ebp)
 b50:	e8 a3 fa ff ff       	call   5f8 <ioctl>
}
 b55:	c9                   	leave  
 b56:	c3                   	ret    
