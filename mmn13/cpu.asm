
_cpu:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
    int microseconds = 0;

    if (argc != 2) {
  13:	83 39 02             	cmpl   $0x2,(%ecx)
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
  16:	8b 41 04             	mov    0x4(%ecx),%eax
    int microseconds = 0;

    if (argc != 2) {
  19:	74 1d                	je     38 <main+0x38>
        printf(2, "usage: %s [sleep_microseconds]\n", argv[0]);
  1b:	83 ec 04             	sub    $0x4,%esp
  1e:	ff 30                	pushl  (%eax)
  20:	68 68 0b 00 00       	push   $0xb68
  25:	6a 02                	push   $0x2
  27:	e8 c4 06 00 00       	call   6f0 <printf>
        exit(1);
  2c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  33:	e8 00 05 00 00       	call   538 <exit>
    }

    microseconds = atoi(argv[1]);
  38:	83 ec 0c             	sub    $0xc,%esp
  3b:	ff 70 04             	pushl  0x4(%eax)
  3e:	e8 ad 02 00 00       	call   2f0 <atoi>
  43:	83 c4 10             	add    $0x10,%esp
  46:	89 c6                	mov    %eax,%esi
  48:	90                   	nop
  49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    while (1) {
        printf(1, "cpu time: %d, cpu percent: %d\n",
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 ea 03 00 00       	push   $0x3ea
  58:	6a ff                	push   $0xffffffff
  5a:	e8 a9 05 00 00       	call   608 <ioctl>
  5f:	89 c3                	mov    %eax,%ebx
  61:	58                   	pop    %eax
  62:	5a                   	pop    %edx
  63:	68 e9 03 00 00       	push   $0x3e9
  68:	6a ff                	push   $0xffffffff
  6a:	e8 99 05 00 00       	call   608 <ioctl>
  6f:	53                   	push   %ebx
  70:	50                   	push   %eax
  71:	68 88 0b 00 00       	push   $0xb88
  76:	6a 01                	push   $0x1
  78:	e8 73 06 00 00       	call   6f0 <printf>
               ioctl(-1, IOCTL_GET_PROCESS_CPU_TIME),
               ioctl(-1, IOCTL_GET_PROCESS_CPU_PERCENT));
        if (microseconds) {
  7d:	83 c4 20             	add    $0x20,%esp
  80:	85 f6                	test   %esi,%esi
  82:	74 cc                	je     50 <main+0x50>
            usleep(microseconds);
  84:	83 ec 0c             	sub    $0xc,%esp
  87:	56                   	push   %esi
  88:	e8 73 05 00 00       	call   600 <usleep>
  8d:	83 c4 10             	add    $0x10,%esp
  90:	eb be                	jmp    50 <main+0x50>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	56                   	push   %esi
  d4:	53                   	push   %ebx
  d5:	8b 55 08             	mov    0x8(%ebp),%edx
  d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  db:	0f b6 02             	movzbl (%edx),%eax
  de:	0f b6 19             	movzbl (%ecx),%ebx
  e1:	84 c0                	test   %al,%al
  e3:	75 1e                	jne    103 <strcmp+0x33>
  e5:	eb 29                	jmp    110 <strcmp+0x40>
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  f0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  f6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  fd:	84 c0                	test   %al,%al
  ff:	74 0f                	je     110 <strcmp+0x40>
 101:	89 f1                	mov    %esi,%ecx
 103:	38 d8                	cmp    %bl,%al
 105:	74 e9                	je     f0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 107:	29 d8                	sub    %ebx,%eax
}
 109:	5b                   	pop    %ebx
 10a:	5e                   	pop    %esi
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 110:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 112:	29 d8                	sub    %ebx,%eax
}
 114:	5b                   	pop    %ebx
 115:	5e                   	pop    %esi
 116:	5d                   	pop    %ebp
 117:	c3                   	ret    
 118:	90                   	nop
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000120 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	8b 55 08             	mov    0x8(%ebp),%edx
 128:	53                   	push   %ebx
 129:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 12c:	0f b6 32             	movzbl (%edx),%esi
 12f:	89 f0                	mov    %esi,%eax
 131:	84 c0                	test   %al,%al
 133:	74 67                	je     19c <strncmp+0x7c>
 135:	0f b6 19             	movzbl (%ecx),%ebx
 138:	89 f0                	mov    %esi,%eax
 13a:	38 d8                	cmp    %bl,%al
 13c:	75 65                	jne    1a3 <strncmp+0x83>
 13e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 141:	89 f0                	mov    %esi,%eax
 143:	0f b6 f0             	movzbl %al,%esi
 146:	89 f0                	mov    %esi,%eax
 148:	83 eb 01             	sub    $0x1,%ebx
 14b:	75 14                	jne    161 <strncmp+0x41>
 14d:	eb 25                	jmp    174 <strncmp+0x54>
 14f:	90                   	nop
 150:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 154:	89 f1                	mov    %esi,%ecx
 156:	38 c8                	cmp    %cl,%al
 158:	75 26                	jne    180 <strncmp+0x60>
 15a:	83 eb 01             	sub    $0x1,%ebx
 15d:	89 f9                	mov    %edi,%ecx
 15f:	74 2f                	je     190 <strncmp+0x70>
    p++, q++;
 161:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 164:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 167:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 16a:	84 c0                	test   %al,%al
 16c:	75 e2                	jne    150 <strncmp+0x30>
 16e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 172:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 174:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 175:	29 f0                	sub    %esi,%eax
}
 177:	5e                   	pop    %esi
 178:	5f                   	pop    %edi
 179:	5d                   	pop    %ebp
 17a:	c3                   	ret    
 17b:	90                   	nop
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 180:	0f b6 f1             	movzbl %cl,%esi
 183:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 184:	29 f0                	sub    %esi,%eax
}
 186:	5e                   	pop    %esi
 187:	5f                   	pop    %edi
 188:	5d                   	pop    %ebp
 189:	c3                   	ret    
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 190:	0f b6 f0             	movzbl %al,%esi
 193:	89 f0                	mov    %esi,%eax
 195:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 196:	29 f0                	sub    %esi,%eax
}
 198:	5e                   	pop    %esi
 199:	5f                   	pop    %edi
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 19c:	31 c0                	xor    %eax,%eax
 19e:	0f b6 31             	movzbl (%ecx),%esi
 1a1:	eb d1                	jmp    174 <strncmp+0x54>
 1a3:	0f b6 c0             	movzbl %al,%eax
 1a6:	0f b6 f3             	movzbl %bl,%esi
 1a9:	eb c9                	jmp    174 <strncmp+0x54>
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 39 00             	cmpb   $0x0,(%ecx)
 1b9:	74 12                	je     1cd <strlen+0x1d>
 1bb:	31 d2                	xor    %edx,%edx
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c2 01             	add    $0x1,%edx
 1c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	eb 0d                	jmp    1e0 <memset>
 1d3:	90                   	nop
 1d4:	90                   	nop
 1d5:	90                   	nop
 1d6:	90                   	nop
 1d7:	90                   	nop
 1d8:	90                   	nop
 1d9:	90                   	nop
 1da:	90                   	nop
 1db:	90                   	nop
 1dc:	90                   	nop
 1dd:	90                   	nop
 1de:	90                   	nop
 1df:	90                   	nop

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld    
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	89 d0                	mov    %edx,%eax
 1f4:	5f                   	pop    %edi
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 20a:	0f b6 10             	movzbl (%eax),%edx
 20d:	84 d2                	test   %dl,%dl
 20f:	74 1d                	je     22e <strchr+0x2e>
    if(*s == c)
 211:	38 d3                	cmp    %dl,%bl
 213:	89 d9                	mov    %ebx,%ecx
 215:	75 0d                	jne    224 <strchr+0x24>
 217:	eb 17                	jmp    230 <strchr+0x30>
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 220:	38 ca                	cmp    %cl,%dl
 222:	74 0c                	je     230 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 224:	83 c0 01             	add    $0x1,%eax
 227:	0f b6 10             	movzbl (%eax),%edx
 22a:	84 d2                	test   %dl,%dl
 22c:	75 f2                	jne    220 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 22e:	31 c0                	xor    %eax,%eax
}
 230:	5b                   	pop    %ebx
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
 245:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 246:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 249:	31 db                	xor    %ebx,%ebx
 24b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 250:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 256:	7d 30                	jge    288 <gets+0x48>
    cc = read(0, &c, 1);
 258:	83 ec 04             	sub    $0x4,%esp
 25b:	6a 01                	push   $0x1
 25d:	56                   	push   %esi
 25e:	6a 00                	push   $0x0
 260:	e8 eb 02 00 00       	call   550 <read>
    if(cc < 1)
 265:	83 c4 10             	add    $0x10,%esp
 268:	85 c0                	test   %eax,%eax
 26a:	7e e7                	jle    253 <gets+0x13>
      continue;
    buf[i++] = c;
 26c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 270:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 273:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 275:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 278:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 27a:	74 0c                	je     288 <gets+0x48>
 27c:	3c 0d                	cmp    $0xd,%al
 27e:	74 08                	je     288 <gets+0x48>
 280:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 283:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 286:	7c d0                	jl     258 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 28f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 292:	5b                   	pop    %ebx
 293:	5e                   	pop    %esi
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	pushl  0x8(%ebp)
 2ad:	e8 c6 02 00 00       	call   578 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	pushl  0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 c9 02 00 00       	call   590 <fstat>
 2c7:	89 c6                	mov    %eax,%esi
  close(fd);
 2c9:	89 1c 24             	mov    %ebx,(%esp)
 2cc:	e8 8f 02 00 00       	call   560 <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	89 f0                	mov    %esi,%eax
}
 2d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e5:	eb ef                	jmp    2d6 <stat+0x36>
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 11             	movsbl (%ecx),%edx
 2fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2fd:	3c 09                	cmp    $0x9,%al
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
 304:	77 1f                	ja     325 <atoi+0x35>
 306:	8d 76 00             	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 310:	8d 04 80             	lea    (%eax,%eax,4),%eax
 313:	83 c1 01             	add    $0x1,%ecx
 316:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31a:	0f be 11             	movsbl (%ecx),%edx
 31d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 325:	5b                   	pop    %ebx
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	90                   	nop
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
 335:	8b 5d 10             	mov    0x10(%ebp),%ebx
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 db                	test   %ebx,%ebx
 340:	7e 14                	jle    356 <memmove+0x26>
 342:	31 d2                	xor    %edx,%edx
 344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 34c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 34f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	39 da                	cmp    %ebx,%edx
 354:	75 f2                	jne    348 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000360 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 04             	sub    $0x4,%esp
 369:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 36c:	83 f9 00             	cmp    $0x0,%ecx
 36f:	7e 76                	jle    3e7 <itoa+0x87>
 371:	89 cb                	mov    %ecx,%ebx
 373:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 375:	bf 67 66 66 66       	mov    $0x66666667,%edi
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 380:	89 d8                	mov    %ebx,%eax
 382:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 385:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 388:	f7 ef                	imul   %edi
 38a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 38d:	29 da                	sub    %ebx,%edx
 38f:	89 d3                	mov    %edx,%ebx
 391:	75 ed                	jne    380 <itoa+0x20>
        length++;
 393:	89 f3                	mov    %esi,%ebx
 395:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 398:	bf 67 66 66 66       	mov    $0x66666667,%edi
 39d:	8b 75 08             	mov    0x8(%ebp),%esi
 3a0:	eb 0a                	jmp    3ac <itoa+0x4c>
 3a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3a8:	85 db                	test   %ebx,%ebx
 3aa:	7e 25                	jle    3d1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 3ac:	89 c8                	mov    %ecx,%eax
 3ae:	f7 ef                	imul   %edi
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	c1 f8 1f             	sar    $0x1f,%eax
 3b5:	c1 fa 02             	sar    $0x2,%edx
 3b8:	29 c2                	sub    %eax,%edx
 3ba:	8d 04 92             	lea    (%edx,%edx,4),%eax
 3bd:	01 c0                	add    %eax,%eax
 3bf:	29 c1                	sub    %eax,%ecx
 3c1:	83 c1 30             	add    $0x30,%ecx
 3c4:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3c8:	83 eb 01             	sub    $0x1,%ebx
 3cb:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 3cd:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3cf:	7f d7                	jg     3a8 <itoa+0x48>
 3d1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 3d4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 3d6:	8b 7d 08             	mov    0x8(%ebp),%edi
 3d9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 3dd:	83 c4 04             	add    $0x4,%esp
 3e0:	89 f0                	mov    %esi,%eax
 3e2:	5b                   	pop    %ebx
 3e3:	5e                   	pop    %esi
 3e4:	5f                   	pop    %edi
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3e7:	75 12                	jne    3fb <itoa+0x9b>
        buf[0] = '0';
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 3ec:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 3f1:	c6 00 30             	movb   $0x30,(%eax)
 3f4:	b8 01 00 00 00       	mov    $0x1,%eax
 3f9:	eb db                	jmp    3d6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3fb:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 3fd:	31 f6                	xor    %esi,%esi
 3ff:	eb d5                	jmp    3d6 <itoa+0x76>
 401:	eb 0d                	jmp    410 <strcat>
 403:	90                   	nop
 404:	90                   	nop
 405:	90                   	nop
 406:	90                   	nop
 407:	90                   	nop
 408:	90                   	nop
 409:	90                   	nop
 40a:	90                   	nop
 40b:	90                   	nop
 40c:	90                   	nop
 40d:	90                   	nop
 40e:	90                   	nop
 40f:	90                   	nop

