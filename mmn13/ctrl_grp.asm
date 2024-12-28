
_ctrl_grp:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
 * e.g. ctrl_grp +cpu cgroup.subtree_control
 */

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
  11:	83 ec 10             	sub    $0x10,%esp
  14:	8b 41 04             	mov    0x4(%ecx),%eax
    char *str = argv[1];
    char *file = argv[2];
  17:	8b 78 08             	mov    0x8(%eax),%edi
 */

int
main(int argc, char *argv[])
{
    char *str = argv[1];
  1a:	8b 70 04             	mov    0x4(%eax),%esi
    char *file = argv[2];

    int cgroup_fd = open(file, O_RDWR);
  1d:	6a 02                	push   $0x2
  1f:	57                   	push   %edi
  20:	e8 63 05 00 00       	call   588 <open>


    if(cgroup_fd < 0){
  25:	83 c4 10             	add    $0x10,%esp
  28:	85 c0                	test   %eax,%eax
  2a:	78 2f                	js     5b <main+0x5b>
        printf(stderr, "Failed to open %s\n", file);
        exit(1);
    }

    if(write(cgroup_fd, str, sizeof(str)) < 0){
  2c:	83 ec 04             	sub    $0x4,%esp
  2f:	89 c3                	mov    %eax,%ebx
  31:	6a 04                	push   $0x4
  33:	56                   	push   %esi
  34:	50                   	push   %eax
  35:	e8 2e 05 00 00       	call   568 <write>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 4e                	js     8f <main+0x8f>
        printf(stderr, "Failed to write %s to %s\n", str, file);
        exit(1);
    }
    if(close(cgroup_fd) < 0){
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	53                   	push   %ebx
  45:	e8 26 05 00 00       	call   570 <close>
  4a:	83 c4 10             	add    $0x10,%esp
  4d:	85 c0                	test   %eax,%eax
  4f:	78 24                	js     75 <main+0x75>
        printf(stderr, "Failed to close\n");
        exit(1);
    }

  exit(0);
  51:	83 ec 0c             	sub    $0xc,%esp
  54:	6a 00                	push   $0x0
  56:	e8 ed 04 00 00       	call   548 <exit>

    int cgroup_fd = open(file, O_RDWR);


    if(cgroup_fd < 0){
        printf(stderr, "Failed to open %s\n", file);
  5b:	52                   	push   %edx
  5c:	57                   	push   %edi
  5d:	68 78 0b 00 00       	push   $0xb78
  62:	6a 02                	push   $0x2
  64:	e8 97 06 00 00       	call   700 <printf>
        exit(1);
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 d3 04 00 00       	call   548 <exit>
    if(write(cgroup_fd, str, sizeof(str)) < 0){
        printf(stderr, "Failed to write %s to %s\n", str, file);
        exit(1);
    }
    if(close(cgroup_fd) < 0){
        printf(stderr, "Failed to close\n");
  75:	50                   	push   %eax
  76:	50                   	push   %eax
  77:	68 a5 0b 00 00       	push   $0xba5
  7c:	6a 02                	push   $0x2
  7e:	e8 7d 06 00 00       	call   700 <printf>
        exit(1);
  83:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8a:	e8 b9 04 00 00       	call   548 <exit>
        printf(stderr, "Failed to open %s\n", file);
        exit(1);
    }

    if(write(cgroup_fd, str, sizeof(str)) < 0){
        printf(stderr, "Failed to write %s to %s\n", str, file);
  8f:	57                   	push   %edi
  90:	56                   	push   %esi
  91:	68 8b 0b 00 00       	push   $0xb8b
  96:	6a 02                	push   $0x2
  98:	e8 63 06 00 00       	call   700 <printf>
        exit(1);
  9d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a4:	e8 9f 04 00 00       	call   548 <exit>
  a9:	66 90                	xchg   %ax,%ax
  ab:	66 90                	xchg   %ax,%ax
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 45 08             	mov    0x8(%ebp),%eax
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ba:	89 c2                	mov    %eax,%edx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c0:	83 c1 01             	add    $0x1,%ecx
  c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  c7:	83 c2 01             	add    $0x1,%edx
  ca:	84 db                	test   %bl,%bl
  cc:	88 5a ff             	mov    %bl,-0x1(%edx)
  cf:	75 ef                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  d1:	5b                   	pop    %ebx
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    
  d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	56                   	push   %esi
  e4:	53                   	push   %ebx
  e5:	8b 55 08             	mov    0x8(%ebp),%edx
  e8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  eb:	0f b6 02             	movzbl (%edx),%eax
  ee:	0f b6 19             	movzbl (%ecx),%ebx
  f1:	84 c0                	test   %al,%al
  f3:	75 1e                	jne    113 <strcmp+0x33>
  f5:	eb 29                	jmp    120 <strcmp+0x40>
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 100:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 103:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 106:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 109:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 10d:	84 c0                	test   %al,%al
 10f:	74 0f                	je     120 <strcmp+0x40>
 111:	89 f1                	mov    %esi,%ecx
 113:	38 d8                	cmp    %bl,%al
 115:	74 e9                	je     100 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 117:	29 d8                	sub    %ebx,%eax
}
 119:	5b                   	pop    %ebx
 11a:	5e                   	pop    %esi
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 120:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 122:	29 d8                	sub    %ebx,%eax
}
 124:	5b                   	pop    %ebx
 125:	5e                   	pop    %esi
 126:	5d                   	pop    %ebp
 127:	c3                   	ret    
 128:	90                   	nop
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000130 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
 135:	8b 55 08             	mov    0x8(%ebp),%edx
 138:	53                   	push   %ebx
 139:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 13c:	0f b6 32             	movzbl (%edx),%esi
 13f:	89 f0                	mov    %esi,%eax
 141:	84 c0                	test   %al,%al
 143:	74 67                	je     1ac <strncmp+0x7c>
 145:	0f b6 19             	movzbl (%ecx),%ebx
 148:	89 f0                	mov    %esi,%eax
 14a:	38 d8                	cmp    %bl,%al
 14c:	75 65                	jne    1b3 <strncmp+0x83>
 14e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 151:	89 f0                	mov    %esi,%eax
 153:	0f b6 f0             	movzbl %al,%esi
 156:	89 f0                	mov    %esi,%eax
 158:	83 eb 01             	sub    $0x1,%ebx
 15b:	75 14                	jne    171 <strncmp+0x41>
 15d:	eb 25                	jmp    184 <strncmp+0x54>
 15f:	90                   	nop
 160:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 164:	89 f1                	mov    %esi,%ecx
 166:	38 c8                	cmp    %cl,%al
 168:	75 26                	jne    190 <strncmp+0x60>
 16a:	83 eb 01             	sub    $0x1,%ebx
 16d:	89 f9                	mov    %edi,%ecx
 16f:	74 2f                	je     1a0 <strncmp+0x70>
    p++, q++;
 171:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 174:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 177:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 17a:	84 c0                	test   %al,%al
 17c:	75 e2                	jne    160 <strncmp+0x30>
 17e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 182:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 184:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 185:	29 f0                	sub    %esi,%eax
}
 187:	5e                   	pop    %esi
 188:	5f                   	pop    %edi
 189:	5d                   	pop    %ebp
 18a:	c3                   	ret    
 18b:	90                   	nop
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	0f b6 f1             	movzbl %cl,%esi
 193:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 194:	29 f0                	sub    %esi,%eax
}
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	0f b6 f0             	movzbl %al,%esi
 1a3:	89 f0                	mov    %esi,%eax
 1a5:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1a6:	29 f0                	sub    %esi,%eax
}
 1a8:	5e                   	pop    %esi
 1a9:	5f                   	pop    %edi
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 1ac:	31 c0                	xor    %eax,%eax
 1ae:	0f b6 31             	movzbl (%ecx),%esi
 1b1:	eb d1                	jmp    184 <strncmp+0x54>
 1b3:	0f b6 c0             	movzbl %al,%eax
 1b6:	0f b6 f3             	movzbl %bl,%esi
 1b9:	eb c9                	jmp    184 <strncmp+0x54>
 1bb:	90                   	nop
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 39 00             	cmpb   $0x0,(%ecx)
 1c9:	74 12                	je     1dd <strlen+0x1d>
 1cb:	31 d2                	xor    %edx,%edx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c2 01             	add    $0x1,%edx
 1d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1dd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	eb 0d                	jmp    1f0 <memset>
 1e3:	90                   	nop
 1e4:	90                   	nop
 1e5:	90                   	nop
 1e6:	90                   	nop
 1e7:	90                   	nop
 1e8:	90                   	nop
 1e9:	90                   	nop
 1ea:	90                   	nop
 1eb:	90                   	nop
 1ec:	90                   	nop
 1ed:	90                   	nop
 1ee:	90                   	nop
 1ef:	90                   	nop

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	89 d0                	mov    %edx,%eax
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	84 d2                	test   %dl,%dl
 21f:	74 1d                	je     23e <strchr+0x2e>
    if(*s == c)
 221:	38 d3                	cmp    %dl,%bl
 223:	89 d9                	mov    %ebx,%ecx
 225:	75 0d                	jne    234 <strchr+0x24>
 227:	eb 17                	jmp    240 <strchr+0x30>
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 230:	38 ca                	cmp    %cl,%dl
 232:	74 0c                	je     240 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 234:	83 c0 01             	add    $0x1,%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	84 d2                	test   %dl,%dl
 23c:	75 f2                	jne    230 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 23e:	31 c0                	xor    %eax,%eax
}
 240:	5b                   	pop    %ebx
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
 255:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 256:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 259:	31 db                	xor    %ebx,%ebx
 25b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 260:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 263:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 266:	7d 30                	jge    298 <gets+0x48>
    cc = read(0, &c, 1);
 268:	83 ec 04             	sub    $0x4,%esp
 26b:	6a 01                	push   $0x1
 26d:	56                   	push   %esi
 26e:	6a 00                	push   $0x0
 270:	e8 eb 02 00 00       	call   560 <read>
    if(cc < 1)
 275:	83 c4 10             	add    $0x10,%esp
 278:	85 c0                	test   %eax,%eax
 27a:	7e e7                	jle    263 <gets+0x13>
      continue;
    buf[i++] = c;
 27c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 280:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 283:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 285:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 288:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 28a:	74 0c                	je     298 <gets+0x48>
 28c:	3c 0d                	cmp    $0xd,%al
 28e:	74 08                	je     298 <gets+0x48>
 290:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 293:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 296:	7c d0                	jl     268 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 29f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a2:	5b                   	pop    %ebx
 2a3:	5e                   	pop    %esi
 2a4:	5f                   	pop    %edi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	6a 00                	push   $0x0
 2ba:	ff 75 08             	pushl  0x8(%ebp)
 2bd:	e8 c6 02 00 00       	call   588 <open>
  if(fd < 0)
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	78 27                	js     2f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	pushl  0xc(%ebp)
 2cf:	89 c3                	mov    %eax,%ebx
 2d1:	50                   	push   %eax
 2d2:	e8 c9 02 00 00       	call   5a0 <fstat>
 2d7:	89 c6                	mov    %eax,%esi
  close(fd);
 2d9:	89 1c 24             	mov    %ebx,(%esp)
 2dc:	e8 8f 02 00 00       	call   570 <close>
  return r;
 2e1:	83 c4 10             	add    $0x10,%esp
 2e4:	89 f0                	mov    %esi,%eax
}
 2e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2f5:	eb ef                	jmp    2e6 <stat+0x36>
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 11             	movsbl (%ecx),%edx
 30a:	8d 42 d0             	lea    -0x30(%edx),%eax
 30d:	3c 09                	cmp    $0x9,%al
 30f:	b8 00 00 00 00       	mov    $0x0,%eax
 314:	77 1f                	ja     335 <atoi+0x35>
 316:	8d 76 00             	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 320:	8d 04 80             	lea    (%eax,%eax,4),%eax
 323:	83 c1 01             	add    $0x1,%ecx
 326:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 32a:	0f be 11             	movsbl (%ecx),%edx
 32d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 335:	5b                   	pop    %ebx
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
 345:	8b 5d 10             	mov    0x10(%ebp),%ebx
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34e:	85 db                	test   %ebx,%ebx
 350:	7e 14                	jle    366 <memmove+0x26>
 352:	31 d2                	xor    %edx,%edx
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 358:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 35c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 35f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 362:	39 da                	cmp    %ebx,%edx
 364:	75 f2                	jne    358 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 04             	sub    $0x4,%esp
 379:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 37c:	83 f9 00             	cmp    $0x0,%ecx
 37f:	7e 76                	jle    3f7 <itoa+0x87>
 381:	89 cb                	mov    %ecx,%ebx
 383:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 385:	bf 67 66 66 66       	mov    $0x66666667,%edi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 390:	89 d8                	mov    %ebx,%eax
 392:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 395:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 398:	f7 ef                	imul   %edi
 39a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 39d:	29 da                	sub    %ebx,%edx
 39f:	89 d3                	mov    %edx,%ebx
 3a1:	75 ed                	jne    390 <itoa+0x20>
        length++;
 3a3:	89 f3                	mov    %esi,%ebx
 3a5:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 3a8:	bf 67 66 66 66       	mov    $0x66666667,%edi
 3ad:	8b 75 08             	mov    0x8(%ebp),%esi
 3b0:	eb 0a                	jmp    3bc <itoa+0x4c>
 3b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3b8:	85 db                	test   %ebx,%ebx
 3ba:	7e 25                	jle    3e1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 3bc:	89 c8                	mov    %ecx,%eax
 3be:	f7 ef                	imul   %edi
 3c0:	89 c8                	mov    %ecx,%eax
 3c2:	c1 f8 1f             	sar    $0x1f,%eax
 3c5:	c1 fa 02             	sar    $0x2,%edx
 3c8:	29 c2                	sub    %eax,%edx
 3ca:	8d 04 92             	lea    (%edx,%edx,4),%eax
 3cd:	01 c0                	add    %eax,%eax
 3cf:	29 c1                	sub    %eax,%ecx
 3d1:	83 c1 30             	add    $0x30,%ecx
 3d4:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3d8:	83 eb 01             	sub    $0x1,%ebx
 3db:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 3dd:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 3df:	7f d7                	jg     3b8 <itoa+0x48>
 3e1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 3e4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 3e6:	8b 7d 08             	mov    0x8(%ebp),%edi
 3e9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 3ed:	83 c4 04             	add    $0x4,%esp
 3f0:	89 f0                	mov    %esi,%eax
 3f2:	5b                   	pop    %ebx
 3f3:	5e                   	pop    %esi
 3f4:	5f                   	pop    %edi
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 3f7:	75 12                	jne    40b <itoa+0x9b>
        buf[0] = '0';
 3f9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 3fc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 401:	c6 00 30             	movb   $0x30,(%eax)
 404:	b8 01 00 00 00       	mov    $0x1,%eax
 409:	eb db                	jmp    3e6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 40b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 40d:	31 f6                	xor    %esi,%esi
 40f:	eb d5                	jmp    3e6 <itoa+0x76>
 411:	eb 0d                	jmp    420 <strcat>
 413:	90                   	nop
 414:	90                   	nop
 415:	90                   	nop
 416:	90                   	nop
 417:	90                   	nop
 418:	90                   	nop
 419:	90                   	nop
 41a:	90                   	nop
 41b:	90                   	nop
 41c:	90                   	nop
 41d:	90                   	nop
 41e:	90                   	nop
 41f:	90                   	nop

