
_demo_pid_ns:     file format elf32-i386


Disassembly of section .text:

00000000 <panic>:
#include "param.h"


void
panic(char *s)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
  printf(stderr, "%s\n", s);
   6:	ff 75 08             	pushl  0x8(%ebp)
   9:	68 88 0b 00 00       	push   $0xb88
   e:	6a 02                	push   $0x2
  10:	e8 fb 06 00 00       	call   710 <printf>
  exit(1);
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 37 05 00 00       	call   558 <exit>
  21:	66 90                	xchg   %ax,%ax
  23:	66 90                	xchg   %ax,%ax
  25:	66 90                	xchg   %ax,%ax
  27:	66 90                	xchg   %ax,%ax
  29:	66 90                	xchg   %ax,%ax
  2b:	66 90                	xchg   %ax,%ax
  2d:	66 90                	xchg   %ax,%ax
  2f:	90                   	nop

00000030 <main>:
}

int
main(int argc, char *argv[])
{
  30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  34:	83 e4 f0             	and    $0xfffffff0,%esp
  37:	ff 71 fc             	pushl  -0x4(%ecx)
  3a:	55                   	push   %ebp
  3b:	89 e5                	mov    %esp,%ebp
  3d:	51                   	push   %ecx
  3e:	83 ec 10             	sub    $0x10,%esp

      if(unshare(PID_NS) != 0){
  41:	6a 02                	push   $0x2
  43:	e8 d0 05 00 00       	call   618 <unshare>
  48:	83 c4 10             	add    $0x10,%esp
  4b:	85 c0                	test   %eax,%eax
  4d:	75 2e                	jne    7d <main+0x4d>
        printf(stderr, "Cannot create pid namespace\n");
        return -1;
      }

      int pid = fork();
  4f:	e8 fc 04 00 00       	call   550 <fork>
      if(pid == -1){
  54:	83 f8 ff             	cmp    $0xffffffff,%eax
  57:	74 50                	je     a9 <main+0x79>
         panic("fork");
      }

      if(pid == 0)
  59:	85 c0                	test   %eax,%eax
  5b:	75 39                	jne    96 <main+0x66>
        printf(1, "New namespace. PID=%d\n", getpid());
  5d:	e8 76 05 00 00       	call   5d8 <getpid>
  62:	51                   	push   %ecx
  63:	50                   	push   %eax
  64:	68 ae 0b 00 00       	push   $0xbae
  69:	6a 01                	push   $0x1
  6b:	e8 a0 06 00 00       	call   710 <printf>
  70:	83 c4 10             	add    $0x10,%esp
      else
        printf(1, "Parent's perspective on the child. PID=%d\n", pid);

      exit(0);
  73:	83 ec 0c             	sub    $0xc,%esp
  76:	6a 00                	push   $0x0
  78:	e8 db 04 00 00       	call   558 <exit>
int
main(int argc, char *argv[])
{

      if(unshare(PID_NS) != 0){
        printf(stderr, "Cannot create pid namespace\n");
  7d:	50                   	push   %eax
  7e:	50                   	push   %eax
  7f:	68 8c 0b 00 00       	push   $0xb8c
  84:	6a 02                	push   $0x2
  86:	e8 85 06 00 00       	call   710 <printf>
        printf(1, "New namespace. PID=%d\n", getpid());
      else
        printf(1, "Parent's perspective on the child. PID=%d\n", pid);

      exit(0);
}
  8b:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  8e:	83 c8 ff             	or     $0xffffffff,%eax
  91:	c9                   	leave  
  92:	8d 61 fc             	lea    -0x4(%ecx),%esp
  95:	c3                   	ret    
      }

      if(pid == 0)
        printf(1, "New namespace. PID=%d\n", getpid());
      else
        printf(1, "Parent's perspective on the child. PID=%d\n", pid);
  96:	52                   	push   %edx
  97:	50                   	push   %eax
  98:	68 c8 0b 00 00       	push   $0xbc8
  9d:	6a 01                	push   $0x1
  9f:	e8 6c 06 00 00       	call   710 <printf>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	eb ca                	jmp    73 <main+0x43>
        return -1;
      }

      int pid = fork();
      if(pid == -1){
         panic("fork");
  a9:	83 ec 0c             	sub    $0xc,%esp
  ac:	68 a9 0b 00 00       	push   $0xba9
  b1:	e8 4a ff ff ff       	call   0 <panic>
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	53                   	push   %ebx
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ca:	89 c2                	mov    %eax,%edx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  d0:	83 c1 01             	add    $0x1,%ecx
  d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  d7:	83 c2 01             	add    $0x1,%edx
  da:	84 db                	test   %bl,%bl
  dc:	88 5a ff             	mov    %bl,-0x1(%edx)
  df:	75 ef                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  e1:	5b                   	pop    %ebx
  e2:	5d                   	pop    %ebp
  e3:	c3                   	ret    
  e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	56                   	push   %esi
  f4:	53                   	push   %ebx
  f5:	8b 55 08             	mov    0x8(%ebp),%edx
  f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fb:	0f b6 02             	movzbl (%edx),%eax
  fe:	0f b6 19             	movzbl (%ecx),%ebx
 101:	84 c0                	test   %al,%al
 103:	75 1e                	jne    123 <strcmp+0x33>
 105:	eb 29                	jmp    130 <strcmp+0x40>
 107:	89 f6                	mov    %esi,%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 110:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 113:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 116:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 119:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 11d:	84 c0                	test   %al,%al
 11f:	74 0f                	je     130 <strcmp+0x40>
 121:	89 f1                	mov    %esi,%ecx
 123:	38 d8                	cmp    %bl,%al
 125:	74 e9                	je     110 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 127:	29 d8                	sub    %ebx,%eax
}
 129:	5b                   	pop    %ebx
 12a:	5e                   	pop    %esi
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 130:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 132:	29 d8                	sub    %ebx,%eax
}
 134:	5b                   	pop    %ebx
 135:	5e                   	pop    %esi
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    
 138:	90                   	nop
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	8b 55 08             	mov    0x8(%ebp),%edx
 148:	53                   	push   %ebx
 149:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 14c:	0f b6 32             	movzbl (%edx),%esi
 14f:	89 f0                	mov    %esi,%eax
 151:	84 c0                	test   %al,%al
 153:	74 67                	je     1bc <strncmp+0x7c>
 155:	0f b6 19             	movzbl (%ecx),%ebx
 158:	89 f0                	mov    %esi,%eax
 15a:	38 d8                	cmp    %bl,%al
 15c:	75 65                	jne    1c3 <strncmp+0x83>
 15e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 161:	89 f0                	mov    %esi,%eax
 163:	0f b6 f0             	movzbl %al,%esi
 166:	89 f0                	mov    %esi,%eax
 168:	83 eb 01             	sub    $0x1,%ebx
 16b:	75 14                	jne    181 <strncmp+0x41>
 16d:	eb 25                	jmp    194 <strncmp+0x54>
 16f:	90                   	nop
 170:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 174:	89 f1                	mov    %esi,%ecx
 176:	38 c8                	cmp    %cl,%al
 178:	75 26                	jne    1a0 <strncmp+0x60>
 17a:	83 eb 01             	sub    $0x1,%ebx
 17d:	89 f9                	mov    %edi,%ecx
 17f:	74 2f                	je     1b0 <strncmp+0x70>
    p++, q++;
 181:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 184:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 187:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 18a:	84 c0                	test   %al,%al
 18c:	75 e2                	jne    170 <strncmp+0x30>
 18e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 192:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 194:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 195:	29 f0                	sub    %esi,%eax
}
 197:	5e                   	pop    %esi
 198:	5f                   	pop    %edi
 199:	5d                   	pop    %ebp
 19a:	c3                   	ret    
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	0f b6 f1             	movzbl %cl,%esi
 1a3:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1a4:	29 f0                	sub    %esi,%eax
}
 1a6:	5e                   	pop    %esi
 1a7:	5f                   	pop    %edi
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b0:	0f b6 f0             	movzbl %al,%esi
 1b3:	89 f0                	mov    %esi,%eax
 1b5:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1b6:	29 f0                	sub    %esi,%eax
}
 1b8:	5e                   	pop    %esi
 1b9:	5f                   	pop    %edi
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 1bc:	31 c0                	xor    %eax,%eax
 1be:	0f b6 31             	movzbl (%ecx),%esi
 1c1:	eb d1                	jmp    194 <strncmp+0x54>
 1c3:	0f b6 c0             	movzbl %al,%eax
 1c6:	0f b6 f3             	movzbl %bl,%esi
 1c9:	eb c9                	jmp    194 <strncmp+0x54>
 1cb:	90                   	nop
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 39 00             	cmpb   $0x0,(%ecx)
 1d9:	74 12                	je     1ed <strlen+0x1d>
 1db:	31 d2                	xor    %edx,%edx
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1e7:	89 d0                	mov    %edx,%eax
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1ed:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	eb 0d                	jmp    200 <memset>
 1f3:	90                   	nop
 1f4:	90                   	nop
 1f5:	90                   	nop
 1f6:	90                   	nop
 1f7:	90                   	nop
 1f8:	90                   	nop
 1f9:	90                   	nop
 1fa:	90                   	nop
 1fb:	90                   	nop
 1fc:	90                   	nop
 1fd:	90                   	nop
 1fe:	90                   	nop
 1ff:	90                   	nop

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	74 1d                	je     24e <strchr+0x2e>
    if(*s == c)
 231:	38 d3                	cmp    %dl,%bl
 233:	89 d9                	mov    %ebx,%ecx
 235:	75 0d                	jne    244 <strchr+0x24>
 237:	eb 17                	jmp    250 <strchr+0x30>
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	38 ca                	cmp    %cl,%dl
 242:	74 0c                	je     250 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 244:	83 c0 01             	add    $0x1,%eax
 247:	0f b6 10             	movzbl (%eax),%edx
 24a:	84 d2                	test   %dl,%dl
 24c:	75 f2                	jne    240 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 24e:	31 c0                	xor    %eax,%eax
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 266:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	31 db                	xor    %ebx,%ebx
 26b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 270:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 273:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 276:	7d 30                	jge    2a8 <gets+0x48>
    cc = read(0, &c, 1);
 278:	83 ec 04             	sub    $0x4,%esp
 27b:	6a 01                	push   $0x1
 27d:	56                   	push   %esi
 27e:	6a 00                	push   $0x0
 280:	e8 eb 02 00 00       	call   570 <read>
    if(cc < 1)
 285:	83 c4 10             	add    $0x10,%esp
 288:	85 c0                	test   %eax,%eax
 28a:	7e e7                	jle    273 <gets+0x13>
      continue;
    buf[i++] = c;
 28c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 290:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 293:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 295:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 298:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 29a:	74 0c                	je     2a8 <gets+0x48>
 29c:	3c 0d                	cmp    $0xd,%al
 29e:	74 08                	je     2a8 <gets+0x48>
 2a0:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 2a6:	7c d0                	jl     278 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b2:	5b                   	pop    %ebx
 2b3:	5e                   	pop    %esi
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	56                   	push   %esi
 2c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c5:	83 ec 08             	sub    $0x8,%esp
 2c8:	6a 00                	push   $0x0
 2ca:	ff 75 08             	pushl  0x8(%ebp)
 2cd:	e8 c6 02 00 00       	call   598 <open>
  if(fd < 0)
 2d2:	83 c4 10             	add    $0x10,%esp
 2d5:	85 c0                	test   %eax,%eax
 2d7:	78 27                	js     300 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2d9:	83 ec 08             	sub    $0x8,%esp
 2dc:	ff 75 0c             	pushl  0xc(%ebp)
 2df:	89 c3                	mov    %eax,%ebx
 2e1:	50                   	push   %eax
 2e2:	e8 c9 02 00 00       	call   5b0 <fstat>
 2e7:	89 c6                	mov    %eax,%esi
  close(fd);
 2e9:	89 1c 24             	mov    %ebx,(%esp)
 2ec:	e8 8f 02 00 00       	call   580 <close>
  return r;
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	89 f0                	mov    %esi,%eax
}
 2f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f9:	5b                   	pop    %ebx
 2fa:	5e                   	pop    %esi
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 300:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 305:	eb ef                	jmp    2f6 <stat+0x36>
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 317:	0f be 11             	movsbl (%ecx),%edx
 31a:	8d 42 d0             	lea    -0x30(%edx),%eax
 31d:	3c 09                	cmp    $0x9,%al
 31f:	b8 00 00 00 00       	mov    $0x0,%eax
 324:	77 1f                	ja     345 <atoi+0x35>
 326:	8d 76 00             	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 330:	8d 04 80             	lea    (%eax,%eax,4),%eax
 333:	83 c1 01             	add    $0x1,%ecx
 336:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 33a:	0f be 11             	movsbl (%ecx),%edx
 33d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 340:	80 fb 09             	cmp    $0x9,%bl
 343:	76 eb                	jbe    330 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 345:	5b                   	pop    %ebx
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    
 348:	90                   	nop
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
 355:	8b 5d 10             	mov    0x10(%ebp),%ebx
 358:	8b 45 08             	mov    0x8(%ebp),%eax
 35b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35e:	85 db                	test   %ebx,%ebx
 360:	7e 14                	jle    376 <memmove+0x26>
 362:	31 d2                	xor    %edx,%edx
 364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 368:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 36c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 36f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 372:	39 da                	cmp    %ebx,%edx
 374:	75 f2                	jne    368 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	83 ec 04             	sub    $0x4,%esp
 389:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 38c:	83 f9 00             	cmp    $0x0,%ecx
 38f:	7e 76                	jle    407 <itoa+0x87>
 391:	89 cb                	mov    %ecx,%ebx
 393:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 395:	bf 67 66 66 66       	mov    $0x66666667,%edi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3a0:	89 d8                	mov    %ebx,%eax
 3a2:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 3a5:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 3a8:	f7 ef                	imul   %edi
 3aa:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 3ad:	29 da                	sub    %ebx,%edx
 3af:	89 d3                	mov    %edx,%ebx
 3b1:	75 ed                	jne    3a0 <itoa+0x20>
        length++;
 3b3:	89 f3                	mov    %esi,%ebx
 3b5:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 3b8:	bf 67 66 66 66       	mov    $0x66666667,%edi
 3bd:	8b 75 08             	mov    0x8(%ebp),%esi
 3c0:	eb 0a                	jmp    3cc <itoa+0x4c>
 3c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3c8:	85 db                	test   %ebx,%ebx
 3ca:	7e 25                	jle    3f1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 3cc:	89 c8                	mov    %ecx,%eax
 3ce:	f7 ef                	imul   %edi
 3d0:	89 c8                	mov    %ecx,%eax
 3d2:	c1 f8 1f             	sar    $0x1f,%eax
 3d5:	c1 fa 02             	sar    $0x2,%edx
 3d8:	29 c2                	sub    %eax,%edx
 3da:	8d 04 92             	lea    (%edx,%edx,4),%eax
 3dd:	01 c0                	add    %eax,%eax
 3df:	29 c1                	sub    %eax,%ecx
 3e1:	83 c1 30             	add    $0x30,%ecx
 3e4:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3e8:	83 eb 01             	sub    $0x1,%ebx
 3eb:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 3ed:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3ef:	7f d7                	jg     3c8 <itoa+0x48>
 3f1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 3f4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 3f6:	8b 7d 08             	mov    0x8(%ebp),%edi
 3f9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 3fd:	83 c4 04             	add    $0x4,%esp
 400:	89 f0                	mov    %esi,%eax
 402:	5b                   	pop    %ebx
 403:	5e                   	pop    %esi
 404:	5f                   	pop    %edi
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 407:	75 12                	jne    41b <itoa+0x9b>
        buf[0] = '0';
 409:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 40c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 411:	c6 00 30             	movb   $0x30,(%eax)
 414:	b8 01 00 00 00       	mov    $0x1,%eax
 419:	eb db                	jmp    3f6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 41b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 41d:	31 f6                	xor    %esi,%esi
 41f:	eb d5                	jmp    3f6 <itoa+0x76>
 421:	eb 0d                	jmp    430 <strcat>
 423:	90                   	nop
 424:	90                   	nop
 425:	90                   	nop
 426:	90                   	nop
 427:	90                   	nop
 428:	90                   	nop
 429:	90                   	nop
 42a:	90                   	nop
 42b:	90                   	nop
 42c:	90                   	nop
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	53                   	push   %ebx
 439:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 43c:	80 38 00             	cmpb   $0x0,(%eax)
 43f:	74 38                	je     479 <strcat+0x49>
 441:	31 c9                	xor    %ecx,%ecx
 443:	90                   	nop
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 448:	83 c1 01             	add    $0x1,%ecx
 44b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 44f:	89 ca                	mov    %ecx,%edx
 451:	75 f5                	jne    448 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 453:	0f b6 1e             	movzbl (%esi),%ebx
 456:	84 db                	test   %bl,%bl
 458:	74 16                	je     470 <strcat+0x40>
 45a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 45d:	31 d2                	xor    %edx,%edx
 45f:	90                   	nop
                dest[i + j] = source[j];
 460:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 463:	83 c2 01             	add    $0x1,%edx
 466:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 46a:	84 db                	test   %bl,%bl
 46c:	75 f2                	jne    460 <strcat+0x30>
 46e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 470:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 474:	5b                   	pop    %ebx
 475:	5e                   	pop    %esi
 476:	5f                   	pop    %edi
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 479:	31 d2                	xor    %edx,%edx
 47b:	31 c9                	xor    %ecx,%ecx
 47d:	eb d4                	jmp    453 <strcat+0x23>
 47f:	90                   	nop

