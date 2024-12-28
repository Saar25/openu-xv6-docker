
_demo_mount_ns:     file format elf32-i386


Disassembly of section .text:

00000000 <createNwrite>:
#include "ns_types.h"
#include "param.h"


void
createNwrite(char *path, char *str, int strlen){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 14             	sub    $0x14,%esp
   9:	8b 75 0c             	mov    0xc(%ebp),%esi
   c:	8b 7d 10             	mov    0x10(%ebp),%edi
         int fd;

         if ((fd = open(path,O_CREATE|O_RDWR)) <= 0){
   f:	68 02 02 00 00       	push   $0x202
  14:	ff 75 08             	pushl  0x8(%ebp)
  17:	e8 2c 07 00 00       	call   748 <open>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	85 c0                	test   %eax,%eax
  21:	7e 24                	jle    47 <createNwrite+0x47>
            printf(stderr, "open failed\n");
            exit(1);
         }

         if (write(fd, str, strlen) != 10){
  23:	83 ec 04             	sub    $0x4,%esp
  26:	89 c3                	mov    %eax,%ebx
  28:	57                   	push   %edi
  29:	56                   	push   %esi
  2a:	50                   	push   %eax
  2b:	e8 f8 06 00 00       	call   728 <write>
  30:	83 c4 10             	add    $0x10,%esp
  33:	83 f8 0a             	cmp    $0xa,%eax
  36:	75 29                	jne    61 <createNwrite+0x61>
            printf(stderr, "write failed\n");
            exit(1);
         }

         close (fd);
  38:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
  3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3e:	5b                   	pop    %ebx
  3f:	5e                   	pop    %esi
  40:	5f                   	pop    %edi
  41:	5d                   	pop    %ebp
         if (write(fd, str, strlen) != 10){
            printf(stderr, "write failed\n");
            exit(1);
         }

         close (fd);
  42:	e9 e9 06 00 00       	jmp    730 <close>
void
createNwrite(char *path, char *str, int strlen){
         int fd;

         if ((fd = open(path,O_CREATE|O_RDWR)) <= 0){
            printf(stderr, "open failed\n");
  47:	52                   	push   %edx
  48:	52                   	push   %edx
  49:	68 38 0d 00 00       	push   $0xd38
  4e:	6a 02                	push   $0x2
  50:	e8 6b 08 00 00       	call   8c0 <printf>
            exit(1);
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 a7 06 00 00       	call   708 <exit>
         }

         if (write(fd, str, strlen) != 10){
            printf(stderr, "write failed\n");
  61:	50                   	push   %eax
  62:	50                   	push   %eax
  63:	68 45 0d 00 00       	push   $0xd45
  68:	6a 02                	push   $0x2
  6a:	e8 51 08 00 00       	call   8c0 <printf>
            exit(1);
  6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  76:	e8 8d 06 00 00       	call   708 <exit>
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <main>:
         close (fd);
}

int
main(int argc, char *argv[])
{
  80:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  84:	83 e4 f0             	and    $0xfffffff0,%esp
  87:	ff 71 fc             	pushl  -0x4(%ecx)
  8a:	55                   	push   %ebp
  8b:	89 e5                	mov    %esp,%ebp
  8d:	51                   	push   %ecx
  8e:	83 ec 04             	sub    $0x4,%esp

     // ******************************************************************************
     // create a child process with a separate mount namespace
     // create a mount point and mount on it a preformatted internal_fs_a
     // create a file on the mounted file system
     int pid = fork();
  91:	e8 6a 06 00 00       	call   700 <fork>
     if (pid < 0){
  96:	85 c0                	test   %eax,%eax
  98:	0f 88 9c 01 00 00    	js     23a <main+0x1ba>
        printf(stderr, "fork failed\n");
        exit(1);
     }

     if (pid == 0){
  9e:	0f 84 ae 00 00 00    	je     152 <main+0xd2>

     // ******************************************************************************
     // ******************************************************************************
     if (pid > 0){
         // make sure child process runs first to create a new ns
         sleep(100);
  a4:	83 ec 0c             	sub    $0xc,%esp
  a7:	6a 64                	push   $0x64
  a9:	e8 ea 06 00 00       	call   798 <sleep>
         // create a mount point and mount on it a preformatted internal_fs_b
         if (mkdir("dirB") != 0){
  ae:	c7 04 24 a8 0d 00 00 	movl   $0xda8,(%esp)
  b5:	e8 b6 06 00 00       	call   770 <mkdir>
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	85 c0                	test   %eax,%eax
  bf:	74 1a                	je     db <main+0x5b>
         if(unshare(MOUNT_NS) != 0){
            printf(stderr, "Cannot create mount namespace\n");
            exit(1);
         }
         if (mkdir("dirA") != 0){
            printf(stderr, "mkdir failed\n");
  c1:	50                   	push   %eax
  c2:	50                   	push   %eax
  c3:	68 65 0d 00 00       	push   $0xd65
  c8:	6a 02                	push   $0x2
  ca:	e8 f1 07 00 00       	call   8c0 <printf>
            exit(1);
  cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d6:	e8 2d 06 00 00       	call   708 <exit>
         // create a mount point and mount on it a preformatted internal_fs_b
         if (mkdir("dirB") != 0){
            printf(stderr, "mkdir failed\n");
            exit(1);
         }
         if (mount("internal_fs_b","dirB",0) != 0){
  db:	51                   	push   %ecx
  dc:	6a 00                	push   $0x0
  de:	68 a8 0d 00 00       	push   $0xda8
  e3:	68 ad 0d 00 00       	push   $0xdad
  e8:	e8 bb 06 00 00       	call   7a8 <mount>
  ed:	83 c4 10             	add    $0x10,%esp
  f0:	85 c0                	test   %eax,%eax
  f2:	0f 85 28 01 00 00    	jne    220 <main+0x1a0>
            printf(stderr, "mount failed\n");
            exit(1);
          }
          createNwrite("dirB/file.txt", "987654321\n",10);
  f8:	50                   	push   %eax
  f9:	6a 0a                	push   $0xa
  fb:	68 bb 0d 00 00       	push   $0xdbb
 100:	68 c6 0d 00 00       	push   $0xdc6
 105:	e8 f6 fe ff ff       	call   0 <createNwrite>
      }

     // ******************************************************************************
     // both processes will sleep for a while to enable each
     // other to reach this point
     sleep(100);
 10a:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 111:	e8 82 06 00 00       	call   798 <sleep>
            printf(stderr, "open was about to fail but succeeded\n");
            exit(1);
          }
      }
      else{
         if (open("dirB/file.txt",O_RDONLY) < 0){
 116:	58                   	pop    %eax
 117:	5a                   	pop    %edx
 118:	6a 00                	push   $0x0
 11a:	68 c6 0d 00 00       	push   $0xdc6
 11f:	e8 24 06 00 00       	call   748 <open>
 124:	83 c4 10             	add    $0x10,%esp
 127:	85 c0                	test   %eax,%eax
 129:	0f 88 25 01 00 00    	js     254 <main+0x1d4>
            printf(stderr, "open was about to succeed but failed\n");
            exit(1);
          }
         if (open("dirA/file.txt",O_RDONLY) >= 0){
 12f:	50                   	push   %eax
 130:	50                   	push   %eax
 131:	6a 00                	push   $0x0
 133:	68 9a 0d 00 00       	push   $0xd9a
 138:	e8 0b 06 00 00       	call   748 <open>
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	0f 89 a4 00 00 00    	jns    1ec <main+0x16c>
            printf(stderr, "open was about to fail but succeeded\n");
            exit(1);
          }
      }
      exit(0);
 148:	83 ec 0c             	sub    $0xc,%esp
 14b:	6a 00                	push   $0x0
 14d:	e8 b6 05 00 00       	call   708 <exit>
        printf(stderr, "fork failed\n");
        exit(1);
     }

     if (pid == 0){
         if(unshare(MOUNT_NS) != 0){
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	6a 01                	push   $0x1
 157:	e8 6c 06 00 00       	call   7c8 <unshare>
 15c:	83 c4 10             	add    $0x10,%esp
 15f:	85 c0                	test   %eax,%eax
 161:	0f 85 9f 00 00 00    	jne    206 <main+0x186>
            printf(stderr, "Cannot create mount namespace\n");
            exit(1);
         }
         if (mkdir("dirA") != 0){
 167:	83 ec 0c             	sub    $0xc,%esp
 16a:	68 60 0d 00 00       	push   $0xd60
 16f:	e8 fc 05 00 00       	call   770 <mkdir>
 174:	83 c4 10             	add    $0x10,%esp
 177:	85 c0                	test   %eax,%eax
 179:	0f 85 42 ff ff ff    	jne    c1 <main+0x41>
            printf(stderr, "mkdir failed\n");
            exit(1);
         }
         if (mount("internal_fs_a","dirA",0) != 0){
 17f:	50                   	push   %eax
 180:	6a 00                	push   $0x0
 182:	68 60 0d 00 00       	push   $0xd60
 187:	68 73 0d 00 00       	push   $0xd73
 18c:	e8 17 06 00 00       	call   7a8 <mount>
 191:	83 c4 10             	add    $0x10,%esp
 194:	85 c0                	test   %eax,%eax
 196:	0f 85 84 00 00 00    	jne    220 <main+0x1a0>
            printf(stderr, "mount failed\n");
            exit(1);
         }
         createNwrite("dirA/file.txt", "123456789\n",10);
 19c:	50                   	push   %eax
 19d:	6a 0a                	push   $0xa
 19f:	68 8f 0d 00 00       	push   $0xd8f
 1a4:	68 9a 0d 00 00       	push   $0xd9a
 1a9:	e8 52 fe ff ff       	call   0 <createNwrite>
      }

     // ******************************************************************************
     // both processes will sleep for a while to enable each
     // other to reach this point
     sleep(100);
 1ae:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1b5:	e8 de 05 00 00       	call   798 <sleep>
     // ******************************************************************************
     // at this point it is guaranteed that the child process is able to access
     // dirA/file.txt while the parent process is able to access dirB/file.txt but
     // not vice versa. We just need to check it.
     if(pid == 0){
         if (open("dirA/file.txt",O_RDONLY) < 0){
 1ba:	58                   	pop    %eax
 1bb:	5a                   	pop    %edx
 1bc:	6a 00                	push   $0x0
 1be:	68 9a 0d 00 00       	push   $0xd9a
 1c3:	e8 80 05 00 00       	call   748 <open>
 1c8:	83 c4 10             	add    $0x10,%esp
 1cb:	85 c0                	test   %eax,%eax
 1cd:	0f 88 81 00 00 00    	js     254 <main+0x1d4>
            printf(stderr, "open was about to succeed but failed\n");
            exit(1);
          }
         if (open("dirB/file.txt",O_RDONLY) >= 0){
 1d3:	51                   	push   %ecx
 1d4:	51                   	push   %ecx
 1d5:	6a 00                	push   $0x0
 1d7:	68 c6 0d 00 00       	push   $0xdc6
 1dc:	e8 67 05 00 00       	call   748 <open>
 1e1:	83 c4 10             	add    $0x10,%esp
 1e4:	85 c0                	test   %eax,%eax
 1e6:	0f 88 5c ff ff ff    	js     148 <main+0xc8>
            printf(stderr, "open was about to fail but succeeded\n");
 1ec:	52                   	push   %edx
 1ed:	52                   	push   %edx
 1ee:	68 1c 0e 00 00       	push   $0xe1c
 1f3:	6a 02                	push   $0x2
 1f5:	e8 c6 06 00 00       	call   8c0 <printf>
            exit(1);
 1fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 201:	e8 02 05 00 00       	call   708 <exit>
        exit(1);
     }

     if (pid == 0){
         if(unshare(MOUNT_NS) != 0){
            printf(stderr, "Cannot create mount namespace\n");
 206:	50                   	push   %eax
 207:	50                   	push   %eax
 208:	68 d4 0d 00 00       	push   $0xdd4
 20d:	6a 02                	push   $0x2
 20f:	e8 ac 06 00 00       	call   8c0 <printf>
            exit(1);
 214:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21b:	e8 e8 04 00 00       	call   708 <exit>
         if (mkdir("dirA") != 0){
            printf(stderr, "mkdir failed\n");
            exit(1);
         }
         if (mount("internal_fs_a","dirA",0) != 0){
            printf(stderr, "mount failed\n");
 220:	51                   	push   %ecx
 221:	51                   	push   %ecx
 222:	68 81 0d 00 00       	push   $0xd81
 227:	6a 02                	push   $0x2
 229:	e8 92 06 00 00       	call   8c0 <printf>
            exit(1);
 22e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 235:	e8 ce 04 00 00       	call   708 <exit>
     // create a child process with a separate mount namespace
     // create a mount point and mount on it a preformatted internal_fs_a
     // create a file on the mounted file system
     int pid = fork();
     if (pid < 0){
        printf(stderr, "fork failed\n");
 23a:	50                   	push   %eax
 23b:	50                   	push   %eax
 23c:	68 53 0d 00 00       	push   $0xd53
 241:	6a 02                	push   $0x2
 243:	e8 78 06 00 00       	call   8c0 <printf>
        exit(1);
 248:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24f:	e8 b4 04 00 00       	call   708 <exit>
     // at this point it is guaranteed that the child process is able to access
     // dirA/file.txt while the parent process is able to access dirB/file.txt but
     // not vice versa. We just need to check it.
     if(pid == 0){
         if (open("dirA/file.txt",O_RDONLY) < 0){
            printf(stderr, "open was about to succeed but failed\n");
 254:	50                   	push   %eax
 255:	50                   	push   %eax
 256:	68 f4 0d 00 00       	push   $0xdf4
 25b:	6a 02                	push   $0x2
 25d:	e8 5e 06 00 00       	call   8c0 <printf>
            exit(1);
 262:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 269:	e8 9a 04 00 00       	call   708 <exit>
 26e:	66 90                	xchg   %ax,%ax

00000270 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 27a:	89 c2                	mov    %eax,%edx
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 280:	83 c1 01             	add    $0x1,%ecx
 283:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 287:	83 c2 01             	add    $0x1,%edx
 28a:	84 db                	test   %bl,%bl
 28c:	88 5a ff             	mov    %bl,-0x1(%edx)
 28f:	75 ef                	jne    280 <strcpy+0x10>
    ;
  return os;
}
 291:	5b                   	pop    %ebx
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 29a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	8b 55 08             	mov    0x8(%ebp),%edx
 2a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2ab:	0f b6 02             	movzbl (%edx),%eax
 2ae:	0f b6 19             	movzbl (%ecx),%ebx
 2b1:	84 c0                	test   %al,%al
 2b3:	75 1e                	jne    2d3 <strcmp+0x33>
 2b5:	eb 29                	jmp    2e0 <strcmp+0x40>
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 2c0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 2c6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2cd:	84 c0                	test   %al,%al
 2cf:	74 0f                	je     2e0 <strcmp+0x40>
 2d1:	89 f1                	mov    %esi,%ecx
 2d3:	38 d8                	cmp    %bl,%al
 2d5:	74 e9                	je     2c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2d7:	29 d8                	sub    %ebx,%eax
}
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2e2:	29 d8                	sub    %ebx,%eax
}
 2e4:	5b                   	pop    %ebx
 2e5:	5e                   	pop    %esi
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    
 2e8:	90                   	nop
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
 2f5:	8b 55 08             	mov    0x8(%ebp),%edx
 2f8:	53                   	push   %ebx
 2f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 2fc:	0f b6 32             	movzbl (%edx),%esi
 2ff:	89 f0                	mov    %esi,%eax
 301:	84 c0                	test   %al,%al
 303:	74 67                	je     36c <strncmp+0x7c>
 305:	0f b6 19             	movzbl (%ecx),%ebx
 308:	89 f0                	mov    %esi,%eax
 30a:	38 d8                	cmp    %bl,%al
 30c:	75 65                	jne    373 <strncmp+0x83>
 30e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 311:	89 f0                	mov    %esi,%eax
 313:	0f b6 f0             	movzbl %al,%esi
 316:	89 f0                	mov    %esi,%eax
 318:	83 eb 01             	sub    $0x1,%ebx
 31b:	75 14                	jne    331 <strncmp+0x41>
 31d:	eb 25                	jmp    344 <strncmp+0x54>
 31f:	90                   	nop
 320:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 324:	89 f1                	mov    %esi,%ecx
 326:	38 c8                	cmp    %cl,%al
 328:	75 26                	jne    350 <strncmp+0x60>
 32a:	83 eb 01             	sub    $0x1,%ebx
 32d:	89 f9                	mov    %edi,%ecx
 32f:	74 2f                	je     360 <strncmp+0x70>
    p++, q++;
 331:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 334:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 337:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 33a:	84 c0                	test   %al,%al
 33c:	75 e2                	jne    320 <strncmp+0x30>
 33e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 342:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 344:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 345:	29 f0                	sub    %esi,%eax
}
 347:	5e                   	pop    %esi
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	90                   	nop
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 350:	0f b6 f1             	movzbl %cl,%esi
 353:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 354:	29 f0                	sub    %esi,%eax
}
 356:	5e                   	pop    %esi
 357:	5f                   	pop    %edi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 360:	0f b6 f0             	movzbl %al,%esi
 363:	89 f0                	mov    %esi,%eax
 365:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 366:	29 f0                	sub    %esi,%eax
}
 368:	5e                   	pop    %esi
 369:	5f                   	pop    %edi
 36a:	5d                   	pop    %ebp
 36b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 36c:	31 c0                	xor    %eax,%eax
 36e:	0f b6 31             	movzbl (%ecx),%esi
 371:	eb d1                	jmp    344 <strncmp+0x54>
 373:	0f b6 c0             	movzbl %al,%eax
 376:	0f b6 f3             	movzbl %bl,%esi
 379:	eb c9                	jmp    344 <strncmp+0x54>
 37b:	90                   	nop
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 386:	80 39 00             	cmpb   $0x0,(%ecx)
 389:	74 12                	je     39d <strlen+0x1d>
 38b:	31 d2                	xor    %edx,%edx
 38d:	8d 76 00             	lea    0x0(%esi),%esi
 390:	83 c2 01             	add    $0x1,%edx
 393:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 397:	89 d0                	mov    %edx,%eax
 399:	75 f5                	jne    390 <strlen+0x10>
    ;
  return n;
}
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 39d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 39f:	5d                   	pop    %ebp
 3a0:	c3                   	ret    
 3a1:	eb 0d                	jmp    3b0 <memset>
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

000003b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bd:	89 d7                	mov    %edx,%edi
 3bf:	fc                   	cld    
 3c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	5f                   	pop    %edi
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	89 f6                	mov    %esi,%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <strchr>:

char*
strchr(const char *s, char c)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 3da:	0f b6 10             	movzbl (%eax),%edx
 3dd:	84 d2                	test   %dl,%dl
 3df:	74 1d                	je     3fe <strchr+0x2e>
    if(*s == c)
 3e1:	38 d3                	cmp    %dl,%bl
 3e3:	89 d9                	mov    %ebx,%ecx
 3e5:	75 0d                	jne    3f4 <strchr+0x24>
 3e7:	eb 17                	jmp    400 <strchr+0x30>
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f0:	38 ca                	cmp    %cl,%dl
 3f2:	74 0c                	je     400 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3f4:	83 c0 01             	add    $0x1,%eax
 3f7:	0f b6 10             	movzbl (%eax),%edx
 3fa:	84 d2                	test   %dl,%dl
 3fc:	75 f2                	jne    3f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 3fe:	31 c0                	xor    %eax,%eax
}
 400:	5b                   	pop    %ebx
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    
 403:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <gets>:

char*
gets(char *buf, int max)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 416:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 419:	31 db                	xor    %ebx,%ebx
 41b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 420:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 423:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 426:	7d 30                	jge    458 <gets+0x48>
    cc = read(0, &c, 1);
 428:	83 ec 04             	sub    $0x4,%esp
 42b:	6a 01                	push   $0x1
 42d:	56                   	push   %esi
 42e:	6a 00                	push   $0x0
 430:	e8 eb 02 00 00       	call   720 <read>
    if(cc < 1)
 435:	83 c4 10             	add    $0x10,%esp
 438:	85 c0                	test   %eax,%eax
 43a:	7e e7                	jle    423 <gets+0x13>
      continue;
    buf[i++] = c;
 43c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 440:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 443:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 445:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 448:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 44a:	74 0c                	je     458 <gets+0x48>
 44c:	3c 0d                	cmp    $0xd,%al
 44e:	74 08                	je     458 <gets+0x48>
 450:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 453:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 456:	7c d0                	jl     428 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 45f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 462:	5b                   	pop    %ebx
 463:	5e                   	pop    %esi
 464:	5f                   	pop    %edi
 465:	5d                   	pop    %ebp
 466:	c3                   	ret    
 467:	89 f6                	mov    %esi,%esi
 469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000470 <stat>:

int
stat(const char *n, struct stat *st)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	56                   	push   %esi
 474:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 475:	83 ec 08             	sub    $0x8,%esp
 478:	6a 00                	push   $0x0
 47a:	ff 75 08             	pushl  0x8(%ebp)
 47d:	e8 c6 02 00 00       	call   748 <open>
  if(fd < 0)
 482:	83 c4 10             	add    $0x10,%esp
 485:	85 c0                	test   %eax,%eax
 487:	78 27                	js     4b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 489:	83 ec 08             	sub    $0x8,%esp
 48c:	ff 75 0c             	pushl  0xc(%ebp)
 48f:	89 c3                	mov    %eax,%ebx
 491:	50                   	push   %eax
 492:	e8 c9 02 00 00       	call   760 <fstat>
 497:	89 c6                	mov    %eax,%esi
  close(fd);
 499:	89 1c 24             	mov    %ebx,(%esp)
 49c:	e8 8f 02 00 00       	call   730 <close>
  return r;
 4a1:	83 c4 10             	add    $0x10,%esp
 4a4:	89 f0                	mov    %esi,%eax
}
 4a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4a9:	5b                   	pop    %ebx
 4aa:	5e                   	pop    %esi
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 4b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4b5:	eb ef                	jmp    4a6 <stat+0x36>
 4b7:	89 f6                	mov    %esi,%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	53                   	push   %ebx
 4c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4c7:	0f be 11             	movsbl (%ecx),%edx
 4ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 4cd:	3c 09                	cmp    $0x9,%al
 4cf:	b8 00 00 00 00       	mov    $0x0,%eax
 4d4:	77 1f                	ja     4f5 <atoi+0x35>
 4d6:	8d 76 00             	lea    0x0(%esi),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4e3:	83 c1 01             	add    $0x1,%ecx
 4e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4ea:	0f be 11             	movsbl (%ecx),%edx
 4ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4f0:	80 fb 09             	cmp    $0x9,%bl
 4f3:	76 eb                	jbe    4e0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 4f5:	5b                   	pop    %ebx
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
 4f8:	90                   	nop
 4f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000500 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
 505:	8b 5d 10             	mov    0x10(%ebp),%ebx
 508:	8b 45 08             	mov    0x8(%ebp),%eax
 50b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 50e:	85 db                	test   %ebx,%ebx
 510:	7e 14                	jle    526 <memmove+0x26>
 512:	31 d2                	xor    %edx,%edx
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 518:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 51c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 51f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 522:	39 da                	cmp    %ebx,%edx
 524:	75 f2                	jne    518 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 526:	5b                   	pop    %ebx
 527:	5e                   	pop    %esi
 528:	5d                   	pop    %ebp
 529:	c3                   	ret    
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000530 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 04             	sub    $0x4,%esp
 539:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 53c:	83 f9 00             	cmp    $0x0,%ecx
 53f:	7e 76                	jle    5b7 <itoa+0x87>
 541:	89 cb                	mov    %ecx,%ebx
 543:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 545:	bf 67 66 66 66       	mov    $0x66666667,%edi
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 550:	89 d8                	mov    %ebx,%eax
 552:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 555:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 558:	f7 ef                	imul   %edi
 55a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 55d:	29 da                	sub    %ebx,%edx
 55f:	89 d3                	mov    %edx,%ebx
 561:	75 ed                	jne    550 <itoa+0x20>
        length++;
 563:	89 f3                	mov    %esi,%ebx
 565:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 568:	bf 67 66 66 66       	mov    $0x66666667,%edi
 56d:	8b 75 08             	mov    0x8(%ebp),%esi
 570:	eb 0a                	jmp    57c <itoa+0x4c>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 578:	85 db                	test   %ebx,%ebx
 57a:	7e 25                	jle    5a1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 57c:	89 c8                	mov    %ecx,%eax
 57e:	f7 ef                	imul   %edi
 580:	89 c8                	mov    %ecx,%eax
 582:	c1 f8 1f             	sar    $0x1f,%eax
 585:	c1 fa 02             	sar    $0x2,%edx
 588:	29 c2                	sub    %eax,%edx
 58a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 58d:	01 c0                	add    %eax,%eax
 58f:	29 c1                	sub    %eax,%ecx
 591:	83 c1 30             	add    $0x30,%ecx
 594:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 598:	83 eb 01             	sub    $0x1,%ebx
 59b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 59d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 59f:	7f d7                	jg     578 <itoa+0x48>
 5a1:	8b 75 f0             	mov    -0x10(%ebp),%esi
 5a4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 5a6:	8b 7d 08             	mov    0x8(%ebp),%edi
 5a9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 5ad:	83 c4 04             	add    $0x4,%esp
 5b0:	89 f0                	mov    %esi,%eax
 5b2:	5b                   	pop    %ebx
 5b3:	5e                   	pop    %esi
 5b4:	5f                   	pop    %edi
 5b5:	5d                   	pop    %ebp
 5b6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 5b7:	75 12                	jne    5cb <itoa+0x9b>
        buf[0] = '0';
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 5bc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 5c1:	c6 00 30             	movb   $0x30,(%eax)
 5c4:	b8 01 00 00 00       	mov    $0x1,%eax
 5c9:	eb db                	jmp    5a6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 5cb:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 5cd:	31 f6                	xor    %esi,%esi
 5cf:	eb d5                	jmp    5a6 <itoa+0x76>
 5d1:	eb 0d                	jmp    5e0 <strcat>
 5d3:	90                   	nop
 5d4:	90                   	nop
 5d5:	90                   	nop
 5d6:	90                   	nop
 5d7:	90                   	nop
 5d8:	90                   	nop
 5d9:	90                   	nop
 5da:	90                   	nop
 5db:	90                   	nop
 5dc:	90                   	nop
 5dd:	90                   	nop
 5de:	90                   	nop
 5df:	90                   	nop

000005e0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	53                   	push   %ebx
 5e9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 5ec:	80 38 00             	cmpb   $0x0,(%eax)
 5ef:	74 38                	je     629 <strcat+0x49>
 5f1:	31 c9                	xor    %ecx,%ecx
 5f3:	90                   	nop
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5f8:	83 c1 01             	add    $0x1,%ecx
 5fb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 5ff:	89 ca                	mov    %ecx,%edx
 601:	75 f5                	jne    5f8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 603:	0f b6 1e             	movzbl (%esi),%ebx
 606:	84 db                	test   %bl,%bl
 608:	74 16                	je     620 <strcat+0x40>
 60a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 60d:	31 d2                	xor    %edx,%edx
 60f:	90                   	nop
                dest[i + j] = source[j];
 610:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 613:	83 c2 01             	add    $0x1,%edx
 616:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 61a:	84 db                	test   %bl,%bl
 61c:	75 f2                	jne    610 <strcat+0x30>
 61e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 620:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 624:	5b                   	pop    %ebx
 625:	5e                   	pop    %esi
 626:	5f                   	pop    %edi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 629:	31 d2                	xor    %edx,%edx
 62b:	31 c9                	xor    %ecx,%ecx
 62d:	eb d4                	jmp    603 <strcat+0x23>
 62f:	90                   	nop

00000630 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 639:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 63c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 63f:	0f b6 00             	movzbl (%eax),%eax
 642:	84 c0                	test   %al,%al
 644:	88 45 f3             	mov    %al,-0xd(%ebp)
 647:	0f 84 a0 00 00 00    	je     6ed <strstr+0xbd>
 64d:	8b 55 0c             	mov    0xc(%ebp),%edx
 650:	31 c0                	xor    %eax,%eax
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 658:	83 c0 01             	add    $0x1,%eax
 65b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 65f:	75 f7                	jne    658 <strstr+0x28>
 661:	89 45 e8             	mov    %eax,-0x18(%ebp)
 664:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 667:	0f b6 07             	movzbl (%edi),%eax
 66a:	84 c0                	test   %al,%al
 66c:	74 68                	je     6d6 <strstr+0xa6>
 66e:	31 d2                	xor    %edx,%edx
 670:	83 c2 01             	add    $0x1,%edx
 673:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 677:	75 f7                	jne    670 <strstr+0x40>
 679:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 67c:	84 c0                	test   %al,%al
 67e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 681:	74 4d                	je     6d0 <strstr+0xa0>
 683:	90                   	nop
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 688:	38 45 f3             	cmp    %al,-0xd(%ebp)
 68b:	75 34                	jne    6c1 <strstr+0x91>
 68d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 690:	83 eb 01             	sub    $0x1,%ebx
 693:	74 4b                	je     6e0 <strstr+0xb0>
 695:	8b 55 0c             	mov    0xc(%ebp),%edx
 698:	89 f8                	mov    %edi,%eax
 69a:	eb 10                	jmp    6ac <strstr+0x7c>
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6a0:	3a 4a 01             	cmp    0x1(%edx),%cl
 6a3:	75 1c                	jne    6c1 <strstr+0x91>
 6a5:	83 eb 01             	sub    $0x1,%ebx
 6a8:	89 f2                	mov    %esi,%edx
 6aa:	74 34                	je     6e0 <strstr+0xb0>
    p++, q++;
 6ac:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 6af:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 6b2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 6b5:	84 c9                	test   %cl,%cl
 6b7:	75 e7                	jne    6a0 <strstr+0x70>
 6b9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 6bd:	84 c0                	test   %al,%al
 6bf:	74 1f                	je     6e0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 6c1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 6c4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 6c7:	74 0d                	je     6d6 <strstr+0xa6>
 6c9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 6cc:	84 c0                	test   %al,%al
 6ce:	75 b8                	jne    688 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 6d0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 6d4:	eb e7                	jmp    6bd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 6d6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 6d9:	31 c0                	xor    %eax,%eax
}
 6db:	5b                   	pop    %ebx
 6dc:	5e                   	pop    %esi
 6dd:	5f                   	pop    %edi
 6de:	5d                   	pop    %ebp
 6df:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 6e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 6e3:	83 c4 10             	add    $0x10,%esp
 6e6:	5b                   	pop    %ebx
 6e7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 6e8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 6ea:	5f                   	pop    %edi
 6eb:	5d                   	pop    %ebp
 6ec:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 6ed:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 6f4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 6fb:	e9 67 ff ff ff       	jmp    667 <strstr+0x37>

