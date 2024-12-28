
_umount:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int main(int argc, const char * const argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 24             	sub    $0x24,%esp
  11:	8b 01                	mov    (%ecx),%eax
  13:	8b 51 04             	mov    0x4(%ecx),%edx
    const char usage[] = "Usage: umount [path]\n";
  16:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1b:	c7 45 e2 55 73 61 67 	movl   $0x67617355,-0x1e(%ebp)
  22:	c7 45 e6 65 3a 20 75 	movl   $0x75203a65,-0x1a(%ebp)
  29:	c7 45 ea 6d 6f 75 6e 	movl   $0x6e756f6d,-0x16(%ebp)
  30:	c7 45 ee 74 20 5b 70 	movl   $0x705b2074,-0x12(%ebp)

    if (argc != 2) {
  37:	83 f8 02             	cmp    $0x2,%eax
#include "user.h"

int main(int argc, const char * const argv[])
{
    const char usage[] = "Usage: umount [path]\n";
  3a:	c7 45 f2 61 74 68 5d 	movl   $0x5d687461,-0xe(%ebp)
  41:	66 89 4d f6          	mov    %cx,-0xa(%ebp)

    if (argc != 2) {
  45:	74 1a                	je     61 <main+0x61>
        printf(2, usage);
  47:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  4a:	83 ec 08             	sub    $0x8,%esp
  4d:	50                   	push   %eax
  4e:	6a 02                	push   $0x2
  50:	e8 7b 06 00 00       	call   6d0 <printf>
        exit(1);
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 b7 04 00 00       	call   518 <exit>
    }

    exit(umount(argv[1]));
  61:	83 ec 0c             	sub    $0xc,%esp
  64:	ff 72 04             	pushl  0x4(%edx)
  67:	e8 54 05 00 00       	call   5c0 <umount>
  6c:	89 04 24             	mov    %eax,(%esp)
  6f:	e8 a4 04 00 00       	call   518 <exit>
  74:	66 90                	xchg   %ax,%ax
  76:	66 90                	xchg   %ax,%ax
  78:	66 90                	xchg   %ax,%ax
  7a:	66 90                	xchg   %ax,%ax
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 45 08             	mov    0x8(%ebp),%eax
  87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  b5:	8b 55 08             	mov    0x8(%ebp),%edx
  b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  bb:	0f b6 02             	movzbl (%edx),%eax
  be:	0f b6 19             	movzbl (%ecx),%ebx
  c1:	84 c0                	test   %al,%al
  c3:	75 1e                	jne    e3 <strcmp+0x33>
  c5:	eb 29                	jmp    f0 <strcmp+0x40>
  c7:	89 f6                	mov    %esi,%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  dd:	84 c0                	test   %al,%al
  df:	74 0f                	je     f0 <strcmp+0x40>
  e1:	89 f1                	mov    %esi,%ecx
  e3:	38 d8                	cmp    %bl,%al
  e5:	74 e9                	je     d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e7:	29 d8                	sub    %ebx,%eax
}
  e9:	5b                   	pop    %ebx
  ea:	5e                   	pop    %esi
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    
  ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5e                   	pop    %esi
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000100 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	8b 55 08             	mov    0x8(%ebp),%edx
 108:	53                   	push   %ebx
 109:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 10c:	0f b6 32             	movzbl (%edx),%esi
 10f:	89 f0                	mov    %esi,%eax
 111:	84 c0                	test   %al,%al
 113:	74 67                	je     17c <strncmp+0x7c>
 115:	0f b6 19             	movzbl (%ecx),%ebx
 118:	89 f0                	mov    %esi,%eax
 11a:	38 d8                	cmp    %bl,%al
 11c:	75 65                	jne    183 <strncmp+0x83>
 11e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 121:	89 f0                	mov    %esi,%eax
 123:	0f b6 f0             	movzbl %al,%esi
 126:	89 f0                	mov    %esi,%eax
 128:	83 eb 01             	sub    $0x1,%ebx
 12b:	75 14                	jne    141 <strncmp+0x41>
 12d:	eb 25                	jmp    154 <strncmp+0x54>
 12f:	90                   	nop
 130:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 134:	89 f1                	mov    %esi,%ecx
 136:	38 c8                	cmp    %cl,%al
 138:	75 26                	jne    160 <strncmp+0x60>
 13a:	83 eb 01             	sub    $0x1,%ebx
 13d:	89 f9                	mov    %edi,%ecx
 13f:	74 2f                	je     170 <strncmp+0x70>
    p++, q++;
 141:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 144:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 147:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 14a:	84 c0                	test   %al,%al
 14c:	75 e2                	jne    130 <strncmp+0x30>
 14e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 152:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 154:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 155:	29 f0                	sub    %esi,%eax
}
 157:	5e                   	pop    %esi
 158:	5f                   	pop    %edi
 159:	5d                   	pop    %ebp
 15a:	c3                   	ret    
 15b:	90                   	nop
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	0f b6 f1             	movzbl %cl,%esi
 163:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 164:	29 f0                	sub    %esi,%eax
}
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 170:	0f b6 f0             	movzbl %al,%esi
 173:	89 f0                	mov    %esi,%eax
 175:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 176:	29 f0                	sub    %esi,%eax
}
 178:	5e                   	pop    %esi
 179:	5f                   	pop    %edi
 17a:	5d                   	pop    %ebp
 17b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 17c:	31 c0                	xor    %eax,%eax
 17e:	0f b6 31             	movzbl (%ecx),%esi
 181:	eb d1                	jmp    154 <strncmp+0x54>
 183:	0f b6 c0             	movzbl %al,%eax
 186:	0f b6 f3             	movzbl %bl,%esi
 189:	eb c9                	jmp    154 <strncmp+0x54>
 18b:	90                   	nop
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 12                	je     1ad <strlen+0x1d>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	eb 0d                	jmp    1c0 <memset>
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	74 1d                	je     20e <strchr+0x2e>
    if(*s == c)
 1f1:	38 d3                	cmp    %dl,%bl
 1f3:	89 d9                	mov    %ebx,%ecx
 1f5:	75 0d                	jne    204 <strchr+0x24>
 1f7:	eb 17                	jmp    210 <strchr+0x30>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0c                	je     210 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 20e:	31 c0                	xor    %eax,%eax
}
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 226:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 229:	31 db                	xor    %ebx,%ebx
 22b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 230:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 233:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 236:	7d 30                	jge    268 <gets+0x48>
    cc = read(0, &c, 1);
 238:	83 ec 04             	sub    $0x4,%esp
 23b:	6a 01                	push   $0x1
 23d:	56                   	push   %esi
 23e:	6a 00                	push   $0x0
 240:	e8 eb 02 00 00       	call   530 <read>
    if(cc < 1)
 245:	83 c4 10             	add    $0x10,%esp
 248:	85 c0                	test   %eax,%eax
 24a:	7e e7                	jle    233 <gets+0x13>
      continue;
    buf[i++] = c;
 24c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 250:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 253:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 255:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 258:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 25a:	74 0c                	je     268 <gets+0x48>
 25c:	3c 0d                	cmp    $0xd,%al
 25e:	74 08                	je     268 <gets+0x48>
 260:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 263:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 266:	7c d0                	jl     238 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 26f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 272:	5b                   	pop    %ebx
 273:	5e                   	pop    %esi
 274:	5f                   	pop    %edi
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	e8 c6 02 00 00       	call   558 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	pushl  0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 c9 02 00 00       	call   570 <fstat>
 2a7:	89 c6                	mov    %eax,%esi
  close(fd);
 2a9:	89 1c 24             	mov    %ebx,(%esp)
 2ac:	e8 8f 02 00 00       	call   540 <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	89 f0                	mov    %esi,%eax
}
 2b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c5:	eb ef                	jmp    2b6 <stat+0x36>
 2c7:	89 f6                	mov    %esi,%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 11             	movsbl (%ecx),%edx
 2da:	8d 42 d0             	lea    -0x30(%edx),%eax
 2dd:	3c 09                	cmp    $0x9,%al
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
 2e4:	77 1f                	ja     305 <atoi+0x35>
 2e6:	8d 76 00             	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2f3:	83 c1 01             	add    $0x1,%ecx
 2f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2fa:	0f be 11             	movsbl (%ecx),%edx
 2fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 305:	5b                   	pop    %ebx
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    
 308:	90                   	nop
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
 315:	8b 5d 10             	mov    0x10(%ebp),%ebx
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 db                	test   %ebx,%ebx
 320:	7e 14                	jle    336 <memmove+0x26>
 322:	31 d2                	xor    %edx,%edx
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 32c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 32f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 332:	39 da                	cmp    %ebx,%edx
 334:	75 f2                	jne    328 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	83 ec 04             	sub    $0x4,%esp
 349:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 34c:	83 f9 00             	cmp    $0x0,%ecx
 34f:	7e 76                	jle    3c7 <itoa+0x87>
 351:	89 cb                	mov    %ecx,%ebx
 353:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 355:	bf 67 66 66 66       	mov    $0x66666667,%edi
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 360:	89 d8                	mov    %ebx,%eax
 362:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 365:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 368:	f7 ef                	imul   %edi
 36a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 36d:	29 da                	sub    %ebx,%edx
 36f:	89 d3                	mov    %edx,%ebx
 371:	75 ed                	jne    360 <itoa+0x20>
        length++;
 373:	89 f3                	mov    %esi,%ebx
 375:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 378:	bf 67 66 66 66       	mov    $0x66666667,%edi
 37d:	8b 75 08             	mov    0x8(%ebp),%esi
 380:	eb 0a                	jmp    38c <itoa+0x4c>
 382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 388:	85 db                	test   %ebx,%ebx
 38a:	7e 25                	jle    3b1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 38c:	89 c8                	mov    %ecx,%eax
 38e:	f7 ef                	imul   %edi
 390:	89 c8                	mov    %ecx,%eax
 392:	c1 f8 1f             	sar    $0x1f,%eax
 395:	c1 fa 02             	sar    $0x2,%edx
 398:	29 c2                	sub    %eax,%edx
 39a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 39d:	01 c0                	add    %eax,%eax
 39f:	29 c1                	sub    %eax,%ecx
 3a1:	83 c1 30             	add    $0x30,%ecx
 3a4:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3a8:	83 eb 01             	sub    $0x1,%ebx
 3ab:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 3ad:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3af:	7f d7                	jg     388 <itoa+0x48>
 3b1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 3b4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 3b6:	8b 7d 08             	mov    0x8(%ebp),%edi
 3b9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 3bd:	83 c4 04             	add    $0x4,%esp
 3c0:	89 f0                	mov    %esi,%eax
 3c2:	5b                   	pop    %ebx
 3c3:	5e                   	pop    %esi
 3c4:	5f                   	pop    %edi
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3c7:	75 12                	jne    3db <itoa+0x9b>
        buf[0] = '0';
 3c9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 3cc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 3d1:	c6 00 30             	movb   $0x30,(%eax)
 3d4:	b8 01 00 00 00       	mov    $0x1,%eax
 3d9:	eb db                	jmp    3b6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3db:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 3dd:	31 f6                	xor    %esi,%esi
 3df:	eb d5                	jmp    3b6 <itoa+0x76>
 3e1:	eb 0d                	jmp    3f0 <strcat>
 3e3:	90                   	nop
 3e4:	90                   	nop
 3e5:	90                   	nop
 3e6:	90                   	nop
 3e7:	90                   	nop
 3e8:	90                   	nop
 3e9:	90                   	nop
 3ea:	90                   	nop
 3eb:	90                   	nop
 3ec:	90                   	nop
 3ed:	90                   	nop
 3ee:	90                   	nop
 3ef:	90                   	nop

