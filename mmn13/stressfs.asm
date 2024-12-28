
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   c:	ff 71 fc             	pushl  -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  int fd, i;
  char path[] = "stressfs0";
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  16:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
  1c:	31 db                	xor    %ebx,%ebx
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  int fd, i;
  char path[] = "stressfs0";
  24:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  2b:	74 72 65 
  2e:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  35:	73 66 73 
  char data[512];

  printf(1, "stressfs starting\n");
  38:	68 08 0c 00 00       	push   $0xc08
  3d:	6a 01                	push   $0x1

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
  3f:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  46:	e8 45 07 00 00       	call   790 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 25 02 00 00       	call   280 <memset>
  5b:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
    if(fork() > 0)
  5e:	e8 6d 05 00 00       	call   5d0 <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f cd 00 00 00    	jg     138 <main+0x138>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx
  7c:	68 1b 0c 00 00       	push   $0xc1b

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  81:	bb 14 00 00 00       	mov    $0x14,%ebx

  for(i = 0; i < 4; i++)
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  86:	6a 01                	push   $0x1
  88:	e8 03 07 00 00       	call   790 <printf>

  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  8f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	5f                   	pop    %edi
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 70 05 00 00       	call   618 <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 39 05 00 00       	call   5f8 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 30 05 00 00       	call   600 <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 25 0c 00 00       	push   $0xc25
  d7:	6a 01                	push   $0x1
  d9:	e8 b2 06 00 00       	call   790 <printf>

  fd = open(path, O_RDONLY);
  de:	59                   	pop    %ecx
  df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	50                   	push   %eax
  e9:	bb 14 00 00 00       	mov    $0x14,%ebx
  ee:	e8 25 05 00 00       	call   618 <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 e1 04 00 00       	call   5f0 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
    read(fd, data, sizeof(data));
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 e0 04 00 00       	call   600 <close>

  wait(0);
 120:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 127:	e8 b4 04 00 00       	call   5e0 <wait>

  exit(0);
 12c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 133:	e8 a0 04 00 00       	call   5d8 <exit>
 138:	89 df                	mov    %ebx,%edi
 13a:	e9 39 ff ff ff       	jmp    78 <main+0x78>
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

