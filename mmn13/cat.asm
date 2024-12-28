
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	eb 1d                	jmp    27 <cat+0x27>
   a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  10:	83 ec 04             	sub    $0x4,%esp
  13:	53                   	push   %ebx
  14:	68 20 20 00 00       	push   $0x2020
  19:	6a 01                	push   $0x1
  1b:	e8 c8 05 00 00       	call   5e8 <write>
  20:	83 c4 10             	add    $0x10,%esp
  23:	39 c3                	cmp    %eax,%ebx
  25:	75 26                	jne    4d <cat+0x4d>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  27:	83 ec 04             	sub    $0x4,%esp
  2a:	68 00 02 00 00       	push   $0x200
  2f:	68 20 20 00 00       	push   $0x2020
  34:	56                   	push   %esi
  35:	e8 a6 05 00 00       	call   5e0 <read>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	83 f8 00             	cmp    $0x0,%eax
  40:	89 c3                	mov    %eax,%ebx
  42:	7f cc                	jg     10 <cat+0x10>
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit(1);
    }
  }
  if(n < 0){
  44:	75 22                	jne    68 <cat+0x68>
    printf(1, "cat: read error\n");
    exit(1);
  }
}
  46:	8d 65 f8             	lea    -0x8(%ebp),%esp
  49:	5b                   	pop    %ebx
  4a:	5e                   	pop    %esi
  4b:	5d                   	pop    %ebp
  4c:	c3                   	ret    
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
  4d:	83 ec 08             	sub    $0x8,%esp
  50:	68 f8 0b 00 00       	push   $0xbf8
  55:	6a 01                	push   $0x1
  57:	e8 24 07 00 00       	call   780 <printf>
      exit(1);
  5c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  63:	e8 60 05 00 00       	call   5c8 <exit>
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
  68:	83 ec 08             	sub    $0x8,%esp
  6b:	68 0a 0c 00 00       	push   $0xc0a
  70:	6a 01                	push   $0x1
  72:	e8 09 07 00 00       	call   780 <printf>
    exit(1);
  77:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7e:	e8 45 05 00 00       	call   5c8 <exit>
  83:	66 90                	xchg   %ax,%ax
  85:	66 90                	xchg   %ax,%ax
  87:	66 90                	xchg   %ax,%ax
  89:	66 90                	xchg   %ax,%ax
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <main>:
  }
}

int
main(int argc, char *argv[])
{
  90:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  94:	83 e4 f0             	and    $0xfffffff0,%esp
  97:	ff 71 fc             	pushl  -0x4(%ecx)
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	57                   	push   %edi
  9e:	56                   	push   %esi
  9f:	53                   	push   %ebx
  a0:	51                   	push   %ecx
  a1:	be 01 00 00 00       	mov    $0x1,%esi
  a6:	83 ec 18             	sub    $0x18,%esp
  a9:	8b 01                	mov    (%ecx),%eax
  ab:	8b 59 04             	mov    0x4(%ecx),%ebx
  ae:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  b1:	83 f8 01             	cmp    $0x1,%eax
  }
}