00000700 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 700:	b8 01 00 00 00       	mov    $0x1,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <exit>:
SYSCALL(exit)
 708:	b8 02 00 00 00       	mov    $0x2,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <wait>:
SYSCALL(wait)
 710:	b8 03 00 00 00       	mov    $0x3,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <pipe>:
SYSCALL(pipe)
 718:	b8 04 00 00 00       	mov    $0x4,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <read>:
SYSCALL(read)
 720:	b8 05 00 00 00       	mov    $0x5,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <write>:
SYSCALL(write)
 728:	b8 10 00 00 00       	mov    $0x10,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <close>:
SYSCALL(close)
 730:	b8 15 00 00 00       	mov    $0x15,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <kill>:
SYSCALL(kill)
 738:	b8 06 00 00 00       	mov    $0x6,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <exec>:
SYSCALL(exec)
 740:	b8 07 00 00 00       	mov    $0x7,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <open>:
SYSCALL(open)
 748:	b8 0f 00 00 00       	mov    $0xf,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <mknod>:
SYSCALL(mknod)
 750:	b8 11 00 00 00       	mov    $0x11,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <unlink>:
SYSCALL(unlink)
 758:	b8 12 00 00 00       	mov    $0x12,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <fstat>:
SYSCALL(fstat)
 760:	b8 08 00 00 00       	mov    $0x8,%eax
 765:	cd 40                	int    $0x40
 767:	c3                   	ret    

