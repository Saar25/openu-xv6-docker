
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "fs.h"
#include "param.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   8:	83 ec 0c             	sub    $0xc,%esp
   b:	53                   	push   %ebx
   c:	e8 ff 05 00 00       	call   610 <strlen>
  11:	83 c4 10             	add    $0x10,%esp
  14:	01 d8                	add    %ebx,%eax
  16:	73 0f                	jae    27 <fmtname+0x27>
  18:	eb 12                	jmp    2c <fmtname+0x2c>
  1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  20:	83 e8 01             	sub    $0x1,%eax
  23:	39 c3                	cmp    %eax,%ebx
  25:	77 05                	ja     2c <fmtname+0x2c>
  27:	80 38 2f             	cmpb   $0x2f,(%eax)
  2a:	75 f4                	jne    20 <fmtname+0x20>
    ;
  p++;
  2c:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  2f:	83 ec 0c             	sub    $0xc,%esp
  32:	53                   	push   %ebx
  33:	e8 d8 05 00 00       	call   610 <strlen>
  38:	83 c4 10             	add    $0x10,%esp
  3b:	83 f8 0d             	cmp    $0xd,%eax
  3e:	77 4a                	ja     8a <fmtname+0x8a>
    return p;
  memmove(buf, p, strlen(p));
  40:	83 ec 0c             	sub    $0xc,%esp
  43:	53                   	push   %ebx
  44:	e8 c7 05 00 00       	call   610 <strlen>
  49:	83 c4 0c             	add    $0xc,%esp
  4c:	50                   	push   %eax
  4d:	53                   	push   %ebx
  4e:	68 00 20 00 00       	push   $0x2000
  53:	e8 38 07 00 00       	call   790 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  58:	89 1c 24             	mov    %ebx,(%esp)
  5b:	e8 b0 05 00 00       	call   610 <strlen>
  60:	89 1c 24             	mov    %ebx,(%esp)
  63:	89 c6                	mov    %eax,%esi
  return buf;
  65:	bb 00 20 00 00       	mov    $0x2000,%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6a:	e8 a1 05 00 00       	call   610 <strlen>
  6f:	ba 0e 00 00 00       	mov    $0xe,%edx
  74:	83 c4 0c             	add    $0xc,%esp
  77:	05 00 20 00 00       	add    $0x2000,%eax
  7c:	29 f2                	sub    %esi,%edx
  7e:	52                   	push   %edx
  7f:	6a 20                	push   $0x20
  81:	50                   	push   %eax
  82:	e8 b9 05 00 00       	call   640 <memset>
  return buf;
  87:	83 c4 10             	add    $0x10,%esp
}
  8a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8d:	89 d8                	mov    %ebx,%eax
  8f:	5b                   	pop    %ebx
  90:	5e                   	pop    %esi
  91:	5d                   	pop    %ebp
  92:	c3                   	ret    
  93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000a0 <ls>:

void
ls(char *path)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  a6:	81 ec a4 02 00 00    	sub    $0x2a4,%esp
  ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int fd;
  struct dirent de;
  struct stat st;
  char cg_file_name[MAX_CGROUP_FILE_NAME_LENGTH];

  if((fd = open(path, 0)) < 0){
  af:	6a 00                	push   $0x0
  b1:	53                   	push   %ebx
  b2:	e8 21 09 00 00       	call   9d8 <open>
  b7:	83 c4 10             	add    $0x10,%esp
  ba:	85 c0                	test   %eax,%eax
  bc:	0f 88 8e 01 00 00    	js     250 <ls+0x1b0>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  c2:	8d bd 94 fd ff ff    	lea    -0x26c(%ebp),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	89 c6                	mov    %eax,%esi
  cd:	57                   	push   %edi
  ce:	50                   	push   %eax
  cf:	e8 1c 09 00 00       	call   9f0 <fstat>
  d4:	83 c4 10             	add    $0x10,%esp
  d7:	85 c0                	test   %eax,%eax
  d9:	0f 88 71 03 00 00    	js     450 <ls+0x3b0>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  df:	0f b7 85 94 fd ff ff 	movzwl -0x26c(%ebp),%eax
  e6:	66 83 f8 02          	cmp    $0x2,%ax
  ea:	0f 84 00 03 00 00    	je     3f0 <ls+0x350>
  f0:	0f 8e 7a 01 00 00    	jle    270 <ls+0x1d0>
  f6:	66 83 f8 04          	cmp    $0x4,%ax
  fa:	0f 84 98 02 00 00    	je     398 <ls+0x2f8>
 100:	66 83 f8 05          	cmp    $0x5,%ax
 104:	0f 85 b2 02 00 00    	jne    3bc <ls+0x31c>
  case T_CGFILE:
    printf(1, "%s %d %d\n", fmtname(path), st.type, st.size);
    break;

  case T_CGDIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 10a:	83 ec 0c             	sub    $0xc,%esp
 10d:	53                   	push   %ebx
 10e:	e8 fd 04 00 00       	call   610 <strlen>
 113:	83 c0 10             	add    $0x10,%eax
 116:	83 c4 10             	add    $0x10,%esp
 119:	3d 00 02 00 00       	cmp    $0x200,%eax
 11e:	0f 87 0c 03 00 00    	ja     430 <ls+0x390>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
 124:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 12a:	83 ec 08             	sub    $0x8,%esp
 12d:	53                   	push   %ebx
 12e:	50                   	push   %eax
 12f:	89 c3                	mov    %eax,%ebx
 131:	89 85 74 fd ff ff    	mov    %eax,-0x28c(%ebp)
 137:	e8 c4 03 00 00       	call   500 <strcpy>
    p = buf + strlen(buf);
 13c:	89 1c 24             	mov    %ebx,(%esp)
 13f:	e8 cc 04 00 00       	call   610 <strlen>
 144:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    *p++ = '/';
 147:	8d 5c 03 01          	lea    0x1(%ebx,%eax,1),%ebx
    while(read(fd, cg_file_name, sizeof(cg_file_name)) == MAX_CGROUP_FILE_NAME_LENGTH && cg_file_name[0] != ' '){
 14b:	83 c4 10             	add    $0x10,%esp
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf + strlen(buf);
 14e:	89 95 68 fd ff ff    	mov    %edx,-0x298(%ebp)
    *p++ = '/';
 154:	c6 02 2f             	movb   $0x2f,(%edx)
 157:	89 f6                	mov    %esi,%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    while(read(fd, cg_file_name, sizeof(cg_file_name)) == MAX_CGROUP_FILE_NAME_LENGTH && cg_file_name[0] != ' '){
 160:	8d 85 a8 fd ff ff    	lea    -0x258(%ebp),%eax
 166:	83 ec 04             	sub    $0x4,%esp
 169:	6a 40                	push   $0x40
 16b:	50                   	push   %eax
 16c:	56                   	push   %esi
 16d:	e8 3e 08 00 00       	call   9b0 <read>
 172:	83 c4 10             	add    $0x10,%esp
 175:	83 f8 40             	cmp    $0x40,%eax
 178:	0f 85 3e 02 00 00    	jne    3bc <ls+0x31c>
 17e:	80 bd a8 fd ff ff 20 	cmpb   $0x20,-0x258(%ebp)
 185:	0f 84 31 02 00 00    	je     3bc <ls+0x31c>
      memmove(p, cg_file_name, MAX_CGROUP_FILE_NAME_LENGTH);
 18b:	8d 85 a8 fd ff ff    	lea    -0x258(%ebp),%eax
 191:	83 ec 04             	sub    $0x4,%esp
 194:	6a 40                	push   $0x40
 196:	50                   	push   %eax
 197:	53                   	push   %ebx
 198:	e8 f3 05 00 00       	call   790 <memmove>
      p[MAX_CGROUP_FILE_NAME_LENGTH] = 0;
 19d:	8b 85 68 fd ff ff    	mov    -0x298(%ebp),%eax
      int i = MAX_CGROUP_FILE_NAME_LENGTH - 1;
      while (p[i] == ' ')
 1a3:	83 c4 10             	add    $0x10,%esp
    strcpy(buf, path);
    p = buf + strlen(buf);
    *p++ = '/';
    while(read(fd, cg_file_name, sizeof(cg_file_name)) == MAX_CGROUP_FILE_NAME_LENGTH && cg_file_name[0] != ' '){
      memmove(p, cg_file_name, MAX_CGROUP_FILE_NAME_LENGTH);
      p[MAX_CGROUP_FILE_NAME_LENGTH] = 0;
 1a6:	c6 40 41 00          	movb   $0x0,0x41(%eax)
      int i = MAX_CGROUP_FILE_NAME_LENGTH - 1;
      while (p[i] == ' ')
 1aa:	80 7b 3f 20          	cmpb   $0x20,0x3f(%ebx)
 1ae:	0f 85 bc 02 00 00    	jne    470 <ls+0x3d0>
 1b4:	b8 3f 00 00 00       	mov    $0x3f,%eax
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          i--;
 1c0:	83 e8 01             	sub    $0x1,%eax
    *p++ = '/';
    while(read(fd, cg_file_name, sizeof(cg_file_name)) == MAX_CGROUP_FILE_NAME_LENGTH && cg_file_name[0] != ' '){
      memmove(p, cg_file_name, MAX_CGROUP_FILE_NAME_LENGTH);
      p[MAX_CGROUP_FILE_NAME_LENGTH] = 0;
      int i = MAX_CGROUP_FILE_NAME_LENGTH - 1;
      while (p[i] == ' ')
 1c3:	80 3c 03 20          	cmpb   $0x20,(%ebx,%eax,1)
 1c7:	74 f7                	je     1c0 <ls+0x120>
 1c9:	83 c0 01             	add    $0x1,%eax
          i--;
      p[i + 1] = 0;
 1cc:	8d 14 03             	lea    (%ebx,%eax,1),%edx
      if(stat(buf, &st) < 0){
 1cf:	83 ec 08             	sub    $0x8,%esp
      memmove(p, cg_file_name, MAX_CGROUP_FILE_NAME_LENGTH);
      p[MAX_CGROUP_FILE_NAME_LENGTH] = 0;
      int i = MAX_CGROUP_FILE_NAME_LENGTH - 1;
      while (p[i] == ' ')
          i--;
      p[i + 1] = 0;
 1d2:	c6 02 00             	movb   $0x0,(%edx)
      if(stat(buf, &st) < 0){
 1d5:	57                   	push   %edi
 1d6:	ff b5 74 fd ff ff    	pushl  -0x28c(%ebp)
      memmove(p, cg_file_name, MAX_CGROUP_FILE_NAME_LENGTH);
      p[MAX_CGROUP_FILE_NAME_LENGTH] = 0;
      int i = MAX_CGROUP_FILE_NAME_LENGTH - 1;
      while (p[i] == ' ')
          i--;
      p[i + 1] = 0;
 1dc:	89 95 70 fd ff ff    	mov    %edx,-0x290(%ebp)
      if(stat(buf, &st) < 0){
 1e2:	e8 19 05 00 00       	call   700 <stat>
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	85 c0                	test   %eax,%eax
 1ec:	8b 95 70 fd ff ff    	mov    -0x290(%ebp),%edx
 1f2:	0f 88 d8 01 00 00    	js     3d0 <ls+0x330>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      p[i + 1] = ' ';
 1f8:	c6 02 20             	movb   $0x20,(%edx)
      printf(1, "%s %d %d\n", fmtname(buf), st.type, st.size);
 1fb:	0f bf 95 94 fd ff ff 	movswl -0x26c(%ebp),%edx
 202:	83 ec 0c             	sub    $0xc,%esp
 205:	8b 8d a4 fd ff ff    	mov    -0x25c(%ebp),%ecx
 20b:	ff b5 74 fd ff ff    	pushl  -0x28c(%ebp)
 211:	89 8d 6c fd ff ff    	mov    %ecx,-0x294(%ebp)
 217:	89 95 70 fd ff ff    	mov    %edx,-0x290(%ebp)
 21d:	e8 de fd ff ff       	call   0 <fmtname>
 222:	8b 8d 6c fd ff ff    	mov    -0x294(%ebp),%ecx
 228:	8b 95 70 fd ff ff    	mov    -0x290(%ebp),%edx
 22e:	89 0c 24             	mov    %ecx,(%esp)
 231:	52                   	push   %edx
 232:	50                   	push   %eax
 233:	68 10 10 00 00       	push   $0x1010
 238:	6a 01                	push   $0x1
 23a:	e8 11 09 00 00       	call   b50 <printf>
 23f:	83 c4 20             	add    $0x20,%esp
 242:	e9 19 ff ff ff       	jmp    160 <ls+0xc0>
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct dirent de;
  struct stat st;
  char cg_file_name[MAX_CGROUP_FILE_NAME_LENGTH];

  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	53                   	push   %ebx
 254:	68 c8 0f 00 00       	push   $0xfc8
 259:	6a 02                	push   $0x2
 25b:	e8 f0 08 00 00       	call   b50 <printf>
    return;
 260:	83 c4 10             	add    $0x10,%esp
      printf(1, "%s %d %d\n", fmtname(buf), st.type, st.size);
    }
    break;
  }
  close(fd);
}
 263:	8d 65 f4             	lea    -0xc(%ebp),%esp
 266:	5b                   	pop    %ebx
 267:	5e                   	pop    %esi
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	90                   	nop
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
 270:	66 83 f8 01          	cmp    $0x1,%ax
 274:	0f 85 42 01 00 00    	jne    3bc <ls+0x31c>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 27a:	83 ec 0c             	sub    $0xc,%esp
 27d:	53                   	push   %ebx
 27e:	e8 8d 03 00 00       	call   610 <strlen>
 283:	83 c0 10             	add    $0x10,%eax
 286:	83 c4 10             	add    $0x10,%esp
 289:	3d 00 02 00 00       	cmp    $0x200,%eax
 28e:	0f 87 9c 01 00 00    	ja     430 <ls+0x390>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
 294:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 29a:	83 ec 08             	sub    $0x8,%esp
 29d:	53                   	push   %ebx
 29e:	50                   	push   %eax
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	89 85 74 fd ff ff    	mov    %eax,-0x28c(%ebp)
 2a7:	e8 54 02 00 00       	call   500 <strcpy>
    p = buf+strlen(buf);
 2ac:	89 1c 24             	mov    %ebx,(%esp)
 2af:	e8 5c 03 00 00       	call   610 <strlen>
 2b4:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    *p++ = '/';
 2b7:	8d 44 03 01          	lea    0x1(%ebx,%eax,1),%eax
 2bb:	8d 9d 84 fd ff ff    	lea    -0x27c(%ebp),%ebx
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c1:	83 c4 10             	add    $0x10,%esp
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
 2c4:	89 95 64 fd ff ff    	mov    %edx,-0x29c(%ebp)
    *p++ = '/';
 2ca:	89 85 60 fd ff ff    	mov    %eax,-0x2a0(%ebp)
 2d0:	c6 02 2f             	movb   $0x2f,(%edx)
 2d3:	90                   	nop
 2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2d8:	83 ec 04             	sub    $0x4,%esp
 2db:	6a 10                	push   $0x10
 2dd:	53                   	push   %ebx
 2de:	56                   	push   %esi
 2df:	e8 cc 06 00 00       	call   9b0 <read>
 2e4:	83 c4 10             	add    $0x10,%esp
 2e7:	83 f8 10             	cmp    $0x10,%eax
 2ea:	0f 85 cc 00 00 00    	jne    3bc <ls+0x31c>
      if(de.inum == 0)
 2f0:	66 83 bd 84 fd ff ff 	cmpw   $0x0,-0x27c(%ebp)
 2f7:	00 
 2f8:	74 de                	je     2d8 <ls+0x238>
        continue;
      memmove(p, de.name, DIRSIZ);
 2fa:	8d 85 86 fd ff ff    	lea    -0x27a(%ebp),%eax
 300:	83 ec 04             	sub    $0x4,%esp
 303:	6a 0e                	push   $0xe
 305:	50                   	push   %eax
 306:	ff b5 60 fd ff ff    	pushl  -0x2a0(%ebp)
 30c:	e8 7f 04 00 00       	call   790 <memmove>
      p[DIRSIZ] = 0;
 311:	8b 85 64 fd ff ff    	mov    -0x29c(%ebp),%eax
 317:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 31b:	58                   	pop    %eax
 31c:	5a                   	pop    %edx
 31d:	57                   	push   %edi
 31e:	ff b5 74 fd ff ff    	pushl  -0x28c(%ebp)
 324:	e8 d7 03 00 00       	call   700 <stat>
 329:	83 c4 10             	add    $0x10,%esp
 32c:	85 c0                	test   %eax,%eax
 32e:	0f 88 46 01 00 00    	js     47a <ls+0x3da>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 334:	0f bf 85 94 fd ff ff 	movswl -0x26c(%ebp),%eax
 33b:	8b 8d a4 fd ff ff    	mov    -0x25c(%ebp),%ecx
 341:	83 ec 0c             	sub    $0xc,%esp
 344:	8b 95 9c fd ff ff    	mov    -0x264(%ebp),%edx
 34a:	ff b5 74 fd ff ff    	pushl  -0x28c(%ebp)
 350:	89 8d 68 fd ff ff    	mov    %ecx,-0x298(%ebp)
 356:	89 95 6c fd ff ff    	mov    %edx,-0x294(%ebp)
 35c:	89 85 70 fd ff ff    	mov    %eax,-0x290(%ebp)
 362:	e8 99 fc ff ff       	call   0 <fmtname>
 367:	5a                   	pop    %edx
 368:	8b 95 6c fd ff ff    	mov    -0x294(%ebp),%edx
 36e:	59                   	pop    %ecx
 36f:	8b 8d 68 fd ff ff    	mov    -0x298(%ebp),%ecx
 375:	51                   	push   %ecx
 376:	52                   	push   %edx
 377:	ff b5 70 fd ff ff    	pushl  -0x290(%ebp)
 37d:	50                   	push   %eax
 37e:	68 f0 0f 00 00       	push   $0xff0
 383:	6a 01                	push   $0x1
 385:	e8 c6 07 00 00       	call   b50 <printf>
 38a:	83 c4 20             	add    $0x20,%esp
 38d:	e9 46 ff ff ff       	jmp    2d8 <ls+0x238>
 392:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    break;

  case T_CGFILE:
    printf(1, "%s %d %d\n", fmtname(path), st.type, st.size);
 398:	83 ec 0c             	sub    $0xc,%esp
 39b:	8b bd a4 fd ff ff    	mov    -0x25c(%ebp),%edi
 3a1:	53                   	push   %ebx
 3a2:	e8 59 fc ff ff       	call   0 <fmtname>
 3a7:	89 3c 24             	mov    %edi,(%esp)
 3aa:	6a 04                	push   $0x4
 3ac:	50                   	push   %eax
 3ad:	68 10 10 00 00       	push   $0x1010
 3b2:	6a 01                	push   $0x1
 3b4:	e8 97 07 00 00       	call   b50 <printf>
    break;
 3b9:	83 c4 20             	add    $0x20,%esp
      p[i + 1] = ' ';
      printf(1, "%s %d %d\n", fmtname(buf), st.type, st.size);
    }
    break;
  }
  close(fd);
 3bc:	83 ec 0c             	sub    $0xc,%esp
 3bf:	56                   	push   %esi
 3c0:	e8 fb 05 00 00       	call   9c0 <close>
 3c5:	83 c4 10             	add    $0x10,%esp
}
 3c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cb:	5b                   	pop    %ebx
 3cc:	5e                   	pop    %esi
 3cd:	5f                   	pop    %edi
 3ce:	5d                   	pop    %ebp
 3cf:	c3                   	ret    
      int i = MAX_CGROUP_FILE_NAME_LENGTH - 1;
      while (p[i] == ' ')
          i--;
      p[i + 1] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
 3d0:	83 ec 04             	sub    $0x4,%esp
 3d3:	ff b5 74 fd ff ff    	pushl  -0x28c(%ebp)
 3d9:	68 dc 0f 00 00       	push   $0xfdc
 3de:	6a 01                	push   $0x1
 3e0:	e8 6b 07 00 00       	call   b50 <printf>
        continue;
 3e5:	83 c4 10             	add    $0x10,%esp
 3e8:	e9 73 fd ff ff       	jmp    160 <ls+0xc0>
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    return;
  }

  switch(st.type){
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 3f0:	83 ec 0c             	sub    $0xc,%esp
 3f3:	8b 95 a4 fd ff ff    	mov    -0x25c(%ebp),%edx
 3f9:	8b bd 9c fd ff ff    	mov    -0x264(%ebp),%edi
 3ff:	53                   	push   %ebx
 400:	89 95 74 fd ff ff    	mov    %edx,-0x28c(%ebp)
 406:	e8 f5 fb ff ff       	call   0 <fmtname>
 40b:	8b 95 74 fd ff ff    	mov    -0x28c(%ebp),%edx
 411:	59                   	pop    %ecx
 412:	5b                   	pop    %ebx
 413:	52                   	push   %edx
 414:	57                   	push   %edi
 415:	6a 02                	push   $0x2
 417:	50                   	push   %eax
 418:	68 f0 0f 00 00       	push   $0xff0
 41d:	6a 01                	push   $0x1
 41f:	e8 2c 07 00 00       	call   b50 <printf>
    break;
 424:	83 c4 20             	add    $0x20,%esp
 427:	eb 93                	jmp    3bc <ls+0x31c>
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
 430:	83 ec 08             	sub    $0x8,%esp
 433:	68 fd 0f 00 00       	push   $0xffd
 438:	6a 01                	push   $0x1
 43a:	e8 11 07 00 00       	call   b50 <printf>
      break;
 43f:	83 c4 10             	add    $0x10,%esp
 442:	e9 75 ff ff ff       	jmp    3bc <ls+0x31c>
 447:	89 f6                	mov    %esi,%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
 450:	83 ec 04             	sub    $0x4,%esp
 453:	53                   	push   %ebx
 454:	68 dc 0f 00 00       	push   $0xfdc
 459:	6a 02                	push   $0x2
 45b:	e8 f0 06 00 00       	call   b50 <printf>
    close(fd);
 460:	89 34 24             	mov    %esi,(%esp)
 463:	e8 58 05 00 00       	call   9c0 <close>
    return;
 468:	83 c4 10             	add    $0x10,%esp
 46b:	e9 f3 fd ff ff       	jmp    263 <ls+0x1c3>
    *p++ = '/';
    while(read(fd, cg_file_name, sizeof(cg_file_name)) == MAX_CGROUP_FILE_NAME_LENGTH && cg_file_name[0] != ' '){
      memmove(p, cg_file_name, MAX_CGROUP_FILE_NAME_LENGTH);
      p[MAX_CGROUP_FILE_NAME_LENGTH] = 0;
      int i = MAX_CGROUP_FILE_NAME_LENGTH - 1;
      while (p[i] == ' ')
 470:	b8 40 00 00 00       	mov    $0x40,%eax
 475:	e9 52 fd ff ff       	jmp    1cc <ls+0x12c>
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
 47a:	83 ec 04             	sub    $0x4,%esp
 47d:	ff b5 74 fd ff ff    	pushl  -0x28c(%ebp)
 483:	68 dc 0f 00 00       	push   $0xfdc
 488:	6a 01                	push   $0x1
 48a:	e8 c1 06 00 00       	call   b50 <printf>
        continue;
 48f:	83 c4 10             	add    $0x10,%esp
 492:	e9 41 fe ff ff       	jmp    2d8 <ls+0x238>
 497:	66 90                	xchg   %ax,%ax
 499:	66 90                	xchg   %ax,%ax
 49b:	66 90                	xchg   %ax,%ax
 49d:	66 90                	xchg   %ax,%ax
 49f:	90                   	nop

000004a0 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
 4a0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 4a4:	83 e4 f0             	and    $0xfffffff0,%esp
 4a7:	ff 71 fc             	pushl  -0x4(%ecx)
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	57                   	push   %edi
 4ae:	56                   	push   %esi
 4af:	53                   	push   %ebx
 4b0:	51                   	push   %ecx
 4b1:	bb 01 00 00 00       	mov    $0x1,%ebx
 4b6:	83 ec 08             	sub    $0x8,%esp
 4b9:	8b 31                	mov    (%ecx),%esi
 4bb:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 4be:	83 fe 01             	cmp    $0x1,%esi
 4c1:	7e 24                	jle    4e7 <main+0x47>
 4c3:	90                   	nop
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit(1);
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
 4c8:	83 ec 0c             	sub    $0xc,%esp
 4cb:	ff 34 9f             	pushl  (%edi,%ebx,4)

  if(argc < 2){
    ls(".");
    exit(1);
  }
  for(i=1; i<argc; i++)
 4ce:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
 4d1:	e8 ca fb ff ff       	call   a0 <ls>

  if(argc < 2){
    ls(".");
    exit(1);
  }
  for(i=1; i<argc; i++)
 4d6:	83 c4 10             	add    $0x10,%esp
 4d9:	39 de                	cmp    %ebx,%esi
 4db:	75 eb                	jne    4c8 <main+0x28>
    ls(argv[i]);
  exit(0);
 4dd:	83 ec 0c             	sub    $0xc,%esp
 4e0:	6a 00                	push   $0x0
 4e2:	e8 b1 04 00 00       	call   998 <exit>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    ls(".");
 4e7:	83 ec 0c             	sub    $0xc,%esp
 4ea:	68 1a 10 00 00       	push   $0x101a
 4ef:	e8 ac fb ff ff       	call   a0 <ls>
    exit(1);
 4f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4fb:	e8 98 04 00 00       	call   998 <exit>

00000500 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	53                   	push   %ebx
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 50a:	89 c2                	mov    %eax,%edx
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 510:	83 c1 01             	add    $0x1,%ecx
 513:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 517:	83 c2 01             	add    $0x1,%edx
 51a:	84 db                	test   %bl,%bl
 51c:	88 5a ff             	mov    %bl,-0x1(%edx)
 51f:	75 ef                	jne    510 <strcpy+0x10>
    ;
  return os;
}
 521:	5b                   	pop    %ebx
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 52a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000530 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
 535:	8b 55 08             	mov    0x8(%ebp),%edx
 538:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 53b:	0f b6 02             	movzbl (%edx),%eax
 53e:	0f b6 19             	movzbl (%ecx),%ebx
 541:	84 c0                	test   %al,%al
 543:	75 1e                	jne    563 <strcmp+0x33>
 545:	eb 29                	jmp    570 <strcmp+0x40>
 547:	89 f6                	mov    %esi,%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 550:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 553:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 556:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 559:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 55d:	84 c0                	test   %al,%al
 55f:	74 0f                	je     570 <strcmp+0x40>
 561:	89 f1                	mov    %esi,%ecx
 563:	38 d8                	cmp    %bl,%al
 565:	74 e9                	je     550 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 567:	29 d8                	sub    %ebx,%eax
}
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
 56d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 570:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 572:	29 d8                	sub    %ebx,%eax
}
 574:	5b                   	pop    %ebx
 575:	5e                   	pop    %esi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
 578:	90                   	nop
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000580 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	8b 55 08             	mov    0x8(%ebp),%edx
 588:	53                   	push   %ebx
 589:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
 58c:	0f b6 32             	movzbl (%edx),%esi
 58f:	89 f0                	mov    %esi,%eax
 591:	84 c0                	test   %al,%al
 593:	74 67                	je     5fc <strncmp+0x7c>
 595:	0f b6 19             	movzbl (%ecx),%ebx
 598:	89 f0                	mov    %esi,%eax
 59a:	38 d8                	cmp    %bl,%al
 59c:	75 65                	jne    603 <strncmp+0x83>
 59e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5a1:	89 f0                	mov    %esi,%eax
 5a3:	0f b6 f0             	movzbl %al,%esi
 5a6:	89 f0                	mov    %esi,%eax
 5a8:	83 eb 01             	sub    $0x1,%ebx
 5ab:	75 14                	jne    5c1 <strncmp+0x41>
 5ad:	eb 25                	jmp    5d4 <strncmp+0x54>
 5af:	90                   	nop
 5b0:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 5b4:	89 f1                	mov    %esi,%ecx
 5b6:	38 c8                	cmp    %cl,%al
 5b8:	75 26                	jne    5e0 <strncmp+0x60>
 5ba:	83 eb 01             	sub    $0x1,%ebx
 5bd:	89 f9                	mov    %edi,%ecx
 5bf:	74 2f                	je     5f0 <strncmp+0x70>
    p++, q++;
 5c1:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5c4:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 5c7:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5ca:	84 c0                	test   %al,%al
 5cc:	75 e2                	jne    5b0 <strncmp+0x30>
 5ce:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
 5d2:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 5d4:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 5d5:	29 f0                	sub    %esi,%eax
}
 5d7:	5e                   	pop    %esi
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    
 5db:	90                   	nop
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e0:	0f b6 f1             	movzbl %cl,%esi
 5e3:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 5e4:	29 f0                	sub    %esi,%eax
}
 5e6:	5e                   	pop    %esi
 5e7:	5f                   	pop    %edi
 5e8:	5d                   	pop    %ebp
 5e9:	c3                   	ret    
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5f0:	0f b6 f0             	movzbl %al,%esi
 5f3:	89 f0                	mov    %esi,%eax
 5f5:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 5f6:	29 f0                	sub    %esi,%eax
}
 5f8:	5e                   	pop    %esi
 5f9:	5f                   	pop    %edi
 5fa:	5d                   	pop    %ebp
 5fb:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 5fc:	31 c0                	xor    %eax,%eax
 5fe:	0f b6 31             	movzbl (%ecx),%esi
 601:	eb d1                	jmp    5d4 <strncmp+0x54>
 603:	0f b6 c0             	movzbl %al,%eax
 606:	0f b6 f3             	movzbl %bl,%esi
 609:	eb c9                	jmp    5d4 <strncmp+0x54>
 60b:	90                   	nop
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000610 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 616:	80 39 00             	cmpb   $0x0,(%ecx)
 619:	74 12                	je     62d <strlen+0x1d>
 61b:	31 d2                	xor    %edx,%edx
 61d:	8d 76 00             	lea    0x0(%esi),%esi
 620:	83 c2 01             	add    $0x1,%edx
 623:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 627:	89 d0                	mov    %edx,%eax
 629:	75 f5                	jne    620 <strlen+0x10>
    ;
  return n;
}
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 62d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 62f:	5d                   	pop    %ebp
 630:	c3                   	ret    
 631:	eb 0d                	jmp    640 <memset>
 633:	90                   	nop
 634:	90                   	nop
 635:	90                   	nop
 636:	90                   	nop
 637:	90                   	nop
 638:	90                   	nop
 639:	90                   	nop
 63a:	90                   	nop
 63b:	90                   	nop
 63c:	90                   	nop
 63d:	90                   	nop
 63e:	90                   	nop
 63f:	90                   	nop