00000420 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	53                   	push   %ebx
 429:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 42c:	80 38 00             	cmpb   $0x0,(%eax)
 42f:	74 38                	je     469 <strcat+0x49>
 431:	31 c9                	xor    %ecx,%ecx
 433:	90                   	nop
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 438:	83 c1 01             	add    $0x1,%ecx
 43b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 43f:	89 ca                	mov    %ecx,%edx
 441:	75 f5                	jne    438 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 443:	0f b6 1e             	movzbl (%esi),%ebx
 446:	84 db                	test   %bl,%bl
 448:	74 16                	je     460 <strcat+0x40>
 44a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 44d:	31 d2                	xor    %edx,%edx
 44f:	90                   	nop
                dest[i + j] = source[j];
 450:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 453:	83 c2 01             	add    $0x1,%edx
 456:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 45a:	84 db                	test   %bl,%bl
 45c:	75 f2                	jne    450 <strcat+0x30>
 45e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 460:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 464:	5b                   	pop    %ebx
 465:	5e                   	pop    %esi
 466:	5f                   	pop    %edi
 467:	5d                   	pop    %ebp
 468:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 469:	31 d2                	xor    %edx,%edx
 46b:	31 c9                	xor    %ecx,%ecx
 46d:	eb d4                	jmp    443 <strcat+0x23>
 46f:	90                   	nop