00000410 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	8b 45 08             	mov    0x8(%ebp),%eax
 418:	53                   	push   %ebx
 419:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 41c:	80 38 00             	cmpb   $0x0,(%eax)
 41f:	74 38                	je     459 <strcat+0x49>
 421:	31 c9                	xor    %ecx,%ecx
 423:	90                   	nop
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 428:	83 c1 01             	add    $0x1,%ecx
 42b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 42f:	89 ca                	mov    %ecx,%edx
 431:	75 f5                	jne    428 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 433:	0f b6 1e             	movzbl (%esi),%ebx
 436:	84 db                	test   %bl,%bl
 438:	74 16                	je     450 <strcat+0x40>
 43a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 43d:	31 d2                	xor    %edx,%edx
 43f:	90                   	nop
                dest[i + j] = source[j];
 440:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 443:	83 c2 01             	add    $0x1,%edx
 446:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 44a:	84 db                	test   %bl,%bl
 44c:	75 f2                	jne    440 <strcat+0x30>
 44e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 450:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 454:	5b                   	pop    %ebx
 455:	5e                   	pop    %esi
 456:	5f                   	pop    %edi
 457:	5d                   	pop    %ebp
 458:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 459:	31 d2                	xor    %edx,%edx
 45b:	31 c9                	xor    %ecx,%ecx
 45d:	eb d4                	jmp    433 <strcat+0x23>
 45f:	90                   	nop