00000640 <memset>:

void*
memset(void *dst, int c, uint n)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 647:	8b 4d 10             	mov    0x10(%ebp),%ecx
 64a:	8b 45 0c             	mov    0xc(%ebp),%eax
 64d:	89 d7                	mov    %edx,%edi
 64f:	fc                   	cld    
 650:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 652:	89 d0                	mov    %edx,%eax
 654:	5f                   	pop    %edi
 655:	5d                   	pop    %ebp
 656:	c3                   	ret    
 657:	89 f6                	mov    %esi,%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <strchr>:

char*
strchr(const char *s, char c)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	53                   	push   %ebx
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 66a:	0f b6 10             	movzbl (%eax),%edx
 66d:	84 d2                	test   %dl,%dl
 66f:	74 1d                	je     68e <strchr+0x2e>
    if(*s == c)
 671:	38 d3                	cmp    %dl,%bl
 673:	89 d9                	mov    %ebx,%ecx
 675:	75 0d                	jne    684 <strchr+0x24>
 677:	eb 17                	jmp    690 <strchr+0x30>
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 680:	38 ca                	cmp    %cl,%dl
 682:	74 0c                	je     690 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 684:	83 c0 01             	add    $0x1,%eax
 687:	0f b6 10             	movzbl (%eax),%edx
 68a:	84 d2                	test   %dl,%dl
 68c:	75 f2                	jne    680 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 68e:	31 c0                	xor    %eax,%eax
}
 690:	5b                   	pop    %ebx
 691:	5d                   	pop    %ebp
 692:	c3                   	ret    
 693:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006a0 <gets>:

char*
gets(char *buf, int max)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 6a6:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6a9:	31 db                	xor    %ebx,%ebx
 6ab:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 6b0:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6b3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 6b6:	7d 30                	jge    6e8 <gets+0x48>
    cc = read(0, &c, 1);
 6b8:	83 ec 04             	sub    $0x4,%esp
 6bb:	6a 01                	push   $0x1
 6bd:	56                   	push   %esi
 6be:	6a 00                	push   $0x0
 6c0:	e8 eb 02 00 00       	call   9b0 <read>
    if(cc < 1)
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	85 c0                	test   %eax,%eax
 6ca:	7e e7                	jle    6b3 <gets+0x13>
      continue;
    buf[i++] = c;
 6cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 6d0:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 6d3:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
 6d5:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6d8:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 6da:	74 0c                	je     6e8 <gets+0x48>
 6dc:	3c 0d                	cmp    $0xd,%al
 6de:	74 08                	je     6e8 <gets+0x48>
 6e0:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6e3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 6e6:	7c d0                	jl     6b8 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 6ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f2:	5b                   	pop    %ebx
 6f3:	5e                   	pop    %esi
 6f4:	5f                   	pop    %edi
 6f5:	5d                   	pop    %ebp
 6f6:	c3                   	ret    
 6f7:	89 f6                	mov    %esi,%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000700 <stat>:

int
stat(const char *n, struct stat *st)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	56                   	push   %esi
 704:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 705:	83 ec 08             	sub    $0x8,%esp
 708:	6a 00                	push   $0x0
 70a:	ff 75 08             	pushl  0x8(%ebp)
 70d:	e8 c6 02 00 00       	call   9d8 <open>
  if(fd < 0)
 712:	83 c4 10             	add    $0x10,%esp
 715:	85 c0                	test   %eax,%eax
 717:	78 27                	js     740 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 719:	83 ec 08             	sub    $0x8,%esp
 71c:	ff 75 0c             	pushl  0xc(%ebp)
 71f:	89 c3                	mov    %eax,%ebx
 721:	50                   	push   %eax
 722:	e8 c9 02 00 00       	call   9f0 <fstat>
 727:	89 c6                	mov    %eax,%esi
  close(fd);
 729:	89 1c 24             	mov    %ebx,(%esp)
 72c:	e8 8f 02 00 00       	call   9c0 <close>
  return r;
 731:	83 c4 10             	add    $0x10,%esp
 734:	89 f0                	mov    %esi,%eax
}
 736:	8d 65 f8             	lea    -0x8(%ebp),%esp
 739:	5b                   	pop    %ebx
 73a:	5e                   	pop    %esi
 73b:	5d                   	pop    %ebp
 73c:	c3                   	ret    
 73d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 740:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 745:	eb ef                	jmp    736 <stat+0x36>
 747:	89 f6                	mov    %esi,%esi
 749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000750 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	53                   	push   %ebx
 754:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 757:	0f be 11             	movsbl (%ecx),%edx
 75a:	8d 42 d0             	lea    -0x30(%edx),%eax
 75d:	3c 09                	cmp    $0x9,%al
 75f:	b8 00 00 00 00       	mov    $0x0,%eax
 764:	77 1f                	ja     785 <atoi+0x35>
 766:	8d 76 00             	lea    0x0(%esi),%esi
 769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 770:	8d 04 80             	lea    (%eax,%eax,4),%eax
 773:	83 c1 01             	add    $0x1,%ecx
 776:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 77a:	0f be 11             	movsbl (%ecx),%edx
 77d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 780:	80 fb 09             	cmp    $0x9,%bl
 783:	76 eb                	jbe    770 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 785:	5b                   	pop    %ebx
 786:	5d                   	pop    %ebp
 787:	c3                   	ret    
 788:	90                   	nop
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000790 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	56                   	push   %esi
 794:	53                   	push   %ebx
 795:	8b 5d 10             	mov    0x10(%ebp),%ebx
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 79e:	85 db                	test   %ebx,%ebx
 7a0:	7e 14                	jle    7b6 <memmove+0x26>
 7a2:	31 d2                	xor    %edx,%edx
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 7a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 7ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 7af:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 7b2:	39 da                	cmp    %ebx,%edx
 7b4:	75 f2                	jne    7a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 7b6:	5b                   	pop    %ebx
 7b7:	5e                   	pop    %esi
 7b8:	5d                   	pop    %ebp
 7b9:	c3                   	ret    
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000007c0 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 04             	sub    $0x4,%esp
 7c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
 7cc:	83 f9 00             	cmp    $0x0,%ecx
 7cf:	7e 76                	jle    847 <itoa+0x87>
 7d1:	89 cb                	mov    %ecx,%ebx
 7d3:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
 7d5:	bf 67 66 66 66       	mov    $0x66666667,%edi
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7e0:	89 d8                	mov    %ebx,%eax
 7e2:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
 7e5:	83 c6 01             	add    $0x1,%esi
        i /= 10;
 7e8:	f7 ef                	imul   %edi
 7ea:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
 7ed:	29 da                	sub    %ebx,%edx
 7ef:	89 d3                	mov    %edx,%ebx
 7f1:	75 ed                	jne    7e0 <itoa+0x20>
        length++;
 7f3:	89 f3                	mov    %esi,%ebx
 7f5:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
 7f8:	bf 67 66 66 66       	mov    $0x66666667,%edi
 7fd:	8b 75 08             	mov    0x8(%ebp),%esi
 800:	eb 0a                	jmp    80c <itoa+0x4c>
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 808:	85 db                	test   %ebx,%ebx
 80a:	7e 25                	jle    831 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
 80c:	89 c8                	mov    %ecx,%eax
 80e:	f7 ef                	imul   %edi
 810:	89 c8                	mov    %ecx,%eax
 812:	c1 f8 1f             	sar    $0x1f,%eax
 815:	c1 fa 02             	sar    $0x2,%edx
 818:	29 c2                	sub    %eax,%edx
 81a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 81d:	01 c0                	add    %eax,%eax
 81f:	29 c1                	sub    %eax,%ecx
 821:	83 c1 30             	add    $0x30,%ecx
 824:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 828:	83 eb 01             	sub    $0x1,%ebx
 82b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
 82d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
 82f:	7f d7                	jg     808 <itoa+0x48>
 831:	8b 75 f0             	mov    -0x10(%ebp),%esi
 834:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
 836:	8b 7d 08             	mov    0x8(%ebp),%edi
 839:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
 83d:	83 c4 04             	add    $0x4,%esp
 840:	89 f0                	mov    %esi,%eax
 842:	5b                   	pop    %ebx
 843:	5e                   	pop    %esi
 844:	5f                   	pop    %edi
 845:	5d                   	pop    %ebp
 846:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 847:	75 12                	jne    85b <itoa+0x9b>
        buf[0] = '0';
 849:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
 84c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
 851:	c6 00 30             	movb   $0x30,(%eax)
 854:	b8 01 00 00 00       	mov    $0x1,%eax
 859:	eb db                	jmp    836 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
 85b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
 85d:	31 f6                	xor    %esi,%esi
 85f:	eb d5                	jmp    836 <itoa+0x76>
 861:	eb 0d                	jmp    870 <strcat>
 863:	90                   	nop
 864:	90                   	nop
 865:	90                   	nop
 866:	90                   	nop
 867:	90                   	nop
 868:	90                   	nop
 869:	90                   	nop
 86a:	90                   	nop
 86b:	90                   	nop
 86c:	90                   	nop
 86d:	90                   	nop
 86e:	90                   	nop
 86f:	90                   	nop

00000870 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	8b 45 08             	mov    0x8(%ebp),%eax
 878:	53                   	push   %ebx
 879:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 87c:	80 38 00             	cmpb   $0x0,(%eax)
 87f:	74 38                	je     8b9 <strcat+0x49>
 881:	31 c9                	xor    %ecx,%ecx
 883:	90                   	nop
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 888:	83 c1 01             	add    $0x1,%ecx
 88b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 88f:	89 ca                	mov    %ecx,%edx
 891:	75 f5                	jne    888 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
 893:	0f b6 1e             	movzbl (%esi),%ebx
 896:	84 db                	test   %bl,%bl
 898:	74 16                	je     8b0 <strcat+0x40>
 89a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 89d:	31 d2                	xor    %edx,%edx
 89f:	90                   	nop
                dest[i + j] = source[j];
 8a0:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
 8a3:	83 c2 01             	add    $0x1,%edx
 8a6:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 8aa:	84 db                	test   %bl,%bl
 8ac:	75 f2                	jne    8a0 <strcat+0x30>
 8ae:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
 8b0:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
 8b4:	5b                   	pop    %ebx
 8b5:	5e                   	pop    %esi
 8b6:	5f                   	pop    %edi
 8b7:	5d                   	pop    %ebp
 8b8:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
 8b9:	31 d2                	xor    %edx,%edx
 8bb:	31 c9                	xor    %ecx,%ecx
 8bd:	eb d4                	jmp    893 <strcat+0x23>
 8bf:	90                   	nop

000008c0 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	57                   	push   %edi
 8c4:	56                   	push   %esi
 8c5:	53                   	push   %ebx
 8c6:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 8c9:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
 8cc:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 8cf:	0f b6 00             	movzbl (%eax),%eax
 8d2:	84 c0                	test   %al,%al
 8d4:	88 45 f3             	mov    %al,-0xd(%ebp)
 8d7:	0f 84 a0 00 00 00    	je     97d <strstr+0xbd>
 8dd:	8b 55 0c             	mov    0xc(%ebp),%edx
 8e0:	31 c0                	xor    %eax,%eax
 8e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8e8:	83 c0 01             	add    $0x1,%eax
 8eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 8ef:	75 f7                	jne    8e8 <strstr+0x28>
 8f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8f7:	0f b6 07             	movzbl (%edi),%eax
 8fa:	84 c0                	test   %al,%al
 8fc:	74 68                	je     966 <strstr+0xa6>
 8fe:	31 d2                	xor    %edx,%edx
 900:	83 c2 01             	add    $0x1,%edx
 903:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
 907:	75 f7                	jne    900 <strstr+0x40>
 909:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 90c:	84 c0                	test   %al,%al
 90e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
 911:	74 4d                	je     960 <strstr+0xa0>
 913:	90                   	nop
 914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 918:	38 45 f3             	cmp    %al,-0xd(%ebp)
 91b:	75 34                	jne    951 <strstr+0x91>
 91d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
 920:	83 eb 01             	sub    $0x1,%ebx
 923:	74 4b                	je     970 <strstr+0xb0>
 925:	8b 55 0c             	mov    0xc(%ebp),%edx
 928:	89 f8                	mov    %edi,%eax
 92a:	eb 10                	jmp    93c <strstr+0x7c>
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 930:	3a 4a 01             	cmp    0x1(%edx),%cl
 933:	75 1c                	jne    951 <strstr+0x91>
 935:	83 eb 01             	sub    $0x1,%ebx
 938:	89 f2                	mov    %esi,%edx
 93a:	74 34                	je     970 <strstr+0xb0>
    p++, q++;
 93c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 93f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
 942:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 945:	84 c9                	test   %cl,%cl
 947:	75 e7                	jne    930 <strstr+0x70>
 949:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
 94d:	84 c0                	test   %al,%al
 94f:	74 1f                	je     970 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
 951:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
 954:	3b 7d ec             	cmp    -0x14(%ebp),%edi
 957:	74 0d                	je     966 <strstr+0xa6>
 959:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
 95c:	84 c0                	test   %al,%al
 95e:	75 b8                	jne    918 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 960:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 964:	eb e7                	jmp    94d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
 966:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
 969:	31 c0                	xor    %eax,%eax
}
 96b:	5b                   	pop    %ebx
 96c:	5e                   	pop    %esi
 96d:	5f                   	pop    %edi
 96e:	5d                   	pop    %ebp
 96f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 970:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
 973:	83 c4 10             	add    $0x10,%esp
 976:	5b                   	pop    %ebx
 977:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
 978:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
 97a:	5f                   	pop    %edi
 97b:	5d                   	pop    %ebp
 97c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 97d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 984:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 98b:	e9 67 ff ff ff       	jmp    8f7 <strstr+0x37>

00000990 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 990:	b8 01 00 00 00       	mov    $0x1,%eax
 995:	cd 40                	int    $0x40
 997:	c3                   	ret    

00000998 <exit>:
SYSCALL(exit)
 998:	b8 02 00 00 00       	mov    $0x2,%eax
 99d:	cd 40                	int    $0x40
 99f:	c3                   	ret    

000009a0 <wait>:
SYSCALL(wait)
 9a0:	b8 03 00 00 00       	mov    $0x3,%eax
 9a5:	cd 40                	int    $0x40
 9a7:	c3                   	ret    

000009a8 <pipe>:
SYSCALL(pipe)
 9a8:	b8 04 00 00 00       	mov    $0x4,%eax
 9ad:	cd 40                	int    $0x40
 9af:	c3                   	ret    

000009b0 <read>:
SYSCALL(read)
 9b0:	b8 05 00 00 00       	mov    $0x5,%eax
 9b5:	cd 40                	int    $0x40
 9b7:	c3                   	ret    