00000768 <link>:
SYSCALL(link)
 768:	b8 13 00 00 00       	mov    $0x13,%eax
 76d:	cd 40                	int    $0x40
 76f:	c3                   	ret    

00000770 <mkdir>:
SYSCALL(mkdir)
 770:	b8 14 00 00 00       	mov    $0x14,%eax
 775:	cd 40                	int    $0x40
 777:	c3                   	ret    

00000778 <chdir>:
SYSCALL(chdir)
 778:	b8 09 00 00 00       	mov    $0x9,%eax
 77d:	cd 40                	int    $0x40
 77f:	c3                   	ret    

00000780 <dup>:
SYSCALL(dup)
 780:	b8 0a 00 00 00       	mov    $0xa,%eax
 785:	cd 40                	int    $0x40
 787:	c3                   	ret    

00000788 <getpid>:
SYSCALL(getpid)
 788:	b8 0b 00 00 00       	mov    $0xb,%eax
 78d:	cd 40                	int    $0x40
 78f:	c3                   	ret    

00000790 <sbrk>:
SYSCALL(sbrk)
 790:	b8 0c 00 00 00       	mov    $0xc,%eax
 795:	cd 40                	int    $0x40
 797:	c3                   	ret    

00000798 <sleep>:
SYSCALL(sleep)
 798:	b8 0d 00 00 00       	mov    $0xd,%eax
 79d:	cd 40                	int    $0x40
 79f:	c3                   	ret    

