
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   6:	31 f6                	xor    %esi,%esi
wc(int fd, char *name)
{
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   8:	31 db                	xor    %ebx,%ebx

char buf[512];

void
wc(int fd, char *name)
{
   a:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  14:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  1b:	90                   	nop
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	83 ec 04             	sub    $0x4,%esp
  23:	68 00 02 00 00       	push   $0x200
  28:	68 20 20 00 00       	push   $0x2020
  2d:	ff 75 08             	pushl  0x8(%ebp)
  30:	e8 0b 06 00 00       	call   640 <read>
  35:	83 c4 10             	add    $0x10,%esp
  38:	83 f8 00             	cmp    $0x0,%eax
  3b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3e:	7e 5f                	jle    9f <wc+0x9f>
  40:	31 ff                	xor    %edi,%edi
  42:	eb 0e                	jmp    52 <wc+0x52>
  44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
  48:	31 f6                	xor    %esi,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  4a:	83 c7 01             	add    $0x1,%edi
  4d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  50:	74 3a                	je     8c <wc+0x8c>
      c++;
      if(buf[i] == '\n')
  52:	0f be 87 20 20 00 00 	movsbl 0x2020(%edi),%eax
        l++;
  59:	31 c9                	xor    %ecx,%ecx
  5b:	3c 0a                	cmp    $0xa,%al
  5d:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
  60:	83 ec 08             	sub    $0x8,%esp
  63:	50                   	push   %eax
  64:	68 58 0c 00 00       	push   $0xc58
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
  69:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
  6b:	e8 80 02 00 00       	call   2f0 <strchr>
  70:	83 c4 10             	add    $0x10,%esp
  73:	85 c0                	test   %eax,%eax
  75:	75 d1                	jne    48 <wc+0x48>
        inword = 0;
      else if(!inword){
  77:	85 f6                	test   %esi,%esi
  79:	75 1d                	jne    98 <wc+0x98>
        w++;
  7b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7f:	83 c7 01             	add    $0x1,%edi
  82:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
        inword = 1;
  85:	be 01 00 00 00       	mov    $0x1,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  8a:	75 c6                	jne    52 <wc+0x52>
  8c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  8f:	01 55 dc             	add    %edx,-0x24(%ebp)
  92:	eb 8c                	jmp    20 <wc+0x20>
  94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  98:	be 01 00 00 00       	mov    $0x1,%esi
  9d:	eb ab                	jmp    4a <wc+0x4a>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  9f:	75 24                	jne    c5 <wc+0xc5>
    printf(1, "wc: read error\n");
    exit(1);
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  a1:	83 ec 08             	sub    $0x8,%esp
  a4:	ff 75 0c             	pushl  0xc(%ebp)
  a7:	ff 75 dc             	pushl  -0x24(%ebp)
  aa:	ff 75 e0             	pushl  -0x20(%ebp)
  ad:	53                   	push   %ebx
  ae:	68 6e 0c 00 00       	push   $0xc6e
  b3:	6a 01                	push   $0x1
  b5:	e8 26 07 00 00       	call   7e0 <printf>
}
  ba:	83 c4 20             	add    $0x20,%esp
  bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c0:	5b                   	pop    %ebx
  c1:	5e                   	pop    %esi
  c2:	5f                   	pop    %edi
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 5e 0c 00 00       	push   $0xc5e
  cd:	6a 01                	push   $0x1
  cf:	e8 0c 07 00 00       	call   7e0 <printf>
    exit(1);
  d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  db:	e8 48 05 00 00       	call   628 <exit>

000000e0 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
  e0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  e4:	83 e4 f0             	and    $0xfffffff0,%esp
  e7:	ff 71 fc             	pushl  -0x4(%ecx)
  ea:	55                   	push   %ebp
  eb:	89 e5                	mov    %esp,%ebp
  ed:	57                   	push   %edi
  ee:	56                   	push   %esi
  ef:	53                   	push   %ebx
  f0:	51                   	push   %ecx
  f1:	be 01 00 00 00       	mov    $0x1,%esi
  f6:	83 ec 18             	sub    $0x18,%esp
  f9:	8b 01                	mov    (%ecx),%eax
  fb:	8b 59 04             	mov    0x4(%ecx),%ebx
  fe:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
 101:	83 f8 01             	cmp    $0x1,%eax
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
 104:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
 107:	7e 62                	jle    16b <main+0x8b>
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 110:	83 ec 08             	sub    $0x8,%esp
 113:	6a 00                	push   $0x0
 115:	ff 33                	pushl  (%ebx)
 117:	e8 4c 05 00 00       	call   668 <open>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	89 c7                	mov    %eax,%edi
 123:	78 2b                	js     150 <main+0x70>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit(1);
    }
    wc(fd, argv[i]);
 125:	83 ec 08             	sub    $0x8,%esp
 128:	ff 33                	pushl  (%ebx)
  if(argc <= 1){
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
 12a:	83 c6 01             	add    $0x1,%esi
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit(1);
    }
    wc(fd, argv[i]);
 12d:	50                   	push   %eax
 12e:	83 c3 04             	add    $0x4,%ebx
 131:	e8 ca fe ff ff       	call   0 <wc>
    close(fd);
 136:	89 3c 24             	mov    %edi,(%esp)
 139:	e8 12 05 00 00       	call   650 <close>
  if(argc <= 1){
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
 13e:	83 c4 10             	add    $0x10,%esp
 141:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
 144:	75 ca                	jne    110 <main+0x30>
      exit(1);
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit(0);
 146:	83 ec 0c             	sub    $0xc,%esp
 149:	6a 00                	push   $0x0
 14b:	e8 d8 04 00 00       	call   628 <exit>
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
 150:	50                   	push   %eax
 151:	ff 33                	pushl  (%ebx)
 153:	68 7b 0c 00 00       	push   $0xc7b
 158:	6a 01                	push   $0x1
 15a:	e8 81 06 00 00       	call   7e0 <printf>
      exit(1);
 15f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 166:	e8 bd 04 00 00       	call   628 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
 16b:	52                   	push   %edx
 16c:	52                   	push   %edx
 16d:	68 6d 0c 00 00       	push   $0xc6d
 172:	6a 00                	push   $0x0
 174:	e8 87 fe ff ff       	call   0 <wc>
    exit(0);
 179:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 180:	e8 a3 04 00 00       	call   628 <exit>
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 19a:	89 c2                	mov    %eax,%edx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1a7:	83 c2 01             	add    $0x1,%edx
 1aa:	84 db                	test   %bl,%bl
 1ac:	88 5a ff             	mov    %bl,-0x1(%edx)
 1af:	75 ef                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1b1:	5b                   	pop    %ebx
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
 1c5:	8b 55 08             	mov    0x8(%ebp),%edx
 1c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1cb:	0f b6 02             	movzbl (%edx),%eax
 1ce:	0f b6 19             	movzbl (%ecx),%ebx
 1d1:	84 c0                	test   %al,%al
 1d3:	75 1e                	jne    1f3 <strcmp+0x33>
 1d5:	eb 29                	jmp    200 <strcmp+0x40>
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1e0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1e3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1e6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1e9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1ed:	84 c0                	test   %al,%al
 1ef:	74 0f                	je     200 <strcmp+0x40>
 1f1:	89 f1                	mov    %esi,%ecx
 1f3:	38 d8                	cmp    %bl,%al
 1f5:	74 e9                	je     1e0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1f7:	29 d8                	sub    %ebx,%eax
}
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 200:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5e                   	pop    %esi
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
 208:	90                   	nop
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	8b 55 08             	mov    0x8(%ebp),%edx
 218:	53                   	push   %ebx
 219:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 21c:	0f b6 32             	movzbl (%edx),%esi
 21f:	89 f0                	mov    %esi,%eax
 221:	84 c0                	test   %al,%al
 223:	74 67                	je     28c <strncmp+0x7c>
 225:	0f b6 19             	movzbl (%ecx),%ebx
 228:	89 f0                	mov    %esi,%eax
 22a:	38 d8                	cmp    %bl,%al
 22c:	75 65                	jne    293 <strncmp+0x83>
 22e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 231:	89 f0                	mov    %esi,%eax
 233:	0f b6 f0             	movzbl %al,%esi
 236:	89 f0                	mov    %esi,%eax
 238:	83 eb 01             	sub    $0x1,%ebx
 23b:	75 14                	jne    251 <strncmp+0x41>
 23d:	eb 25                	jmp    264 <strncmp+0x54>
 23f:	90                   	nop
 240:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 244:	89 f1                	mov    %esi,%ecx
 246:	38 c8                	cmp    %cl,%al
 248:	75 26                	jne    270 <strncmp+0x60>
 24a:	83 eb 01             	sub    $0x1,%ebx
 24d:	89 f9                	mov    %edi,%ecx
 24f:	74 2f                	je     280 <strncmp+0x70>
    p++, q++;
 251:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 254:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 257:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 25a:	84 c0                	test   %al,%al
 25c:	75 e2                	jne    240 <strncmp+0x30>
 25e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 262:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 264:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 265:	29 f0                	sub    %esi,%eax
}
 267:	5e                   	pop    %esi
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	90                   	nop
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 270:	0f b6 f1             	movzbl %cl,%esi
 273:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 274:	29 f0                	sub    %esi,%eax
}
 276:	5e                   	pop    %esi
 277:	5f                   	pop    %edi
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 280:	0f b6 f0             	movzbl %al,%esi
 283:	89 f0                	mov    %esi,%eax
 285:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 286:	29 f0                	sub    %esi,%eax
}
 288:	5e                   	pop    %esi
 289:	5f                   	pop    %edi
 28a:	5d                   	pop    %ebp
 28b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 28c:	31 c0                	xor    %eax,%eax
 28e:	0f b6 31             	movzbl (%ecx),%esi
 291:	eb d1                	jmp    264 <strncmp+0x54>
 293:	0f b6 c0             	movzbl %al,%eax
 296:	0f b6 f3             	movzbl %bl,%esi
 299:	eb c9                	jmp    264 <strncmp+0x54>
 29b:	90                   	nop
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2a6:	80 39 00             	cmpb   $0x0,(%ecx)
 2a9:	74 12                	je     2bd <strlen+0x1d>
 2ab:	31 d2                	xor    %edx,%edx
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 2bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	eb 0d                	jmp    2d0 <memset>
 2c3:	90                   	nop
 2c4:	90                   	nop
 2c5:	90                   	nop
 2c6:	90                   	nop
 2c7:	90                   	nop
 2c8:	90                   	nop
 2c9:	90                   	nop
 2ca:	90                   	nop
 2cb:	90                   	nop
 2cc:	90                   	nop
 2cd:	90                   	nop
 2ce:	90                   	nop
 2cf:	90                   	nop

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 d7                	mov    %edx,%edi
 2df:	fc                   	cld    
 2e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e2:	89 d0                	mov    %edx,%eax
 2e4:	5f                   	pop    %edi
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2fa:	0f b6 10             	movzbl (%eax),%edx
 2fd:	84 d2                	test   %dl,%dl
 2ff:	74 1d                	je     31e <strchr+0x2e>
    if(*s == c)
 301:	38 d3                	cmp    %dl,%bl
 303:	89 d9                	mov    %ebx,%ecx
 305:	75 0d                	jne    314 <strchr+0x24>
 307:	eb 17                	jmp    320 <strchr+0x30>
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 310:	38 ca                	cmp    %cl,%dl
 312:	74 0c                	je     320 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 314:	83 c0 01             	add    $0x1,%eax
 317:	0f b6 10             	movzbl (%eax),%edx
 31a:	84 d2                	test   %dl,%dl
 31c:	75 f2                	jne    310 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 31e:	31 c0                	xor    %eax,%eax
}
 320:	5b                   	pop    %ebx
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 336:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 339:	31 db                	xor    %ebx,%ebx
 33b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 340:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 343:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 346:	7d 30                	jge    378 <gets+0x48>
    cc = read(0, &c, 1);
 348:	83 ec 04             	sub    $0x4,%esp
 34b:	6a 01                	push   $0x1
 34d:	56                   	push   %esi
 34e:	6a 00                	push   $0x0
 350:	e8 eb 02 00 00       	call   640 <read>
    if(cc < 1)
 355:	83 c4 10             	add    $0x10,%esp
 358:	85 c0                	test   %eax,%eax
 35a:	7e e7                	jle    343 <gets+0x13>
      continue;
    buf[i++] = c;
 35c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 360:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 363:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 365:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 368:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 36a:	74 0c                	je     378 <gets+0x48>
 36c:	3c 0d                	cmp    $0xd,%al
 36e:	74 08                	je     378 <gets+0x48>
 370:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 373:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 376:	7c d0                	jl     348 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 37f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 382:	5b                   	pop    %ebx
 383:	5e                   	pop    %esi
 384:	5f                   	pop    %edi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <stat>:

int
stat(const char *n, struct stat *st)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 395:	83 ec 08             	sub    $0x8,%esp
 398:	6a 00                	push   $0x0
 39a:	ff 75 08             	pushl  0x8(%ebp)
 39d:	e8 c6 02 00 00       	call   668 <open>
  if(fd < 0)
 3a2:	83 c4 10             	add    $0x10,%esp
 3a5:	85 c0                	test   %eax,%eax
 3a7:	78 27                	js     3d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3a9:	83 ec 08             	sub    $0x8,%esp
 3ac:	ff 75 0c             	pushl  0xc(%ebp)
 3af:	89 c3                	mov    %eax,%ebx
 3b1:	50                   	push   %eax
 3b2:	e8 c9 02 00 00       	call   680 <fstat>
 3b7:	89 c6                	mov    %eax,%esi
  close(fd);
 3b9:	89 1c 24             	mov    %ebx,(%esp)
 3bc:	e8 8f 02 00 00       	call   650 <close>
  return r;
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	89 f0                	mov    %esi,%eax
}
 3c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3c9:	5b                   	pop    %ebx
 3ca:	5e                   	pop    %esi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d5:	eb ef                	jmp    3c6 <stat+0x36>
 3d7:	89 f6                	mov    %esi,%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
 3e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e7:	0f be 11             	movsbl (%ecx),%edx
 3ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 3ed:	3c 09                	cmp    $0x9,%al
 3ef:	b8 00 00 00 00       	mov    $0x0,%eax
 3f4:	77 1f                	ja     415 <atoi+0x35>
 3f6:	8d 76 00             	lea    0x0(%esi),%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 400:	8d 04 80             	lea    (%eax,%eax,4),%eax
 403:	83 c1 01             	add    $0x1,%ecx
 406:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 40a:	0f be 11             	movsbl (%ecx),%edx
 40d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 eb                	jbe    400 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 415:	5b                   	pop    %ebx
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
 418:	90                   	nop
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
 425:	8b 5d 10             	mov    0x10(%ebp),%ebx
 428:	8b 45 08             	mov    0x8(%ebp),%eax
 42b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 42e:	85 db                	test   %ebx,%ebx
 430:	7e 14                	jle    446 <memmove+0x26>
 432:	31 d2                	xor    %edx,%edx
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 438:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 43c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 43f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 442:	39 da                	cmp    %ebx,%edx
 444:	75 f2                	jne    438 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 446:	5b                   	pop    %ebx
 447:	5e                   	pop    %esi
 448:	5d                   	pop    %ebp
 449:	c3                   	ret    
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000450 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 04             	sub    $0x4,%esp
 459:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 45c:	83 f9 00             	cmp    $0x0,%ecx
 45f:	7e 76                	jle    4d7 <itoa+0x87>
 461:	89 cb                	mov    %ecx,%ebx
 463:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 465:	bf 67 66 66 66       	mov    $0x66666667,%edi
 46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 470:	89 d8                	mov    %ebx,%eax
 472:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 475:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 478:	f7 ef                	imul   %edi
 47a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 47d:	29 da                	sub    %ebx,%edx
 47f:	89 d3                	mov    %edx,%ebx
 481:	75 ed                	jne    470 <itoa+0x20>
        length++;
 483:	89 f3                	mov    %esi,%ebx
 485:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 488:	bf 67 66 66 66       	mov    $0x66666667,%edi
 48d:	8b 75 08             	mov    0x8(%ebp),%esi
 490:	eb 0a                	jmp    49c <itoa+0x4c>
 492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 498:	85 db                	test   %ebx,%ebx
 49a:	7e 25                	jle    4c1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 49c:	89 c8                	mov    %ecx,%eax
 49e:	f7 ef                	imul   %edi
 4a0:	89 c8                	mov    %ecx,%eax
 4a2:	c1 f8 1f             	sar    $0x1f,%eax
 4a5:	c1 fa 02             	sar    $0x2,%edx
 4a8:	29 c2                	sub    %eax,%edx
 4aa:	8d 04 92             	lea    (%edx,%edx,4),%eax
 4ad:	01 c0                	add    %eax,%eax
 4af:	29 c1                	sub    %eax,%ecx
 4b1:	83 c1 30             	add    $0x30,%ecx
 4b4:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 4b8:	83 eb 01             	sub    $0x1,%ebx
 4bb:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 4bd:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 4bf:	7f d7                	jg     498 <itoa+0x48>
 4c1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 4c4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 4c6:	8b 7d 08             	mov    0x8(%ebp),%edi
 4c9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 4cd:	83 c4 04             	add    $0x4,%esp
 4d0:	89 f0                	mov    %esi,%eax
 4d2:	5b                   	pop    %ebx
 4d3:	5e                   	pop    %esi
 4d4:	5f                   	pop    %edi
 4d5:	5d                   	pop    %ebp
 4d6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 4d7:	75 12                	jne    4eb <itoa+0x9b>
        buf[0] = '0';
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 4dc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 4e1:	c6 00 30             	movb   $0x30,(%eax)
 4e4:	b8 01 00 00 00       	mov    $0x1,%eax
 4e9:	eb db                	jmp    4c6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 4eb:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 4ed:	31 f6                	xor    %esi,%esi
 4ef:	eb d5                	jmp    4c6 <itoa+0x76>
 4f1:	eb 0d                	jmp    500 <strcat>
 4f3:	90                   	nop
 4f4:	90                   	nop
 4f5:	90                   	nop
 4f6:	90                   	nop
 4f7:	90                   	nop
 4f8:	90                   	nop
 4f9:	90                   	nop
 4fa:	90                   	nop
 4fb:	90                   	nop
 4fc:	90                   	nop
 4fd:	90                   	nop
 4fe:	90                   	nop
 4ff:	90                   	nop