00000460 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 469:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 46c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 46f:	0f b6 00             	movzbl (%eax),%eax
 472:	84 c0                	test   %al,%al
 474:	88 45 f3             	mov    %al,-0xd(%ebp)
 477:	0f 84 a0 00 00 00    	je     51d <strstr+0xbd>
 47d:	8b 55 0c             	mov    0xc(%ebp),%edx
 480:	31 c0                	xor    %eax,%eax
 482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 488:	83 c0 01             	add    $0x1,%eax
 48b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 48f:	75 f7                	jne    488 <strstr+0x28>
 491:	89 45 e8             	mov    %eax,-0x18(%ebp)
 494:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 497:	0f b6 07             	movzbl (%edi),%eax
 49a:	84 c0                	test   %al,%al
 49c:	74 68                	je     506 <strstr+0xa6>
 49e:	31 d2                	xor    %edx,%edx
 4a0:	83 c2 01             	add    $0x1,%edx
 4a3:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 4a7:	75 f7                	jne    4a0 <strstr+0x40>
 4a9:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4ac:	84 c0                	test   %al,%al
 4ae:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 4b1:	74 4d                	je     500 <strstr+0xa0>
 4b3:	90                   	nop
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b8:	38 45 f3             	cmp    %al,-0xd(%ebp)
 4bb:	75 34                	jne    4f1 <strstr+0x91>
 4bd:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 4c0:	83 eb 01             	sub    $0x1,%ebx
 4c3:	74 4b                	je     510 <strstr+0xb0>
 4c5:	8b 55 0c             	mov    0xc(%ebp),%edx
 4c8:	89 f8                	mov    %edi,%eax
 4ca:	eb 10                	jmp    4dc <strstr+0x7c>
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d0:	3a 4a 01             	cmp    0x1(%edx),%cl
 4d3:	75 1c                	jne    4f1 <strstr+0x91>
 4d5:	83 eb 01             	sub    $0x1,%ebx
 4d8:	89 f2                	mov    %esi,%edx
 4da:	74 34                	je     510 <strstr+0xb0>
    p++, q++;
 4dc:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4df:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 4e2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4e5:	84 c9                	test   %cl,%cl
 4e7:	75 e7                	jne    4d0 <strstr+0x70>
 4e9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 4ed:	84 c0                	test   %al,%al
 4ef:	74 1f                	je     510 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 4f1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 4f4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 4f7:	74 0d                	je     506 <strstr+0xa6>
 4f9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4fc:	84 c0                	test   %al,%al
 4fe:	75 b8                	jne    4b8 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 500:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 504:	eb e7                	jmp    4ed <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 506:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 509:	31 c0                	xor    %eax,%eax
}
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5f                   	pop    %edi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 510:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 513:	83 c4 10             	add    $0x10,%esp
 516:	5b                   	pop    %ebx
 517:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 518:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 51a:	5f                   	pop    %edi
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 51d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 524:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 52b:	e9 67 ff ff ff       	jmp    497 <strstr+0x37>