00000480 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 489:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 48c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 48f:	0f b6 00             	movzbl (%eax),%eax
 492:	84 c0                	test   %al,%al
 494:	88 45 f3             	mov    %al,-0xd(%ebp)
 497:	0f 84 a0 00 00 00    	je     53d <strstr+0xbd>
 49d:	8b 55 0c             	mov    0xc(%ebp),%edx
 4a0:	31 c0                	xor    %eax,%eax
 4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4a8:	83 c0 01             	add    $0x1,%eax
 4ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 4af:	75 f7                	jne    4a8 <strstr+0x28>
 4b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
 4b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4b7:	0f b6 07             	movzbl (%edi),%eax
 4ba:	84 c0                	test   %al,%al
 4bc:	74 68                	je     526 <strstr+0xa6>
 4be:	31 d2                	xor    %edx,%edx
 4c0:	83 c2 01             	add    $0x1,%edx
 4c3:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 4c7:	75 f7                	jne    4c0 <strstr+0x40>
 4c9:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4cc:	84 c0                	test   %al,%al
 4ce:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 4d1:	74 4d                	je     520 <strstr+0xa0>
 4d3:	90                   	nop
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d8:	38 45 f3             	cmp    %al,-0xd(%ebp)
 4db:	75 34                	jne    511 <strstr+0x91>
 4dd:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 4e0:	83 eb 01             	sub    $0x1,%ebx
 4e3:	74 4b                	je     530 <strstr+0xb0>
 4e5:	8b 55 0c             	mov    0xc(%ebp),%edx
 4e8:	89 f8                	mov    %edi,%eax
 4ea:	eb 10                	jmp    4fc <strstr+0x7c>
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4f0:	3a 4a 01             	cmp    0x1(%edx),%cl
 4f3:	75 1c                	jne    511 <strstr+0x91>
 4f5:	83 eb 01             	sub    $0x1,%ebx
 4f8:	89 f2                	mov    %esi,%edx
 4fa:	74 34                	je     530 <strstr+0xb0>
    p++, q++;
 4fc:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4ff:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 502:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 505:	84 c9                	test   %cl,%cl
 507:	75 e7                	jne    4f0 <strstr+0x70>
 509:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 50d:	84 c0                	test   %al,%al
 50f:	74 1f                	je     530 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 511:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 514:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 517:	74 0d                	je     526 <strstr+0xa6>
 519:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 51c:	84 c0                	test   %al,%al
 51e:	75 b8                	jne    4d8 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 520:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 524:	eb e7                	jmp    50d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 526:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 529:	31 c0                	xor    %eax,%eax
}
 52b:	5b                   	pop    %ebx
 52c:	5e                   	pop    %esi
 52d:	5f                   	pop    %edi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 530:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 533:	83 c4 10             	add    $0x10,%esp
 536:	5b                   	pop    %ebx
 537:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 538:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 53a:	5f                   	pop    %edi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 53d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 544:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 54b:	e9 67 ff ff ff       	jmp    4b7 <strstr+0x37>