00000470 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 479:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 47c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 47f:	0f b6 00             	movzbl (%eax),%eax
 482:	84 c0                	test   %al,%al
 484:	88 45 f3             	mov    %al,-0xd(%ebp)
 487:	0f 84 a0 00 00 00    	je     52d <strstr+0xbd>
 48d:	8b 55 0c             	mov    0xc(%ebp),%edx
 490:	31 c0                	xor    %eax,%eax
 492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 498:	83 c0 01             	add    $0x1,%eax
 49b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 49f:	75 f7                	jne    498 <strstr+0x28>
 4a1:	89 45 e8             	mov    %eax,-0x18(%ebp)
 4a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4a7:	0f b6 07             	movzbl (%edi),%eax
 4aa:	84 c0                	test   %al,%al
 4ac:	74 68                	je     516 <strstr+0xa6>
 4ae:	31 d2                	xor    %edx,%edx
 4b0:	83 c2 01             	add    $0x1,%edx
 4b3:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 4b7:	75 f7                	jne    4b0 <strstr+0x40>
 4b9:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4bc:	84 c0                	test   %al,%al
 4be:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 4c1:	74 4d                	je     510 <strstr+0xa0>
 4c3:	90                   	nop
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c8:	38 45 f3             	cmp    %al,-0xd(%ebp)
 4cb:	75 34                	jne    501 <strstr+0x91>
 4cd:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 4d0:	83 eb 01             	sub    $0x1,%ebx
 4d3:	74 4b                	je     520 <strstr+0xb0>
 4d5:	8b 55 0c             	mov    0xc(%ebp),%edx
 4d8:	89 f8                	mov    %edi,%eax
 4da:	eb 10                	jmp    4ec <strstr+0x7c>
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4e0:	3a 4a 01             	cmp    0x1(%edx),%cl
 4e3:	75 1c                	jne    501 <strstr+0x91>
 4e5:	83 eb 01             	sub    $0x1,%ebx
 4e8:	89 f2                	mov    %esi,%edx
 4ea:	74 34                	je     520 <strstr+0xb0>
    p++, q++;
 4ec:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4ef:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 4f2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 4f5:	84 c9                	test   %cl,%cl
 4f7:	75 e7                	jne    4e0 <strstr+0x70>
 4f9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 4fd:	84 c0                	test   %al,%al
 4ff:	74 1f                	je     520 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 501:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 504:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 507:	74 0d                	je     516 <strstr+0xa6>
 509:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 50c:	84 c0                	test   %al,%al
 50e:	75 b8                	jne    4c8 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 510:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 514:	eb e7                	jmp    4fd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 516:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 519:	31 c0                	xor    %eax,%eax
}
 51b:	5b                   	pop    %ebx
 51c:	5e                   	pop    %esi
 51d:	5f                   	pop    %edi
 51e:	5d                   	pop    %ebp
 51f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 520:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 523:	83 c4 10             	add    $0x10,%esp
 526:	5b                   	pop    %ebx
 527:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 528:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 52a:	5f                   	pop    %edi
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 52d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 534:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 53b:	e9 67 ff ff ff       	jmp    4a7 <strstr+0x37>