00000500 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	8b 45 08             	mov    0x8(%ebp),%eax
 508:	53                   	push   %ebx
 509:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 50c:	80 38 00             	cmpb   $0x0,(%eax)
 50f:	74 38                	je     549 <strcat+0x49>
 511:	31 c9                	xor    %ecx,%ecx
 513:	90                   	nop
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 518:	83 c1 01             	add    $0x1,%ecx
 51b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 51f:	89 ca                	mov    %ecx,%edx
 521:	75 f5                	jne    518 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 523:	0f b6 1e             	movzbl (%esi),%ebx
 526:	84 db                	test   %bl,%bl
 528:	74 16                	je     540 <strcat+0x40>
 52a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 52d:	31 d2                	xor    %edx,%edx
 52f:	90                   	nop
                dest[i + j] = source[j];
 530:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 533:	83 c2 01             	add    $0x1,%edx
 536:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 53a:	84 db                	test   %bl,%bl
 53c:	75 f2                	jne    530 <strcat+0x30>
 53e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 540:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 544:	5b                   	pop    %ebx
 545:	5e                   	pop    %esi
 546:	5f                   	pop    %edi
 547:	5d                   	pop    %ebp
 548:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 549:	31 d2                	xor    %edx,%edx
 54b:	31 c9                	xor    %ecx,%ecx
 54d:	eb d4                	jmp    523 <strcat+0x23>
 54f:	90                   	nop