000006d0 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 6dc:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6df:	85 db                	test   %ebx,%ebx
 6e1:	0f 84 91 00 00 00    	je     778 <printint+0xa8>
 6e7:	89 d0                	mov    %edx,%eax
 6e9:	c1 e8 1f             	shr    $0x1f,%eax
 6ec:	84 c0                	test   %al,%al
 6ee:	0f 84 84 00 00 00    	je     778 <printint+0xa8>
    neg = 1;
    x = -xx;
 6f4:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 6f6:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 6fd:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 6ff:	31 ff                	xor    %edi,%edi
 701:	8d 75 c7             	lea    -0x39(%ebp),%esi
 704:	eb 0c                	jmp    712 <printint+0x42>
 706:	8d 76 00             	lea    0x0(%esi),%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 710:	89 df                	mov    %ebx,%edi
 712:	31 d2                	xor    %edx,%edx
 714:	8d 5f 01             	lea    0x1(%edi),%ebx
 717:	f7 f1                	div    %ecx
 719:	0f b6 92 34 0c 00 00 	movzbl 0xc34(%edx),%edx
  }while((x /= base) != 0);
 720:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 722:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 725:	75 e9                	jne    710 <printint+0x40>
  if(neg)
 727:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 72a:	85 c0                	test   %eax,%eax
 72c:	74 08                	je     736 <printint+0x66>
    buf[i++] = '-';
 72e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 733:	8d 5f 02             	lea    0x2(%edi),%ebx
 736:	8d 7d d8             	lea    -0x28(%ebp),%edi
 739:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 73d:	89 fa                	mov    %edi,%edx
 73f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 740:	0f b6 08             	movzbl (%eax),%ecx
 743:	83 e8 01             	sub    $0x1,%eax
 746:	83 c2 01             	add    $0x1,%edx
 749:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 74c:	39 f0                	cmp    %esi,%eax
 74e:	75 f0                	jne    740 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 750:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 753:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 758:	57                   	push   %edi
 759:	e8 f2 fa ff ff       	call   250 <strlen>
 75e:	83 c4 0c             	add    $0xc,%esp
 761:	50                   	push   %eax
 762:	57                   	push   %edi
 763:	ff 75 c0             	pushl  -0x40(%ebp)
 766:	e8 8d fe ff ff       	call   5f8 <write>
}
 76b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 76e:	5b                   	pop    %ebx
 76f:	5e                   	pop    %esi
 770:	5f                   	pop    %edi
 771:	5d                   	pop    %ebp
 772:	c3                   	ret    
 773:	90                   	nop
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 778:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 77a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 781:	e9 79 ff ff ff       	jmp    6ff <printint+0x2f>
 786:	8d 76 00             	lea    0x0(%esi),%esi
 789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000790 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 799:	8b 75 0c             	mov    0xc(%ebp),%esi
 79c:	0f b6 06             	movzbl (%esi),%eax
 79f:	84 c0                	test   %al,%al
 7a1:	0f 84 90 01 00 00    	je     937 <printf+0x1a7>
 7a7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 7aa:	31 ff                	xor    %edi,%edi
 7ac:	31 d2                	xor    %edx,%edx
 7ae:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7b1:	31 db                	xor    %ebx,%ebx
 7b3:	eb 39                	jmp    7ee <printf+0x5e>
 7b5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7b8:	83 f9 25             	cmp    $0x25,%ecx
 7bb:	0f 84 af 00 00 00    	je     870 <printf+0xe0>
 7c1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 7c4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 7c7:	83 ec 04             	sub    $0x4,%esp
 7ca:	6a 01                	push   $0x1
 7cc:	50                   	push   %eax
 7cd:	ff 75 08             	pushl  0x8(%ebp)
 7d0:	e8 23 fe ff ff       	call   5f8 <write>
 7d5:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 7d8:	85 c0                	test   %eax,%eax
 7da:	78 35                	js     811 <printf+0x81>
 7dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7df:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 7e2:	01 c7                	add    %eax,%edi
 7e4:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7e6:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 7ea:	84 c0                	test   %al,%al
 7ec:	74 21                	je     80f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 7ee:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 7f1:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 7f3:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 7f6:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 7f9:	74 bd                	je     7b8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 7fb:	83 fa 25             	cmp    $0x25,%edx
 7fe:	74 20                	je     820 <printf+0x90>
 800:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 802:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 805:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 807:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 80b:	84 c0                	test   %al,%al
 80d:	75 df                	jne    7ee <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 80f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 811:	8d 65 f4             	lea    -0xc(%ebp),%esp
 814:	5b                   	pop    %ebx
 815:	5e                   	pop    %esi
 816:	5f                   	pop    %edi
 817:	5d                   	pop    %ebp
 818:	c3                   	ret    
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 820:	83 f9 64             	cmp    $0x64,%ecx
 823:	0f 84 7f 00 00 00    	je     8a8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 829:	0f be d0             	movsbl %al,%edx
 82c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 832:	83 fa 70             	cmp    $0x70,%edx
 835:	74 49                	je     880 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 837:	83 f9 73             	cmp    $0x73,%ecx
 83a:	0f 84 98 00 00 00    	je     8d8 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 840:	83 f9 63             	cmp    $0x63,%ecx
 843:	0f 84 c7 00 00 00    	je     910 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 849:	83 f9 25             	cmp    $0x25,%ecx
 84c:	74 6a                	je     8b8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 84e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 851:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 854:	83 ec 04             	sub    $0x4,%esp
 857:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 859:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 85d:	50                   	push   %eax
 85e:	ff 75 08             	pushl  0x8(%ebp)
 861:	e8 92 fd ff ff       	call   5f8 <write>
 866:	83 c4 10             	add    $0x10,%esp
 869:	e9 6a ff ff ff       	jmp    7d8 <printf+0x48>
 86e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 870:	ba 25 00 00 00       	mov    $0x25,%edx
 875:	31 c0                	xor    %eax,%eax
 877:	eb 89                	jmp    802 <printf+0x72>
 879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 880:	83 ec 0c             	sub    $0xc,%esp
 883:	b9 10 00 00 00       	mov    $0x10,%ecx
 888:	6a 00                	push   $0x0
 88a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 88d:	8b 45 08             	mov    0x8(%ebp),%eax
 890:	8b 16                	mov    (%esi),%edx
        ap++;
 892:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 895:	e8 36 fe ff ff       	call   6d0 <printint>
        ap++;
 89a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 89d:	83 c4 10             	add    $0x10,%esp
 8a0:	e9 33 ff ff ff       	jmp    7d8 <printf+0x48>
 8a5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 8a8:	83 ec 0c             	sub    $0xc,%esp
 8ab:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8b0:	6a 01                	push   $0x1
 8b2:	eb d6                	jmp    88a <printf+0xfa>
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8b8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 8bb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8be:	83 ec 04             	sub    $0x4,%esp
 8c1:	6a 01                	push   $0x1
 8c3:	50                   	push   %eax
 8c4:	ff 75 08             	pushl  0x8(%ebp)
 8c7:	e8 2c fd ff ff       	call   5f8 <write>
 8cc:	83 c4 10             	add    $0x10,%esp
 8cf:	e9 04 ff ff ff       	jmp    7d8 <printf+0x48>
 8d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 8d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8db:	8b 30                	mov    (%eax),%esi
        ap++;
 8dd:	83 c0 04             	add    $0x4,%eax
 8e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 8e3:	b8 2b 0c 00 00       	mov    $0xc2b,%eax
 8e8:	85 f6                	test   %esi,%esi
 8ea:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 8ed:	83 ec 0c             	sub    $0xc,%esp
 8f0:	56                   	push   %esi
 8f1:	e8 5a f9 ff ff       	call   250 <strlen>
 8f6:	83 c4 0c             	add    $0xc,%esp
 8f9:	50                   	push   %eax
 8fa:	56                   	push   %esi
 8fb:	ff 75 08             	pushl  0x8(%ebp)
 8fe:	e8 f5 fc ff ff       	call   5f8 <write>
 903:	83 c4 10             	add    $0x10,%esp
 906:	e9 cd fe ff ff       	jmp    7d8 <printf+0x48>
 90b:	90                   	nop
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 910:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 913:	83 ec 04             	sub    $0x4,%esp
 916:	8b 06                	mov    (%esi),%eax
 918:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 91a:	83 c6 04             	add    $0x4,%esi
 91d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 920:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 923:	50                   	push   %eax
 924:	ff 75 08             	pushl  0x8(%ebp)
 927:	e8 cc fc ff ff       	call   5f8 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 92c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 92f:	83 c4 10             	add    $0x10,%esp
 932:	e9 a1 fe ff ff       	jmp    7d8 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 937:	31 c0                	xor    %eax,%eax
 939:	e9 d3 fe ff ff       	jmp    811 <printf+0x81>
 93e:	66 90                	xchg   %ax,%ax

