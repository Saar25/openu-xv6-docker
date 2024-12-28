
_mount:     file format elf32-i386


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
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
    const char usage[] =
  11:	8d 7d 8c             	lea    -0x74(%ebp),%edi
  14:	be 58 0c 00 00       	mov    $0xc58,%esi
#include "user.h"

int main(int argc, const char * const argv[])
{
  19:	83 c4 80             	add    $0xffffff80,%esp
  1c:	8b 01                	mov    (%ecx),%eax
  1e:	8b 59 04             	mov    0x4(%ecx),%ebx
    const char usage[] =
  21:	8d 4d 8b             	lea    -0x75(%ebp),%ecx
#include "user.h"

int main(int argc, const char * const argv[])
{
  24:	89 45 84             	mov    %eax,-0x7c(%ebp)
    const char usage[] =
  27:	a1 58 0c 00 00       	mov    0xc58,%eax
  2c:	29 f9                	sub    %edi,%ecx
  2e:	29 ce                	sub    %ecx,%esi
  30:	83 c1 5d             	add    $0x5d,%ecx
  33:	c1 e9 02             	shr    $0x2,%ecx
  36:	89 45 8b             	mov    %eax,-0x75(%ebp)
  39:	a1 b1 0c 00 00       	mov    0xcb1,%eax
  3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  41:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
        "Usage:\nmount [-t [fstype]] [path]\nmount [path] [-t [fstype]]\nmount internal_fs_{a|b|c} path\n";
    const char * fstype = 0;
    const char * path = 0;
    int index = 0;

    if ( (strcmp(argv[1],"internal_fs_a") == 0) ||
  43:	68 28 0c 00 00       	push   $0xc28
  48:	ff 73 04             	pushl  0x4(%ebx)
  4b:	e8 40 01 00 00       	call   190 <strcmp>
  50:	83 c4 10             	add    $0x10,%esp
  53:	85 c0                	test   %eax,%eax
  55:	74 16                	je     6d <main+0x6d>
         (strcmp(argv[1],"internal_fs_b") == 0) ||
  57:	50                   	push   %eax
  58:	50                   	push   %eax
  59:	68 36 0c 00 00       	push   $0xc36
  5e:	ff 73 04             	pushl  0x4(%ebx)
  61:	e8 2a 01 00 00       	call   190 <strcmp>
        "Usage:\nmount [-t [fstype]] [path]\nmount [path] [-t [fstype]]\nmount internal_fs_{a|b|c} path\n";
    const char * fstype = 0;
    const char * path = 0;
    int index = 0;

    if ( (strcmp(argv[1],"internal_fs_a") == 0) ||
  66:	83 c4 10             	add    $0x10,%esp
  69:	85 c0                	test   %eax,%eax
  6b:	75 18                	jne    85 <main+0x85>
         (strcmp(argv[1],"internal_fs_b") == 0) ||
         (strcmp(argv[1],"internal_fs_c") == 0) )
      exit(mount(argv[1],argv[2],0));
  6d:	83 ec 04             	sub    $0x4,%esp
  70:	6a 00                	push   $0x0
  72:	ff 73 08             	pushl  0x8(%ebx)
  75:	ff 73 04             	pushl  0x4(%ebx)
  78:	e8 1b 06 00 00       	call   698 <mount>
  7d:	89 04 24             	mov    %eax,(%esp)
  80:	e8 73 05 00 00       	call   5f8 <exit>
    const char * path = 0;
    int index = 0;

    if ( (strcmp(argv[1],"internal_fs_a") == 0) ||
         (strcmp(argv[1],"internal_fs_b") == 0) ||
         (strcmp(argv[1],"internal_fs_c") == 0) )
  85:	50                   	push   %eax
  86:	50                   	push   %eax
  87:	68 44 0c 00 00       	push   $0xc44
  8c:	ff 73 04             	pushl  0x4(%ebx)
  8f:	e8 fc 00 00 00       	call   190 <strcmp>
    const char * fstype = 0;
    const char * path = 0;
    int index = 0;

    if ( (strcmp(argv[1],"internal_fs_a") == 0) ||
         (strcmp(argv[1],"internal_fs_b") == 0) ||
  94:	83 c4 10             	add    $0x10,%esp
  97:	85 c0                	test   %eax,%eax
  99:	74 d2                	je     6d <main+0x6d>
  9b:	be 01 00 00 00       	mov    $0x1,%esi
  a0:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
  a7:	00 00 00 
  aa:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
  b1:	00 00 00 
  b4:	89 5d 80             	mov    %ebx,-0x80(%ebp)
         (strcmp(argv[1],"internal_fs_c") == 0) )
      exit(mount(argv[1],argv[2],0));

    for (index = 1; index < argc;) {
  b7:	3b 75 84             	cmp    -0x7c(%ebp),%esi
  ba:	7d 74                	jge    130 <main+0x130>
        if (!strcmp(argv[index], "-t")) {
  bc:	8b 45 80             	mov    -0x80(%ebp),%eax
  bf:	8d 1c b5 00 00 00 00 	lea    0x0(,%esi,4),%ebx
  c6:	8d 3c 18             	lea    (%eax,%ebx,1),%edi
  c9:	50                   	push   %eax
  ca:	50                   	push   %eax
  cb:	68 52 0c 00 00       	push   $0xc52
  d0:	ff 37                	pushl  (%edi)
  d2:	e8 b9 00 00 00       	call   190 <strcmp>
  d7:	83 c4 10             	add    $0x10,%esp
  da:	85 c0                	test   %eax,%eax
  dc:	75 23                	jne    101 <main+0x101>
            ++index;
            if (index >= argc || fstype) {
  de:	8d 46 01             	lea    0x1(%esi),%eax
  e1:	39 45 84             	cmp    %eax,-0x7c(%ebp)
  e4:	7e 31                	jle    117 <main+0x117>
  e6:	83 bd 78 ff ff ff 00 	cmpl   $0x0,-0x88(%ebp)
  ed:	75 28                	jne    117 <main+0x117>
                printf(2, usage);
                exit(1);
            }
            fstype = argv[index];
  ef:	8b 45 80             	mov    -0x80(%ebp),%eax
            ++index;
  f2:	83 c6 02             	add    $0x2,%esi
            ++index;
            if (index >= argc || fstype) {
                printf(2, usage);
                exit(1);
            }
            fstype = argv[index];
  f5:	8b 44 18 04          	mov    0x4(%eax,%ebx,1),%eax
  f9:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
            ++index;
            continue;
  ff:	eb b6                	jmp    b7 <main+0xb7>
        }

        if (path) {
 101:	83 bd 7c ff ff ff 00 	cmpl   $0x0,-0x84(%ebp)
 108:	75 0d                	jne    117 <main+0x117>
            printf(2, usage);
            exit(1);
        }

        path = argv[index];
 10a:	8b 07                	mov    (%edi),%eax
        ++index;
 10c:	83 c6 01             	add    $0x1,%esi
        if (path) {
            printf(2, usage);
            exit(1);
        }

        path = argv[index];
 10f:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
 115:	eb a0                	jmp    b7 <main+0xb7>

    for (index = 1; index < argc;) {
        if (!strcmp(argv[index], "-t")) {
            ++index;
            if (index >= argc || fstype) {
                printf(2, usage);
 117:	8d 45 8b             	lea    -0x75(%ebp),%eax
 11a:	51                   	push   %ecx
 11b:	51                   	push   %ecx
 11c:	50                   	push   %eax
 11d:	6a 02                	push   $0x2
 11f:	e8 8c 06 00 00       	call   7b0 <printf>
                exit(1);
 124:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 12b:	e8 c8 04 00 00       	call   5f8 <exit>

        path = argv[index];
        ++index;
    }

    if (!path) {
 130:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 136:	85 c0                	test   %eax,%eax
 138:	74 dd                	je     117 <main+0x117>
        printf(2, usage);
        exit(1);
    }

    exit(mount(0, path, fstype));
 13a:	52                   	push   %edx
 13b:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
 141:	50                   	push   %eax
 142:	6a 00                	push   $0x0
 144:	e8 4f 05 00 00       	call   698 <mount>
 149:	89 04 24             	mov    %eax,(%esp)
 14c:	e8 a7 04 00 00       	call   5f8 <exit>
 151:	66 90                	xchg   %ax,%ax
 153:	66 90                	xchg   %ax,%ax
 155:	66 90                	xchg   %ax,%ax
 157:	66 90                	xchg   %ax,%ax
 159:	66 90                	xchg   %ax,%ax
 15b:	66 90                	xchg   %ax,%ax
 15d:	66 90                	xchg   %ax,%ax
 15f:	90                   	nop

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16a:	89 c2                	mov    %eax,%edx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	83 c1 01             	add    $0x1,%ecx
 173:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 177:	83 c2 01             	add    $0x1,%edx
 17a:	84 db                	test   %bl,%bl
 17c:	88 5a ff             	mov    %bl,-0x1(%edx)
 17f:	75 ef                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 181:	5b                   	pop    %ebx
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 18a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	8b 55 08             	mov    0x8(%ebp),%edx
 198:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 19b:	0f b6 02             	movzbl (%edx),%eax
 19e:	0f b6 19             	movzbl (%ecx),%ebx
 1a1:	84 c0                	test   %al,%al
 1a3:	75 1e                	jne    1c3 <strcmp+0x33>
 1a5:	eb 29                	jmp    1d0 <strcmp+0x40>
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1b0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1b6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1bd:	84 c0                	test   %al,%al
 1bf:	74 0f                	je     1d0 <strcmp+0x40>
 1c1:	89 f1                	mov    %esi,%ecx
 1c3:	38 d8                	cmp    %bl,%al
 1c5:	74 e9                	je     1b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1c7:	29 d8                	sub    %ebx,%eax
}
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1d0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1d2:	29 d8                	sub    %ebx,%eax
}
 1d4:	5b                   	pop    %ebx
 1d5:	5e                   	pop    %esi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    
 1d8:	90                   	nop
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	8b 55 08             	mov    0x8(%ebp),%edx
 1e8:	53                   	push   %ebx
 1e9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 1ec:	0f b6 32             	movzbl (%edx),%esi
 1ef:	89 f0                	mov    %esi,%eax
 1f1:	84 c0                	test   %al,%al
 1f3:	74 67                	je     25c <strncmp+0x7c>
 1f5:	0f b6 19             	movzbl (%ecx),%ebx
 1f8:	89 f0                	mov    %esi,%eax
 1fa:	38 d8                	cmp    %bl,%al
 1fc:	75 65                	jne    263 <strncmp+0x83>
 1fe:	8b 5d 10             	mov    0x10(%ebp),%ebx
 201:	89 f0                	mov    %esi,%eax
 203:	0f b6 f0             	movzbl %al,%esi
 206:	89 f0                	mov    %esi,%eax
 208:	83 eb 01             	sub    $0x1,%ebx
 20b:	75 14                	jne    221 <strncmp+0x41>
 20d:	eb 25                	jmp    234 <strncmp+0x54>
 20f:	90                   	nop
 210:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 214:	89 f1                	mov    %esi,%ecx
 216:	38 c8                	cmp    %cl,%al
 218:	75 26                	jne    240 <strncmp+0x60>
 21a:	83 eb 01             	sub    $0x1,%ebx
 21d:	89 f9                	mov    %edi,%ecx
 21f:	74 2f                	je     250 <strncmp+0x70>
    p++, q++;
 221:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 224:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 227:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 22a:	84 c0                	test   %al,%al
 22c:	75 e2                	jne    210 <strncmp+0x30>
 22e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 232:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 234:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 235:	29 f0                	sub    %esi,%eax
}
 237:	5e                   	pop    %esi
 238:	5f                   	pop    %edi
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 240:	0f b6 f1             	movzbl %cl,%esi
 243:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 244:	29 f0                	sub    %esi,%eax
}
 246:	5e                   	pop    %esi
 247:	5f                   	pop    %edi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 250:	0f b6 f0             	movzbl %al,%esi
 253:	89 f0                	mov    %esi,%eax
 255:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 256:	29 f0                	sub    %esi,%eax
}
 258:	5e                   	pop    %esi
 259:	5f                   	pop    %edi
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 25c:	31 c0                	xor    %eax,%eax
 25e:	0f b6 31             	movzbl (%ecx),%esi
 261:	eb d1                	jmp    234 <strncmp+0x54>
 263:	0f b6 c0             	movzbl %al,%eax
 266:	0f b6 f3             	movzbl %bl,%esi
 269:	eb c9                	jmp    234 <strncmp+0x54>
 26b:	90                   	nop
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 276:	80 39 00             	cmpb   $0x0,(%ecx)
 279:	74 12                	je     28d <strlen+0x1d>
 27b:	31 d2                	xor    %edx,%edx
 27d:	8d 76 00             	lea    0x0(%esi),%esi
 280:	83 c2 01             	add    $0x1,%edx
 283:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 287:	89 d0                	mov    %edx,%eax
 289:	75 f5                	jne    280 <strlen+0x10>
    ;
  return n;
}
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 28d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	eb 0d                	jmp    2a0 <memset>
 293:	90                   	nop
 294:	90                   	nop
 295:	90                   	nop
 296:	90                   	nop
 297:	90                   	nop
 298:	90                   	nop
 299:	90                   	nop
 29a:	90                   	nop
 29b:	90                   	nop
 29c:	90                   	nop
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 d7                	mov    %edx,%edi
 2af:	fc                   	cld    
 2b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b2:	89 d0                	mov    %edx,%eax
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2ca:	0f b6 10             	movzbl (%eax),%edx
 2cd:	84 d2                	test   %dl,%dl
 2cf:	74 1d                	je     2ee <strchr+0x2e>
    if(*s == c)
 2d1:	38 d3                	cmp    %dl,%bl
 2d3:	89 d9                	mov    %ebx,%ecx
 2d5:	75 0d                	jne    2e4 <strchr+0x24>
 2d7:	eb 17                	jmp    2f0 <strchr+0x30>
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2e0:	38 ca                	cmp    %cl,%dl
 2e2:	74 0c                	je     2f0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2e4:	83 c0 01             	add    $0x1,%eax
 2e7:	0f b6 10             	movzbl (%eax),%edx
 2ea:	84 d2                	test   %dl,%dl
 2ec:	75 f2                	jne    2e0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2ee:	31 c0                	xor    %eax,%eax
}
 2f0:	5b                   	pop    %ebx
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    
 2f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <gets>:

char*
gets(char *buf, int max)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 306:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 309:	31 db                	xor    %ebx,%ebx
 30b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 310:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 313:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 316:	7d 30                	jge    348 <gets+0x48>
    cc = read(0, &c, 1);
 318:	83 ec 04             	sub    $0x4,%esp
 31b:	6a 01                	push   $0x1
 31d:	56                   	push   %esi
 31e:	6a 00                	push   $0x0
 320:	e8 eb 02 00 00       	call   610 <read>
    if(cc < 1)
 325:	83 c4 10             	add    $0x10,%esp
 328:	85 c0                	test   %eax,%eax
 32a:	7e e7                	jle    313 <gets+0x13>
      continue;
    buf[i++] = c;
 32c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 330:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 333:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 335:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 338:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 33a:	74 0c                	je     348 <gets+0x48>
 33c:	3c 0d                	cmp    $0xd,%al
 33e:	74 08                	je     348 <gets+0x48>
 340:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 343:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 346:	7c d0                	jl     318 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 34f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 352:	5b                   	pop    %ebx
 353:	5e                   	pop    %esi
 354:	5f                   	pop    %edi
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	pushl  0x8(%ebp)
 36d:	e8 c6 02 00 00       	call   638 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	pushl  0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 c9 02 00 00       	call   650 <fstat>
 387:	89 c6                	mov    %eax,%esi
  close(fd);
 389:	89 1c 24             	mov    %ebx,(%esp)
 38c:	e8 8f 02 00 00       	call   620 <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
 394:	89 f0                	mov    %esi,%eax
}
 396:	8d 65 f8             	lea    -0x8(%ebp),%esp
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3a5:	eb ef                	jmp    396 <stat+0x36>
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 11             	movsbl (%ecx),%edx
 3ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 3bd:	3c 09                	cmp    $0x9,%al
 3bf:	b8 00 00 00 00       	mov    $0x0,%eax
 3c4:	77 1f                	ja     3e5 <atoi+0x35>
 3c6:	8d 76 00             	lea    0x0(%esi),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3d3:	83 c1 01             	add    $0x1,%ecx
 3d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3da:	0f be 11             	movsbl (%ecx),%edx
 3dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3e5:	5b                   	pop    %ebx
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    
 3e8:	90                   	nop
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
 3f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 db                	test   %ebx,%ebx
 400:	7e 14                	jle    416 <memmove+0x26>
 402:	31 d2                	xor    %edx,%edx
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 408:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 40c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 40f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 412:	39 da                	cmp    %ebx,%edx
 414:	75 f2                	jne    408 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 04             	sub    $0x4,%esp
 429:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 42c:	83 f9 00             	cmp    $0x0,%ecx
 42f:	7e 76                	jle    4a7 <itoa+0x87>
 431:	89 cb                	mov    %ecx,%ebx
 433:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 435:	bf 67 66 66 66       	mov    $0x66666667,%edi
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 440:	89 d8                	mov    %ebx,%eax
 442:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 445:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 448:	f7 ef                	imul   %edi
 44a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 44d:	29 da                	sub    %ebx,%edx
 44f:	89 d3                	mov    %edx,%ebx
 451:	75 ed                	jne    440 <itoa+0x20>
        length++;
 453:	89 f3                	mov    %esi,%ebx
 455:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 458:	bf 67 66 66 66       	mov    $0x66666667,%edi
 45d:	8b 75 08             	mov    0x8(%ebp),%esi
 460:	eb 0a                	jmp    46c <itoa+0x4c>
 462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 468:	85 db                	test   %ebx,%ebx
 46a:	7e 25                	jle    491 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 46c:	89 c8                	mov    %ecx,%eax
 46e:	f7 ef                	imul   %edi
 470:	89 c8                	mov    %ecx,%eax
 472:	c1 f8 1f             	sar    $0x1f,%eax
 475:	c1 fa 02             	sar    $0x2,%edx
 478:	29 c2                	sub    %eax,%edx
 47a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 47d:	01 c0                	add    %eax,%eax
 47f:	29 c1                	sub    %eax,%ecx
 481:	83 c1 30             	add    $0x30,%ecx
 484:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 488:	83 eb 01             	sub    $0x1,%ebx
 48b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 48d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 48f:	7f d7                	jg     468 <itoa+0x48>
 491:	8b 75 f0             	mov    -0x10(%ebp),%esi
 494:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 496:	8b 7d 08             	mov    0x8(%ebp),%edi
 499:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 49d:	83 c4 04             	add    $0x4,%esp
 4a0:	89 f0                	mov    %esi,%eax
 4a2:	5b                   	pop    %ebx
 4a3:	5e                   	pop    %esi
 4a4:	5f                   	pop    %edi
 4a5:	5d                   	pop    %ebp
 4a6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 4a7:	75 12                	jne    4bb <itoa+0x9b>
        buf[0] = '0';
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 4ac:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 4b1:	c6 00 30             	movb   $0x30,(%eax)
 4b4:	b8 01 00 00 00       	mov    $0x1,%eax
 4b9:	eb db                	jmp    496 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 4bb:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 4bd:	31 f6                	xor    %esi,%esi
 4bf:	eb d5                	jmp    496 <itoa+0x76>
 4c1:	eb 0d                	jmp    4d0 <strcat>
 4c3:	90                   	nop
 4c4:	90                   	nop
 4c5:	90                   	nop
 4c6:	90                   	nop
 4c7:	90                   	nop
 4c8:	90                   	nop
 4c9:	90                   	nop
 4ca:	90                   	nop
 4cb:	90                   	nop
 4cc:	90                   	nop
 4cd:	90                   	nop
 4ce:	90                   	nop
 4cf:	90                   	nop