00000550 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 559:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 55c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 55f:	0f b6 00             	movzbl (%eax),%eax
 562:	84 c0                	test   %al,%al
 564:	88 45 f3             	mov    %al,-0xd(%ebp)
 567:	0f 84 a0 00 00 00    	je     60d <strstr+0xbd>
 56d:	8b 55 0c             	mov    0xc(%ebp),%edx
 570:	31 c0                	xor    %eax,%eax
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 578:	83 c0 01             	add    $0x1,%eax
 57b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 57f:	75 f7                	jne    578 <strstr+0x28>
 581:	89 45 e8             	mov    %eax,-0x18(%ebp)
 584:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 587:	0f b6 07             	movzbl (%edi),%eax
 58a:	84 c0                	test   %al,%al
 58c:	74 68                	je     5f6 <strstr+0xa6>
 58e:	31 d2                	xor    %edx,%edx
 590:	83 c2 01             	add    $0x1,%edx
 593:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 597:	75 f7                	jne    590 <strstr+0x40>
 599:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 59c:	84 c0                	test   %al,%al
 59e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 5a1:	74 4d                	je     5f0 <strstr+0xa0>
 5a3:	90                   	nop
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5a8:	38 45 f3             	cmp    %al,-0xd(%ebp)
 5ab:	75 34                	jne    5e1 <strstr+0x91>
 5ad:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 5b0:	83 eb 01             	sub    $0x1,%ebx
 5b3:	74 4b                	je     600 <strstr+0xb0>
 5b5:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b8:	89 f8                	mov    %edi,%eax
 5ba:	eb 10                	jmp    5cc <strstr+0x7c>
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5c0:	3a 4a 01             	cmp    0x1(%edx),%cl
 5c3:	75 1c                	jne    5e1 <strstr+0x91>
 5c5:	83 eb 01             	sub    $0x1,%ebx
 5c8:	89 f2                	mov    %esi,%edx
 5ca:	74 34                	je     600 <strstr+0xb0>
    p++, q++;
 5cc:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5cf:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 5d2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5d5:	84 c9                	test   %cl,%cl
 5d7:	75 e7                	jne    5c0 <strstr+0x70>
 5d9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 5dd:	84 c0                	test   %al,%al
 5df:	74 1f                	je     600 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 5e1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 5e4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 5e7:	74 0d                	je     5f6 <strstr+0xa6>
 5e9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5ec:	84 c0                	test   %al,%al
 5ee:	75 b8                	jne    5a8 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 5f0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 5f4:	eb e7                	jmp    5dd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 5f6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 5f9:	31 c0                	xor    %eax,%eax
}
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 600:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 603:	83 c4 10             	add    $0x10,%esp
 606:	5b                   	pop    %ebx
 607:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 608:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 60a:	5f                   	pop    %edi
 60b:	5d                   	pop    %ebp
 60c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 60d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 614:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 61b:	e9 67 ff ff ff       	jmp    587 <strstr+0x37>