000003f0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	8b 45 08             	mov    0x8(%ebp),%eax
 3f8:	53                   	push   %ebx
 3f9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 3fc:	80 38 00             	cmpb   $0x0,(%eax)
 3ff:	74 38                	je     439 <strcat+0x49>
 401:	31 c9                	xor    %ecx,%ecx
 403:	90                   	nop
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 408:	83 c1 01             	add    $0x1,%ecx
 40b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 40f:	89 ca                	mov    %ecx,%edx
 411:	75 f5                	jne    408 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 413:	0f b6 1e             	movzbl (%esi),%ebx
 416:	84 db                	test   %bl,%bl
 418:	74 16                	je     430 <strcat+0x40>
 41a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 41d:	31 d2                	xor    %edx,%edx
 41f:	90                   	nop
                dest[i + j] = source[j];
 420:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 423:	83 c2 01             	add    $0x1,%edx
 426:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 42a:	84 db                	test   %bl,%bl
 42c:	75 f2                	jne    420 <strcat+0x30>
 42e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 430:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 434:	5b                   	pop    %ebx
 435:	5e                   	pop    %esi
 436:	5f                   	pop    %edi
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 439:	31 d2                	xor    %edx,%edx
 43b:	31 c9                	xor    %ecx,%ecx
 43d:	eb d4                	jmp    413 <strcat+0x23>
 43f:	90                   	nop