000004d0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	8b 45 08             	mov    0x8(%ebp),%eax
 4d8:	53                   	push   %ebx
 4d9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 4dc:	80 38 00             	cmpb   $0x0,(%eax)
 4df:	74 38                	je     519 <strcat+0x49>
 4e1:	31 c9                	xor    %ecx,%ecx
 4e3:	90                   	nop
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4e8:	83 c1 01             	add    $0x1,%ecx
 4eb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 4ef:	89 ca                	mov    %ecx,%edx
 4f1:	75 f5                	jne    4e8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 4f3:	0f b6 1e             	movzbl (%esi),%ebx
 4f6:	84 db                	test   %bl,%bl
 4f8:	74 16                	je     510 <strcat+0x40>
 4fa:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 4fd:	31 d2                	xor    %edx,%edx
 4ff:	90                   	nop
                dest[i + j] = source[j];
 500:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 503:	83 c2 01             	add    $0x1,%edx
 506:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 50a:	84 db                	test   %bl,%bl
 50c:	75 f2                	jne    500 <strcat+0x30>
 50e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 510:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 514:	5b                   	pop    %ebx
 515:	5e                   	pop    %esi
 516:	5f                   	pop    %edi
 517:	5d                   	pop    %ebp
 518:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 519:	31 d2                	xor    %edx,%edx
 51b:	31 c9                	xor    %ecx,%ecx
 51d:	eb d4                	jmp    4f3 <strcat+0x23>
 51f:	90                   	nop