00000530 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 530:	b8 01 00 00 00       	mov    $0x1,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <exit>:
SYSCALL(exit)
 538:	b8 02 00 00 00       	mov    $0x2,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <wait>:
SYSCALL(wait)
 540:	b8 03 00 00 00       	mov    $0x3,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <pipe>:
SYSCALL(pipe)
 548:	b8 04 00 00 00       	mov    $0x4,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <read>:
SYSCALL(read)
 550:	b8 05 00 00 00       	mov    $0x5,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <write>:
SYSCALL(write)
 558:	b8 10 00 00 00       	mov    $0x10,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <close>:
SYSCALL(close)
 560:	b8 15 00 00 00       	mov    $0x15,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <kill>:
SYSCALL(kill)
 568:	b8 06 00 00 00       	mov    $0x6,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <exec>:
SYSCALL(exec)
 570:	b8 07 00 00 00       	mov    $0x7,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <open>:
SYSCALL(open)
 578:	b8 0f 00 00 00       	mov    $0xf,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <mknod>:
SYSCALL(mknod)
 580:	b8 11 00 00 00       	mov    $0x11,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <unlink>:
SYSCALL(unlink)
 588:	b8 12 00 00 00       	mov    $0x12,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <fstat>:
SYSCALL(fstat)
 590:	b8 08 00 00 00       	mov    $0x8,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <link>:
SYSCALL(link)
 598:	b8 13 00 00 00       	mov    $0x13,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <mkdir>:
SYSCALL(mkdir)
 5a0:	b8 14 00 00 00       	mov    $0x14,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <chdir>:
SYSCALL(chdir)
 5a8:	b8 09 00 00 00       	mov    $0x9,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <dup>:
SYSCALL(dup)
 5b0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <getpid>:
SYSCALL(getpid)
 5b8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <sbrk>:
SYSCALL(sbrk)
 5c0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <sleep>:
SYSCALL(sleep)
 5c8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <uptime>:
SYSCALL(uptime)
 5d0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <mount>:
SYSCALL(mount)
 5d8:	b8 16 00 00 00       	mov    $0x16,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <umount>:
SYSCALL(umount)
 5e0:	b8 17 00 00 00       	mov    $0x17,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <printmounts>:
SYSCALL(printmounts)
 5e8:	b8 18 00 00 00       	mov    $0x18,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <printdevices>:
SYSCALL(printdevices)
 5f0:	b8 19 00 00 00       	mov    $0x19,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <unshare>:
SYSCALL(unshare)
 5f8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <usleep>:
SYSCALL(usleep)
 600:	b8 1b 00 00 00       	mov    $0x1b,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <ioctl>:
SYSCALL(ioctl)
 608:	b8 1c 00 00 00       	mov    $0x1c,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <getppid>:
SYSCALL(getppid)
 610:	b8 1d 00 00 00       	mov    $0x1d,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <getcpu>:
SYSCALL(getcpu)
 618:	b8 1e 00 00 00       	mov    $0x1e,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <getmem>:
SYSCALL(getmem)
 620:	b8 1f 00 00 00       	mov    $0x1f,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <kmemtest>:
SYSCALL(kmemtest)
 628:	b8 20 00 00 00       	mov    $0x20,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 639:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 63c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 63f:	85 db                	test   %ebx,%ebx
 641:	0f 84 91 00 00 00    	je     6d8 <printint+0xa8>
 647:	89 d0                	mov    %edx,%eax
 649:	c1 e8 1f             	shr    $0x1f,%eax
 64c:	84 c0                	test   %al,%al
 64e:	0f 84 84 00 00 00    	je     6d8 <printint+0xa8>
    neg = 1;
    x = -xx;
 654:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 656:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 65d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 65f:	31 ff                	xor    %edi,%edi
 661:	8d 75 c7             	lea    -0x39(%ebp),%esi
 664:	eb 0c                	jmp    672 <printint+0x42>
 666:	8d 76 00             	lea    0x0(%esi),%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 670:	89 df                	mov    %ebx,%edi
 672:	31 d2                	xor    %edx,%edx
 674:	8d 5f 01             	lea    0x1(%edi),%ebx
 677:	f7 f1                	div    %ecx
 679:	0f b6 92 b0 0b 00 00 	movzbl 0xbb0(%edx),%edx
  }while((x /= base) != 0);
 680:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 682:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 685:	75 e9                	jne    670 <printint+0x40>
  if(neg)
 687:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 68a:	85 c0                	test   %eax,%eax
 68c:	74 08                	je     696 <printint+0x66>
    buf[i++] = '-';
 68e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 693:	8d 5f 02             	lea    0x2(%edi),%ebx
 696:	8d 7d d8             	lea    -0x28(%ebp),%edi
 699:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 69d:	89 fa                	mov    %edi,%edx
 69f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 6a0:	0f b6 08             	movzbl (%eax),%ecx
 6a3:	83 e8 01             	sub    $0x1,%eax
 6a6:	83 c2 01             	add    $0x1,%edx
 6a9:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 6ac:	39 f0                	cmp    %esi,%eax
 6ae:	75 f0                	jne    6a0 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 6b0:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 6b3:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 6b8:	57                   	push   %edi
 6b9:	e8 f2 fa ff ff       	call   1b0 <strlen>
 6be:	83 c4 0c             	add    $0xc,%esp
 6c1:	50                   	push   %eax
 6c2:	57                   	push   %edi
 6c3:	ff 75 c0             	pushl  -0x40(%ebp)
 6c6:	e8 8d fe ff ff       	call   558 <write>
}
 6cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ce:	5b                   	pop    %ebx
 6cf:	5e                   	pop    %esi
 6d0:	5f                   	pop    %edi
 6d1:	5d                   	pop    %ebp
 6d2:	c3                   	ret    
 6d3:	90                   	nop
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6d8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6da:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6e1:	e9 79 ff ff ff       	jmp    65f <printint+0x2f>
 6e6:	8d 76 00             	lea    0x0(%esi),%esi
 6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6fc:	0f b6 06             	movzbl (%esi),%eax
 6ff:	84 c0                	test   %al,%al
 701:	0f 84 90 01 00 00    	je     897 <printf+0x1a7>
 707:	8d 5d 10             	lea    0x10(%ebp),%ebx
 70a:	31 ff                	xor    %edi,%edi
 70c:	31 d2                	xor    %edx,%edx
 70e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 711:	31 db                	xor    %ebx,%ebx
 713:	eb 39                	jmp    74e <printf+0x5e>
 715:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 718:	83 f9 25             	cmp    $0x25,%ecx
 71b:	0f 84 af 00 00 00    	je     7d0 <printf+0xe0>
 721:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 724:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 727:	83 ec 04             	sub    $0x4,%esp
 72a:	6a 01                	push   $0x1
 72c:	50                   	push   %eax
 72d:	ff 75 08             	pushl  0x8(%ebp)
 730:	e8 23 fe ff ff       	call   558 <write>
 735:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 738:	85 c0                	test   %eax,%eax
 73a:	78 35                	js     771 <printf+0x81>
 73c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 73f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 742:	01 c7                	add    %eax,%edi
 744:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 746:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 74a:	84 c0                	test   %al,%al
 74c:	74 21                	je     76f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 74e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 751:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 753:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 756:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 759:	74 bd                	je     718 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 75b:	83 fa 25             	cmp    $0x25,%edx
 75e:	74 20                	je     780 <printf+0x90>
 760:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 762:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 765:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 767:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 76b:	84 c0                	test   %al,%al
 76d:	75 df                	jne    74e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 76f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 771:	8d 65 f4             	lea    -0xc(%ebp),%esp
 774:	5b                   	pop    %ebx
 775:	5e                   	pop    %esi
 776:	5f                   	pop    %edi
 777:	5d                   	pop    %ebp
 778:	c3                   	ret    
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 780:	83 f9 64             	cmp    $0x64,%ecx
 783:	0f 84 7f 00 00 00    	je     808 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 789:	0f be d0             	movsbl %al,%edx
 78c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 792:	83 fa 70             	cmp    $0x70,%edx
 795:	74 49                	je     7e0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 797:	83 f9 73             	cmp    $0x73,%ecx
 79a:	0f 84 98 00 00 00    	je     838 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 7a0:	83 f9 63             	cmp    $0x63,%ecx
 7a3:	0f 84 c7 00 00 00    	je     870 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7a9:	83 f9 25             	cmp    $0x25,%ecx
 7ac:	74 6a                	je     818 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 7ae:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 7b1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7b4:	83 ec 04             	sub    $0x4,%esp
 7b7:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 7b9:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 7bd:	50                   	push   %eax
 7be:	ff 75 08             	pushl  0x8(%ebp)
 7c1:	e8 92 fd ff ff       	call   558 <write>
 7c6:	83 c4 10             	add    $0x10,%esp
 7c9:	e9 6a ff ff ff       	jmp    738 <printf+0x48>
 7ce:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7d0:	ba 25 00 00 00       	mov    $0x25,%edx
 7d5:	31 c0                	xor    %eax,%eax
 7d7:	eb 89                	jmp    762 <printf+0x72>
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7e8:	6a 00                	push   $0x0
 7ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
 7f0:	8b 16                	mov    (%esi),%edx
        ap++;
 7f2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7f5:	e8 36 fe ff ff       	call   630 <printint>
        ap++;
 7fa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7fd:	83 c4 10             	add    $0x10,%esp
 800:	e9 33 ff ff ff       	jmp    738 <printf+0x48>
 805:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 808:	83 ec 0c             	sub    $0xc,%esp
 80b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 810:	6a 01                	push   $0x1
 812:	eb d6                	jmp    7ea <printf+0xfa>
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 818:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 81b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 81e:	83 ec 04             	sub    $0x4,%esp
 821:	6a 01                	push   $0x1
 823:	50                   	push   %eax
 824:	ff 75 08             	pushl  0x8(%ebp)
 827:	e8 2c fd ff ff       	call   558 <write>
 82c:	83 c4 10             	add    $0x10,%esp
 82f:	e9 04 ff ff ff       	jmp    738 <printf+0x48>
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 838:	8b 45 d0             	mov    -0x30(%ebp),%eax
 83b:	8b 30                	mov    (%eax),%esi
        ap++;
 83d:	83 c0 04             	add    $0x4,%eax
 840:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 843:	b8 a8 0b 00 00       	mov    $0xba8,%eax
 848:	85 f6                	test   %esi,%esi
 84a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 84d:	83 ec 0c             	sub    $0xc,%esp
 850:	56                   	push   %esi
 851:	e8 5a f9 ff ff       	call   1b0 <strlen>
 856:	83 c4 0c             	add    $0xc,%esp
 859:	50                   	push   %eax
 85a:	56                   	push   %esi
 85b:	ff 75 08             	pushl  0x8(%ebp)
 85e:	e8 f5 fc ff ff       	call   558 <write>
 863:	83 c4 10             	add    $0x10,%esp
 866:	e9 cd fe ff ff       	jmp    738 <printf+0x48>
 86b:	90                   	nop
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 870:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 873:	83 ec 04             	sub    $0x4,%esp
 876:	8b 06                	mov    (%esi),%eax
 878:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 87a:	83 c6 04             	add    $0x4,%esi
 87d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 880:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 883:	50                   	push   %eax
 884:	ff 75 08             	pushl  0x8(%ebp)
 887:	e8 cc fc ff ff       	call   558 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 88c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 88f:	83 c4 10             	add    $0x10,%esp
 892:	e9 a1 fe ff ff       	jmp    738 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 897:	31 c0                	xor    %eax,%eax
 899:	e9 d3 fe ff ff       	jmp    771 <printf+0x81>
 89e:	66 90                	xchg   %ax,%ax