00000540 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 540:	b8 01 00 00 00       	mov    $0x1,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <exit>:
SYSCALL(exit)
 548:	b8 02 00 00 00       	mov    $0x2,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <wait>:
SYSCALL(wait)
 550:	b8 03 00 00 00       	mov    $0x3,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <pipe>:
SYSCALL(pipe)
 558:	b8 04 00 00 00       	mov    $0x4,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <read>:
SYSCALL(read)
 560:	b8 05 00 00 00       	mov    $0x5,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <write>:
SYSCALL(write)
 568:	b8 10 00 00 00       	mov    $0x10,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <close>:
SYSCALL(close)
 570:	b8 15 00 00 00       	mov    $0x15,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <kill>:
SYSCALL(kill)
 578:	b8 06 00 00 00       	mov    $0x6,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <exec>:
SYSCALL(exec)
 580:	b8 07 00 00 00       	mov    $0x7,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <open>:
SYSCALL(open)
 588:	b8 0f 00 00 00       	mov    $0xf,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <mknod>:
SYSCALL(mknod)
 590:	b8 11 00 00 00       	mov    $0x11,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <unlink>:
SYSCALL(unlink)
 598:	b8 12 00 00 00       	mov    $0x12,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <fstat>:
SYSCALL(fstat)
 5a0:	b8 08 00 00 00       	mov    $0x8,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <link>:
SYSCALL(link)
 5a8:	b8 13 00 00 00       	mov    $0x13,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <mkdir>:
SYSCALL(mkdir)
 5b0:	b8 14 00 00 00       	mov    $0x14,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <chdir>:
SYSCALL(chdir)
 5b8:	b8 09 00 00 00       	mov    $0x9,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <dup>:
SYSCALL(dup)
 5c0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <getpid>:
SYSCALL(getpid)
 5c8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <sbrk>:
SYSCALL(sbrk)
 5d0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <sleep>:
SYSCALL(sleep)
 5d8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <uptime>:
SYSCALL(uptime)
 5e0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <mount>:
SYSCALL(mount)
 5e8:	b8 16 00 00 00       	mov    $0x16,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <umount>:
SYSCALL(umount)
 5f0:	b8 17 00 00 00       	mov    $0x17,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <printmounts>:
SYSCALL(printmounts)
 5f8:	b8 18 00 00 00       	mov    $0x18,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <printdevices>:
SYSCALL(printdevices)
 600:	b8 19 00 00 00       	mov    $0x19,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <unshare>:
SYSCALL(unshare)
 608:	b8 1a 00 00 00       	mov    $0x1a,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <usleep>:
SYSCALL(usleep)
 610:	b8 1b 00 00 00       	mov    $0x1b,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <ioctl>:
SYSCALL(ioctl)
 618:	b8 1c 00 00 00       	mov    $0x1c,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <getppid>:
SYSCALL(getppid)
 620:	b8 1d 00 00 00       	mov    $0x1d,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <getcpu>:
SYSCALL(getcpu)
 628:	b8 1e 00 00 00       	mov    $0x1e,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <getmem>:
SYSCALL(getmem)
 630:	b8 1f 00 00 00       	mov    $0x1f,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <kmemtest>:
SYSCALL(kmemtest)
 638:	b8 20 00 00 00       	mov    $0x20,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 649:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 64c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 64f:	85 db                	test   %ebx,%ebx
 651:	0f 84 91 00 00 00    	je     6e8 <printint+0xa8>
 657:	89 d0                	mov    %edx,%eax
 659:	c1 e8 1f             	shr    $0x1f,%eax
 65c:	84 c0                	test   %al,%al
 65e:	0f 84 84 00 00 00    	je     6e8 <printint+0xa8>
    neg = 1;
    x = -xx;
 664:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 666:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 66d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 66f:	31 ff                	xor    %edi,%edi
 671:	8d 75 c7             	lea    -0x39(%ebp),%esi
 674:	eb 0c                	jmp    682 <printint+0x42>
 676:	8d 76 00             	lea    0x0(%esi),%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 680:	89 df                	mov    %ebx,%edi
 682:	31 d2                	xor    %edx,%edx
 684:	8d 5f 01             	lea    0x1(%edi),%ebx
 687:	f7 f1                	div    %ecx
 689:	0f b6 92 c0 0b 00 00 	movzbl 0xbc0(%edx),%edx
  }while((x /= base) != 0);
 690:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 692:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 695:	75 e9                	jne    680 <printint+0x40>
  if(neg)
 697:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 69a:	85 c0                	test   %eax,%eax
 69c:	74 08                	je     6a6 <printint+0x66>
    buf[i++] = '-';
 69e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 6a3:	8d 5f 02             	lea    0x2(%edi),%ebx
 6a6:	8d 7d d8             	lea    -0x28(%ebp),%edi
 6a9:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 6ad:	89 fa                	mov    %edi,%edx
 6af:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 6b0:	0f b6 08             	movzbl (%eax),%ecx
 6b3:	83 e8 01             	sub    $0x1,%eax
 6b6:	83 c2 01             	add    $0x1,%edx
 6b9:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 6bc:	39 f0                	cmp    %esi,%eax
 6be:	75 f0                	jne    6b0 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 6c0:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 6c3:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 6c8:	57                   	push   %edi
 6c9:	e8 f2 fa ff ff       	call   1c0 <strlen>
 6ce:	83 c4 0c             	add    $0xc,%esp
 6d1:	50                   	push   %eax
 6d2:	57                   	push   %edi
 6d3:	ff 75 c0             	pushl  -0x40(%ebp)
 6d6:	e8 8d fe ff ff       	call   568 <write>
}
 6db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6de:	5b                   	pop    %ebx
 6df:	5e                   	pop    %esi
 6e0:	5f                   	pop    %edi
 6e1:	5d                   	pop    %ebp
 6e2:	c3                   	ret    
 6e3:	90                   	nop
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6e8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6ea:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6f1:	e9 79 ff ff ff       	jmp    66f <printint+0x2f>
 6f6:	8d 76 00             	lea    0x0(%esi),%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000700 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	8b 75 0c             	mov    0xc(%ebp),%esi
 70c:	0f b6 06             	movzbl (%esi),%eax
 70f:	84 c0                	test   %al,%al
 711:	0f 84 90 01 00 00    	je     8a7 <printf+0x1a7>
 717:	8d 5d 10             	lea    0x10(%ebp),%ebx
 71a:	31 ff                	xor    %edi,%edi
 71c:	31 d2                	xor    %edx,%edx
 71e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 721:	31 db                	xor    %ebx,%ebx
 723:	eb 39                	jmp    75e <printf+0x5e>
 725:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 728:	83 f9 25             	cmp    $0x25,%ecx
 72b:	0f 84 af 00 00 00    	je     7e0 <printf+0xe0>
 731:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 734:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 737:	83 ec 04             	sub    $0x4,%esp
 73a:	6a 01                	push   $0x1
 73c:	50                   	push   %eax
 73d:	ff 75 08             	pushl  0x8(%ebp)
 740:	e8 23 fe ff ff       	call   568 <write>
 745:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 748:	85 c0                	test   %eax,%eax
 74a:	78 35                	js     781 <printf+0x81>
 74c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 74f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 752:	01 c7                	add    %eax,%edi
 754:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 756:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 75a:	84 c0                	test   %al,%al
 75c:	74 21                	je     77f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 75e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 761:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 763:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 766:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 769:	74 bd                	je     728 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 76b:	83 fa 25             	cmp    $0x25,%edx
 76e:	74 20                	je     790 <printf+0x90>
 770:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 772:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 775:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 777:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 77b:	84 c0                	test   %al,%al
 77d:	75 df                	jne    75e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 77f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 781:	8d 65 f4             	lea    -0xc(%ebp),%esp
 784:	5b                   	pop    %ebx
 785:	5e                   	pop    %esi
 786:	5f                   	pop    %edi
 787:	5d                   	pop    %ebp
 788:	c3                   	ret    
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 790:	83 f9 64             	cmp    $0x64,%ecx
 793:	0f 84 7f 00 00 00    	je     818 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 799:	0f be d0             	movsbl %al,%edx
 79c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 7a2:	83 fa 70             	cmp    $0x70,%edx
 7a5:	74 49                	je     7f0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7a7:	83 f9 73             	cmp    $0x73,%ecx
 7aa:	0f 84 98 00 00 00    	je     848 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 7b0:	83 f9 63             	cmp    $0x63,%ecx
 7b3:	0f 84 c7 00 00 00    	je     880 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7b9:	83 f9 25             	cmp    $0x25,%ecx
 7bc:	74 6a                	je     828 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 7be:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 7c1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7c4:	83 ec 04             	sub    $0x4,%esp
 7c7:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 7c9:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 7cd:	50                   	push   %eax
 7ce:	ff 75 08             	pushl  0x8(%ebp)
 7d1:	e8 92 fd ff ff       	call   568 <write>
 7d6:	83 c4 10             	add    $0x10,%esp
 7d9:	e9 6a ff ff ff       	jmp    748 <printf+0x48>
 7de:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7e0:	ba 25 00 00 00       	mov    $0x25,%edx
 7e5:	31 c0                	xor    %eax,%eax
 7e7:	eb 89                	jmp    772 <printf+0x72>
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f8:	6a 00                	push   $0x0
 7fa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	8b 16                	mov    (%esi),%edx
        ap++;
 802:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 805:	e8 36 fe ff ff       	call   640 <printint>
        ap++;
 80a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 80d:	83 c4 10             	add    $0x10,%esp
 810:	e9 33 ff ff ff       	jmp    748 <printf+0x48>
 815:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 818:	83 ec 0c             	sub    $0xc,%esp
 81b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 820:	6a 01                	push   $0x1
 822:	eb d6                	jmp    7fa <printf+0xfa>
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 828:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 82b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 82e:	83 ec 04             	sub    $0x4,%esp
 831:	6a 01                	push   $0x1
 833:	50                   	push   %eax
 834:	ff 75 08             	pushl  0x8(%ebp)
 837:	e8 2c fd ff ff       	call   568 <write>
 83c:	83 c4 10             	add    $0x10,%esp
 83f:	e9 04 ff ff ff       	jmp    748 <printf+0x48>
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 848:	8b 45 d0             	mov    -0x30(%ebp),%eax
 84b:	8b 30                	mov    (%eax),%esi
        ap++;
 84d:	83 c0 04             	add    $0x4,%eax
 850:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 853:	b8 b6 0b 00 00       	mov    $0xbb6,%eax
 858:	85 f6                	test   %esi,%esi
 85a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 85d:	83 ec 0c             	sub    $0xc,%esp
 860:	56                   	push   %esi
 861:	e8 5a f9 ff ff       	call   1c0 <strlen>
 866:	83 c4 0c             	add    $0xc,%esp
 869:	50                   	push   %eax
 86a:	56                   	push   %esi
 86b:	ff 75 08             	pushl  0x8(%ebp)
 86e:	e8 f5 fc ff ff       	call   568 <write>
 873:	83 c4 10             	add    $0x10,%esp
 876:	e9 cd fe ff ff       	jmp    748 <printf+0x48>
 87b:	90                   	nop
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 880:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 883:	83 ec 04             	sub    $0x4,%esp
 886:	8b 06                	mov    (%esi),%eax
 888:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 88a:	83 c6 04             	add    $0x4,%esi
 88d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 890:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 893:	50                   	push   %eax
 894:	ff 75 08             	pushl  0x8(%ebp)
 897:	e8 cc fc ff ff       	call   568 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 89c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 89f:	83 c4 10             	add    $0x10,%esp
 8a2:	e9 a1 fe ff ff       	jmp    748 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 8a7:	31 c0                	xor    %eax,%eax
 8a9:	e9 d3 fe ff ff       	jmp    781 <printf+0x81>
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b1:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	53                   	push   %ebx
 8bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8be:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c3:	39 c8                	cmp    %ecx,%eax
 8c5:	73 19                	jae    8e0 <free+0x30>
 8c7:	89 f6                	mov    %esi,%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8d0:	39 d1                	cmp    %edx,%ecx
 8d2:	72 1c                	jb     8f0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d4:	39 d0                	cmp    %edx,%eax
 8d6:	73 18                	jae    8f0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8da:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8dc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8de:	72 f0                	jb     8d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e0:	39 d0                	cmp    %edx,%eax
 8e2:	72 f4                	jb     8d8 <free+0x28>
 8e4:	39 d1                	cmp    %edx,%ecx
 8e6:	73 f0                	jae    8d8 <free+0x28>
 8e8:	90                   	nop
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8f6:	39 d7                	cmp    %edx,%edi
 8f8:	74 19                	je     913 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8fd:	8b 50 04             	mov    0x4(%eax),%edx
 900:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 903:	39 f1                	cmp    %esi,%ecx
 905:	74 23                	je     92a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 907:	89 08                	mov    %ecx,(%eax)
  freep = p;
 909:	a3 00 20 00 00       	mov    %eax,0x2000
}
 90e:	5b                   	pop    %ebx
 90f:	5e                   	pop    %esi
 910:	5f                   	pop    %edi
 911:	5d                   	pop    %ebp
 912:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 913:	03 72 04             	add    0x4(%edx),%esi
 916:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 919:	8b 10                	mov    (%eax),%edx
 91b:	8b 12                	mov    (%edx),%edx
 91d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 920:	8b 50 04             	mov    0x4(%eax),%edx
 923:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 926:	39 f1                	cmp    %esi,%ecx
 928:	75 dd                	jne    907 <free+0x57>
    p->s.size += bp->s.size;
 92a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 92d:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 932:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 935:	8b 53 f8             	mov    -0x8(%ebx),%edx
 938:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 93a:	5b                   	pop    %ebx
 93b:	5e                   	pop    %esi
 93c:	5f                   	pop    %edi
 93d:	5d                   	pop    %ebp
 93e:	c3                   	ret    
 93f:	90                   	nop