00000520 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 529:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 52c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 52f:	0f b6 00             	movzbl (%eax),%eax
 532:	84 c0                	test   %al,%al
 534:	88 45 f3             	mov    %al,-0xd(%ebp)
 537:	0f 84 a0 00 00 00    	je     5dd <strstr+0xbd>
 53d:	8b 55 0c             	mov    0xc(%ebp),%edx
 540:	31 c0                	xor    %eax,%eax
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 548:	83 c0 01             	add    $0x1,%eax
 54b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 54f:	75 f7                	jne    548 <strstr+0x28>
 551:	89 45 e8             	mov    %eax,-0x18(%ebp)
 554:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 557:	0f b6 07             	movzbl (%edi),%eax
 55a:	84 c0                	test   %al,%al
 55c:	74 68                	je     5c6 <strstr+0xa6>
 55e:	31 d2                	xor    %edx,%edx
 560:	83 c2 01             	add    $0x1,%edx
 563:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 567:	75 f7                	jne    560 <strstr+0x40>
 569:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 56c:	84 c0                	test   %al,%al
 56e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 571:	74 4d                	je     5c0 <strstr+0xa0>
 573:	90                   	nop
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 578:	38 45 f3             	cmp    %al,-0xd(%ebp)
 57b:	75 34                	jne    5b1 <strstr+0x91>
 57d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 580:	83 eb 01             	sub    $0x1,%ebx
 583:	74 4b                	je     5d0 <strstr+0xb0>
 585:	8b 55 0c             	mov    0xc(%ebp),%edx
 588:	89 f8                	mov    %edi,%eax
 58a:	eb 10                	jmp    59c <strstr+0x7c>
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 590:	3a 4a 01             	cmp    0x1(%edx),%cl
 593:	75 1c                	jne    5b1 <strstr+0x91>
 595:	83 eb 01             	sub    $0x1,%ebx
 598:	89 f2                	mov    %esi,%edx
 59a:	74 34                	je     5d0 <strstr+0xb0>
    p++, q++;
 59c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 59f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 5a2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5a5:	84 c9                	test   %cl,%cl
 5a7:	75 e7                	jne    590 <strstr+0x70>
 5a9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 5ad:	84 c0                	test   %al,%al
 5af:	74 1f                	je     5d0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 5b1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 5b4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 5b7:	74 0d                	je     5c6 <strstr+0xa6>
 5b9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5bc:	84 c0                	test   %al,%al
 5be:	75 b8                	jne    578 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 5c0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 5c4:	eb e7                	jmp    5ad <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 5c6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 5c9:	31 c0                	xor    %eax,%eax
}
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5f                   	pop    %edi
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 5d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 5d3:	83 c4 10             	add    $0x10,%esp
 5d6:	5b                   	pop    %ebx
 5d7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 5d8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 5da:	5f                   	pop    %edi
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 5dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5e4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 5eb:	e9 67 ff ff ff       	jmp    557 <strstr+0x37>