00000620 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 620:	b8 01 00 00 00       	mov    $0x1,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <exit>:
SYSCALL(exit)
 628:	b8 02 00 00 00       	mov    $0x2,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <wait>:
SYSCALL(wait)
 630:	b8 03 00 00 00       	mov    $0x3,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <pipe>:
SYSCALL(pipe)
 638:	b8 04 00 00 00       	mov    $0x4,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <read>:
SYSCALL(read)
 640:	b8 05 00 00 00       	mov    $0x5,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <write>:
SYSCALL(write)
 648:	b8 10 00 00 00       	mov    $0x10,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <close>:
SYSCALL(close)
 650:	b8 15 00 00 00       	mov    $0x15,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <kill>:
SYSCALL(kill)
 658:	b8 06 00 00 00       	mov    $0x6,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <exec>:
SYSCALL(exec)
 660:	b8 07 00 00 00       	mov    $0x7,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <open>:
SYSCALL(open)
 668:	b8 0f 00 00 00       	mov    $0xf,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <mknod>:
SYSCALL(mknod)
 670:	b8 11 00 00 00       	mov    $0x11,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <unlink>:
SYSCALL(unlink)
 678:	b8 12 00 00 00       	mov    $0x12,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <fstat>:
SYSCALL(fstat)
 680:	b8 08 00 00 00       	mov    $0x8,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <link>:
SYSCALL(link)
 688:	b8 13 00 00 00       	mov    $0x13,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <mkdir>:
SYSCALL(mkdir)
 690:	b8 14 00 00 00       	mov    $0x14,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <chdir>:
SYSCALL(chdir)
 698:	b8 09 00 00 00       	mov    $0x9,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <dup>:
SYSCALL(dup)
 6a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <getpid>:
SYSCALL(getpid)
 6a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <sbrk>:
SYSCALL(sbrk)
 6b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <sleep>:
SYSCALL(sleep)
 6b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <uptime>:
SYSCALL(uptime)
 6c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <mount>:
SYSCALL(mount)
 6c8:	b8 16 00 00 00       	mov    $0x16,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <umount>:
SYSCALL(umount)
 6d0:	b8 17 00 00 00       	mov    $0x17,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <printmounts>:
SYSCALL(printmounts)
 6d8:	b8 18 00 00 00       	mov    $0x18,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <printdevices>:
SYSCALL(printdevices)
 6e0:	b8 19 00 00 00       	mov    $0x19,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <unshare>:
SYSCALL(unshare)
 6e8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <usleep>:
SYSCALL(usleep)
 6f0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <ioctl>:
SYSCALL(ioctl)
 6f8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <getppid>:
SYSCALL(getppid)
 700:	b8 1d 00 00 00       	mov    $0x1d,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <getcpu>:
SYSCALL(getcpu)
 708:	b8 1e 00 00 00       	mov    $0x1e,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <getmem>:
SYSCALL(getmem)
 710:	b8 1f 00 00 00       	mov    $0x1f,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <kmemtest>:
SYSCALL(kmemtest)
 718:	b8 20 00 00 00       	mov    $0x20,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 729:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 72c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 72f:	85 db                	test   %ebx,%ebx
 731:	0f 84 91 00 00 00    	je     7c8 <printint+0xa8>
 737:	89 d0                	mov    %edx,%eax
 739:	c1 e8 1f             	shr    $0x1f,%eax
 73c:	84 c0                	test   %al,%al
 73e:	0f 84 84 00 00 00    	je     7c8 <printint+0xa8>
    neg = 1;
    x = -xx;
 744:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 746:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 74d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 74f:	31 ff                	xor    %edi,%edi
 751:	8d 75 c7             	lea    -0x39(%ebp),%esi
 754:	eb 0c                	jmp    762 <printint+0x42>
 756:	8d 76 00             	lea    0x0(%esi),%esi
 759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 760:	89 df                	mov    %ebx,%edi
 762:	31 d2                	xor    %edx,%edx
 764:	8d 5f 01             	lea    0x1(%edi),%ebx
 767:	f7 f1                	div    %ecx
 769:	0f b6 92 98 0c 00 00 	movzbl 0xc98(%edx),%edx
  }while((x /= base) != 0);
 770:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 772:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 775:	75 e9                	jne    760 <printint+0x40>
  if(neg)
 777:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 77a:	85 c0                	test   %eax,%eax
 77c:	74 08                	je     786 <printint+0x66>
    buf[i++] = '-';
 77e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 783:	8d 5f 02             	lea    0x2(%edi),%ebx
 786:	8d 7d d8             	lea    -0x28(%ebp),%edi
 789:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 78d:	89 fa                	mov    %edi,%edx
 78f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 790:	0f b6 08             	movzbl (%eax),%ecx
 793:	83 e8 01             	sub    $0x1,%eax
 796:	83 c2 01             	add    $0x1,%edx
 799:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 79c:	39 f0                	cmp    %esi,%eax
 79e:	75 f0                	jne    790 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 7a0:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 7a3:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 7a8:	57                   	push   %edi
 7a9:	e8 f2 fa ff ff       	call   2a0 <strlen>
 7ae:	83 c4 0c             	add    $0xc,%esp
 7b1:	50                   	push   %eax
 7b2:	57                   	push   %edi
 7b3:	ff 75 c0             	pushl  -0x40(%ebp)
 7b6:	e8 8d fe ff ff       	call   648 <write>
}
 7bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7be:	5b                   	pop    %ebx
 7bf:	5e                   	pop    %esi
 7c0:	5f                   	pop    %edi
 7c1:	5d                   	pop    %ebp
 7c2:	c3                   	ret    
 7c3:	90                   	nop
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 7c8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7ca:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 7d1:	e9 79 ff ff ff       	jmp    74f <printint+0x2f>
 7d6:	8d 76 00             	lea    0x0(%esi),%esi
 7d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 7ec:	0f b6 06             	movzbl (%esi),%eax
 7ef:	84 c0                	test   %al,%al
 7f1:	0f 84 90 01 00 00    	je     987 <printf+0x1a7>
 7f7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 7fa:	31 ff                	xor    %edi,%edi
 7fc:	31 d2                	xor    %edx,%edx
 7fe:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 801:	31 db                	xor    %ebx,%ebx
 803:	eb 39                	jmp    83e <printf+0x5e>
 805:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 808:	83 f9 25             	cmp    $0x25,%ecx
 80b:	0f 84 af 00 00 00    	je     8c0 <printf+0xe0>
 811:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 814:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 817:	83 ec 04             	sub    $0x4,%esp
 81a:	6a 01                	push   $0x1
 81c:	50                   	push   %eax
 81d:	ff 75 08             	pushl  0x8(%ebp)
 820:	e8 23 fe ff ff       	call   648 <write>
 825:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 828:	85 c0                	test   %eax,%eax
 82a:	78 35                	js     861 <printf+0x81>
 82c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 82f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 832:	01 c7                	add    %eax,%edi
 834:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 836:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 83a:	84 c0                	test   %al,%al
 83c:	74 21                	je     85f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 83e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 841:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 843:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 846:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 849:	74 bd                	je     808 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 84b:	83 fa 25             	cmp    $0x25,%edx
 84e:	74 20                	je     870 <printf+0x90>
 850:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 852:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 855:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 857:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 85b:	84 c0                	test   %al,%al
 85d:	75 df                	jne    83e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 85f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 861:	8d 65 f4             	lea    -0xc(%ebp),%esp
 864:	5b                   	pop    %ebx
 865:	5e                   	pop    %esi
 866:	5f                   	pop    %edi
 867:	5d                   	pop    %ebp
 868:	c3                   	ret    
 869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 870:	83 f9 64             	cmp    $0x64,%ecx
 873:	0f 84 7f 00 00 00    	je     8f8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 879:	0f be d0             	movsbl %al,%edx
 87c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 882:	83 fa 70             	cmp    $0x70,%edx
 885:	74 49                	je     8d0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 887:	83 f9 73             	cmp    $0x73,%ecx
 88a:	0f 84 98 00 00 00    	je     928 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 890:	83 f9 63             	cmp    $0x63,%ecx
 893:	0f 84 c7 00 00 00    	je     960 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 899:	83 f9 25             	cmp    $0x25,%ecx
 89c:	74 6a                	je     908 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 89e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 8a1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 8a4:	83 ec 04             	sub    $0x4,%esp
 8a7:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 8a9:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 8ad:	50                   	push   %eax
 8ae:	ff 75 08             	pushl  0x8(%ebp)
 8b1:	e8 92 fd ff ff       	call   648 <write>
 8b6:	83 c4 10             	add    $0x10,%esp
 8b9:	e9 6a ff ff ff       	jmp    828 <printf+0x48>
 8be:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 8c0:	ba 25 00 00 00       	mov    $0x25,%edx
 8c5:	31 c0                	xor    %eax,%eax
 8c7:	eb 89                	jmp    852 <printf+0x72>
 8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 8d0:	83 ec 0c             	sub    $0xc,%esp
 8d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8d8:	6a 00                	push   $0x0
 8da:	8b 75 d0             	mov    -0x30(%ebp),%esi
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
 8e0:	8b 16                	mov    (%esi),%edx
        ap++;
 8e2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 8e5:	e8 36 fe ff ff       	call   720 <printint>
        ap++;
 8ea:	89 75 d0             	mov    %esi,-0x30(%ebp)
 8ed:	83 c4 10             	add    $0x10,%esp
 8f0:	e9 33 ff ff ff       	jmp    828 <printf+0x48>
 8f5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 8f8:	83 ec 0c             	sub    $0xc,%esp
 8fb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 900:	6a 01                	push   $0x1
 902:	eb d6                	jmp    8da <printf+0xfa>
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 908:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 90b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 90e:	83 ec 04             	sub    $0x4,%esp
 911:	6a 01                	push   $0x1
 913:	50                   	push   %eax
 914:	ff 75 08             	pushl  0x8(%ebp)
 917:	e8 2c fd ff ff       	call   648 <write>
 91c:	83 c4 10             	add    $0x10,%esp
 91f:	e9 04 ff ff ff       	jmp    828 <printf+0x48>
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 928:	8b 45 d0             	mov    -0x30(%ebp),%eax
 92b:	8b 30                	mov    (%eax),%esi
        ap++;
 92d:	83 c0 04             	add    $0x4,%eax
 930:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 933:	b8 8f 0c 00 00       	mov    $0xc8f,%eax
 938:	85 f6                	test   %esi,%esi
 93a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 93d:	83 ec 0c             	sub    $0xc,%esp
 940:	56                   	push   %esi
 941:	e8 5a f9 ff ff       	call   2a0 <strlen>
 946:	83 c4 0c             	add    $0xc,%esp
 949:	50                   	push   %eax
 94a:	56                   	push   %esi
 94b:	ff 75 08             	pushl  0x8(%ebp)
 94e:	e8 f5 fc ff ff       	call   648 <write>
 953:	83 c4 10             	add    $0x10,%esp
 956:	e9 cd fe ff ff       	jmp    828 <printf+0x48>
 95b:	90                   	nop
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 960:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 963:	83 ec 04             	sub    $0x4,%esp
 966:	8b 06                	mov    (%esi),%eax
 968:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 96a:	83 c6 04             	add    $0x4,%esi
 96d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 970:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 973:	50                   	push   %eax
 974:	ff 75 08             	pushl  0x8(%ebp)
 977:	e8 cc fc ff ff       	call   648 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 97c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 97f:	83 c4 10             	add    $0x10,%esp
 982:	e9 a1 fe ff ff       	jmp    828 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 987:	31 c0                	xor    %eax,%eax
 989:	e9 d3 fe ff ff       	jmp    861 <printf+0x81>
 98e:	66 90                	xchg   %ax,%ax