int
main(int argc, char *argv[])
{
  b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
  b7:	7e 60                	jle    119 <main+0x89>
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  c0:	83 ec 08             	sub    $0x8,%esp
  c3:	6a 00                	push   $0x0
  c5:	ff 33                	pushl  (%ebx)
  c7:	e8 3c 05 00 00       	call   608 <open>
  cc:	83 c4 10             	add    $0x10,%esp
  cf:	85 c0                	test   %eax,%eax
  d1:	89 c7                	mov    %eax,%edi
  d3:	78 29                	js     fe <main+0x6e>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit(1);
    }
    cat(fd);
  d5:	83 ec 0c             	sub    $0xc,%esp
  if(argc <= 1){
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
  d8:	83 c6 01             	add    $0x1,%esi
  db:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit(1);
    }
    cat(fd);
  de:	50                   	push   %eax
  df:	e8 1c ff ff ff       	call   0 <cat>
    close(fd);
  e4:	89 3c 24             	mov    %edi,(%esp)
  e7:	e8 04 05 00 00       	call   5f0 <close>
  if(argc <= 1){
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
  ec:	83 c4 10             	add    $0x10,%esp
  ef:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  f2:	75 cc                	jne    c0 <main+0x30>
      exit(1);
    }
    cat(fd);
    close(fd);
  }
  exit(0);
  f4:	83 ec 0c             	sub    $0xc,%esp
  f7:	6a 00                	push   $0x0
  f9:	e8 ca 04 00 00       	call   5c8 <exit>
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
  fe:	50                   	push   %eax
  ff:	ff 33                	pushl  (%ebx)
 101:	68 1b 0c 00 00       	push   $0xc1b
 106:	6a 01                	push   $0x1
 108:	e8 73 06 00 00       	call   780 <printf>
      exit(1);
 10d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 114:	e8 af 04 00 00       	call   5c8 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
 119:	83 ec 0c             	sub    $0xc,%esp
 11c:	6a 00                	push   $0x0
 11e:	e8 dd fe ff ff       	call   0 <cat>
    exit(0);
 123:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 12a:	e8 99 04 00 00       	call   5c8 <exit>
 12f:	90                   	nop

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 13a:	89 c2                	mov    %eax,%edx
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	83 c1 01             	add    $0x1,%ecx
 143:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 147:	83 c2 01             	add    $0x1,%edx
 14a:	84 db                	test   %bl,%bl
 14c:	88 5a ff             	mov    %bl,-0x1(%edx)
 14f:	75 ef                	jne    140 <strcpy+0x10>
    ;
  return os;
}
 151:	5b                   	pop    %ebx
 152:	5d                   	pop    %ebp
 153:	c3                   	ret    
 154:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 15a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000160 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	56                   	push   %esi
 164:	53                   	push   %ebx
 165:	8b 55 08             	mov    0x8(%ebp),%edx
 168:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 16b:	0f b6 02             	movzbl (%edx),%eax
 16e:	0f b6 19             	movzbl (%ecx),%ebx
 171:	84 c0                	test   %al,%al
 173:	75 1e                	jne    193 <strcmp+0x33>
 175:	eb 29                	jmp    1a0 <strcmp+0x40>
 177:	89 f6                	mov    %esi,%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 180:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 183:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 186:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 189:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 18d:	84 c0                	test   %al,%al
 18f:	74 0f                	je     1a0 <strcmp+0x40>
 191:	89 f1                	mov    %esi,%ecx
 193:	38 d8                	cmp    %bl,%al
 195:	74 e9                	je     180 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 197:	29 d8                	sub    %ebx,%eax
}
 199:	5b                   	pop    %ebx
 19a:	5e                   	pop    %esi
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
 19d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1a0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1a2:	29 d8                	sub    %ebx,%eax
}
 1a4:	5b                   	pop    %ebx
 1a5:	5e                   	pop    %esi
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    
 1a8:	90                   	nop
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	8b 55 08             	mov    0x8(%ebp),%edx
 1b8:	53                   	push   %ebx
 1b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 1bc:	0f b6 32             	movzbl (%edx),%esi
 1bf:	89 f0                	mov    %esi,%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	74 67                	je     22c <strncmp+0x7c>
 1c5:	0f b6 19             	movzbl (%ecx),%ebx
 1c8:	89 f0                	mov    %esi,%eax
 1ca:	38 d8                	cmp    %bl,%al
 1cc:	75 65                	jne    233 <strncmp+0x83>
 1ce:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1d1:	89 f0                	mov    %esi,%eax
 1d3:	0f b6 f0             	movzbl %al,%esi
 1d6:	89 f0                	mov    %esi,%eax
 1d8:	83 eb 01             	sub    $0x1,%ebx
 1db:	75 14                	jne    1f1 <strncmp+0x41>
 1dd:	eb 25                	jmp    204 <strncmp+0x54>
 1df:	90                   	nop
 1e0:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 1e4:	89 f1                	mov    %esi,%ecx
 1e6:	38 c8                	cmp    %cl,%al
 1e8:	75 26                	jne    210 <strncmp+0x60>
 1ea:	83 eb 01             	sub    $0x1,%ebx
 1ed:	89 f9                	mov    %edi,%ecx
 1ef:	74 2f                	je     220 <strncmp+0x70>
    p++, q++;
 1f1:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 1f4:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1f7:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 1fa:	84 c0                	test   %al,%al
 1fc:	75 e2                	jne    1e0 <strncmp+0x30>
 1fe:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 202:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 204:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 205:	29 f0                	sub    %esi,%eax
}
 207:	5e                   	pop    %esi
 208:	5f                   	pop    %edi
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    
 20b:	90                   	nop
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	0f b6 f1             	movzbl %cl,%esi
 213:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 214:	29 f0                	sub    %esi,%eax
}
 216:	5e                   	pop    %esi
 217:	5f                   	pop    %edi
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 220:	0f b6 f0             	movzbl %al,%esi
 223:	89 f0                	mov    %esi,%eax
 225:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 226:	29 f0                	sub    %esi,%eax
}
 228:	5e                   	pop    %esi
 229:	5f                   	pop    %edi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 22c:	31 c0                	xor    %eax,%eax
 22e:	0f b6 31             	movzbl (%ecx),%esi
 231:	eb d1                	jmp    204 <strncmp+0x54>
 233:	0f b6 c0             	movzbl %al,%eax
 236:	0f b6 f3             	movzbl %bl,%esi
 239:	eb c9                	jmp    204 <strncmp+0x54>
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 246:	80 39 00             	cmpb   $0x0,(%ecx)
 249:	74 12                	je     25d <strlen+0x1d>
 24b:	31 d2                	xor    %edx,%edx
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	83 c2 01             	add    $0x1,%edx
 253:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 257:	89 d0                	mov    %edx,%eax
 259:	75 f5                	jne    250 <strlen+0x10>
    ;
  return n;
}
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 25d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	eb 0d                	jmp    270 <memset>
 263:	90                   	nop
 264:	90                   	nop
 265:	90                   	nop
 266:	90                   	nop
 267:	90                   	nop
 268:	90                   	nop
 269:	90                   	nop
 26a:	90                   	nop
 26b:	90                   	nop
 26c:	90                   	nop
 26d:	90                   	nop
 26e:	90                   	nop
 26f:	90                   	nop

00000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 277:	8b 4d 10             	mov    0x10(%ebp),%ecx
 27a:	8b 45 0c             	mov    0xc(%ebp),%eax
 27d:	89 d7                	mov    %edx,%edi
 27f:	fc                   	cld    
 280:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 282:	89 d0                	mov    %edx,%eax
 284:	5f                   	pop    %edi
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <strchr>:

char*
strchr(const char *s, char c)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 29a:	0f b6 10             	movzbl (%eax),%edx
 29d:	84 d2                	test   %dl,%dl
 29f:	74 1d                	je     2be <strchr+0x2e>
    if(*s == c)
 2a1:	38 d3                	cmp    %dl,%bl
 2a3:	89 d9                	mov    %ebx,%ecx
 2a5:	75 0d                	jne    2b4 <strchr+0x24>
 2a7:	eb 17                	jmp    2c0 <strchr+0x30>
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2b0:	38 ca                	cmp    %cl,%dl
 2b2:	74 0c                	je     2c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b4:	83 c0 01             	add    $0x1,%eax
 2b7:	0f b6 10             	movzbl (%eax),%edx
 2ba:	84 d2                	test   %dl,%dl
 2bc:	75 f2                	jne    2b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2be:	31 c0                	xor    %eax,%eax
}
 2c0:	5b                   	pop    %ebx
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <gets>:

char*
gets(char *buf, int max)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
 2d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2d6:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d9:	31 db                	xor    %ebx,%ebx
 2db:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 2e0:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 2e6:	7d 30                	jge    318 <gets+0x48>
    cc = read(0, &c, 1);
 2e8:	83 ec 04             	sub    $0x4,%esp
 2eb:	6a 01                	push   $0x1
 2ed:	56                   	push   %esi
 2ee:	6a 00                	push   $0x0
 2f0:	e8 eb 02 00 00       	call   5e0 <read>
    if(cc < 1)
 2f5:	83 c4 10             	add    $0x10,%esp
 2f8:	85 c0                	test   %eax,%eax
 2fa:	7e e7                	jle    2e3 <gets+0x13>
      continue;
    buf[i++] = c;
 2fc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 300:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 303:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 305:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 308:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 30a:	74 0c                	je     318 <gets+0x48>
 30c:	3c 0d                	cmp    $0xd,%al
 30e:	74 08                	je     318 <gets+0x48>
 310:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 313:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 316:	7c d0                	jl     2e8 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 31f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 322:	5b                   	pop    %ebx
 323:	5e                   	pop    %esi
 324:	5f                   	pop    %edi
 325:	5d                   	pop    %ebp
 326:	c3                   	ret    
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	pushl  0x8(%ebp)
 33d:	e8 c6 02 00 00       	call   608 <open>
  if(fd < 0)
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	pushl  0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 c9 02 00 00       	call   620 <fstat>
 357:	89 c6                	mov    %eax,%esi
  close(fd);
 359:	89 1c 24             	mov    %ebx,(%esp)
 35c:	e8 8f 02 00 00       	call   5f0 <close>
  return r;
 361:	83 c4 10             	add    $0x10,%esp
 364:	89 f0                	mov    %esi,%eax
}
 366:	8d 65 f8             	lea    -0x8(%ebp),%esp
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 370:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 375:	eb ef                	jmp    366 <stat+0x36>
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 387:	0f be 11             	movsbl (%ecx),%edx
 38a:	8d 42 d0             	lea    -0x30(%edx),%eax
 38d:	3c 09                	cmp    $0x9,%al
 38f:	b8 00 00 00 00       	mov    $0x0,%eax
 394:	77 1f                	ja     3b5 <atoi+0x35>
 396:	8d 76 00             	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3a3:	83 c1 01             	add    $0x1,%ecx
 3a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3aa:	0f be 11             	movsbl (%ecx),%edx
 3ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3b5:	5b                   	pop    %ebx
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    
 3b8:	90                   	nop
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
 3c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3c8:	8b 45 08             	mov    0x8(%ebp),%eax
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ce:	85 db                	test   %ebx,%ebx
 3d0:	7e 14                	jle    3e6 <memmove+0x26>
 3d2:	31 d2                	xor    %edx,%edx
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3df:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3e2:	39 da                	cmp    %ebx,%edx
 3e4:	75 f2                	jne    3d8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5d                   	pop    %ebp
 3e9:	c3                   	ret    
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 04             	sub    $0x4,%esp
 3f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 3fc:	83 f9 00             	cmp    $0x0,%ecx
 3ff:	7e 76                	jle    477 <itoa+0x87>
 401:	89 cb                	mov    %ecx,%ebx
 403:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 405:	bf 67 66 66 66       	mov    $0x66666667,%edi
 40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 410:	89 d8                	mov    %ebx,%eax
 412:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 415:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 418:	f7 ef                	imul   %edi
 41a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 41d:	29 da                	sub    %ebx,%edx
 41f:	89 d3                	mov    %edx,%ebx
 421:	75 ed                	jne    410 <itoa+0x20>
        length++;
 423:	89 f3                	mov    %esi,%ebx
 425:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 428:	bf 67 66 66 66       	mov    $0x66666667,%edi
 42d:	8b 75 08             	mov    0x8(%ebp),%esi
 430:	eb 0a                	jmp    43c <itoa+0x4c>
 432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 438:	85 db                	test   %ebx,%ebx
 43a:	7e 25                	jle    461 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 43c:	89 c8                	mov    %ecx,%eax
 43e:	f7 ef                	imul   %edi
 440:	89 c8                	mov    %ecx,%eax
 442:	c1 f8 1f             	sar    $0x1f,%eax
 445:	c1 fa 02             	sar    $0x2,%edx
 448:	29 c2                	sub    %eax,%edx
 44a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 44d:	01 c0                	add    %eax,%eax
 44f:	29 c1                	sub    %eax,%ecx
 451:	83 c1 30             	add    $0x30,%ecx
 454:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 458:	83 eb 01             	sub    $0x1,%ebx
 45b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 45d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 45f:	7f d7                	jg     438 <itoa+0x48>
 461:	8b 75 f0             	mov    -0x10(%ebp),%esi
 464:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 466:	8b 7d 08             	mov    0x8(%ebp),%edi
 469:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 46d:	83 c4 04             	add    $0x4,%esp
 470:	89 f0                	mov    %esi,%eax
 472:	5b                   	pop    %ebx
 473:	5e                   	pop    %esi
 474:	5f                   	pop    %edi
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 477:	75 12                	jne    48b <itoa+0x9b>
        buf[0] = '0';
 479:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 47c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 481:	c6 00 30             	movb   $0x30,(%eax)
 484:	b8 01 00 00 00       	mov    $0x1,%eax
 489:	eb db                	jmp    466 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 48b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 48d:	31 f6                	xor    %esi,%esi
 48f:	eb d5                	jmp    466 <itoa+0x76>
 491:	eb 0d                	jmp    4a0 <strcat>
 493:	90                   	nop
 494:	90                   	nop
 495:	90                   	nop
 496:	90                   	nop
 497:	90                   	nop
 498:	90                   	nop
 499:	90                   	nop
 49a:	90                   	nop
 49b:	90                   	nop
 49c:	90                   	nop
 49d:	90                   	nop
 49e:	90                   	nop
 49f:	90                   	nop