000007a0 <uptime>:
SYSCALL(uptime)
 7a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 7a5:	cd 40                	int    $0x40
 7a7:	c3                   	ret    

000007a8 <mount>:
SYSCALL(mount)
 7a8:	b8 16 00 00 00       	mov    $0x16,%eax
 7ad:	cd 40                	int    $0x40
 7af:	c3                   	ret    

000007b0 <umount>:
SYSCALL(umount)
 7b0:	b8 17 00 00 00       	mov    $0x17,%eax
 7b5:	cd 40                	int    $0x40
 7b7:	c3                   	ret    

000007b8 <printmounts>:
SYSCALL(printmounts)
 7b8:	b8 18 00 00 00       	mov    $0x18,%eax
 7bd:	cd 40                	int    $0x40
 7bf:	c3                   	ret    

000007c0 <printdevices>:
SYSCALL(printdevices)
 7c0:	b8 19 00 00 00       	mov    $0x19,%eax
 7c5:	cd 40                	int    $0x40
 7c7:	c3                   	ret    

000007c8 <unshare>:
SYSCALL(unshare)
 7c8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 7cd:	cd 40                	int    $0x40
 7cf:	c3                   	ret    

000007d0 <usleep>:
SYSCALL(usleep)
 7d0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 7d5:	cd 40                	int    $0x40
 7d7:	c3                   	ret    