00000440 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 449:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 44c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 44f:	0f b6 00             	movzbl (%eax),%eax
 452:	84 c0                	test   %al,%al
 454:	88 45 f3             	mov    %al,-0xd(%ebp)
 457:	0f 84 a0 00 00 00    	je     4fd <strstr+0xbd>
 45d:	8b 55 0c             	mov    0xc(%ebp),%edx
 460:	31 c0                	xor    %eax,%eax
 462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 468:	83 c0 01             	add    $0x1,%eax
 46b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 46f:	75 f7                	jne    468 <strstr+0x28>
 471:	89 45 e8             	mov    %eax,-0x18(%ebp)
 474:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 477:	0f b6 07             	movzbl (%edi),%eax
 47a:	84 c0                	test   %al,%al
 47c:	74 68                	je     4e6 <strstr+0xa6>
 47e:	31 d2                	xor    %edx,%edx
 480:	83 c2 01             	add    $0x1,%edx
 483:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 487:	75 f7                	jne    480 <strstr+0x40>
 489:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 48c:	84 c0                	test   %al,%al
 48e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 491:	74 4d                	je     4e0 <strstr+0xa0>
 493:	90                   	nop
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 498:	38 45 f3             	cmp    %al,-0xd(%ebp)
 49b:	75 34                	jne    4d1 <strstr+0x91>
 49d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 4a0:	83 eb 01             	sub    $0x1,%ebx
 4a3:	74 4b                	je     4f0 <strstr+0xb0>
 4a5:	8b 55 0c             	mov    0xc(%ebp),%edx
 4a8:	89 f8                	mov    %edi,%eax
 4aa:	eb 10                	jmp    4bc <strstr+0x7c>
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b0:	3a 4a 01             	cmp    0x1(%edx),%cl
 4b3:	75 1c                	jne    4d1 <strstr+0x91>
 4b5:	83 eb 01             	sub    $0x1,%ebx
 4b8:	89 f2                	mov    %esi,%edx
 4ba:	74 34                	je     4f0 <strstr+0xb0>
    p++, q++;
 4bc:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4bf:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 4c2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4c5:	84 c9                	test   %cl,%cl
 4c7:	75 e7                	jne    4b0 <strstr+0x70>
 4c9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 4cd:	84 c0                	test   %al,%al
 4cf:	74 1f                	je     4f0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 4d1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 4d4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 4d7:	74 0d                	je     4e6 <strstr+0xa6>
 4d9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4dc:	84 c0                	test   %al,%al
 4de:	75 b8                	jne    498 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4e0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 4e4:	eb e7                	jmp    4cd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 4e6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 4e9:	31 c0                	xor    %eax,%eax
}
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5f                   	pop    %edi
 4ee:	5d                   	pop    %ebp
 4ef:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 4f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 4f3:	83 c4 10             	add    $0x10,%esp
 4f6:	5b                   	pop    %ebx
 4f7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 4f8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 4fa:	5f                   	pop    %edi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 504:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 50b:	e9 67 ff ff ff       	jmp    477 <strstr+0x37>