00000940 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	57                   	push   %edi
 944:	56                   	push   %esi
 945:	53                   	push   %ebx
 946:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 949:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 94c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 952:	8d 78 07             	lea    0x7(%eax),%edi
 955:	c1 ef 03             	shr    $0x3,%edi
 958:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 95b:	85 d2                	test   %edx,%edx
 95d:	0f 84 a3 00 00 00    	je     a06 <malloc+0xc6>
 963:	8b 02                	mov    (%edx),%eax
 965:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 968:	39 cf                	cmp    %ecx,%edi
 96a:	76 74                	jbe    9e0 <malloc+0xa0>
 96c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 972:	be 00 10 00 00       	mov    $0x1000,%esi
 977:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 97e:	0f 43 f7             	cmovae %edi,%esi
 981:	ba 00 80 00 00       	mov    $0x8000,%edx
 986:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 98c:	0f 46 da             	cmovbe %edx,%ebx
 98f:	eb 10                	jmp    9a1 <malloc+0x61>
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 998:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 99a:	8b 48 04             	mov    0x4(%eax),%ecx
 99d:	39 cf                	cmp    %ecx,%edi
 99f:	76 3f                	jbe    9e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9a1:	39 05 00 20 00 00    	cmp    %eax,0x2000
 9a7:	89 c2                	mov    %eax,%edx
 9a9:	75 ed                	jne    998 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 9ab:	83 ec 0c             	sub    $0xc,%esp
 9ae:	53                   	push   %ebx
 9af:	e8 1c fc ff ff       	call   5d0 <sbrk>
  if(p == (char*)-1)
 9b4:	83 c4 10             	add    $0x10,%esp
 9b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ba:	74 1c                	je     9d8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9bc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 9bf:	83 ec 0c             	sub    $0xc,%esp
 9c2:	83 c0 08             	add    $0x8,%eax
 9c5:	50                   	push   %eax
 9c6:	e8 e5 fe ff ff       	call   8b0 <free>
  return freep;
 9cb:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 9d1:	83 c4 10             	add    $0x10,%esp
 9d4:	85 d2                	test   %edx,%edx
 9d6:	75 c0                	jne    998 <malloc+0x58>
        return 0;
 9d8:	31 c0                	xor    %eax,%eax
 9da:	eb 1c                	jmp    9f8 <malloc+0xb8>
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9e0:	39 cf                	cmp    %ecx,%edi
 9e2:	74 1c                	je     a00 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9e4:	29 f9                	sub    %edi,%ecx
 9e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9ec:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 9ef:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 9f5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9fb:	5b                   	pop    %ebx
 9fc:	5e                   	pop    %esi
 9fd:	5f                   	pop    %edi
 9fe:	5d                   	pop    %ebp
 9ff:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a00:	8b 08                	mov    (%eax),%ecx
 a02:	89 0a                	mov    %ecx,(%edx)
 a04:	eb e9                	jmp    9ef <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a06:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 a0d:	20 00 00 
 a10:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 a17:	20 00 00 
    base.s.size = 0;
 a1a:	b8 04 20 00 00       	mov    $0x2004,%eax
 a1f:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 a26:	00 00 00 
 a29:	e9 3e ff ff ff       	jmp    96c <malloc+0x2c>
 a2e:	66 90                	xchg   %ax,%ax