00000940 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 940:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 950:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 953:	39 c8                	cmp    %ecx,%eax
 955:	73 19                	jae    970 <free+0x30>
 957:	89 f6                	mov    %esi,%esi
 959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 960:	39 d1                	cmp    %edx,%ecx
 962:	72 1c                	jb     980 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	39 d0                	cmp    %edx,%eax
 966:	73 18                	jae    980 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 968:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96e:	72 f0                	jb     960 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 970:	39 d0                	cmp    %edx,%eax
 972:	72 f4                	jb     968 <free+0x28>
 974:	39 d1                	cmp    %edx,%ecx
 976:	73 f0                	jae    968 <free+0x28>
 978:	90                   	nop
 979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 980:	8b 73 fc             	mov    -0x4(%ebx),%esi
 983:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 986:	39 d7                	cmp    %edx,%edi
 988:	74 19                	je     9a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 98a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 98d:	8b 50 04             	mov    0x4(%eax),%edx
 990:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 993:	39 f1                	cmp    %esi,%ecx
 995:	74 23                	je     9ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 997:	89 08                	mov    %ecx,(%eax)
  freep = p;
 999:	a3 00 20 00 00       	mov    %eax,0x2000
}
 99e:	5b                   	pop    %ebx
 99f:	5e                   	pop    %esi
 9a0:	5f                   	pop    %edi
 9a1:	5d                   	pop    %ebp
 9a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9a3:	03 72 04             	add    0x4(%edx),%esi
 9a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a9:	8b 10                	mov    (%eax),%edx
 9ab:	8b 12                	mov    (%edx),%edx
 9ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9b0:	8b 50 04             	mov    0x4(%eax),%edx
 9b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b6:	39 f1                	cmp    %esi,%ecx
 9b8:	75 dd                	jne    997 <free+0x57>
    p->s.size += bp->s.size;
 9ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9bd:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9ca:	5b                   	pop    %ebx
 9cb:	5e                   	pop    %esi
 9cc:	5f                   	pop    %edi
 9cd:	5d                   	pop    %ebp
 9ce:	c3                   	ret    
 9cf:	90                   	nop