00000510 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 510:	b8 01 00 00 00       	mov    $0x1,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <exit>:
SYSCALL(exit)
 518:	b8 02 00 00 00       	mov    $0x2,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <wait>:
SYSCALL(wait)
 520:	b8 03 00 00 00       	mov    $0x3,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <pipe>:
SYSCALL(pipe)
 528:	b8 04 00 00 00       	mov    $0x4,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <read>:
SYSCALL(read)
 530:	b8 05 00 00 00       	mov    $0x5,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <write>:
SYSCALL(write)
 538:	b8 10 00 00 00       	mov    $0x10,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <close>:
SYSCALL(close)
 540:	b8 15 00 00 00       	mov    $0x15,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <kill>:
SYSCALL(kill)
 548:	b8 06 00 00 00       	mov    $0x6,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <exec>:
SYSCALL(exec)
 550:	b8 07 00 00 00       	mov    $0x7,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <open>:
SYSCALL(open)
 558:	b8 0f 00 00 00       	mov    $0xf,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <mknod>:
SYSCALL(mknod)
 560:	b8 11 00 00 00       	mov    $0x11,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <unlink>:
SYSCALL(unlink)
 568:	b8 12 00 00 00       	mov    $0x12,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <fstat>:
SYSCALL(fstat)
 570:	b8 08 00 00 00       	mov    $0x8,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <link>:
SYSCALL(link)
 578:	b8 13 00 00 00       	mov    $0x13,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <mkdir>:
SYSCALL(mkdir)
 580:	b8 14 00 00 00       	mov    $0x14,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <chdir>:
SYSCALL(chdir)
 588:	b8 09 00 00 00       	mov    $0x9,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <dup>:
SYSCALL(dup)
 590:	b8 0a 00 00 00       	mov    $0xa,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <getpid>:
SYSCALL(getpid)
 598:	b8 0b 00 00 00       	mov    $0xb,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <sbrk>:
SYSCALL(sbrk)
 5a0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <sleep>:
SYSCALL(sleep)
 5a8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <uptime>:
SYSCALL(uptime)
 5b0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <mount>:
SYSCALL(mount)
 5b8:	b8 16 00 00 00       	mov    $0x16,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <umount>:
SYSCALL(umount)
 5c0:	b8 17 00 00 00       	mov    $0x17,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <printmounts>:
SYSCALL(printmounts)
 5c8:	b8 18 00 00 00       	mov    $0x18,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <printdevices>:
SYSCALL(printdevices)
 5d0:	b8 19 00 00 00       	mov    $0x19,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <unshare>:
SYSCALL(unshare)
 5d8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <usleep>:
SYSCALL(usleep)
 5e0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <ioctl>:
SYSCALL(ioctl)
 5e8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <getppid>:
SYSCALL(getppid)
 5f0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <getcpu>:
SYSCALL(getcpu)
 5f8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <getmem>:
SYSCALL(getmem)
 600:	b8 1f 00 00 00       	mov    $0x1f,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <kmemtest>:
SYSCALL(kmemtest)
 608:	b8 20 00 00 00       	mov    $0x20,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 619:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 61c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 61f:	85 db                	test   %ebx,%ebx
 621:	0f 84 91 00 00 00    	je     6b8 <printint+0xa8>
 627:	89 d0                	mov    %edx,%eax
 629:	c1 e8 1f             	shr    $0x1f,%eax
 62c:	84 c0                	test   %al,%al
 62e:	0f 84 84 00 00 00    	je     6b8 <printint+0xa8>
    neg = 1;
    x = -xx;
 634:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 636:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 63d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 63f:	31 ff                	xor    %edi,%edi
 641:	8d 75 c7             	lea    -0x39(%ebp),%esi
 644:	eb 0c                	jmp    652 <printint+0x42>
 646:	8d 76 00             	lea    0x0(%esi),%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 650:	89 df                	mov    %ebx,%edi
 652:	31 d2                	xor    %edx,%edx
 654:	8d 5f 01             	lea    0x1(%edi),%ebx
 657:	f7 f1                	div    %ecx
 659:	0f b6 92 50 0b 00 00 	movzbl 0xb50(%edx),%edx
  }while((x /= base) != 0);
 660:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 662:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 665:	75 e9                	jne    650 <printint+0x40>
  if(neg)
 667:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 66a:	85 c0                	test   %eax,%eax
 66c:	74 08                	je     676 <printint+0x66>
    buf[i++] = '-';
 66e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 673:	8d 5f 02             	lea    0x2(%edi),%ebx
 676:	8d 7d d8             	lea    -0x28(%ebp),%edi
 679:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 67d:	89 fa                	mov    %edi,%edx
 67f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 680:	0f b6 08             	movzbl (%eax),%ecx
 683:	83 e8 01             	sub    $0x1,%eax
 686:	83 c2 01             	add    $0x1,%edx
 689:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 68c:	39 f0                	cmp    %esi,%eax
 68e:	75 f0                	jne    680 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 690:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 693:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 698:	57                   	push   %edi
 699:	e8 f2 fa ff ff       	call   190 <strlen>
 69e:	83 c4 0c             	add    $0xc,%esp
 6a1:	50                   	push   %eax
 6a2:	57                   	push   %edi
 6a3:	ff 75 c0             	pushl  -0x40(%ebp)
 6a6:	e8 8d fe ff ff       	call   538 <write>
}
 6ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ae:	5b                   	pop    %ebx
 6af:	5e                   	pop    %esi
 6b0:	5f                   	pop    %edi
 6b1:	5d                   	pop    %ebp
 6b2:	c3                   	ret    
 6b3:	90                   	nop
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6b8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6ba:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6c1:	e9 79 ff ff ff       	jmp    63f <printint+0x2f>
 6c6:	8d 76 00             	lea    0x0(%esi),%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6d9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6dc:	0f b6 06             	movzbl (%esi),%eax
 6df:	84 c0                	test   %al,%al
 6e1:	0f 84 90 01 00 00    	je     877 <printf+0x1a7>
 6e7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 6ea:	31 ff                	xor    %edi,%edi
 6ec:	31 d2                	xor    %edx,%edx
 6ee:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6f1:	31 db                	xor    %ebx,%ebx
 6f3:	eb 39                	jmp    72e <printf+0x5e>
 6f5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6f8:	83 f9 25             	cmp    $0x25,%ecx
 6fb:	0f 84 af 00 00 00    	je     7b0 <printf+0xe0>
 701:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 704:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 707:	83 ec 04             	sub    $0x4,%esp
 70a:	6a 01                	push   $0x1
 70c:	50                   	push   %eax
 70d:	ff 75 08             	pushl  0x8(%ebp)
 710:	e8 23 fe ff ff       	call   538 <write>
 715:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 718:	85 c0                	test   %eax,%eax
 71a:	78 35                	js     751 <printf+0x81>
 71c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 71f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 722:	01 c7                	add    %eax,%edi
 724:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 726:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 72a:	84 c0                	test   %al,%al
 72c:	74 21                	je     74f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 72e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 731:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 733:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 736:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 739:	74 bd                	je     6f8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 73b:	83 fa 25             	cmp    $0x25,%edx
 73e:	74 20                	je     760 <printf+0x90>
 740:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 742:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 745:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 747:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 74b:	84 c0                	test   %al,%al
 74d:	75 df                	jne    72e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 74f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 751:	8d 65 f4             	lea    -0xc(%ebp),%esp
 754:	5b                   	pop    %ebx
 755:	5e                   	pop    %esi
 756:	5f                   	pop    %edi
 757:	5d                   	pop    %ebp
 758:	c3                   	ret    
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 760:	83 f9 64             	cmp    $0x64,%ecx
 763:	0f 84 7f 00 00 00    	je     7e8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 769:	0f be d0             	movsbl %al,%edx
 76c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 772:	83 fa 70             	cmp    $0x70,%edx
 775:	74 49                	je     7c0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 777:	83 f9 73             	cmp    $0x73,%ecx
 77a:	0f 84 98 00 00 00    	je     818 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 780:	83 f9 63             	cmp    $0x63,%ecx
 783:	0f 84 c7 00 00 00    	je     850 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 789:	83 f9 25             	cmp    $0x25,%ecx
 78c:	74 6a                	je     7f8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 78e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 791:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 794:	83 ec 04             	sub    $0x4,%esp
 797:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 799:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 79d:	50                   	push   %eax
 79e:	ff 75 08             	pushl  0x8(%ebp)
 7a1:	e8 92 fd ff ff       	call   538 <write>
 7a6:	83 c4 10             	add    $0x10,%esp
 7a9:	e9 6a ff ff ff       	jmp    718 <printf+0x48>
 7ae:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7b0:	ba 25 00 00 00       	mov    $0x25,%edx
 7b5:	31 c0                	xor    %eax,%eax
 7b7:	eb 89                	jmp    742 <printf+0x72>
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7c8:	6a 00                	push   $0x0
 7ca:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	8b 16                	mov    (%esi),%edx
        ap++;
 7d2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7d5:	e8 36 fe ff ff       	call   610 <printint>
        ap++;
 7da:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7dd:	83 c4 10             	add    $0x10,%esp
 7e0:	e9 33 ff ff ff       	jmp    718 <printf+0x48>
 7e5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 7e8:	83 ec 0c             	sub    $0xc,%esp
 7eb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f0:	6a 01                	push   $0x1
 7f2:	eb d6                	jmp    7ca <printf+0xfa>
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7f8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 7fb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7fe:	83 ec 04             	sub    $0x4,%esp
 801:	6a 01                	push   $0x1
 803:	50                   	push   %eax
 804:	ff 75 08             	pushl  0x8(%ebp)
 807:	e8 2c fd ff ff       	call   538 <write>
 80c:	83 c4 10             	add    $0x10,%esp
 80f:	e9 04 ff ff ff       	jmp    718 <printf+0x48>
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 818:	8b 45 d0             	mov    -0x30(%ebp),%eax
 81b:	8b 30                	mov    (%eax),%esi
        ap++;
 81d:	83 c0 04             	add    $0x4,%eax
 820:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 823:	b8 48 0b 00 00       	mov    $0xb48,%eax
 828:	85 f6                	test   %esi,%esi
 82a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 82d:	83 ec 0c             	sub    $0xc,%esp
 830:	56                   	push   %esi
 831:	e8 5a f9 ff ff       	call   190 <strlen>
 836:	83 c4 0c             	add    $0xc,%esp
 839:	50                   	push   %eax
 83a:	56                   	push   %esi
 83b:	ff 75 08             	pushl  0x8(%ebp)
 83e:	e8 f5 fc ff ff       	call   538 <write>
 843:	83 c4 10             	add    $0x10,%esp
 846:	e9 cd fe ff ff       	jmp    718 <printf+0x48>
 84b:	90                   	nop
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 850:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 853:	83 ec 04             	sub    $0x4,%esp
 856:	8b 06                	mov    (%esi),%eax
 858:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 85a:	83 c6 04             	add    $0x4,%esi
 85d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 860:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 863:	50                   	push   %eax
 864:	ff 75 08             	pushl  0x8(%ebp)
 867:	e8 cc fc ff ff       	call   538 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 86c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 86f:	83 c4 10             	add    $0x10,%esp
 872:	e9 a1 fe ff ff       	jmp    718 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 877:	31 c0                	xor    %eax,%eax
 879:	e9 d3 fe ff ff       	jmp    751 <printf+0x81>
 87e:	66 90                	xchg   %ax,%ax

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 881:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 886:	89 e5                	mov    %esp,%ebp
 888:	57                   	push   %edi
 889:	56                   	push   %esi
 88a:	53                   	push   %ebx
 88b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 88e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 890:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 893:	39 c8                	cmp    %ecx,%eax
 895:	73 19                	jae    8b0 <free+0x30>
 897:	89 f6                	mov    %esi,%esi
 899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8a0:	39 d1                	cmp    %edx,%ecx
 8a2:	72 1c                	jb     8c0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a4:	39 d0                	cmp    %edx,%eax
 8a6:	73 18                	jae    8c0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8aa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ae:	72 f0                	jb     8a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b0:	39 d0                	cmp    %edx,%eax
 8b2:	72 f4                	jb     8a8 <free+0x28>
 8b4:	39 d1                	cmp    %edx,%ecx
 8b6:	73 f0                	jae    8a8 <free+0x28>
 8b8:	90                   	nop
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8c6:	39 d7                	cmp    %edx,%edi
 8c8:	74 19                	je     8e3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8cd:	8b 50 04             	mov    0x4(%eax),%edx
 8d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8d3:	39 f1                	cmp    %esi,%ecx
 8d5:	74 23                	je     8fa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8d7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8d9:	a3 00 20 00 00       	mov    %eax,0x2000
}
 8de:	5b                   	pop    %ebx
 8df:	5e                   	pop    %esi
 8e0:	5f                   	pop    %edi
 8e1:	5d                   	pop    %ebp
 8e2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8e3:	03 72 04             	add    0x4(%edx),%esi
 8e6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e9:	8b 10                	mov    (%eax),%edx
 8eb:	8b 12                	mov    (%edx),%edx
 8ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8f0:	8b 50 04             	mov    0x4(%eax),%edx
 8f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f6:	39 f1                	cmp    %esi,%ecx
 8f8:	75 dd                	jne    8d7 <free+0x57>
    p->s.size += bp->s.size;
 8fa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 8fd:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 902:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 905:	8b 53 f8             	mov    -0x8(%ebx),%edx
 908:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 90a:	5b                   	pop    %ebx
 90b:	5e                   	pop    %esi
 90c:	5f                   	pop    %edi
 90d:	5d                   	pop    %ebp
 90e:	c3                   	ret    
 90f:	90                   	nop