00000550 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 550:	b8 01 00 00 00       	mov    $0x1,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <exit>:
SYSCALL(exit)
 558:	b8 02 00 00 00       	mov    $0x2,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <wait>:
SYSCALL(wait)
 560:	b8 03 00 00 00       	mov    $0x3,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <pipe>:
SYSCALL(pipe)
 568:	b8 04 00 00 00       	mov    $0x4,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <read>:
SYSCALL(read)
 570:	b8 05 00 00 00       	mov    $0x5,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <write>:
SYSCALL(write)
 578:	b8 10 00 00 00       	mov    $0x10,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <close>:
SYSCALL(close)
 580:	b8 15 00 00 00       	mov    $0x15,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <kill>:
SYSCALL(kill)
 588:	b8 06 00 00 00       	mov    $0x6,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <exec>:
SYSCALL(exec)
 590:	b8 07 00 00 00       	mov    $0x7,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <open>:
SYSCALL(open)
 598:	b8 0f 00 00 00       	mov    $0xf,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <mknod>:
SYSCALL(mknod)
 5a0:	b8 11 00 00 00       	mov    $0x11,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <unlink>:
SYSCALL(unlink)
 5a8:	b8 12 00 00 00       	mov    $0x12,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <fstat>:
SYSCALL(fstat)
 5b0:	b8 08 00 00 00       	mov    $0x8,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <link>:
SYSCALL(link)
 5b8:	b8 13 00 00 00       	mov    $0x13,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <mkdir>:
SYSCALL(mkdir)
 5c0:	b8 14 00 00 00       	mov    $0x14,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <chdir>:
SYSCALL(chdir)
 5c8:	b8 09 00 00 00       	mov    $0x9,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <dup>:
SYSCALL(dup)
 5d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <getpid>:
SYSCALL(getpid)
 5d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <sbrk>:
SYSCALL(sbrk)
 5e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <sleep>:
SYSCALL(sleep)
 5e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <uptime>:
SYSCALL(uptime)
 5f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <mount>:
SYSCALL(mount)
 5f8:	b8 16 00 00 00       	mov    $0x16,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <umount>:
SYSCALL(umount)
 600:	b8 17 00 00 00       	mov    $0x17,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <printmounts>:
SYSCALL(printmounts)
 608:	b8 18 00 00 00       	mov    $0x18,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <printdevices>:
SYSCALL(printdevices)
 610:	b8 19 00 00 00       	mov    $0x19,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <unshare>:
SYSCALL(unshare)
 618:	b8 1a 00 00 00       	mov    $0x1a,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <usleep>:
SYSCALL(usleep)
 620:	b8 1b 00 00 00       	mov    $0x1b,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <ioctl>:
SYSCALL(ioctl)
 628:	b8 1c 00 00 00       	mov    $0x1c,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <getppid>:
SYSCALL(getppid)
 630:	b8 1d 00 00 00       	mov    $0x1d,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <getcpu>:
SYSCALL(getcpu)
 638:	b8 1e 00 00 00       	mov    $0x1e,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <getmem>:
SYSCALL(getmem)
 640:	b8 1f 00 00 00       	mov    $0x1f,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <kmemtest>:
SYSCALL(kmemtest)
 648:	b8 20 00 00 00       	mov    $0x20,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 659:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 65c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 65f:	85 db                	test   %ebx,%ebx
 661:	0f 84 91 00 00 00    	je     6f8 <printint+0xa8>
 667:	89 d0                	mov    %edx,%eax
 669:	c1 e8 1f             	shr    $0x1f,%eax
 66c:	84 c0                	test   %al,%al
 66e:	0f 84 84 00 00 00    	je     6f8 <printint+0xa8>
    neg = 1;
    x = -xx;
 674:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 676:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 67d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 67f:	31 ff                	xor    %edi,%edi
 681:	8d 75 c7             	lea    -0x39(%ebp),%esi
 684:	eb 0c                	jmp    692 <printint+0x42>
 686:	8d 76 00             	lea    0x0(%esi),%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 690:	89 df                	mov    %ebx,%edi
 692:	31 d2                	xor    %edx,%edx
 694:	8d 5f 01             	lea    0x1(%edi),%ebx
 697:	f7 f1                	div    %ecx
 699:	0f b6 92 fc 0b 00 00 	movzbl 0xbfc(%edx),%edx
  }while((x /= base) != 0);
 6a0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 6a2:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6a5:	75 e9                	jne    690 <printint+0x40>
  if(neg)
 6a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6aa:	85 c0                	test   %eax,%eax
 6ac:	74 08                	je     6b6 <printint+0x66>
    buf[i++] = '-';
 6ae:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 6b3:	8d 5f 02             	lea    0x2(%edi),%ebx
 6b6:	8d 7d d8             	lea    -0x28(%ebp),%edi
 6b9:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 6bd:	89 fa                	mov    %edi,%edx
 6bf:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 6c0:	0f b6 08             	movzbl (%eax),%ecx
 6c3:	83 e8 01             	sub    $0x1,%eax
 6c6:	83 c2 01             	add    $0x1,%edx
 6c9:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 6cc:	39 f0                	cmp    %esi,%eax
 6ce:	75 f0                	jne    6c0 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 6d0:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 6d3:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 6d8:	57                   	push   %edi
 6d9:	e8 f2 fa ff ff       	call   1d0 <strlen>
 6de:	83 c4 0c             	add    $0xc,%esp
 6e1:	50                   	push   %eax
 6e2:	57                   	push   %edi
 6e3:	ff 75 c0             	pushl  -0x40(%ebp)
 6e6:	e8 8d fe ff ff       	call   578 <write>
}
 6eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ee:	5b                   	pop    %ebx
 6ef:	5e                   	pop    %esi
 6f0:	5f                   	pop    %edi
 6f1:	5d                   	pop    %ebp
 6f2:	c3                   	ret    
 6f3:	90                   	nop
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6f8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6fa:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 701:	e9 79 ff ff ff       	jmp    67f <printint+0x2f>
 706:	8d 76 00             	lea    0x0(%esi),%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000710 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 719:	8b 75 0c             	mov    0xc(%ebp),%esi
 71c:	0f b6 06             	movzbl (%esi),%eax
 71f:	84 c0                	test   %al,%al
 721:	0f 84 90 01 00 00    	je     8b7 <printf+0x1a7>
 727:	8d 5d 10             	lea    0x10(%ebp),%ebx
 72a:	31 ff                	xor    %edi,%edi
 72c:	31 d2                	xor    %edx,%edx
 72e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 731:	31 db                	xor    %ebx,%ebx
 733:	eb 39                	jmp    76e <printf+0x5e>
 735:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 738:	83 f9 25             	cmp    $0x25,%ecx
 73b:	0f 84 af 00 00 00    	je     7f0 <printf+0xe0>
 741:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 744:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 747:	83 ec 04             	sub    $0x4,%esp
 74a:	6a 01                	push   $0x1
 74c:	50                   	push   %eax
 74d:	ff 75 08             	pushl  0x8(%ebp)
 750:	e8 23 fe ff ff       	call   578 <write>
 755:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 758:	85 c0                	test   %eax,%eax
 75a:	78 35                	js     791 <printf+0x81>
 75c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 75f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 762:	01 c7                	add    %eax,%edi
 764:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 766:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 76a:	84 c0                	test   %al,%al
 76c:	74 21                	je     78f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 76e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 771:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 773:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 776:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 779:	74 bd                	je     738 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 77b:	83 fa 25             	cmp    $0x25,%edx
 77e:	74 20                	je     7a0 <printf+0x90>
 780:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 782:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 785:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 787:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 78b:	84 c0                	test   %al,%al
 78d:	75 df                	jne    76e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 78f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 791:	8d 65 f4             	lea    -0xc(%ebp),%esp
 794:	5b                   	pop    %ebx
 795:	5e                   	pop    %esi
 796:	5f                   	pop    %edi
 797:	5d                   	pop    %ebp
 798:	c3                   	ret    
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 7a0:	83 f9 64             	cmp    $0x64,%ecx
 7a3:	0f 84 7f 00 00 00    	je     828 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7a9:	0f be d0             	movsbl %al,%edx
 7ac:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 7b2:	83 fa 70             	cmp    $0x70,%edx
 7b5:	74 49                	je     800 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7b7:	83 f9 73             	cmp    $0x73,%ecx
 7ba:	0f 84 98 00 00 00    	je     858 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 7c0:	83 f9 63             	cmp    $0x63,%ecx
 7c3:	0f 84 c7 00 00 00    	je     890 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7c9:	83 f9 25             	cmp    $0x25,%ecx
 7cc:	74 6a                	je     838 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 7ce:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 7d1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7d4:	83 ec 04             	sub    $0x4,%esp
 7d7:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 7d9:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 7dd:	50                   	push   %eax
 7de:	ff 75 08             	pushl  0x8(%ebp)
 7e1:	e8 92 fd ff ff       	call   578 <write>
 7e6:	83 c4 10             	add    $0x10,%esp
 7e9:	e9 6a ff ff ff       	jmp    758 <printf+0x48>
 7ee:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7f0:	ba 25 00 00 00       	mov    $0x25,%edx
 7f5:	31 c0                	xor    %eax,%eax
 7f7:	eb 89                	jmp    782 <printf+0x72>
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	b9 10 00 00 00       	mov    $0x10,%ecx
 808:	6a 00                	push   $0x0
 80a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80d:	8b 45 08             	mov    0x8(%ebp),%eax
 810:	8b 16                	mov    (%esi),%edx
        ap++;
 812:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 815:	e8 36 fe ff ff       	call   650 <printint>
        ap++;
 81a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 81d:	83 c4 10             	add    $0x10,%esp
 820:	e9 33 ff ff ff       	jmp    758 <printf+0x48>
 825:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 828:	83 ec 0c             	sub    $0xc,%esp
 82b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 830:	6a 01                	push   $0x1
 832:	eb d6                	jmp    80a <printf+0xfa>
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 838:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 83b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 83e:	83 ec 04             	sub    $0x4,%esp
 841:	6a 01                	push   $0x1
 843:	50                   	push   %eax
 844:	ff 75 08             	pushl  0x8(%ebp)
 847:	e8 2c fd ff ff       	call   578 <write>
 84c:	83 c4 10             	add    $0x10,%esp
 84f:	e9 04 ff ff ff       	jmp    758 <printf+0x48>
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 858:	8b 45 d0             	mov    -0x30(%ebp),%eax
 85b:	8b 30                	mov    (%eax),%esi
        ap++;
 85d:	83 c0 04             	add    $0x4,%eax
 860:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 863:	b8 f4 0b 00 00       	mov    $0xbf4,%eax
 868:	85 f6                	test   %esi,%esi
 86a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 86d:	83 ec 0c             	sub    $0xc,%esp
 870:	56                   	push   %esi
 871:	e8 5a f9 ff ff       	call   1d0 <strlen>
 876:	83 c4 0c             	add    $0xc,%esp
 879:	50                   	push   %eax
 87a:	56                   	push   %esi
 87b:	ff 75 08             	pushl  0x8(%ebp)
 87e:	e8 f5 fc ff ff       	call   578 <write>
 883:	83 c4 10             	add    $0x10,%esp
 886:	e9 cd fe ff ff       	jmp    758 <printf+0x48>
 88b:	90                   	nop
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 890:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 893:	83 ec 04             	sub    $0x4,%esp
 896:	8b 06                	mov    (%esi),%eax
 898:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 89a:	83 c6 04             	add    $0x4,%esi
 89d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 8a0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8a3:	50                   	push   %eax
 8a4:	ff 75 08             	pushl  0x8(%ebp)
 8a7:	e8 cc fc ff ff       	call   578 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 8ac:	89 75 d0             	mov    %esi,-0x30(%ebp)
 8af:	83 c4 10             	add    $0x10,%esp
 8b2:	e9 a1 fe ff ff       	jmp    758 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 8b7:	31 c0                	xor    %eax,%eax
 8b9:	e9 d3 fe ff ff       	jmp    791 <printf+0x81>
 8be:	66 90                	xchg   %ax,%ax