000008a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a1:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a6:	89 e5                	mov    %esp,%ebp
 8a8:	57                   	push   %edi
 8a9:	56                   	push   %esi
 8aa:	53                   	push   %ebx
 8ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ae:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8b0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b3:	39 c8                	cmp    %ecx,%eax
 8b5:	73 19                	jae    8d0 <free+0x30>
 8b7:	89 f6                	mov    %esi,%esi
 8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8c0:	39 d1                	cmp    %edx,%ecx
 8c2:	72 1c                	jb     8e0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c4:	39 d0                	cmp    %edx,%eax
 8c6:	73 18                	jae    8e0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ca:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8cc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ce:	72 f0                	jb     8c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d0:	39 d0                	cmp    %edx,%eax
 8d2:	72 f4                	jb     8c8 <free+0x28>
 8d4:	39 d1                	cmp    %edx,%ecx
 8d6:	73 f0                	jae    8c8 <free+0x28>
 8d8:	90                   	nop
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8e3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8e6:	39 d7                	cmp    %edx,%edi
 8e8:	74 19                	je     903 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ed:	8b 50 04             	mov    0x4(%eax),%edx
 8f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f3:	39 f1                	cmp    %esi,%ecx
 8f5:	74 23                	je     91a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8f7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8f9:	a3 00 20 00 00       	mov    %eax,0x2000
}
 8fe:	5b                   	pop    %ebx
 8ff:	5e                   	pop    %esi
 900:	5f                   	pop    %edi
 901:	5d                   	pop    %ebp
 902:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 903:	03 72 04             	add    0x4(%edx),%esi
 906:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 909:	8b 10                	mov    (%eax),%edx
 90b:	8b 12                	mov    (%edx),%edx
 90d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 910:	8b 50 04             	mov    0x4(%eax),%edx
 913:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 916:	39 f1                	cmp    %esi,%ecx
 918:	75 dd                	jne    8f7 <free+0x57>
    p->s.size += bp->s.size;
 91a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 91d:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 922:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 925:	8b 53 f8             	mov    -0x8(%ebx),%edx
 928:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 92a:	5b                   	pop    %ebx
 92b:	5e                   	pop    %esi
 92c:	5f                   	pop    %edi
 92d:	5d                   	pop    %ebp
 92e:	c3                   	ret    
 92f:	90                   	nop