000007d8 <ioctl>:
SYSCALL(ioctl)
 7d8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 7dd:	cd 40                	int    $0x40
 7df:	c3                   	ret    

000007e0 <getppid>:
SYSCALL(getppid)
 7e0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 7e5:	cd 40                	int    $0x40
 7e7:	c3                   	ret    

000007e8 <getcpu>:
SYSCALL(getcpu)
 7e8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 7ed:	cd 40                	int    $0x40
 7ef:	c3                   	ret    

000007f0 <getmem>:
SYSCALL(getmem)
 7f0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 7f5:	cd 40                	int    $0x40
 7f7:	c3                   	ret    

000007f8 <kmemtest>:
SYSCALL(kmemtest)
 7f8:	b8 20 00 00 00       	mov    $0x20,%eax
 7fd:	cd 40                	int    $0x40
 7ff:	c3                   	ret    

00000800 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 809:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 80c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 80f:	85 db                	test   %ebx,%ebx
 811:	0f 84 91 00 00 00    	je     8a8 <printint+0xa8>
 817:	89 d0                	mov    %edx,%eax
 819:	c1 e8 1f             	shr    $0x1f,%eax
 81c:	84 c0                	test   %al,%al
 81e:	0f 84 84 00 00 00    	je     8a8 <printint+0xa8>
    neg = 1;
    x = -xx;
 824:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 826:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 82d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 82f:	31 ff                	xor    %edi,%edi
 831:	8d 75 c7             	lea    -0x39(%ebp),%esi
 834:	eb 0c                	jmp    842 <printint+0x42>
 836:	8d 76 00             	lea    0x0(%esi),%esi
 839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 840:	89 df                	mov    %ebx,%edi
 842:	31 d2                	xor    %edx,%edx
 844:	8d 5f 01             	lea    0x1(%edi),%ebx
 847:	f7 f1                	div    %ecx
 849:	0f b6 92 4c 0e 00 00 	movzbl 0xe4c(%edx),%edx
  }while((x /= base) != 0);
 850:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 852:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 855:	75 e9                	jne    840 <printint+0x40>
  if(neg)
 857:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 85a:	85 c0                	test   %eax,%eax
 85c:	74 08                	je     866 <printint+0x66>
    buf[i++] = '-';
 85e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 863:	8d 5f 02             	lea    0x2(%edi),%ebx
 866:	8d 7d d8             	lea    -0x28(%ebp),%edi
 869:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 86d:	89 fa                	mov    %edi,%edx
 86f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 870:	0f b6 08             	movzbl (%eax),%ecx
 873:	83 e8 01             	sub    $0x1,%eax
 876:	83 c2 01             	add    $0x1,%edx
 879:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 87c:	39 f0                	cmp    %esi,%eax
 87e:	75 f0                	jne    870 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 880:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 883:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 888:	57                   	push   %edi
 889:	e8 f2 fa ff ff       	call   380 <strlen>
 88e:	83 c4 0c             	add    $0xc,%esp
 891:	50                   	push   %eax
 892:	57                   	push   %edi
 893:	ff 75 c0             	pushl  -0x40(%ebp)
 896:	e8 8d fe ff ff       	call   728 <write>
}
 89b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89e:	5b                   	pop    %ebx
 89f:	5e                   	pop    %esi
 8a0:	5f                   	pop    %edi
 8a1:	5d                   	pop    %ebp
 8a2:	c3                   	ret    
 8a3:	90                   	nop
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 8a8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 8aa:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 8b1:	e9 79 ff ff ff       	jmp    82f <printint+0x2f>
 8b6:	8d 76 00             	lea    0x0(%esi),%esi
 8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	57                   	push   %edi
 8c4:	56                   	push   %esi
 8c5:	53                   	push   %ebx
 8c6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 8cc:	0f b6 06             	movzbl (%esi),%eax
 8cf:	84 c0                	test   %al,%al
 8d1:	0f 84 90 01 00 00    	je     a67 <printf+0x1a7>
 8d7:	8d 5d 10             	lea    0x10(%ebp),%ebx
 8da:	31 ff                	xor    %edi,%edi
 8dc:	31 d2                	xor    %edx,%edx
 8de:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8e1:	31 db                	xor    %ebx,%ebx
 8e3:	eb 39                	jmp    91e <printf+0x5e>
 8e5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8e8:	83 f9 25             	cmp    $0x25,%ecx
 8eb:	0f 84 af 00 00 00    	je     9a0 <printf+0xe0>
 8f1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 8f4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 8f7:	83 ec 04             	sub    $0x4,%esp
 8fa:	6a 01                	push   $0x1
 8fc:	50                   	push   %eax
 8fd:	ff 75 08             	pushl  0x8(%ebp)
 900:	e8 23 fe ff ff       	call   728 <write>
 905:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 908:	85 c0                	test   %eax,%eax
 90a:	78 35                	js     941 <printf+0x81>
 90c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 90f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 912:	01 c7                	add    %eax,%edi
 914:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 916:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 91a:	84 c0                	test   %al,%al
 91c:	74 21                	je     93f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 91e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 921:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 923:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 926:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 929:	74 bd                	je     8e8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 92b:	83 fa 25             	cmp    $0x25,%edx
 92e:	74 20                	je     950 <printf+0x90>
 930:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 932:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 935:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 937:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 93b:	84 c0                	test   %al,%al
 93d:	75 df                	jne    91e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 93f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 941:	8d 65 f4             	lea    -0xc(%ebp),%esp
 944:	5b                   	pop    %ebx
 945:	5e                   	pop    %esi
 946:	5f                   	pop    %edi
 947:	5d                   	pop    %ebp
 948:	c3                   	ret    
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 950:	83 f9 64             	cmp    $0x64,%ecx
 953:	0f 84 7f 00 00 00    	je     9d8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 959:	0f be d0             	movsbl %al,%edx
 95c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 962:	83 fa 70             	cmp    $0x70,%edx
 965:	74 49                	je     9b0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 967:	83 f9 73             	cmp    $0x73,%ecx
 96a:	0f 84 98 00 00 00    	je     a08 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 970:	83 f9 63             	cmp    $0x63,%ecx
 973:	0f 84 c7 00 00 00    	je     a40 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 979:	83 f9 25             	cmp    $0x25,%ecx
 97c:	74 6a                	je     9e8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 97e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 981:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 984:	83 ec 04             	sub    $0x4,%esp
 987:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 989:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 98d:	50                   	push   %eax
 98e:	ff 75 08             	pushl  0x8(%ebp)
 991:	e8 92 fd ff ff       	call   728 <write>
 996:	83 c4 10             	add    $0x10,%esp
 999:	e9 6a ff ff ff       	jmp    908 <printf+0x48>
 99e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 9a0:	ba 25 00 00 00       	mov    $0x25,%edx
 9a5:	31 c0                	xor    %eax,%eax
 9a7:	eb 89                	jmp    932 <printf+0x72>
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 9b0:	83 ec 0c             	sub    $0xc,%esp
 9b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9b8:	6a 00                	push   $0x0
 9ba:	8b 75 d0             	mov    -0x30(%ebp),%esi
 9bd:	8b 45 08             	mov    0x8(%ebp),%eax
 9c0:	8b 16                	mov    (%esi),%edx
        ap++;
 9c2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 9c5:	e8 36 fe ff ff       	call   800 <printint>
        ap++;
 9ca:	89 75 d0             	mov    %esi,-0x30(%ebp)
 9cd:	83 c4 10             	add    $0x10,%esp
 9d0:	e9 33 ff ff ff       	jmp    908 <printf+0x48>
 9d5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 9d8:	83 ec 0c             	sub    $0xc,%esp
 9db:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9e0:	6a 01                	push   $0x1
 9e2:	eb d6                	jmp    9ba <printf+0xfa>
 9e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9e8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 9eb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 9ee:	83 ec 04             	sub    $0x4,%esp
 9f1:	6a 01                	push   $0x1
 9f3:	50                   	push   %eax
 9f4:	ff 75 08             	pushl  0x8(%ebp)
 9f7:	e8 2c fd ff ff       	call   728 <write>
 9fc:	83 c4 10             	add    $0x10,%esp
 9ff:	e9 04 ff ff ff       	jmp    908 <printf+0x48>
 a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 a08:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a0b:	8b 30                	mov    (%eax),%esi
        ap++;
 a0d:	83 c0 04             	add    $0x4,%eax
 a10:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 a13:	b8 44 0e 00 00       	mov    $0xe44,%eax
 a18:	85 f6                	test   %esi,%esi
 a1a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 a1d:	83 ec 0c             	sub    $0xc,%esp
 a20:	56                   	push   %esi
 a21:	e8 5a f9 ff ff       	call   380 <strlen>
 a26:	83 c4 0c             	add    $0xc,%esp
 a29:	50                   	push   %eax
 a2a:	56                   	push   %esi
 a2b:	ff 75 08             	pushl  0x8(%ebp)
 a2e:	e8 f5 fc ff ff       	call   728 <write>
 a33:	83 c4 10             	add    $0x10,%esp
 a36:	e9 cd fe ff ff       	jmp    908 <printf+0x48>
 a3b:	90                   	nop
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a40:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 a43:	83 ec 04             	sub    $0x4,%esp
 a46:	8b 06                	mov    (%esi),%eax
 a48:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 a4a:	83 c6 04             	add    $0x4,%esi
 a4d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 a50:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 a53:	50                   	push   %eax
 a54:	ff 75 08             	pushl  0x8(%ebp)
 a57:	e8 cc fc ff ff       	call   728 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 a5c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 a5f:	83 c4 10             	add    $0x10,%esp
 a62:	e9 a1 fe ff ff       	jmp    908 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 a67:	31 c0                	xor    %eax,%eax
 a69:	e9 d3 fe ff ff       	jmp    941 <printf+0x81>
 a6e:	66 90                	xchg   %ax,%ax