000009b8 <write>:
SYSCALL(write)
 9b8:	b8 10 00 00 00       	mov    $0x10,%eax
 9bd:	cd 40                	int    $0x40
 9bf:	c3                   	ret    

000009c0 <close>:
SYSCALL(close)
 9c0:	b8 15 00 00 00       	mov    $0x15,%eax
 9c5:	cd 40                	int    $0x40
 9c7:	c3                   	ret    

000009c8 <kill>:
SYSCALL(kill)
 9c8:	b8 06 00 00 00       	mov    $0x6,%eax
 9cd:	cd 40                	int    $0x40
 9cf:	c3                   	ret    

000009d0 <exec>:
SYSCALL(exec)
 9d0:	b8 07 00 00 00       	mov    $0x7,%eax
 9d5:	cd 40                	int    $0x40
 9d7:	c3                   	ret    

000009d8 <open>:
SYSCALL(open)
 9d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 9dd:	cd 40                	int    $0x40
 9df:	c3                   	ret    

000009e0 <mknod>:
SYSCALL(mknod)
 9e0:	b8 11 00 00 00       	mov    $0x11,%eax
 9e5:	cd 40                	int    $0x40
 9e7:	c3                   	ret    

000009e8 <unlink>:
SYSCALL(unlink)
 9e8:	b8 12 00 00 00       	mov    $0x12,%eax
 9ed:	cd 40                	int    $0x40
 9ef:	c3                   	ret    

000009f0 <fstat>:
SYSCALL(fstat)
 9f0:	b8 08 00 00 00       	mov    $0x8,%eax
 9f5:	cd 40                	int    $0x40
 9f7:	c3                   	ret    

000009f8 <link>:
SYSCALL(link)
 9f8:	b8 13 00 00 00       	mov    $0x13,%eax
 9fd:	cd 40                	int    $0x40
 9ff:	c3                   	ret    

00000a00 <mkdir>:
SYSCALL(mkdir)
 a00:	b8 14 00 00 00       	mov    $0x14,%eax
 a05:	cd 40                	int    $0x40
 a07:	c3                   	ret    

00000a08 <chdir>:
SYSCALL(chdir)
 a08:	b8 09 00 00 00       	mov    $0x9,%eax
 a0d:	cd 40                	int    $0x40
 a0f:	c3                   	ret    

00000a10 <dup>:
SYSCALL(dup)
 a10:	b8 0a 00 00 00       	mov    $0xa,%eax
 a15:	cd 40                	int    $0x40
 a17:	c3                   	ret    

00000a18 <getpid>:
SYSCALL(getpid)
 a18:	b8 0b 00 00 00       	mov    $0xb,%eax
 a1d:	cd 40                	int    $0x40
 a1f:	c3                   	ret    

00000a20 <sbrk>:
SYSCALL(sbrk)
 a20:	b8 0c 00 00 00       	mov    $0xc,%eax
 a25:	cd 40                	int    $0x40
 a27:	c3                   	ret    

00000a28 <sleep>:
SYSCALL(sleep)
 a28:	b8 0d 00 00 00       	mov    $0xd,%eax
 a2d:	cd 40                	int    $0x40
 a2f:	c3                   	ret    

00000a30 <uptime>:
SYSCALL(uptime)
 a30:	b8 0e 00 00 00       	mov    $0xe,%eax
 a35:	cd 40                	int    $0x40
 a37:	c3                   	ret    

00000a38 <mount>:
SYSCALL(mount)
 a38:	b8 16 00 00 00       	mov    $0x16,%eax
 a3d:	cd 40                	int    $0x40
 a3f:	c3                   	ret    

00000a40 <umount>:
SYSCALL(umount)
 a40:	b8 17 00 00 00       	mov    $0x17,%eax
 a45:	cd 40                	int    $0x40
 a47:	c3                   	ret    

00000a48 <printmounts>:
SYSCALL(printmounts)
 a48:	b8 18 00 00 00       	mov    $0x18,%eax
 a4d:	cd 40                	int    $0x40
 a4f:	c3                   	ret    

00000a50 <printdevices>:
SYSCALL(printdevices)
 a50:	b8 19 00 00 00       	mov    $0x19,%eax
 a55:	cd 40                	int    $0x40
 a57:	c3                   	ret    

00000a58 <unshare>:
SYSCALL(unshare)
 a58:	b8 1a 00 00 00       	mov    $0x1a,%eax
 a5d:	cd 40                	int    $0x40
 a5f:	c3                   	ret    

00000a60 <usleep>:
SYSCALL(usleep)
 a60:	b8 1b 00 00 00       	mov    $0x1b,%eax
 a65:	cd 40                	int    $0x40
 a67:	c3                   	ret    

00000a68 <ioctl>:
SYSCALL(ioctl)
 a68:	b8 1c 00 00 00       	mov    $0x1c,%eax
 a6d:	cd 40                	int    $0x40
 a6f:	c3                   	ret    

00000a70 <getppid>:
SYSCALL(getppid)
 a70:	b8 1d 00 00 00       	mov    $0x1d,%eax
 a75:	cd 40                	int    $0x40
 a77:	c3                   	ret    

00000a78 <getcpu>:
SYSCALL(getcpu)
 a78:	b8 1e 00 00 00       	mov    $0x1e,%eax
 a7d:	cd 40                	int    $0x40
 a7f:	c3                   	ret    

00000a80 <getmem>:
SYSCALL(getmem)
 a80:	b8 1f 00 00 00       	mov    $0x1f,%eax
 a85:	cd 40                	int    $0x40
 a87:	c3                   	ret    

00000a88 <kmemtest>:
SYSCALL(kmemtest)
 a88:	b8 20 00 00 00       	mov    $0x20,%eax
 a8d:	cd 40                	int    $0x40
 a8f:	c3                   	ret    