000008c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	57                   	push   %edi
 8c9:	56                   	push   %esi
 8ca:	53                   	push   %ebx
 8cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ce:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d3:	39 c8                	cmp    %ecx,%eax
 8d5:	73 19                	jae    8f0 <free+0x30>
 8d7:	89 f6                	mov    %esi,%esi
 8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8e0:	39 d1                	cmp    %edx,%ecx
 8e2:	72 1c                	jb     900 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e4:	39 d0                	cmp    %edx,%eax
 8e6:	73 18                	jae    900 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 8e8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ea:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ec:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ee:	72 f0                	jb     8e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f0:	39 d0                	cmp    %edx,%eax
 8f2:	72 f4                	jb     8e8 <free+0x28>
 8f4:	39 d1                	cmp    %edx,%ecx
 8f6:	73 f0                	jae    8e8 <free+0x28>
 8f8:	90                   	nop
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 900:	8b 73 fc             	mov    -0x4(%ebx),%esi
 903:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 906:	39 d7                	cmp    %edx,%edi
 908:	74 19                	je     923 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 90a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 90d:	8b 50 04             	mov    0x4(%eax),%edx
 910:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 913:	39 f1                	cmp    %esi,%ecx
 915:	74 23                	je     93a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 917:	89 08                	mov    %ecx,(%eax)
  freep = p;
 919:	a3 00 20 00 00       	mov    %eax,0x2000
}
 91e:	5b                   	pop    %ebx
 91f:	5e                   	pop    %esi
 920:	5f                   	pop    %edi
 921:	5d                   	pop    %ebp
 922:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 923:	03 72 04             	add    0x4(%edx),%esi
 926:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 929:	8b 10                	mov    (%eax),%edx
 92b:	8b 12                	mov    (%edx),%edx
 92d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 930:	8b 50 04             	mov    0x4(%eax),%edx
 933:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 936:	39 f1                	cmp    %esi,%ecx
 938:	75 dd                	jne    917 <free+0x57>
    p->s.size += bp->s.size;
 93a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 93d:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 942:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 945:	8b 53 f8             	mov    -0x8(%ebx),%edx
 948:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 94a:	5b                   	pop    %ebx
 94b:	5e                   	pop    %esi
 94c:	5f                   	pop    %edi
 94d:	5d                   	pop    %ebp
 94e:	c3                   	ret    
 94f:	90                   	nop