00000a70 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a70:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a71:	a1 00 20 00 00       	mov    0x2000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 a76:	89 e5                	mov    %esp,%ebp
 a78:	57                   	push   %edi
 a79:	56                   	push   %esi
 a7a:	53                   	push   %ebx
 a7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a7e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a80:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a83:	39 c8                	cmp    %ecx,%eax
 a85:	73 19                	jae    aa0 <free+0x30>
 a87:	89 f6                	mov    %esi,%esi
 a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 a90:	39 d1                	cmp    %edx,%ecx
 a92:	72 1c                	jb     ab0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a94:	39 d0                	cmp    %edx,%eax
 a96:	73 18                	jae    ab0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a98:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a9a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a9c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a9e:	72 f0                	jb     a90 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aa0:	39 d0                	cmp    %edx,%eax
 aa2:	72 f4                	jb     a98 <free+0x28>
 aa4:	39 d1                	cmp    %edx,%ecx
 aa6:	73 f0                	jae    a98 <free+0x28>
 aa8:	90                   	nop
 aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 ab0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ab3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ab6:	39 d7                	cmp    %edx,%edi
 ab8:	74 19                	je     ad3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 aba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 abd:	8b 50 04             	mov    0x4(%eax),%edx
 ac0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ac3:	39 f1                	cmp    %esi,%ecx
 ac5:	74 23                	je     aea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 ac7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 ac9:	a3 00 20 00 00       	mov    %eax,0x2000
}
 ace:	5b                   	pop    %ebx
 acf:	5e                   	pop    %esi
 ad0:	5f                   	pop    %edi
 ad1:	5d                   	pop    %ebp
 ad2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 ad3:	03 72 04             	add    0x4(%edx),%esi
 ad6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ad9:	8b 10                	mov    (%eax),%edx
 adb:	8b 12                	mov    (%edx),%edx
 add:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 ae0:	8b 50 04             	mov    0x4(%eax),%edx
 ae3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ae6:	39 f1                	cmp    %esi,%ecx
 ae8:	75 dd                	jne    ac7 <free+0x57>
    p->s.size += bp->s.size;
 aea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 aed:	a3 00 20 00 00       	mov    %eax,0x2000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 af2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 af5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 af8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 afa:	5b                   	pop    %ebx
 afb:	5e                   	pop    %esi
 afc:	5f                   	pop    %edi
 afd:	5d                   	pop    %ebp
 afe:	c3                   	ret    
 aff:	90                   	nop