00000a90 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	57                   	push   %edi
 a94:	56                   	push   %esi
 a95:	53                   	push   %ebx
 a96:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 a99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
 a9c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 a9f:	85 db                	test   %ebx,%ebx
 aa1:	0f 84 91 00 00 00    	je     b38 <printint+0xa8>
 aa7:	89 d0                	mov    %edx,%eax
 aa9:	c1 e8 1f             	shr    $0x1f,%eax
 aac:	84 c0                	test   %al,%al
 aae:	0f 84 84 00 00 00    	je     b38 <printint+0xa8>
    neg = 1;
    x = -xx;
 ab4:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 ab6:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 abd:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 abf:	31 ff                	xor    %edi,%edi
 ac1:	8d 75 c7             	lea    -0x39(%ebp),%esi
 ac4:	eb 0c                	jmp    ad2 <printint+0x42>
 ac6:	8d 76 00             	lea    0x0(%esi),%esi
 ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
 ad0:	89 df                	mov    %ebx,%edi
 ad2:	31 d2                	xor    %edx,%edx
 ad4:	8d 5f 01             	lea    0x1(%edi),%ebx
 ad7:	f7 f1                	div    %ecx
 ad9:	0f b6 92 24 10 00 00 	movzbl 0x1024(%edx),%edx
  }while((x /= base) != 0);
 ae0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 ae2:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 ae5:	75 e9                	jne    ad0 <printint+0x40>
  if(neg)
 ae7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 aea:	85 c0                	test   %eax,%eax
 aec:	74 08                	je     af6 <printint+0x66>
    buf[i++] = '-';
 aee:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
 af3:	8d 5f 02             	lea    0x2(%edi),%ebx
 af6:	8d 7d d8             	lea    -0x28(%ebp),%edi
 af9:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
 afd:	89 fa                	mov    %edi,%edx
 aff:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
 b00:	0f b6 08             	movzbl (%eax),%ecx
 b03:	83 e8 01             	sub    $0x1,%eax
 b06:	83 c2 01             	add    $0x1,%edx
 b09:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
 b0c:	39 f0                	cmp    %esi,%eax
 b0e:	75 f0                	jne    b00 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
 b10:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
 b13:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
 b18:	57                   	push   %edi
 b19:	e8 f2 fa ff ff       	call   610 <strlen>
 b1e:	83 c4 0c             	add    $0xc,%esp
 b21:	50                   	push   %eax
 b22:	57                   	push   %edi
 b23:	ff 75 c0             	pushl  -0x40(%ebp)
 b26:	e8 8d fe ff ff       	call   9b8 <write>
}
 b2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b2e:	5b                   	pop    %ebx
 b2f:	5e                   	pop    %esi
 b30:	5f                   	pop    %edi
 b31:	5d                   	pop    %ebp
 b32:	c3                   	ret    
 b33:	90                   	nop
 b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 b38:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 b3a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 b41:	e9 79 ff ff ff       	jmp    abf <printint+0x2f>
 b46:	8d 76 00             	lea    0x0(%esi),%esi
 b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	57                   	push   %edi
 b54:	56                   	push   %esi
 b55:	53                   	push   %ebx
 b56:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b59:	8b 75 0c             	mov    0xc(%ebp),%esi
 b5c:	0f b6 06             	movzbl (%esi),%eax
 b5f:	84 c0                	test   %al,%al
 b61:	0f 84 90 01 00 00    	je     cf7 <printf+0x1a7>
 b67:	8d 5d 10             	lea    0x10(%ebp),%ebx
 b6a:	31 ff                	xor    %edi,%edi
 b6c:	31 d2                	xor    %edx,%edx
 b6e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 b71:	31 db                	xor    %ebx,%ebx
 b73:	eb 39                	jmp    bae <printf+0x5e>
 b75:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b78:	83 f9 25             	cmp    $0x25,%ecx
 b7b:	0f 84 af 00 00 00    	je     c30 <printf+0xe0>
 b81:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 b84:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 b87:	83 ec 04             	sub    $0x4,%esp
 b8a:	6a 01                	push   $0x1
 b8c:	50                   	push   %eax
 b8d:	ff 75 08             	pushl  0x8(%ebp)
 b90:	e8 23 fe ff ff       	call   9b8 <write>
 b95:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
 b98:	85 c0                	test   %eax,%eax
 b9a:	78 35                	js     bd1 <printf+0x81>
 b9c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b9f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 ba2:	01 c7                	add    %eax,%edi
 ba4:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ba6:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 baa:	84 c0                	test   %al,%al
 bac:	74 21                	je     bcf <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
 bae:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
 bb1:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
 bb3:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 bb6:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
 bb9:	74 bd                	je     b78 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
 bbb:	83 fa 25             	cmp    $0x25,%edx
 bbe:	74 20                	je     be0 <printf+0x90>
 bc0:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 bc2:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 bc5:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 bc7:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
 bcb:	84 c0                	test   %al,%al
 bcd:	75 df                	jne    bae <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
 bcf:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
 bd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 bd4:	5b                   	pop    %ebx
 bd5:	5e                   	pop    %esi
 bd6:	5f                   	pop    %edi
 bd7:	5d                   	pop    %ebp
 bd8:	c3                   	ret    
 bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 be0:	83 f9 64             	cmp    $0x64,%ecx
 be3:	0f 84 7f 00 00 00    	je     c68 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 be9:	0f be d0             	movsbl %al,%edx
 bec:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 bf2:	83 fa 70             	cmp    $0x70,%edx
 bf5:	74 49                	je     c40 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 bf7:	83 f9 73             	cmp    $0x73,%ecx
 bfa:	0f 84 98 00 00 00    	je     c98 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
 c00:	83 f9 63             	cmp    $0x63,%ecx
 c03:	0f 84 c7 00 00 00    	je     cd0 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 c09:	83 f9 25             	cmp    $0x25,%ecx
 c0c:	74 6a                	je     c78 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
 c0e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
 c11:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 c14:	83 ec 04             	sub    $0x4,%esp
 c17:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
 c19:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
 c1d:	50                   	push   %eax
 c1e:	ff 75 08             	pushl  0x8(%ebp)
 c21:	e8 92 fd ff ff       	call   9b8 <write>
 c26:	83 c4 10             	add    $0x10,%esp
 c29:	e9 6a ff ff ff       	jmp    b98 <printf+0x48>
 c2e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 c30:	ba 25 00 00 00       	mov    $0x25,%edx
 c35:	31 c0                	xor    %eax,%eax
 c37:	eb 89                	jmp    bc2 <printf+0x72>
 c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 c40:	83 ec 0c             	sub    $0xc,%esp
 c43:	b9 10 00 00 00       	mov    $0x10,%ecx
 c48:	6a 00                	push   $0x0
 c4a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 c4d:	8b 45 08             	mov    0x8(%ebp),%eax
 c50:	8b 16                	mov    (%esi),%edx
        ap++;
 c52:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
 c55:	e8 36 fe ff ff       	call   a90 <printint>
        ap++;
 c5a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 c5d:	83 c4 10             	add    $0x10,%esp
 c60:	e9 33 ff ff ff       	jmp    b98 <printf+0x48>
 c65:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
 c68:	83 ec 0c             	sub    $0xc,%esp
 c6b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 c70:	6a 01                	push   $0x1
 c72:	eb d6                	jmp    c4a <printf+0xfa>
 c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c78:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 c7b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 c7e:	83 ec 04             	sub    $0x4,%esp
 c81:	6a 01                	push   $0x1
 c83:	50                   	push   %eax
 c84:	ff 75 08             	pushl  0x8(%ebp)
 c87:	e8 2c fd ff ff       	call   9b8 <write>
 c8c:	83 c4 10             	add    $0x10,%esp
 c8f:	e9 04 ff ff ff       	jmp    b98 <printf+0x48>
 c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 c98:	8b 45 d0             	mov    -0x30(%ebp),%eax
 c9b:	8b 30                	mov    (%eax),%esi
        ap++;
 c9d:	83 c0 04             	add    $0x4,%eax
 ca0:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
 ca3:	b8 1c 10 00 00       	mov    $0x101c,%eax
 ca8:	85 f6                	test   %esi,%esi
 caa:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
 cad:	83 ec 0c             	sub    $0xc,%esp
 cb0:	56                   	push   %esi
 cb1:	e8 5a f9 ff ff       	call   610 <strlen>
 cb6:	83 c4 0c             	add    $0xc,%esp
 cb9:	50                   	push   %eax
 cba:	56                   	push   %esi
 cbb:	ff 75 08             	pushl  0x8(%ebp)
 cbe:	e8 f5 fc ff ff       	call   9b8 <write>
 cc3:	83 c4 10             	add    $0x10,%esp
 cc6:	e9 cd fe ff ff       	jmp    b98 <printf+0x48>
 ccb:	90                   	nop
 ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 cd0:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 cd3:	83 ec 04             	sub    $0x4,%esp
 cd6:	8b 06                	mov    (%esi),%eax
 cd8:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 cda:	83 c6 04             	add    $0x4,%esi
 cdd:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
 ce0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 ce3:	50                   	push   %eax
 ce4:	ff 75 08             	pushl  0x8(%ebp)
 ce7:	e8 cc fc ff ff       	call   9b8 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
 cec:	89 75 d0             	mov    %esi,-0x30(%ebp)
 cef:	83 c4 10             	add    $0x10,%esp
 cf2:	e9 a1 fe ff ff       	jmp    b98 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
 cf7:	31 c0                	xor    %eax,%eax
 cf9:	e9 d3 fe ff ff       	jmp    bd1 <printf+0x81>
 cfe:	66 90                	xchg   %ax,%ax

00000d00 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 d00:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d01:	a1 10 20 00 00       	mov    0x2010,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 d06:	89 e5                	mov    %esp,%ebp
 d08:	57                   	push   %edi
 d09:	56                   	push   %esi
 d0a:	53                   	push   %ebx
 d0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d0e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 d10:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d13:	39 c8                	cmp    %ecx,%eax
 d15:	73 19                	jae    d30 <free+0x30>
 d17:	89 f6                	mov    %esi,%esi
 d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 d20:	39 d1                	cmp    %edx,%ecx
 d22:	72 1c                	jb     d40 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d24:	39 d0                	cmp    %edx,%eax
 d26:	73 18                	jae    d40 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 d28:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d2a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d2c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d2e:	72 f0                	jb     d20 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d30:	39 d0                	cmp    %edx,%eax
 d32:	72 f4                	jb     d28 <free+0x28>
 d34:	39 d1                	cmp    %edx,%ecx
 d36:	73 f0                	jae    d28 <free+0x28>
 d38:	90                   	nop
 d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 d40:	8b 73 fc             	mov    -0x4(%ebx),%esi
 d43:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 d46:	39 d7                	cmp    %edx,%edi
 d48:	74 19                	je     d63 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 d4a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 d4d:	8b 50 04             	mov    0x4(%eax),%edx
 d50:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 d53:	39 f1                	cmp    %esi,%ecx
 d55:	74 23                	je     d7a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 d57:	89 08                	mov    %ecx,(%eax)
  freep = p;
 d59:	a3 10 20 00 00       	mov    %eax,0x2010
}
 d5e:	5b                   	pop    %ebx
 d5f:	5e                   	pop    %esi
 d60:	5f                   	pop    %edi
 d61:	5d                   	pop    %ebp
 d62:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 d63:	03 72 04             	add    0x4(%edx),%esi
 d66:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 d69:	8b 10                	mov    (%eax),%edx
 d6b:	8b 12                	mov    (%edx),%edx
 d6d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 d70:	8b 50 04             	mov    0x4(%eax),%edx
 d73:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 d76:	39 f1                	cmp    %esi,%ecx
 d78:	75 dd                	jne    d57 <free+0x57>
    p->s.size += bp->s.size;
 d7a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 d7d:	a3 10 20 00 00       	mov    %eax,0x2010
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 d82:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 d85:	8b 53 f8             	mov    -0x8(%ebx),%edx
 d88:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 d8a:	5b                   	pop    %ebx
 d8b:	5e                   	pop    %esi
 d8c:	5f                   	pop    %edi
 d8d:	5d                   	pop    %ebp
 d8e:	c3                   	ret    
 d8f:	90                   	nop