000005f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5f0:	b8 01 00 00 00       	mov    $0x1,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <exit>:
SYSCALL(exit)
 5f8:	b8 02 00 00 00       	mov    $0x2,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <wait>:
SYSCALL(wait)
 600:	b8 03 00 00 00       	mov    $0x3,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <pipe>:
SYSCALL(pipe)
 608:	b8 04 00 00 00       	mov    $0x4,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <read>:
SYSCALL(read)
 610:	b8 05 00 00 00       	mov    $0x5,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <write>:
SYSCALL(write)
 618:	b8 10 00 00 00       	mov    $0x10,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <close>:
SYSCALL(close)
 620:	b8 15 00 00 00       	mov    $0x15,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <kill>:
SYSCALL(kill)
 628:	b8 06 00 00 00       	mov    $0x6,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <exec>:
SYSCALL(exec)
 630:	b8 07 00 00 00       	mov    $0x7,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <open>:
SYSCALL(open)
 638:	b8 0f 00 00 00       	mov    $0xf,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <mknod>:
SYSCALL(mknod)
 640:	b8 11 00 00 00       	mov    $0x11,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <unlink>:
SYSCALL(unlink)
 648:	b8 12 00 00 00       	mov    $0x12,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <fstat>:
SYSCALL(fstat)
 650:	b8 08 00 00 00       	mov    $0x8,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <link>:
SYSCALL(link)
 658:	b8 13 00 00 00       	mov    $0x13,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <mkdir>:
SYSCALL(mkdir)
 660:	b8 14 00 00 00       	mov    $0x14,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <chdir>:
SYSCALL(chdir)
 668:	b8 09 00 00 00       	mov    $0x9,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <dup>:
SYSCALL(dup)
 670:	b8 0a 00 00 00       	mov    $0xa,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <getpid>:
SYSCALL(getpid)
 678:	b8 0b 00 00 00       	mov    $0xb,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <sbrk>:
SYSCALL(sbrk)
 680:	b8 0c 00 00 00       	mov    $0xc,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <sleep>:
SYSCALL(sleep)
 688:	b8 0d 00 00 00       	mov    $0xd,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <uptime>:
SYSCALL(uptime)
 690:	b8 0e 00 00 00       	mov    $0xe,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <mount>:
SYSCALL(mount)
 698:	b8 16 00 00 00       	mov    $0x16,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <umount>:
SYSCALL(umount)
 6a0:	b8 17 00 00 00       	mov    $0x17,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <printmounts>:
SYSCALL(printmounts)
 6a8:	b8 18 00 00 00       	mov    $0x18,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <printdevices>:
SYSCALL(printdevices)
 6b0:	b8 19 00 00 00       	mov    $0x19,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <unshare>:
SYSCALL(unshare)
 6b8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <usleep>:
SYSCALL(usleep)
 6c0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <ioctl>:
SYSCALL(ioctl)
 6c8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <getppid>:
SYSCALL(getppid)
 6d0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <getcpu>:
SYSCALL(getcpu)
 6d8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <getmem>:
SYSCALL(getmem)
 6e0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <kmemtest>:
SYSCALL(kmemtest)
 6e8:	b8 20 00 00 00       	mov    $0x20,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 6fc:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ff:	85 db                	test   %ebx,%ebx
 701:	0f 84 91 00 00 00    	je     798 <printint+0xa8>
 707:	89 d0                	mov    %edx,%eax
 709:	c1 e8 1f             	shr    $0x1f,%eax
 70c:	84 c0                	test   %al,%al
 70e:	0f 84 84 00 00 00    	je     798 <printint+0xa8>
    neg = 1;
    x = -xx;
 714:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 716:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 71d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 71f:	31 ff                	xor    %edi,%edi
 721:	8d 75 c7             	lea    -0x39(%ebp),%esi
 724:	eb 0c                	jmp    732 <printint+0x42>
 726:	8d 76 00             	lea    0x0(%esi),%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 730:	89 df                	mov    %ebx,%edi
 732:	31 d2                	xor    %edx,%edx
 734:	8d 5f 01             	lea    0x1(%edi),%ebx
 737:	f7 f1                	div    %ecx
 739:	0f b6 92 c0 0c 00 00 	movzbl 0xcc0(%edx),%edx
  }while((x /= base) != 0);
 740:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 742:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 745:	75 e9                	jne    730 <printint+0x40>
  if(neg)
 747:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 74a:	85 c0                	test   %eax,%eax
 74c:	74 08                	je     756 <printint+0x66>
    buf[i++] = '-';
 74e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 753:	8d 5f 02             	lea    0x2(%edi),%ebx
 756:	8d 7d d8             	lea    -0x28(%ebp),%edi
 759:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 75d:	89 fa                	mov    %edi,%edx
 75f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 760:	0f b6 08             	movzbl (%eax),%ecx
 763:	83 e8 01             	sub    $0x1,%eax
 766:	83 c2 01             	add    $0x1,%edx
 769:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 76c:	39 f0                	cmp    %esi,%eax
 76e:	75 f0                	jne    760 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 770:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 773:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 778:	57                   	push   %edi
 779:	e8 f2 fa ff ff       	call   270 <strlen>
 77e:	83 c4 0c             	add    $0xc,%esp
 781:	50                   	push   %eax
 782:	57                   	push   %edi
 783:	ff 75 c0             	pushl  -0x40(%ebp)
 786:	e8 8d fe ff ff       	call   618 <write>
}
 78b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78e:	5b                   	pop    %ebx
 78f:	5e                   	pop    %esi
 790:	5f                   	pop    %edi
 791:	5d                   	pop    %ebp
 792:	c3                   	ret    
 793:	90                   	nop
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 798:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 79a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 7a1:	e9 79 ff ff ff       	jmp    71f <printint+0x2f>
 7a6:	8d 76 00             	lea    0x0(%esi),%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7b9:	8b 75 0c             	mov    0xc(%ebp),%esi
 7bc:	0f b6 06             	movzbl (%esi),%eax
 7bf:	84 c0                	test   %al,%al
 7c1:	0f 84 90 01 00 00    	je     957 <printf+0x1a7>
 7c7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 7ca:	31 ff                	xor    %edi,%edi
 7cc:	31 d2                	xor    %edx,%edx
 7ce:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7d1:	31 db                	xor    %ebx,%ebx
 7d3:	eb 39                	jmp    80e <printf+0x5e>
 7d5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7d8:	83 f9 25             	cmp    $0x25,%ecx
 7db:	0f 84 af 00 00 00    	je     890 <printf+0xe0>
 7e1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 7e4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 7e7:	83 ec 04             	sub    $0x4,%esp
 7ea:	6a 01                	push   $0x1
 7ec:	50                   	push   %eax
 7ed:	ff 75 08             	pushl  0x8(%ebp)
 7f0:	e8 23 fe ff ff       	call   618 <write>
 7f5:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 7f8:	85 c0                	test   %eax,%eax
 7fa:	78 35                	js     831 <printf+0x81>
 7fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7ff:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 802:	01 c7                	add    %eax,%edi
 804:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 806:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 80a:	84 c0                	test   %al,%al
 80c:	74 21                	je     82f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 80e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 811:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 813:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 816:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 819:	74 bd                	je     7d8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 81b:	83 fa 25             	cmp    $0x25,%edx
 81e:	74 20                	je     840 <printf+0x90>
 820:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 822:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 825:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 827:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 82b:	84 c0                	test   %al,%al
 82d:	75 df                	jne    80e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 82f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 831:	8d 65 f4             	lea    -0xc(%ebp),%esp
 834:	5b                   	pop    %ebx
 835:	5e                   	pop    %esi
 836:	5f                   	pop    %edi
 837:	5d                   	pop    %ebp
 838:	c3                   	ret    
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 840:	83 f9 64             	cmp    $0x64,%ecx
 843:	0f 84 7f 00 00 00    	je     8c8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 849:	0f be d0             	movsbl %al,%edx
 84c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 852:	83 fa 70             	cmp    $0x70,%edx
 855:	74 49                	je     8a0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 857:	83 f9 73             	cmp    $0x73,%ecx
 85a:	0f 84 98 00 00 00    	je     8f8 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 860:	83 f9 63             	cmp    $0x63,%ecx
 863:	0f 84 c7 00 00 00    	je     930 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 869:	83 f9 25             	cmp    $0x25,%ecx
 86c:	74 6a                	je     8d8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 86e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 871:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 874:	83 ec 04             	sub    $0x4,%esp
 877:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 879:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 87d:	50                   	push   %eax
 87e:	ff 75 08             	pushl  0x8(%ebp)
 881:	e8 92 fd ff ff       	call   618 <write>
 886:	83 c4 10             	add    $0x10,%esp
 889:	e9 6a ff ff ff       	jmp    7f8 <printf+0x48>
 88e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 890:	ba 25 00 00 00       	mov    $0x25,%edx
 895:	31 c0                	xor    %eax,%eax
 897:	eb 89                	jmp    822 <printf+0x72>
 899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a8:	6a 00                	push   $0x0
 8aa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 8ad:	8b 45 08             	mov    0x8(%ebp),%eax
 8b0:	8b 16                	mov    (%esi),%edx
        ap++;
 8b2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 8b5:	e8 36 fe ff ff       	call   6f0 <printint>
        ap++;
 8ba:	89 75 d0             	mov    %esi,-0x30(%ebp)
 8bd:	83 c4 10             	add    $0x10,%esp
 8c0:	e9 33 ff ff ff       	jmp    7f8 <printf+0x48>
 8c5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 8c8:	83 ec 0c             	sub    $0xc,%esp
 8cb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8d0:	6a 01                	push   $0x1
 8d2:	eb d6                	jmp    8aa <printf+0xfa>
 8d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8d8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 8db:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8de:	83 ec 04             	sub    $0x4,%esp
 8e1:	6a 01                	push   $0x1
 8e3:	50                   	push   %eax
 8e4:	ff 75 08             	pushl  0x8(%ebp)
 8e7:	e8 2c fd ff ff       	call   618 <write>
 8ec:	83 c4 10             	add    $0x10,%esp
 8ef:	e9 04 ff ff ff       	jmp    7f8 <printf+0x48>
 8f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 8f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8fb:	8b 30                	mov    (%eax),%esi
        ap++;
 8fd:	83 c0 04             	add    $0x4,%eax
 900:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 903:	b8 b8 0c 00 00       	mov    $0xcb8,%eax
 908:	85 f6                	test   %esi,%esi
 90a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 90d:	83 ec 0c             	sub    $0xc,%esp
 910:	56                   	push   %esi
 911:	e8 5a f9 ff ff       	call   270 <strlen>
 916:	83 c4 0c             	add    $0xc,%esp
 919:	50                   	push   %eax
 91a:	56                   	push   %esi
 91b:	ff 75 08             	pushl  0x8(%ebp)
 91e:	e8 f5 fc ff ff       	call   618 <write>
 923:	83 c4 10             	add    $0x10,%esp
 926:	e9 cd fe ff ff       	jmp    7f8 <printf+0x48>
 92b:	90                   	nop
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 930:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 933:	83 ec 04             	sub    $0x4,%esp
 936:	8b 06                	mov    (%esi),%eax
 938:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 93a:	83 c6 04             	add    $0x4,%esi
 93d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 940:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 943:	50                   	push   %eax
 944:	ff 75 08             	pushl  0x8(%ebp)
 947:	e8 cc fc ff ff       	call   618 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 94c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 94f:	83 c4 10             	add    $0x10,%esp
 952:	e9 a1 fe ff ff       	jmp    7f8 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 957:	31 c0                	xor    %eax,%eax
 959:	e9 d3 fe ff ff       	jmp    831 <printf+0x81>
 95e:	66 90                	xchg   %ax,%ax