000004a0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	53                   	push   %ebx
 4a9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 4ac:	80 38 00             	cmpb   $0x0,(%eax)
 4af:	74 38                	je     4e9 <strcat+0x49>
 4b1:	31 c9                	xor    %ecx,%ecx
 4b3:	90                   	nop
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b8:	83 c1 01             	add    $0x1,%ecx
 4bb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 4bf:	89 ca                	mov    %ecx,%edx
 4c1:	75 f5                	jne    4b8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 4c3:	0f b6 1e             	movzbl (%esi),%ebx
 4c6:	84 db                	test   %bl,%bl
 4c8:	74 16                	je     4e0 <strcat+0x40>
 4ca:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 4cd:	31 d2                	xor    %edx,%edx
 4cf:	90                   	nop
                dest[i + j] = source[j];
 4d0:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 4d3:	83 c2 01             	add    $0x1,%edx
 4d6:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 4da:	84 db                	test   %bl,%bl
 4dc:	75 f2                	jne    4d0 <strcat+0x30>
 4de:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 4e0:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 4e4:	5b                   	pop    %ebx
 4e5:	5e                   	pop    %esi
 4e6:	5f                   	pop    %edi
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 4e9:	31 d2                	xor    %edx,%edx
 4eb:	31 c9                	xor    %ecx,%ecx
 4ed:	eb d4                	jmp    4c3 <strcat+0x23>
 4ef:	90                   	nop

000004f0 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4f9:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 4fc:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 4ff:	0f b6 00             	movzbl (%eax),%eax
 502:	84 c0                	test   %al,%al
 504:	88 45 f3             	mov    %al,-0xd(%ebp)
 507:	0f 84 a0 00 00 00    	je     5ad <strstr+0xbd>
 50d:	8b 55 0c             	mov    0xc(%ebp),%edx
 510:	31 c0                	xor    %eax,%eax
 512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 518:	83 c0 01             	add    $0x1,%eax
 51b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 51f:	75 f7                	jne    518 <strstr+0x28>
 521:	89 45 e8             	mov    %eax,-0x18(%ebp)
 524:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 527:	0f b6 07             	movzbl (%edi),%eax
 52a:	84 c0                	test   %al,%al
 52c:	74 68                	je     596 <strstr+0xa6>
 52e:	31 d2                	xor    %edx,%edx
 530:	83 c2 01             	add    $0x1,%edx
 533:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 537:	75 f7                	jne    530 <strstr+0x40>
 539:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 53c:	84 c0                	test   %al,%al
 53e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 541:	74 4d                	je     590 <strstr+0xa0>
 543:	90                   	nop
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 548:	38 45 f3             	cmp    %al,-0xd(%ebp)
 54b:	75 34                	jne    581 <strstr+0x91>
 54d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 550:	83 eb 01             	sub    $0x1,%ebx
 553:	74 4b                	je     5a0 <strstr+0xb0>
 555:	8b 55 0c             	mov    0xc(%ebp),%edx
 558:	89 f8                	mov    %edi,%eax
 55a:	eb 10                	jmp    56c <strstr+0x7c>
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 560:	3a 4a 01             	cmp    0x1(%edx),%cl
 563:	75 1c                	jne    581 <strstr+0x91>
 565:	83 eb 01             	sub    $0x1,%ebx
 568:	89 f2                	mov    %esi,%edx
 56a:	74 34                	je     5a0 <strstr+0xb0>
    p++, q++;
 56c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 56f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 572:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 575:	84 c9                	test   %cl,%cl
 577:	75 e7                	jne    560 <strstr+0x70>
 579:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 57d:	84 c0                	test   %al,%al
 57f:	74 1f                	je     5a0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 581:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 584:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 587:	74 0d                	je     596 <strstr+0xa6>
 589:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 58c:	84 c0                	test   %al,%al
 58e:	75 b8                	jne    548 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 590:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 594:	eb e7                	jmp    57d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 596:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 599:	31 c0                	xor    %eax,%eax
}
 59b:	5b                   	pop    %ebx
 59c:	5e                   	pop    %esi
 59d:	5f                   	pop    %edi
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 5a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 5a3:	83 c4 10             	add    $0x10,%esp
 5a6:	5b                   	pop    %ebx
 5a7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 5a8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 5aa:	5f                   	pop    %edi
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 5ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5b4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 5bb:	e9 67 ff ff ff       	jmp    527 <strstr+0x37>

000005c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c0:	b8 01 00 00 00       	mov    $0x1,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <exit>:
SYSCALL(exit)
 5c8:	b8 02 00 00 00       	mov    $0x2,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <wait>:
SYSCALL(wait)
 5d0:	b8 03 00 00 00       	mov    $0x3,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <pipe>:
SYSCALL(pipe)
 5d8:	b8 04 00 00 00       	mov    $0x4,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <read>:
SYSCALL(read)
 5e0:	b8 05 00 00 00       	mov    $0x5,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <write>:
SYSCALL(write)
 5e8:	b8 10 00 00 00       	mov    $0x10,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <close>:
SYSCALL(close)
 5f0:	b8 15 00 00 00       	mov    $0x15,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <kill>:
SYSCALL(kill)
 5f8:	b8 06 00 00 00       	mov    $0x6,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <exec>:
SYSCALL(exec)
 600:	b8 07 00 00 00       	mov    $0x7,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <open>:
SYSCALL(open)
 608:	b8 0f 00 00 00       	mov    $0xf,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <mknod>:
SYSCALL(mknod)
 610:	b8 11 00 00 00       	mov    $0x11,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <unlink>:
SYSCALL(unlink)
 618:	b8 12 00 00 00       	mov    $0x12,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <fstat>:
SYSCALL(fstat)
 620:	b8 08 00 00 00       	mov    $0x8,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <link>:
SYSCALL(link)
 628:	b8 13 00 00 00       	mov    $0x13,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <mkdir>:
SYSCALL(mkdir)
 630:	b8 14 00 00 00       	mov    $0x14,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <chdir>:
SYSCALL(chdir)
 638:	b8 09 00 00 00       	mov    $0x9,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <dup>:
SYSCALL(dup)
 640:	b8 0a 00 00 00       	mov    $0xa,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <getpid>:
SYSCALL(getpid)
 648:	b8 0b 00 00 00       	mov    $0xb,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <sbrk>:
SYSCALL(sbrk)
 650:	b8 0c 00 00 00       	mov    $0xc,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <sleep>:
SYSCALL(sleep)
 658:	b8 0d 00 00 00       	mov    $0xd,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <uptime>:
SYSCALL(uptime)
 660:	b8 0e 00 00 00       	mov    $0xe,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <mount>:
SYSCALL(mount)
 668:	b8 16 00 00 00       	mov    $0x16,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <umount>:
SYSCALL(umount)
 670:	b8 17 00 00 00       	mov    $0x17,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <printmounts>:
SYSCALL(printmounts)
 678:	b8 18 00 00 00       	mov    $0x18,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <printdevices>:
SYSCALL(printdevices)
 680:	b8 19 00 00 00       	mov    $0x19,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <unshare>:
SYSCALL(unshare)
 688:	b8 1a 00 00 00       	mov    $0x1a,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <usleep>:
SYSCALL(usleep)
 690:	b8 1b 00 00 00       	mov    $0x1b,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <ioctl>:
SYSCALL(ioctl)
 698:	b8 1c 00 00 00       	mov    $0x1c,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <getppid>:
SYSCALL(getppid)
 6a0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <getcpu>:
SYSCALL(getcpu)
 6a8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <getmem>:
SYSCALL(getmem)
 6b0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <kmemtest>:
SYSCALL(kmemtest)
 6b8:	b8 20 00 00 00       	mov    $0x20,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 6cc:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6cf:	85 db                	test   %ebx,%ebx
 6d1:	0f 84 91 00 00 00    	je     768 <printint+0xa8>
 6d7:	89 d0                	mov    %edx,%eax
 6d9:	c1 e8 1f             	shr    $0x1f,%eax
 6dc:	84 c0                	test   %al,%al
 6de:	0f 84 84 00 00 00    	je     768 <printint+0xa8>
    neg = 1;
    x = -xx;
 6e4:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 6e6:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 6ed:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 6ef:	31 ff                	xor    %edi,%edi
 6f1:	8d 75 c7             	lea    -0x39(%ebp),%esi
 6f4:	eb 0c                	jmp    702 <printint+0x42>
 6f6:	8d 76 00             	lea    0x0(%esi),%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 700:	89 df                	mov    %ebx,%edi
 702:	31 d2                	xor    %edx,%edx
 704:	8d 5f 01             	lea    0x1(%edi),%ebx
 707:	f7 f1                	div    %ecx
 709:	0f b6 92 38 0c 00 00 	movzbl 0xc38(%edx),%edx
  }while((x /= base) != 0);
 710:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 712:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 715:	75 e9                	jne    700 <printint+0x40>
  if(neg)
 717:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 71a:	85 c0                	test   %eax,%eax
 71c:	74 08                	je     726 <printint+0x66>
    buf[i++] = '-';
 71e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 723:	8d 5f 02             	lea    0x2(%edi),%ebx
 726:	8d 7d d8             	lea    -0x28(%ebp),%edi
 729:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 72d:	89 fa                	mov    %edi,%edx
 72f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 730:	0f b6 08             	movzbl (%eax),%ecx
 733:	83 e8 01             	sub    $0x1,%eax
 736:	83 c2 01             	add    $0x1,%edx
 739:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 73c:	39 f0                	cmp    %esi,%eax
 73e:	75 f0                	jne    730 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 740:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 743:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 748:	57                   	push   %edi
 749:	e8 f2 fa ff ff       	call   240 <strlen>
 74e:	83 c4 0c             	add    $0xc,%esp
 751:	50                   	push   %eax
 752:	57                   	push   %edi
 753:	ff 75 c0             	pushl  -0x40(%ebp)
 756:	e8 8d fe ff ff       	call   5e8 <write>
}
 75b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 75e:	5b                   	pop    %ebx
 75f:	5e                   	pop    %esi
 760:	5f                   	pop    %edi
 761:	5d                   	pop    %ebp
 762:	c3                   	ret    
 763:	90                   	nop
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 768:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 76a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 771:	e9 79 ff ff ff       	jmp    6ef <printint+0x2f>
 776:	8d 76 00             	lea    0x0(%esi),%esi
 779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000780 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 789:	8b 75 0c             	mov    0xc(%ebp),%esi
 78c:	0f b6 06             	movzbl (%esi),%eax
 78f:	84 c0                	test   %al,%al
 791:	0f 84 90 01 00 00    	je     927 <printf+0x1a7>
 797:	8d 5d 10             	lea    0x10(%ebp),%ebx
 79a:	31 ff                	xor    %edi,%edi
 79c:	31 d2                	xor    %edx,%edx
 79e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7a1:	31 db                	xor    %ebx,%ebx
 7a3:	eb 39                	jmp    7de <printf+0x5e>
 7a5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7a8:	83 f9 25             	cmp    $0x25,%ecx
 7ab:	0f 84 af 00 00 00    	je     860 <printf+0xe0>
 7b1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 7b4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 7b7:	83 ec 04             	sub    $0x4,%esp
 7ba:	6a 01                	push   $0x1
 7bc:	50                   	push   %eax
 7bd:	ff 75 08             	pushl  0x8(%ebp)
 7c0:	e8 23 fe ff ff       	call   5e8 <write>
 7c5:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 7c8:	85 c0                	test   %eax,%eax
 7ca:	78 35                	js     801 <printf+0x81>
 7cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7cf:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 7d2:	01 c7                	add    %eax,%edi
 7d4:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7d6:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 7da:	84 c0                	test   %al,%al
 7dc:	74 21                	je     7ff <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 7de:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 7e1:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 7e3:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 7e6:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 7e9:	74 bd                	je     7a8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 7eb:	83 fa 25             	cmp    $0x25,%edx
 7ee:	74 20                	je     810 <printf+0x90>
 7f0:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7f2:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 7f5:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7f7:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 7fb:	84 c0                	test   %al,%al
 7fd:	75 df                	jne    7de <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 7ff:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 801:	8d 65 f4             	lea    -0xc(%ebp),%esp
 804:	5b                   	pop    %ebx
 805:	5e                   	pop    %esi
 806:	5f                   	pop    %edi
 807:	5d                   	pop    %ebp
 808:	c3                   	ret    
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 810:	83 f9 64             	cmp    $0x64,%ecx
 813:	0f 84 7f 00 00 00    	je     898 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 819:	0f be d0             	movsbl %al,%edx
 81c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 822:	83 fa 70             	cmp    $0x70,%edx
 825:	74 49                	je     870 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 827:	83 f9 73             	cmp    $0x73,%ecx
 82a:	0f 84 98 00 00 00    	je     8c8 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 830:	83 f9 63             	cmp    $0x63,%ecx
 833:	0f 84 c7 00 00 00    	je     900 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 839:	83 f9 25             	cmp    $0x25,%ecx
 83c:	74 6a                	je     8a8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 83e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 841:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 844:	83 ec 04             	sub    $0x4,%esp
 847:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 849:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 84d:	50                   	push   %eax
 84e:	ff 75 08             	pushl  0x8(%ebp)
 851:	e8 92 fd ff ff       	call   5e8 <write>
 856:	83 c4 10             	add    $0x10,%esp
 859:	e9 6a ff ff ff       	jmp    7c8 <printf+0x48>
 85e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 860:	ba 25 00 00 00       	mov    $0x25,%edx
 865:	31 c0                	xor    %eax,%eax
 867:	eb 89                	jmp    7f2 <printf+0x72>
 869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	b9 10 00 00 00       	mov    $0x10,%ecx
 878:	6a 00                	push   $0x0
 87a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	8b 16                	mov    (%esi),%edx
        ap++;
 882:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 885:	e8 36 fe ff ff       	call   6c0 <printint>
        ap++;
 88a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 88d:	83 c4 10             	add    $0x10,%esp
 890:	e9 33 ff ff ff       	jmp    7c8 <printf+0x48>
 895:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 898:	83 ec 0c             	sub    $0xc,%esp
 89b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a0:	6a 01                	push   $0x1
 8a2:	eb d6                	jmp    87a <printf+0xfa>
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8a8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 8ab:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8ae:	83 ec 04             	sub    $0x4,%esp
 8b1:	6a 01                	push   $0x1
 8b3:	50                   	push   %eax
 8b4:	ff 75 08             	pushl  0x8(%ebp)
 8b7:	e8 2c fd ff ff       	call   5e8 <write>
 8bc:	83 c4 10             	add    $0x10,%esp
 8bf:	e9 04 ff ff ff       	jmp    7c8 <printf+0x48>
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 8c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8cb:	8b 30                	mov    (%eax),%esi
        ap++;
 8cd:	83 c0 04             	add    $0x4,%eax
 8d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 8d3:	b8 30 0c 00 00       	mov    $0xc30,%eax
 8d8:	85 f6                	test   %esi,%esi
 8da:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 8dd:	83 ec 0c             	sub    $0xc,%esp
 8e0:	56                   	push   %esi
 8e1:	e8 5a f9 ff ff       	call   240 <strlen>
 8e6:	83 c4 0c             	add    $0xc,%esp
 8e9:	50                   	push   %eax
 8ea:	56                   	push   %esi
 8eb:	ff 75 08             	pushl  0x8(%ebp)
 8ee:	e8 f5 fc ff ff       	call   5e8 <write>
 8f3:	83 c4 10             	add    $0x10,%esp
 8f6:	e9 cd fe ff ff       	jmp    7c8 <printf+0x48>
 8fb:	90                   	nop
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 900:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
 906:	8b 06                	mov    (%esi),%eax
 908:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 90a:	83 c6 04             	add    $0x4,%esi
 90d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 910:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 913:	50                   	push   %eax
 914:	ff 75 08             	pushl  0x8(%ebp)
 917:	e8 cc fc ff ff       	call   5e8 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 91c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 91f:	83 c4 10             	add    $0x10,%esp
 922:	e9 a1 fe ff ff       	jmp    7c8 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 927:	31 c0                	xor    %eax,%eax
 929:	e9 d3 fe ff ff       	jmp    801 <printf+0x81>
 92e:	66 90                	xchg   %ax,%ax