00000950 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 959:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 95c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 962:	8d 78 07             	lea    0x7(%eax),%edi
 965:	c1 ef 03             	shr    $0x3,%edi
 968:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 96b:	85 d2                	test   %edx,%edx
 96d:	0f 84 a3 00 00 00    	je     a16 <malloc+0xc6>
 973:	8b 02                	mov    (%edx),%eax
 975:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 978:	39 cf                	cmp    %ecx,%edi
 97a:	76 74                	jbe    9f0 <malloc+0xa0>
 97c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 982:	be 00 10 00 00       	mov    $0x1000,%esi
 987:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 98e:	0f 43 f7             	cmovae %edi,%esi
 991:	ba 00 80 00 00       	mov    $0x8000,%edx
 996:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 99c:	0f 46 da             	cmovbe %edx,%ebx
 99f:	eb 10                	jmp    9b1 <malloc+0x61>
 9a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9aa:	8b 48 04             	mov    0x4(%eax),%ecx
 9ad:	39 cf                	cmp    %ecx,%edi
 9af:	76 3f                	jbe    9f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9b1:	39 05 00 20 00 00    	cmp    %eax,0x2000
 9b7:	89 c2                	mov    %eax,%edx
 9b9:	75 ed                	jne    9a8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 9bb:	83 ec 0c             	sub    $0xc,%esp
 9be:	53                   	push   %ebx
 9bf:	e8 1c fc ff ff       	call   5e0 <sbrk>
  if(p == (char*)-1)
 9c4:	83 c4 10             	add    $0x10,%esp
 9c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ca:	74 1c                	je     9e8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9cc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 9cf:	83 ec 0c             	sub    $0xc,%esp
 9d2:	83 c0 08             	add    $0x8,%eax
 9d5:	50                   	push   %eax
 9d6:	e8 e5 fe ff ff       	call   8c0 <free>
  return freep;
 9db:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 9e1:	83 c4 10             	add    $0x10,%esp
 9e4:	85 d2                	test   %edx,%edx
 9e6:	75 c0                	jne    9a8 <malloc+0x58>
        return 0;
 9e8:	31 c0                	xor    %eax,%eax
 9ea:	eb 1c                	jmp    a08 <malloc+0xb8>
 9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9f0:	39 cf                	cmp    %ecx,%edi
 9f2:	74 1c                	je     a10 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9f4:	29 f9                	sub    %edi,%ecx
 9f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9fc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 9ff:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 a05:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a0b:	5b                   	pop    %ebx
 a0c:	5e                   	pop    %esi
 a0d:	5f                   	pop    %edi
 a0e:	5d                   	pop    %ebp
 a0f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a10:	8b 08                	mov    (%eax),%ecx
 a12:	89 0a                	mov    %ecx,(%edx)
 a14:	eb e9                	jmp    9ff <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a16:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 a1d:	20 00 00 
 a20:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 a27:	20 00 00 
    base.s.size = 0;
 a2a:	b8 04 20 00 00       	mov    $0x2004,%eax
 a2f:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 a36:	00 00 00 
 a39:	e9 3e ff ff ff       	jmp    97c <malloc+0x2c>
 a3e:	66 90                	xchg   %ax,%ax