00000960 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 960:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 966:	89 e5                	mov    %esp,%ebp
 968:	57                   	push   %edi
 969:	56                   	push   %esi
 96a:	53                   	push   %ebx
 96b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 970:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 973:	39 c8                	cmp    %ecx,%eax
 975:	73 19                	jae    990 <free+0x30>
 977:	89 f6                	mov    %esi,%esi
 979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 980:	39 d1                	cmp    %edx,%ecx
 982:	72 1c                	jb     9a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 984:	39 d0                	cmp    %edx,%eax
 986:	73 18                	jae    9a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 988:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 98a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 98c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 98e:	72 f0                	jb     980 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 990:	39 d0                	cmp    %edx,%eax
 992:	72 f4                	jb     988 <free+0x28>
 994:	39 d1                	cmp    %edx,%ecx
 996:	73 f0                	jae    988 <free+0x28>
 998:	90                   	nop
 999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9a6:	39 d7                	cmp    %edx,%edi
 9a8:	74 19                	je     9c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ad:	8b 50 04             	mov    0x4(%eax),%edx
 9b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b3:	39 f1                	cmp    %esi,%ecx
 9b5:	74 23                	je     9da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9b9:	a3 00 20 00 00       	mov    %eax,0x2000
}
 9be:	5b                   	pop    %ebx
 9bf:	5e                   	pop    %esi
 9c0:	5f                   	pop    %edi
 9c1:	5d                   	pop    %ebp
 9c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9c3:	03 72 04             	add    0x4(%edx),%esi
 9c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9c9:	8b 10                	mov    (%eax),%edx
 9cb:	8b 12                	mov    (%edx),%edx
 9cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9d0:	8b 50 04             	mov    0x4(%eax),%edx
 9d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9d6:	39 f1                	cmp    %esi,%ecx
 9d8:	75 dd                	jne    9b7 <free+0x57>
    p->s.size += bp->s.size;
 9da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9dd:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9ea:	5b                   	pop    %ebx
 9eb:	5e                   	pop    %esi
 9ec:	5f                   	pop    %edi
 9ed:	5d                   	pop    %ebp
 9ee:	c3                   	ret    
 9ef:	90                   	nop

000009f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	57                   	push   %edi
 9f4:	56                   	push   %esi
 9f5:	53                   	push   %ebx
 9f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9fc:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a02:	8d 78 07             	lea    0x7(%eax),%edi
 a05:	c1 ef 03             	shr    $0x3,%edi
 a08:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a0b:	85 d2                	test   %edx,%edx
 a0d:	0f 84 a3 00 00 00    	je     ab6 <malloc+0xc6>
 a13:	8b 02                	mov    (%edx),%eax
 a15:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a18:	39 cf                	cmp    %ecx,%edi
 a1a:	76 74                	jbe    a90 <malloc+0xa0>
 a1c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a22:	be 00 10 00 00       	mov    $0x1000,%esi
 a27:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 a2e:	0f 43 f7             	cmovae %edi,%esi
 a31:	ba 00 80 00 00       	mov    $0x8000,%edx
 a36:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 a3c:	0f 46 da             	cmovbe %edx,%ebx
 a3f:	eb 10                	jmp    a51 <malloc+0x61>
 a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a48:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a4a:	8b 48 04             	mov    0x4(%eax),%ecx
 a4d:	39 cf                	cmp    %ecx,%edi
 a4f:	76 3f                	jbe    a90 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a51:	39 05 00 20 00 00    	cmp    %eax,0x2000
 a57:	89 c2                	mov    %eax,%edx
 a59:	75 ed                	jne    a48 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a5b:	83 ec 0c             	sub    $0xc,%esp
 a5e:	53                   	push   %ebx
 a5f:	e8 1c fc ff ff       	call   680 <sbrk>
  if(p == (char*)-1)
 a64:	83 c4 10             	add    $0x10,%esp
 a67:	83 f8 ff             	cmp    $0xffffffff,%eax
 a6a:	74 1c                	je     a88 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a6c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 a6f:	83 ec 0c             	sub    $0xc,%esp
 a72:	83 c0 08             	add    $0x8,%eax
 a75:	50                   	push   %eax
 a76:	e8 e5 fe ff ff       	call   960 <free>
  return freep;
 a7b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a81:	83 c4 10             	add    $0x10,%esp
 a84:	85 d2                	test   %edx,%edx
 a86:	75 c0                	jne    a48 <malloc+0x58>
        return 0;
 a88:	31 c0                	xor    %eax,%eax
 a8a:	eb 1c                	jmp    aa8 <malloc+0xb8>
 a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a90:	39 cf                	cmp    %ecx,%edi
 a92:	74 1c                	je     ab0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a94:	29 f9                	sub    %edi,%ecx
 a96:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a99:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a9c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 a9f:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 aa5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 aa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 aab:	5b                   	pop    %ebx
 aac:	5e                   	pop    %esi
 aad:	5f                   	pop    %edi
 aae:	5d                   	pop    %ebp
 aaf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 ab0:	8b 08                	mov    (%eax),%ecx
 ab2:	89 0a                	mov    %ecx,(%edx)
 ab4:	eb e9                	jmp    a9f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 ab6:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 abd:	20 00 00 
 ac0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 ac7:	20 00 00 
    base.s.size = 0;
 aca:	b8 04 20 00 00       	mov    $0x2004,%eax
 acf:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 ad6:	00 00 00 
 ad9:	e9 3e ff ff ff       	jmp    a1c <malloc+0x2c>
 ade:	66 90                	xchg   %ax,%ax