00000d90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d90:	55                   	push   %ebp
 d91:	89 e5                	mov    %esp,%ebp
 d93:	57                   	push   %edi
 d94:	56                   	push   %esi
 d95:	53                   	push   %ebx
 d96:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d99:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 d9c:	8b 15 10 20 00 00    	mov    0x2010,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 da2:	8d 78 07             	lea    0x7(%eax),%edi
 da5:	c1 ef 03             	shr    $0x3,%edi
 da8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 dab:	85 d2                	test   %edx,%edx
 dad:	0f 84 a3 00 00 00    	je     e56 <malloc+0xc6>
 db3:	8b 02                	mov    (%edx),%eax
 db5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 db8:	39 cf                	cmp    %ecx,%edi
 dba:	76 74                	jbe    e30 <malloc+0xa0>
 dbc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 dc2:	be 00 10 00 00       	mov    $0x1000,%esi
 dc7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 dce:	0f 43 f7             	cmovae %edi,%esi
 dd1:	ba 00 80 00 00       	mov    $0x8000,%edx
 dd6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 ddc:	0f 46 da             	cmovbe %edx,%ebx
 ddf:	eb 10                	jmp    df1 <malloc+0x61>
 de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 de8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 dea:	8b 48 04             	mov    0x4(%eax),%ecx
 ded:	39 cf                	cmp    %ecx,%edi
 def:	76 3f                	jbe    e30 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 df1:	39 05 10 20 00 00    	cmp    %eax,0x2010
 df7:	89 c2                	mov    %eax,%edx
 df9:	75 ed                	jne    de8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 dfb:	83 ec 0c             	sub    $0xc,%esp
 dfe:	53                   	push   %ebx
 dff:	e8 1c fc ff ff       	call   a20 <sbrk>
  if(p == (char*)-1)
 e04:	83 c4 10             	add    $0x10,%esp
 e07:	83 f8 ff             	cmp    $0xffffffff,%eax
 e0a:	74 1c                	je     e28 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 e0c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 e0f:	83 ec 0c             	sub    $0xc,%esp
 e12:	83 c0 08             	add    $0x8,%eax
 e15:	50                   	push   %eax
 e16:	e8 e5 fe ff ff       	call   d00 <free>
  return freep;
 e1b:	8b 15 10 20 00 00    	mov    0x2010,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 e21:	83 c4 10             	add    $0x10,%esp
 e24:	85 d2                	test   %edx,%edx
 e26:	75 c0                	jne    de8 <malloc+0x58>
        return 0;
 e28:	31 c0                	xor    %eax,%eax
 e2a:	eb 1c                	jmp    e48 <malloc+0xb8>
 e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 e30:	39 cf                	cmp    %ecx,%edi
 e32:	74 1c                	je     e50 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 e34:	29 f9                	sub    %edi,%ecx
 e36:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 e39:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 e3c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 e3f:	89 15 10 20 00 00    	mov    %edx,0x2010
      return (void*)(p + 1);
 e45:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 e48:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e4b:	5b                   	pop    %ebx
 e4c:	5e                   	pop    %esi
 e4d:	5f                   	pop    %edi
 e4e:	5d                   	pop    %ebp
 e4f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 e50:	8b 08                	mov    (%eax),%ecx
 e52:	89 0a                	mov    %ecx,(%edx)
 e54:	eb e9                	jmp    e3f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 e56:	c7 05 10 20 00 00 14 	movl   $0x2014,0x2010
 e5d:	20 00 00 
 e60:	c7 05 14 20 00 00 14 	movl   $0x2014,0x2014
 e67:	20 00 00 
    base.s.size = 0;
 e6a:	b8 14 20 00 00       	mov    $0x2014,%eax
 e6f:	c7 05 18 20 00 00 00 	movl   $0x0,0x2018
 e76:	00 00 00 
 e79:	e9 3e ff ff ff       	jmp    dbc <malloc+0x2c>
 e7e:	66 90                	xchg   %ax,%ax

00000e80 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
 e80:	55                   	push   %ebp
 e81:	89 e5                	mov    %esp,%ebp
 e83:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 e86:	6a 10                	push   $0x10
 e88:	6a 02                	push   $0x2
 e8a:	ff 75 08             	pushl  0x8(%ebp)
 e8d:	e8 d6 fb ff ff       	call   a68 <ioctl>
}
 e92:	c9                   	leave  
 e93:	c3                   	ret    
 e94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 e9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ea0 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
 ea0:	55                   	push   %ebp
 ea1:	89 e5                	mov    %esp,%ebp
 ea3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
 ea6:	68 00 10 00 00       	push   $0x1000
 eab:	6a 02                	push   $0x2
 ead:	ff 75 08             	pushl  0x8(%ebp)
 eb0:	e8 b3 fb ff ff       	call   a68 <ioctl>
}
 eb5:	c9                   	leave  
 eb6:	c3                   	ret    
 eb7:	89 f6                	mov    %esi,%esi
 eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ec0 <attach_tty>:

int
attach_tty(int tty_fd)
{
 ec0:	55                   	push   %ebp
 ec1:	89 e5                	mov    %esp,%ebp
 ec3:	53                   	push   %ebx
 ec4:	83 ec 08             	sub    $0x8,%esp
 ec7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
 eca:	6a 10                	push   $0x10
 ecc:	6a 01                	push   $0x1
 ece:	53                   	push   %ebx
 ecf:	e8 94 fb ff ff       	call   a68 <ioctl>
 ed4:	83 c4 10             	add    $0x10,%esp
 ed7:	85 c0                	test   %eax,%eax
 ed9:	78 55                	js     f30 <attach_tty+0x70>
     return -1;

    close(0);
 edb:	83 ec 0c             	sub    $0xc,%esp
 ede:	6a 00                	push   $0x0
 ee0:	e8 db fa ff ff       	call   9c0 <close>
    close(1);
 ee5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 eec:	e8 cf fa ff ff       	call   9c0 <close>
    close(2);
 ef1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 ef8:	e8 c3 fa ff ff       	call   9c0 <close>
    if(dup(tty_fd) < 0)
 efd:	89 1c 24             	mov    %ebx,(%esp)
 f00:	e8 0b fb ff ff       	call   a10 <dup>
 f05:	83 c4 10             	add    $0x10,%esp
 f08:	85 c0                	test   %eax,%eax
 f0a:	78 24                	js     f30 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 f0c:	83 ec 0c             	sub    $0xc,%esp
 f0f:	53                   	push   %ebx
 f10:	e8 fb fa ff ff       	call   a10 <dup>
 f15:	83 c4 10             	add    $0x10,%esp
 f18:	85 c0                	test   %eax,%eax
 f1a:	78 14                	js     f30 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
 f1c:	83 ec 0c             	sub    $0xc,%esp
 f1f:	53                   	push   %ebx
 f20:	e8 eb fa ff ff       	call   a10 <dup>
 f25:	83 c4 10             	add    $0x10,%esp
 f28:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
 f2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f2e:	c9                   	leave  
 f2f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
 f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
 f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f38:	c9                   	leave  
 f39:	c3                   	ret    
 f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000f40 <detach_tty>:

int
detach_tty(int tty_fd)
{
 f40:	55                   	push   %ebp
 f41:	89 e5                	mov    %esp,%ebp
 f43:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
 f46:	6a 20                	push   $0x20
 f48:	6a 01                	push   $0x1
 f4a:	ff 75 08             	pushl  0x8(%ebp)
 f4d:	e8 16 fb ff ff       	call   a68 <ioctl>
    return 0;
}
 f52:	31 c0                	xor    %eax,%eax
 f54:	c9                   	leave  
 f55:	c3                   	ret    
 f56:	8d 76 00             	lea    0x0(%esi),%esi
 f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f60 <connect_tty>:


int
connect_tty(int tty_fd)
{
 f60:	55                   	push   %ebp
 f61:	89 e5                	mov    %esp,%ebp
 f63:	53                   	push   %ebx
 f64:	83 ec 08             	sub    $0x8,%esp
 f67:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
 f6a:	6a 10                	push   $0x10
 f6c:	6a 02                	push   $0x2
 f6e:	53                   	push   %ebx
 f6f:	e8 f4 fa ff ff       	call   a68 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
 f74:	83 c4 10             	add    $0x10,%esp
 f77:	85 c0                	test   %eax,%eax
 f79:	74 1d                	je     f98 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
 f7b:	83 ec 04             	sub    $0x4,%esp
 f7e:	68 00 10 00 00       	push   $0x1000
 f83:	6a 01                	push   $0x1
 f85:	53                   	push   %ebx
 f86:	e8 dd fa ff ff       	call   a68 <ioctl>
     return tty_fd;
 f8b:	83 c4 10             	add    $0x10,%esp
 f8e:	89 d8                	mov    %ebx,%eax
}
 f90:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f93:	c9                   	leave  
 f94:	c3                   	ret    
 f95:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
 f98:	83 ec 0c             	sub    $0xc,%esp
 f9b:	53                   	push   %ebx
 f9c:	e8 1f fa ff ff       	call   9c0 <close>
       return -1;
 fa1:	83 c4 10             	add    $0x10,%esp
 fa4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 fa9:	eb e5                	jmp    f90 <connect_tty+0x30>
 fab:	90                   	nop
 fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000fb0 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
 fb0:	55                   	push   %ebp
 fb1:	89 e5                	mov    %esp,%ebp
 fb3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
 fb6:	68 00 20 00 00       	push   $0x2000
 fbb:	6a 01                	push   $0x1
 fbd:	ff 75 08             	pushl  0x8(%ebp)
 fc0:	e8 a3 fa ff ff       	call   a68 <ioctl>
}
 fc5:	c9                   	leave  
 fc6:	c3                   	ret    