00000990 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 990:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 991:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 996:	89 e5                	mov    %esp,%ebp
 998:	57                   	push   %edi
 999:	56                   	push   %esi
 99a:	53                   	push   %ebx
 99b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 99e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a3:	39 c8                	cmp    %ecx,%eax
 9a5:	73 19                	jae    9c0 <free+0x30>
 9a7:	89 f6                	mov    %esi,%esi
 9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 9b0:	39 d1                	cmp    %edx,%ecx
 9b2:	72 1c                	jb     9d0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b4:	39 d0                	cmp    %edx,%eax
 9b6:	73 18                	jae    9d0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9b8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9bc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9be:	72 f0                	jb     9b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9c0:	39 d0                	cmp    %edx,%eax
 9c2:	72 f4                	jb     9b8 <free+0x28>
 9c4:	39 d1                	cmp    %edx,%ecx
 9c6:	73 f0                	jae    9b8 <free+0x28>
 9c8:	90                   	nop
 9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 9d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9d6:	39 d7                	cmp    %edx,%edi
 9d8:	74 19                	je     9f3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9dd:	8b 50 04             	mov    0x4(%eax),%edx
 9e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9e3:	39 f1                	cmp    %esi,%ecx
 9e5:	74 23                	je     a0a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9e9:	a3 00 20 00 00       	mov    %eax,0x2000
}
 9ee:	5b                   	pop    %ebx
 9ef:	5e                   	pop    %esi
 9f0:	5f                   	pop    %edi
 9f1:	5d                   	pop    %ebp
 9f2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9f3:	03 72 04             	add    0x4(%edx),%esi
 9f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9f9:	8b 10                	mov    (%eax),%edx
 9fb:	8b 12                	mov    (%edx),%edx
 9fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a00:	8b 50 04             	mov    0x4(%eax),%edx
 a03:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a06:	39 f1                	cmp    %esi,%ecx
 a08:	75 dd                	jne    9e7 <free+0x57>
    p->s.size += bp->s.size;
 a0a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a0d:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a12:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a15:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a18:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a1a:	5b                   	pop    %ebx
 a1b:	5e                   	pop    %esi
 a1c:	5f                   	pop    %edi
 a1d:	5d                   	pop    %ebp
 a1e:	c3                   	ret    
 a1f:	90                   	nop

00000a20 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
 a23:	57                   	push   %edi
 a24:	56                   	push   %esi
 a25:	53                   	push   %ebx
 a26:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a29:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a2c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a32:	8d 78 07             	lea    0x7(%eax),%edi
 a35:	c1 ef 03             	shr    $0x3,%edi
 a38:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a3b:	85 d2                	test   %edx,%edx
 a3d:	0f 84 a3 00 00 00    	je     ae6 <malloc+0xc6>
 a43:	8b 02                	mov    (%edx),%eax
 a45:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a48:	39 cf                	cmp    %ecx,%edi
 a4a:	76 74                	jbe    ac0 <malloc+0xa0>
 a4c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a52:	be 00 10 00 00       	mov    $0x1000,%esi
 a57:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 a5e:	0f 43 f7             	cmovae %edi,%esi
 a61:	ba 00 80 00 00       	mov    $0x8000,%edx
 a66:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 a6c:	0f 46 da             	cmovbe %edx,%ebx
 a6f:	eb 10                	jmp    a81 <malloc+0x61>
 a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a78:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a7a:	8b 48 04             	mov    0x4(%eax),%ecx
 a7d:	39 cf                	cmp    %ecx,%edi
 a7f:	76 3f                	jbe    ac0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a81:	39 05 00 20 00 00    	cmp    %eax,0x2000
 a87:	89 c2                	mov    %eax,%edx
 a89:	75 ed                	jne    a78 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a8b:	83 ec 0c             	sub    $0xc,%esp
 a8e:	53                   	push   %ebx
 a8f:	e8 1c fc ff ff       	call   6b0 <sbrk>
  if(p == (char*)-1)
 a94:	83 c4 10             	add    $0x10,%esp
 a97:	83 f8 ff             	cmp    $0xffffffff,%eax
 a9a:	74 1c                	je     ab8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a9c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 a9f:	83 ec 0c             	sub    $0xc,%esp
 aa2:	83 c0 08             	add    $0x8,%eax
 aa5:	50                   	push   %eax
 aa6:	e8 e5 fe ff ff       	call   990 <free>
  return freep;
 aab:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 ab1:	83 c4 10             	add    $0x10,%esp
 ab4:	85 d2                	test   %edx,%edx
 ab6:	75 c0                	jne    a78 <malloc+0x58>
        return 0;
 ab8:	31 c0                	xor    %eax,%eax
 aba:	eb 1c                	jmp    ad8 <malloc+0xb8>
 abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ac0:	39 cf                	cmp    %ecx,%edi
 ac2:	74 1c                	je     ae0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ac4:	29 f9                	sub    %edi,%ecx
 ac6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ac9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 acc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 acf:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 ad5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ad8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 adb:	5b                   	pop    %ebx
 adc:	5e                   	pop    %esi
 add:	5f                   	pop    %edi
 ade:	5d                   	pop    %ebp
 adf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 ae0:	8b 08                	mov    (%eax),%ecx
 ae2:	89 0a                	mov    %ecx,(%edx)
 ae4:	eb e9                	jmp    acf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 ae6:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 aed:	20 00 00 
 af0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 af7:	20 00 00 
    base.s.size = 0;
 afa:	b8 04 20 00 00       	mov    $0x2004,%eax
 aff:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 b06:	00 00 00 
 b09:	e9 3e ff ff ff       	jmp    a4c <malloc+0x2c>
 b0e:	66 90                	xchg   %ax,%ax