00000a30 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 a36:	6a 10                	push   $0x10
 a38:	6a 02                	push   $0x2
 a3a:	ff 75 08             	pushl  0x8(%ebp)
 a3d:	e8 d6 fb ff ff       	call   618 <ioctl>
}
 a42:	c9                   	leave  
 a43:	c3                   	ret    
 a44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a50 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 a56:	68 00 10 00 00       	push   $0x1000
 a5b:	6a 02                	push   $0x2
 a5d:	ff 75 08             	pushl  0x8(%ebp)
 a60:	e8 b3 fb ff ff       	call   618 <ioctl>
}
 a65:	c9                   	leave  
 a66:	c3                   	ret    
 a67:	89 f6                	mov    %esi,%esi
 a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a70 <attach_tty>:

int
attach_tty(int tty_fd)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	53                   	push   %ebx
 a74:	83 ec 08             	sub    $0x8,%esp
 a77:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 a7a:	6a 10                	push   $0x10
 a7c:	6a 01                	push   $0x1
 a7e:	53                   	push   %ebx
 a7f:	e8 94 fb ff ff       	call   618 <ioctl>
 a84:	83 c4 10             	add    $0x10,%esp
 a87:	85 c0                	test   %eax,%eax
 a89:	78 55                	js     ae0 <attach_tty+0x70>
     return -1;

    close(0);
 a8b:	83 ec 0c             	sub    $0xc,%esp
 a8e:	6a 00                	push   $0x0
 a90:	e8 db fa ff ff       	call   570 <close>
    close(1);
 a95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a9c:	e8 cf fa ff ff       	call   570 <close>
    close(2);
 aa1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 aa8:	e8 c3 fa ff ff       	call   570 <close>
    if(dup(tty_fd) < 0)
 aad:	89 1c 24             	mov    %ebx,(%esp)
 ab0:	e8 0b fb ff ff       	call   5c0 <dup>
 ab5:	83 c4 10             	add    $0x10,%esp
 ab8:	85 c0                	test   %eax,%eax
 aba:	78 24                	js     ae0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 abc:	83 ec 0c             	sub    $0xc,%esp
 abf:	53                   	push   %ebx
 ac0:	e8 fb fa ff ff       	call   5c0 <dup>
 ac5:	83 c4 10             	add    $0x10,%esp
 ac8:	85 c0                	test   %eax,%eax
 aca:	78 14                	js     ae0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 acc:	83 ec 0c             	sub    $0xc,%esp
 acf:	53                   	push   %ebx
 ad0:	e8 eb fa ff ff       	call   5c0 <dup>
 ad5:	83 c4 10             	add    $0x10,%esp
 ad8:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 adb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ade:	c9                   	leave  
 adf:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 ae0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 ae5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ae8:	c9                   	leave  
 ae9:	c3                   	ret    
 aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000af0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 af6:	6a 20                	push   $0x20
 af8:	6a 01                	push   $0x1
 afa:	ff 75 08             	pushl  0x8(%ebp)
 afd:	e8 16 fb ff ff       	call   618 <ioctl>
    return 0;
}
 b02:	31 c0                	xor    %eax,%eax
 b04:	c9                   	leave  
 b05:	c3                   	ret    
 b06:	8d 76 00             	lea    0x0(%esi),%esi
 b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b10 <connect_tty>:


int
connect_tty(int tty_fd)
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
 b13:	53                   	push   %ebx
 b14:	83 ec 08             	sub    $0x8,%esp
 b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 b1a:	6a 10                	push   $0x10
 b1c:	6a 02                	push   $0x2
 b1e:	53                   	push   %ebx
 b1f:	e8 f4 fa ff ff       	call   618 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 b24:	83 c4 10             	add    $0x10,%esp
 b27:	85 c0                	test   %eax,%eax
 b29:	74 1d                	je     b48 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 b2b:	83 ec 04             	sub    $0x4,%esp
 b2e:	68 00 10 00 00       	push   $0x1000
 b33:	6a 01                	push   $0x1
 b35:	53                   	push   %ebx
 b36:	e8 dd fa ff ff       	call   618 <ioctl>
     return tty_fd;
 b3b:	83 c4 10             	add    $0x10,%esp
 b3e:	89 d8                	mov    %ebx,%eax
}
 b40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b43:	c9                   	leave  
 b44:	c3                   	ret    
 b45:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 b48:	83 ec 0c             	sub    $0xc,%esp
 b4b:	53                   	push   %ebx
 b4c:	e8 1f fa ff ff       	call   570 <close>
       return -1;
 b51:	83 c4 10             	add    $0x10,%esp
 b54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b59:	eb e5                	jmp    b40 <connect_tty+0x30>
 b5b:	90                   	nop
 b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b60 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
 b63:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 b66:	68 00 20 00 00       	push   $0x2000
 b6b:	6a 01                	push   $0x1
 b6d:	ff 75 08             	pushl  0x8(%ebp)
 b70:	e8 a3 fa ff ff       	call   618 <ioctl>
}
 b75:	c9                   	leave  
 b76:	c3                   	ret    