00000a40 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 a46:	6a 10                	push   $0x10
 a48:	6a 02                	push   $0x2
 a4a:	ff 75 08             	pushl  0x8(%ebp)
 a4d:	e8 d6 fb ff ff       	call   628 <ioctl>
}
 a52:	c9                   	leave  
 a53:	c3                   	ret    
 a54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a60 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 a66:	68 00 10 00 00       	push   $0x1000
 a6b:	6a 02                	push   $0x2
 a6d:	ff 75 08             	pushl  0x8(%ebp)
 a70:	e8 b3 fb ff ff       	call   628 <ioctl>
}
 a75:	c9                   	leave  
 a76:	c3                   	ret    
 a77:	89 f6                	mov    %esi,%esi
 a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a80 <attach_tty>:

int
attach_tty(int tty_fd)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	53                   	push   %ebx
 a84:	83 ec 08             	sub    $0x8,%esp
 a87:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 a8a:	6a 10                	push   $0x10
 a8c:	6a 01                	push   $0x1
 a8e:	53                   	push   %ebx
 a8f:	e8 94 fb ff ff       	call   628 <ioctl>
 a94:	83 c4 10             	add    $0x10,%esp
 a97:	85 c0                	test   %eax,%eax
 a99:	78 55                	js     af0 <attach_tty+0x70>
     return -1;

    close(0);
 a9b:	83 ec 0c             	sub    $0xc,%esp
 a9e:	6a 00                	push   $0x0
 aa0:	e8 db fa ff ff       	call   580 <close>
    close(1);
 aa5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aac:	e8 cf fa ff ff       	call   580 <close>
    close(2);
 ab1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 ab8:	e8 c3 fa ff ff       	call   580 <close>
    if(dup(tty_fd) < 0)
 abd:	89 1c 24             	mov    %ebx,(%esp)
 ac0:	e8 0b fb ff ff       	call   5d0 <dup>
 ac5:	83 c4 10             	add    $0x10,%esp
 ac8:	85 c0                	test   %eax,%eax
 aca:	78 24                	js     af0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 acc:	83 ec 0c             	sub    $0xc,%esp
 acf:	53                   	push   %ebx
 ad0:	e8 fb fa ff ff       	call   5d0 <dup>
 ad5:	83 c4 10             	add    $0x10,%esp
 ad8:	85 c0                	test   %eax,%eax
 ada:	78 14                	js     af0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 adc:	83 ec 0c             	sub    $0xc,%esp
 adf:	53                   	push   %ebx
 ae0:	e8 eb fa ff ff       	call   5d0 <dup>
 ae5:	83 c4 10             	add    $0x10,%esp
 ae8:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 aeb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aee:	c9                   	leave  
 aef:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 af0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 af5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 af8:	c9                   	leave  
 af9:	c3                   	ret    
 afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b00 <detach_tty>:

int
detach_tty(int tty_fd)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 b06:	6a 20                	push   $0x20
 b08:	6a 01                	push   $0x1
 b0a:	ff 75 08             	pushl  0x8(%ebp)
 b0d:	e8 16 fb ff ff       	call   628 <ioctl>
    return 0;
}
 b12:	31 c0                	xor    %eax,%eax
 b14:	c9                   	leave  
 b15:	c3                   	ret    
 b16:	8d 76 00             	lea    0x0(%esi),%esi
 b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b20 <connect_tty>:


int
connect_tty(int tty_fd)
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
 b23:	53                   	push   %ebx
 b24:	83 ec 08             	sub    $0x8,%esp
 b27:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 b2a:	6a 10                	push   $0x10
 b2c:	6a 02                	push   $0x2
 b2e:	53                   	push   %ebx
 b2f:	e8 f4 fa ff ff       	call   628 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 b34:	83 c4 10             	add    $0x10,%esp
 b37:	85 c0                	test   %eax,%eax
 b39:	74 1d                	je     b58 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 b3b:	83 ec 04             	sub    $0x4,%esp
 b3e:	68 00 10 00 00       	push   $0x1000
 b43:	6a 01                	push   $0x1
 b45:	53                   	push   %ebx
 b46:	e8 dd fa ff ff       	call   628 <ioctl>
     return tty_fd;
 b4b:	83 c4 10             	add    $0x10,%esp
 b4e:	89 d8                	mov    %ebx,%eax
}
 b50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b53:	c9                   	leave  
 b54:	c3                   	ret    
 b55:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 b58:	83 ec 0c             	sub    $0xc,%esp
 b5b:	53                   	push   %ebx
 b5c:	e8 1f fa ff ff       	call   580 <close>
       return -1;
 b61:	83 c4 10             	add    $0x10,%esp
 b64:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b69:	eb e5                	jmp    b50 <connect_tty+0x30>
 b6b:	90                   	nop
 b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b70 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
 b73:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 b76:	68 00 20 00 00       	push   $0x2000
 b7b:	6a 01                	push   $0x1
 b7d:	ff 75 08             	pushl  0x8(%ebp)
 b80:	e8 a3 fa ff ff       	call   628 <ioctl>
}
 b85:	c9                   	leave  
 b86:	c3                   	ret    