00000b00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	57                   	push   %edi
 b04:	56                   	push   %esi
 b05:	53                   	push   %ebx
 b06:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b0c:	8b 15 00 20 00 00    	mov    0x2000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b12:	8d 78 07             	lea    0x7(%eax),%edi
 b15:	c1 ef 03             	shr    $0x3,%edi
 b18:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 b1b:	85 d2                	test   %edx,%edx
 b1d:	0f 84 a3 00 00 00    	je     bc6 <malloc+0xc6>
 b23:	8b 02                	mov    (%edx),%eax
 b25:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b28:	39 cf                	cmp    %ecx,%edi
 b2a:	76 74                	jbe    ba0 <malloc+0xa0>
 b2c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 b32:	be 00 10 00 00       	mov    $0x1000,%esi
 b37:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 b3e:	0f 43 f7             	cmovae %edi,%esi
 b41:	ba 00 80 00 00       	mov    $0x8000,%edx
 b46:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 b4c:	0f 46 da             	cmovbe %edx,%ebx
 b4f:	eb 10                	jmp    b61 <malloc+0x61>
 b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b5a:	8b 48 04             	mov    0x4(%eax),%ecx
 b5d:	39 cf                	cmp    %ecx,%edi
 b5f:	76 3f                	jbe    ba0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b61:	39 05 00 20 00 00    	cmp    %eax,0x2000
 b67:	89 c2                	mov    %eax,%edx
 b69:	75 ed                	jne    b58 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b6b:	83 ec 0c             	sub    $0xc,%esp
 b6e:	53                   	push   %ebx
 b6f:	e8 1c fc ff ff       	call   790 <sbrk>
  if(p == (char*)-1)
 b74:	83 c4 10             	add    $0x10,%esp
 b77:	83 f8 ff             	cmp    $0xffffffff,%eax
 b7a:	74 1c                	je     b98 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b7c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 b7f:	83 ec 0c             	sub    $0xc,%esp
 b82:	83 c0 08             	add    $0x8,%eax
 b85:	50                   	push   %eax
 b86:	e8 e5 fe ff ff       	call   a70 <free>
  return freep;
 b8b:	8b 15 00 20 00 00    	mov    0x2000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b91:	83 c4 10             	add    $0x10,%esp
 b94:	85 d2                	test   %edx,%edx
 b96:	75 c0                	jne    b58 <malloc+0x58>
        return 0;
 b98:	31 c0                	xor    %eax,%eax
 b9a:	eb 1c                	jmp    bb8 <malloc+0xb8>
 b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ba0:	39 cf                	cmp    %ecx,%edi
 ba2:	74 1c                	je     bc0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ba4:	29 f9                	sub    %edi,%ecx
 ba6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ba9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 baf:	89 15 00 20 00 00    	mov    %edx,0x2000
      return (void*)(p + 1);
 bb5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 bb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 bbb:	5b                   	pop    %ebx
 bbc:	5e                   	pop    %esi
 bbd:	5f                   	pop    %edi
 bbe:	5d                   	pop    %ebp
 bbf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 bc0:	8b 08                	mov    (%eax),%ecx
 bc2:	89 0a                	mov    %ecx,(%edx)
 bc4:	eb e9                	jmp    baf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 bc6:	c7 05 00 20 00 00 04 	movl   $0x2004,0x2000
 bcd:	20 00 00 
 bd0:	c7 05 04 20 00 00 04 	movl   $0x2004,0x2004
 bd7:	20 00 00 
    base.s.size = 0;
 bda:	b8 04 20 00 00       	mov    $0x2004,%eax
 bdf:	c7 05 08 20 00 00 00 	movl   $0x0,0x2008
 be6:	00 00 00 
 be9:	e9 3e ff ff ff       	jmp    b2c <malloc+0x2c>
 bee:	66 90                	xchg   %ax,%ax