00000b10 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
 b13:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 b16:	6a 10                	push   $0x10
 b18:	6a 02                	push   $0x2
 b1a:	ff 75 08             	pushl  0x8(%ebp)
 b1d:	e8 d6 fb ff ff       	call   6f8 <ioctl>
}
 b22:	c9                   	leave  
 b23:	c3                   	ret    
 b24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b30 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 b36:	68 00 10 00 00       	push   $0x1000
 b3b:	6a 02                	push   $0x2
 b3d:	ff 75 08             	pushl  0x8(%ebp)
 b40:	e8 b3 fb ff ff       	call   6f8 <ioctl>
}
 b45:	c9                   	leave  
 b46:	c3                   	ret    
 b47:	89 f6                	mov    %esi,%esi
 b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <attach_tty>:

int
attach_tty(int tty_fd)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	53                   	push   %ebx
 b54:	83 ec 08             	sub    $0x8,%esp
 b57:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 b5a:	6a 10                	push   $0x10
 b5c:	6a 01                	push   $0x1
 b5e:	53                   	push   %ebx
 b5f:	e8 94 fb ff ff       	call   6f8 <ioctl>
 b64:	83 c4 10             	add    $0x10,%esp
 b67:	85 c0                	test   %eax,%eax
 b69:	78 55                	js     bc0 <attach_tty+0x70>
     return -1;

    close(0);
 b6b:	83 ec 0c             	sub    $0xc,%esp
 b6e:	6a 00                	push   $0x0
 b70:	e8 db fa ff ff       	call   650 <close>
    close(1);
 b75:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b7c:	e8 cf fa ff ff       	call   650 <close>
    close(2);
 b81:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b88:	e8 c3 fa ff ff       	call   650 <close>
    if(dup(tty_fd) < 0)
 b8d:	89 1c 24             	mov    %ebx,(%esp)
 b90:	e8 0b fb ff ff       	call   6a0 <dup>
 b95:	83 c4 10             	add    $0x10,%esp
 b98:	85 c0                	test   %eax,%eax
 b9a:	78 24                	js     bc0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 b9c:	83 ec 0c             	sub    $0xc,%esp
 b9f:	53                   	push   %ebx
 ba0:	e8 fb fa ff ff       	call   6a0 <dup>
 ba5:	83 c4 10             	add    $0x10,%esp
 ba8:	85 c0                	test   %eax,%eax
 baa:	78 14                	js     bc0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 bac:	83 ec 0c             	sub    $0xc,%esp
 baf:	53                   	push   %ebx
 bb0:	e8 eb fa ff ff       	call   6a0 <dup>
 bb5:	83 c4 10             	add    $0x10,%esp
 bb8:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 bbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bbe:	c9                   	leave  
 bbf:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 bc5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bc8:	c9                   	leave  
 bc9:	c3                   	ret    
 bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000bd0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 bd6:	6a 20                	push   $0x20
 bd8:	6a 01                	push   $0x1
 bda:	ff 75 08             	pushl  0x8(%ebp)
 bdd:	e8 16 fb ff ff       	call   6f8 <ioctl>
    return 0;
}
 be2:	31 c0                	xor    %eax,%eax
 be4:	c9                   	leave  
 be5:	c3                   	ret    
 be6:	8d 76 00             	lea    0x0(%esi),%esi
 be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bf0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 bf0:	55                   	push   %ebp
 bf1:	89 e5                	mov    %esp,%ebp
 bf3:	53                   	push   %ebx
 bf4:	83 ec 08             	sub    $0x8,%esp
 bf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 bfa:	6a 10                	push   $0x10
 bfc:	6a 02                	push   $0x2
 bfe:	53                   	push   %ebx
 bff:	e8 f4 fa ff ff       	call   6f8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 c04:	83 c4 10             	add    $0x10,%esp
 c07:	85 c0                	test   %eax,%eax
 c09:	74 1d                	je     c28 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 c0b:	83 ec 04             	sub    $0x4,%esp
 c0e:	68 00 10 00 00       	push   $0x1000
 c13:	6a 01                	push   $0x1
 c15:	53                   	push   %ebx
 c16:	e8 dd fa ff ff       	call   6f8 <ioctl>
     return tty_fd;
 c1b:	83 c4 10             	add    $0x10,%esp
 c1e:	89 d8                	mov    %ebx,%eax
}
 c20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 c23:	c9                   	leave  
 c24:	c3                   	ret    
 c25:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 c28:	83 ec 0c             	sub    $0xc,%esp
 c2b:	53                   	push   %ebx
 c2c:	e8 1f fa ff ff       	call   650 <close>
       return -1;
 c31:	83 c4 10             	add    $0x10,%esp
 c34:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c39:	eb e5                	jmp    c20 <connect_tty+0x30>
 c3b:	90                   	nop
 c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c40 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 c40:	55                   	push   %ebp
 c41:	89 e5                	mov    %esp,%ebp
 c43:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 c46:	68 00 20 00 00       	push   $0x2000
 c4b:	6a 01                	push   $0x1
 c4d:	ff 75 08             	pushl  0x8(%ebp)
 c50:	e8 a3 fa ff ff       	call   6f8 <ioctl>
}
 c55:	c9                   	leave  
 c56:	c3                   	ret    