00000930 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	57                   	push   %edi
 934:	56                   	push   %esi
 935:	53                   	push   %ebx
 936:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 939:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 93c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 942:	8d 78 07             	lea    0x7(%eax),%edi
 945:	c1 ef 03             	shr    $0x3,%edi
 948:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 94b:	85 d2                	test   %edx,%edx
 94d:	0f 84 a3 00 00 00    	je     9f6 <malloc+0xc6>
 953:	8b 02                	mov    (%edx),%eax
 955:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 958:	39 cf                	cmp    %ecx,%edi
 95a:	76 74                	jbe    9d0 <malloc+0xa0>
 95c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 962:	be 00 10 00 00       	mov    $0x1000,%esi
 967:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 96e:	0f 43 f7             	cmovae %edi,%esi
 971:	ba 00 80 00 00       	mov    $0x8000,%edx
 976:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 97c:	0f 46 da             	cmovbe %edx,%ebx
 97f:	eb 10                	jmp    991 <malloc+0x61>
 981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 988:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 98a:	8b 48 04             	mov    0x4(%eax),%ecx
 98d:	39 cf                	cmp    %ecx,%edi
 98f:	76 3f                	jbe    9d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 991:	39 05 00 20 00 00    	cmp    %eax,0x2000
 997:	89 c2                	mov    %eax,%edx
 999:	75 ed                	jne    988 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 99b:	83 ec 0c             	sub    $0xc,%esp
 99e:	53                   	push   %ebx
 99f:	e8 1c fc ff ff       	call   5c0 <sbrk>
  if(p == (char*)-1)
 9a4:	83 c4 10             	add    $0x10,%esp
 9a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9aa:	74 1c                	je     9c8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9ac:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 9af:	83 ec 0c             	sub    $0xc,%esp
 9b2:	83 c0 08             	add    $0x8,%eax
 9b5:	50                   	push   %eax
 9b6:	e8 e5 fe ff ff       	call   8a0 <free>
  return freep;
 9bb:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 9c1:	83 c4 10             	add    $0x10,%esp
 9c4:	85 d2                	test   %edx,%edx
 9c6:	75 c0                	jne    988 <malloc+0x58>
        return 0;
 9c8:	31 c0                	xor    %eax,%eax
 9ca:	eb 1c                	jmp    9e8 <malloc+0xb8>
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9d0:	39 cf                	cmp    %ecx,%edi
 9d2:	74 1c                	je     9f0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9d4:	29 f9                	sub    %edi,%ecx
 9d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9dc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 9df:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 9e5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9eb:	5b                   	pop    %ebx
 9ec:	5e                   	pop    %esi
 9ed:	5f                   	pop    %edi
 9ee:	5d                   	pop    %ebp
 9ef:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 9f0:	8b 08                	mov    (%eax),%ecx
 9f2:	89 0a                	mov    %ecx,(%edx)
 9f4:	eb e9                	jmp    9df <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9f6:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 9fd:	20 00 00 
 a00:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 a07:	20 00 00 
    base.s.size = 0;
 a0a:	b8 04 20 00 00       	mov    $0x2004,%eax
 a0f:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 a16:	00 00 00 
 a19:	e9 3e ff ff ff       	jmp    95c <malloc+0x2c>
 a1e:	66 90                	xchg   %ax,%ax