00000930 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 930:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 931:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 936:	89 e5                	mov    %esp,%ebp
 938:	57                   	push   %edi
 939:	56                   	push   %esi
 93a:	53                   	push   %ebx
 93b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 93e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 940:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 943:	39 c8                	cmp    %ecx,%eax
 945:	73 19                	jae    960 <free+0x30>
 947:	89 f6                	mov    %esi,%esi
 949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 950:	39 d1                	cmp    %edx,%ecx
 952:	72 1c                	jb     970 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 954:	39 d0                	cmp    %edx,%eax
 956:	73 18                	jae    970 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 958:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 95c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95e:	72 f0                	jb     950 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 960:	39 d0                	cmp    %edx,%eax
 962:	72 f4                	jb     958 <free+0x28>
 964:	39 d1                	cmp    %edx,%ecx
 966:	73 f0                	jae    958 <free+0x28>
 968:	90                   	nop
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 970:	8b 73 fc             	mov    -0x4(%ebx),%esi
 973:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 976:	39 d7                	cmp    %edx,%edi
 978:	74 19                	je     993 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 97a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 97d:	8b 50 04             	mov    0x4(%eax),%edx
 980:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 983:	39 f1                	cmp    %esi,%ecx
 985:	74 23                	je     9aa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 987:	89 08                	mov    %ecx,(%eax)
  freep = p;
 989:	a3 00 20 00 00       	mov    %eax,0x2000
}
 98e:	5b                   	pop    %ebx
 98f:	5e                   	pop    %esi
 990:	5f                   	pop    %edi
 991:	5d                   	pop    %ebp
 992:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 993:	03 72 04             	add    0x4(%edx),%esi
 996:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 999:	8b 10                	mov    (%eax),%edx
 99b:	8b 12                	mov    (%edx),%edx
 99d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9a0:	8b 50 04             	mov    0x4(%eax),%edx
 9a3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9a6:	39 f1                	cmp    %esi,%ecx
 9a8:	75 dd                	jne    987 <free+0x57>
    p->s.size += bp->s.size;
 9aa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9ad:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9b2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9b8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9ba:	5b                   	pop    %ebx
 9bb:	5e                   	pop    %esi
 9bc:	5f                   	pop    %edi
 9bd:	5d                   	pop    %ebp
 9be:	c3                   	ret    
 9bf:	90                   	nop

000009c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	57                   	push   %edi
 9c4:	56                   	push   %esi
 9c5:	53                   	push   %ebx
 9c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9cc:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d2:	8d 78 07             	lea    0x7(%eax),%edi
 9d5:	c1 ef 03             	shr    $0x3,%edi
 9d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9db:	85 d2                	test   %edx,%edx
 9dd:	0f 84 a3 00 00 00    	je     a86 <malloc+0xc6>
 9e3:	8b 02                	mov    (%edx),%eax
 9e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9e8:	39 cf                	cmp    %ecx,%edi
 9ea:	76 74                	jbe    a60 <malloc+0xa0>
 9ec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 9f2:	be 00 10 00 00       	mov    $0x1000,%esi
 9f7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 9fe:	0f 43 f7             	cmovae %edi,%esi
 a01:	ba 00 80 00 00       	mov    $0x8000,%edx
 a06:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 a0c:	0f 46 da             	cmovbe %edx,%ebx
 a0f:	eb 10                	jmp    a21 <malloc+0x61>
 a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a18:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a1a:	8b 48 04             	mov    0x4(%eax),%ecx
 a1d:	39 cf                	cmp    %ecx,%edi
 a1f:	76 3f                	jbe    a60 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a21:	39 05 00 20 00 00    	cmp    %eax,0x2000
 a27:	89 c2                	mov    %eax,%edx
 a29:	75 ed                	jne    a18 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a2b:	83 ec 0c             	sub    $0xc,%esp
 a2e:	53                   	push   %ebx
 a2f:	e8 1c fc ff ff       	call   650 <sbrk>
  if(p == (char*)-1)
 a34:	83 c4 10             	add    $0x10,%esp
 a37:	83 f8 ff             	cmp    $0xffffffff,%eax
 a3a:	74 1c                	je     a58 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a3c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 a3f:	83 ec 0c             	sub    $0xc,%esp
 a42:	83 c0 08             	add    $0x8,%eax
 a45:	50                   	push   %eax
 a46:	e8 e5 fe ff ff       	call   930 <free>
  return freep;
 a4b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a51:	83 c4 10             	add    $0x10,%esp
 a54:	85 d2                	test   %edx,%edx
 a56:	75 c0                	jne    a18 <malloc+0x58>
        return 0;
 a58:	31 c0                	xor    %eax,%eax
 a5a:	eb 1c                	jmp    a78 <malloc+0xb8>
 a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a60:	39 cf                	cmp    %ecx,%edi
 a62:	74 1c                	je     a80 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a64:	29 f9                	sub    %edi,%ecx
 a66:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a69:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a6c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 a6f:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 a75:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a78:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a7b:	5b                   	pop    %ebx
 a7c:	5e                   	pop    %esi
 a7d:	5f                   	pop    %edi
 a7e:	5d                   	pop    %ebp
 a7f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a80:	8b 08                	mov    (%eax),%ecx
 a82:	89 0a                	mov    %ecx,(%edx)
 a84:	eb e9                	jmp    a6f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a86:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 a8d:	20 00 00 
 a90:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 a97:	20 00 00 
    base.s.size = 0;
 a9a:	b8 04 20 00 00       	mov    $0x2004,%eax
 a9f:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 aa6:	00 00 00 
 aa9:	e9 3e ff ff ff       	jmp    9ec <malloc+0x2c>
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 ab6:	6a 10                	push   $0x10
 ab8:	6a 02                	push   $0x2
 aba:	ff 75 08             	pushl  0x8(%ebp)
 abd:	e8 d6 fb ff ff       	call   698 <ioctl>
}
 ac2:	c9                   	leave  
 ac3:	c3                   	ret    
 ac4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 aca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ad0 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 ad6:	68 00 10 00 00       	push   $0x1000
 adb:	6a 02                	push   $0x2
 add:	ff 75 08             	pushl  0x8(%ebp)
 ae0:	e8 b3 fb ff ff       	call   698 <ioctl>
}
 ae5:	c9                   	leave  
 ae6:	c3                   	ret    
 ae7:	89 f6                	mov    %esi,%esi
 ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000af0 <attach_tty>:

int
attach_tty(int tty_fd)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	53                   	push   %ebx
 af4:	83 ec 08             	sub    $0x8,%esp
 af7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 afa:	6a 10                	push   $0x10
 afc:	6a 01                	push   $0x1
 afe:	53                   	push   %ebx
 aff:	e8 94 fb ff ff       	call   698 <ioctl>
 b04:	83 c4 10             	add    $0x10,%esp
 b07:	85 c0                	test   %eax,%eax
 b09:	78 55                	js     b60 <attach_tty+0x70>
     return -1;

    close(0);
 b0b:	83 ec 0c             	sub    $0xc,%esp
 b0e:	6a 00                	push   $0x0
 b10:	e8 db fa ff ff       	call   5f0 <close>
    close(1);
 b15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b1c:	e8 cf fa ff ff       	call   5f0 <close>
    close(2);
 b21:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b28:	e8 c3 fa ff ff       	call   5f0 <close>
    if(dup(tty_fd) < 0)
 b2d:	89 1c 24             	mov    %ebx,(%esp)
 b30:	e8 0b fb ff ff       	call   640 <dup>
 b35:	83 c4 10             	add    $0x10,%esp
 b38:	85 c0                	test   %eax,%eax
 b3a:	78 24                	js     b60 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 b3c:	83 ec 0c             	sub    $0xc,%esp
 b3f:	53                   	push   %ebx
 b40:	e8 fb fa ff ff       	call   640 <dup>
 b45:	83 c4 10             	add    $0x10,%esp
 b48:	85 c0                	test   %eax,%eax
 b4a:	78 14                	js     b60 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 b4c:	83 ec 0c             	sub    $0xc,%esp
 b4f:	53                   	push   %ebx
 b50:	e8 eb fa ff ff       	call   640 <dup>
 b55:	83 c4 10             	add    $0x10,%esp
 b58:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 b5b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b5e:	c9                   	leave  
 b5f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 b65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b68:	c9                   	leave  
 b69:	c3                   	ret    
 b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b70 <detach_tty>:

int
detach_tty(int tty_fd)
{
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
 b73:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 b76:	6a 20                	push   $0x20
 b78:	6a 01                	push   $0x1
 b7a:	ff 75 08             	pushl  0x8(%ebp)
 b7d:	e8 16 fb ff ff       	call   698 <ioctl>
    return 0;
}
 b82:	31 c0                	xor    %eax,%eax
 b84:	c9                   	leave  
 b85:	c3                   	ret    
 b86:	8d 76 00             	lea    0x0(%esi),%esi
 b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b90 <connect_tty>:


int
connect_tty(int tty_fd)
{
 b90:	55                   	push   %ebp
 b91:	89 e5                	mov    %esp,%ebp
 b93:	53                   	push   %ebx
 b94:	83 ec 08             	sub    $0x8,%esp
 b97:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 b9a:	6a 10                	push   $0x10
 b9c:	6a 02                	push   $0x2
 b9e:	53                   	push   %ebx
 b9f:	e8 f4 fa ff ff       	call   698 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 ba4:	83 c4 10             	add    $0x10,%esp
 ba7:	85 c0                	test   %eax,%eax
 ba9:	74 1d                	je     bc8 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 bab:	83 ec 04             	sub    $0x4,%esp
 bae:	68 00 10 00 00       	push   $0x1000
 bb3:	6a 01                	push   $0x1
 bb5:	53                   	push   %ebx
 bb6:	e8 dd fa ff ff       	call   698 <ioctl>
     return tty_fd;
 bbb:	83 c4 10             	add    $0x10,%esp
 bbe:	89 d8                	mov    %ebx,%eax
}
 bc0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bc3:	c9                   	leave  
 bc4:	c3                   	ret    
 bc5:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 bc8:	83 ec 0c             	sub    $0xc,%esp
 bcb:	53                   	push   %ebx
 bcc:	e8 1f fa ff ff       	call   5f0 <close>
       return -1;
 bd1:	83 c4 10             	add    $0x10,%esp
 bd4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 bd9:	eb e5                	jmp    bc0 <connect_tty+0x30>
 bdb:	90                   	nop
 bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000be0 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 be0:	55                   	push   %ebp
 be1:	89 e5                	mov    %esp,%ebp
 be3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 be6:	68 00 20 00 00       	push   $0x2000
 beb:	6a 01                	push   $0x1
 bed:	ff 75 08             	pushl  0x8(%ebp)
 bf0:	e8 a3 fa ff ff       	call   698 <ioctl>
}
 bf5:	c9                   	leave  
 bf6:	c3                   	ret    