00000bf0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 bf0:	55                   	push   %ebp
 bf1:	89 e5                	mov    %esp,%ebp
 bf3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 bf6:	6a 10                	push   $0x10
 bf8:	6a 02                	push   $0x2
 bfa:	ff 75 08             	pushl  0x8(%ebp)
 bfd:	e8 d6 fb ff ff       	call   7d8 <ioctl>
}
 c02:	c9                   	leave  
 c03:	c3                   	ret    
 c04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 c0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c10 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 c10:	55                   	push   %ebp
 c11:	89 e5                	mov    %esp,%ebp
 c13:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 c16:	68 00 10 00 00       	push   $0x1000
 c1b:	6a 02                	push   $0x2
 c1d:	ff 75 08             	pushl  0x8(%ebp)
 c20:	e8 b3 fb ff ff       	call   7d8 <ioctl>
}
 c25:	c9                   	leave  
 c26:	c3                   	ret    
 c27:	89 f6                	mov    %esi,%esi
 c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c30 <attach_tty>:

int
attach_tty(int tty_fd)
{
 c30:	55                   	push   %ebp
 c31:	89 e5                	mov    %esp,%ebp
 c33:	53                   	push   %ebx
 c34:	83 ec 08             	sub    $0x8,%esp
 c37:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 c3a:	6a 10                	push   $0x10
 c3c:	6a 01                	push   $0x1
 c3e:	53                   	push   %ebx
 c3f:	e8 94 fb ff ff       	call   7d8 <ioctl>
 c44:	83 c4 10             	add    $0x10,%esp
 c47:	85 c0                	test   %eax,%eax
 c49:	78 55                	js     ca0 <attach_tty+0x70>
     return -1;

    close(0);
 c4b:	83 ec 0c             	sub    $0xc,%esp
 c4e:	6a 00                	push   $0x0
 c50:	e8 db fa ff ff       	call   730 <close>
    close(1);
 c55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c5c:	e8 cf fa ff ff       	call   730 <close>
    close(2);
 c61:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c68:	e8 c3 fa ff ff       	call   730 <close>
    if(dup(tty_fd) < 0)
 c6d:	89 1c 24             	mov    %ebx,(%esp)
 c70:	e8 0b fb ff ff       	call   780 <dup>
 c75:	83 c4 10             	add    $0x10,%esp
 c78:	85 c0                	test   %eax,%eax
 c7a:	78 24                	js     ca0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 c7c:	83 ec 0c             	sub    $0xc,%esp
 c7f:	53                   	push   %ebx
 c80:	e8 fb fa ff ff       	call   780 <dup>
 c85:	83 c4 10             	add    $0x10,%esp
 c88:	85 c0                	test   %eax,%eax
 c8a:	78 14                	js     ca0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 c8c:	83 ec 0c             	sub    $0xc,%esp
 c8f:	53                   	push   %ebx
 c90:	e8 eb fa ff ff       	call   780 <dup>
 c95:	83 c4 10             	add    $0x10,%esp
 c98:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 c9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 c9e:	c9                   	leave  
 c9f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 ca5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ca8:	c9                   	leave  
 ca9:	c3                   	ret    
 caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000cb0 <detach_tty>:

int
detach_tty(int tty_fd)
{
 cb0:	55                   	push   %ebp
 cb1:	89 e5                	mov    %esp,%ebp
 cb3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 cb6:	6a 20                	push   $0x20
 cb8:	6a 01                	push   $0x1
 cba:	ff 75 08             	pushl  0x8(%ebp)
 cbd:	e8 16 fb ff ff       	call   7d8 <ioctl>
    return 0;
}
 cc2:	31 c0                	xor    %eax,%eax
 cc4:	c9                   	leave  
 cc5:	c3                   	ret    
 cc6:	8d 76 00             	lea    0x0(%esi),%esi
 cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <connect_tty>:


int
connect_tty(int tty_fd)
{
 cd0:	55                   	push   %ebp
 cd1:	89 e5                	mov    %esp,%ebp
 cd3:	53                   	push   %ebx
 cd4:	83 ec 08             	sub    $0x8,%esp
 cd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 cda:	6a 10                	push   $0x10
 cdc:	6a 02                	push   $0x2
 cde:	53                   	push   %ebx
 cdf:	e8 f4 fa ff ff       	call   7d8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 ce4:	83 c4 10             	add    $0x10,%esp
 ce7:	85 c0                	test   %eax,%eax
 ce9:	74 1d                	je     d08 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 ceb:	83 ec 04             	sub    $0x4,%esp
 cee:	68 00 10 00 00       	push   $0x1000
 cf3:	6a 01                	push   $0x1
 cf5:	53                   	push   %ebx
 cf6:	e8 dd fa ff ff       	call   7d8 <ioctl>
     return tty_fd;
 cfb:	83 c4 10             	add    $0x10,%esp
 cfe:	89 d8                	mov    %ebx,%eax
}
 d00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 d03:	c9                   	leave  
 d04:	c3                   	ret    
 d05:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 d08:	83 ec 0c             	sub    $0xc,%esp
 d0b:	53                   	push   %ebx
 d0c:	e8 1f fa ff ff       	call   730 <close>
       return -1;
 d11:	83 c4 10             	add    $0x10,%esp
 d14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d19:	eb e5                	jmp    d00 <connect_tty+0x30>
 d1b:	90                   	nop
 d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d20 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 d20:	55                   	push   %ebp
 d21:	89 e5                	mov    %esp,%ebp
 d23:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 d26:	68 00 20 00 00       	push   $0x2000
 d2b:	6a 01                	push   $0x1
 d2d:	ff 75 08             	pushl  0x8(%ebp)
 d30:	e8 a3 fa ff ff       	call   7d8 <ioctl>
}
 d35:	c9                   	leave  
 d36:	c3                   	ret    