00000ae0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 ae6:	6a 10                	push   $0x10
 ae8:	6a 02                	push   $0x2
 aea:	ff 75 08             	pushl  0x8(%ebp)
 aed:	e8 d6 fb ff ff       	call   6c8 <ioctl>
}
 af2:	c9                   	leave  
 af3:	c3                   	ret    
 af4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 afa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b00 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 b06:	68 00 10 00 00       	push   $0x1000
 b0b:	6a 02                	push   $0x2
 b0d:	ff 75 08             	pushl  0x8(%ebp)
 b10:	e8 b3 fb ff ff       	call   6c8 <ioctl>
}
 b15:	c9                   	leave  
 b16:	c3                   	ret    
 b17:	89 f6                	mov    %esi,%esi
 b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b20 <attach_tty>:

int
attach_tty(int tty_fd)
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
 b23:	53                   	push   %ebx
 b24:	83 ec 08             	sub    $0x8,%esp
 b27:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 b2a:	6a 10                	push   $0x10
 b2c:	6a 01                	push   $0x1
 b2e:	53                   	push   %ebx
 b2f:	e8 94 fb ff ff       	call   6c8 <ioctl>
 b34:	83 c4 10             	add    $0x10,%esp
 b37:	85 c0                	test   %eax,%eax
 b39:	78 55                	js     b90 <attach_tty+0x70>
     return -1;

    close(0);
 b3b:	83 ec 0c             	sub    $0xc,%esp
 b3e:	6a 00                	push   $0x0
 b40:	e8 db fa ff ff       	call   620 <close>
    close(1);
 b45:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b4c:	e8 cf fa ff ff       	call   620 <close>
    close(2);
 b51:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b58:	e8 c3 fa ff ff       	call   620 <close>
    if(dup(tty_fd) < 0)
 b5d:	89 1c 24             	mov    %ebx,(%esp)
 b60:	e8 0b fb ff ff       	call   670 <dup>
 b65:	83 c4 10             	add    $0x10,%esp
 b68:	85 c0                	test   %eax,%eax
 b6a:	78 24                	js     b90 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 b6c:	83 ec 0c             	sub    $0xc,%esp
 b6f:	53                   	push   %ebx
 b70:	e8 fb fa ff ff       	call   670 <dup>
 b75:	83 c4 10             	add    $0x10,%esp
 b78:	85 c0                	test   %eax,%eax
 b7a:	78 14                	js     b90 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 b7c:	83 ec 0c             	sub    $0xc,%esp
 b7f:	53                   	push   %ebx
 b80:	e8 eb fa ff ff       	call   670 <dup>
 b85:	83 c4 10             	add    $0x10,%esp
 b88:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 b8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b8e:	c9                   	leave  
 b8f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 b95:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b98:	c9                   	leave  
 b99:	c3                   	ret    
 b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ba0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 ba6:	6a 20                	push   $0x20
 ba8:	6a 01                	push   $0x1
 baa:	ff 75 08             	pushl  0x8(%ebp)
 bad:	e8 16 fb ff ff       	call   6c8 <ioctl>
    return 0;
}
 bb2:	31 c0                	xor    %eax,%eax
 bb4:	c9                   	leave  
 bb5:	c3                   	ret    
 bb6:	8d 76 00             	lea    0x0(%esi),%esi
 bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bc0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 bc0:	55                   	push   %ebp
 bc1:	89 e5                	mov    %esp,%ebp
 bc3:	53                   	push   %ebx
 bc4:	83 ec 08             	sub    $0x8,%esp
 bc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 bca:	6a 10                	push   $0x10
 bcc:	6a 02                	push   $0x2
 bce:	53                   	push   %ebx
 bcf:	e8 f4 fa ff ff       	call   6c8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 bd4:	83 c4 10             	add    $0x10,%esp
 bd7:	85 c0                	test   %eax,%eax
 bd9:	74 1d                	je     bf8 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 bdb:	83 ec 04             	sub    $0x4,%esp
 bde:	68 00 10 00 00       	push   $0x1000
 be3:	6a 01                	push   $0x1
 be5:	53                   	push   %ebx
 be6:	e8 dd fa ff ff       	call   6c8 <ioctl>
     return tty_fd;
 beb:	83 c4 10             	add    $0x10,%esp
 bee:	89 d8                	mov    %ebx,%eax
}
 bf0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bf3:	c9                   	leave  
 bf4:	c3                   	ret    
 bf5:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 bf8:	83 ec 0c             	sub    $0xc,%esp
 bfb:	53                   	push   %ebx
 bfc:	e8 1f fa ff ff       	call   620 <close>
       return -1;
 c01:	83 c4 10             	add    $0x10,%esp
 c04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c09:	eb e5                	jmp    bf0 <connect_tty+0x30>
 c0b:	90                   	nop
 c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c10 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 c10:	55                   	push   %ebp
 c11:	89 e5                	mov    %esp,%ebp
 c13:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 c16:	68 00 20 00 00       	push   $0x2000
 c1b:	6a 01                	push   $0x1
 c1d:	ff 75 08             	pushl  0x8(%ebp)
 c20:	e8 a3 fa ff ff       	call   6c8 <ioctl>
}
 c25:	c9                   	leave  
 c26:	c3                   	ret    