00000a20 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
 a23:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 a26:	6a 10                	push   $0x10
 a28:	6a 02                	push   $0x2
 a2a:	ff 75 08             	pushl  0x8(%ebp)
 a2d:	e8 d6 fb ff ff       	call   608 <ioctl>
}
 a32:	c9                   	leave  
 a33:	c3                   	ret    
 a34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a40 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 a46:	68 00 10 00 00       	push   $0x1000
 a4b:	6a 02                	push   $0x2
 a4d:	ff 75 08             	pushl  0x8(%ebp)
 a50:	e8 b3 fb ff ff       	call   608 <ioctl>
}
 a55:	c9                   	leave  
 a56:	c3                   	ret    
 a57:	89 f6                	mov    %esi,%esi
 a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a60 <attach_tty>:

int
attach_tty(int tty_fd)
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	53                   	push   %ebx
 a64:	83 ec 08             	sub    $0x8,%esp
 a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 a6a:	6a 10                	push   $0x10
 a6c:	6a 01                	push   $0x1
 a6e:	53                   	push   %ebx
 a6f:	e8 94 fb ff ff       	call   608 <ioctl>
 a74:	83 c4 10             	add    $0x10,%esp
 a77:	85 c0                	test   %eax,%eax
 a79:	78 55                	js     ad0 <attach_tty+0x70>
     return -1;

    close(0);
 a7b:	83 ec 0c             	sub    $0xc,%esp
 a7e:	6a 00                	push   $0x0
 a80:	e8 db fa ff ff       	call   560 <close>
    close(1);
 a85:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a8c:	e8 cf fa ff ff       	call   560 <close>
    close(2);
 a91:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a98:	e8 c3 fa ff ff       	call   560 <close>
    if(dup(tty_fd) < 0)
 a9d:	89 1c 24             	mov    %ebx,(%esp)
 aa0:	e8 0b fb ff ff       	call   5b0 <dup>
 aa5:	83 c4 10             	add    $0x10,%esp
 aa8:	85 c0                	test   %eax,%eax
 aaa:	78 24                	js     ad0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 aac:	83 ec 0c             	sub    $0xc,%esp
 aaf:	53                   	push   %ebx
 ab0:	e8 fb fa ff ff       	call   5b0 <dup>
 ab5:	83 c4 10             	add    $0x10,%esp
 ab8:	85 c0                	test   %eax,%eax
 aba:	78 14                	js     ad0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 abc:	83 ec 0c             	sub    $0xc,%esp
 abf:	53                   	push   %ebx
 ac0:	e8 eb fa ff ff       	call   5b0 <dup>
 ac5:	83 c4 10             	add    $0x10,%esp
 ac8:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 acb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ace:	c9                   	leave  
 acf:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 ad0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 ad5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ad8:	c9                   	leave  
 ad9:	c3                   	ret    
 ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ae0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 ae6:	6a 20                	push   $0x20
 ae8:	6a 01                	push   $0x1
 aea:	ff 75 08             	pushl  0x8(%ebp)
 aed:	e8 16 fb ff ff       	call   608 <ioctl>
    return 0;
}
 af2:	31 c0                	xor    %eax,%eax
 af4:	c9                   	leave  
 af5:	c3                   	ret    
 af6:	8d 76 00             	lea    0x0(%esi),%esi
 af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b00 <connect_tty>:


int
connect_tty(int tty_fd)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	53                   	push   %ebx
 b04:	83 ec 08             	sub    $0x8,%esp
 b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 b0a:	6a 10                	push   $0x10
 b0c:	6a 02                	push   $0x2
 b0e:	53                   	push   %ebx
 b0f:	e8 f4 fa ff ff       	call   608 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 b14:	83 c4 10             	add    $0x10,%esp
 b17:	85 c0                	test   %eax,%eax
 b19:	74 1d                	je     b38 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 b1b:	83 ec 04             	sub    $0x4,%esp
 b1e:	68 00 10 00 00       	push   $0x1000
 b23:	6a 01                	push   $0x1
 b25:	53                   	push   %ebx
 b26:	e8 dd fa ff ff       	call   608 <ioctl>
     return tty_fd;
 b2b:	83 c4 10             	add    $0x10,%esp
 b2e:	89 d8                	mov    %ebx,%eax
}
 b30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b33:	c9                   	leave  
 b34:	c3                   	ret    
 b35:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 b38:	83 ec 0c             	sub    $0xc,%esp
 b3b:	53                   	push   %ebx
 b3c:	e8 1f fa ff ff       	call   560 <close>
       return -1;
 b41:	83 c4 10             	add    $0x10,%esp
 b44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b49:	eb e5                	jmp    b30 <connect_tty+0x30>
 b4b:	90                   	nop
 b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b50 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 b56:	68 00 20 00 00       	push   $0x2000
 b5b:	6a 01                	push   $0x1
 b5d:	ff 75 08             	pushl  0x8(%ebp)
 b60:	e8 a3 fa ff ff       	call   608 <ioctl>
}
 b65:	c9                   	leave  
 b66:	c3                   	ret    