00000910 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 919:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 91c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 922:	8d 78 07             	lea    0x7(%eax),%edi
 925:	c1 ef 03             	shr    $0x3,%edi
 928:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 92b:	85 d2                	test   %edx,%edx
 92d:	0f 84 a3 00 00 00    	je     9d6 <malloc+0xc6>
 933:	8b 02                	mov    (%edx),%eax
 935:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 938:	39 cf                	cmp    %ecx,%edi
 93a:	76 74                	jbe    9b0 <malloc+0xa0>
 93c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 942:	be 00 10 00 00       	mov    $0x1000,%esi
 947:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 94e:	0f 43 f7             	cmovae %edi,%esi
 951:	ba 00 80 00 00       	mov    $0x8000,%edx
 956:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 95c:	0f 46 da             	cmovbe %edx,%ebx
 95f:	eb 10                	jmp    971 <malloc+0x61>
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 968:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 96a:	8b 48 04             	mov    0x4(%eax),%ecx
 96d:	39 cf                	cmp    %ecx,%edi
 96f:	76 3f                	jbe    9b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 971:	39 05 00 20 00 00    	cmp    %eax,0x2000
 977:	89 c2                	mov    %eax,%edx
 979:	75 ed                	jne    968 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 97b:	83 ec 0c             	sub    $0xc,%esp
 97e:	53                   	push   %ebx
 97f:	e8 1c fc ff ff       	call   5a0 <sbrk>
  if(p == (char*)-1)
 984:	83 c4 10             	add    $0x10,%esp
 987:	83 f8 ff             	cmp    $0xffffffff,%eax
 98a:	74 1c                	je     9a8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 98c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 98f:	83 ec 0c             	sub    $0xc,%esp
 992:	83 c0 08             	add    $0x8,%eax
 995:	50                   	push   %eax
 996:	e8 e5 fe ff ff       	call   880 <free>
  return freep;
 99b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 9a1:	83 c4 10             	add    $0x10,%esp
 9a4:	85 d2                	test   %edx,%edx
 9a6:	75 c0                	jne    968 <malloc+0x58>
        return 0;
 9a8:	31 c0                	xor    %eax,%eax
 9aa:	eb 1c                	jmp    9c8 <malloc+0xb8>
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9b0:	39 cf                	cmp    %ecx,%edi
 9b2:	74 1c                	je     9d0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9b4:	29 f9                	sub    %edi,%ecx
 9b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9bc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 9bf:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 9c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9cb:	5b                   	pop    %ebx
 9cc:	5e                   	pop    %esi
 9cd:	5f                   	pop    %edi
 9ce:	5d                   	pop    %ebp
 9cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 9d0:	8b 08                	mov    (%eax),%ecx
 9d2:	89 0a                	mov    %ecx,(%edx)
 9d4:	eb e9                	jmp    9bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9d6:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 9dd:	20 00 00 
 9e0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 9e7:	20 00 00 
    base.s.size = 0;
 9ea:	b8 04 20 00 00       	mov    $0x2004,%eax
 9ef:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 9f6:	00 00 00 
 9f9:	e9 3e ff ff ff       	jmp    93c <malloc+0x2c>
 9fe:	66 90                	xchg   %ax,%ax