000009d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9dc:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e2:	8d 78 07             	lea    0x7(%eax),%edi
 9e5:	c1 ef 03             	shr    $0x3,%edi
 9e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9eb:	85 d2                	test   %edx,%edx
 9ed:	0f 84 a3 00 00 00    	je     a96 <malloc+0xc6>
 9f3:	8b 02                	mov    (%edx),%eax
 9f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9f8:	39 cf                	cmp    %ecx,%edi
 9fa:	76 74                	jbe    a70 <malloc+0xa0>
 9fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a02:	be 00 10 00 00       	mov    $0x1000,%esi
 a07:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 a0e:	0f 43 f7             	cmovae %edi,%esi
 a11:	ba 00 80 00 00       	mov    $0x8000,%edx
 a16:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 a1c:	0f 46 da             	cmovbe %edx,%ebx
 a1f:	eb 10                	jmp    a31 <malloc+0x61>
 a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a2a:	8b 48 04             	mov    0x4(%eax),%ecx
 a2d:	39 cf                	cmp    %ecx,%edi
 a2f:	76 3f                	jbe    a70 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a31:	39 05 00 20 00 00    	cmp    %eax,0x2000
 a37:	89 c2                	mov    %eax,%edx
 a39:	75 ed                	jne    a28 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a3b:	83 ec 0c             	sub    $0xc,%esp
 a3e:	53                   	push   %ebx
 a3f:	e8 1c fc ff ff       	call   660 <sbrk>
  if(p == (char*)-1)
 a44:	83 c4 10             	add    $0x10,%esp
 a47:	83 f8 ff             	cmp    $0xffffffff,%eax
 a4a:	74 1c                	je     a68 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a4c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 a4f:	83 ec 0c             	sub    $0xc,%esp
 a52:	83 c0 08             	add    $0x8,%eax
 a55:	50                   	push   %eax
 a56:	e8 e5 fe ff ff       	call   940 <free>
  return freep;
 a5b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a61:	83 c4 10             	add    $0x10,%esp
 a64:	85 d2                	test   %edx,%edx
 a66:	75 c0                	jne    a28 <malloc+0x58>
        return 0;
 a68:	31 c0                	xor    %eax,%eax
 a6a:	eb 1c                	jmp    a88 <malloc+0xb8>
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a70:	39 cf                	cmp    %ecx,%edi
 a72:	74 1c                	je     a90 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a74:	29 f9                	sub    %edi,%ecx
 a76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a7c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 a7f:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 a85:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a88:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a8b:	5b                   	pop    %ebx
 a8c:	5e                   	pop    %esi
 a8d:	5f                   	pop    %edi
 a8e:	5d                   	pop    %ebp
 a8f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a90:	8b 08                	mov    (%eax),%ecx
 a92:	89 0a                	mov    %ecx,(%edx)
 a94:	eb e9                	jmp    a7f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a96:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 a9d:	20 00 00 
 aa0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 aa7:	20 00 00 
    base.s.size = 0;
 aaa:	b8 04 20 00 00       	mov    $0x2004,%eax
 aaf:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 ab6:	00 00 00 
 ab9:	e9 3e ff ff ff       	jmp    9fc <malloc+0x2c>
 abe:	66 90                	xchg   %ax,%ax

00000ac0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 ac6:	6a 10                	push   $0x10
 ac8:	6a 02                	push   $0x2
 aca:	ff 75 08             	pushl  0x8(%ebp)
 acd:	e8 d6 fb ff ff       	call   6a8 <ioctl>
}
 ad2:	c9                   	leave  
 ad3:	c3                   	ret    
 ad4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 ada:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ae0 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 ae6:	68 00 10 00 00       	push   $0x1000
 aeb:	6a 02                	push   $0x2
 aed:	ff 75 08             	pushl  0x8(%ebp)
 af0:	e8 b3 fb ff ff       	call   6a8 <ioctl>
}
 af5:	c9                   	leave  
 af6:	c3                   	ret    
 af7:	89 f6                	mov    %esi,%esi
 af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b00 <attach_tty>:

int
attach_tty(int tty_fd)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	53                   	push   %ebx
 b04:	83 ec 08             	sub    $0x8,%esp
 b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 b0a:	6a 10                	push   $0x10
 b0c:	6a 01                	push   $0x1
 b0e:	53                   	push   %ebx
 b0f:	e8 94 fb ff ff       	call   6a8 <ioctl>
 b14:	83 c4 10             	add    $0x10,%esp
 b17:	85 c0                	test   %eax,%eax
 b19:	78 55                	js     b70 <attach_tty+0x70>
     return -1;

    close(0);
 b1b:	83 ec 0c             	sub    $0xc,%esp
 b1e:	6a 00                	push   $0x0
 b20:	e8 db fa ff ff       	call   600 <close>
    close(1);
 b25:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b2c:	e8 cf fa ff ff       	call   600 <close>
    close(2);
 b31:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b38:	e8 c3 fa ff ff       	call   600 <close>
    if(dup(tty_fd) < 0)
 b3d:	89 1c 24             	mov    %ebx,(%esp)
 b40:	e8 0b fb ff ff       	call   650 <dup>
 b45:	83 c4 10             	add    $0x10,%esp
 b48:	85 c0                	test   %eax,%eax
 b4a:	78 24                	js     b70 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 b4c:	83 ec 0c             	sub    $0xc,%esp
 b4f:	53                   	push   %ebx
 b50:	e8 fb fa ff ff       	call   650 <dup>
 b55:	83 c4 10             	add    $0x10,%esp
 b58:	85 c0                	test   %eax,%eax
 b5a:	78 14                	js     b70 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 b5c:	83 ec 0c             	sub    $0xc,%esp
 b5f:	53                   	push   %ebx
 b60:	e8 eb fa ff ff       	call   650 <dup>
 b65:	83 c4 10             	add    $0x10,%esp
 b68:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 b6b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b6e:	c9                   	leave  
 b6f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 b75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b78:	c9                   	leave  
 b79:	c3                   	ret    
 b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b80 <detach_tty>:

int
detach_tty(int tty_fd)
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 b86:	6a 20                	push   $0x20
 b88:	6a 01                	push   $0x1
 b8a:	ff 75 08             	pushl  0x8(%ebp)
 b8d:	e8 16 fb ff ff       	call   6a8 <ioctl>
    return 0;
}
 b92:	31 c0                	xor    %eax,%eax
 b94:	c9                   	leave  
 b95:	c3                   	ret    
 b96:	8d 76 00             	lea    0x0(%esi),%esi
 b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ba0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	53                   	push   %ebx
 ba4:	83 ec 08             	sub    $0x8,%esp
 ba7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 baa:	6a 10                	push   $0x10
 bac:	6a 02                	push   $0x2
 bae:	53                   	push   %ebx
 baf:	e8 f4 fa ff ff       	call   6a8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 bb4:	83 c4 10             	add    $0x10,%esp
 bb7:	85 c0                	test   %eax,%eax
 bb9:	74 1d                	je     bd8 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 bbb:	83 ec 04             	sub    $0x4,%esp
 bbe:	68 00 10 00 00       	push   $0x1000
 bc3:	6a 01                	push   $0x1
 bc5:	53                   	push   %ebx
 bc6:	e8 dd fa ff ff       	call   6a8 <ioctl>
     return tty_fd;
 bcb:	83 c4 10             	add    $0x10,%esp
 bce:	89 d8                	mov    %ebx,%eax
}
 bd0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bd3:	c9                   	leave  
 bd4:	c3                   	ret    
 bd5:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 bd8:	83 ec 0c             	sub    $0xc,%esp
 bdb:	53                   	push   %ebx
 bdc:	e8 1f fa ff ff       	call   600 <close>
       return -1;
 be1:	83 c4 10             	add    $0x10,%esp
 be4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 be9:	eb e5                	jmp    bd0 <connect_tty+0x30>
 beb:	90                   	nop
 bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bf0 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 bf0:	55                   	push   %ebp
 bf1:	89 e5                	mov    %esp,%ebp
 bf3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 bf6:	68 00 20 00 00       	push   $0x2000
 bfb:	6a 01                	push   $0x1
 bfd:	ff 75 08             	pushl  0x8(%ebp)
 c00:	e8 a3 fa ff ff       	call   6a8 <ioctl>
}
 c05:	c9                   	leave  
 c06:	c3                   	ret    