00000a00 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 a06:	6a 10                	push   $0x10
 a08:	6a 02                	push   $0x2
 a0a:	ff 75 08             	pushl  0x8(%ebp)
 a0d:	e8 d6 fb ff ff       	call   5e8 <ioctl>
}
 a12:	c9                   	leave  
 a13:	c3                   	ret    
 a14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a20 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
 a23:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 a26:	68 00 10 00 00       	push   $0x1000
 a2b:	6a 02                	push   $0x2
 a2d:	ff 75 08             	pushl  0x8(%ebp)
 a30:	e8 b3 fb ff ff       	call   5e8 <ioctl>
}
 a35:	c9                   	leave  
 a36:	c3                   	ret    
 a37:	89 f6                	mov    %esi,%esi
 a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a40 <attach_tty>:

int
attach_tty(int tty_fd)
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	53                   	push   %ebx
 a44:	83 ec 08             	sub    $0x8,%esp
 a47:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 a4a:	6a 10                	push   $0x10
 a4c:	6a 01                	push   $0x1
 a4e:	53                   	push   %ebx
 a4f:	e8 94 fb ff ff       	call   5e8 <ioctl>
 a54:	83 c4 10             	add    $0x10,%esp
 a57:	85 c0                	test   %eax,%eax
 a59:	78 55                	js     ab0 <attach_tty+0x70>
     return -1;

    close(0);
 a5b:	83 ec 0c             	sub    $0xc,%esp
 a5e:	6a 00                	push   $0x0
 a60:	e8 db fa ff ff       	call   540 <close>
    close(1);
 a65:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a6c:	e8 cf fa ff ff       	call   540 <close>
    close(2);
 a71:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a78:	e8 c3 fa ff ff       	call   540 <close>
    if(dup(tty_fd) < 0)
 a7d:	89 1c 24             	mov    %ebx,(%esp)
 a80:	e8 0b fb ff ff       	call   590 <dup>
 a85:	83 c4 10             	add    $0x10,%esp
 a88:	85 c0                	test   %eax,%eax
 a8a:	78 24                	js     ab0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 a8c:	83 ec 0c             	sub    $0xc,%esp
 a8f:	53                   	push   %ebx
 a90:	e8 fb fa ff ff       	call   590 <dup>
 a95:	83 c4 10             	add    $0x10,%esp
 a98:	85 c0                	test   %eax,%eax
 a9a:	78 14                	js     ab0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 a9c:	83 ec 0c             	sub    $0xc,%esp
 a9f:	53                   	push   %ebx
 aa0:	e8 eb fa ff ff       	call   590 <dup>
 aa5:	83 c4 10             	add    $0x10,%esp
 aa8:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 aab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aae:	c9                   	leave  
 aaf:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 ab0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 ab5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ab8:	c9                   	leave  
 ab9:	c3                   	ret    
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ac0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 ac6:	6a 20                	push   $0x20
 ac8:	6a 01                	push   $0x1
 aca:	ff 75 08             	pushl  0x8(%ebp)
 acd:	e8 16 fb ff ff       	call   5e8 <ioctl>
    return 0;
}
 ad2:	31 c0                	xor    %eax,%eax
 ad4:	c9                   	leave  
 ad5:	c3                   	ret    
 ad6:	8d 76 00             	lea    0x0(%esi),%esi
 ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ae0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	53                   	push   %ebx
 ae4:	83 ec 08             	sub    $0x8,%esp
 ae7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 aea:	6a 10                	push   $0x10
 aec:	6a 02                	push   $0x2
 aee:	53                   	push   %ebx
 aef:	e8 f4 fa ff ff       	call   5e8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 af4:	83 c4 10             	add    $0x10,%esp
 af7:	85 c0                	test   %eax,%eax
 af9:	74 1d                	je     b18 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 afb:	83 ec 04             	sub    $0x4,%esp
 afe:	68 00 10 00 00       	push   $0x1000
 b03:	6a 01                	push   $0x1
 b05:	53                   	push   %ebx
 b06:	e8 dd fa ff ff       	call   5e8 <ioctl>
     return tty_fd;
 b0b:	83 c4 10             	add    $0x10,%esp
 b0e:	89 d8                	mov    %ebx,%eax
}
 b10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b13:	c9                   	leave  
 b14:	c3                   	ret    
 b15:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 b18:	83 ec 0c             	sub    $0xc,%esp
 b1b:	53                   	push   %ebx
 b1c:	e8 1f fa ff ff       	call   540 <close>
       return -1;
 b21:	83 c4 10             	add    $0x10,%esp
 b24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b29:	eb e5                	jmp    b10 <connect_tty+0x30>
 b2b:	90                   	nop
 b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b30 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 b36:	68 00 20 00 00       	push   $0x2000
 b3b:	6a 01                	push   $0x1
 b3d:	ff 75 08             	pushl  0x8(%ebp)
 b40:	e8 a3 fa ff ff       	call   5e8 <ioctl>
}
 b45:	c9                   	leave  
 b46:	c3                   	ret    
