
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
       6:	68 4c 4a 00 00       	push   $0x4a4c
       b:	ff 35 04 80 00 00    	pushl  0x8004
      11:	e8 2a 45 00 00       	call   4540 <printf>

  if(mkdir("iputdir") < 0){
      16:	c7 04 24 df 49 00 00 	movl   $0x49df,(%esp)
      1d:	e8 ce 43 00 00       	call   43f0 <mkdir>
      22:	83 c4 10             	add    $0x10,%esp
      25:	85 c0                	test   %eax,%eax
      27:	78 58                	js     81 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit(1);
  }
  if(chdir("iputdir") < 0){
      29:	83 ec 0c             	sub    $0xc,%esp
      2c:	68 df 49 00 00       	push   $0x49df
      31:	e8 c2 43 00 00       	call   43f8 <chdir>
      36:	83 c4 10             	add    $0x10,%esp
      39:	85 c0                	test   %eax,%eax
      3b:	0f 88 9a 00 00 00    	js     db <iputtest+0xdb>
    printf(stdout, "chdir iputdir failed\n");
    exit(1);
  }
  if(unlink("../iputdir") < 0){
      41:	83 ec 0c             	sub    $0xc,%esp
      44:	68 dc 49 00 00       	push   $0x49dc
      49:	e8 8a 43 00 00       	call   43d8 <unlink>
      4e:	83 c4 10             	add    $0x10,%esp
      51:	85 c0                	test   %eax,%eax
      53:	78 68                	js     bd <iputtest+0xbd>
    printf(stdout, "unlink ../iputdir failed\n");
    exit(1);
  }
  if(chdir("/") < 0){
      55:	83 ec 0c             	sub    $0xc,%esp
      58:	68 01 4a 00 00       	push   $0x4a01
      5d:	e8 96 43 00 00       	call   43f8 <chdir>
      62:	83 c4 10             	add    $0x10,%esp
      65:	85 c0                	test   %eax,%eax
      67:	78 36                	js     9f <iputtest+0x9f>
    printf(stdout, "chdir / failed\n");
    exit(1);
  }
  printf(stdout, "iput test ok\n");
      69:	83 ec 08             	sub    $0x8,%esp
      6c:	68 84 4a 00 00       	push   $0x4a84
      71:	ff 35 04 80 00 00    	pushl  0x8004
      77:	e8 c4 44 00 00       	call   4540 <printf>
}
      7c:	83 c4 10             	add    $0x10,%esp
      7f:	c9                   	leave  
      80:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
      81:	50                   	push   %eax
      82:	50                   	push   %eax
      83:	68 b8 49 00 00       	push   $0x49b8
      88:	ff 35 04 80 00 00    	pushl  0x8004
      8e:	e8 ad 44 00 00       	call   4540 <printf>
    exit(1);
      93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      9a:	e8 e9 42 00 00       	call   4388 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit(1);
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
      9f:	50                   	push   %eax
      a0:	50                   	push   %eax
      a1:	68 03 4a 00 00       	push   $0x4a03
      a6:	ff 35 04 80 00 00    	pushl  0x8004
      ac:	e8 8f 44 00 00       	call   4540 <printf>
    exit(1);
      b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      b8:	e8 cb 42 00 00       	call   4388 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit(1);
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
      bd:	52                   	push   %edx
      be:	52                   	push   %edx
      bf:	68 e7 49 00 00       	push   $0x49e7
      c4:	ff 35 04 80 00 00    	pushl  0x8004
      ca:	e8 71 44 00 00       	call   4540 <printf>
    exit(1);
      cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      d6:	e8 ad 42 00 00       	call   4388 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit(1);
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
      db:	51                   	push   %ecx
      dc:	51                   	push   %ecx
      dd:	68 c6 49 00 00       	push   $0x49c6
      e2:	ff 35 04 80 00 00    	pushl  0x8004
      e8:	e8 53 44 00 00       	call   4540 <printf>
    exit(1);
      ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      f4:	e8 8f 42 00 00       	call   4388 <exit>
      f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000100 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     106:	68 13 4a 00 00       	push   $0x4a13
     10b:	ff 35 04 80 00 00    	pushl  0x8004
     111:	e8 2a 44 00 00       	call   4540 <printf>

  pid = fork();
     116:	e8 65 42 00 00       	call   4380 <fork>
  if(pid < 0){
     11b:	83 c4 10             	add    $0x10,%esp
     11e:	85 c0                	test   %eax,%eax
     120:	0f 88 a1 00 00 00    	js     1c7 <exitiputtest+0xc7>
    printf(stdout, "fork failed\n");
    exit(1);
  }
  if(pid == 0){
     126:	75 58                	jne    180 <exitiputtest+0x80>
    if(mkdir("iputdir") < 0){
     128:	83 ec 0c             	sub    $0xc,%esp
     12b:	68 df 49 00 00       	push   $0x49df
     130:	e8 bb 42 00 00       	call   43f0 <mkdir>
     135:	83 c4 10             	add    $0x10,%esp
     138:	85 c0                	test   %eax,%eax
     13a:	0f 88 c3 00 00 00    	js     203 <exitiputtest+0x103>
      printf(stdout, "mkdir failed\n");
      exit(1);
    }
    if(chdir("iputdir") < 0){
     140:	83 ec 0c             	sub    $0xc,%esp
     143:	68 df 49 00 00       	push   $0x49df
     148:	e8 ab 42 00 00       	call   43f8 <chdir>
     14d:	83 c4 10             	add    $0x10,%esp
     150:	85 c0                	test   %eax,%eax
     152:	0f 88 8d 00 00 00    	js     1e5 <exitiputtest+0xe5>
      printf(stdout, "child chdir failed\n");
      exit(1);
    }
    if(unlink("../iputdir") < 0){
     158:	83 ec 0c             	sub    $0xc,%esp
     15b:	68 dc 49 00 00       	push   $0x49dc
     160:	e8 73 42 00 00       	call   43d8 <unlink>
     165:	83 c4 10             	add    $0x10,%esp
     168:	85 c0                	test   %eax,%eax
     16a:	78 3c                	js     1a8 <exitiputtest+0xa8>
      printf(stdout, "unlink ../iputdir failed\n");
      exit(1);
    }
    exit(0);
     16c:	83 ec 0c             	sub    $0xc,%esp
     16f:	6a 00                	push   $0x0
     171:	e8 12 42 00 00       	call   4388 <exit>
     176:	8d 76 00             	lea    0x0(%esi),%esi
     179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
  wait(0);
     180:	83 ec 0c             	sub    $0xc,%esp
     183:	6a 00                	push   $0x0
     185:	e8 06 42 00 00       	call   4390 <wait>
  printf(stdout, "exitiput test ok\n");
     18a:	58                   	pop    %eax
     18b:	5a                   	pop    %edx
     18c:	68 36 4a 00 00       	push   $0x4a36
     191:	ff 35 04 80 00 00    	pushl  0x8004
     197:	e8 a4 43 00 00       	call   4540 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
     1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit(1);
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     1a8:	83 ec 08             	sub    $0x8,%esp
     1ab:	68 e7 49 00 00       	push   $0x49e7
     1b0:	ff 35 04 80 00 00    	pushl  0x8004
     1b6:	e8 85 43 00 00       	call   4540 <printf>
      exit(1);
     1bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1c2:	e8 c1 41 00 00       	call   4388 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     1c7:	50                   	push   %eax
     1c8:	50                   	push   %eax
     1c9:	68 f9 58 00 00       	push   $0x58f9
     1ce:	ff 35 04 80 00 00    	pushl  0x8004
     1d4:	e8 67 43 00 00       	call   4540 <printf>
    exit(1);
     1d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1e0:	e8 a3 41 00 00       	call   4388 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit(1);
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     1e5:	51                   	push   %ecx
     1e6:	51                   	push   %ecx
     1e7:	68 22 4a 00 00       	push   $0x4a22
     1ec:	ff 35 04 80 00 00    	pushl  0x8004
     1f2:	e8 49 43 00 00       	call   4540 <printf>
      exit(1);
     1f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1fe:	e8 85 41 00 00       	call   4388 <exit>
    printf(stdout, "fork failed\n");
    exit(1);
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     203:	50                   	push   %eax
     204:	50                   	push   %eax
     205:	68 b8 49 00 00       	push   $0x49b8
     20a:	ff 35 04 80 00 00    	pushl  0x8004
     210:	e8 2b 43 00 00       	call   4540 <printf>
      exit(1);
     215:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     21c:	e8 67 41 00 00       	call   4388 <exit>
     221:	eb 0d                	jmp    230 <openiputtest>
     223:	90                   	nop
     224:	90                   	nop
     225:	90                   	nop
     226:	90                   	nop
     227:	90                   	nop
     228:	90                   	nop
     229:	90                   	nop
     22a:	90                   	nop
     22b:	90                   	nop
     22c:	90                   	nop
     22d:	90                   	nop
     22e:	90                   	nop
     22f:	90                   	nop

00000230 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     236:	68 48 4a 00 00       	push   $0x4a48
     23b:	ff 35 04 80 00 00    	pushl  0x8004
     241:	e8 fa 42 00 00       	call   4540 <printf>
  if(mkdir("oidir") < 0){
     246:	c7 04 24 57 4a 00 00 	movl   $0x4a57,(%esp)
     24d:	e8 9e 41 00 00       	call   43f0 <mkdir>
     252:	83 c4 10             	add    $0x10,%esp
     255:	85 c0                	test   %eax,%eax
     257:	0f 88 9d 00 00 00    	js     2fa <openiputtest+0xca>
    printf(stdout, "mkdir oidir failed\n");
    exit(1);
  }
  pid = fork();
     25d:	e8 1e 41 00 00       	call   4380 <fork>
  if(pid < 0){
     262:	85 c0                	test   %eax,%eax
     264:	0f 88 ae 00 00 00    	js     318 <openiputtest+0xe8>
    printf(stdout, "fork failed\n");
    exit(1);
  }
  if(pid == 0){
     26a:	75 3c                	jne    2a8 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
     26c:	83 ec 08             	sub    $0x8,%esp
     26f:	6a 02                	push   $0x2
     271:	68 57 4a 00 00       	push   $0x4a57
     276:	e8 4d 41 00 00       	call   43c8 <open>
    if(fd >= 0){
     27b:	83 c4 10             	add    $0x10,%esp
     27e:	85 c0                	test   %eax,%eax
     280:	78 6e                	js     2f0 <openiputtest+0xc0>
      printf(stdout, "open directory for write succeeded\n");
     282:	83 ec 08             	sub    $0x8,%esp
     285:	68 50 5b 00 00       	push   $0x5b50
     28a:	ff 35 04 80 00 00    	pushl  0x8004
     290:	e8 ab 42 00 00       	call   4540 <printf>
      exit(0);
     295:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     29c:	e8 e7 40 00 00       	call   4388 <exit>
     2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    exit(0);
  }
  sleep(1);
     2a8:	83 ec 0c             	sub    $0xc,%esp
     2ab:	6a 01                	push   $0x1
     2ad:	e8 66 41 00 00       	call   4418 <sleep>
  if(unlink("oidir") != 0){
     2b2:	c7 04 24 57 4a 00 00 	movl   $0x4a57,(%esp)
     2b9:	e8 1a 41 00 00       	call   43d8 <unlink>
     2be:	83 c4 10             	add    $0x10,%esp
     2c1:	85 c0                	test   %eax,%eax
     2c3:	75 71                	jne    336 <openiputtest+0x106>
    printf(stdout, "unlink failed\n");
    exit(1);
  }
  wait(0);
     2c5:	83 ec 0c             	sub    $0xc,%esp
     2c8:	6a 00                	push   $0x0
     2ca:	e8 c1 40 00 00       	call   4390 <wait>
  printf(stdout, "openiput test ok\n");
     2cf:	58                   	pop    %eax
     2d0:	5a                   	pop    %edx
     2d1:	68 80 4a 00 00       	push   $0x4a80
     2d6:	ff 35 04 80 00 00    	pushl  0x8004
     2dc:	e8 5f 42 00 00       	call   4540 <printf>
}
     2e1:	83 c4 10             	add    $0x10,%esp
     2e4:	c9                   	leave  
     2e5:	c3                   	ret    
     2e6:	8d 76 00             	lea    0x0(%esi),%esi
     2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit(0);
    }
    exit(0);
     2f0:	83 ec 0c             	sub    $0xc,%esp
     2f3:	6a 00                	push   $0x0
     2f5:	e8 8e 40 00 00       	call   4388 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     2fa:	50                   	push   %eax
     2fb:	50                   	push   %eax
     2fc:	68 5d 4a 00 00       	push   $0x4a5d
     301:	ff 35 04 80 00 00    	pushl  0x8004
     307:	e8 34 42 00 00       	call   4540 <printf>
    exit(1);
     30c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     313:	e8 70 40 00 00       	call   4388 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     318:	50                   	push   %eax
     319:	50                   	push   %eax
     31a:	68 f9 58 00 00       	push   $0x58f9
     31f:	ff 35 04 80 00 00    	pushl  0x8004
     325:	e8 16 42 00 00       	call   4540 <printf>
    exit(1);
     32a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     331:	e8 52 40 00 00       	call   4388 <exit>
    }
    exit(0);
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     336:	51                   	push   %ecx
     337:	51                   	push   %ecx
     338:	68 71 4a 00 00       	push   $0x4a71
     33d:	ff 35 04 80 00 00    	pushl  0x8004
     343:	e8 f8 41 00 00       	call   4540 <printf>
    exit(1);
     348:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     34f:	e8 34 40 00 00       	call   4388 <exit>
     354:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     35a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000360 <opentest>:

// simple file system tests

void
opentest(void)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     366:	68 92 4a 00 00       	push   $0x4a92
     36b:	ff 35 04 80 00 00    	pushl  0x8004
     371:	e8 ca 41 00 00       	call   4540 <printf>
  fd = open("echo", 0);
     376:	58                   	pop    %eax
     377:	5a                   	pop    %edx
     378:	6a 00                	push   $0x0
     37a:	68 9d 4a 00 00       	push   $0x4a9d
     37f:	e8 44 40 00 00       	call   43c8 <open>
  if(fd < 0){
     384:	83 c4 10             	add    $0x10,%esp
     387:	85 c0                	test   %eax,%eax
     389:	78 36                	js     3c1 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit(1);
  }
  close(fd);
     38b:	83 ec 0c             	sub    $0xc,%esp
     38e:	50                   	push   %eax
     38f:	e8 1c 40 00 00       	call   43b0 <close>
  fd = open("doesnotexist", 0);
     394:	5a                   	pop    %edx
     395:	59                   	pop    %ecx
     396:	6a 00                	push   $0x0
     398:	68 b5 4a 00 00       	push   $0x4ab5
     39d:	e8 26 40 00 00       	call   43c8 <open>
  if(fd >= 0){
     3a2:	83 c4 10             	add    $0x10,%esp
     3a5:	85 c0                	test   %eax,%eax
     3a7:	79 36                	jns    3df <opentest+0x7f>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit(1);
  }
  printf(stdout, "open test ok\n");
     3a9:	83 ec 08             	sub    $0x8,%esp
     3ac:	68 e0 4a 00 00       	push   $0x4ae0
     3b1:	ff 35 04 80 00 00    	pushl  0x8004
     3b7:	e8 84 41 00 00       	call   4540 <printf>
}
     3bc:	83 c4 10             	add    $0x10,%esp
     3bf:	c9                   	leave  
     3c0:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     3c1:	50                   	push   %eax
     3c2:	50                   	push   %eax
     3c3:	68 a2 4a 00 00       	push   $0x4aa2
     3c8:	ff 35 04 80 00 00    	pushl  0x8004
     3ce:	e8 6d 41 00 00       	call   4540 <printf>
    exit(1);
     3d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3da:	e8 a9 3f 00 00       	call   4388 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     3df:	50                   	push   %eax
     3e0:	50                   	push   %eax
     3e1:	68 c2 4a 00 00       	push   $0x4ac2
     3e6:	ff 35 04 80 00 00    	pushl  0x8004
     3ec:	e8 4f 41 00 00       	call   4540 <printf>
    exit(1);
     3f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3f8:	e8 8b 3f 00 00       	call   4388 <exit>
     3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	56                   	push   %esi
     404:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     405:	83 ec 08             	sub    $0x8,%esp
     408:	68 ee 4a 00 00       	push   $0x4aee
     40d:	ff 35 04 80 00 00    	pushl  0x8004
     413:	e8 28 41 00 00       	call   4540 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     418:	59                   	pop    %ecx
     419:	5b                   	pop    %ebx
     41a:	68 02 02 00 00       	push   $0x202
     41f:	68 ff 4a 00 00       	push   $0x4aff
     424:	e8 9f 3f 00 00       	call   43c8 <open>
  if(fd >= 0){
     429:	83 c4 10             	add    $0x10,%esp
     42c:	85 c0                	test   %eax,%eax
     42e:	0f 88 b2 01 00 00    	js     5e6 <writetest+0x1e6>
    printf(stdout, "creat small succeeded; ok\n");
     434:	83 ec 08             	sub    $0x8,%esp
     437:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
     439:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     43b:	68 05 4b 00 00       	push   $0x4b05
     440:	ff 35 04 80 00 00    	pushl  0x8004
     446:	e8 f5 40 00 00       	call   4540 <printf>
     44b:	83 c4 10             	add    $0x10,%esp
     44e:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     450:	83 ec 04             	sub    $0x4,%esp
     453:	6a 0a                	push   $0xa
     455:	68 3c 4b 00 00       	push   $0x4b3c
     45a:	56                   	push   %esi
     45b:	e8 48 3f 00 00       	call   43a8 <write>
     460:	83 c4 10             	add    $0x10,%esp
     463:	83 f8 0a             	cmp    $0xa,%eax
     466:	0f 85 dd 00 00 00    	jne    549 <writetest+0x149>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit(1);
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     46c:	83 ec 04             	sub    $0x4,%esp
     46f:	6a 0a                	push   $0xa
     471:	68 47 4b 00 00       	push   $0x4b47
     476:	56                   	push   %esi
     477:	e8 2c 3f 00 00       	call   43a8 <write>
     47c:	83 c4 10             	add    $0x10,%esp
     47f:	83 f8 0a             	cmp    $0xa,%eax
     482:	0f 85 e1 00 00 00    	jne    569 <writetest+0x169>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
     488:	83 c3 01             	add    $0x1,%ebx
     48b:	83 fb 64             	cmp    $0x64,%ebx
     48e:	75 c0                	jne    450 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit(1);
    }
  }
  printf(stdout, "writes ok\n");
     490:	83 ec 08             	sub    $0x8,%esp
     493:	68 52 4b 00 00       	push   $0x4b52
     498:	ff 35 04 80 00 00    	pushl  0x8004
     49e:	e8 9d 40 00 00       	call   4540 <printf>
  close(fd);
     4a3:	89 34 24             	mov    %esi,(%esp)
     4a6:	e8 05 3f 00 00       	call   43b0 <close>
  fd = open("small", O_RDONLY);
     4ab:	58                   	pop    %eax
     4ac:	5a                   	pop    %edx
     4ad:	6a 00                	push   $0x0
     4af:	68 ff 4a 00 00       	push   $0x4aff
     4b4:	e8 0f 3f 00 00       	call   43c8 <open>
  if(fd >= 0){
     4b9:	83 c4 10             	add    $0x10,%esp
     4bc:	85 c0                	test   %eax,%eax
      exit(1);
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     4be:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     4c0:	0f 88 c3 00 00 00    	js     589 <writetest+0x189>
    printf(stdout, "open small succeeded ok\n");
     4c6:	83 ec 08             	sub    $0x8,%esp
     4c9:	68 5d 4b 00 00       	push   $0x4b5d
     4ce:	ff 35 04 80 00 00    	pushl  0x8004
     4d4:	e8 67 40 00 00       	call   4540 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit(1);
  }
  i = read(fd, buf, 2000);
     4d9:	83 c4 0c             	add    $0xc,%esp
     4dc:	68 d0 07 00 00       	push   $0x7d0
     4e1:	68 e0 a7 00 00       	push   $0xa7e0
     4e6:	53                   	push   %ebx
     4e7:	e8 b4 3e 00 00       	call   43a0 <read>
  if(i == 2000){
     4ec:	83 c4 10             	add    $0x10,%esp
     4ef:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     4f4:	0f 85 ae 00 00 00    	jne    5a8 <writetest+0x1a8>
    printf(stdout, "read succeeded ok\n");
     4fa:	83 ec 08             	sub    $0x8,%esp
     4fd:	68 91 4b 00 00       	push   $0x4b91
     502:	ff 35 04 80 00 00    	pushl  0x8004
     508:	e8 33 40 00 00       	call   4540 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit(1);
  }
  close(fd);
     50d:	89 1c 24             	mov    %ebx,(%esp)
     510:	e8 9b 3e 00 00       	call   43b0 <close>

  if(unlink("small") < 0){
     515:	c7 04 24 ff 4a 00 00 	movl   $0x4aff,(%esp)
     51c:	e8 b7 3e 00 00       	call   43d8 <unlink>
     521:	83 c4 10             	add    $0x10,%esp
     524:	85 c0                	test   %eax,%eax
     526:	0f 88 9b 00 00 00    	js     5c7 <writetest+0x1c7>
    printf(stdout, "unlink small failed\n");
    exit(1);
  }
  printf(stdout, "small file test ok\n");
     52c:	83 ec 08             	sub    $0x8,%esp
     52f:	68 b9 4b 00 00       	push   $0x4bb9
     534:	ff 35 04 80 00 00    	pushl  0x8004
     53a:	e8 01 40 00 00       	call   4540 <printf>
}
     53f:	83 c4 10             	add    $0x10,%esp
     542:	8d 65 f8             	lea    -0x8(%ebp),%esp
     545:	5b                   	pop    %ebx
     546:	5e                   	pop    %esi
     547:	5d                   	pop    %ebp
     548:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     549:	83 ec 04             	sub    $0x4,%esp
     54c:	53                   	push   %ebx
     54d:	68 74 5b 00 00       	push   $0x5b74
     552:	ff 35 04 80 00 00    	pushl  0x8004
     558:	e8 e3 3f 00 00       	call   4540 <printf>
      exit(1);
     55d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     564:	e8 1f 3e 00 00       	call   4388 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     569:	83 ec 04             	sub    $0x4,%esp
     56c:	53                   	push   %ebx
     56d:	68 98 5b 00 00       	push   $0x5b98
     572:	ff 35 04 80 00 00    	pushl  0x8004
     578:	e8 c3 3f 00 00       	call   4540 <printf>
      exit(1);
     57d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     584:	e8 ff 3d 00 00       	call   4388 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     589:	83 ec 08             	sub    $0x8,%esp
     58c:	68 76 4b 00 00       	push   $0x4b76
     591:	ff 35 04 80 00 00    	pushl  0x8004
     597:	e8 a4 3f 00 00       	call   4540 <printf>
    exit(1);
     59c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5a3:	e8 e0 3d 00 00       	call   4388 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 bd 4e 00 00       	push   $0x4ebd
     5b0:	ff 35 04 80 00 00    	pushl  0x8004
     5b6:	e8 85 3f 00 00       	call   4540 <printf>
    exit(1);
     5bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5c2:	e8 c1 3d 00 00       	call   4388 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     5c7:	83 ec 08             	sub    $0x8,%esp
     5ca:	68 a4 4b 00 00       	push   $0x4ba4
     5cf:	ff 35 04 80 00 00    	pushl  0x8004
     5d5:	e8 66 3f 00 00       	call   4540 <printf>
    exit(1);
     5da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5e1:	e8 a2 3d 00 00       	call   4388 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     5e6:	83 ec 08             	sub    $0x8,%esp
     5e9:	68 20 4b 00 00       	push   $0x4b20
     5ee:	ff 35 04 80 00 00    	pushl  0x8004
     5f4:	e8 47 3f 00 00       	call   4540 <printf>
    exit(1);
     5f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     600:	e8 83 3d 00 00       	call   4388 <exit>
     605:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000610 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     610:	55                   	push   %ebp
     611:	89 e5                	mov    %esp,%ebp
     613:	56                   	push   %esi
     614:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     615:	83 ec 08             	sub    $0x8,%esp
     618:	68 cd 4b 00 00       	push   $0x4bcd
     61d:	ff 35 04 80 00 00    	pushl  0x8004
     623:	e8 18 3f 00 00       	call   4540 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     628:	59                   	pop    %ecx
     629:	5b                   	pop    %ebx
     62a:	68 02 02 00 00       	push   $0x202
     62f:	68 47 4c 00 00       	push   $0x4c47
     634:	e8 8f 3d 00 00       	call   43c8 <open>
  if(fd < 0){
     639:	83 c4 10             	add    $0x10,%esp
     63c:	85 c0                	test   %eax,%eax
     63e:	0f 88 8b 01 00 00    	js     7cf <writetest1+0x1bf>
     644:	89 c6                	mov    %eax,%esi
     646:	31 db                	xor    %ebx,%ebx
     648:	90                   	nop
     649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit(1);
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     650:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit(1);
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     653:	89 1d e0 a7 00 00    	mov    %ebx,0xa7e0
    if(write(fd, buf, 512) != 512){
     659:	68 00 02 00 00       	push   $0x200
     65e:	68 e0 a7 00 00       	push   $0xa7e0
     663:	56                   	push   %esi
     664:	e8 3f 3d 00 00       	call   43a8 <write>
     669:	83 c4 10             	add    $0x10,%esp
     66c:	3d 00 02 00 00       	cmp    $0x200,%eax
     671:	0f 85 b7 00 00 00    	jne    72e <writetest1+0x11e>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit(1);
  }

  for(i = 0; i < MAXFILE; i++){
     677:	83 c3 01             	add    $0x1,%ebx
     67a:	81 fb 0c 01 00 00    	cmp    $0x10c,%ebx
     680:	75 ce                	jne    650 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit(1);
    }
  }

  close(fd);
     682:	83 ec 0c             	sub    $0xc,%esp
     685:	56                   	push   %esi
     686:	e8 25 3d 00 00       	call   43b0 <close>

  fd = open("big", O_RDONLY);
     68b:	58                   	pop    %eax
     68c:	5a                   	pop    %edx
     68d:	6a 00                	push   $0x0
     68f:	68 47 4c 00 00       	push   $0x4c47
     694:	e8 2f 3d 00 00       	call   43c8 <open>
  if(fd < 0){
     699:	83 c4 10             	add    $0x10,%esp
     69c:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     69e:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6a0:	0f 88 0a 01 00 00    	js     7b0 <writetest1+0x1a0>
     6a6:	31 db                	xor    %ebx,%ebx
     6a8:	eb 21                	jmp    6cb <writetest1+0xbb>
     6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit(0);
      }
      break;
    } else if(i != 512){
     6b0:	3d 00 02 00 00       	cmp    $0x200,%eax
     6b5:	0f 85 b1 00 00 00    	jne    76c <writetest1+0x15c>
      printf(stdout, "read failed %d\n", i);
      exit(1);
    }
    if(((int*)buf)[0] != n){
     6bb:	a1 e0 a7 00 00       	mov    0xa7e0,%eax
     6c0:	39 c3                	cmp    %eax,%ebx
     6c2:	0f 85 86 00 00 00    	jne    74e <writetest1+0x13e>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit(0);
    }
    n++;
     6c8:	83 c3 01             	add    $0x1,%ebx
    exit(1);
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     6cb:	83 ec 04             	sub    $0x4,%esp
     6ce:	68 00 02 00 00       	push   $0x200
     6d3:	68 e0 a7 00 00       	push   $0xa7e0
     6d8:	56                   	push   %esi
     6d9:	e8 c2 3c 00 00       	call   43a0 <read>
    if(i == 0){
     6de:	83 c4 10             	add    $0x10,%esp
     6e1:	85 c0                	test   %eax,%eax
     6e3:	75 cb                	jne    6b0 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     6e5:	81 fb 0b 01 00 00    	cmp    $0x10b,%ebx
     6eb:	0f 84 9b 00 00 00    	je     78c <writetest1+0x17c>
             n, ((int*)buf)[0]);
      exit(0);
    }
    n++;
  }
  close(fd);
     6f1:	83 ec 0c             	sub    $0xc,%esp
     6f4:	56                   	push   %esi
     6f5:	e8 b6 3c 00 00       	call   43b0 <close>
  if(unlink("big") < 0){
     6fa:	c7 04 24 47 4c 00 00 	movl   $0x4c47,(%esp)
     701:	e8 d2 3c 00 00       	call   43d8 <unlink>
     706:	83 c4 10             	add    $0x10,%esp
     709:	85 c0                	test   %eax,%eax
     70b:	0f 88 dd 00 00 00    	js     7ee <writetest1+0x1de>
    printf(stdout, "unlink big failed\n");
    exit(1);
  }
  printf(stdout, "big files ok\n");
     711:	83 ec 08             	sub    $0x8,%esp
     714:	68 6e 4c 00 00       	push   $0x4c6e
     719:	ff 35 04 80 00 00    	pushl  0x8004
     71f:	e8 1c 3e 00 00       	call   4540 <printf>
}
     724:	83 c4 10             	add    $0x10,%esp
     727:	8d 65 f8             	lea    -0x8(%ebp),%esp
     72a:	5b                   	pop    %ebx
     72b:	5e                   	pop    %esi
     72c:	5d                   	pop    %ebp
     72d:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     72e:	83 ec 04             	sub    $0x4,%esp
     731:	53                   	push   %ebx
     732:	68 f7 4b 00 00       	push   $0x4bf7
     737:	ff 35 04 80 00 00    	pushl  0x8004
     73d:	e8 fe 3d 00 00       	call   4540 <printf>
      exit(1);
     742:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     749:	e8 3a 3c 00 00       	call   4388 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit(1);
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     74e:	50                   	push   %eax
     74f:	53                   	push   %ebx
     750:	68 bc 5b 00 00       	push   $0x5bbc
     755:	ff 35 04 80 00 00    	pushl  0x8004
     75b:	e8 e0 3d 00 00       	call   4540 <printf>
             n, ((int*)buf)[0]);
      exit(0);
     760:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     767:	e8 1c 3c 00 00       	call   4388 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit(0);
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     76c:	83 ec 04             	sub    $0x4,%esp
     76f:	50                   	push   %eax
     770:	68 4b 4c 00 00       	push   $0x4c4b
     775:	ff 35 04 80 00 00    	pushl  0x8004
     77b:	e8 c0 3d 00 00       	call   4540 <printf>
      exit(1);
     780:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     787:	e8 fc 3b 00 00       	call   4388 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     78c:	83 ec 04             	sub    $0x4,%esp
     78f:	68 0b 01 00 00       	push   $0x10b
     794:	68 2e 4c 00 00       	push   $0x4c2e
     799:	ff 35 04 80 00 00    	pushl  0x8004
     79f:	e8 9c 3d 00 00       	call   4540 <printf>
        exit(0);
     7a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     7ab:	e8 d8 3b 00 00       	call   4388 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7b0:	83 ec 08             	sub    $0x8,%esp
     7b3:	68 15 4c 00 00       	push   $0x4c15
     7b8:	ff 35 04 80 00 00    	pushl  0x8004
     7be:	e8 7d 3d 00 00       	call   4540 <printf>
    exit(1);
     7c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7ca:	e8 b9 3b 00 00       	call   4388 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7cf:	83 ec 08             	sub    $0x8,%esp
     7d2:	68 dd 4b 00 00       	push   $0x4bdd
     7d7:	ff 35 04 80 00 00    	pushl  0x8004
     7dd:	e8 5e 3d 00 00       	call   4540 <printf>
    exit(1);
     7e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7e9:	e8 9a 3b 00 00       	call   4388 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     7ee:	83 ec 08             	sub    $0x8,%esp
     7f1:	68 5b 4c 00 00       	push   $0x4c5b
     7f6:	ff 35 04 80 00 00    	pushl  0x8004
     7fc:	e8 3f 3d 00 00       	call   4540 <printf>
    exit(1);
     801:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     808:	e8 7b 3b 00 00       	call   4388 <exit>
     80d:	8d 76 00             	lea    0x0(%esi),%esi

00000810 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     810:	55                   	push   %ebp
     811:	89 e5                	mov    %esp,%ebp
     813:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     814:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     819:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     81c:	68 dc 5b 00 00       	push   $0x5bdc
     821:	ff 35 04 80 00 00    	pushl  0x8004
     827:	e8 14 3d 00 00       	call   4540 <printf>

  name[0] = 'a';
     82c:	c6 05 e0 c7 00 00 61 	movb   $0x61,0xc7e0
  name[2] = '\0';
     833:	c6 05 e2 c7 00 00 00 	movb   $0x0,0xc7e2
     83a:	83 c4 10             	add    $0x10,%esp
     83d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     840:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     843:	88 1d e1 c7 00 00    	mov    %bl,0xc7e1
     849:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     84c:	68 02 02 00 00       	push   $0x202
     851:	68 e0 c7 00 00       	push   $0xc7e0
     856:	e8 6d 3b 00 00       	call   43c8 <open>
    close(fd);
     85b:	89 04 24             	mov    %eax,(%esp)
     85e:	e8 4d 3b 00 00       	call   43b0 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     863:	83 c4 10             	add    $0x10,%esp
     866:	80 fb 64             	cmp    $0x64,%bl
     869:	75 d5                	jne    840 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     86b:	c6 05 e0 c7 00 00 61 	movb   $0x61,0xc7e0
  name[2] = '\0';
     872:	c6 05 e2 c7 00 00 00 	movb   $0x0,0xc7e2
     879:	bb 30 00 00 00       	mov    $0x30,%ebx
     87e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     880:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     883:	88 1d e1 c7 00 00    	mov    %bl,0xc7e1
     889:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     88c:	68 e0 c7 00 00       	push   $0xc7e0
     891:	e8 42 3b 00 00       	call   43d8 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     896:	83 c4 10             	add    $0x10,%esp
     899:	80 fb 64             	cmp    $0x64,%bl
     89c:	75 e2                	jne    880 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     89e:	83 ec 08             	sub    $0x8,%esp
     8a1:	68 04 5c 00 00       	push   $0x5c04
     8a6:	ff 35 04 80 00 00    	pushl  0x8004
     8ac:	e8 8f 3c 00 00       	call   4540 <printf>
}
     8b1:	83 c4 10             	add    $0x10,%esp
     8b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8b7:	c9                   	leave  
     8b8:	c3                   	ret    
     8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008c0 <dirtest>:

void dirtest(void)
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8c6:	68 7c 4c 00 00       	push   $0x4c7c
     8cb:	ff 35 04 80 00 00    	pushl  0x8004
     8d1:	e8 6a 3c 00 00       	call   4540 <printf>

  if(mkdir("dir0") < 0){
     8d6:	c7 04 24 88 4c 00 00 	movl   $0x4c88,(%esp)
     8dd:	e8 0e 3b 00 00       	call   43f0 <mkdir>
     8e2:	83 c4 10             	add    $0x10,%esp
     8e5:	85 c0                	test   %eax,%eax
     8e7:	78 58                	js     941 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit(1);
  }

  if(chdir("dir0") < 0){
     8e9:	83 ec 0c             	sub    $0xc,%esp
     8ec:	68 88 4c 00 00       	push   $0x4c88
     8f1:	e8 02 3b 00 00       	call   43f8 <chdir>
     8f6:	83 c4 10             	add    $0x10,%esp
     8f9:	85 c0                	test   %eax,%eax
     8fb:	0f 88 9a 00 00 00    	js     99b <dirtest+0xdb>
    printf(stdout, "chdir dir0 failed\n");
    exit(1);
  }

  if(chdir("..") < 0){
     901:	83 ec 0c             	sub    $0xc,%esp
     904:	68 2d 52 00 00       	push   $0x522d
     909:	e8 ea 3a 00 00       	call   43f8 <chdir>
     90e:	83 c4 10             	add    $0x10,%esp
     911:	85 c0                	test   %eax,%eax
     913:	78 68                	js     97d <dirtest+0xbd>
    printf(stdout, "chdir .. failed\n");
    exit(1);
  }

  if(unlink("dir0") < 0){
     915:	83 ec 0c             	sub    $0xc,%esp
     918:	68 88 4c 00 00       	push   $0x4c88
     91d:	e8 b6 3a 00 00       	call   43d8 <unlink>
     922:	83 c4 10             	add    $0x10,%esp
     925:	85 c0                	test   %eax,%eax
     927:	78 36                	js     95f <dirtest+0x9f>
    printf(stdout, "unlink dir0 failed\n");
    exit(1);
  }
  printf(stdout, "mkdir test ok\n");
     929:	83 ec 08             	sub    $0x8,%esp
     92c:	68 c5 4c 00 00       	push   $0x4cc5
     931:	ff 35 04 80 00 00    	pushl  0x8004
     937:	e8 04 3c 00 00       	call   4540 <printf>
}
     93c:	83 c4 10             	add    $0x10,%esp
     93f:	c9                   	leave  
     940:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     941:	50                   	push   %eax
     942:	50                   	push   %eax
     943:	68 b8 49 00 00       	push   $0x49b8
     948:	ff 35 04 80 00 00    	pushl  0x8004
     94e:	e8 ed 3b 00 00       	call   4540 <printf>
    exit(1);
     953:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     95a:	e8 29 3a 00 00       	call   4388 <exit>
    printf(stdout, "chdir .. failed\n");
    exit(1);
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     95f:	50                   	push   %eax
     960:	50                   	push   %eax
     961:	68 b1 4c 00 00       	push   $0x4cb1
     966:	ff 35 04 80 00 00    	pushl  0x8004
     96c:	e8 cf 3b 00 00       	call   4540 <printf>
    exit(1);
     971:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     978:	e8 0b 3a 00 00       	call   4388 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit(1);
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     97d:	52                   	push   %edx
     97e:	52                   	push   %edx
     97f:	68 a0 4c 00 00       	push   $0x4ca0
     984:	ff 35 04 80 00 00    	pushl  0x8004
     98a:	e8 b1 3b 00 00       	call   4540 <printf>
    exit(1);
     98f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     996:	e8 ed 39 00 00       	call   4388 <exit>
    printf(stdout, "mkdir failed\n");
    exit(1);
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     99b:	51                   	push   %ecx
     99c:	51                   	push   %ecx
     99d:	68 8d 4c 00 00       	push   $0x4c8d
     9a2:	ff 35 04 80 00 00    	pushl  0x8004
     9a8:	e8 93 3b 00 00       	call   4540 <printf>
    exit(1);
     9ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9b4:	e8 cf 39 00 00       	call   4388 <exit>
     9b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

int
exectest(void)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 d4 4c 00 00       	push   $0x4cd4
     9cb:	ff 35 04 80 00 00    	pushl  0x8004
     9d1:	e8 6a 3b 00 00       	call   4540 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	58                   	pop    %eax
     9d7:	5a                   	pop    %edx
     9d8:	68 08 80 00 00       	push   $0x8008
     9dd:	68 9d 4a 00 00       	push   $0x4a9d
     9e2:	e8 d9 39 00 00       	call   43c0 <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	31 d2                	xor    %edx,%edx
     9ec:	85 c0                	test   %eax,%eax
     9ee:	78 08                	js     9f8 <exectest+0x38>
    printf(stdout, "exec echo failed\n");
    return 1;
  }
  return 0;
}
     9f0:	89 d0                	mov    %edx,%eax
     9f2:	c9                   	leave  
     9f3:	c3                   	ret    
     9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9f8:	83 ec 08             	sub    $0x8,%esp
     9fb:	68 df 4c 00 00       	push   $0x4cdf
     a00:	ff 35 04 80 00 00    	pushl  0x8004
     a06:	e8 35 3b 00 00       	call   4540 <printf>
     a0b:	ba 01 00 00 00       	mov    $0x1,%edx
     a10:	83 c4 10             	add    $0x10,%esp
    return 1;
  }
  return 0;
}
     a13:	89 d0                	mov    %edx,%eax
     a15:	c9                   	leave  
     a16:	c3                   	ret    
     a17:	89 f6                	mov    %esi,%esi
     a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a20 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a26:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a29:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a2c:	50                   	push   %eax
     a2d:	e8 66 39 00 00       	call   4398 <pipe>
     a32:	83 c4 10             	add    $0x10,%esp
     a35:	85 c0                	test   %eax,%eax
     a37:	0f 85 4c 01 00 00    	jne    b89 <pipe1+0x169>
    printf(1, "pipe() failed\n");
    exit(1);
  }
  pid = fork();
     a3d:	e8 3e 39 00 00       	call   4380 <fork>
  seq = 0;
  if(pid == 0){
     a42:	83 f8 00             	cmp    $0x0,%eax
     a45:	0f 84 86 00 00 00    	je     ad1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit(1);
      }
    }
    exit(0);
  } else if(pid > 0){
     a4b:	0f 8e 53 01 00 00    	jle    ba4 <pipe1+0x184>
    close(fds[1]);
     a51:	83 ec 0c             	sub    $0xc,%esp
     a54:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a57:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(1);
  }
  pid = fork();
  seq = 0;
     a5c:	31 db                	xor    %ebx,%ebx
        exit(1);
      }
    }
    exit(0);
  } else if(pid > 0){
    close(fds[1]);
     a5e:	e8 4d 39 00 00       	call   43b0 <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a63:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit(0);
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a66:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a6d:	83 ec 04             	sub    $0x4,%esp
     a70:	57                   	push   %edi
     a71:	68 e0 a7 00 00       	push   $0xa7e0
     a76:	ff 75 e0             	pushl  -0x20(%ebp)
     a79:	e8 22 39 00 00       	call   43a0 <read>
     a7e:	83 c4 10             	add    $0x10,%esp
     a81:	85 c0                	test   %eax,%eax
     a83:	0f 8e ac 00 00 00    	jle    b35 <pipe1+0x115>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a89:	89 d9                	mov    %ebx,%ecx
     a8b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a8e:	f7 d9                	neg    %ecx
     a90:	38 9c 0b e0 a7 00 00 	cmp    %bl,0xa7e0(%ebx,%ecx,1)
     a97:	8d 53 01             	lea    0x1(%ebx),%edx
     a9a:	75 1b                	jne    ab7 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a9c:	39 f2                	cmp    %esi,%edx
     a9e:	89 d3                	mov    %edx,%ebx
     aa0:	75 ee                	jne    a90 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     aa2:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     aa4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     aa7:	b8 00 20 00 00       	mov    $0x2000,%eax
     aac:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     ab2:	0f 4f f8             	cmovg  %eax,%edi
     ab5:	eb b6                	jmp    a6d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     ab7:	83 ec 08             	sub    $0x8,%esp
     aba:	68 0e 4d 00 00       	push   $0x4d0e
     abf:	6a 01                	push   $0x1
     ac1:	e8 7a 3a 00 00       	call   4540 <printf>
          return;
     ac6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit(1);
  }
  printf(1, "pipe1 ok\n");
}
     ac9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     acc:	5b                   	pop    %ebx
     acd:	5e                   	pop    %esi
     ace:	5f                   	pop    %edi
     acf:	5d                   	pop    %ebp
     ad0:	c3                   	ret    
    exit(1);
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ad1:	83 ec 0c             	sub    $0xc,%esp
     ad4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(1);
  }
  pid = fork();
  seq = 0;
     ad7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     ad9:	e8 d2 38 00 00       	call   43b0 <close>
     ade:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ae1:	89 f0                	mov    %esi,%eax
     ae3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     ae9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     aeb:	f7 d8                	neg    %eax
     aed:	8d 76 00             	lea    0x0(%esi),%esi
     af0:	88 9c 18 e0 a7 00 00 	mov    %bl,0xa7e0(%eax,%ebx,1)
     af7:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     afa:	39 d3                	cmp    %edx,%ebx
     afc:	75 f2                	jne    af0 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     afe:	83 ec 04             	sub    $0x4,%esp
     b01:	89 de                	mov    %ebx,%esi
     b03:	68 09 04 00 00       	push   $0x409
     b08:	68 e0 a7 00 00       	push   $0xa7e0
     b0d:	ff 75 e4             	pushl  -0x1c(%ebp)
     b10:	e8 93 38 00 00       	call   43a8 <write>
     b15:	83 c4 10             	add    $0x10,%esp
     b18:	3d 09 04 00 00       	cmp    $0x409,%eax
     b1d:	0f 85 9c 00 00 00    	jne    bbf <pipe1+0x19f>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b23:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b29:	75 b6                	jne    ae1 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit(1);
      }
    }
    exit(0);
     b2b:	83 ec 0c             	sub    $0xc,%esp
     b2e:	6a 00                	push   $0x0
     b30:	e8 53 38 00 00       	call   4388 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b35:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b3c:	75 2d                	jne    b6b <pipe1+0x14b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit(1);
    }
    close(fds[0]);
     b3e:	83 ec 0c             	sub    $0xc,%esp
     b41:	ff 75 e0             	pushl  -0x20(%ebp)
     b44:	e8 67 38 00 00       	call   43b0 <close>
    wait(0);
     b49:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b50:	e8 3b 38 00 00       	call   4390 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit(1);
  }
  printf(1, "pipe1 ok\n");
     b55:	58                   	pop    %eax
     b56:	5a                   	pop    %edx
     b57:	68 33 4d 00 00       	push   $0x4d33
     b5c:	6a 01                	push   $0x1
     b5e:	e8 dd 39 00 00       	call   4540 <printf>
     b63:	83 c4 10             	add    $0x10,%esp
     b66:	e9 5e ff ff ff       	jmp    ac9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b6b:	83 ec 04             	sub    $0x4,%esp
     b6e:	ff 75 d4             	pushl  -0x2c(%ebp)
     b71:	68 1c 4d 00 00       	push   $0x4d1c
     b76:	6a 01                	push   $0x1
     b78:	e8 c3 39 00 00       	call   4540 <printf>
      exit(1);
     b7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b84:	e8 ff 37 00 00       	call   4388 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b89:	83 ec 08             	sub    $0x8,%esp
     b8c:	68 f1 4c 00 00       	push   $0x4cf1
     b91:	6a 01                	push   $0x1
     b93:	e8 a8 39 00 00       	call   4540 <printf>
    exit(1);
     b98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b9f:	e8 e4 37 00 00       	call   4388 <exit>
      exit(1);
    }
    close(fds[0]);
    wait(0);
  } else {
    printf(1, "fork() failed\n");
     ba4:	83 ec 08             	sub    $0x8,%esp
     ba7:	68 3d 4d 00 00       	push   $0x4d3d
     bac:	6a 01                	push   $0x1
     bae:	e8 8d 39 00 00       	call   4540 <printf>
    exit(1);
     bb3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     bba:	e8 c9 37 00 00       	call   4388 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     bbf:	83 ec 08             	sub    $0x8,%esp
     bc2:	68 00 4d 00 00       	push   $0x4d00
     bc7:	6a 01                	push   $0x1
     bc9:	e8 72 39 00 00       	call   4540 <printf>
        exit(1);
     bce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     bd5:	e8 ae 37 00 00       	call   4388 <exit>
     bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000be0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     be0:	55                   	push   %ebp
     be1:	89 e5                	mov    %esp,%ebp
     be3:	57                   	push   %edi
     be4:	56                   	push   %esi
     be5:	53                   	push   %ebx
     be6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     be9:	68 4c 4d 00 00       	push   $0x4d4c
     bee:	6a 01                	push   $0x1
     bf0:	e8 4b 39 00 00       	call   4540 <printf>
  pid1 = fork();
     bf5:	e8 86 37 00 00       	call   4380 <fork>
  if(pid1 == 0)
     bfa:	83 c4 10             	add    $0x10,%esp
     bfd:	85 c0                	test   %eax,%eax
     bff:	75 02                	jne    c03 <preempt+0x23>
     c01:	eb fe                	jmp    c01 <preempt+0x21>
     c03:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     c05:	e8 76 37 00 00       	call   4380 <fork>
  if(pid2 == 0)
     c0a:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     c0c:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     c0e:	75 02                	jne    c12 <preempt+0x32>
     c10:	eb fe                	jmp    c10 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     c12:	8d 45 e0             	lea    -0x20(%ebp),%eax
     c15:	83 ec 0c             	sub    $0xc,%esp
     c18:	50                   	push   %eax
     c19:	e8 7a 37 00 00       	call   4398 <pipe>
  pid3 = fork();
     c1e:	e8 5d 37 00 00       	call   4380 <fork>
  if(pid3 == 0){
     c23:	83 c4 10             	add    $0x10,%esp
     c26:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     c28:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     c2a:	75 47                	jne    c73 <preempt+0x93>
    close(pfds[0]);
     c2c:	83 ec 0c             	sub    $0xc,%esp
     c2f:	ff 75 e0             	pushl  -0x20(%ebp)
     c32:	e8 79 37 00 00       	call   43b0 <close>
    if(write(pfds[1], "x", 1) != 1)
     c37:	83 c4 0c             	add    $0xc,%esp
     c3a:	6a 01                	push   $0x1
     c3c:	68 11 53 00 00       	push   $0x5311
     c41:	ff 75 e4             	pushl  -0x1c(%ebp)
     c44:	e8 5f 37 00 00       	call   43a8 <write>
     c49:	83 c4 10             	add    $0x10,%esp
     c4c:	83 f8 01             	cmp    $0x1,%eax
     c4f:	74 12                	je     c63 <preempt+0x83>
      printf(1, "preempt write error");
     c51:	83 ec 08             	sub    $0x8,%esp
     c54:	68 56 4d 00 00       	push   $0x4d56
     c59:	6a 01                	push   $0x1
     c5b:	e8 e0 38 00 00       	call   4540 <printf>
     c60:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c63:	83 ec 0c             	sub    $0xc,%esp
     c66:	ff 75 e4             	pushl  -0x1c(%ebp)
     c69:	e8 42 37 00 00       	call   43b0 <close>
     c6e:	83 c4 10             	add    $0x10,%esp
     c71:	eb fe                	jmp    c71 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     c73:	83 ec 0c             	sub    $0xc,%esp
     c76:	ff 75 e4             	pushl  -0x1c(%ebp)
     c79:	e8 32 37 00 00       	call   43b0 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c7e:	83 c4 0c             	add    $0xc,%esp
     c81:	68 00 20 00 00       	push   $0x2000
     c86:	68 e0 a7 00 00       	push   $0xa7e0
     c8b:	ff 75 e0             	pushl  -0x20(%ebp)
     c8e:	e8 0d 37 00 00       	call   43a0 <read>
     c93:	83 c4 10             	add    $0x10,%esp
     c96:	83 f8 01             	cmp    $0x1,%eax
     c99:	74 1a                	je     cb5 <preempt+0xd5>
    printf(1, "preempt read error");
     c9b:	83 ec 08             	sub    $0x8,%esp
     c9e:	68 6a 4d 00 00       	push   $0x4d6a
     ca3:	6a 01                	push   $0x1
     ca5:	e8 96 38 00 00       	call   4540 <printf>
    return;
     caa:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait(0);
  wait(0);
  wait(0);
  printf(1, "preempt ok\n");
}
     cad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cb0:	5b                   	pop    %ebx
     cb1:	5e                   	pop    %esi
     cb2:	5f                   	pop    %edi
     cb3:	5d                   	pop    %ebp
     cb4:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     cb5:	83 ec 0c             	sub    $0xc,%esp
     cb8:	ff 75 e0             	pushl  -0x20(%ebp)
     cbb:	e8 f0 36 00 00       	call   43b0 <close>
  printf(1, "kill... ");
     cc0:	58                   	pop    %eax
     cc1:	5a                   	pop    %edx
     cc2:	68 7d 4d 00 00       	push   $0x4d7d
     cc7:	6a 01                	push   $0x1
     cc9:	e8 72 38 00 00       	call   4540 <printf>
  kill(pid1);
     cce:	89 3c 24             	mov    %edi,(%esp)
     cd1:	e8 e2 36 00 00       	call   43b8 <kill>
  kill(pid2);
     cd6:	89 34 24             	mov    %esi,(%esp)
     cd9:	e8 da 36 00 00       	call   43b8 <kill>
  kill(pid3);
     cde:	89 1c 24             	mov    %ebx,(%esp)
     ce1:	e8 d2 36 00 00       	call   43b8 <kill>
  printf(1, "wait... ");
     ce6:	59                   	pop    %ecx
     ce7:	5b                   	pop    %ebx
     ce8:	68 86 4d 00 00       	push   $0x4d86
     ced:	6a 01                	push   $0x1
     cef:	e8 4c 38 00 00       	call   4540 <printf>
  wait(0);
     cf4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cfb:	e8 90 36 00 00       	call   4390 <wait>
  wait(0);
     d00:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d07:	e8 84 36 00 00       	call   4390 <wait>
  wait(0);
     d0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d13:	e8 78 36 00 00       	call   4390 <wait>
  printf(1, "preempt ok\n");
     d18:	5e                   	pop    %esi
     d19:	5f                   	pop    %edi
     d1a:	68 8f 4d 00 00       	push   $0x4d8f
     d1f:	6a 01                	push   $0x1
     d21:	e8 1a 38 00 00       	call   4540 <printf>
     d26:	83 c4 10             	add    $0x10,%esp
     d29:	eb 82                	jmp    cad <preempt+0xcd>
     d2b:	90                   	nop
     d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d30 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	56                   	push   %esi
     d34:	be 64 00 00 00       	mov    $0x64,%esi
     d39:	53                   	push   %ebx
     d3a:	eb 1c                	jmp    d58 <exitwait+0x28>
     d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     d40:	74 77                	je     db9 <exitwait+0x89>
      if(wait(0) != pid){
     d42:	83 ec 0c             	sub    $0xc,%esp
     d45:	6a 00                	push   $0x0
     d47:	e8 44 36 00 00       	call   4390 <wait>
     d4c:	83 c4 10             	add    $0x10,%esp
     d4f:	39 c3                	cmp    %eax,%ebx
     d51:	75 2d                	jne    d80 <exitwait+0x50>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     d53:	83 ee 01             	sub    $0x1,%esi
     d56:	74 48                	je     da0 <exitwait+0x70>
    pid = fork();
     d58:	e8 23 36 00 00       	call   4380 <fork>
    if(pid < 0){
     d5d:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     d5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d61:	79 dd                	jns    d40 <exitwait+0x10>
      printf(1, "fork failed\n");
     d63:	83 ec 08             	sub    $0x8,%esp
     d66:	68 f9 58 00 00       	push   $0x58f9
     d6b:	6a 01                	push   $0x1
     d6d:	e8 ce 37 00 00       	call   4540 <printf>
      return;
     d72:	83 c4 10             	add    $0x10,%esp
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
}
     d75:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d78:	5b                   	pop    %ebx
     d79:	5e                   	pop    %esi
     d7a:	5d                   	pop    %ebp
     d7b:	c3                   	ret    
     d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait(0) != pid){
        printf(1, "wait wrong pid\n");
     d80:	83 ec 08             	sub    $0x8,%esp
     d83:	68 9b 4d 00 00       	push   $0x4d9b
     d88:	6a 01                	push   $0x1
     d8a:	e8 b1 37 00 00       	call   4540 <printf>
        return;
     d8f:	83 c4 10             	add    $0x10,%esp
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
}
     d92:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d95:	5b                   	pop    %ebx
     d96:	5e                   	pop    %esi
     d97:	5d                   	pop    %ebp
     d98:	c3                   	ret    
     d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
     da0:	83 ec 08             	sub    $0x8,%esp
     da3:	68 ab 4d 00 00       	push   $0x4dab
     da8:	6a 01                	push   $0x1
     daa:	e8 91 37 00 00       	call   4540 <printf>
     daf:	83 c4 10             	add    $0x10,%esp
}
     db2:	8d 65 f8             	lea    -0x8(%ebp),%esp
     db5:	5b                   	pop    %ebx
     db6:	5e                   	pop    %esi
     db7:	5d                   	pop    %ebp
     db8:	c3                   	ret    
      if(wait(0) != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit(0);
     db9:	83 ec 0c             	sub    $0xc,%esp
     dbc:	6a 00                	push   $0x0
     dbe:	e8 c5 35 00 00       	call   4388 <exit>
     dc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000dd0 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	57                   	push   %edi
     dd4:	56                   	push   %esi
     dd5:	53                   	push   %ebx
     dd6:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     dd9:	68 b8 4d 00 00       	push   $0x4db8
     dde:	6a 01                	push   $0x1
     de0:	e8 5b 37 00 00       	call   4540 <printf>
  ppid = getpid();
     de5:	e8 1e 36 00 00       	call   4408 <getpid>
     dea:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     dec:	e8 8f 35 00 00       	call   4380 <fork>
     df1:	83 c4 10             	add    $0x10,%esp
     df4:	85 c0                	test   %eax,%eax
     df6:	75 78                	jne    e70 <mem+0xa0>
     df8:	31 db                	xor    %ebx,%ebx
     dfa:	eb 08                	jmp    e04 <mem+0x34>
     dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     e00:	89 18                	mov    %ebx,(%eax)
     e02:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     e04:	83 ec 0c             	sub    $0xc,%esp
     e07:	68 11 27 00 00       	push   $0x2711
     e0c:	e8 6f 39 00 00       	call   4780 <malloc>
     e11:	83 c4 10             	add    $0x10,%esp
     e14:	85 c0                	test   %eax,%eax
     e16:	75 e8                	jne    e00 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e18:	85 db                	test   %ebx,%ebx
     e1a:	74 18                	je     e34 <mem+0x64>
     e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     e20:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     e22:	83 ec 0c             	sub    $0xc,%esp
     e25:	53                   	push   %ebx
     e26:	89 fb                	mov    %edi,%ebx
     e28:	e8 c3 38 00 00       	call   46f0 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e2d:	83 c4 10             	add    $0x10,%esp
     e30:	85 db                	test   %ebx,%ebx
     e32:	75 ec                	jne    e20 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     e34:	83 ec 0c             	sub    $0xc,%esp
     e37:	68 00 50 00 00       	push   $0x5000
     e3c:	e8 3f 39 00 00       	call   4780 <malloc>
    if(m1 == 0){
     e41:	83 c4 10             	add    $0x10,%esp
     e44:	85 c0                	test   %eax,%eax
     e46:	74 40                	je     e88 <mem+0xb8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit(1);
    }
    free(m1);
     e48:	83 ec 0c             	sub    $0xc,%esp
     e4b:	50                   	push   %eax
     e4c:	e8 9f 38 00 00       	call   46f0 <free>
    printf(1, "mem ok\n");
     e51:	58                   	pop    %eax
     e52:	5a                   	pop    %edx
     e53:	68 dc 4d 00 00       	push   $0x4ddc
     e58:	6a 01                	push   $0x1
     e5a:	e8 e1 36 00 00       	call   4540 <printf>
    exit(0);
     e5f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e66:	e8 1d 35 00 00       	call   4388 <exit>
     e6b:	90                   	nop
     e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait(0);
     e70:	83 ec 0c             	sub    $0xc,%esp
     e73:	6a 00                	push   $0x0
     e75:	e8 16 35 00 00       	call   4390 <wait>
  }
}
     e7a:	83 c4 10             	add    $0x10,%esp
     e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e80:	5b                   	pop    %ebx
     e81:	5e                   	pop    %esi
     e82:	5f                   	pop    %edi
     e83:	5d                   	pop    %ebp
     e84:	c3                   	ret    
     e85:	8d 76 00             	lea    0x0(%esi),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e88:	83 ec 08             	sub    $0x8,%esp
     e8b:	68 c2 4d 00 00       	push   $0x4dc2
     e90:	6a 01                	push   $0x1
     e92:	e8 a9 36 00 00       	call   4540 <printf>
      kill(ppid);
     e97:	89 34 24             	mov    %esi,(%esp)
     e9a:	e8 19 35 00 00       	call   43b8 <kill>
      exit(1);
     e9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ea6:	e8 dd 34 00 00       	call   4388 <exit>
     eab:	90                   	nop
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000eb0 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     eb9:	68 e4 4d 00 00       	push   $0x4de4
     ebe:	6a 01                	push   $0x1
     ec0:	e8 7b 36 00 00       	call   4540 <printf>

  unlink("sharedfd");
     ec5:	c7 04 24 f3 4d 00 00 	movl   $0x4df3,(%esp)
     ecc:	e8 07 35 00 00       	call   43d8 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ed1:	5b                   	pop    %ebx
     ed2:	5e                   	pop    %esi
     ed3:	68 02 02 00 00       	push   $0x202
     ed8:	68 f3 4d 00 00       	push   $0x4df3
     edd:	e8 e6 34 00 00       	call   43c8 <open>
  if(fd < 0){
     ee2:	83 c4 10             	add    $0x10,%esp
     ee5:	85 c0                	test   %eax,%eax
     ee7:	0f 88 29 01 00 00    	js     1016 <sharedfd+0x166>
     eed:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eef:	8d 75 de             	lea    -0x22(%ebp),%esi
     ef2:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     ef7:	e8 84 34 00 00       	call   4380 <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     efc:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     eff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f02:	19 c0                	sbb    %eax,%eax
     f04:	83 ec 04             	sub    $0x4,%esp
     f07:	83 e0 f3             	and    $0xfffffff3,%eax
     f0a:	6a 0a                	push   $0xa
     f0c:	83 c0 70             	add    $0x70,%eax
     f0f:	50                   	push   %eax
     f10:	56                   	push   %esi
     f11:	e8 1a 31 00 00       	call   4030 <memset>
     f16:	83 c4 10             	add    $0x10,%esp
     f19:	eb 0a                	jmp    f25 <sharedfd+0x75>
     f1b:	90                   	nop
     f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     f20:	83 eb 01             	sub    $0x1,%ebx
     f23:	74 26                	je     f4b <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f25:	83 ec 04             	sub    $0x4,%esp
     f28:	6a 0a                	push   $0xa
     f2a:	56                   	push   %esi
     f2b:	57                   	push   %edi
     f2c:	e8 77 34 00 00       	call   43a8 <write>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	83 f8 0a             	cmp    $0xa,%eax
     f37:	74 e7                	je     f20 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     f39:	83 ec 08             	sub    $0x8,%esp
     f3c:	68 58 5c 00 00       	push   $0x5c58
     f41:	6a 01                	push   $0x1
     f43:	e8 f8 35 00 00       	call   4540 <printf>
      break;
     f48:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     f4b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     f4e:	85 c9                	test   %ecx,%ecx
     f50:	0f 84 f4 00 00 00    	je     104a <sharedfd+0x19a>
    exit(0);
  else
    wait(0);
     f56:	83 ec 0c             	sub    $0xc,%esp
     f59:	31 db                	xor    %ebx,%ebx
     f5b:	6a 00                	push   $0x0
     f5d:	e8 2e 34 00 00       	call   4390 <wait>
  close(fd);
     f62:	89 3c 24             	mov    %edi,(%esp)
     f65:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f68:	e8 43 34 00 00       	call   43b0 <close>
  fd = open("sharedfd", 0);
     f6d:	58                   	pop    %eax
     f6e:	5a                   	pop    %edx
     f6f:	6a 00                	push   $0x0
     f71:	68 f3 4d 00 00       	push   $0x4df3
     f76:	e8 4d 34 00 00       	call   43c8 <open>
  if(fd < 0){
     f7b:	83 c4 10             	add    $0x10,%esp
     f7e:	31 d2                	xor    %edx,%edx
     f80:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit(0);
  else
    wait(0);
  close(fd);
  fd = open("sharedfd", 0);
     f82:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f85:	0f 88 a5 00 00 00    	js     1030 <sharedfd+0x180>
     f8b:	90                   	nop
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f90:	83 ec 04             	sub    $0x4,%esp
     f93:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f96:	6a 0a                	push   $0xa
     f98:	56                   	push   %esi
     f99:	ff 75 d0             	pushl  -0x30(%ebp)
     f9c:	e8 ff 33 00 00       	call   43a0 <read>
     fa1:	83 c4 10             	add    $0x10,%esp
     fa4:	85 c0                	test   %eax,%eax
     fa6:	7e 27                	jle    fcf <sharedfd+0x11f>
     fa8:	89 f0                	mov    %esi,%eax
     faa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fad:	eb 13                	jmp    fc2 <sharedfd+0x112>
     faf:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     fb0:	80 f9 70             	cmp    $0x70,%cl
     fb3:	0f 94 c1             	sete   %cl
     fb6:	0f b6 c9             	movzbl %cl,%ecx
     fb9:	01 cb                	add    %ecx,%ebx
     fbb:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     fbe:	39 c7                	cmp    %eax,%edi
     fc0:	74 ce                	je     f90 <sharedfd+0xe0>
      if(buf[i] == 'c')
     fc2:	0f b6 08             	movzbl (%eax),%ecx
     fc5:	80 f9 63             	cmp    $0x63,%cl
     fc8:	75 e6                	jne    fb0 <sharedfd+0x100>
        nc++;
     fca:	83 c2 01             	add    $0x1,%edx
     fcd:	eb ec                	jmp    fbb <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     fcf:	83 ec 0c             	sub    $0xc,%esp
     fd2:	ff 75 d0             	pushl  -0x30(%ebp)
     fd5:	e8 d6 33 00 00       	call   43b0 <close>
  unlink("sharedfd");
     fda:	c7 04 24 f3 4d 00 00 	movl   $0x4df3,(%esp)
     fe1:	e8 f2 33 00 00       	call   43d8 <unlink>
  if(nc == 10000 && np == 10000){
     fe6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fe9:	83 c4 10             	add    $0x10,%esp
     fec:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     ff2:	75 60                	jne    1054 <sharedfd+0x1a4>
     ff4:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     ffa:	75 58                	jne    1054 <sharedfd+0x1a4>
    printf(1, "sharedfd ok\n");
     ffc:	83 ec 08             	sub    $0x8,%esp
     fff:	68 fc 4d 00 00       	push   $0x4dfc
    1004:	6a 01                	push   $0x1
    1006:	e8 35 35 00 00       	call   4540 <printf>
    100b:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(1);
  }
}
    100e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1011:	5b                   	pop    %ebx
    1012:	5e                   	pop    %esi
    1013:	5f                   	pop    %edi
    1014:	5d                   	pop    %ebp
    1015:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	68 2c 5c 00 00       	push   $0x5c2c
    101e:	6a 01                	push   $0x1
    1020:	e8 1b 35 00 00       	call   4540 <printf>
    return;
    1025:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(1);
  }
}
    1028:	8d 65 f4             	lea    -0xc(%ebp),%esp
    102b:	5b                   	pop    %ebx
    102c:	5e                   	pop    %esi
    102d:	5f                   	pop    %edi
    102e:	5d                   	pop    %ebp
    102f:	c3                   	ret    
  else
    wait(0);
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	68 78 5c 00 00       	push   $0x5c78
    1038:	6a 01                	push   $0x1
    103a:	e8 01 35 00 00       	call   4540 <printf>
    return;
    103f:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(1);
  }
}
    1042:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1045:	5b                   	pop    %ebx
    1046:	5e                   	pop    %esi
    1047:	5f                   	pop    %edi
    1048:	5d                   	pop    %ebp
    1049:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit(0);
    104a:	83 ec 0c             	sub    $0xc,%esp
    104d:	6a 00                	push   $0x0
    104f:	e8 34 33 00 00       	call   4388 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1054:	53                   	push   %ebx
    1055:	52                   	push   %edx
    1056:	68 09 4e 00 00       	push   $0x4e09
    105b:	6a 01                	push   $0x1
    105d:	e8 de 34 00 00       	call   4540 <printf>
    exit(1);
    1062:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1069:	e8 1a 33 00 00       	call   4388 <exit>
    106e:	66 90                	xchg   %ax,%ax

00001070 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	57                   	push   %edi
    1074:	56                   	push   %esi
    1075:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1076:	be 1e 4e 00 00       	mov    $0x4e1e,%esi

  for(pi = 0; pi < 4; pi++){
    107b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    107d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1080:	c7 45 d8 1e 4e 00 00 	movl   $0x4e1e,-0x28(%ebp)
    1087:	c7 45 dc 67 4f 00 00 	movl   $0x4f67,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    108e:	68 24 4e 00 00       	push   $0x4e24
    1093:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1095:	c7 45 e0 6b 4f 00 00 	movl   $0x4f6b,-0x20(%ebp)
    109c:	c7 45 e4 21 4e 00 00 	movl   $0x4e21,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    10a3:	e8 98 34 00 00       	call   4540 <printf>
    10a8:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    10ab:	83 ec 0c             	sub    $0xc,%esp
    10ae:	56                   	push   %esi
    10af:	e8 24 33 00 00       	call   43d8 <unlink>

    pid = fork();
    10b4:	e8 c7 32 00 00       	call   4380 <fork>
    if(pid < 0){
    10b9:	83 c4 10             	add    $0x10,%esp
    10bc:	85 c0                	test   %eax,%eax
    10be:	0f 88 c4 01 00 00    	js     1288 <fourfiles+0x218>
      printf(1, "fork failed\n");
      exit(1);
    }

    if(pid == 0){
    10c4:	0f 84 0a 01 00 00    	je     11d4 <fourfiles+0x164>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    10ca:	83 c3 01             	add    $0x1,%ebx
    10cd:	83 fb 04             	cmp    $0x4,%ebx
    10d0:	74 06                	je     10d8 <fourfiles+0x68>
    10d2:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    10d6:	eb d3                	jmp    10ab <fourfiles+0x3b>
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait(0);
    10d8:	83 ec 0c             	sub    $0xc,%esp
    10db:	bf 30 00 00 00       	mov    $0x30,%edi
    10e0:	6a 00                	push   $0x0
    10e2:	e8 a9 32 00 00       	call   4390 <wait>
    10e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    10ee:	e8 9d 32 00 00       	call   4390 <wait>
    10f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    10fa:	e8 91 32 00 00       	call   4390 <wait>
    10ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1106:	e8 85 32 00 00       	call   4390 <wait>
    110b:	83 c4 10             	add    $0x10,%esp
    110e:	c7 45 d4 1e 4e 00 00 	movl   $0x4e1e,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1115:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    1118:	31 db                	xor    %ebx,%ebx
    wait(0);
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    111a:	6a 00                	push   $0x0
    111c:	ff 75 d4             	pushl  -0x2c(%ebp)
    111f:	e8 a4 32 00 00       	call   43c8 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1124:	83 c4 10             	add    $0x10,%esp
    wait(0);
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1127:	89 c6                	mov    %eax,%esi
    1129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1130:	83 ec 04             	sub    $0x4,%esp
    1133:	68 00 20 00 00       	push   $0x2000
    1138:	68 e0 a7 00 00       	push   $0xa7e0
    113d:	56                   	push   %esi
    113e:	e8 5d 32 00 00       	call   43a0 <read>
    1143:	83 c4 10             	add    $0x10,%esp
    1146:	85 c0                	test   %eax,%eax
    1148:	7e 1c                	jle    1166 <fourfiles+0xf6>
    114a:	31 d2                	xor    %edx,%edx
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    1150:	0f be 8a e0 a7 00 00 	movsbl 0xa7e0(%edx),%ecx
    1157:	39 f9                	cmp    %edi,%ecx
    1159:	75 5e                	jne    11b9 <fourfiles+0x149>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    115b:	83 c2 01             	add    $0x1,%edx
    115e:	39 d0                	cmp    %edx,%eax
    1160:	75 ee                	jne    1150 <fourfiles+0xe0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit(1);
        }
      }
      total += n;
    1162:	01 c3                	add    %eax,%ebx
    1164:	eb ca                	jmp    1130 <fourfiles+0xc0>
    }
    close(fd);
    1166:	83 ec 0c             	sub    $0xc,%esp
    1169:	56                   	push   %esi
    116a:	e8 41 32 00 00       	call   43b0 <close>
    if(total != 12*500){
    116f:	83 c4 10             	add    $0x10,%esp
    1172:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1178:	0f 85 ee 00 00 00    	jne    126c <fourfiles+0x1fc>
      printf(1, "wrong length %d\n", total);
      exit(1);
    }
    unlink(fname);
    117e:	83 ec 0c             	sub    $0xc,%esp
    1181:	ff 75 d4             	pushl  -0x2c(%ebp)
    1184:	83 c7 01             	add    $0x1,%edi
    1187:	e8 4c 32 00 00       	call   43d8 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait(0);
  }

  for(i = 0; i < 2; i++){
    118c:	83 c4 10             	add    $0x10,%esp
    118f:	83 ff 32             	cmp    $0x32,%edi
    1192:	75 1a                	jne    11ae <fourfiles+0x13e>
      exit(1);
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1194:	83 ec 08             	sub    $0x8,%esp
    1197:	68 62 4e 00 00       	push   $0x4e62
    119c:	6a 01                	push   $0x1
    119e:	e8 9d 33 00 00       	call   4540 <printf>
}
    11a3:	83 c4 10             	add    $0x10,%esp
    11a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11a9:	5b                   	pop    %ebx
    11aa:	5e                   	pop    %esi
    11ab:	5f                   	pop    %edi
    11ac:	5d                   	pop    %ebp
    11ad:	c3                   	ret    
    11ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
    11b1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    11b4:	e9 5c ff ff ff       	jmp    1115 <fourfiles+0xa5>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    11b9:	83 ec 08             	sub    $0x8,%esp
    11bc:	68 45 4e 00 00       	push   $0x4e45
    11c1:	6a 01                	push   $0x1
    11c3:	e8 78 33 00 00       	call   4540 <printf>
          exit(1);
    11c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11cf:	e8 b4 31 00 00       	call   4388 <exit>
      printf(1, "fork failed\n");
      exit(1);
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    11d4:	83 ec 08             	sub    $0x8,%esp
    11d7:	68 02 02 00 00       	push   $0x202
    11dc:	56                   	push   %esi
    11dd:	e8 e6 31 00 00       	call   43c8 <open>
      if(fd < 0){
    11e2:	83 c4 10             	add    $0x10,%esp
    11e5:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit(1);
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    11e7:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    11e9:	78 66                	js     1251 <fourfiles+0x1e1>
        printf(1, "create failed\n");
        exit(1);
      }

      memset(buf, '0'+pi, 512);
    11eb:	83 ec 04             	sub    $0x4,%esp
    11ee:	83 c3 30             	add    $0x30,%ebx
    11f1:	68 00 02 00 00       	push   $0x200
    11f6:	53                   	push   %ebx
    11f7:	bb 0c 00 00 00       	mov    $0xc,%ebx
    11fc:	68 e0 a7 00 00       	push   $0xa7e0
    1201:	e8 2a 2e 00 00       	call   4030 <memset>
    1206:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    1209:	83 ec 04             	sub    $0x4,%esp
    120c:	68 f4 01 00 00       	push   $0x1f4
    1211:	68 e0 a7 00 00       	push   $0xa7e0
    1216:	56                   	push   %esi
    1217:	e8 8c 31 00 00       	call   43a8 <write>
    121c:	83 c4 10             	add    $0x10,%esp
    121f:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    1224:	75 0f                	jne    1235 <fourfiles+0x1c5>
        printf(1, "create failed\n");
        exit(1);
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    1226:	83 eb 01             	sub    $0x1,%ebx
    1229:	75 de                	jne    1209 <fourfiles+0x199>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit(1);
        }
      }
      exit(0);
    122b:	83 ec 0c             	sub    $0xc,%esp
    122e:	6a 00                	push   $0x0
    1230:	e8 53 31 00 00       	call   4388 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    1235:	83 ec 04             	sub    $0x4,%esp
    1238:	50                   	push   %eax
    1239:	68 34 4e 00 00       	push   $0x4e34
    123e:	6a 01                	push   $0x1
    1240:	e8 fb 32 00 00       	call   4540 <printf>
          exit(1);
    1245:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    124c:	e8 37 31 00 00       	call   4388 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    1251:	83 ec 08             	sub    $0x8,%esp
    1254:	68 bf 50 00 00       	push   $0x50bf
    1259:	6a 01                	push   $0x1
    125b:	e8 e0 32 00 00       	call   4540 <printf>
        exit(1);
    1260:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1267:	e8 1c 31 00 00       	call   4388 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    126c:	83 ec 04             	sub    $0x4,%esp
    126f:	53                   	push   %ebx
    1270:	68 51 4e 00 00       	push   $0x4e51
    1275:	6a 01                	push   $0x1
    1277:	e8 c4 32 00 00       	call   4540 <printf>
      exit(1);
    127c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1283:	e8 00 31 00 00       	call   4388 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1288:	83 ec 08             	sub    $0x8,%esp
    128b:	68 f9 58 00 00       	push   $0x58f9
    1290:	6a 01                	push   $0x1
    1292:	e8 a9 32 00 00       	call   4540 <printf>
      exit(1);
    1297:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    129e:	e8 e5 30 00 00       	call   4388 <exit>
    12a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012b0 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	57                   	push   %edi
    12b4:	56                   	push   %esi
    12b5:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    12b6:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    12b8:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    12bb:	68 70 4e 00 00       	push   $0x4e70
    12c0:	6a 01                	push   $0x1
    12c2:	e8 79 32 00 00       	call   4540 <printf>
    12c7:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    12ca:	e8 b1 30 00 00       	call   4380 <fork>
    if(pid < 0){
    12cf:	85 c0                	test   %eax,%eax
    12d1:	0f 88 ea 01 00 00    	js     14c1 <createdelete+0x211>
      printf(1, "fork failed\n");
      exit(1);
    }

    if(pid == 0){
    12d7:	0f 84 0e 01 00 00    	je     13eb <createdelete+0x13b>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    12dd:	83 c3 01             	add    $0x1,%ebx
    12e0:	83 fb 04             	cmp    $0x4,%ebx
    12e3:	75 e5                	jne    12ca <createdelete+0x1a>
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait(0);
    12e5:	83 ec 0c             	sub    $0xc,%esp
    12e8:	8d 7d c8             	lea    -0x38(%ebp),%edi
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12eb:	31 f6                	xor    %esi,%esi
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait(0);
    12ed:	6a 00                	push   $0x0
    12ef:	e8 9c 30 00 00       	call   4390 <wait>
    12f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12fb:	e8 90 30 00 00       	call   4390 <wait>
    1300:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1307:	e8 84 30 00 00       	call   4390 <wait>
    130c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1313:	e8 78 30 00 00       	call   4390 <wait>
  }

  name[0] = name[1] = name[2] = 0;
    1318:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    131c:	83 c4 10             	add    $0x10,%esp
    131f:	90                   	nop
    1320:	8d 46 30             	lea    0x30(%esi),%eax
    1323:	83 fe 09             	cmp    $0x9,%esi
      exit(1);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    1326:	bb 70 00 00 00       	mov    $0x70,%ebx
    132b:	0f 9f c2             	setg   %dl
    132e:	85 f6                	test   %esi,%esi
    1330:	88 45 c7             	mov    %al,-0x39(%ebp)
    1333:	0f 94 c0             	sete   %al
    1336:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(1);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1338:	8d 46 ff             	lea    -0x1(%esi),%eax
    133b:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    133e:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1341:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    1345:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1348:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    134b:	6a 00                	push   $0x0
    134d:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    134e:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1351:	e8 72 30 00 00       	call   43c8 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    1356:	89 c1                	mov    %eax,%ecx
    1358:	83 c4 10             	add    $0x10,%esp
    135b:	c1 e9 1f             	shr    $0x1f,%ecx
    135e:	84 c9                	test   %cl,%cl
    1360:	74 0a                	je     136c <createdelete+0xbc>
    1362:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    1366:	0f 85 1e 01 00 00    	jne    148a <createdelete+0x1da>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(1);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    136c:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1370:	0f 86 66 01 00 00    	jbe    14dc <createdelete+0x22c>
        printf(1, "oops createdelete %s did exist\n", name);
        exit(1);
      }
      if(fd >= 0)
    1376:	85 c0                	test   %eax,%eax
    1378:	78 0c                	js     1386 <createdelete+0xd6>
        close(fd);
    137a:	83 ec 0c             	sub    $0xc,%esp
    137d:	50                   	push   %eax
    137e:	e8 2d 30 00 00       	call   43b0 <close>
    1383:	83 c4 10             	add    $0x10,%esp
    1386:	83 c3 01             	add    $0x1,%ebx
    wait(0);
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1389:	80 fb 74             	cmp    $0x74,%bl
    138c:	75 b3                	jne    1341 <createdelete+0x91>
  for(pi = 0; pi < 4; pi++){
    wait(0);
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    138e:	83 c6 01             	add    $0x1,%esi
    1391:	83 fe 14             	cmp    $0x14,%esi
    1394:	75 8a                	jne    1320 <createdelete+0x70>
    1396:	be 70 00 00 00       	mov    $0x70,%esi
    139b:	90                   	nop
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13a0:	8d 46 c0             	lea    -0x40(%esi),%eax
    13a3:	bb 04 00 00 00       	mov    $0x4,%ebx
    13a8:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    13ab:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    13ad:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    13b0:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    13b3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    13b7:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    13b8:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    13bb:	e8 18 30 00 00       	call   43d8 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    13c0:	83 c4 10             	add    $0x10,%esp
    13c3:	83 eb 01             	sub    $0x1,%ebx
    13c6:	75 e3                	jne    13ab <createdelete+0xfb>
    13c8:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    13cb:	89 f0                	mov    %esi,%eax
    13cd:	3c 84                	cmp    $0x84,%al
    13cf:	75 cf                	jne    13a0 <createdelete+0xf0>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    13d1:	83 ec 08             	sub    $0x8,%esp
    13d4:	68 83 4e 00 00       	push   $0x4e83
    13d9:	6a 01                	push   $0x1
    13db:	e8 60 31 00 00       	call   4540 <printf>
}
    13e0:	83 c4 10             	add    $0x10,%esp
    13e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13e6:	5b                   	pop    %ebx
    13e7:	5e                   	pop    %esi
    13e8:	5f                   	pop    %edi
    13e9:	5d                   	pop    %ebp
    13ea:	c3                   	ret    
      printf(1, "fork failed\n");
      exit(1);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    13eb:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    13ee:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    13f2:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit(1);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    13f7:	88 5d c8             	mov    %bl,-0x38(%ebp)
    13fa:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    13fd:	31 db                	xor    %ebx,%ebx
    13ff:	eb 12                	jmp    1413 <createdelete+0x163>
    1401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1408:	83 fe 14             	cmp    $0x14,%esi
    140b:	74 73                	je     1480 <createdelete+0x1d0>
    140d:	83 c3 01             	add    $0x1,%ebx
    1410:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    1413:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1416:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1419:	68 02 02 00 00       	push   $0x202
    141e:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    141f:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1422:	e8 a1 2f 00 00       	call   43c8 <open>
        if(fd < 0){
    1427:	83 c4 10             	add    $0x10,%esp
    142a:	85 c0                	test   %eax,%eax
    142c:	78 78                	js     14a6 <createdelete+0x1f6>
          printf(1, "create failed\n");
          exit(1);
        }
        close(fd);
    142e:	83 ec 0c             	sub    $0xc,%esp
    1431:	50                   	push   %eax
    1432:	e8 79 2f 00 00       	call   43b0 <close>
        if(i > 0 && (i % 2 ) == 0){
    1437:	83 c4 10             	add    $0x10,%esp
    143a:	85 db                	test   %ebx,%ebx
    143c:	74 cf                	je     140d <createdelete+0x15d>
    143e:	f6 c3 01             	test   $0x1,%bl
    1441:	75 c5                	jne    1408 <createdelete+0x158>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    1443:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit(1);
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1446:	89 d8                	mov    %ebx,%eax
    1448:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    144a:	57                   	push   %edi
          printf(1, "create failed\n");
          exit(1);
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    144b:	83 c0 30             	add    $0x30,%eax
    144e:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1451:	e8 82 2f 00 00       	call   43d8 <unlink>
    1456:	83 c4 10             	add    $0x10,%esp
    1459:	85 c0                	test   %eax,%eax
    145b:	79 ab                	jns    1408 <createdelete+0x158>
            printf(1, "unlink failed\n");
    145d:	83 ec 08             	sub    $0x8,%esp
    1460:	68 71 4a 00 00       	push   $0x4a71
    1465:	6a 01                	push   $0x1
    1467:	e8 d4 30 00 00       	call   4540 <printf>
            exit(1);
    146c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1473:	e8 10 2f 00 00       	call   4388 <exit>
    1478:	90                   	nop
    1479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit(0);
    1480:	83 ec 0c             	sub    $0xc,%esp
    1483:	6a 00                	push   $0x0
    1485:	e8 fe 2e 00 00       	call   4388 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    148a:	83 ec 04             	sub    $0x4,%esp
    148d:	57                   	push   %edi
    148e:	68 a4 5c 00 00       	push   $0x5ca4
    1493:	6a 01                	push   $0x1
    1495:	e8 a6 30 00 00       	call   4540 <printf>
        exit(1);
    149a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14a1:	e8 e2 2e 00 00       	call   4388 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    14a6:	83 ec 08             	sub    $0x8,%esp
    14a9:	68 bf 50 00 00       	push   $0x50bf
    14ae:	6a 01                	push   $0x1
    14b0:	e8 8b 30 00 00       	call   4540 <printf>
          exit(1);
    14b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14bc:	e8 c7 2e 00 00       	call   4388 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    14c1:	83 ec 08             	sub    $0x8,%esp
    14c4:	68 f9 58 00 00       	push   $0x58f9
    14c9:	6a 01                	push   $0x1
    14cb:	e8 70 30 00 00       	call   4540 <printf>
      exit(1);
    14d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14d7:	e8 ac 2e 00 00       	call   4388 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(1);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    14dc:	85 c0                	test   %eax,%eax
    14de:	0f 88 a2 fe ff ff    	js     1386 <createdelete+0xd6>
        printf(1, "oops createdelete %s did exist\n", name);
    14e4:	83 ec 04             	sub    $0x4,%esp
    14e7:	57                   	push   %edi
    14e8:	68 c8 5c 00 00       	push   $0x5cc8
    14ed:	6a 01                	push   $0x1
    14ef:	e8 4c 30 00 00       	call   4540 <printf>
        exit(1);
    14f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14fb:	e8 88 2e 00 00       	call   4388 <exit>

00001500 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	56                   	push   %esi
    1504:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1505:	83 ec 08             	sub    $0x8,%esp
    1508:	68 94 4e 00 00       	push   $0x4e94
    150d:	6a 01                	push   $0x1
    150f:	e8 2c 30 00 00       	call   4540 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1514:	5b                   	pop    %ebx
    1515:	5e                   	pop    %esi
    1516:	68 02 02 00 00       	push   $0x202
    151b:	68 a5 4e 00 00       	push   $0x4ea5
    1520:	e8 a3 2e 00 00       	call   43c8 <open>
  if(fd < 0){
    1525:	83 c4 10             	add    $0x10,%esp
    1528:	85 c0                	test   %eax,%eax
    152a:	0f 88 e6 00 00 00    	js     1616 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit(1);
  }
  write(fd, "hello", 5);
    1530:	83 ec 04             	sub    $0x4,%esp
    1533:	89 c3                	mov    %eax,%ebx
    1535:	6a 05                	push   $0x5
    1537:	68 ca 4e 00 00       	push   $0x4eca
    153c:	50                   	push   %eax
    153d:	e8 66 2e 00 00       	call   43a8 <write>
  close(fd);
    1542:	89 1c 24             	mov    %ebx,(%esp)
    1545:	e8 66 2e 00 00       	call   43b0 <close>

  fd = open("unlinkread", O_RDWR);
    154a:	58                   	pop    %eax
    154b:	5a                   	pop    %edx
    154c:	6a 02                	push   $0x2
    154e:	68 a5 4e 00 00       	push   $0x4ea5
    1553:	e8 70 2e 00 00       	call   43c8 <open>
  if(fd < 0){
    1558:	83 c4 10             	add    $0x10,%esp
    155b:	85 c0                	test   %eax,%eax
    exit(1);
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    155d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    155f:	0f 88 33 01 00 00    	js     1698 <unlinkread+0x198>
    printf(1, "open unlinkread failed\n");
    exit(1);
  }
  if(unlink("unlinkread") != 0){
    1565:	83 ec 0c             	sub    $0xc,%esp
    1568:	68 a5 4e 00 00       	push   $0x4ea5
    156d:	e8 66 2e 00 00       	call   43d8 <unlink>
    1572:	83 c4 10             	add    $0x10,%esp
    1575:	85 c0                	test   %eax,%eax
    1577:	0f 85 01 01 00 00    	jne    167e <unlinkread+0x17e>
    printf(1, "unlink unlinkread failed\n");
    exit(1);
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    157d:	83 ec 08             	sub    $0x8,%esp
    1580:	68 02 02 00 00       	push   $0x202
    1585:	68 a5 4e 00 00       	push   $0x4ea5
    158a:	e8 39 2e 00 00       	call   43c8 <open>
  write(fd1, "yyy", 3);
    158f:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit(1);
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1592:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1594:	6a 03                	push   $0x3
    1596:	68 02 4f 00 00       	push   $0x4f02
    159b:	50                   	push   %eax
    159c:	e8 07 2e 00 00       	call   43a8 <write>
  close(fd1);
    15a1:	89 34 24             	mov    %esi,(%esp)
    15a4:	e8 07 2e 00 00       	call   43b0 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    15a9:	83 c4 0c             	add    $0xc,%esp
    15ac:	68 00 20 00 00       	push   $0x2000
    15b1:	68 e0 a7 00 00       	push   $0xa7e0
    15b6:	53                   	push   %ebx
    15b7:	e8 e4 2d 00 00       	call   43a0 <read>
    15bc:	83 c4 10             	add    $0x10,%esp
    15bf:	83 f8 05             	cmp    $0x5,%eax
    15c2:	0f 85 9c 00 00 00    	jne    1664 <unlinkread+0x164>
    printf(1, "unlinkread read failed");
    exit(1);
  }
  if(buf[0] != 'h'){
    15c8:	80 3d e0 a7 00 00 68 	cmpb   $0x68,0xa7e0
    15cf:	75 79                	jne    164a <unlinkread+0x14a>
    printf(1, "unlinkread wrong data\n");
    exit(1);
  }
  if(write(fd, buf, 10) != 10){
    15d1:	83 ec 04             	sub    $0x4,%esp
    15d4:	6a 0a                	push   $0xa
    15d6:	68 e0 a7 00 00       	push   $0xa7e0
    15db:	53                   	push   %ebx
    15dc:	e8 c7 2d 00 00       	call   43a8 <write>
    15e1:	83 c4 10             	add    $0x10,%esp
    15e4:	83 f8 0a             	cmp    $0xa,%eax
    15e7:	75 47                	jne    1630 <unlinkread+0x130>
    printf(1, "unlinkread write failed\n");
    exit(1);
  }
  close(fd);
    15e9:	83 ec 0c             	sub    $0xc,%esp
    15ec:	53                   	push   %ebx
    15ed:	e8 be 2d 00 00       	call   43b0 <close>
  unlink("unlinkread");
    15f2:	c7 04 24 a5 4e 00 00 	movl   $0x4ea5,(%esp)
    15f9:	e8 da 2d 00 00       	call   43d8 <unlink>
  printf(1, "unlinkread ok\n");
    15fe:	58                   	pop    %eax
    15ff:	5a                   	pop    %edx
    1600:	68 4d 4f 00 00       	push   $0x4f4d
    1605:	6a 01                	push   $0x1
    1607:	e8 34 2f 00 00       	call   4540 <printf>
}
    160c:	83 c4 10             	add    $0x10,%esp
    160f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1612:	5b                   	pop    %ebx
    1613:	5e                   	pop    %esi
    1614:	5d                   	pop    %ebp
    1615:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1616:	51                   	push   %ecx
    1617:	51                   	push   %ecx
    1618:	68 b0 4e 00 00       	push   $0x4eb0
    161d:	6a 01                	push   $0x1
    161f:	e8 1c 2f 00 00       	call   4540 <printf>
    exit(1);
    1624:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    162b:	e8 58 2d 00 00       	call   4388 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit(1);
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1630:	51                   	push   %ecx
    1631:	51                   	push   %ecx
    1632:	68 34 4f 00 00       	push   $0x4f34
    1637:	6a 01                	push   $0x1
    1639:	e8 02 2f 00 00       	call   4540 <printf>
    exit(1);
    163e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1645:	e8 3e 2d 00 00       	call   4388 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit(1);
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    164a:	53                   	push   %ebx
    164b:	53                   	push   %ebx
    164c:	68 1d 4f 00 00       	push   $0x4f1d
    1651:	6a 01                	push   $0x1
    1653:	e8 e8 2e 00 00       	call   4540 <printf>
    exit(1);
    1658:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    165f:	e8 24 2d 00 00       	call   4388 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    1664:	56                   	push   %esi
    1665:	56                   	push   %esi
    1666:	68 06 4f 00 00       	push   $0x4f06
    166b:	6a 01                	push   $0x1
    166d:	e8 ce 2e 00 00       	call   4540 <printf>
    exit(1);
    1672:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1679:	e8 0a 2d 00 00       	call   4388 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit(1);
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    167e:	50                   	push   %eax
    167f:	50                   	push   %eax
    1680:	68 e8 4e 00 00       	push   $0x4ee8
    1685:	6a 01                	push   $0x1
    1687:	e8 b4 2e 00 00       	call   4540 <printf>
    exit(1);
    168c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1693:	e8 f0 2c 00 00       	call   4388 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1698:	50                   	push   %eax
    1699:	50                   	push   %eax
    169a:	68 d0 4e 00 00       	push   $0x4ed0
    169f:	6a 01                	push   $0x1
    16a1:	e8 9a 2e 00 00       	call   4540 <printf>
    exit(1);
    16a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16ad:	e8 d6 2c 00 00       	call   4388 <exit>
    16b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000016c0 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    16c0:	55                   	push   %ebp
    16c1:	89 e5                	mov    %esp,%ebp
    16c3:	53                   	push   %ebx
    16c4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    16c7:	68 5c 4f 00 00       	push   $0x4f5c
    16cc:	6a 01                	push   $0x1
    16ce:	e8 6d 2e 00 00       	call   4540 <printf>

  unlink("lf1");
    16d3:	c7 04 24 66 4f 00 00 	movl   $0x4f66,(%esp)
    16da:	e8 f9 2c 00 00       	call   43d8 <unlink>
  unlink("lf2");
    16df:	c7 04 24 6a 4f 00 00 	movl   $0x4f6a,(%esp)
    16e6:	e8 ed 2c 00 00       	call   43d8 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    16eb:	58                   	pop    %eax
    16ec:	5a                   	pop    %edx
    16ed:	68 02 02 00 00       	push   $0x202
    16f2:	68 66 4f 00 00       	push   $0x4f66
    16f7:	e8 cc 2c 00 00       	call   43c8 <open>
  if(fd < 0){
    16fc:	83 c4 10             	add    $0x10,%esp
    16ff:	85 c0                	test   %eax,%eax
    1701:	0f 88 1e 01 00 00    	js     1825 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit(1);
  }
  if(write(fd, "hello", 5) != 5){
    1707:	83 ec 04             	sub    $0x4,%esp
    170a:	89 c3                	mov    %eax,%ebx
    170c:	6a 05                	push   $0x5
    170e:	68 ca 4e 00 00       	push   $0x4eca
    1713:	50                   	push   %eax
    1714:	e8 8f 2c 00 00       	call   43a8 <write>
    1719:	83 c4 10             	add    $0x10,%esp
    171c:	83 f8 05             	cmp    $0x5,%eax
    171f:	0f 85 d0 01 00 00    	jne    18f5 <linktest+0x235>
    printf(1, "write lf1 failed\n");
    exit(1);
  }
  close(fd);
    1725:	83 ec 0c             	sub    $0xc,%esp
    1728:	53                   	push   %ebx
    1729:	e8 82 2c 00 00       	call   43b0 <close>

  if(link("lf1", "lf2") < 0){
    172e:	5b                   	pop    %ebx
    172f:	58                   	pop    %eax
    1730:	68 6a 4f 00 00       	push   $0x4f6a
    1735:	68 66 4f 00 00       	push   $0x4f66
    173a:	e8 a9 2c 00 00       	call   43e8 <link>
    173f:	83 c4 10             	add    $0x10,%esp
    1742:	85 c0                	test   %eax,%eax
    1744:	0f 88 91 01 00 00    	js     18db <linktest+0x21b>
    printf(1, "link lf1 lf2 failed\n");
    exit(1);
  }
  unlink("lf1");
    174a:	83 ec 0c             	sub    $0xc,%esp
    174d:	68 66 4f 00 00       	push   $0x4f66
    1752:	e8 81 2c 00 00       	call   43d8 <unlink>

  if(open("lf1", 0) >= 0){
    1757:	58                   	pop    %eax
    1758:	5a                   	pop    %edx
    1759:	6a 00                	push   $0x0
    175b:	68 66 4f 00 00       	push   $0x4f66
    1760:	e8 63 2c 00 00       	call   43c8 <open>
    1765:	83 c4 10             	add    $0x10,%esp
    1768:	85 c0                	test   %eax,%eax
    176a:	0f 89 51 01 00 00    	jns    18c1 <linktest+0x201>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit(1);
  }

  fd = open("lf2", 0);
    1770:	83 ec 08             	sub    $0x8,%esp
    1773:	6a 00                	push   $0x0
    1775:	68 6a 4f 00 00       	push   $0x4f6a
    177a:	e8 49 2c 00 00       	call   43c8 <open>
  if(fd < 0){
    177f:	83 c4 10             	add    $0x10,%esp
    1782:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit(1);
  }

  fd = open("lf2", 0);
    1784:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1786:	0f 88 1b 01 00 00    	js     18a7 <linktest+0x1e7>
    printf(1, "open lf2 failed\n");
    exit(1);
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    178c:	83 ec 04             	sub    $0x4,%esp
    178f:	68 00 20 00 00       	push   $0x2000
    1794:	68 e0 a7 00 00       	push   $0xa7e0
    1799:	50                   	push   %eax
    179a:	e8 01 2c 00 00       	call   43a0 <read>
    179f:	83 c4 10             	add    $0x10,%esp
    17a2:	83 f8 05             	cmp    $0x5,%eax
    17a5:	0f 85 e2 00 00 00    	jne    188d <linktest+0x1cd>
    printf(1, "read lf2 failed\n");
    exit(1);
  }
  close(fd);
    17ab:	83 ec 0c             	sub    $0xc,%esp
    17ae:	53                   	push   %ebx
    17af:	e8 fc 2b 00 00       	call   43b0 <close>

  if(link("lf2", "lf2") >= 0){
    17b4:	58                   	pop    %eax
    17b5:	5a                   	pop    %edx
    17b6:	68 6a 4f 00 00       	push   $0x4f6a
    17bb:	68 6a 4f 00 00       	push   $0x4f6a
    17c0:	e8 23 2c 00 00       	call   43e8 <link>
    17c5:	83 c4 10             	add    $0x10,%esp
    17c8:	85 c0                	test   %eax,%eax
    17ca:	0f 89 a3 00 00 00    	jns    1873 <linktest+0x1b3>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit(1);
  }

  unlink("lf2");
    17d0:	83 ec 0c             	sub    $0xc,%esp
    17d3:	68 6a 4f 00 00       	push   $0x4f6a
    17d8:	e8 fb 2b 00 00       	call   43d8 <unlink>
  if(link("lf2", "lf1") >= 0){
    17dd:	59                   	pop    %ecx
    17de:	5b                   	pop    %ebx
    17df:	68 66 4f 00 00       	push   $0x4f66
    17e4:	68 6a 4f 00 00       	push   $0x4f6a
    17e9:	e8 fa 2b 00 00       	call   43e8 <link>
    17ee:	83 c4 10             	add    $0x10,%esp
    17f1:	85 c0                	test   %eax,%eax
    17f3:	79 64                	jns    1859 <linktest+0x199>
    printf(1, "link non-existant succeeded! oops\n");
    exit(1);
  }

  if(link(".", "lf1") >= 0){
    17f5:	83 ec 08             	sub    $0x8,%esp
    17f8:	68 66 4f 00 00       	push   $0x4f66
    17fd:	68 2e 52 00 00       	push   $0x522e
    1802:	e8 e1 2b 00 00       	call   43e8 <link>
    1807:	83 c4 10             	add    $0x10,%esp
    180a:	85 c0                	test   %eax,%eax
    180c:	79 31                	jns    183f <linktest+0x17f>
    printf(1, "link . lf1 succeeded! oops\n");   
    exit(1);
  }

  printf(1, "linktest ok\n");
    180e:	83 ec 08             	sub    $0x8,%esp
    1811:	68 04 50 00 00       	push   $0x5004
    1816:	6a 01                	push   $0x1
    1818:	e8 23 2d 00 00       	call   4540 <printf>
}
    181d:	83 c4 10             	add    $0x10,%esp
    1820:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1823:	c9                   	leave  
    1824:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1825:	50                   	push   %eax
    1826:	50                   	push   %eax
    1827:	68 6e 4f 00 00       	push   $0x4f6e
    182c:	6a 01                	push   $0x1
    182e:	e8 0d 2d 00 00       	call   4540 <printf>
    exit(1);
    1833:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    183a:	e8 49 2b 00 00       	call   4388 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit(1);
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");   
    183f:	50                   	push   %eax
    1840:	50                   	push   %eax
    1841:	68 e8 4f 00 00       	push   $0x4fe8
    1846:	6a 01                	push   $0x1
    1848:	e8 f3 2c 00 00       	call   4540 <printf>
    exit(1);
    184d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1854:	e8 2f 2b 00 00       	call   4388 <exit>
    exit(1);
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    1859:	52                   	push   %edx
    185a:	52                   	push   %edx
    185b:	68 10 5d 00 00       	push   $0x5d10
    1860:	6a 01                	push   $0x1
    1862:	e8 d9 2c 00 00       	call   4540 <printf>
    exit(1);
    1867:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    186e:	e8 15 2b 00 00       	call   4388 <exit>
    exit(1);
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1873:	50                   	push   %eax
    1874:	50                   	push   %eax
    1875:	68 ca 4f 00 00       	push   $0x4fca
    187a:	6a 01                	push   $0x1
    187c:	e8 bf 2c 00 00       	call   4540 <printf>
    exit(1);
    1881:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1888:	e8 fb 2a 00 00       	call   4388 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit(1);
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    188d:	51                   	push   %ecx
    188e:	51                   	push   %ecx
    188f:	68 b9 4f 00 00       	push   $0x4fb9
    1894:	6a 01                	push   $0x1
    1896:	e8 a5 2c 00 00       	call   4540 <printf>
    exit(1);
    189b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18a2:	e8 e1 2a 00 00       	call   4388 <exit>
    exit(1);
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    18a7:	53                   	push   %ebx
    18a8:	53                   	push   %ebx
    18a9:	68 a8 4f 00 00       	push   $0x4fa8
    18ae:	6a 01                	push   $0x1
    18b0:	e8 8b 2c 00 00       	call   4540 <printf>
    exit(1);
    18b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18bc:	e8 c7 2a 00 00       	call   4388 <exit>
    exit(1);
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    18c1:	50                   	push   %eax
    18c2:	50                   	push   %eax
    18c3:	68 e8 5c 00 00       	push   $0x5ce8
    18c8:	6a 01                	push   $0x1
    18ca:	e8 71 2c 00 00       	call   4540 <printf>
    exit(1);
    18cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18d6:	e8 ad 2a 00 00       	call   4388 <exit>
    exit(1);
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    18db:	51                   	push   %ecx
    18dc:	51                   	push   %ecx
    18dd:	68 93 4f 00 00       	push   $0x4f93
    18e2:	6a 01                	push   $0x1
    18e4:	e8 57 2c 00 00       	call   4540 <printf>
    exit(1);
    18e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f0:	e8 93 2a 00 00       	call   4388 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit(1);
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    18f5:	50                   	push   %eax
    18f6:	50                   	push   %eax
    18f7:	68 81 4f 00 00       	push   $0x4f81
    18fc:	6a 01                	push   $0x1
    18fe:	e8 3d 2c 00 00       	call   4540 <printf>
    exit(1);
    1903:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    190a:	e8 79 2a 00 00       	call   4388 <exit>
    190f:	90                   	nop

00001910 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1910:	55                   	push   %ebp
    1911:	89 e5                	mov    %esp,%ebp
    1913:	57                   	push   %edi
    1914:	56                   	push   %esi
    1915:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1916:	31 f6                	xor    %esi,%esi
    1918:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    191b:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1920:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1923:	68 11 50 00 00       	push   $0x5011
    1928:	6a 01                	push   $0x1
    192a:	e8 11 2c 00 00       	call   4540 <printf>
  file[0] = 'C';
    192f:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1933:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1937:	83 c4 10             	add    $0x10,%esp
    193a:	eb 59                	jmp    1995 <concreate+0x85>
    193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    1940:	89 f0                	mov    %esi,%eax
    1942:	89 f1                	mov    %esi,%ecx
    1944:	f7 ef                	imul   %edi
    1946:	89 f0                	mov    %esi,%eax
    1948:	c1 f8 1f             	sar    $0x1f,%eax
    194b:	29 c2                	sub    %eax,%edx
    194d:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1950:	29 c1                	sub    %eax,%ecx
    1952:	83 f9 01             	cmp    $0x1,%ecx
    1955:	0f 84 cd 00 00 00    	je     1a28 <concreate+0x118>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    195b:	83 ec 08             	sub    $0x8,%esp
    195e:	68 02 02 00 00       	push   $0x202
    1963:	53                   	push   %ebx
    1964:	e8 5f 2a 00 00       	call   43c8 <open>
      if(fd < 0){
    1969:	83 c4 10             	add    $0x10,%esp
    196c:	85 c0                	test   %eax,%eax
    196e:	78 75                	js     19e5 <concreate+0xd5>
        printf(1, "concreate create %s failed\n", file);
        exit(1);
      }
      close(fd);
    1970:	83 ec 0c             	sub    $0xc,%esp
    1973:	50                   	push   %eax
    1974:	e8 37 2a 00 00       	call   43b0 <close>
    1979:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit(0);
    else
      wait(0);
    197c:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    197f:	83 c6 01             	add    $0x1,%esi
      close(fd);
    }
    if(pid == 0)
      exit(0);
    else
      wait(0);
    1982:	6a 00                	push   $0x0
    1984:	e8 07 2a 00 00       	call   4390 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1989:	83 c4 10             	add    $0x10,%esp
    198c:	83 fe 28             	cmp    $0x28,%esi
    198f:	0f 84 ab 00 00 00    	je     1a40 <concreate+0x130>
    file[1] = '0' + i;
    unlink(file);
    1995:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1998:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    199b:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    199c:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    199f:	e8 34 2a 00 00       	call   43d8 <unlink>
    pid = fork();
    19a4:	e8 d7 29 00 00       	call   4380 <fork>
    if(pid && (i % 3) == 1){
    19a9:	83 c4 10             	add    $0x10,%esp
    19ac:	85 c0                	test   %eax,%eax
    19ae:	75 90                	jne    1940 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    19b0:	89 f0                	mov    %esi,%eax
    19b2:	ba 67 66 66 66       	mov    $0x66666667,%edx
    19b7:	f7 ea                	imul   %edx
    19b9:	89 f0                	mov    %esi,%eax
    19bb:	c1 f8 1f             	sar    $0x1f,%eax
    19be:	d1 fa                	sar    %edx
    19c0:	29 c2                	sub    %eax,%edx
    19c2:	8d 04 92             	lea    (%edx,%edx,4),%eax
    19c5:	29 c6                	sub    %eax,%esi
    19c7:	83 fe 01             	cmp    $0x1,%esi
    19ca:	74 3c                	je     1a08 <concreate+0xf8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    19cc:	83 ec 08             	sub    $0x8,%esp
    19cf:	68 02 02 00 00       	push   $0x202
    19d4:	53                   	push   %ebx
    19d5:	e8 ee 29 00 00       	call   43c8 <open>
      if(fd < 0){
    19da:	83 c4 10             	add    $0x10,%esp
    19dd:	85 c0                	test   %eax,%eax
    19df:	0f 89 56 02 00 00    	jns    1c3b <concreate+0x32b>
        printf(1, "concreate create %s failed\n", file);
    19e5:	83 ec 04             	sub    $0x4,%esp
    19e8:	53                   	push   %ebx
    19e9:	68 24 50 00 00       	push   $0x5024
    19ee:	6a 01                	push   $0x1
    19f0:	e8 4b 2b 00 00       	call   4540 <printf>
        exit(1);
    19f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19fc:	e8 87 29 00 00       	call   4388 <exit>
    1a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    1a08:	83 ec 08             	sub    $0x8,%esp
    1a0b:	53                   	push   %ebx
    1a0c:	68 21 50 00 00       	push   $0x5021
    1a11:	e8 d2 29 00 00       	call   43e8 <link>
    1a16:	83 c4 10             	add    $0x10,%esp
        exit(1);
      }
      close(fd);
    }
    if(pid == 0)
      exit(0);
    1a19:	83 ec 0c             	sub    $0xc,%esp
    1a1c:	6a 00                	push   $0x0
    1a1e:	e8 65 29 00 00       	call   4388 <exit>
    1a23:	90                   	nop
    1a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1a28:	83 ec 08             	sub    $0x8,%esp
    1a2b:	53                   	push   %ebx
    1a2c:	68 21 50 00 00       	push   $0x5021
    1a31:	e8 b2 29 00 00       	call   43e8 <link>
    1a36:	83 c4 10             	add    $0x10,%esp
    1a39:	e9 3e ff ff ff       	jmp    197c <concreate+0x6c>
    1a3e:	66 90                	xchg   %ax,%ax
      exit(0);
    else
      wait(0);
  }

  memset(fa, 0, sizeof(fa));
    1a40:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1a43:	83 ec 04             	sub    $0x4,%esp
    1a46:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1a49:	6a 28                	push   $0x28
    1a4b:	6a 00                	push   $0x0
    1a4d:	50                   	push   %eax
    1a4e:	e8 dd 25 00 00       	call   4030 <memset>
  fd = open(".", 0);
    1a53:	59                   	pop    %ecx
    1a54:	5e                   	pop    %esi
    1a55:	6a 00                	push   $0x0
    1a57:	68 2e 52 00 00       	push   $0x522e
    1a5c:	e8 67 29 00 00       	call   43c8 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1a61:	83 c4 10             	add    $0x10,%esp
    else
      wait(0);
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    1a64:	89 c6                	mov    %eax,%esi
  n = 0;
    1a66:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1a6d:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1a70:	83 ec 04             	sub    $0x4,%esp
    1a73:	6a 10                	push   $0x10
    1a75:	57                   	push   %edi
    1a76:	56                   	push   %esi
    1a77:	e8 24 29 00 00       	call   43a0 <read>
    1a7c:	83 c4 10             	add    $0x10,%esp
    1a7f:	85 c0                	test   %eax,%eax
    1a81:	7e 3d                	jle    1ac0 <concreate+0x1b0>
    if(de.inum == 0)
    1a83:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1a88:	74 e6                	je     1a70 <concreate+0x160>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1a8a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1a8e:	75 e0                	jne    1a70 <concreate+0x160>
    1a90:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1a94:	75 da                	jne    1a70 <concreate+0x160>
      i = de.name[1] - '0';
    1a96:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1a9a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1a9d:	83 f8 27             	cmp    $0x27,%eax
    1aa0:	0f 87 76 01 00 00    	ja     1c1c <concreate+0x30c>
        printf(1, "concreate weird file %s\n", de.name);
        exit(1);
      }
      if(fa[i]){
    1aa6:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1aab:	0f 85 4c 01 00 00    	jne    1bfd <concreate+0x2ed>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit(1);
      }
      fa[i] = 1;
    1ab1:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    1ab6:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1aba:	eb b4                	jmp    1a70 <concreate+0x160>
    1abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1ac0:	83 ec 0c             	sub    $0xc,%esp
    1ac3:	56                   	push   %esi
    1ac4:	e8 e7 28 00 00       	call   43b0 <close>

  if(n != 40){
    1ac9:	83 c4 10             	add    $0x10,%esp
    1acc:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1ad0:	0f 85 0c 01 00 00    	jne    1be2 <concreate+0x2d2>
    1ad6:	31 f6                	xor    %esi,%esi
    1ad8:	eb 78                	jmp    1b52 <concreate+0x242>
    1ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit(1);
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1ae0:	83 fa 01             	cmp    $0x1,%edx
    1ae3:	0f 85 a1 00 00 00    	jne    1b8a <concreate+0x27a>
      close(open(file, 0));
    1ae9:	83 ec 08             	sub    $0x8,%esp
    1aec:	6a 00                	push   $0x0
    1aee:	53                   	push   %ebx
    1aef:	e8 d4 28 00 00       	call   43c8 <open>
    1af4:	89 04 24             	mov    %eax,(%esp)
    1af7:	e8 b4 28 00 00       	call   43b0 <close>
      close(open(file, 0));
    1afc:	58                   	pop    %eax
    1afd:	5a                   	pop    %edx
    1afe:	6a 00                	push   $0x0
    1b00:	53                   	push   %ebx
    1b01:	e8 c2 28 00 00       	call   43c8 <open>
    1b06:	89 04 24             	mov    %eax,(%esp)
    1b09:	e8 a2 28 00 00       	call   43b0 <close>
      close(open(file, 0));
    1b0e:	59                   	pop    %ecx
    1b0f:	58                   	pop    %eax
    1b10:	6a 00                	push   $0x0
    1b12:	53                   	push   %ebx
    1b13:	e8 b0 28 00 00       	call   43c8 <open>
    1b18:	89 04 24             	mov    %eax,(%esp)
    1b1b:	e8 90 28 00 00       	call   43b0 <close>
      close(open(file, 0));
    1b20:	58                   	pop    %eax
    1b21:	5a                   	pop    %edx
    1b22:	6a 00                	push   $0x0
    1b24:	53                   	push   %ebx
    1b25:	e8 9e 28 00 00       	call   43c8 <open>
    1b2a:	89 04 24             	mov    %eax,(%esp)
    1b2d:	e8 7e 28 00 00       	call   43b0 <close>
    1b32:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    1b35:	85 ff                	test   %edi,%edi
    1b37:	0f 84 dc fe ff ff    	je     1a19 <concreate+0x109>
      exit(0);
    else
      wait(0);
    1b3d:	83 ec 0c             	sub    $0xc,%esp
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(1);
  }

  for(i = 0; i < 40; i++){
    1b40:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit(0);
    else
      wait(0);
    1b43:	6a 00                	push   $0x0
    1b45:	e8 46 28 00 00       	call   4390 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(1);
  }

  for(i = 0; i < 40; i++){
    1b4a:	83 c4 10             	add    $0x10,%esp
    1b4d:	83 fe 28             	cmp    $0x28,%esi
    1b50:	74 5e                	je     1bb0 <concreate+0x2a0>
    file[1] = '0' + i;
    1b52:	8d 46 30             	lea    0x30(%esi),%eax
    1b55:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1b58:	e8 23 28 00 00       	call   4380 <fork>
    if(pid < 0){
    1b5d:	85 c0                	test   %eax,%eax
    exit(1);
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    1b5f:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1b61:	78 64                	js     1bc7 <concreate+0x2b7>
      printf(1, "fork failed\n");
      exit(1);
    }
    if(((i % 3) == 0 && pid == 0) ||
    1b63:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1b68:	f7 ee                	imul   %esi
    1b6a:	89 f0                	mov    %esi,%eax
    1b6c:	c1 f8 1f             	sar    $0x1f,%eax
    1b6f:	29 c2                	sub    %eax,%edx
    1b71:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b74:	89 f2                	mov    %esi,%edx
    1b76:	29 c2                	sub    %eax,%edx
    1b78:	89 f8                	mov    %edi,%eax
    1b7a:	09 d0                	or     %edx,%eax
    1b7c:	0f 84 67 ff ff ff    	je     1ae9 <concreate+0x1d9>
       ((i % 3) == 1 && pid != 0)){
    1b82:	85 ff                	test   %edi,%edi
    1b84:	0f 85 56 ff ff ff    	jne    1ae0 <concreate+0x1d0>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1b8a:	83 ec 0c             	sub    $0xc,%esp
    1b8d:	53                   	push   %ebx
    1b8e:	e8 45 28 00 00       	call   43d8 <unlink>
      unlink(file);
    1b93:	89 1c 24             	mov    %ebx,(%esp)
    1b96:	e8 3d 28 00 00       	call   43d8 <unlink>
      unlink(file);
    1b9b:	89 1c 24             	mov    %ebx,(%esp)
    1b9e:	e8 35 28 00 00       	call   43d8 <unlink>
      unlink(file);
    1ba3:	89 1c 24             	mov    %ebx,(%esp)
    1ba6:	e8 2d 28 00 00       	call   43d8 <unlink>
    1bab:	83 c4 10             	add    $0x10,%esp
    1bae:	eb 85                	jmp    1b35 <concreate+0x225>
      exit(0);
    else
      wait(0);
  }

  printf(1, "concreate ok\n");
    1bb0:	83 ec 08             	sub    $0x8,%esp
    1bb3:	68 76 50 00 00       	push   $0x5076
    1bb8:	6a 01                	push   $0x1
    1bba:	e8 81 29 00 00       	call   4540 <printf>
}
    1bbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1bc2:	5b                   	pop    %ebx
    1bc3:	5e                   	pop    %esi
    1bc4:	5f                   	pop    %edi
    1bc5:	5d                   	pop    %ebp
    1bc6:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1bc7:	83 ec 08             	sub    $0x8,%esp
    1bca:	68 f9 58 00 00       	push   $0x58f9
    1bcf:	6a 01                	push   $0x1
    1bd1:	e8 6a 29 00 00       	call   4540 <printf>
      exit(1);
    1bd6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bdd:	e8 a6 27 00 00       	call   4388 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1be2:	83 ec 08             	sub    $0x8,%esp
    1be5:	68 34 5d 00 00       	push   $0x5d34
    1bea:	6a 01                	push   $0x1
    1bec:	e8 4f 29 00 00       	call   4540 <printf>
    exit(1);
    1bf1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bf8:	e8 8b 27 00 00       	call   4388 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit(1);
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1bfd:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1c00:	83 ec 04             	sub    $0x4,%esp
    1c03:	50                   	push   %eax
    1c04:	68 59 50 00 00       	push   $0x5059
    1c09:	6a 01                	push   $0x1
    1c0b:	e8 30 29 00 00       	call   4540 <printf>
        exit(1);
    1c10:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c17:	e8 6c 27 00 00       	call   4388 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1c1c:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1c1f:	83 ec 04             	sub    $0x4,%esp
    1c22:	50                   	push   %eax
    1c23:	68 40 50 00 00       	push   $0x5040
    1c28:	6a 01                	push   $0x1
    1c2a:	e8 11 29 00 00       	call   4540 <printf>
        exit(1);
    1c2f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c36:	e8 4d 27 00 00       	call   4388 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit(1);
      }
      close(fd);
    1c3b:	83 ec 0c             	sub    $0xc,%esp
    1c3e:	50                   	push   %eax
    1c3f:	e8 6c 27 00 00       	call   43b0 <close>
    1c44:	83 c4 10             	add    $0x10,%esp
    1c47:	e9 cd fd ff ff       	jmp    1a19 <concreate+0x109>
    1c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001c50 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1c50:	55                   	push   %ebp
    1c51:	89 e5                	mov    %esp,%ebp
    1c53:	57                   	push   %edi
    1c54:	56                   	push   %esi
    1c55:	53                   	push   %ebx
    1c56:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1c59:	68 84 50 00 00       	push   $0x5084
    1c5e:	6a 01                	push   $0x1
    1c60:	e8 db 28 00 00       	call   4540 <printf>

  unlink("x");
    1c65:	c7 04 24 11 53 00 00 	movl   $0x5311,(%esp)
    1c6c:	e8 67 27 00 00       	call   43d8 <unlink>
  pid = fork();
    1c71:	e8 0a 27 00 00       	call   4380 <fork>
  if(pid < 0){
    1c76:	83 c4 10             	add    $0x10,%esp
    1c79:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1c7b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1c7e:	0f 88 b6 00 00 00    	js     1d3a <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit(1);
  }

  unsigned int x = (pid ? 1 : 97);
    1c84:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1c88:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1c8d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit(1);
  }

  unsigned int x = (pid ? 1 : 97);
    1c92:	19 ff                	sbb    %edi,%edi
    1c94:	83 e7 60             	and    $0x60,%edi
    1c97:	83 c7 01             	add    $0x1,%edi
    1c9a:	eb 1e                	jmp    1cba <linkunlink+0x6a>
    1c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1ca0:	83 fa 01             	cmp    $0x1,%edx
    1ca3:	74 7b                	je     1d20 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1ca5:	83 ec 0c             	sub    $0xc,%esp
    1ca8:	68 11 53 00 00       	push   $0x5311
    1cad:	e8 26 27 00 00       	call   43d8 <unlink>
    1cb2:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit(1);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1cb5:	83 eb 01             	sub    $0x1,%ebx
    1cb8:	74 3d                	je     1cf7 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1cba:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1cc0:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1cc6:	89 f8                	mov    %edi,%eax
    1cc8:	f7 e6                	mul    %esi
    1cca:	d1 ea                	shr    %edx
    1ccc:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1ccf:	89 fa                	mov    %edi,%edx
    1cd1:	29 c2                	sub    %eax,%edx
    1cd3:	75 cb                	jne    1ca0 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1cd5:	83 ec 08             	sub    $0x8,%esp
    1cd8:	68 02 02 00 00       	push   $0x202
    1cdd:	68 11 53 00 00       	push   $0x5311
    1ce2:	e8 e1 26 00 00       	call   43c8 <open>
    1ce7:	89 04 24             	mov    %eax,(%esp)
    1cea:	e8 c1 26 00 00       	call   43b0 <close>
    1cef:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit(1);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1cf2:	83 eb 01             	sub    $0x1,%ebx
    1cf5:	75 c3                	jne    1cba <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1cf7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1cfa:	85 c9                	test   %ecx,%ecx
    1cfc:	74 57                	je     1d55 <linkunlink+0x105>
    wait(0);
    1cfe:	83 ec 0c             	sub    $0xc,%esp
    1d01:	6a 00                	push   $0x0
    1d03:	e8 88 26 00 00       	call   4390 <wait>
  else
    exit(0);

  printf(1, "linkunlink ok\n");
    1d08:	58                   	pop    %eax
    1d09:	5a                   	pop    %edx
    1d0a:	68 99 50 00 00       	push   $0x5099
    1d0f:	6a 01                	push   $0x1
    1d11:	e8 2a 28 00 00       	call   4540 <printf>
}
    1d16:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d19:	5b                   	pop    %ebx
    1d1a:	5e                   	pop    %esi
    1d1b:	5f                   	pop    %edi
    1d1c:	5d                   	pop    %ebp
    1d1d:	c3                   	ret    
    1d1e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1d20:	83 ec 08             	sub    $0x8,%esp
    1d23:	68 11 53 00 00       	push   $0x5311
    1d28:	68 95 50 00 00       	push   $0x5095
    1d2d:	e8 b6 26 00 00       	call   43e8 <link>
    1d32:	83 c4 10             	add    $0x10,%esp
    1d35:	e9 7b ff ff ff       	jmp    1cb5 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1d3a:	83 ec 08             	sub    $0x8,%esp
    1d3d:	68 f9 58 00 00       	push   $0x58f9
    1d42:	6a 01                	push   $0x1
    1d44:	e8 f7 27 00 00       	call   4540 <printf>
    exit(1);
    1d49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d50:	e8 33 26 00 00       	call   4388 <exit>
  }

  if(pid)
    wait(0);
  else
    exit(0);
    1d55:	83 ec 0c             	sub    $0xc,%esp
    1d58:	6a 00                	push   $0x0
    1d5a:	e8 29 26 00 00       	call   4388 <exit>
    1d5f:	90                   	nop

00001d60 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1d60:	55                   	push   %ebp
    1d61:	89 e5                	mov    %esp,%ebp
    1d63:	56                   	push   %esi
    1d64:	53                   	push   %ebx
    1d65:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1d68:	68 a8 50 00 00       	push   $0x50a8
    1d6d:	6a 01                	push   $0x1
    1d6f:	e8 cc 27 00 00       	call   4540 <printf>
  unlink("bd");
    1d74:	c7 04 24 b5 50 00 00 	movl   $0x50b5,(%esp)
    1d7b:	e8 58 26 00 00       	call   43d8 <unlink>

  fd = open("bd", O_CREATE);
    1d80:	58                   	pop    %eax
    1d81:	5a                   	pop    %edx
    1d82:	68 00 02 00 00       	push   $0x200
    1d87:	68 b5 50 00 00       	push   $0x50b5
    1d8c:	e8 37 26 00 00       	call   43c8 <open>
  if(fd < 0){
    1d91:	83 c4 10             	add    $0x10,%esp
    1d94:	85 c0                	test   %eax,%eax
    1d96:	0f 88 ec 00 00 00    	js     1e88 <bigdir+0x128>
    printf(1, "bigdir create failed\n");
    exit(1);
  }
  close(fd);
    1d9c:	83 ec 0c             	sub    $0xc,%esp
    1d9f:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1da2:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit(1);
  }
  close(fd);
    1da4:	50                   	push   %eax
    1da5:	e8 06 26 00 00       	call   43b0 <close>
    1daa:	83 c4 10             	add    $0x10,%esp
    1dad:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1db0:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1db2:	83 ec 08             	sub    $0x8,%esp
    exit(1);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1db5:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1db9:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1dbc:	56                   	push   %esi
    1dbd:	68 b5 50 00 00       	push   $0x50b5
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1dc2:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1dc5:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1dc9:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1dcc:	89 d8                	mov    %ebx,%eax
    1dce:	83 e0 3f             	and    $0x3f,%eax
    1dd1:	83 c0 30             	add    $0x30,%eax
    1dd4:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1dd7:	e8 0c 26 00 00       	call   43e8 <link>
    1ddc:	83 c4 10             	add    $0x10,%esp
    1ddf:	85 c0                	test   %eax,%eax
    1de1:	75 6f                	jne    1e52 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit(1);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1de3:	83 c3 01             	add    $0x1,%ebx
    1de6:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1dec:	75 c2                	jne    1db0 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit(1);
    }
  }

  unlink("bd");
    1dee:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1df1:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit(1);
    }
  }

  unlink("bd");
    1df3:	68 b5 50 00 00       	push   $0x50b5
    1df8:	e8 db 25 00 00       	call   43d8 <unlink>
    1dfd:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1e00:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1e02:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1e05:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1e09:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1e0c:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1e0d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1e11:	83 c0 30             	add    $0x30,%eax
    1e14:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1e17:	89 d8                	mov    %ebx,%eax
    1e19:	83 e0 3f             	and    $0x3f,%eax
    1e1c:	83 c0 30             	add    $0x30,%eax
    1e1f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1e22:	e8 b1 25 00 00       	call   43d8 <unlink>
    1e27:	83 c4 10             	add    $0x10,%esp
    1e2a:	85 c0                	test   %eax,%eax
    1e2c:	75 3f                	jne    1e6d <bigdir+0x10d>
      exit(1);
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1e2e:	83 c3 01             	add    $0x1,%ebx
    1e31:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1e37:	75 c7                	jne    1e00 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit(1);
    }
  }

  printf(1, "bigdir ok\n");
    1e39:	83 ec 08             	sub    $0x8,%esp
    1e3c:	68 f7 50 00 00       	push   $0x50f7
    1e41:	6a 01                	push   $0x1
    1e43:	e8 f8 26 00 00       	call   4540 <printf>
}
    1e48:	83 c4 10             	add    $0x10,%esp
    1e4b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1e4e:	5b                   	pop    %ebx
    1e4f:	5e                   	pop    %esi
    1e50:	5d                   	pop    %ebp
    1e51:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1e52:	83 ec 08             	sub    $0x8,%esp
    1e55:	68 ce 50 00 00       	push   $0x50ce
    1e5a:	6a 01                	push   $0x1
    1e5c:	e8 df 26 00 00       	call   4540 <printf>
      exit(1);
    1e61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e68:	e8 1b 25 00 00       	call   4388 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1e6d:	83 ec 08             	sub    $0x8,%esp
    1e70:	68 e2 50 00 00       	push   $0x50e2
    1e75:	6a 01                	push   $0x1
    1e77:	e8 c4 26 00 00       	call   4540 <printf>
      exit(1);
    1e7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e83:	e8 00 25 00 00       	call   4388 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1e88:	83 ec 08             	sub    $0x8,%esp
    1e8b:	68 b8 50 00 00       	push   $0x50b8
    1e90:	6a 01                	push   $0x1
    1e92:	e8 a9 26 00 00       	call   4540 <printf>
    exit(1);
    1e97:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e9e:	e8 e5 24 00 00       	call   4388 <exit>
    1ea3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001eb0 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1eb0:	55                   	push   %ebp
    1eb1:	89 e5                	mov    %esp,%ebp
    1eb3:	53                   	push   %ebx
    1eb4:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1eb7:	68 02 51 00 00       	push   $0x5102
    1ebc:	6a 01                	push   $0x1
    1ebe:	e8 7d 26 00 00       	call   4540 <printf>

  unlink("ff");
    1ec3:	c7 04 24 8b 51 00 00 	movl   $0x518b,(%esp)
    1eca:	e8 09 25 00 00       	call   43d8 <unlink>
  if(mkdir("dd") != 0){
    1ecf:	c7 04 24 28 52 00 00 	movl   $0x5228,(%esp)
    1ed6:	e8 15 25 00 00       	call   43f0 <mkdir>
    1edb:	83 c4 10             	add    $0x10,%esp
    1ede:	85 c0                	test   %eax,%eax
    1ee0:	0f 85 4d 06 00 00    	jne    2533 <subdir+0x683>
    printf(1, "subdir mkdir dd failed\n");
    exit(1);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1ee6:	83 ec 08             	sub    $0x8,%esp
    1ee9:	68 02 02 00 00       	push   $0x202
    1eee:	68 61 51 00 00       	push   $0x5161
    1ef3:	e8 d0 24 00 00       	call   43c8 <open>
  if(fd < 0){
    1ef8:	83 c4 10             	add    $0x10,%esp
    1efb:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit(1);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1efd:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1eff:	0f 88 14 06 00 00    	js     2519 <subdir+0x669>
    printf(1, "create dd/ff failed\n");
    exit(1);
  }
  write(fd, "ff", 2);
    1f05:	83 ec 04             	sub    $0x4,%esp
    1f08:	6a 02                	push   $0x2
    1f0a:	68 8b 51 00 00       	push   $0x518b
    1f0f:	50                   	push   %eax
    1f10:	e8 93 24 00 00       	call   43a8 <write>
  close(fd);
    1f15:	89 1c 24             	mov    %ebx,(%esp)
    1f18:	e8 93 24 00 00       	call   43b0 <close>

  if(unlink("dd") >= 0){
    1f1d:	c7 04 24 28 52 00 00 	movl   $0x5228,(%esp)
    1f24:	e8 af 24 00 00       	call   43d8 <unlink>
    1f29:	83 c4 10             	add    $0x10,%esp
    1f2c:	85 c0                	test   %eax,%eax
    1f2e:	0f 89 cb 05 00 00    	jns    24ff <subdir+0x64f>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit(1);
  }

  if(mkdir("/dd/dd") != 0){
    1f34:	83 ec 0c             	sub    $0xc,%esp
    1f37:	68 3c 51 00 00       	push   $0x513c
    1f3c:	e8 af 24 00 00       	call   43f0 <mkdir>
    1f41:	83 c4 10             	add    $0x10,%esp
    1f44:	85 c0                	test   %eax,%eax
    1f46:	0f 85 99 05 00 00    	jne    24e5 <subdir+0x635>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit(1);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1f4c:	83 ec 08             	sub    $0x8,%esp
    1f4f:	68 02 02 00 00       	push   $0x202
    1f54:	68 5e 51 00 00       	push   $0x515e
    1f59:	e8 6a 24 00 00       	call   43c8 <open>
  if(fd < 0){
    1f5e:	83 c4 10             	add    $0x10,%esp
    1f61:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit(1);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1f63:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f65:	0f 88 5c 04 00 00    	js     23c7 <subdir+0x517>
    printf(1, "create dd/dd/ff failed\n");
    exit(1);
  }
  write(fd, "FF", 2);
    1f6b:	83 ec 04             	sub    $0x4,%esp
    1f6e:	6a 02                	push   $0x2
    1f70:	68 7f 51 00 00       	push   $0x517f
    1f75:	50                   	push   %eax
    1f76:	e8 2d 24 00 00       	call   43a8 <write>
  close(fd);
    1f7b:	89 1c 24             	mov    %ebx,(%esp)
    1f7e:	e8 2d 24 00 00       	call   43b0 <close>

  fd = open("dd/dd/../ff", 0);
    1f83:	58                   	pop    %eax
    1f84:	5a                   	pop    %edx
    1f85:	6a 00                	push   $0x0
    1f87:	68 82 51 00 00       	push   $0x5182
    1f8c:	e8 37 24 00 00       	call   43c8 <open>
  if(fd < 0){
    1f91:	83 c4 10             	add    $0x10,%esp
    1f94:	85 c0                	test   %eax,%eax
    exit(1);
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1f96:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f98:	0f 88 0f 04 00 00    	js     23ad <subdir+0x4fd>
    printf(1, "open dd/dd/../ff failed\n");
    exit(1);
  }
  cc = read(fd, buf, sizeof(buf));
    1f9e:	83 ec 04             	sub    $0x4,%esp
    1fa1:	68 00 20 00 00       	push   $0x2000
    1fa6:	68 e0 a7 00 00       	push   $0xa7e0
    1fab:	50                   	push   %eax
    1fac:	e8 ef 23 00 00       	call   43a0 <read>
  if(cc != 2 || buf[0] != 'f'){
    1fb1:	83 c4 10             	add    $0x10,%esp
    1fb4:	83 f8 02             	cmp    $0x2,%eax
    1fb7:	0f 85 3a 03 00 00    	jne    22f7 <subdir+0x447>
    1fbd:	80 3d e0 a7 00 00 66 	cmpb   $0x66,0xa7e0
    1fc4:	0f 85 2d 03 00 00    	jne    22f7 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit(1);
  }
  close(fd);
    1fca:	83 ec 0c             	sub    $0xc,%esp
    1fcd:	53                   	push   %ebx
    1fce:	e8 dd 23 00 00       	call   43b0 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1fd3:	5b                   	pop    %ebx
    1fd4:	58                   	pop    %eax
    1fd5:	68 c2 51 00 00       	push   $0x51c2
    1fda:	68 5e 51 00 00       	push   $0x515e
    1fdf:	e8 04 24 00 00       	call   43e8 <link>
    1fe4:	83 c4 10             	add    $0x10,%esp
    1fe7:	85 c0                	test   %eax,%eax
    1fe9:	0f 85 0c 04 00 00    	jne    23fb <subdir+0x54b>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit(1);
  }

  if(unlink("dd/dd/ff") != 0){
    1fef:	83 ec 0c             	sub    $0xc,%esp
    1ff2:	68 5e 51 00 00       	push   $0x515e
    1ff7:	e8 dc 23 00 00       	call   43d8 <unlink>
    1ffc:	83 c4 10             	add    $0x10,%esp
    1fff:	85 c0                	test   %eax,%eax
    2001:	0f 85 24 03 00 00    	jne    232b <subdir+0x47b>
    printf(1, "unlink dd/dd/ff failed\n");
    exit(1);
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2007:	83 ec 08             	sub    $0x8,%esp
    200a:	6a 00                	push   $0x0
    200c:	68 5e 51 00 00       	push   $0x515e
    2011:	e8 b2 23 00 00       	call   43c8 <open>
    2016:	83 c4 10             	add    $0x10,%esp
    2019:	85 c0                	test   %eax,%eax
    201b:	0f 89 aa 04 00 00    	jns    24cb <subdir+0x61b>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit(1);
  }

  if(chdir("dd") != 0){
    2021:	83 ec 0c             	sub    $0xc,%esp
    2024:	68 28 52 00 00       	push   $0x5228
    2029:	e8 ca 23 00 00       	call   43f8 <chdir>
    202e:	83 c4 10             	add    $0x10,%esp
    2031:	85 c0                	test   %eax,%eax
    2033:	0f 85 78 04 00 00    	jne    24b1 <subdir+0x601>
    printf(1, "chdir dd failed\n");
    exit(1);
  }
  if(chdir("dd/../../dd") != 0){
    2039:	83 ec 0c             	sub    $0xc,%esp
    203c:	68 f6 51 00 00       	push   $0x51f6
    2041:	e8 b2 23 00 00       	call   43f8 <chdir>
    2046:	83 c4 10             	add    $0x10,%esp
    2049:	85 c0                	test   %eax,%eax
    204b:	0f 85 c0 02 00 00    	jne    2311 <subdir+0x461>
    printf(1, "chdir dd/../../dd failed\n");
    exit(1);
  }
  if(chdir("dd/../../../dd") != 0){
    2051:	83 ec 0c             	sub    $0xc,%esp
    2054:	68 1c 52 00 00       	push   $0x521c
    2059:	e8 9a 23 00 00       	call   43f8 <chdir>
    205e:	83 c4 10             	add    $0x10,%esp
    2061:	85 c0                	test   %eax,%eax
    2063:	0f 85 a8 02 00 00    	jne    2311 <subdir+0x461>
    printf(1, "chdir dd/../../dd failed\n");
    exit(1);
  }
  if(chdir("./..") != 0){
    2069:	83 ec 0c             	sub    $0xc,%esp
    206c:	68 2b 52 00 00       	push   $0x522b
    2071:	e8 82 23 00 00       	call   43f8 <chdir>
    2076:	83 c4 10             	add    $0x10,%esp
    2079:	85 c0                	test   %eax,%eax
    207b:	0f 85 60 03 00 00    	jne    23e1 <subdir+0x531>
    printf(1, "chdir ./.. failed\n");
    exit(1);
  }

  fd = open("dd/dd/ffff", 0);
    2081:	83 ec 08             	sub    $0x8,%esp
    2084:	6a 00                	push   $0x0
    2086:	68 c2 51 00 00       	push   $0x51c2
    208b:	e8 38 23 00 00       	call   43c8 <open>
  if(fd < 0){
    2090:	83 c4 10             	add    $0x10,%esp
    2093:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit(1);
  }

  fd = open("dd/dd/ffff", 0);
    2095:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2097:	0f 88 ce 05 00 00    	js     266b <subdir+0x7bb>
    printf(1, "open dd/dd/ffff failed\n");
    exit(1);
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    209d:	83 ec 04             	sub    $0x4,%esp
    20a0:	68 00 20 00 00       	push   $0x2000
    20a5:	68 e0 a7 00 00       	push   $0xa7e0
    20aa:	50                   	push   %eax
    20ab:	e8 f0 22 00 00       	call   43a0 <read>
    20b0:	83 c4 10             	add    $0x10,%esp
    20b3:	83 f8 02             	cmp    $0x2,%eax
    20b6:	0f 85 95 05 00 00    	jne    2651 <subdir+0x7a1>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit(1);
  }
  close(fd);
    20bc:	83 ec 0c             	sub    $0xc,%esp
    20bf:	53                   	push   %ebx
    20c0:	e8 eb 22 00 00       	call   43b0 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    20c5:	59                   	pop    %ecx
    20c6:	5b                   	pop    %ebx
    20c7:	6a 00                	push   $0x0
    20c9:	68 5e 51 00 00       	push   $0x515e
    20ce:	e8 f5 22 00 00       	call   43c8 <open>
    20d3:	83 c4 10             	add    $0x10,%esp
    20d6:	85 c0                	test   %eax,%eax
    20d8:	0f 89 81 02 00 00    	jns    235f <subdir+0x4af>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit(1);
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    20de:	83 ec 08             	sub    $0x8,%esp
    20e1:	68 02 02 00 00       	push   $0x202
    20e6:	68 76 52 00 00       	push   $0x5276
    20eb:	e8 d8 22 00 00       	call   43c8 <open>
    20f0:	83 c4 10             	add    $0x10,%esp
    20f3:	85 c0                	test   %eax,%eax
    20f5:	0f 89 4a 02 00 00    	jns    2345 <subdir+0x495>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit(1);
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    20fb:	83 ec 08             	sub    $0x8,%esp
    20fe:	68 02 02 00 00       	push   $0x202
    2103:	68 9b 52 00 00       	push   $0x529b
    2108:	e8 bb 22 00 00       	call   43c8 <open>
    210d:	83 c4 10             	add    $0x10,%esp
    2110:	85 c0                	test   %eax,%eax
    2112:	0f 89 7f 03 00 00    	jns    2497 <subdir+0x5e7>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit(1);
  }
  if(open("dd", O_CREATE) >= 0){
    2118:	83 ec 08             	sub    $0x8,%esp
    211b:	68 00 02 00 00       	push   $0x200
    2120:	68 28 52 00 00       	push   $0x5228
    2125:	e8 9e 22 00 00       	call   43c8 <open>
    212a:	83 c4 10             	add    $0x10,%esp
    212d:	85 c0                	test   %eax,%eax
    212f:	0f 89 48 03 00 00    	jns    247d <subdir+0x5cd>
    printf(1, "create dd succeeded!\n");
    exit(1);
  }
  if(open("dd", O_RDWR) >= 0){
    2135:	83 ec 08             	sub    $0x8,%esp
    2138:	6a 02                	push   $0x2
    213a:	68 28 52 00 00       	push   $0x5228
    213f:	e8 84 22 00 00       	call   43c8 <open>
    2144:	83 c4 10             	add    $0x10,%esp
    2147:	85 c0                	test   %eax,%eax
    2149:	0f 89 14 03 00 00    	jns    2463 <subdir+0x5b3>
    printf(1, "open dd rdwr succeeded!\n");
    exit(1);
  }
  if(open("dd", O_WRONLY) >= 0){
    214f:	83 ec 08             	sub    $0x8,%esp
    2152:	6a 01                	push   $0x1
    2154:	68 28 52 00 00       	push   $0x5228
    2159:	e8 6a 22 00 00       	call   43c8 <open>
    215e:	83 c4 10             	add    $0x10,%esp
    2161:	85 c0                	test   %eax,%eax
    2163:	0f 89 e0 02 00 00    	jns    2449 <subdir+0x599>
    printf(1, "open dd wronly succeeded!\n");
    exit(1);
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2169:	83 ec 08             	sub    $0x8,%esp
    216c:	68 0a 53 00 00       	push   $0x530a
    2171:	68 76 52 00 00       	push   $0x5276
    2176:	e8 6d 22 00 00       	call   43e8 <link>
    217b:	83 c4 10             	add    $0x10,%esp
    217e:	85 c0                	test   %eax,%eax
    2180:	0f 84 a9 02 00 00    	je     242f <subdir+0x57f>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit(1);
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2186:	83 ec 08             	sub    $0x8,%esp
    2189:	68 0a 53 00 00       	push   $0x530a
    218e:	68 9b 52 00 00       	push   $0x529b
    2193:	e8 50 22 00 00       	call   43e8 <link>
    2198:	83 c4 10             	add    $0x10,%esp
    219b:	85 c0                	test   %eax,%eax
    219d:	0f 84 72 02 00 00    	je     2415 <subdir+0x565>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit(1);
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    21a3:	83 ec 08             	sub    $0x8,%esp
    21a6:	68 c2 51 00 00       	push   $0x51c2
    21ab:	68 61 51 00 00       	push   $0x5161
    21b0:	e8 33 22 00 00       	call   43e8 <link>
    21b5:	83 c4 10             	add    $0x10,%esp
    21b8:	85 c0                	test   %eax,%eax
    21ba:	0f 84 d3 01 00 00    	je     2393 <subdir+0x4e3>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit(1);
  }
  if(mkdir("dd/ff/ff") == 0){
    21c0:	83 ec 0c             	sub    $0xc,%esp
    21c3:	68 76 52 00 00       	push   $0x5276
    21c8:	e8 23 22 00 00       	call   43f0 <mkdir>
    21cd:	83 c4 10             	add    $0x10,%esp
    21d0:	85 c0                	test   %eax,%eax
    21d2:	0f 84 a1 01 00 00    	je     2379 <subdir+0x4c9>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit(1);
  }
  if(mkdir("dd/xx/ff") == 0){
    21d8:	83 ec 0c             	sub    $0xc,%esp
    21db:	68 9b 52 00 00       	push   $0x529b
    21e0:	e8 0b 22 00 00       	call   43f0 <mkdir>
    21e5:	83 c4 10             	add    $0x10,%esp
    21e8:	85 c0                	test   %eax,%eax
    21ea:	0f 84 47 04 00 00    	je     2637 <subdir+0x787>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit(1);
  }
  if(mkdir("dd/dd/ffff") == 0){
    21f0:	83 ec 0c             	sub    $0xc,%esp
    21f3:	68 c2 51 00 00       	push   $0x51c2
    21f8:	e8 f3 21 00 00       	call   43f0 <mkdir>
    21fd:	83 c4 10             	add    $0x10,%esp
    2200:	85 c0                	test   %eax,%eax
    2202:	0f 84 15 04 00 00    	je     261d <subdir+0x76d>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit(1);
  }
  if(unlink("dd/xx/ff") == 0){
    2208:	83 ec 0c             	sub    $0xc,%esp
    220b:	68 9b 52 00 00       	push   $0x529b
    2210:	e8 c3 21 00 00       	call   43d8 <unlink>
    2215:	83 c4 10             	add    $0x10,%esp
    2218:	85 c0                	test   %eax,%eax
    221a:	0f 84 e3 03 00 00    	je     2603 <subdir+0x753>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit(1);
  }
  if(unlink("dd/ff/ff") == 0){
    2220:	83 ec 0c             	sub    $0xc,%esp
    2223:	68 76 52 00 00       	push   $0x5276
    2228:	e8 ab 21 00 00       	call   43d8 <unlink>
    222d:	83 c4 10             	add    $0x10,%esp
    2230:	85 c0                	test   %eax,%eax
    2232:	0f 84 b1 03 00 00    	je     25e9 <subdir+0x739>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit(1);
  }
  if(chdir("dd/ff") == 0){
    2238:	83 ec 0c             	sub    $0xc,%esp
    223b:	68 61 51 00 00       	push   $0x5161
    2240:	e8 b3 21 00 00       	call   43f8 <chdir>
    2245:	83 c4 10             	add    $0x10,%esp
    2248:	85 c0                	test   %eax,%eax
    224a:	0f 84 7f 03 00 00    	je     25cf <subdir+0x71f>
    printf(1, "chdir dd/ff succeeded!\n");
    exit(1);
  }
  if(chdir("dd/xx") == 0){
    2250:	83 ec 0c             	sub    $0xc,%esp
    2253:	68 0d 53 00 00       	push   $0x530d
    2258:	e8 9b 21 00 00       	call   43f8 <chdir>
    225d:	83 c4 10             	add    $0x10,%esp
    2260:	85 c0                	test   %eax,%eax
    2262:	0f 84 4d 03 00 00    	je     25b5 <subdir+0x705>
    printf(1, "chdir dd/xx succeeded!\n");
    exit(1);
  }

  if(unlink("dd/dd/ffff") != 0){
    2268:	83 ec 0c             	sub    $0xc,%esp
    226b:	68 c2 51 00 00       	push   $0x51c2
    2270:	e8 63 21 00 00       	call   43d8 <unlink>
    2275:	83 c4 10             	add    $0x10,%esp
    2278:	85 c0                	test   %eax,%eax
    227a:	0f 85 ab 00 00 00    	jne    232b <subdir+0x47b>
    printf(1, "unlink dd/dd/ff failed\n");
    exit(1);
  }
  if(unlink("dd/ff") != 0){
    2280:	83 ec 0c             	sub    $0xc,%esp
    2283:	68 61 51 00 00       	push   $0x5161
    2288:	e8 4b 21 00 00       	call   43d8 <unlink>
    228d:	83 c4 10             	add    $0x10,%esp
    2290:	85 c0                	test   %eax,%eax
    2292:	0f 85 03 03 00 00    	jne    259b <subdir+0x6eb>
    printf(1, "unlink dd/ff failed\n");
    exit(1);
  }
  if(unlink("dd") == 0){
    2298:	83 ec 0c             	sub    $0xc,%esp
    229b:	68 28 52 00 00       	push   $0x5228
    22a0:	e8 33 21 00 00       	call   43d8 <unlink>
    22a5:	83 c4 10             	add    $0x10,%esp
    22a8:	85 c0                	test   %eax,%eax
    22aa:	0f 84 d1 02 00 00    	je     2581 <subdir+0x6d1>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit(1);
  }
  if(unlink("dd/dd") < 0){
    22b0:	83 ec 0c             	sub    $0xc,%esp
    22b3:	68 3d 51 00 00       	push   $0x513d
    22b8:	e8 1b 21 00 00       	call   43d8 <unlink>
    22bd:	83 c4 10             	add    $0x10,%esp
    22c0:	85 c0                	test   %eax,%eax
    22c2:	0f 88 9f 02 00 00    	js     2567 <subdir+0x6b7>
    printf(1, "unlink dd/dd failed\n");
    exit(1);
  }
  if(unlink("dd") < 0){
    22c8:	83 ec 0c             	sub    $0xc,%esp
    22cb:	68 28 52 00 00       	push   $0x5228
    22d0:	e8 03 21 00 00       	call   43d8 <unlink>
    22d5:	83 c4 10             	add    $0x10,%esp
    22d8:	85 c0                	test   %eax,%eax
    22da:	0f 88 6d 02 00 00    	js     254d <subdir+0x69d>
    printf(1, "unlink dd failed\n");
    exit(1);
  }

  printf(1, "subdir ok\n");
    22e0:	83 ec 08             	sub    $0x8,%esp
    22e3:	68 0a 54 00 00       	push   $0x540a
    22e8:	6a 01                	push   $0x1
    22ea:	e8 51 22 00 00       	call   4540 <printf>
}
    22ef:	83 c4 10             	add    $0x10,%esp
    22f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    22f5:	c9                   	leave  
    22f6:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit(1);
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    22f7:	50                   	push   %eax
    22f8:	50                   	push   %eax
    22f9:	68 a7 51 00 00       	push   $0x51a7
    22fe:	6a 01                	push   $0x1
    2300:	e8 3b 22 00 00       	call   4540 <printf>
    exit(1);
    2305:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    230c:	e8 77 20 00 00       	call   4388 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit(1);
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    2311:	50                   	push   %eax
    2312:	50                   	push   %eax
    2313:	68 02 52 00 00       	push   $0x5202
    2318:	6a 01                	push   $0x1
    231a:	e8 21 22 00 00       	call   4540 <printf>
    exit(1);
    231f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2326:	e8 5d 20 00 00       	call   4388 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit(1);
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    232b:	52                   	push   %edx
    232c:	52                   	push   %edx
    232d:	68 cd 51 00 00       	push   $0x51cd
    2332:	6a 01                	push   $0x1
    2334:	e8 07 22 00 00       	call   4540 <printf>
    exit(1);
    2339:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2340:	e8 43 20 00 00       	call   4388 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit(1);
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2345:	50                   	push   %eax
    2346:	50                   	push   %eax
    2347:	68 7f 52 00 00       	push   $0x527f
    234c:	6a 01                	push   $0x1
    234e:	e8 ed 21 00 00       	call   4540 <printf>
    exit(1);
    2353:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    235a:	e8 29 20 00 00       	call   4388 <exit>
    exit(1);
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    235f:	52                   	push   %edx
    2360:	52                   	push   %edx
    2361:	68 d8 5d 00 00       	push   $0x5dd8
    2366:	6a 01                	push   $0x1
    2368:	e8 d3 21 00 00       	call   4540 <printf>
    exit(1);
    236d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2374:	e8 0f 20 00 00       	call   4388 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit(1);
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2379:	52                   	push   %edx
    237a:	52                   	push   %edx
    237b:	68 13 53 00 00       	push   $0x5313
    2380:	6a 01                	push   $0x1
    2382:	e8 b9 21 00 00       	call   4540 <printf>
    exit(1);
    2387:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    238e:	e8 f5 1f 00 00       	call   4388 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit(1);
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2393:	51                   	push   %ecx
    2394:	51                   	push   %ecx
    2395:	68 48 5e 00 00       	push   $0x5e48
    239a:	6a 01                	push   $0x1
    239c:	e8 9f 21 00 00       	call   4540 <printf>
    exit(1);
    23a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23a8:	e8 db 1f 00 00       	call   4388 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    23ad:	50                   	push   %eax
    23ae:	50                   	push   %eax
    23af:	68 8e 51 00 00       	push   $0x518e
    23b4:	6a 01                	push   $0x1
    23b6:	e8 85 21 00 00       	call   4540 <printf>
    exit(1);
    23bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23c2:	e8 c1 1f 00 00       	call   4388 <exit>
    exit(1);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    23c7:	51                   	push   %ecx
    23c8:	51                   	push   %ecx
    23c9:	68 67 51 00 00       	push   $0x5167
    23ce:	6a 01                	push   $0x1
    23d0:	e8 6b 21 00 00       	call   4540 <printf>
    exit(1);
    23d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23dc:	e8 a7 1f 00 00       	call   4388 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit(1);
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    23e1:	50                   	push   %eax
    23e2:	50                   	push   %eax
    23e3:	68 30 52 00 00       	push   $0x5230
    23e8:	6a 01                	push   $0x1
    23ea:	e8 51 21 00 00       	call   4540 <printf>
    exit(1);
    23ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23f6:	e8 8d 1f 00 00       	call   4388 <exit>
    exit(1);
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    23fb:	51                   	push   %ecx
    23fc:	51                   	push   %ecx
    23fd:	68 90 5d 00 00       	push   $0x5d90
    2402:	6a 01                	push   $0x1
    2404:	e8 37 21 00 00       	call   4540 <printf>
    exit(1);
    2409:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2410:	e8 73 1f 00 00       	call   4388 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit(1);
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2415:	53                   	push   %ebx
    2416:	53                   	push   %ebx
    2417:	68 24 5e 00 00       	push   $0x5e24
    241c:	6a 01                	push   $0x1
    241e:	e8 1d 21 00 00       	call   4540 <printf>
    exit(1);
    2423:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    242a:	e8 59 1f 00 00       	call   4388 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit(1);
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    242f:	50                   	push   %eax
    2430:	50                   	push   %eax
    2431:	68 00 5e 00 00       	push   $0x5e00
    2436:	6a 01                	push   $0x1
    2438:	e8 03 21 00 00       	call   4540 <printf>
    exit(1);
    243d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2444:	e8 3f 1f 00 00       	call   4388 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit(1);
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    2449:	50                   	push   %eax
    244a:	50                   	push   %eax
    244b:	68 ef 52 00 00       	push   $0x52ef
    2450:	6a 01                	push   $0x1
    2452:	e8 e9 20 00 00       	call   4540 <printf>
    exit(1);
    2457:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    245e:	e8 25 1f 00 00       	call   4388 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit(1);
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2463:	50                   	push   %eax
    2464:	50                   	push   %eax
    2465:	68 d6 52 00 00       	push   $0x52d6
    246a:	6a 01                	push   $0x1
    246c:	e8 cf 20 00 00       	call   4540 <printf>
    exit(1);
    2471:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2478:	e8 0b 1f 00 00       	call   4388 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit(1);
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    247d:	50                   	push   %eax
    247e:	50                   	push   %eax
    247f:	68 c0 52 00 00       	push   $0x52c0
    2484:	6a 01                	push   $0x1
    2486:	e8 b5 20 00 00       	call   4540 <printf>
    exit(1);
    248b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2492:	e8 f1 1e 00 00       	call   4388 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit(1);
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    2497:	50                   	push   %eax
    2498:	50                   	push   %eax
    2499:	68 a4 52 00 00       	push   $0x52a4
    249e:	6a 01                	push   $0x1
    24a0:	e8 9b 20 00 00       	call   4540 <printf>
    exit(1);
    24a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24ac:	e8 d7 1e 00 00       	call   4388 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit(1);
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    24b1:	50                   	push   %eax
    24b2:	50                   	push   %eax
    24b3:	68 e5 51 00 00       	push   $0x51e5
    24b8:	6a 01                	push   $0x1
    24ba:	e8 81 20 00 00       	call   4540 <printf>
    exit(1);
    24bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24c6:	e8 bd 1e 00 00       	call   4388 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit(1);
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    24cb:	50                   	push   %eax
    24cc:	50                   	push   %eax
    24cd:	68 b4 5d 00 00       	push   $0x5db4
    24d2:	6a 01                	push   $0x1
    24d4:	e8 67 20 00 00       	call   4540 <printf>
    exit(1);
    24d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24e0:	e8 a3 1e 00 00       	call   4388 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit(1);
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    24e5:	53                   	push   %ebx
    24e6:	53                   	push   %ebx
    24e7:	68 43 51 00 00       	push   $0x5143
    24ec:	6a 01                	push   $0x1
    24ee:	e8 4d 20 00 00       	call   4540 <printf>
    exit(1);
    24f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24fa:	e8 89 1e 00 00       	call   4388 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    24ff:	50                   	push   %eax
    2500:	50                   	push   %eax
    2501:	68 68 5d 00 00       	push   $0x5d68
    2506:	6a 01                	push   $0x1
    2508:	e8 33 20 00 00       	call   4540 <printf>
    exit(1);
    250d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2514:	e8 6f 1e 00 00       	call   4388 <exit>
    exit(1);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    2519:	50                   	push   %eax
    251a:	50                   	push   %eax
    251b:	68 27 51 00 00       	push   $0x5127
    2520:	6a 01                	push   $0x1
    2522:	e8 19 20 00 00       	call   4540 <printf>
    exit(1);
    2527:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    252e:	e8 55 1e 00 00       	call   4388 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    2533:	50                   	push   %eax
    2534:	50                   	push   %eax
    2535:	68 0f 51 00 00       	push   $0x510f
    253a:	6a 01                	push   $0x1
    253c:	e8 ff 1f 00 00       	call   4540 <printf>
    exit(1);
    2541:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2548:	e8 3b 1e 00 00       	call   4388 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit(1);
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    254d:	50                   	push   %eax
    254e:	50                   	push   %eax
    254f:	68 f8 53 00 00       	push   $0x53f8
    2554:	6a 01                	push   $0x1
    2556:	e8 e5 1f 00 00       	call   4540 <printf>
    exit(1);
    255b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2562:	e8 21 1e 00 00       	call   4388 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit(1);
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    2567:	52                   	push   %edx
    2568:	52                   	push   %edx
    2569:	68 e3 53 00 00       	push   $0x53e3
    256e:	6a 01                	push   $0x1
    2570:	e8 cb 1f 00 00       	call   4540 <printf>
    exit(1);
    2575:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    257c:	e8 07 1e 00 00       	call   4388 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit(1);
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2581:	51                   	push   %ecx
    2582:	51                   	push   %ecx
    2583:	68 6c 5e 00 00       	push   $0x5e6c
    2588:	6a 01                	push   $0x1
    258a:	e8 b1 1f 00 00       	call   4540 <printf>
    exit(1);
    258f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2596:	e8 ed 1d 00 00       	call   4388 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit(1);
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    259b:	53                   	push   %ebx
    259c:	53                   	push   %ebx
    259d:	68 ce 53 00 00       	push   $0x53ce
    25a2:	6a 01                	push   $0x1
    25a4:	e8 97 1f 00 00       	call   4540 <printf>
    exit(1);
    25a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25b0:	e8 d3 1d 00 00       	call   4388 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit(1);
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    25b5:	50                   	push   %eax
    25b6:	50                   	push   %eax
    25b7:	68 b6 53 00 00       	push   $0x53b6
    25bc:	6a 01                	push   $0x1
    25be:	e8 7d 1f 00 00       	call   4540 <printf>
    exit(1);
    25c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25ca:	e8 b9 1d 00 00       	call   4388 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit(1);
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    25cf:	50                   	push   %eax
    25d0:	50                   	push   %eax
    25d1:	68 9e 53 00 00       	push   $0x539e
    25d6:	6a 01                	push   $0x1
    25d8:	e8 63 1f 00 00       	call   4540 <printf>
    exit(1);
    25dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25e4:	e8 9f 1d 00 00       	call   4388 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit(1);
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    25e9:	50                   	push   %eax
    25ea:	50                   	push   %eax
    25eb:	68 82 53 00 00       	push   $0x5382
    25f0:	6a 01                	push   $0x1
    25f2:	e8 49 1f 00 00       	call   4540 <printf>
    exit(1);
    25f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25fe:	e8 85 1d 00 00       	call   4388 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit(1);
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2603:	50                   	push   %eax
    2604:	50                   	push   %eax
    2605:	68 66 53 00 00       	push   $0x5366
    260a:	6a 01                	push   $0x1
    260c:	e8 2f 1f 00 00       	call   4540 <printf>
    exit(1);
    2611:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2618:	e8 6b 1d 00 00       	call   4388 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit(1);
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    261d:	50                   	push   %eax
    261e:	50                   	push   %eax
    261f:	68 49 53 00 00       	push   $0x5349
    2624:	6a 01                	push   $0x1
    2626:	e8 15 1f 00 00       	call   4540 <printf>
    exit(1);
    262b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2632:	e8 51 1d 00 00       	call   4388 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit(1);
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2637:	50                   	push   %eax
    2638:	50                   	push   %eax
    2639:	68 2e 53 00 00       	push   $0x532e
    263e:	6a 01                	push   $0x1
    2640:	e8 fb 1e 00 00       	call   4540 <printf>
    exit(1);
    2645:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    264c:	e8 37 1d 00 00       	call   4388 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit(1);
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    2651:	50                   	push   %eax
    2652:	50                   	push   %eax
    2653:	68 5b 52 00 00       	push   $0x525b
    2658:	6a 01                	push   $0x1
    265a:	e8 e1 1e 00 00       	call   4540 <printf>
    exit(1);
    265f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2666:	e8 1d 1d 00 00       	call   4388 <exit>
    exit(1);
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    266b:	50                   	push   %eax
    266c:	50                   	push   %eax
    266d:	68 43 52 00 00       	push   $0x5243
    2672:	6a 01                	push   $0x1
    2674:	e8 c7 1e 00 00       	call   4540 <printf>
    exit(1);
    2679:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2680:	e8 03 1d 00 00       	call   4388 <exit>
    2685:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002690 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    2690:	55                   	push   %ebp
    2691:	89 e5                	mov    %esp,%ebp
    2693:	56                   	push   %esi
    2694:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2695:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    269a:	83 ec 08             	sub    $0x8,%esp
    269d:	68 15 54 00 00       	push   $0x5415
    26a2:	6a 01                	push   $0x1
    26a4:	e8 97 1e 00 00       	call   4540 <printf>

  unlink("bigwrite");
    26a9:	c7 04 24 24 54 00 00 	movl   $0x5424,(%esp)
    26b0:	e8 23 1d 00 00       	call   43d8 <unlink>
    26b5:	83 c4 10             	add    $0x10,%esp
    26b8:	90                   	nop
    26b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    26c0:	83 ec 08             	sub    $0x8,%esp
    26c3:	68 02 02 00 00       	push   $0x202
    26c8:	68 24 54 00 00       	push   $0x5424
    26cd:	e8 f6 1c 00 00       	call   43c8 <open>
    if(fd < 0){
    26d2:	83 c4 10             	add    $0x10,%esp
    26d5:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    26d7:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    26d9:	0f 88 85 00 00 00    	js     2764 <bigwrite+0xd4>
      printf(1, "cannot create bigwrite\n");
      exit(1);
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    26df:	83 ec 04             	sub    $0x4,%esp
    26e2:	53                   	push   %ebx
    26e3:	68 e0 a7 00 00       	push   $0xa7e0
    26e8:	50                   	push   %eax
    26e9:	e8 ba 1c 00 00       	call   43a8 <write>
      if(cc != sz){
    26ee:	83 c4 10             	add    $0x10,%esp
    26f1:	39 c3                	cmp    %eax,%ebx
    26f3:	75 55                	jne    274a <bigwrite+0xba>
      printf(1, "cannot create bigwrite\n");
      exit(1);
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    26f5:	83 ec 04             	sub    $0x4,%esp
    26f8:	53                   	push   %ebx
    26f9:	68 e0 a7 00 00       	push   $0xa7e0
    26fe:	56                   	push   %esi
    26ff:	e8 a4 1c 00 00       	call   43a8 <write>
      if(cc != sz){
    2704:	83 c4 10             	add    $0x10,%esp
    2707:	39 c3                	cmp    %eax,%ebx
    2709:	75 3f                	jne    274a <bigwrite+0xba>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(1);
      }
    }
    close(fd);
    270b:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    270e:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(1);
      }
    }
    close(fd);
    2714:	56                   	push   %esi
    2715:	e8 96 1c 00 00       	call   43b0 <close>
    unlink("bigwrite");
    271a:	c7 04 24 24 54 00 00 	movl   $0x5424,(%esp)
    2721:	e8 b2 1c 00 00       	call   43d8 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2726:	83 c4 10             	add    $0x10,%esp
    2729:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    272f:	75 8f                	jne    26c0 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2731:	83 ec 08             	sub    $0x8,%esp
    2734:	68 57 54 00 00       	push   $0x5457
    2739:	6a 01                	push   $0x1
    273b:	e8 00 1e 00 00       	call   4540 <printf>
}
    2740:	83 c4 10             	add    $0x10,%esp
    2743:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2746:	5b                   	pop    %ebx
    2747:	5e                   	pop    %esi
    2748:	5d                   	pop    %ebp
    2749:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    274a:	50                   	push   %eax
    274b:	53                   	push   %ebx
    274c:	68 45 54 00 00       	push   $0x5445
    2751:	6a 01                	push   $0x1
    2753:	e8 e8 1d 00 00       	call   4540 <printf>
        exit(1);
    2758:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    275f:	e8 24 1c 00 00       	call   4388 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2764:	83 ec 08             	sub    $0x8,%esp
    2767:	68 2d 54 00 00       	push   $0x542d
    276c:	6a 01                	push   $0x1
    276e:	e8 cd 1d 00 00       	call   4540 <printf>
      exit(1);
    2773:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    277a:	e8 09 1c 00 00       	call   4388 <exit>
    277f:	90                   	nop

00002780 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    2780:	55                   	push   %ebp
    2781:	89 e5                	mov    %esp,%ebp
    2783:	57                   	push   %edi
    2784:	56                   	push   %esi
    2785:	53                   	push   %ebx
    2786:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2789:	68 64 54 00 00       	push   $0x5464
    278e:	6a 01                	push   $0x1
    2790:	e8 ab 1d 00 00       	call   4540 <printf>

  unlink("bigfile");
    2795:	c7 04 24 80 54 00 00 	movl   $0x5480,(%esp)
    279c:	e8 37 1c 00 00       	call   43d8 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    27a1:	5e                   	pop    %esi
    27a2:	5f                   	pop    %edi
    27a3:	68 02 02 00 00       	push   $0x202
    27a8:	68 80 54 00 00       	push   $0x5480
    27ad:	e8 16 1c 00 00       	call   43c8 <open>
  if(fd < 0){
    27b2:	83 c4 10             	add    $0x10,%esp
    27b5:	85 c0                	test   %eax,%eax
    27b7:	0f 88 82 01 00 00    	js     293f <bigfile+0x1bf>
    27bd:	89 c6                	mov    %eax,%esi
    27bf:	31 db                	xor    %ebx,%ebx
    27c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit(1);
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    27c8:	83 ec 04             	sub    $0x4,%esp
    27cb:	68 58 02 00 00       	push   $0x258
    27d0:	53                   	push   %ebx
    27d1:	68 e0 a7 00 00       	push   $0xa7e0
    27d6:	e8 55 18 00 00       	call   4030 <memset>
    if(write(fd, buf, 600) != 600){
    27db:	83 c4 0c             	add    $0xc,%esp
    27de:	68 58 02 00 00       	push   $0x258
    27e3:	68 e0 a7 00 00       	push   $0xa7e0
    27e8:	56                   	push   %esi
    27e9:	e8 ba 1b 00 00       	call   43a8 <write>
    27ee:	83 c4 10             	add    $0x10,%esp
    27f1:	3d 58 02 00 00       	cmp    $0x258,%eax
    27f6:	0f 85 0d 01 00 00    	jne    2909 <bigfile+0x189>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit(1);
  }
  for(i = 0; i < 20; i++){
    27fc:	83 c3 01             	add    $0x1,%ebx
    27ff:	83 fb 14             	cmp    $0x14,%ebx
    2802:	75 c4                	jne    27c8 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit(1);
    }
  }
  close(fd);
    2804:	83 ec 0c             	sub    $0xc,%esp
    2807:	56                   	push   %esi
    2808:	e8 a3 1b 00 00       	call   43b0 <close>

  fd = open("bigfile", 0);
    280d:	59                   	pop    %ecx
    280e:	5b                   	pop    %ebx
    280f:	6a 00                	push   $0x0
    2811:	68 80 54 00 00       	push   $0x5480
    2816:	e8 ad 1b 00 00       	call   43c8 <open>
  if(fd < 0){
    281b:	83 c4 10             	add    $0x10,%esp
    281e:	85 c0                	test   %eax,%eax
      exit(1);
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2820:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2822:	0f 88 fc 00 00 00    	js     2924 <bigfile+0x1a4>
    2828:	31 db                	xor    %ebx,%ebx
    282a:	31 ff                	xor    %edi,%edi
    282c:	eb 30                	jmp    285e <bigfile+0xde>
    282e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit(1);
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2830:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2835:	0f 85 98 00 00 00    	jne    28d3 <bigfile+0x153>
      printf(1, "short read bigfile\n");
      exit(1);
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    283b:	0f be 05 e0 a7 00 00 	movsbl 0xa7e0,%eax
    2842:	89 fa                	mov    %edi,%edx
    2844:	d1 fa                	sar    %edx
    2846:	39 d0                	cmp    %edx,%eax
    2848:	75 6e                	jne    28b8 <bigfile+0x138>
    284a:	0f be 15 0b a9 00 00 	movsbl 0xa90b,%edx
    2851:	39 d0                	cmp    %edx,%eax
    2853:	75 63                	jne    28b8 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit(1);
    }
    total += cc;
    2855:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit(1);
  }
  total = 0;
  for(i = 0; ; i++){
    285b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    285e:	83 ec 04             	sub    $0x4,%esp
    2861:	68 2c 01 00 00       	push   $0x12c
    2866:	68 e0 a7 00 00       	push   $0xa7e0
    286b:	56                   	push   %esi
    286c:	e8 2f 1b 00 00       	call   43a0 <read>
    if(cc < 0){
    2871:	83 c4 10             	add    $0x10,%esp
    2874:	85 c0                	test   %eax,%eax
    2876:	78 76                	js     28ee <bigfile+0x16e>
      printf(1, "read bigfile failed\n");
      exit(1);
    }
    if(cc == 0)
    2878:	75 b6                	jne    2830 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit(1);
    }
    total += cc;
  }
  close(fd);
    287a:	83 ec 0c             	sub    $0xc,%esp
    287d:	56                   	push   %esi
    287e:	e8 2d 1b 00 00       	call   43b0 <close>
  if(total != 20*600){
    2883:	83 c4 10             	add    $0x10,%esp
    2886:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    288c:	0f 85 c8 00 00 00    	jne    295a <bigfile+0x1da>
    printf(1, "read bigfile wrong total\n");
    exit(1);
  }
  unlink("bigfile");
    2892:	83 ec 0c             	sub    $0xc,%esp
    2895:	68 80 54 00 00       	push   $0x5480
    289a:	e8 39 1b 00 00       	call   43d8 <unlink>

  printf(1, "bigfile test ok\n");
    289f:	58                   	pop    %eax
    28a0:	5a                   	pop    %edx
    28a1:	68 0f 55 00 00       	push   $0x550f
    28a6:	6a 01                	push   $0x1
    28a8:	e8 93 1c 00 00       	call   4540 <printf>
}
    28ad:	83 c4 10             	add    $0x10,%esp
    28b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    28b3:	5b                   	pop    %ebx
    28b4:	5e                   	pop    %esi
    28b5:	5f                   	pop    %edi
    28b6:	5d                   	pop    %ebp
    28b7:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit(1);
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    28b8:	83 ec 08             	sub    $0x8,%esp
    28bb:	68 dc 54 00 00       	push   $0x54dc
    28c0:	6a 01                	push   $0x1
    28c2:	e8 79 1c 00 00       	call   4540 <printf>
      exit(1);
    28c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28ce:	e8 b5 1a 00 00       	call   4388 <exit>
      exit(1);
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    28d3:	83 ec 08             	sub    $0x8,%esp
    28d6:	68 c8 54 00 00       	push   $0x54c8
    28db:	6a 01                	push   $0x1
    28dd:	e8 5e 1c 00 00       	call   4540 <printf>
      exit(1);
    28e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28e9:	e8 9a 1a 00 00       	call   4388 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    28ee:	83 ec 08             	sub    $0x8,%esp
    28f1:	68 b3 54 00 00       	push   $0x54b3
    28f6:	6a 01                	push   $0x1
    28f8:	e8 43 1c 00 00       	call   4540 <printf>
      exit(1);
    28fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2904:	e8 7f 1a 00 00       	call   4388 <exit>
    exit(1);
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2909:	83 ec 08             	sub    $0x8,%esp
    290c:	68 88 54 00 00       	push   $0x5488
    2911:	6a 01                	push   $0x1
    2913:	e8 28 1c 00 00       	call   4540 <printf>
      exit(1);
    2918:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    291f:	e8 64 1a 00 00       	call   4388 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2924:	83 ec 08             	sub    $0x8,%esp
    2927:	68 9e 54 00 00       	push   $0x549e
    292c:	6a 01                	push   $0x1
    292e:	e8 0d 1c 00 00       	call   4540 <printf>
    exit(1);
    2933:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    293a:	e8 49 1a 00 00       	call   4388 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    293f:	83 ec 08             	sub    $0x8,%esp
    2942:	68 72 54 00 00       	push   $0x5472
    2947:	6a 01                	push   $0x1
    2949:	e8 f2 1b 00 00       	call   4540 <printf>
    exit(1);
    294e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2955:	e8 2e 1a 00 00       	call   4388 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    295a:	83 ec 08             	sub    $0x8,%esp
    295d:	68 f5 54 00 00       	push   $0x54f5
    2962:	6a 01                	push   $0x1
    2964:	e8 d7 1b 00 00       	call   4540 <printf>
    exit(1);
    2969:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2970:	e8 13 1a 00 00       	call   4388 <exit>
    2975:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002980 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2980:	55                   	push   %ebp
    2981:	89 e5                	mov    %esp,%ebp
    2983:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2986:	68 20 55 00 00       	push   $0x5520
    298b:	6a 01                	push   $0x1
    298d:	e8 ae 1b 00 00       	call   4540 <printf>

  if(mkdir("12345678901234") != 0){
    2992:	c7 04 24 5b 55 00 00 	movl   $0x555b,(%esp)
    2999:	e8 52 1a 00 00       	call   43f0 <mkdir>
    299e:	83 c4 10             	add    $0x10,%esp
    29a1:	85 c0                	test   %eax,%eax
    29a3:	0f 85 9b 00 00 00    	jne    2a44 <fourteen+0xc4>
    printf(1, "mkdir 12345678901234 failed\n");
    exit(1);
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    29a9:	83 ec 0c             	sub    $0xc,%esp
    29ac:	68 8c 5e 00 00       	push   $0x5e8c
    29b1:	e8 3a 1a 00 00       	call   43f0 <mkdir>
    29b6:	83 c4 10             	add    $0x10,%esp
    29b9:	85 c0                	test   %eax,%eax
    29bb:	0f 85 05 01 00 00    	jne    2ac6 <fourteen+0x146>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit(1);
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    29c1:	83 ec 08             	sub    $0x8,%esp
    29c4:	68 00 02 00 00       	push   $0x200
    29c9:	68 dc 5e 00 00       	push   $0x5edc
    29ce:	e8 f5 19 00 00       	call   43c8 <open>
  if(fd < 0){
    29d3:	83 c4 10             	add    $0x10,%esp
    29d6:	85 c0                	test   %eax,%eax
    29d8:	0f 88 ce 00 00 00    	js     2aac <fourteen+0x12c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit(1);
  }
  close(fd);
    29de:	83 ec 0c             	sub    $0xc,%esp
    29e1:	50                   	push   %eax
    29e2:	e8 c9 19 00 00       	call   43b0 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    29e7:	58                   	pop    %eax
    29e8:	5a                   	pop    %edx
    29e9:	6a 00                	push   $0x0
    29eb:	68 4c 5f 00 00       	push   $0x5f4c
    29f0:	e8 d3 19 00 00       	call   43c8 <open>
  if(fd < 0){
    29f5:	83 c4 10             	add    $0x10,%esp
    29f8:	85 c0                	test   %eax,%eax
    29fa:	0f 88 92 00 00 00    	js     2a92 <fourteen+0x112>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit(1);
  }
  close(fd);
    2a00:	83 ec 0c             	sub    $0xc,%esp
    2a03:	50                   	push   %eax
    2a04:	e8 a7 19 00 00       	call   43b0 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2a09:	c7 04 24 4c 55 00 00 	movl   $0x554c,(%esp)
    2a10:	e8 db 19 00 00       	call   43f0 <mkdir>
    2a15:	83 c4 10             	add    $0x10,%esp
    2a18:	85 c0                	test   %eax,%eax
    2a1a:	74 5c                	je     2a78 <fourteen+0xf8>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit(1);
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2a1c:	83 ec 0c             	sub    $0xc,%esp
    2a1f:	68 e8 5f 00 00       	push   $0x5fe8
    2a24:	e8 c7 19 00 00       	call   43f0 <mkdir>
    2a29:	83 c4 10             	add    $0x10,%esp
    2a2c:	85 c0                	test   %eax,%eax
    2a2e:	74 2e                	je     2a5e <fourteen+0xde>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit(1);
  }

  printf(1, "fourteen ok\n");
    2a30:	83 ec 08             	sub    $0x8,%esp
    2a33:	68 6a 55 00 00       	push   $0x556a
    2a38:	6a 01                	push   $0x1
    2a3a:	e8 01 1b 00 00       	call   4540 <printf>
}
    2a3f:	83 c4 10             	add    $0x10,%esp
    2a42:	c9                   	leave  
    2a43:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2a44:	50                   	push   %eax
    2a45:	50                   	push   %eax
    2a46:	68 2f 55 00 00       	push   $0x552f
    2a4b:	6a 01                	push   $0x1
    2a4d:	e8 ee 1a 00 00       	call   4540 <printf>
    exit(1);
    2a52:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a59:	e8 2a 19 00 00       	call   4388 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit(1);
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2a5e:	50                   	push   %eax
    2a5f:	50                   	push   %eax
    2a60:	68 08 60 00 00       	push   $0x6008
    2a65:	6a 01                	push   $0x1
    2a67:	e8 d4 1a 00 00       	call   4540 <printf>
    exit(1);
    2a6c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a73:	e8 10 19 00 00       	call   4388 <exit>
    exit(1);
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2a78:	52                   	push   %edx
    2a79:	52                   	push   %edx
    2a7a:	68 b8 5f 00 00       	push   $0x5fb8
    2a7f:	6a 01                	push   $0x1
    2a81:	e8 ba 1a 00 00       	call   4540 <printf>
    exit(1);
    2a86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a8d:	e8 f6 18 00 00       	call   4388 <exit>
    exit(1);
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2a92:	51                   	push   %ecx
    2a93:	51                   	push   %ecx
    2a94:	68 7c 5f 00 00       	push   $0x5f7c
    2a99:	6a 01                	push   $0x1
    2a9b:	e8 a0 1a 00 00       	call   4540 <printf>
    exit(1);
    2aa0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aa7:	e8 dc 18 00 00       	call   4388 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit(1);
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2aac:	51                   	push   %ecx
    2aad:	51                   	push   %ecx
    2aae:	68 0c 5f 00 00       	push   $0x5f0c
    2ab3:	6a 01                	push   $0x1
    2ab5:	e8 86 1a 00 00       	call   4540 <printf>
    exit(1);
    2aba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ac1:	e8 c2 18 00 00       	call   4388 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit(1);
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2ac6:	50                   	push   %eax
    2ac7:	50                   	push   %eax
    2ac8:	68 ac 5e 00 00       	push   $0x5eac
    2acd:	6a 01                	push   $0x1
    2acf:	e8 6c 1a 00 00       	call   4540 <printf>
    exit(1);
    2ad4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2adb:	e8 a8 18 00 00       	call   4388 <exit>

00002ae0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2ae0:	55                   	push   %ebp
    2ae1:	89 e5                	mov    %esp,%ebp
    2ae3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2ae6:	68 77 55 00 00       	push   $0x5577
    2aeb:	6a 01                	push   $0x1
    2aed:	e8 4e 1a 00 00       	call   4540 <printf>
  if(mkdir("dots") != 0){
    2af2:	c7 04 24 83 55 00 00 	movl   $0x5583,(%esp)
    2af9:	e8 f2 18 00 00       	call   43f0 <mkdir>
    2afe:	83 c4 10             	add    $0x10,%esp
    2b01:	85 c0                	test   %eax,%eax
    2b03:	0f 85 b4 00 00 00    	jne    2bbd <rmdot+0xdd>
    printf(1, "mkdir dots failed\n");
    exit(1);
  }
  if(chdir("dots") != 0){
    2b09:	83 ec 0c             	sub    $0xc,%esp
    2b0c:	68 83 55 00 00       	push   $0x5583
    2b11:	e8 e2 18 00 00       	call   43f8 <chdir>
    2b16:	83 c4 10             	add    $0x10,%esp
    2b19:	85 c0                	test   %eax,%eax
    2b1b:	0f 85 52 01 00 00    	jne    2c73 <rmdot+0x193>
    printf(1, "chdir dots failed\n");
    exit(1);
  }
  if(unlink(".") == 0){
    2b21:	83 ec 0c             	sub    $0xc,%esp
    2b24:	68 2e 52 00 00       	push   $0x522e
    2b29:	e8 aa 18 00 00       	call   43d8 <unlink>
    2b2e:	83 c4 10             	add    $0x10,%esp
    2b31:	85 c0                	test   %eax,%eax
    2b33:	0f 84 20 01 00 00    	je     2c59 <rmdot+0x179>
    printf(1, "rm . worked!\n");
    exit(1);
  }
  if(unlink("..") == 0){
    2b39:	83 ec 0c             	sub    $0xc,%esp
    2b3c:	68 2d 52 00 00       	push   $0x522d
    2b41:	e8 92 18 00 00       	call   43d8 <unlink>
    2b46:	83 c4 10             	add    $0x10,%esp
    2b49:	85 c0                	test   %eax,%eax
    2b4b:	0f 84 ee 00 00 00    	je     2c3f <rmdot+0x15f>
    printf(1, "rm .. worked!\n");
    exit(1);
  }
  if(chdir("/") != 0){
    2b51:	83 ec 0c             	sub    $0xc,%esp
    2b54:	68 01 4a 00 00       	push   $0x4a01
    2b59:	e8 9a 18 00 00       	call   43f8 <chdir>
    2b5e:	83 c4 10             	add    $0x10,%esp
    2b61:	85 c0                	test   %eax,%eax
    2b63:	0f 85 bc 00 00 00    	jne    2c25 <rmdot+0x145>
    printf(1, "chdir / failed\n");
    exit(1);
  }
  if(unlink("dots/.") == 0){
    2b69:	83 ec 0c             	sub    $0xc,%esp
    2b6c:	68 cb 55 00 00       	push   $0x55cb
    2b71:	e8 62 18 00 00       	call   43d8 <unlink>
    2b76:	83 c4 10             	add    $0x10,%esp
    2b79:	85 c0                	test   %eax,%eax
    2b7b:	0f 84 8a 00 00 00    	je     2c0b <rmdot+0x12b>
    printf(1, "unlink dots/. worked!\n");
    exit(1);
  }
  if(unlink("dots/..") == 0){
    2b81:	83 ec 0c             	sub    $0xc,%esp
    2b84:	68 e9 55 00 00       	push   $0x55e9
    2b89:	e8 4a 18 00 00       	call   43d8 <unlink>
    2b8e:	83 c4 10             	add    $0x10,%esp
    2b91:	85 c0                	test   %eax,%eax
    2b93:	74 5c                	je     2bf1 <rmdot+0x111>
    printf(1, "unlink dots/.. worked!\n");
    exit(1);
  }
  if(unlink("dots") != 0){
    2b95:	83 ec 0c             	sub    $0xc,%esp
    2b98:	68 83 55 00 00       	push   $0x5583
    2b9d:	e8 36 18 00 00       	call   43d8 <unlink>
    2ba2:	83 c4 10             	add    $0x10,%esp
    2ba5:	85 c0                	test   %eax,%eax
    2ba7:	75 2e                	jne    2bd7 <rmdot+0xf7>
    printf(1, "unlink dots failed!\n");
    exit(1);
  }
  printf(1, "rmdot ok\n");
    2ba9:	83 ec 08             	sub    $0x8,%esp
    2bac:	68 1e 56 00 00       	push   $0x561e
    2bb1:	6a 01                	push   $0x1
    2bb3:	e8 88 19 00 00       	call   4540 <printf>
}
    2bb8:	83 c4 10             	add    $0x10,%esp
    2bbb:	c9                   	leave  
    2bbc:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2bbd:	50                   	push   %eax
    2bbe:	50                   	push   %eax
    2bbf:	68 88 55 00 00       	push   $0x5588
    2bc4:	6a 01                	push   $0x1
    2bc6:	e8 75 19 00 00       	call   4540 <printf>
    exit(1);
    2bcb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bd2:	e8 b1 17 00 00       	call   4388 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit(1);
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    2bd7:	50                   	push   %eax
    2bd8:	50                   	push   %eax
    2bd9:	68 09 56 00 00       	push   $0x5609
    2bde:	6a 01                	push   $0x1
    2be0:	e8 5b 19 00 00       	call   4540 <printf>
    exit(1);
    2be5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bec:	e8 97 17 00 00       	call   4388 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit(1);
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    2bf1:	52                   	push   %edx
    2bf2:	52                   	push   %edx
    2bf3:	68 f1 55 00 00       	push   $0x55f1
    2bf8:	6a 01                	push   $0x1
    2bfa:	e8 41 19 00 00       	call   4540 <printf>
    exit(1);
    2bff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c06:	e8 7d 17 00 00       	call   4388 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit(1);
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    2c0b:	51                   	push   %ecx
    2c0c:	51                   	push   %ecx
    2c0d:	68 d2 55 00 00       	push   $0x55d2
    2c12:	6a 01                	push   $0x1
    2c14:	e8 27 19 00 00       	call   4540 <printf>
    exit(1);
    2c19:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c20:	e8 63 17 00 00       	call   4388 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit(1);
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2c25:	50                   	push   %eax
    2c26:	50                   	push   %eax
    2c27:	68 03 4a 00 00       	push   $0x4a03
    2c2c:	6a 01                	push   $0x1
    2c2e:	e8 0d 19 00 00       	call   4540 <printf>
    exit(1);
    2c33:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c3a:	e8 49 17 00 00       	call   4388 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit(1);
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2c3f:	50                   	push   %eax
    2c40:	50                   	push   %eax
    2c41:	68 bc 55 00 00       	push   $0x55bc
    2c46:	6a 01                	push   $0x1
    2c48:	e8 f3 18 00 00       	call   4540 <printf>
    exit(1);
    2c4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c54:	e8 2f 17 00 00       	call   4388 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit(1);
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    2c59:	50                   	push   %eax
    2c5a:	50                   	push   %eax
    2c5b:	68 ae 55 00 00       	push   $0x55ae
    2c60:	6a 01                	push   $0x1
    2c62:	e8 d9 18 00 00       	call   4540 <printf>
    exit(1);
    2c67:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c6e:	e8 15 17 00 00       	call   4388 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit(1);
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    2c73:	50                   	push   %eax
    2c74:	50                   	push   %eax
    2c75:	68 9b 55 00 00       	push   $0x559b
    2c7a:	6a 01                	push   $0x1
    2c7c:	e8 bf 18 00 00       	call   4540 <printf>
    exit(1);
    2c81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c88:	e8 fb 16 00 00       	call   4388 <exit>
    2c8d:	8d 76 00             	lea    0x0(%esi),%esi

00002c90 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2c90:	55                   	push   %ebp
    2c91:	89 e5                	mov    %esp,%ebp
    2c93:	53                   	push   %ebx
    2c94:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2c97:	68 28 56 00 00       	push   $0x5628
    2c9c:	6a 01                	push   $0x1
    2c9e:	e8 9d 18 00 00       	call   4540 <printf>

  fd = open("dirfile", O_CREATE);
    2ca3:	59                   	pop    %ecx
    2ca4:	5b                   	pop    %ebx
    2ca5:	68 00 02 00 00       	push   $0x200
    2caa:	68 35 56 00 00       	push   $0x5635
    2caf:	e8 14 17 00 00       	call   43c8 <open>
  if(fd < 0){
    2cb4:	83 c4 10             	add    $0x10,%esp
    2cb7:	85 c0                	test   %eax,%eax
    2cb9:	0f 88 51 01 00 00    	js     2e10 <dirfile+0x180>
    printf(1, "create dirfile failed\n");
    exit(1);
  }
  close(fd);
    2cbf:	83 ec 0c             	sub    $0xc,%esp
    2cc2:	50                   	push   %eax
    2cc3:	e8 e8 16 00 00       	call   43b0 <close>
  if(chdir("dirfile") == 0){
    2cc8:	c7 04 24 35 56 00 00 	movl   $0x5635,(%esp)
    2ccf:	e8 24 17 00 00       	call   43f8 <chdir>
    2cd4:	83 c4 10             	add    $0x10,%esp
    2cd7:	85 c0                	test   %eax,%eax
    2cd9:	0f 84 17 01 00 00    	je     2df6 <dirfile+0x166>
    printf(1, "chdir dirfile succeeded!\n");
    exit(1);
  }
  fd = open("dirfile/xx", 0);
    2cdf:	83 ec 08             	sub    $0x8,%esp
    2ce2:	6a 00                	push   $0x0
    2ce4:	68 6e 56 00 00       	push   $0x566e
    2ce9:	e8 da 16 00 00       	call   43c8 <open>
  if(fd >= 0){
    2cee:	83 c4 10             	add    $0x10,%esp
    2cf1:	85 c0                	test   %eax,%eax
    2cf3:	0f 89 e3 00 00 00    	jns    2ddc <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit(1);
  }
  fd = open("dirfile/xx", O_CREATE);
    2cf9:	83 ec 08             	sub    $0x8,%esp
    2cfc:	68 00 02 00 00       	push   $0x200
    2d01:	68 6e 56 00 00       	push   $0x566e
    2d06:	e8 bd 16 00 00       	call   43c8 <open>
  if(fd >= 0){
    2d0b:	83 c4 10             	add    $0x10,%esp
    2d0e:	85 c0                	test   %eax,%eax
    2d10:	0f 89 c6 00 00 00    	jns    2ddc <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit(1);
  }
  if(mkdir("dirfile/xx") == 0){
    2d16:	83 ec 0c             	sub    $0xc,%esp
    2d19:	68 6e 56 00 00       	push   $0x566e
    2d1e:	e8 cd 16 00 00       	call   43f0 <mkdir>
    2d23:	83 c4 10             	add    $0x10,%esp
    2d26:	85 c0                	test   %eax,%eax
    2d28:	0f 84 7e 01 00 00    	je     2eac <dirfile+0x21c>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit(1);
  }
  if(unlink("dirfile/xx") == 0){
    2d2e:	83 ec 0c             	sub    $0xc,%esp
    2d31:	68 6e 56 00 00       	push   $0x566e
    2d36:	e8 9d 16 00 00       	call   43d8 <unlink>
    2d3b:	83 c4 10             	add    $0x10,%esp
    2d3e:	85 c0                	test   %eax,%eax
    2d40:	0f 84 4c 01 00 00    	je     2e92 <dirfile+0x202>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit(1);
  }
  if(link("README", "dirfile/xx") == 0){
    2d46:	83 ec 08             	sub    $0x8,%esp
    2d49:	68 6e 56 00 00       	push   $0x566e
    2d4e:	68 d2 56 00 00       	push   $0x56d2
    2d53:	e8 90 16 00 00       	call   43e8 <link>
    2d58:	83 c4 10             	add    $0x10,%esp
    2d5b:	85 c0                	test   %eax,%eax
    2d5d:	0f 84 15 01 00 00    	je     2e78 <dirfile+0x1e8>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit(1);
  }
  if(unlink("dirfile") != 0){
    2d63:	83 ec 0c             	sub    $0xc,%esp
    2d66:	68 35 56 00 00       	push   $0x5635
    2d6b:	e8 68 16 00 00       	call   43d8 <unlink>
    2d70:	83 c4 10             	add    $0x10,%esp
    2d73:	85 c0                	test   %eax,%eax
    2d75:	0f 85 e3 00 00 00    	jne    2e5e <dirfile+0x1ce>
    printf(1, "unlink dirfile failed!\n");
    exit(1);
  }

  fd = open(".", O_RDWR);
    2d7b:	83 ec 08             	sub    $0x8,%esp
    2d7e:	6a 02                	push   $0x2
    2d80:	68 2e 52 00 00       	push   $0x522e
    2d85:	e8 3e 16 00 00       	call   43c8 <open>
  if(fd >= 0){
    2d8a:	83 c4 10             	add    $0x10,%esp
    2d8d:	85 c0                	test   %eax,%eax
    2d8f:	0f 89 af 00 00 00    	jns    2e44 <dirfile+0x1b4>
    printf(1, "open . for writing succeeded!\n");
    exit(1);
  }
  fd = open(".", 0);
    2d95:	83 ec 08             	sub    $0x8,%esp
    2d98:	6a 00                	push   $0x0
    2d9a:	68 2e 52 00 00       	push   $0x522e
    2d9f:	e8 24 16 00 00       	call   43c8 <open>
  if(write(fd, "x", 1) > 0){
    2da4:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit(1);
  }
  fd = open(".", 0);
    2da7:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2da9:	6a 01                	push   $0x1
    2dab:	68 11 53 00 00       	push   $0x5311
    2db0:	50                   	push   %eax
    2db1:	e8 f2 15 00 00       	call   43a8 <write>
    2db6:	83 c4 10             	add    $0x10,%esp
    2db9:	85 c0                	test   %eax,%eax
    2dbb:	7f 6d                	jg     2e2a <dirfile+0x19a>
    printf(1, "write . succeeded!\n");
    exit(1);
  }
  close(fd);
    2dbd:	83 ec 0c             	sub    $0xc,%esp
    2dc0:	53                   	push   %ebx
    2dc1:	e8 ea 15 00 00       	call   43b0 <close>

  printf(1, "dir vs file OK\n");
    2dc6:	58                   	pop    %eax
    2dc7:	5a                   	pop    %edx
    2dc8:	68 05 57 00 00       	push   $0x5705
    2dcd:	6a 01                	push   $0x1
    2dcf:	e8 6c 17 00 00       	call   4540 <printf>
}
    2dd4:	83 c4 10             	add    $0x10,%esp
    2dd7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2dda:	c9                   	leave  
    2ddb:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit(1);
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2ddc:	50                   	push   %eax
    2ddd:	50                   	push   %eax
    2dde:	68 79 56 00 00       	push   $0x5679
    2de3:	6a 01                	push   $0x1
    2de5:	e8 56 17 00 00       	call   4540 <printf>
    exit(1);
    2dea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2df1:	e8 92 15 00 00       	call   4388 <exit>
    printf(1, "create dirfile failed\n");
    exit(1);
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2df6:	50                   	push   %eax
    2df7:	50                   	push   %eax
    2df8:	68 54 56 00 00       	push   $0x5654
    2dfd:	6a 01                	push   $0x1
    2dff:	e8 3c 17 00 00       	call   4540 <printf>
    exit(1);
    2e04:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e0b:	e8 78 15 00 00       	call   4388 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2e10:	52                   	push   %edx
    2e11:	52                   	push   %edx
    2e12:	68 3d 56 00 00       	push   $0x563d
    2e17:	6a 01                	push   $0x1
    2e19:	e8 22 17 00 00       	call   4540 <printf>
    exit(1);
    2e1e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e25:	e8 5e 15 00 00       	call   4388 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit(1);
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2e2a:	51                   	push   %ecx
    2e2b:	51                   	push   %ecx
    2e2c:	68 f1 56 00 00       	push   $0x56f1
    2e31:	6a 01                	push   $0x1
    2e33:	e8 08 17 00 00       	call   4540 <printf>
    exit(1);
    2e38:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e3f:	e8 44 15 00 00       	call   4388 <exit>
    exit(1);
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2e44:	53                   	push   %ebx
    2e45:	53                   	push   %ebx
    2e46:	68 5c 60 00 00       	push   $0x605c
    2e4b:	6a 01                	push   $0x1
    2e4d:	e8 ee 16 00 00       	call   4540 <printf>
    exit(1);
    2e52:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e59:	e8 2a 15 00 00       	call   4388 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit(1);
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2e5e:	50                   	push   %eax
    2e5f:	50                   	push   %eax
    2e60:	68 d9 56 00 00       	push   $0x56d9
    2e65:	6a 01                	push   $0x1
    2e67:	e8 d4 16 00 00       	call   4540 <printf>
    exit(1);
    2e6c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e73:	e8 10 15 00 00       	call   4388 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit(1);
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2e78:	50                   	push   %eax
    2e79:	50                   	push   %eax
    2e7a:	68 3c 60 00 00       	push   $0x603c
    2e7f:	6a 01                	push   $0x1
    2e81:	e8 ba 16 00 00       	call   4540 <printf>
    exit(1);
    2e86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e8d:	e8 f6 14 00 00       	call   4388 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit(1);
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2e92:	50                   	push   %eax
    2e93:	50                   	push   %eax
    2e94:	68 b4 56 00 00       	push   $0x56b4
    2e99:	6a 01                	push   $0x1
    2e9b:	e8 a0 16 00 00       	call   4540 <printf>
    exit(1);
    2ea0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ea7:	e8 dc 14 00 00       	call   4388 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit(1);
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2eac:	50                   	push   %eax
    2ead:	50                   	push   %eax
    2eae:	68 97 56 00 00       	push   $0x5697
    2eb3:	6a 01                	push   $0x1
    2eb5:	e8 86 16 00 00       	call   4540 <printf>
    exit(1);
    2eba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ec1:	e8 c2 14 00 00       	call   4388 <exit>
    2ec6:	8d 76 00             	lea    0x0(%esi),%esi
    2ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002ed0 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2ed0:	55                   	push   %ebp
    2ed1:	89 e5                	mov    %esp,%ebp
    2ed3:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2ed4:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2ed9:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2edc:	68 15 57 00 00       	push   $0x5715
    2ee1:	6a 01                	push   $0x1
    2ee3:	e8 58 16 00 00       	call   4540 <printf>
    2ee8:	83 c4 10             	add    $0x10,%esp
    2eeb:	90                   	nop
    2eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2ef0:	83 ec 0c             	sub    $0xc,%esp
    2ef3:	68 26 57 00 00       	push   $0x5726
    2ef8:	e8 f3 14 00 00       	call   43f0 <mkdir>
    2efd:	83 c4 10             	add    $0x10,%esp
    2f00:	85 c0                	test   %eax,%eax
    2f02:	0f 85 bb 00 00 00    	jne    2fc3 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit(1);
    }
    if(chdir("irefd") != 0){
    2f08:	83 ec 0c             	sub    $0xc,%esp
    2f0b:	68 26 57 00 00       	push   $0x5726
    2f10:	e8 e3 14 00 00       	call   43f8 <chdir>
    2f15:	83 c4 10             	add    $0x10,%esp
    2f18:	85 c0                	test   %eax,%eax
    2f1a:	0f 85 be 00 00 00    	jne    2fde <iref+0x10e>
      printf(1, "chdir irefd failed\n");
      exit(1);
    }

    mkdir("");
    2f20:	83 ec 0c             	sub    $0xc,%esp
    2f23:	68 db 4d 00 00       	push   $0x4ddb
    2f28:	e8 c3 14 00 00       	call   43f0 <mkdir>
    link("README", "");
    2f2d:	59                   	pop    %ecx
    2f2e:	58                   	pop    %eax
    2f2f:	68 db 4d 00 00       	push   $0x4ddb
    2f34:	68 d2 56 00 00       	push   $0x56d2
    2f39:	e8 aa 14 00 00       	call   43e8 <link>
    fd = open("", O_CREATE);
    2f3e:	58                   	pop    %eax
    2f3f:	5a                   	pop    %edx
    2f40:	68 00 02 00 00       	push   $0x200
    2f45:	68 db 4d 00 00       	push   $0x4ddb
    2f4a:	e8 79 14 00 00       	call   43c8 <open>
    if(fd >= 0)
    2f4f:	83 c4 10             	add    $0x10,%esp
    2f52:	85 c0                	test   %eax,%eax
    2f54:	78 0c                	js     2f62 <iref+0x92>
      close(fd);
    2f56:	83 ec 0c             	sub    $0xc,%esp
    2f59:	50                   	push   %eax
    2f5a:	e8 51 14 00 00       	call   43b0 <close>
    2f5f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2f62:	83 ec 08             	sub    $0x8,%esp
    2f65:	68 00 02 00 00       	push   $0x200
    2f6a:	68 10 53 00 00       	push   $0x5310
    2f6f:	e8 54 14 00 00       	call   43c8 <open>
    if(fd >= 0)
    2f74:	83 c4 10             	add    $0x10,%esp
    2f77:	85 c0                	test   %eax,%eax
    2f79:	78 0c                	js     2f87 <iref+0xb7>
      close(fd);
    2f7b:	83 ec 0c             	sub    $0xc,%esp
    2f7e:	50                   	push   %eax
    2f7f:	e8 2c 14 00 00       	call   43b0 <close>
    2f84:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2f87:	83 ec 0c             	sub    $0xc,%esp
    2f8a:	68 10 53 00 00       	push   $0x5310
    2f8f:	e8 44 14 00 00       	call   43d8 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2f94:	83 c4 10             	add    $0x10,%esp
    2f97:	83 eb 01             	sub    $0x1,%ebx
    2f9a:	0f 85 50 ff ff ff    	jne    2ef0 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2fa0:	83 ec 0c             	sub    $0xc,%esp
    2fa3:	68 01 4a 00 00       	push   $0x4a01
    2fa8:	e8 4b 14 00 00       	call   43f8 <chdir>
  printf(1, "empty file name OK\n");
    2fad:	58                   	pop    %eax
    2fae:	5a                   	pop    %edx
    2faf:	68 54 57 00 00       	push   $0x5754
    2fb4:	6a 01                	push   $0x1
    2fb6:	e8 85 15 00 00       	call   4540 <printf>
}
    2fbb:	83 c4 10             	add    $0x10,%esp
    2fbe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2fc1:	c9                   	leave  
    2fc2:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2fc3:	83 ec 08             	sub    $0x8,%esp
    2fc6:	68 2c 57 00 00       	push   $0x572c
    2fcb:	6a 01                	push   $0x1
    2fcd:	e8 6e 15 00 00       	call   4540 <printf>
      exit(1);
    2fd2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fd9:	e8 aa 13 00 00       	call   4388 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2fde:	83 ec 08             	sub    $0x8,%esp
    2fe1:	68 40 57 00 00       	push   $0x5740
    2fe6:	6a 01                	push   $0x1
    2fe8:	e8 53 15 00 00       	call   4540 <printf>
      exit(1);
    2fed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ff4:	e8 8f 13 00 00       	call   4388 <exit>
    2ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003000 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3000:	55                   	push   %ebp
    3001:	89 e5                	mov    %esp,%ebp
    3003:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3004:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3006:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    3009:	68 68 57 00 00       	push   $0x5768
    300e:	6a 01                	push   $0x1
    3010:	e8 2b 15 00 00       	call   4540 <printf>
    3015:	83 c4 10             	add    $0x10,%esp
    3018:	eb 13                	jmp    302d <forktest+0x2d>
    301a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    3020:	74 79                	je     309b <forktest+0x9b>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3022:	83 c3 01             	add    $0x1,%ebx
    3025:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    302b:	74 53                	je     3080 <forktest+0x80>
    pid = fork();
    302d:	e8 4e 13 00 00       	call   4380 <fork>
    if(pid < 0)
    3032:	85 c0                	test   %eax,%eax
    3034:	79 ea                	jns    3020 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(0);
  }

  for(; n > 0; n--){
    3036:	85 db                	test   %ebx,%ebx
    3038:	74 1c                	je     3056 <forktest+0x56>
    303a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait(0) < 0){
    3040:	83 ec 0c             	sub    $0xc,%esp
    3043:	6a 00                	push   $0x0
    3045:	e8 46 13 00 00       	call   4390 <wait>
    304a:	83 c4 10             	add    $0x10,%esp
    304d:	85 c0                	test   %eax,%eax
    304f:	78 54                	js     30a5 <forktest+0xa5>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(0);
  }

  for(; n > 0; n--){
    3051:	83 eb 01             	sub    $0x1,%ebx
    3054:	75 ea                	jne    3040 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit(1);
    }
  }

  if(wait(0) != -1){
    3056:	83 ec 0c             	sub    $0xc,%esp
    3059:	6a 00                	push   $0x0
    305b:	e8 30 13 00 00       	call   4390 <wait>
    3060:	83 c4 10             	add    $0x10,%esp
    3063:	83 f8 ff             	cmp    $0xffffffff,%eax
    3066:	75 58                	jne    30c0 <forktest+0xc0>
    printf(1, "wait got too many\n");
    exit(1);
  }

  printf(1, "fork test OK\n");
    3068:	83 ec 08             	sub    $0x8,%esp
    306b:	68 9a 57 00 00       	push   $0x579a
    3070:	6a 01                	push   $0x1
    3072:	e8 c9 14 00 00       	call   4540 <printf>
}
    3077:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    307a:	c9                   	leave  
    307b:	c3                   	ret    
    307c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit(0);
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    3080:	83 ec 08             	sub    $0x8,%esp
    3083:	68 7c 60 00 00       	push   $0x607c
    3088:	6a 01                	push   $0x1
    308a:	e8 b1 14 00 00       	call   4540 <printf>
    exit(0);
    308f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3096:	e8 ed 12 00 00       	call   4388 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit(0);
    309b:	83 ec 0c             	sub    $0xc,%esp
    309e:	6a 00                	push   $0x0
    30a0:	e8 e3 12 00 00       	call   4388 <exit>
    exit(0);
  }

  for(; n > 0; n--){
    if(wait(0) < 0){
      printf(1, "wait stopped early\n");
    30a5:	83 ec 08             	sub    $0x8,%esp
    30a8:	68 73 57 00 00       	push   $0x5773
    30ad:	6a 01                	push   $0x1
    30af:	e8 8c 14 00 00       	call   4540 <printf>
      exit(1);
    30b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30bb:	e8 c8 12 00 00       	call   4388 <exit>
    }
  }

  if(wait(0) != -1){
    printf(1, "wait got too many\n");
    30c0:	83 ec 08             	sub    $0x8,%esp
    30c3:	68 87 57 00 00       	push   $0x5787
    30c8:	6a 01                	push   $0x1
    30ca:	e8 71 14 00 00       	call   4540 <printf>
    exit(1);
    30cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30d6:	e8 ad 12 00 00       	call   4388 <exit>
    30db:	90                   	nop
    30dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000030e0 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    30e0:	55                   	push   %ebp
    30e1:	89 e5                	mov    %esp,%ebp
    30e3:	57                   	push   %edi
    30e4:	56                   	push   %esi
    30e5:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    30e6:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    30e8:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    30eb:	68 a8 57 00 00       	push   $0x57a8
    30f0:	ff 35 04 80 00 00    	pushl  0x8004
    30f6:	e8 45 14 00 00       	call   4540 <printf>
  oldbrk = sbrk(0);
    30fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3102:	e8 09 13 00 00       	call   4410 <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    3107:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    310e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    3111:	e8 fa 12 00 00       	call   4410 <sbrk>
    3116:	83 c4 10             	add    $0x10,%esp
    3119:	89 c3                	mov    %eax,%ebx
    311b:	90                   	nop
    311c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    3120:	83 ec 0c             	sub    $0xc,%esp
    3123:	6a 01                	push   $0x1
    3125:	e8 e6 12 00 00       	call   4410 <sbrk>
    if(b != a){
    312a:	83 c4 10             	add    $0x10,%esp
    312d:	39 d8                	cmp    %ebx,%eax
    312f:	0f 85 9d 02 00 00    	jne    33d2 <sbrktest+0x2f2>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3135:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit(1);
    }
    *b = 1;
    3138:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    313b:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    313e:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    3144:	75 da                	jne    3120 <sbrktest+0x40>
      exit(1);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    3146:	e8 35 12 00 00       	call   4380 <fork>
  if(pid < 0){
    314b:	85 c0                	test   %eax,%eax
      exit(1);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    314d:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    314f:	0f 88 ff 03 00 00    	js     3554 <sbrktest+0x474>
    printf(stdout, "sbrk test fork failed\n");
    exit(1);
  }
  c = sbrk(1);
    3155:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    3158:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit(1);
  }
  c = sbrk(1);
    315b:	6a 01                	push   $0x1
    315d:	e8 ae 12 00 00       	call   4410 <sbrk>
  c = sbrk(1);
    3162:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3169:	e8 a2 12 00 00       	call   4410 <sbrk>
  if(c != a + 1){
    316e:	83 c4 10             	add    $0x10,%esp
    3171:	39 d8                	cmp    %ebx,%eax
    3173:	0f 85 bc 03 00 00    	jne    3535 <sbrktest+0x455>
    printf(stdout, "sbrk test failed post-fork\n");
    exit(1);
  }
  if(pid == 0)
    3179:	85 ff                	test   %edi,%edi
    317b:	0f 84 aa 03 00 00    	je     352b <sbrktest+0x44b>
    exit(0);
  wait(0);
    3181:	83 ec 0c             	sub    $0xc,%esp
    3184:	6a 00                	push   $0x0
    3186:	e8 05 12 00 00       	call   4390 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    318b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3192:	e8 79 12 00 00       	call   4410 <sbrk>
    3197:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    3199:	b8 00 00 40 06       	mov    $0x6400000,%eax
    319e:	29 d8                	sub    %ebx,%eax
    31a0:	89 04 24             	mov    %eax,(%esp)
    31a3:	e8 68 12 00 00       	call   4410 <sbrk>
  if (p != a) {
    31a8:	83 c4 10             	add    $0x10,%esp
    31ab:	39 c3                	cmp    %eax,%ebx
    31ad:	0f 85 59 03 00 00    	jne    350c <sbrktest+0x42c>
  }
  lastaddr = (char*) (p+amt-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    31b3:	83 ec 0c             	sub    $0xc,%esp
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit(1);
  }
  lastaddr = (char*) (p+amt-1);
    31b6:	bf ff ff 3f 06       	mov    $0x63fffff,%edi
  *lastaddr = 99;
    31bb:	c6 07 63             	movb   $0x63,(%edi)

  // can one de-allocate?
  a = sbrk(0);
    31be:	6a 00                	push   $0x0
    31c0:	e8 4b 12 00 00       	call   4410 <sbrk>
  c = sbrk(-4096);
    31c5:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (p+amt-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    31cc:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    31ce:	e8 3d 12 00 00       	call   4410 <sbrk>
  if(c == (char*)0xffffffff){
    31d3:	83 c4 10             	add    $0x10,%esp
    31d6:	83 f8 ff             	cmp    $0xffffffff,%eax
    31d9:	0f 84 0e 03 00 00    	je     34ed <sbrktest+0x40d>
    printf(stdout, "sbrk could not deallocate\n");
    exit(1);
  }
  c = sbrk(0);
    31df:	83 ec 0c             	sub    $0xc,%esp
    31e2:	6a 00                	push   $0x0
    31e4:	e8 27 12 00 00       	call   4410 <sbrk>
  if(c != a - 4096){
    31e9:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    31ef:	83 c4 10             	add    $0x10,%esp
    31f2:	39 d0                	cmp    %edx,%eax
    31f4:	0f 85 d5 02 00 00    	jne    34cf <sbrktest+0x3ef>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit(1);
  }

  // can one re-allocate that page?
  a = sbrk(0);
    31fa:	83 ec 0c             	sub    $0xc,%esp
    31fd:	6a 00                	push   $0x0
    31ff:	e8 0c 12 00 00       	call   4410 <sbrk>
    3204:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    3206:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    320d:	e8 fe 11 00 00       	call   4410 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    3212:	83 c4 10             	add    $0x10,%esp
    3215:	39 c3                	cmp    %eax,%ebx
    exit(1);
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    3217:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    3219:	0f 85 92 02 00 00    	jne    34b1 <sbrktest+0x3d1>
    321f:	83 ec 0c             	sub    $0xc,%esp
    3222:	6a 00                	push   $0x0
    3224:	e8 e7 11 00 00       	call   4410 <sbrk>
    3229:	8d 8b 00 10 00 00    	lea    0x1000(%ebx),%ecx
    322f:	83 c4 10             	add    $0x10,%esp
    3232:	39 c8                	cmp    %ecx,%eax
    3234:	0f 85 77 02 00 00    	jne    34b1 <sbrktest+0x3d1>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit(1);
  }
  if(*lastaddr == 99){
    323a:	80 3f 63             	cmpb   $0x63,(%edi)
    323d:	0f 84 4f 02 00 00    	je     3492 <sbrktest+0x3b2>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit(1);
  }

  a = sbrk(0);
    3243:	83 ec 0c             	sub    $0xc,%esp
    3246:	6a 00                	push   $0x0
    3248:	e8 c3 11 00 00       	call   4410 <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    324d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit(1);
  }

  a = sbrk(0);
    3254:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    3256:	e8 b5 11 00 00       	call   4410 <sbrk>
    325b:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    325e:	29 c1                	sub    %eax,%ecx
    3260:	89 0c 24             	mov    %ecx,(%esp)
    3263:	e8 a8 11 00 00       	call   4410 <sbrk>
  if(c != a){
    3268:	83 c4 10             	add    $0x10,%esp
    326b:	39 c3                	cmp    %eax,%ebx
    326d:	0f 85 01 02 00 00    	jne    3474 <sbrktest+0x394>
    3273:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    3278:	90                   	nop
    3279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit(1);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    3280:	e8 83 11 00 00       	call   4408 <getpid>
    3285:	89 c7                	mov    %eax,%edi
    pid = fork();
    3287:	e8 f4 10 00 00       	call   4380 <fork>
    if(pid < 0){
    328c:	85 c0                	test   %eax,%eax
    328e:	0f 88 c1 01 00 00    	js     3455 <sbrktest+0x375>
      printf(stdout, "fork failed\n");
      exit(1);
    }
    if(pid == 0){
    3294:	0f 84 92 01 00 00    	je     342c <sbrktest+0x34c>
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit(1);
    }
    wait(0);
    329a:	83 ec 0c             	sub    $0xc,%esp
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(1);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    329d:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit(1);
    }
    wait(0);
    32a3:	6a 00                	push   $0x0
    32a5:	e8 e6 10 00 00       	call   4390 <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(1);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    32aa:	83 c4 10             	add    $0x10,%esp
    32ad:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    32b3:	75 cb                	jne    3280 <sbrktest+0x1a0>
    wait(0);
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    32b5:	8d 45 b8             	lea    -0x48(%ebp),%eax
    32b8:	83 ec 0c             	sub    $0xc,%esp
    32bb:	50                   	push   %eax
    32bc:	e8 d7 10 00 00       	call   4398 <pipe>
    32c1:	83 c4 10             	add    $0x10,%esp
    32c4:	85 c0                	test   %eax,%eax
    32c6:	0f 85 45 01 00 00    	jne    3411 <sbrktest+0x331>
    32cc:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    32cf:	8d 7d e8             	lea    -0x18(%ebp),%edi
    32d2:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit(1);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    32d4:	e8 a7 10 00 00       	call   4380 <fork>
    32d9:	85 c0                	test   %eax,%eax
    32db:	89 06                	mov    %eax,(%esi)
    32dd:	0f 84 a8 00 00 00    	je     338b <sbrktest+0x2ab>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    32e3:	83 f8 ff             	cmp    $0xffffffff,%eax
    32e6:	74 14                	je     32fc <sbrktest+0x21c>
      read(fds[0], &scratch, 1);
    32e8:	8d 45 b7             	lea    -0x49(%ebp),%eax
    32eb:	83 ec 04             	sub    $0x4,%esp
    32ee:	6a 01                	push   $0x1
    32f0:	50                   	push   %eax
    32f1:	ff 75 b8             	pushl  -0x48(%ebp)
    32f4:	e8 a7 10 00 00       	call   43a0 <read>
    32f9:	83 c4 10             	add    $0x10,%esp
    32fc:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(1);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32ff:	39 f7                	cmp    %esi,%edi
    3301:	75 d1                	jne    32d4 <sbrktest+0x1f4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3303:	83 ec 0c             	sub    $0xc,%esp
    3306:	68 00 10 00 00       	push   $0x1000
    330b:	e8 00 11 00 00       	call   4410 <sbrk>
    3310:	83 c4 10             	add    $0x10,%esp
    3313:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    3315:	8b 03                	mov    (%ebx),%eax
    3317:	83 f8 ff             	cmp    $0xffffffff,%eax
    331a:	74 18                	je     3334 <sbrktest+0x254>
      continue;
    kill(pids[i]);
    331c:	83 ec 0c             	sub    $0xc,%esp
    331f:	50                   	push   %eax
    3320:	e8 93 10 00 00       	call   43b8 <kill>
    wait(0);
    3325:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    332c:	e8 5f 10 00 00       	call   4390 <wait>
    3331:	83 c4 10             	add    $0x10,%esp
    3334:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3337:	39 fb                	cmp    %edi,%ebx
    3339:	75 da                	jne    3315 <sbrktest+0x235>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait(0);
  }
  if(c == (char*)0xffffffff){
    333b:	83 fe ff             	cmp    $0xffffffff,%esi
    333e:	0f 84 ae 00 00 00    	je     33f2 <sbrktest+0x312>
    printf(stdout, "failed sbrk leaked memory\n");
    exit(1);
  }

  if(sbrk(0) > oldbrk)
    3344:	83 ec 0c             	sub    $0xc,%esp
    3347:	6a 00                	push   $0x0
    3349:	e8 c2 10 00 00       	call   4410 <sbrk>
    334e:	83 c4 10             	add    $0x10,%esp
    3351:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    3354:	73 1a                	jae    3370 <sbrktest+0x290>
    sbrk(-(sbrk(0) - oldbrk));
    3356:	83 ec 0c             	sub    $0xc,%esp
    3359:	6a 00                	push   $0x0
    335b:	e8 b0 10 00 00       	call   4410 <sbrk>
    3360:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    3363:	29 c6                	sub    %eax,%esi
    3365:	89 34 24             	mov    %esi,(%esp)
    3368:	e8 a3 10 00 00       	call   4410 <sbrk>
    336d:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    3370:	83 ec 08             	sub    $0x8,%esp
    3373:	68 50 58 00 00       	push   $0x5850
    3378:	ff 35 04 80 00 00    	pushl  0x8004
    337e:	e8 bd 11 00 00       	call   4540 <printf>
}
    3383:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3386:	5b                   	pop    %ebx
    3387:	5e                   	pop    %esi
    3388:	5f                   	pop    %edi
    3389:	5d                   	pop    %ebp
    338a:	c3                   	ret    
    exit(1);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    338b:	83 ec 0c             	sub    $0xc,%esp
    338e:	6a 00                	push   $0x0
    3390:	e8 7b 10 00 00       	call   4410 <sbrk>
    3395:	ba 00 00 40 06       	mov    $0x6400000,%edx
    339a:	29 c2                	sub    %eax,%edx
    339c:	89 14 24             	mov    %edx,(%esp)
    339f:	e8 6c 10 00 00       	call   4410 <sbrk>
      write(fds[1], "x", 1);
    33a4:	83 c4 0c             	add    $0xc,%esp
    33a7:	6a 01                	push   $0x1
    33a9:	68 11 53 00 00       	push   $0x5311
    33ae:	ff 75 bc             	pushl  -0x44(%ebp)
    33b1:	e8 f2 0f 00 00       	call   43a8 <write>
    33b6:	83 c4 10             	add    $0x10,%esp
    33b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // sit around until killed
      for(;;) sleep(1000);
    33c0:	83 ec 0c             	sub    $0xc,%esp
    33c3:	68 e8 03 00 00       	push   $0x3e8
    33c8:	e8 4b 10 00 00       	call   4418 <sleep>
    33cd:	83 c4 10             	add    $0x10,%esp
    33d0:	eb ee                	jmp    33c0 <sbrktest+0x2e0>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    33d2:	83 ec 0c             	sub    $0xc,%esp
    33d5:	50                   	push   %eax
    33d6:	53                   	push   %ebx
    33d7:	57                   	push   %edi
    33d8:	68 b3 57 00 00       	push   $0x57b3
    33dd:	ff 35 04 80 00 00    	pushl  0x8004
    33e3:	e8 58 11 00 00       	call   4540 <printf>
      exit(1);
    33e8:	83 c4 14             	add    $0x14,%esp
    33eb:	6a 01                	push   $0x1
    33ed:	e8 96 0f 00 00       	call   4388 <exit>
      continue;
    kill(pids[i]);
    wait(0);
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    33f2:	83 ec 08             	sub    $0x8,%esp
    33f5:	68 35 58 00 00       	push   $0x5835
    33fa:	ff 35 04 80 00 00    	pushl  0x8004
    3400:	e8 3b 11 00 00       	call   4540 <printf>
    exit(1);
    3405:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    340c:	e8 77 0f 00 00       	call   4388 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3411:	83 ec 08             	sub    $0x8,%esp
    3414:	68 f1 4c 00 00       	push   $0x4cf1
    3419:	6a 01                	push   $0x1
    341b:	e8 20 11 00 00       	call   4540 <printf>
    exit(1);
    3420:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3427:	e8 5c 0f 00 00       	call   4388 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit(1);
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    342c:	0f be 03             	movsbl (%ebx),%eax
    342f:	50                   	push   %eax
    3430:	53                   	push   %ebx
    3431:	68 1c 58 00 00       	push   $0x581c
    3436:	ff 35 04 80 00 00    	pushl  0x8004
    343c:	e8 ff 10 00 00       	call   4540 <printf>
      kill(ppid);
    3441:	89 3c 24             	mov    %edi,(%esp)
    3444:	e8 6f 0f 00 00       	call   43b8 <kill>
      exit(1);
    3449:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3450:	e8 33 0f 00 00       	call   4388 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    3455:	83 ec 08             	sub    $0x8,%esp
    3458:	68 f9 58 00 00       	push   $0x58f9
    345d:	ff 35 04 80 00 00    	pushl  0x8004
    3463:	e8 d8 10 00 00       	call   4540 <printf>
      exit(1);
    3468:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    346f:	e8 14 0f 00 00       	call   4388 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3474:	50                   	push   %eax
    3475:	53                   	push   %ebx
    3476:	68 70 61 00 00       	push   $0x6170
    347b:	ff 35 04 80 00 00    	pushl  0x8004
    3481:	e8 ba 10 00 00       	call   4540 <printf>
    exit(1);
    3486:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    348d:	e8 f6 0e 00 00       	call   4388 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit(1);
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3492:	83 ec 08             	sub    $0x8,%esp
    3495:	68 40 61 00 00       	push   $0x6140
    349a:	ff 35 04 80 00 00    	pushl  0x8004
    34a0:	e8 9b 10 00 00       	call   4540 <printf>
    exit(1);
    34a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34ac:	e8 d7 0e 00 00       	call   4388 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    34b1:	56                   	push   %esi
    34b2:	53                   	push   %ebx
    34b3:	68 18 61 00 00       	push   $0x6118
    34b8:	ff 35 04 80 00 00    	pushl  0x8004
    34be:	e8 7d 10 00 00       	call   4540 <printf>
    exit(1);
    34c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34ca:	e8 b9 0e 00 00       	call   4388 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit(1);
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    34cf:	50                   	push   %eax
    34d0:	53                   	push   %ebx
    34d1:	68 e0 60 00 00       	push   $0x60e0
    34d6:	ff 35 04 80 00 00    	pushl  0x8004
    34dc:	e8 5f 10 00 00       	call   4540 <printf>
    exit(1);
    34e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34e8:	e8 9b 0e 00 00       	call   4388 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    34ed:	83 ec 08             	sub    $0x8,%esp
    34f0:	68 01 58 00 00       	push   $0x5801
    34f5:	ff 35 04 80 00 00    	pushl  0x8004
    34fb:	e8 40 10 00 00       	call   4540 <printf>
    exit(1);
    3500:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3507:	e8 7c 0e 00 00       	call   4388 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    350c:	83 ec 08             	sub    $0x8,%esp
    350f:	68 a0 60 00 00       	push   $0x60a0
    3514:	ff 35 04 80 00 00    	pushl  0x8004
    351a:	e8 21 10 00 00       	call   4540 <printf>
    exit(1);
    351f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3526:	e8 5d 0e 00 00       	call   4388 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit(1);
  }
  if(pid == 0)
    exit(0);
    352b:	83 ec 0c             	sub    $0xc,%esp
    352e:	6a 00                	push   $0x0
    3530:	e8 53 0e 00 00       	call   4388 <exit>
    exit(1);
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3535:	83 ec 08             	sub    $0x8,%esp
    3538:	68 e5 57 00 00       	push   $0x57e5
    353d:	ff 35 04 80 00 00    	pushl  0x8004
    3543:	e8 f8 0f 00 00       	call   4540 <printf>
    exit(1);
    3548:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    354f:	e8 34 0e 00 00       	call   4388 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3554:	83 ec 08             	sub    $0x8,%esp
    3557:	68 ce 57 00 00       	push   $0x57ce
    355c:	ff 35 04 80 00 00    	pushl  0x8004
    3562:	e8 d9 0f 00 00       	call   4540 <printf>
    exit(1);
    3567:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    356e:	e8 15 0e 00 00       	call   4388 <exit>
    3573:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003580 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    3580:	55                   	push   %ebp
    3581:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3583:	5d                   	pop    %ebp
    3584:	c3                   	ret    
    3585:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003590 <validatetest>:

void
validatetest(void)
{
    3590:	55                   	push   %ebp
    3591:	89 e5                	mov    %esp,%ebp
    3593:	56                   	push   %esi
    3594:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3595:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3597:	83 ec 08             	sub    $0x8,%esp
    359a:	68 5e 58 00 00       	push   $0x585e
    359f:	ff 35 04 80 00 00    	pushl  0x8004
    35a5:	e8 96 0f 00 00       	call   4540 <printf>
    35aa:	83 c4 10             	add    $0x10,%esp
    35ad:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    35b0:	e8 cb 0d 00 00       	call   4380 <fork>
    35b5:	85 c0                	test   %eax,%eax
    35b7:	89 c6                	mov    %eax,%esi
    35b9:	74 6a                	je     3625 <validatetest+0x95>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit(1);
    }
    sleep(0);
    35bb:	83 ec 0c             	sub    $0xc,%esp
    35be:	6a 00                	push   $0x0
    35c0:	e8 53 0e 00 00       	call   4418 <sleep>
    sleep(0);
    35c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35cc:	e8 47 0e 00 00       	call   4418 <sleep>
    kill(pid);
    35d1:	89 34 24             	mov    %esi,(%esp)
    35d4:	e8 df 0d 00 00       	call   43b8 <kill>
    wait(0);
    35d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35e0:	e8 ab 0d 00 00       	call   4390 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    35e5:	58                   	pop    %eax
    35e6:	5a                   	pop    %edx
    35e7:	53                   	push   %ebx
    35e8:	68 6d 58 00 00       	push   $0x586d
    35ed:	e8 f6 0d 00 00       	call   43e8 <link>
    35f2:	83 c4 10             	add    $0x10,%esp
    35f5:	83 f8 ff             	cmp    $0xffffffff,%eax
    35f8:	75 35                	jne    362f <validatetest+0x9f>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    35fa:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3600:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    3606:	75 a8                	jne    35b0 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit(1);
    }
  }

  printf(stdout, "validate ok\n");
    3608:	83 ec 08             	sub    $0x8,%esp
    360b:	68 91 58 00 00       	push   $0x5891
    3610:	ff 35 04 80 00 00    	pushl  0x8004
    3616:	e8 25 0f 00 00       	call   4540 <printf>
}
    361b:	83 c4 10             	add    $0x10,%esp
    361e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3621:	5b                   	pop    %ebx
    3622:	5e                   	pop    %esi
    3623:	5d                   	pop    %ebp
    3624:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit(1);
    3625:	83 ec 0c             	sub    $0xc,%esp
    3628:	6a 01                	push   $0x1
    362a:	e8 59 0d 00 00       	call   4388 <exit>
    kill(pid);
    wait(0);

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    362f:	83 ec 08             	sub    $0x8,%esp
    3632:	68 78 58 00 00       	push   $0x5878
    3637:	ff 35 04 80 00 00    	pushl  0x8004
    363d:	e8 fe 0e 00 00       	call   4540 <printf>
      exit(1);
    3642:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3649:	e8 3a 0d 00 00       	call   4388 <exit>
    364e:	66 90                	xchg   %ax,%ax

00003650 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3650:	55                   	push   %ebp
    3651:	89 e5                	mov    %esp,%ebp
    3653:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3656:	68 9e 58 00 00       	push   $0x589e
    365b:	ff 35 04 80 00 00    	pushl  0x8004
    3661:	e8 da 0e 00 00       	call   4540 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3666:	83 c4 10             	add    $0x10,%esp
    3669:	80 3d c0 80 00 00 00 	cmpb   $0x0,0x80c0
    3670:	75 35                	jne    36a7 <bsstest+0x57>
    3672:	b8 c1 80 00 00       	mov    $0x80c1,%eax
    3677:	89 f6                	mov    %esi,%esi
    3679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3680:	80 38 00             	cmpb   $0x0,(%eax)
    3683:	75 22                	jne    36a7 <bsstest+0x57>
    3685:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3688:	3d d0 a7 00 00       	cmp    $0xa7d0,%eax
    368d:	75 f1                	jne    3680 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit(1);
    }
  }
  printf(stdout, "bss test ok\n");
    368f:	83 ec 08             	sub    $0x8,%esp
    3692:	68 b9 58 00 00       	push   $0x58b9
    3697:	ff 35 04 80 00 00    	pushl  0x8004
    369d:	e8 9e 0e 00 00       	call   4540 <printf>
}
    36a2:	83 c4 10             	add    $0x10,%esp
    36a5:	c9                   	leave  
    36a6:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    36a7:	83 ec 08             	sub    $0x8,%esp
    36aa:	68 a8 58 00 00       	push   $0x58a8
    36af:	ff 35 04 80 00 00    	pushl  0x8004
    36b5:	e8 86 0e 00 00       	call   4540 <printf>
      exit(1);
    36ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36c1:	e8 c2 0c 00 00       	call   4388 <exit>
    36c6:	8d 76 00             	lea    0x0(%esi),%esi
    36c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036d0 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    36d0:	55                   	push   %ebp
    36d1:	89 e5                	mov    %esp,%ebp
    36d3:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    36d6:	68 c6 58 00 00       	push   $0x58c6
    36db:	e8 f8 0c 00 00       	call   43d8 <unlink>
  pid = fork();
    36e0:	e8 9b 0c 00 00       	call   4380 <fork>
  if(pid == 0){
    36e5:	83 c4 10             	add    $0x10,%esp
    36e8:	85 c0                	test   %eax,%eax
    36ea:	74 43                	je     372f <bigargtest+0x5f>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit(0);
  } else if(pid < 0){
    36ec:	0f 88 d8 00 00 00    	js     37ca <bigargtest+0xfa>
    printf(stdout, "bigargtest: fork failed\n");
    exit(1);
  }
  wait(0);
    36f2:	83 ec 0c             	sub    $0xc,%esp
    36f5:	6a 00                	push   $0x0
    36f7:	e8 94 0c 00 00       	call   4390 <wait>
  fd = open("bigarg-ok", 0);
    36fc:	5a                   	pop    %edx
    36fd:	59                   	pop    %ecx
    36fe:	6a 00                	push   $0x0
    3700:	68 c6 58 00 00       	push   $0x58c6
    3705:	e8 be 0c 00 00       	call   43c8 <open>
  if(fd < 0){
    370a:	83 c4 10             	add    $0x10,%esp
    370d:	85 c0                	test   %eax,%eax
    370f:	0f 88 97 00 00 00    	js     37ac <bigargtest+0xdc>
    printf(stdout, "bigarg test failed!\n");
    exit(1);
  }
  close(fd);
    3715:	83 ec 0c             	sub    $0xc,%esp
    3718:	50                   	push   %eax
    3719:	e8 92 0c 00 00       	call   43b0 <close>
  unlink("bigarg-ok");
    371e:	c7 04 24 c6 58 00 00 	movl   $0x58c6,(%esp)
    3725:	e8 ae 0c 00 00       	call   43d8 <unlink>
}
    372a:	83 c4 10             	add    $0x10,%esp
    372d:	c9                   	leave  
    372e:	c3                   	ret    
    372f:	b8 20 80 00 00       	mov    $0x8020,%eax
    3734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3738:	c7 00 94 61 00 00    	movl   $0x6194,(%eax)
    373e:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3741:	3d 9c 80 00 00       	cmp    $0x809c,%eax
    3746:	75 f0                	jne    3738 <bigargtest+0x68>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    3748:	50                   	push   %eax
    3749:	50                   	push   %eax
    374a:	68 d0 58 00 00       	push   $0x58d0
    374f:	ff 35 04 80 00 00    	pushl  0x8004
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    3755:	c7 05 9c 80 00 00 00 	movl   $0x0,0x809c
    375c:	00 00 00 
    printf(stdout, "bigarg test\n");
    375f:	e8 dc 0d 00 00       	call   4540 <printf>
    exec("echo", args);
    3764:	58                   	pop    %eax
    3765:	5a                   	pop    %edx
    3766:	68 20 80 00 00       	push   $0x8020
    376b:	68 9d 4a 00 00       	push   $0x4a9d
    3770:	e8 4b 0c 00 00       	call   43c0 <exec>
    printf(stdout, "bigarg test ok\n");
    3775:	59                   	pop    %ecx
    3776:	58                   	pop    %eax
    3777:	68 dd 58 00 00       	push   $0x58dd
    377c:	ff 35 04 80 00 00    	pushl  0x8004
    3782:	e8 b9 0d 00 00       	call   4540 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3787:	58                   	pop    %eax
    3788:	5a                   	pop    %edx
    3789:	68 00 02 00 00       	push   $0x200
    378e:	68 c6 58 00 00       	push   $0x58c6
    3793:	e8 30 0c 00 00       	call   43c8 <open>
    close(fd);
    3798:	89 04 24             	mov    %eax,(%esp)
    379b:	e8 10 0c 00 00       	call   43b0 <close>
    exit(0);
    37a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37a7:	e8 dc 0b 00 00       	call   4388 <exit>
    exit(1);
  }
  wait(0);
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    37ac:	50                   	push   %eax
    37ad:	50                   	push   %eax
    37ae:	68 06 59 00 00       	push   $0x5906
    37b3:	ff 35 04 80 00 00    	pushl  0x8004
    37b9:	e8 82 0d 00 00       	call   4540 <printf>
    exit(1);
    37be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    37c5:	e8 be 0b 00 00       	call   4388 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit(0);
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    37ca:	50                   	push   %eax
    37cb:	50                   	push   %eax
    37cc:	68 ed 58 00 00       	push   $0x58ed
    37d1:	ff 35 04 80 00 00    	pushl  0x8004
    37d7:	e8 64 0d 00 00       	call   4540 <printf>
    exit(1);
    37dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    37e3:	e8 a0 0b 00 00       	call   4388 <exit>
    37e8:	90                   	nop
    37e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000037f0 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    37f0:	55                   	push   %ebp
    37f1:	89 e5                	mov    %esp,%ebp
    37f3:	57                   	push   %edi
    37f4:	56                   	push   %esi
    37f5:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    37f6:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    37f8:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    37fb:	68 1b 59 00 00       	push   $0x591b
    3800:	6a 01                	push   $0x1
    3802:	e8 39 0d 00 00       	call   4540 <printf>
    3807:	83 c4 10             	add    $0x10,%esp
    380a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3810:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3815:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3817:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3819:	f7 eb                	imul   %ebx
    381b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    381e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3820:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    3823:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3827:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    382b:	c1 fa 06             	sar    $0x6,%edx
    382e:	29 f2                	sub    %esi,%edx
    3830:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3833:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3839:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    383c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3841:	29 d1                	sub    %edx,%ecx
    3843:	f7 e9                	imul   %ecx
    3845:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3848:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    384d:	c1 fa 05             	sar    $0x5,%edx
    3850:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    3852:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3857:	83 c2 30             	add    $0x30,%edx
    385a:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    385d:	f7 eb                	imul   %ebx
    385f:	c1 fa 05             	sar    $0x5,%edx
    3862:	29 f2                	sub    %esi,%edx
    3864:	6b d2 64             	imul   $0x64,%edx,%edx
    3867:	29 d7                	sub    %edx,%edi
    3869:	89 f8                	mov    %edi,%eax
    386b:	c1 ff 1f             	sar    $0x1f,%edi
    386e:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3870:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3872:	c1 fa 02             	sar    $0x2,%edx
    3875:	29 fa                	sub    %edi,%edx
    3877:	83 c2 30             	add    $0x30,%edx
    387a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    387d:	f7 e9                	imul   %ecx
    387f:	89 d9                	mov    %ebx,%ecx
    3881:	c1 fa 02             	sar    $0x2,%edx
    3884:	29 f2                	sub    %esi,%edx
    3886:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3889:	01 c0                	add    %eax,%eax
    388b:	29 c1                	sub    %eax,%ecx
    388d:	89 c8                	mov    %ecx,%eax
    388f:	83 c0 30             	add    $0x30,%eax
    3892:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3895:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3898:	50                   	push   %eax
    3899:	68 28 59 00 00       	push   $0x5928
    389e:	6a 01                	push   $0x1
    38a0:	e8 9b 0c 00 00       	call   4540 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    38a5:	58                   	pop    %eax
    38a6:	8d 45 a8             	lea    -0x58(%ebp),%eax
    38a9:	5a                   	pop    %edx
    38aa:	68 02 02 00 00       	push   $0x202
    38af:	50                   	push   %eax
    38b0:	e8 13 0b 00 00       	call   43c8 <open>
    if(fd < 0){
    38b5:	83 c4 10             	add    $0x10,%esp
    38b8:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    38ba:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    38bc:	78 50                	js     390e <fsfull+0x11e>
    38be:	31 f6                	xor    %esi,%esi
    38c0:	eb 08                	jmp    38ca <fsfull+0xda>
    38c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    38c8:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    38ca:	83 ec 04             	sub    $0x4,%esp
    38cd:	68 00 02 00 00       	push   $0x200
    38d2:	68 e0 a7 00 00       	push   $0xa7e0
    38d7:	57                   	push   %edi
    38d8:	e8 cb 0a 00 00       	call   43a8 <write>
      if(cc < 512)
    38dd:	83 c4 10             	add    $0x10,%esp
    38e0:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    38e5:	7f e1                	jg     38c8 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    38e7:	83 ec 04             	sub    $0x4,%esp
    38ea:	56                   	push   %esi
    38eb:	68 44 59 00 00       	push   $0x5944
    38f0:	6a 01                	push   $0x1
    38f2:	e8 49 0c 00 00       	call   4540 <printf>
    close(fd);
    38f7:	89 3c 24             	mov    %edi,(%esp)
    38fa:	e8 b1 0a 00 00       	call   43b0 <close>
    if(total == 0)
    38ff:	83 c4 10             	add    $0x10,%esp
    3902:	85 f6                	test   %esi,%esi
    3904:	74 22                	je     3928 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3906:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3909:	e9 02 ff ff ff       	jmp    3810 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    390e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3911:	83 ec 04             	sub    $0x4,%esp
    3914:	50                   	push   %eax
    3915:	68 34 59 00 00       	push   $0x5934
    391a:	6a 01                	push   $0x1
    391c:	e8 1f 0c 00 00       	call   4540 <printf>
      break;
    3921:	83 c4 10             	add    $0x10,%esp
    3924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3928:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    392d:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    392f:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3931:	f7 eb                	imul   %ebx
    3933:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3936:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    3938:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    393b:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    393f:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3943:	c1 fa 06             	sar    $0x6,%edx
    3946:	29 f2                	sub    %esi,%edx
    3948:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    394b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3951:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3954:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3959:	29 d1                	sub    %edx,%ecx
    395b:	f7 e9                	imul   %ecx
    395d:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3960:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3965:	c1 fa 05             	sar    $0x5,%edx
    3968:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    396a:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    396f:	83 c2 30             	add    $0x30,%edx
    3972:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3975:	f7 eb                	imul   %ebx
    3977:	c1 fa 05             	sar    $0x5,%edx
    397a:	29 f2                	sub    %esi,%edx
    397c:	6b d2 64             	imul   $0x64,%edx,%edx
    397f:	29 d7                	sub    %edx,%edi
    3981:	89 f8                	mov    %edi,%eax
    3983:	c1 ff 1f             	sar    $0x1f,%edi
    3986:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3988:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    398a:	c1 fa 02             	sar    $0x2,%edx
    398d:	29 fa                	sub    %edi,%edx
    398f:	83 c2 30             	add    $0x30,%edx
    3992:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3995:	f7 e9                	imul   %ecx
    3997:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3999:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    399c:	c1 fa 02             	sar    $0x2,%edx
    399f:	29 f2                	sub    %esi,%edx
    39a1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    39a4:	01 c0                	add    %eax,%eax
    39a6:	29 c1                	sub    %eax,%ecx
    39a8:	89 c8                	mov    %ecx,%eax
    39aa:	83 c0 30             	add    $0x30,%eax
    39ad:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    39b0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    39b3:	50                   	push   %eax
    39b4:	e8 1f 0a 00 00       	call   43d8 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    39b9:	83 c4 10             	add    $0x10,%esp
    39bc:	83 fb ff             	cmp    $0xffffffff,%ebx
    39bf:	0f 85 63 ff ff ff    	jne    3928 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    39c5:	83 ec 08             	sub    $0x8,%esp
    39c8:	68 54 59 00 00       	push   $0x5954
    39cd:	6a 01                	push   $0x1
    39cf:	e8 6c 0b 00 00       	call   4540 <printf>
}
    39d4:	83 c4 10             	add    $0x10,%esp
    39d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    39da:	5b                   	pop    %ebx
    39db:	5e                   	pop    %esi
    39dc:	5f                   	pop    %edi
    39dd:	5d                   	pop    %ebp
    39de:	c3                   	ret    
    39df:	90                   	nop

000039e0 <uio>:

void
uio()
{
    39e0:	55                   	push   %ebp
    39e1:	89 e5                	mov    %esp,%ebp
    39e3:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    39e6:	68 6a 59 00 00       	push   $0x596a
    39eb:	6a 01                	push   $0x1
    39ed:	e8 4e 0b 00 00       	call   4540 <printf>
  pid = fork();
    39f2:	e8 89 09 00 00       	call   4380 <fork>
  if(pid == 0){
    39f7:	83 c4 10             	add    $0x10,%esp
    39fa:	85 c0                	test   %eax,%eax
    39fc:	74 1f                	je     3a1d <uio+0x3d>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit(1);
  } else if(pid < 0){
    39fe:	78 48                	js     3a48 <uio+0x68>
    printf (1, "fork failed\n");
    exit(1);
  }
  wait(0);
    3a00:	83 ec 0c             	sub    $0xc,%esp
    3a03:	6a 00                	push   $0x0
    3a05:	e8 86 09 00 00       	call   4390 <wait>
  printf(1, "uio test done\n");
    3a0a:	58                   	pop    %eax
    3a0b:	5a                   	pop    %edx
    3a0c:	68 74 59 00 00       	push   $0x5974
    3a11:	6a 01                	push   $0x1
    3a13:	e8 28 0b 00 00       	call   4540 <printf>
}
    3a18:	83 c4 10             	add    $0x10,%esp
    3a1b:	c9                   	leave  
    3a1c:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3a1d:	ba 70 00 00 00       	mov    $0x70,%edx
    3a22:	b8 09 00 00 00       	mov    $0x9,%eax
    3a27:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3a28:	ba 71 00 00 00       	mov    $0x71,%edx
    3a2d:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    3a2e:	50                   	push   %eax
    3a2f:	50                   	push   %eax
    3a30:	68 74 62 00 00       	push   $0x6274
    3a35:	6a 01                	push   $0x1
    3a37:	e8 04 0b 00 00       	call   4540 <printf>
    exit(1);
    3a3c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a43:	e8 40 09 00 00       	call   4388 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    3a48:	51                   	push   %ecx
    3a49:	51                   	push   %ecx
    3a4a:	68 f9 58 00 00       	push   $0x58f9
    3a4f:	6a 01                	push   $0x1
    3a51:	e8 ea 0a 00 00       	call   4540 <printf>
    exit(1);
    3a56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a5d:	e8 26 09 00 00       	call   4388 <exit>
    3a62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003a70 <argptest>:
  wait(0);
  printf(1, "uio test done\n");
}

void argptest()
{
    3a70:	55                   	push   %ebp
    3a71:	89 e5                	mov    %esp,%ebp
    3a73:	53                   	push   %ebx
    3a74:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    3a77:	6a 00                	push   $0x0
    3a79:	68 83 59 00 00       	push   $0x5983
    3a7e:	e8 45 09 00 00       	call   43c8 <open>
  if (fd < 0) {
    3a83:	83 c4 10             	add    $0x10,%esp
    3a86:	85 c0                	test   %eax,%eax
    3a88:	78 39                	js     3ac3 <argptest+0x53>
    printf(2, "open failed\n");
    exit(1);
  }
  read(fd, sbrk(0) - 1, -1);
    3a8a:	83 ec 0c             	sub    $0xc,%esp
    3a8d:	89 c3                	mov    %eax,%ebx
    3a8f:	6a 00                	push   $0x0
    3a91:	e8 7a 09 00 00       	call   4410 <sbrk>
    3a96:	83 c4 0c             	add    $0xc,%esp
    3a99:	83 e8 01             	sub    $0x1,%eax
    3a9c:	6a ff                	push   $0xffffffff
    3a9e:	50                   	push   %eax
    3a9f:	53                   	push   %ebx
    3aa0:	e8 fb 08 00 00       	call   43a0 <read>
  close(fd);
    3aa5:	89 1c 24             	mov    %ebx,(%esp)
    3aa8:	e8 03 09 00 00       	call   43b0 <close>
  printf(1, "arg test passed\n");
    3aad:	58                   	pop    %eax
    3aae:	5a                   	pop    %edx
    3aaf:	68 95 59 00 00       	push   $0x5995
    3ab4:	6a 01                	push   $0x1
    3ab6:	e8 85 0a 00 00       	call   4540 <printf>
}
    3abb:	83 c4 10             	add    $0x10,%esp
    3abe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3ac1:	c9                   	leave  
    3ac2:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3ac3:	51                   	push   %ecx
    3ac4:	51                   	push   %ecx
    3ac5:	68 88 59 00 00       	push   $0x5988
    3aca:	6a 02                	push   $0x2
    3acc:	e8 6f 0a 00 00       	call   4540 <printf>
    exit(1);
    3ad1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3ad8:	e8 ab 08 00 00       	call   4388 <exit>
    3add:	8d 76 00             	lea    0x0(%esi),%esi

00003ae0 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3ae0:	69 05 00 80 00 00 0d 	imul   $0x19660d,0x8000,%eax
    3ae7:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    3aea:	55                   	push   %ebp
    3aeb:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    3aed:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3aee:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3af3:	a3 00 80 00 00       	mov    %eax,0x8000
  return randstate;
}
    3af8:	c3                   	ret    
    3af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003b00 <printftest>:

void printftest()
{
    3b00:	55                   	push   %ebp
    3b01:	89 e5                	mov    %esp,%ebp
    3b03:	53                   	push   %ebx
    3b04:	83 ec 2c             	sub    $0x2c,%esp
    PERCENT_TEST,
    UNKNOWN_TYPE_TEST,
    STRING_NULL_TEST,
    CHAR_TEST
  };
  const char *test_fmts[] = {
    3b07:	c7 45 dc 98 62 00 00 	movl   $0x6298,-0x24(%ebp)
    3b0e:	c7 45 e0 a6 59 00 00 	movl   $0x59a6,-0x20(%ebp)
    "check double percent %\n",
    "unknown type %z\n",
    "string is null test (null)\n"
  };

  printf(1, "printftest starting\n");
    3b15:	68 33 5a 00 00       	push   $0x5a33
    3b1a:	6a 01                	push   $0x1
    PERCENT_TEST,
    UNKNOWN_TYPE_TEST,
    STRING_NULL_TEST,
    CHAR_TEST
  };
  const char *test_fmts[] = {
    3b1c:	c7 45 e4 bf 59 00 00 	movl   $0x59bf,-0x1c(%ebp)
    3b23:	c7 45 e8 d9 59 00 00 	movl   $0x59d9,-0x18(%ebp)
    3b2a:	c7 45 ec f1 59 00 00 	movl   $0x59f1,-0x14(%ebp)
    3b31:	c7 45 f0 0a 5a 00 00 	movl   $0x5a0a,-0x10(%ebp)
    3b38:	c7 45 f4 1b 5a 00 00 	movl   $0x5a1b,-0xc(%ebp)
    "check double percent %\n",
    "unknown type %z\n",
    "string is null test (null)\n"
  };

  printf(1, "printftest starting\n");
    3b3f:	e8 fc 09 00 00       	call   4540 <printf>

  num_chars = printf(1, test_fmts[HELLO_WORLD]);
    3b44:	58                   	pop    %eax
    3b45:	5a                   	pop    %edx
    3b46:	ff 75 dc             	pushl  -0x24(%ebp)
    3b49:	6a 01                	push   $0x1
    3b4b:	e8 f0 09 00 00       	call   4540 <printf>
  if (num_chars != strlen(test_fmts[HELLO_WORLD])) {
    3b50:	59                   	pop    %ecx
    3b51:	ff 75 dc             	pushl  -0x24(%ebp)
    "string is null test (null)\n"
  };

  printf(1, "printftest starting\n");

  num_chars = printf(1, test_fmts[HELLO_WORLD]);
    3b54:	89 c3                	mov    %eax,%ebx
  if (num_chars != strlen(test_fmts[HELLO_WORLD])) {
    3b56:	e8 a5 04 00 00       	call   4000 <strlen>
    3b5b:	83 c4 10             	add    $0x10,%esp
    3b5e:	39 d8                	cmp    %ebx,%eax
    3b60:	0f 85 fd 00 00 00    	jne    3c63 <printftest+0x163>
    printf(2, "printftest failed on HELLO_WORLD string. Expected size = %d, got = %d\n",
      num_chars, strlen(test_fmts[HELLO_WORLD]));
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[INTEGER_TEST], 53);
    3b66:	83 ec 04             	sub    $0x4,%esp
    3b69:	6a 35                	push   $0x35
    3b6b:	ff 75 e0             	pushl  -0x20(%ebp)
    3b6e:	6a 01                	push   $0x1
    3b70:	e8 cb 09 00 00       	call   4540 <printf>
    3b75:	89 c3                	mov    %eax,%ebx
  if (num_chars != strlen(test_strings[INTEGER_TEST])) {
    3b77:	c7 04 24 48 5a 00 00 	movl   $0x5a48,(%esp)
    3b7e:	e8 7d 04 00 00       	call   4000 <strlen>
    3b83:	83 c4 10             	add    $0x10,%esp
    3b86:	39 d8                	cmp    %ebx,%eax
    3b88:	0f 85 66 01 00 00    	jne    3cf4 <printftest+0x1f4>
    printf(2, "printftest failed on INTEGER_TEST string. Expected size = %d, got = %d\n",
      num_chars, strlen(test_strings[INTEGER_TEST]));
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[POINTER_TEST], test_fmts);
    3b8e:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3b91:	83 ec 04             	sub    $0x4,%esp
    3b94:	50                   	push   %eax
    3b95:	ff 75 e4             	pushl  -0x1c(%ebp)
    3b98:	6a 01                	push   $0x1
    3b9a:	e8 a1 09 00 00       	call   4540 <printf>
    3b9f:	89 c3                	mov    %eax,%ebx
  if (num_chars != strlen(test_strings[POINTER_TEST])) {
    3ba1:	c7 04 24 61 5a 00 00 	movl   $0x5a61,(%esp)
    3ba8:	e8 53 04 00 00       	call   4000 <strlen>
    3bad:	83 c4 10             	add    $0x10,%esp
    3bb0:	39 d8                	cmp    %ebx,%eax
    3bb2:	0f 85 26 01 00 00    	jne    3cde <printftest+0x1de>
    printf(2, "printftest failed on POINTER_TEST string. Expected size = %d, got = %d\n",
      num_chars, strlen(test_strings[POINTER_TEST]));
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[HEXA_TEST], 53);
    3bb8:	83 ec 04             	sub    $0x4,%esp
    3bbb:	6a 35                	push   $0x35
    3bbd:	ff 75 e8             	pushl  -0x18(%ebp)
    3bc0:	6a 01                	push   $0x1
    3bc2:	e8 79 09 00 00       	call   4540 <printf>
    3bc7:	89 c3                	mov    %eax,%ebx
  if (num_chars != strlen(test_strings[HEXA_TEST])) {
    3bc9:	c7 04 24 7d 5a 00 00 	movl   $0x5a7d,(%esp)
    3bd0:	e8 2b 04 00 00       	call   4000 <strlen>
    3bd5:	83 c4 10             	add    $0x10,%esp
    3bd8:	39 d8                	cmp    %ebx,%eax
    3bda:	0f 85 e8 00 00 00    	jne    3cc8 <printftest+0x1c8>
    printf(2, "printftest failed on HEXA_TEST string. Expected size = %d, got = %d\n",
      num_chars, strlen(test_strings[HEXA_TEST]));
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[PERCENT_TEST]);
    3be0:	83 ec 08             	sub    $0x8,%esp
    3be3:	ff 75 ec             	pushl  -0x14(%ebp)
    3be6:	6a 01                	push   $0x1
    3be8:	e8 53 09 00 00       	call   4540 <printf>
    3bed:	89 c3                	mov    %eax,%ebx
  if (num_chars != strlen(test_strings[PERCENT_TEST])) {
    3bef:	c7 04 24 95 5a 00 00 	movl   $0x5a95,(%esp)
    3bf6:	e8 05 04 00 00       	call   4000 <strlen>
    3bfb:	83 c4 10             	add    $0x10,%esp
    3bfe:	39 d8                	cmp    %ebx,%eax
    3c00:	0f 85 ac 00 00 00    	jne    3cb2 <printftest+0x1b2>
    printf(2, "printftest failed on PERCENT_TEST string. Expected size = %d, got = %d\n",
      num_chars, strlen(test_strings[PERCENT_TEST]));
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[UNKNOWN_TYPE_TEST]);
    3c06:	83 ec 08             	sub    $0x8,%esp
    3c09:	ff 75 f0             	pushl  -0x10(%ebp)
    3c0c:	6a 01                	push   $0x1
    3c0e:	e8 2d 09 00 00       	call   4540 <printf>
    3c13:	89 c3                	mov    %eax,%ebx
  if (num_chars != strlen(test_strings[UNKNOWN_TYPE_TEST])) {
    3c15:	c7 04 24 0a 5a 00 00 	movl   $0x5a0a,(%esp)
    3c1c:	e8 df 03 00 00       	call   4000 <strlen>
    3c21:	83 c4 10             	add    $0x10,%esp
    3c24:	39 d8                	cmp    %ebx,%eax
    3c26:	75 74                	jne    3c9c <printftest+0x19c>
    printf(2, "printftest failed on UNKNOWN_TYPE_TEST string. Expected size = %d, got = %d\n",
      num_chars, strlen(test_strings[UNKNOWN_TYPE_TEST]));
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[STRING_NULL_TEST], 0);
    3c28:	83 ec 04             	sub    $0x4,%esp
    3c2b:	6a 00                	push   $0x0
    3c2d:	ff 75 f4             	pushl  -0xc(%ebp)
    3c30:	6a 01                	push   $0x1
    3c32:	e8 09 09 00 00       	call   4540 <printf>
    3c37:	89 c3                	mov    %eax,%ebx
  if (num_chars != strlen(test_strings[STRING_NULL_TEST])) {
    3c39:	c7 04 24 ad 5a 00 00 	movl   $0x5aad,(%esp)
    3c40:	e8 bb 03 00 00       	call   4000 <strlen>
    3c45:	83 c4 10             	add    $0x10,%esp
    3c48:	39 d8                	cmp    %ebx,%eax
    3c4a:	75 3a                	jne    3c86 <printftest+0x186>
    printf(2, "printftest failed on STRING_NULL_TEST string. Expected size = %d, got = %d\n",
      num_chars, strlen(test_strings[STRING_NULL_TEST]));
    exit(exit_error);
  }

  printf(1, "printftest passed\n");
    3c4c:	83 ec 08             	sub    $0x8,%esp
    3c4f:	68 c9 5a 00 00       	push   $0x5ac9
    3c54:	6a 01                	push   $0x1
    3c56:	e8 e5 08 00 00       	call   4540 <printf>
}
    3c5b:	83 c4 10             	add    $0x10,%esp
    3c5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3c61:	c9                   	leave  
    3c62:	c3                   	ret    

  printf(1, "printftest starting\n");

  num_chars = printf(1, test_fmts[HELLO_WORLD]);
  if (num_chars != strlen(test_fmts[HELLO_WORLD])) {
    printf(2, "printftest failed on HELLO_WORLD string. Expected size = %d, got = %d\n",
    3c63:	83 ec 0c             	sub    $0xc,%esp
    3c66:	ff 75 dc             	pushl  -0x24(%ebp)
    3c69:	e8 92 03 00 00       	call   4000 <strlen>
    3c6e:	50                   	push   %eax
    3c6f:	53                   	push   %ebx
    3c70:	68 b8 62 00 00       	push   $0x62b8
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[INTEGER_TEST], 53);
  if (num_chars != strlen(test_strings[INTEGER_TEST])) {
    printf(2, "printftest failed on INTEGER_TEST string. Expected size = %d, got = %d\n",
    3c75:	6a 02                	push   $0x2
    3c77:	e8 c4 08 00 00       	call   4540 <printf>
      num_chars, strlen(test_strings[INTEGER_TEST]));
    exit(exit_error);
    3c7c:	83 c4 14             	add    $0x14,%esp
    3c7f:	6a ff                	push   $0xffffffff
    3c81:	e8 02 07 00 00       	call   4388 <exit>
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[STRING_NULL_TEST], 0);
  if (num_chars != strlen(test_strings[STRING_NULL_TEST])) {
    printf(2, "printftest failed on STRING_NULL_TEST string. Expected size = %d, got = %d\n",
    3c86:	83 ec 0c             	sub    $0xc,%esp
    3c89:	68 ad 5a 00 00       	push   $0x5aad
    3c8e:	e8 6d 03 00 00       	call   4000 <strlen>
    3c93:	50                   	push   %eax
    3c94:	53                   	push   %ebx
    3c95:	68 70 64 00 00       	push   $0x6470
    3c9a:	eb d9                	jmp    3c75 <printftest+0x175>
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[UNKNOWN_TYPE_TEST]);
  if (num_chars != strlen(test_strings[UNKNOWN_TYPE_TEST])) {
    printf(2, "printftest failed on UNKNOWN_TYPE_TEST string. Expected size = %d, got = %d\n",
    3c9c:	83 ec 0c             	sub    $0xc,%esp
    3c9f:	68 0a 5a 00 00       	push   $0x5a0a
    3ca4:	e8 57 03 00 00       	call   4000 <strlen>
    3ca9:	50                   	push   %eax
    3caa:	53                   	push   %ebx
    3cab:	68 20 64 00 00       	push   $0x6420
    3cb0:	eb c3                	jmp    3c75 <printftest+0x175>
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[PERCENT_TEST]);
  if (num_chars != strlen(test_strings[PERCENT_TEST])) {
    printf(2, "printftest failed on PERCENT_TEST string. Expected size = %d, got = %d\n",
    3cb2:	83 ec 0c             	sub    $0xc,%esp
    3cb5:	68 95 5a 00 00       	push   $0x5a95
    3cba:	e8 41 03 00 00       	call   4000 <strlen>
    3cbf:	50                   	push   %eax
    3cc0:	53                   	push   %ebx
    3cc1:	68 d8 63 00 00       	push   $0x63d8
    3cc6:	eb ad                	jmp    3c75 <printftest+0x175>
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[HEXA_TEST], 53);
  if (num_chars != strlen(test_strings[HEXA_TEST])) {
    printf(2, "printftest failed on HEXA_TEST string. Expected size = %d, got = %d\n",
    3cc8:	83 ec 0c             	sub    $0xc,%esp
    3ccb:	68 7d 5a 00 00       	push   $0x5a7d
    3cd0:	e8 2b 03 00 00       	call   4000 <strlen>
    3cd5:	50                   	push   %eax
    3cd6:	53                   	push   %ebx
    3cd7:	68 90 63 00 00       	push   $0x6390
    3cdc:	eb 97                	jmp    3c75 <printftest+0x175>
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[POINTER_TEST], test_fmts);
  if (num_chars != strlen(test_strings[POINTER_TEST])) {
    printf(2, "printftest failed on POINTER_TEST string. Expected size = %d, got = %d\n",
    3cde:	83 ec 0c             	sub    $0xc,%esp
    3ce1:	68 61 5a 00 00       	push   $0x5a61
    3ce6:	e8 15 03 00 00       	call   4000 <strlen>
    3ceb:	50                   	push   %eax
    3cec:	53                   	push   %ebx
    3ced:	68 48 63 00 00       	push   $0x6348
    3cf2:	eb 81                	jmp    3c75 <printftest+0x175>
    exit(exit_error);
  }

  num_chars = printf(1, test_fmts[INTEGER_TEST], 53);
  if (num_chars != strlen(test_strings[INTEGER_TEST])) {
    printf(2, "printftest failed on INTEGER_TEST string. Expected size = %d, got = %d\n",
    3cf4:	83 ec 0c             	sub    $0xc,%esp
    3cf7:	68 48 5a 00 00       	push   $0x5a48
    3cfc:	e8 ff 02 00 00       	call   4000 <strlen>
    3d01:	50                   	push   %eax
    3d02:	53                   	push   %ebx
    3d03:	68 00 63 00 00       	push   $0x6300
    3d08:	e9 68 ff ff ff       	jmp    3c75 <printftest+0x175>
    3d0d:	8d 76 00             	lea    0x0(%esi),%esi

00003d10 <exitrctest>:
  printf(1, "printftest passed\n");
}

void
exitrctest()
{
    3d10:	55                   	push   %ebp
    3d11:	89 e5                	mov    %esp,%ebp
    3d13:	83 ec 18             	sub    $0x18,%esp
  int exit_code = 501;
  int pid = fork();
    3d16:	e8 65 06 00 00       	call   4380 <fork>
  if (pid == 0) {
    3d1b:	85 c0                	test   %eax,%eax
    3d1d:	74 30                	je     3d4f <exitrctest+0x3f>
    exit(exit_code);
  }
  int wstatus;
  wait(&wstatus);
    3d1f:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3d22:	83 ec 0c             	sub    $0xc,%esp
    3d25:	50                   	push   %eax
    3d26:	e8 65 06 00 00       	call   4390 <wait>
  if (WEXITSTATUS(wstatus) != exit_code) {
    3d2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d2e:	83 c4 10             	add    $0x10,%esp
    3d31:	c1 f8 08             	sar    $0x8,%eax
    3d34:	3d f5 01 00 00       	cmp    $0x1f5,%eax
    3d39:	75 21                	jne    3d5c <exitrctest+0x4c>
    printf(2, "exitrctest: ERROR - failed to get correct exit status\n");
    exit(1);
  } else {
    printf(1, "exitrctest ok\n");
    3d3b:	83 ec 08             	sub    $0x8,%esp
    3d3e:	68 dc 5a 00 00       	push   $0x5adc
    3d43:	6a 01                	push   $0x1
    3d45:	e8 f6 07 00 00       	call   4540 <printf>
  }
}
    3d4a:	83 c4 10             	add    $0x10,%esp
    3d4d:	c9                   	leave  
    3d4e:	c3                   	ret    
exitrctest()
{
  int exit_code = 501;
  int pid = fork();
  if (pid == 0) {
    exit(exit_code);
    3d4f:	83 ec 0c             	sub    $0xc,%esp
    3d52:	68 f5 01 00 00       	push   $0x1f5
    3d57:	e8 2c 06 00 00       	call   4388 <exit>
  }
  int wstatus;
  wait(&wstatus);
  if (WEXITSTATUS(wstatus) != exit_code) {
    printf(2, "exitrctest: ERROR - failed to get correct exit status\n");
    3d5c:	50                   	push   %eax
    3d5d:	50                   	push   %eax
    3d5e:	68 bc 64 00 00       	push   $0x64bc
    3d63:	6a 02                	push   $0x2
    3d65:	e8 d6 07 00 00       	call   4540 <printf>
    exit(1);
    3d6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3d71:	e8 12 06 00 00       	call   4388 <exit>
    3d76:	8d 76 00             	lea    0x0(%esi),%esi
    3d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003d80 <memtest>:
  }
}

void
memtest()
{
    3d80:	55                   	push   %ebp
    3d81:	89 e5                	mov    %esp,%ebp
    3d83:	83 ec 08             	sub    $0x8,%esp
  if (kmemtest()) {
    3d86:	e8 ed 06 00 00       	call   4478 <kmemtest>
    3d8b:	85 c0                	test   %eax,%eax
    3d8d:	75 14                	jne    3da3 <memtest+0x23>
    printf(2, "memtest: memory corruption\n");
    exit(1);
  }
  printf(1, "memtest: memory ok\n");
    3d8f:	83 ec 08             	sub    $0x8,%esp
    3d92:	68 07 5b 00 00       	push   $0x5b07
    3d97:	6a 01                	push   $0x1
    3d99:	e8 a2 07 00 00       	call   4540 <printf>
}
    3d9e:	83 c4 10             	add    $0x10,%esp
    3da1:	c9                   	leave  
    3da2:	c3                   	ret    

void
memtest()
{
  if (kmemtest()) {
    printf(2, "memtest: memory corruption\n");
    3da3:	50                   	push   %eax
    3da4:	50                   	push   %eax
    3da5:	68 eb 5a 00 00       	push   $0x5aeb
    3daa:	6a 02                	push   $0x2
    3dac:	e8 8f 07 00 00       	call   4540 <printf>
    exit(1);
    3db1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3db8:	e8 cb 05 00 00       	call   4388 <exit>
    3dbd:	66 90                	xchg   %ax,%ax
    3dbf:	90                   	nop

00003dc0 <main>:
  printf(1, "memtest: memory ok\n");
}

int
main(int argc, char *argv[])
{
    3dc0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3dc4:	83 e4 f0             	and    $0xfffffff0,%esp
    3dc7:	ff 71 fc             	pushl  -0x4(%ecx)
    3dca:	55                   	push   %ebp
    3dcb:	89 e5                	mov    %esp,%ebp
    3dcd:	51                   	push   %ecx
    3dce:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
    3dd1:	68 1b 5b 00 00       	push   $0x5b1b
    3dd6:	6a 01                	push   $0x1
    3dd8:	e8 63 07 00 00       	call   4540 <printf>

  if(open("usertests.ran", 0) >= 0){
    3ddd:	5a                   	pop    %edx
    3dde:	59                   	pop    %ecx
    3ddf:	6a 00                	push   $0x0
    3de1:	68 2f 5b 00 00       	push   $0x5b2f
    3de6:	e8 dd 05 00 00       	call   43c8 <open>
    3deb:	83 c4 10             	add    $0x10,%esp
    3dee:	85 c0                	test   %eax,%eax
    3df0:	0f 89 e0 00 00 00    	jns    3ed6 <main+0x116>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    exit(1);
  }
  close(open("usertests.ran", O_CREATE));
    3df6:	83 ec 08             	sub    $0x8,%esp
    3df9:	68 00 02 00 00       	push   $0x200
    3dfe:	68 2f 5b 00 00       	push   $0x5b2f
    3e03:	e8 c0 05 00 00       	call   43c8 <open>
    3e08:	89 04 24             	mov    %eax,(%esp)
    3e0b:	e8 a0 05 00 00       	call   43b0 <close>

  printftest();
    3e10:	e8 eb fc ff ff       	call   3b00 <printftest>

  argptest();
    3e15:	e8 56 fc ff ff       	call   3a70 <argptest>
  createdelete();
    3e1a:	e8 91 d4 ff ff       	call   12b0 <createdelete>
  linkunlink();
    3e1f:	e8 2c de ff ff       	call   1c50 <linkunlink>
  concreate();
    3e24:	e8 e7 da ff ff       	call   1910 <concreate>
  fourfiles();
    3e29:	e8 42 d2 ff ff       	call   1070 <fourfiles>
  sharedfd();
    3e2e:	e8 7d d0 ff ff       	call   eb0 <sharedfd>

  bigargtest();
    3e33:	e8 98 f8 ff ff       	call   36d0 <bigargtest>
  bigwrite();
    3e38:	e8 53 e8 ff ff       	call   2690 <bigwrite>
  bigargtest();
    3e3d:	e8 8e f8 ff ff       	call   36d0 <bigargtest>
  bsstest();
    3e42:	e8 09 f8 ff ff       	call   3650 <bsstest>
  sbrktest();
    3e47:	e8 94 f2 ff ff       	call   30e0 <sbrktest>
  validatetest();
    3e4c:	e8 3f f7 ff ff       	call   3590 <validatetest>

  opentest();
    3e51:	e8 0a c5 ff ff       	call   360 <opentest>
  writetest();
    3e56:	e8 a5 c5 ff ff       	call   400 <writetest>
  writetest1();
    3e5b:	e8 b0 c7 ff ff       	call   610 <writetest1>
  createtest();
    3e60:	e8 ab c9 ff ff       	call   810 <createtest>

  openiputtest();
    3e65:	e8 c6 c3 ff ff       	call   230 <openiputtest>
  exitiputtest();
    3e6a:	e8 91 c2 ff ff       	call   100 <exitiputtest>
  iputtest();
    3e6f:	e8 8c c1 ff ff       	call   0 <iputtest>

  mem();
    3e74:	e8 57 cf ff ff       	call   dd0 <mem>
  pipe1();
    3e79:	e8 a2 cb ff ff       	call   a20 <pipe1>
  preempt();
    3e7e:	e8 5d cd ff ff       	call   be0 <preempt>
  exitwait();
    3e83:	e8 a8 ce ff ff       	call   d30 <exitwait>

  rmdot();
    3e88:	e8 53 ec ff ff       	call   2ae0 <rmdot>
  fourteen();
    3e8d:	e8 ee ea ff ff       	call   2980 <fourteen>
  bigfile();
    3e92:	e8 e9 e8 ff ff       	call   2780 <bigfile>
  subdir();
    3e97:	e8 14 e0 ff ff       	call   1eb0 <subdir>
  linktest();
    3e9c:	e8 1f d8 ff ff       	call   16c0 <linktest>
  unlinkread();
    3ea1:	e8 5a d6 ff ff       	call   1500 <unlinkread>
  dirfile();
    3ea6:	e8 e5 ed ff ff       	call   2c90 <dirfile>
  iref();
    3eab:	e8 20 f0 ff ff       	call   2ed0 <iref>
  forktest();
    3eb0:	e8 4b f1 ff ff       	call   3000 <forktest>
  bigdir(); // slow
    3eb5:	e8 a6 de ff ff       	call   1d60 <bigdir>
  memtest();
    3eba:	e8 c1 fe ff ff       	call   3d80 <memtest>

  uio();
    3ebf:	e8 1c fb ff ff       	call   39e0 <uio>
  exitrctest();
    3ec4:	e8 47 fe ff ff       	call   3d10 <exitrctest>
  return(exectest());
    3ec9:	e8 f2 ca ff ff       	call   9c0 <exectest>
}
    3ece:	8b 4d fc             	mov    -0x4(%ebp),%ecx
    3ed1:	c9                   	leave  
    3ed2:	8d 61 fc             	lea    -0x4(%ecx),%esp
    3ed5:	c3                   	ret    
main(int argc, char *argv[])
{
  printf(1, "usertests starting\n");

  if(open("usertests.ran", 0) >= 0){
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3ed6:	50                   	push   %eax
    3ed7:	50                   	push   %eax
    3ed8:	68 f4 64 00 00       	push   $0x64f4
    3edd:	6a 01                	push   $0x1
    3edf:	e8 5c 06 00 00       	call   4540 <printf>
    exit(1);
    3ee4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3eeb:	e8 98 04 00 00       	call   4388 <exit>

00003ef0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3ef0:	55                   	push   %ebp
    3ef1:	89 e5                	mov    %esp,%ebp
    3ef3:	53                   	push   %ebx
    3ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    3ef7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3efa:	89 c2                	mov    %eax,%edx
    3efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3f00:	83 c1 01             	add    $0x1,%ecx
    3f03:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3f07:	83 c2 01             	add    $0x1,%edx
    3f0a:	84 db                	test   %bl,%bl
    3f0c:	88 5a ff             	mov    %bl,-0x1(%edx)
    3f0f:	75 ef                	jne    3f00 <strcpy+0x10>
    ;
  return os;
}
    3f11:	5b                   	pop    %ebx
    3f12:	5d                   	pop    %ebp
    3f13:	c3                   	ret    
    3f14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3f1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003f20 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3f20:	55                   	push   %ebp
    3f21:	89 e5                	mov    %esp,%ebp
    3f23:	56                   	push   %esi
    3f24:	53                   	push   %ebx
    3f25:	8b 55 08             	mov    0x8(%ebp),%edx
    3f28:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    3f2b:	0f b6 02             	movzbl (%edx),%eax
    3f2e:	0f b6 19             	movzbl (%ecx),%ebx
    3f31:	84 c0                	test   %al,%al
    3f33:	75 1e                	jne    3f53 <strcmp+0x33>
    3f35:	eb 29                	jmp    3f60 <strcmp+0x40>
    3f37:	89 f6                	mov    %esi,%esi
    3f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3f40:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3f43:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3f46:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3f49:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    3f4d:	84 c0                	test   %al,%al
    3f4f:	74 0f                	je     3f60 <strcmp+0x40>
    3f51:	89 f1                	mov    %esi,%ecx
    3f53:	38 d8                	cmp    %bl,%al
    3f55:	74 e9                	je     3f40 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3f57:	29 d8                	sub    %ebx,%eax
}
    3f59:	5b                   	pop    %ebx
    3f5a:	5e                   	pop    %esi
    3f5b:	5d                   	pop    %ebp
    3f5c:	c3                   	ret    
    3f5d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3f60:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3f62:	29 d8                	sub    %ebx,%eax
}
    3f64:	5b                   	pop    %ebx
    3f65:	5e                   	pop    %esi
    3f66:	5d                   	pop    %ebp
    3f67:	c3                   	ret    
    3f68:	90                   	nop
    3f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003f70 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
    3f70:	55                   	push   %ebp
    3f71:	89 e5                	mov    %esp,%ebp
    3f73:	57                   	push   %edi
    3f74:	56                   	push   %esi
    3f75:	8b 55 08             	mov    0x8(%ebp),%edx
    3f78:	53                   	push   %ebx
    3f79:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
    3f7c:	0f b6 32             	movzbl (%edx),%esi
    3f7f:	89 f0                	mov    %esi,%eax
    3f81:	84 c0                	test   %al,%al
    3f83:	74 67                	je     3fec <strncmp+0x7c>
    3f85:	0f b6 19             	movzbl (%ecx),%ebx
    3f88:	89 f0                	mov    %esi,%eax
    3f8a:	38 d8                	cmp    %bl,%al
    3f8c:	75 65                	jne    3ff3 <strncmp+0x83>
    3f8e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3f91:	89 f0                	mov    %esi,%eax
    3f93:	0f b6 f0             	movzbl %al,%esi
    3f96:	89 f0                	mov    %esi,%eax
    3f98:	83 eb 01             	sub    $0x1,%ebx
    3f9b:	75 14                	jne    3fb1 <strncmp+0x41>
    3f9d:	eb 25                	jmp    3fc4 <strncmp+0x54>
    3f9f:	90                   	nop
    3fa0:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
    3fa4:	89 f1                	mov    %esi,%ecx
    3fa6:	38 c8                	cmp    %cl,%al
    3fa8:	75 26                	jne    3fd0 <strncmp+0x60>
    3faa:	83 eb 01             	sub    $0x1,%ebx
    3fad:	89 f9                	mov    %edi,%ecx
    3faf:	74 2f                	je     3fe0 <strncmp+0x70>
    p++, q++;
    3fb1:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    3fb4:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3fb7:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    3fba:	84 c0                	test   %al,%al
    3fbc:	75 e2                	jne    3fa0 <strncmp+0x30>
    3fbe:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
    3fc2:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
    3fc4:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3fc5:	29 f0                	sub    %esi,%eax
}
    3fc7:	5e                   	pop    %esi
    3fc8:	5f                   	pop    %edi
    3fc9:	5d                   	pop    %ebp
    3fca:	c3                   	ret    
    3fcb:	90                   	nop
    3fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3fd0:	0f b6 f1             	movzbl %cl,%esi
    3fd3:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3fd4:	29 f0                	sub    %esi,%eax
}
    3fd6:	5e                   	pop    %esi
    3fd7:	5f                   	pop    %edi
    3fd8:	5d                   	pop    %ebp
    3fd9:	c3                   	ret    
    3fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3fe0:	0f b6 f0             	movzbl %al,%esi
    3fe3:	89 f0                	mov    %esi,%eax
    3fe5:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3fe6:	29 f0                	sub    %esi,%eax
}
    3fe8:	5e                   	pop    %esi
    3fe9:	5f                   	pop    %edi
    3fea:	5d                   	pop    %ebp
    3feb:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    3fec:	31 c0                	xor    %eax,%eax
    3fee:	0f b6 31             	movzbl (%ecx),%esi
    3ff1:	eb d1                	jmp    3fc4 <strncmp+0x54>
    3ff3:	0f b6 c0             	movzbl %al,%eax
    3ff6:	0f b6 f3             	movzbl %bl,%esi
    3ff9:	eb c9                	jmp    3fc4 <strncmp+0x54>
    3ffb:	90                   	nop
    3ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004000 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
    4000:	55                   	push   %ebp
    4001:	89 e5                	mov    %esp,%ebp
    4003:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    4006:	80 39 00             	cmpb   $0x0,(%ecx)
    4009:	74 12                	je     401d <strlen+0x1d>
    400b:	31 d2                	xor    %edx,%edx
    400d:	8d 76 00             	lea    0x0(%esi),%esi
    4010:	83 c2 01             	add    $0x1,%edx
    4013:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    4017:	89 d0                	mov    %edx,%eax
    4019:	75 f5                	jne    4010 <strlen+0x10>
    ;
  return n;
}
    401b:	5d                   	pop    %ebp
    401c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    401d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    401f:	5d                   	pop    %ebp
    4020:	c3                   	ret    
    4021:	eb 0d                	jmp    4030 <memset>
    4023:	90                   	nop
    4024:	90                   	nop
    4025:	90                   	nop
    4026:	90                   	nop
    4027:	90                   	nop
    4028:	90                   	nop
    4029:	90                   	nop
    402a:	90                   	nop
    402b:	90                   	nop
    402c:	90                   	nop
    402d:	90                   	nop
    402e:	90                   	nop
    402f:	90                   	nop

00004030 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4030:	55                   	push   %ebp
    4031:	89 e5                	mov    %esp,%ebp
    4033:	57                   	push   %edi
    4034:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    4037:	8b 4d 10             	mov    0x10(%ebp),%ecx
    403a:	8b 45 0c             	mov    0xc(%ebp),%eax
    403d:	89 d7                	mov    %edx,%edi
    403f:	fc                   	cld    
    4040:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    4042:	89 d0                	mov    %edx,%eax
    4044:	5f                   	pop    %edi
    4045:	5d                   	pop    %ebp
    4046:	c3                   	ret    
    4047:	89 f6                	mov    %esi,%esi
    4049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004050 <strchr>:

char*
strchr(const char *s, char c)
{
    4050:	55                   	push   %ebp
    4051:	89 e5                	mov    %esp,%ebp
    4053:	53                   	push   %ebx
    4054:	8b 45 08             	mov    0x8(%ebp),%eax
    4057:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    405a:	0f b6 10             	movzbl (%eax),%edx
    405d:	84 d2                	test   %dl,%dl
    405f:	74 1d                	je     407e <strchr+0x2e>
    if(*s == c)
    4061:	38 d3                	cmp    %dl,%bl
    4063:	89 d9                	mov    %ebx,%ecx
    4065:	75 0d                	jne    4074 <strchr+0x24>
    4067:	eb 17                	jmp    4080 <strchr+0x30>
    4069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4070:	38 ca                	cmp    %cl,%dl
    4072:	74 0c                	je     4080 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4074:	83 c0 01             	add    $0x1,%eax
    4077:	0f b6 10             	movzbl (%eax),%edx
    407a:	84 d2                	test   %dl,%dl
    407c:	75 f2                	jne    4070 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    407e:	31 c0                	xor    %eax,%eax
}
    4080:	5b                   	pop    %ebx
    4081:	5d                   	pop    %ebp
    4082:	c3                   	ret    
    4083:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004090 <gets>:

char*
gets(char *buf, int max)
{
    4090:	55                   	push   %ebp
    4091:	89 e5                	mov    %esp,%ebp
    4093:	57                   	push   %edi
    4094:	56                   	push   %esi
    4095:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    4096:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4099:	31 db                	xor    %ebx,%ebx
    409b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    40a0:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    40a3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    40a6:	7d 30                	jge    40d8 <gets+0x48>
    cc = read(0, &c, 1);
    40a8:	83 ec 04             	sub    $0x4,%esp
    40ab:	6a 01                	push   $0x1
    40ad:	56                   	push   %esi
    40ae:	6a 00                	push   $0x0
    40b0:	e8 eb 02 00 00       	call   43a0 <read>
    if(cc < 1)
    40b5:	83 c4 10             	add    $0x10,%esp
    40b8:	85 c0                	test   %eax,%eax
    40ba:	7e e7                	jle    40a3 <gets+0x13>
      continue;
    buf[i++] = c;
    40bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    40c0:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    40c3:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    40c5:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    40c8:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    40ca:	74 0c                	je     40d8 <gets+0x48>
    40cc:	3c 0d                	cmp    $0xd,%al
    40ce:	74 08                	je     40d8 <gets+0x48>
    40d0:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    40d3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    40d6:	7c d0                	jl     40a8 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    40d8:	8b 45 08             	mov    0x8(%ebp),%eax
    40db:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    40df:	8d 65 f4             	lea    -0xc(%ebp),%esp
    40e2:	5b                   	pop    %ebx
    40e3:	5e                   	pop    %esi
    40e4:	5f                   	pop    %edi
    40e5:	5d                   	pop    %ebp
    40e6:	c3                   	ret    
    40e7:	89 f6                	mov    %esi,%esi
    40e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000040f0 <stat>:

int
stat(const char *n, struct stat *st)
{
    40f0:	55                   	push   %ebp
    40f1:	89 e5                	mov    %esp,%ebp
    40f3:	56                   	push   %esi
    40f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    40f5:	83 ec 08             	sub    $0x8,%esp
    40f8:	6a 00                	push   $0x0
    40fa:	ff 75 08             	pushl  0x8(%ebp)
    40fd:	e8 c6 02 00 00       	call   43c8 <open>
  if(fd < 0)
    4102:	83 c4 10             	add    $0x10,%esp
    4105:	85 c0                	test   %eax,%eax
    4107:	78 27                	js     4130 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    4109:	83 ec 08             	sub    $0x8,%esp
    410c:	ff 75 0c             	pushl  0xc(%ebp)
    410f:	89 c3                	mov    %eax,%ebx
    4111:	50                   	push   %eax
    4112:	e8 c9 02 00 00       	call   43e0 <fstat>
    4117:	89 c6                	mov    %eax,%esi
  close(fd);
    4119:	89 1c 24             	mov    %ebx,(%esp)
    411c:	e8 8f 02 00 00       	call   43b0 <close>
  return r;
    4121:	83 c4 10             	add    $0x10,%esp
    4124:	89 f0                	mov    %esi,%eax
}
    4126:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4129:	5b                   	pop    %ebx
    412a:	5e                   	pop    %esi
    412b:	5d                   	pop    %ebp
    412c:	c3                   	ret    
    412d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    4130:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4135:	eb ef                	jmp    4126 <stat+0x36>
    4137:	89 f6                	mov    %esi,%esi
    4139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004140 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    4140:	55                   	push   %ebp
    4141:	89 e5                	mov    %esp,%ebp
    4143:	53                   	push   %ebx
    4144:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4147:	0f be 11             	movsbl (%ecx),%edx
    414a:	8d 42 d0             	lea    -0x30(%edx),%eax
    414d:	3c 09                	cmp    $0x9,%al
    414f:	b8 00 00 00 00       	mov    $0x0,%eax
    4154:	77 1f                	ja     4175 <atoi+0x35>
    4156:	8d 76 00             	lea    0x0(%esi),%esi
    4159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    4160:	8d 04 80             	lea    (%eax,%eax,4),%eax
    4163:	83 c1 01             	add    $0x1,%ecx
    4166:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    416a:	0f be 11             	movsbl (%ecx),%edx
    416d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    4170:	80 fb 09             	cmp    $0x9,%bl
    4173:	76 eb                	jbe    4160 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    4175:	5b                   	pop    %ebx
    4176:	5d                   	pop    %ebp
    4177:	c3                   	ret    
    4178:	90                   	nop
    4179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004180 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    4180:	55                   	push   %ebp
    4181:	89 e5                	mov    %esp,%ebp
    4183:	56                   	push   %esi
    4184:	53                   	push   %ebx
    4185:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4188:	8b 45 08             	mov    0x8(%ebp),%eax
    418b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    418e:	85 db                	test   %ebx,%ebx
    4190:	7e 14                	jle    41a6 <memmove+0x26>
    4192:	31 d2                	xor    %edx,%edx
    4194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    4198:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    419c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    419f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    41a2:	39 da                	cmp    %ebx,%edx
    41a4:	75 f2                	jne    4198 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    41a6:	5b                   	pop    %ebx
    41a7:	5e                   	pop    %esi
    41a8:	5d                   	pop    %ebp
    41a9:	c3                   	ret    
    41aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000041b0 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    41b0:	55                   	push   %ebp
    41b1:	89 e5                	mov    %esp,%ebp
    41b3:	57                   	push   %edi
    41b4:	56                   	push   %esi
    41b5:	53                   	push   %ebx
    41b6:	83 ec 04             	sub    $0x4,%esp
    41b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
    41bc:	83 f9 00             	cmp    $0x0,%ecx
    41bf:	7e 76                	jle    4237 <itoa+0x87>
    41c1:	89 cb                	mov    %ecx,%ebx
    41c3:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
    41c5:	bf 67 66 66 66       	mov    $0x66666667,%edi
    41ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    41d0:	89 d8                	mov    %ebx,%eax
    41d2:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
    41d5:	83 c6 01             	add    $0x1,%esi
        i /= 10;
    41d8:	f7 ef                	imul   %edi
    41da:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
    41dd:	29 da                	sub    %ebx,%edx
    41df:	89 d3                	mov    %edx,%ebx
    41e1:	75 ed                	jne    41d0 <itoa+0x20>
        length++;
    41e3:	89 f3                	mov    %esi,%ebx
    41e5:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
    41e8:	bf 67 66 66 66       	mov    $0x66666667,%edi
    41ed:	8b 75 08             	mov    0x8(%ebp),%esi
    41f0:	eb 0a                	jmp    41fc <itoa+0x4c>
    41f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    41f8:	85 db                	test   %ebx,%ebx
    41fa:	7e 25                	jle    4221 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
    41fc:	89 c8                	mov    %ecx,%eax
    41fe:	f7 ef                	imul   %edi
    4200:	89 c8                	mov    %ecx,%eax
    4202:	c1 f8 1f             	sar    $0x1f,%eax
    4205:	c1 fa 02             	sar    $0x2,%edx
    4208:	29 c2                	sub    %eax,%edx
    420a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    420d:	01 c0                	add    %eax,%eax
    420f:	29 c1                	sub    %eax,%ecx
    4211:	83 c1 30             	add    $0x30,%ecx
    4214:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    4218:	83 eb 01             	sub    $0x1,%ebx
    421b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    421d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    421f:	7f d7                	jg     41f8 <itoa+0x48>
    4221:	8b 75 f0             	mov    -0x10(%ebp),%esi
    4224:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
    4226:	8b 7d 08             	mov    0x8(%ebp),%edi
    4229:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
    422d:	83 c4 04             	add    $0x4,%esp
    4230:	89 f0                	mov    %esi,%eax
    4232:	5b                   	pop    %ebx
    4233:	5e                   	pop    %esi
    4234:	5f                   	pop    %edi
    4235:	5d                   	pop    %ebp
    4236:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
    4237:	75 12                	jne    424b <itoa+0x9b>
        buf[0] = '0';
    4239:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
    423c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
    4241:	c6 00 30             	movb   $0x30,(%eax)
    4244:	b8 01 00 00 00       	mov    $0x1,%eax
    4249:	eb db                	jmp    4226 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
    424b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
    424d:	31 f6                	xor    %esi,%esi
    424f:	eb d5                	jmp    4226 <itoa+0x76>
    4251:	eb 0d                	jmp    4260 <strcat>
    4253:	90                   	nop
    4254:	90                   	nop
    4255:	90                   	nop
    4256:	90                   	nop
    4257:	90                   	nop
    4258:	90                   	nop
    4259:	90                   	nop
    425a:	90                   	nop
    425b:	90                   	nop
    425c:	90                   	nop
    425d:	90                   	nop
    425e:	90                   	nop
    425f:	90                   	nop

00004260 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
    4260:	55                   	push   %ebp
    4261:	89 e5                	mov    %esp,%ebp
    4263:	57                   	push   %edi
    4264:	56                   	push   %esi
    4265:	8b 45 08             	mov    0x8(%ebp),%eax
    4268:	53                   	push   %ebx
    4269:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
    426c:	80 38 00             	cmpb   $0x0,(%eax)
    426f:	74 38                	je     42a9 <strcat+0x49>
    4271:	31 c9                	xor    %ecx,%ecx
    4273:	90                   	nop
    4274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4278:	83 c1 01             	add    $0x1,%ecx
    427b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
    427f:	89 ca                	mov    %ecx,%edx
    4281:	75 f5                	jne    4278 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
    4283:	0f b6 1e             	movzbl (%esi),%ebx
    4286:	84 db                	test   %bl,%bl
    4288:	74 16                	je     42a0 <strcat+0x40>
    428a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
    428d:	31 d2                	xor    %edx,%edx
    428f:	90                   	nop
                dest[i + j] = source[j];
    4290:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
    4293:	83 c2 01             	add    $0x1,%edx
    4296:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
    429a:	84 db                	test   %bl,%bl
    429c:	75 f2                	jne    4290 <strcat+0x30>
    429e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
    42a0:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
    42a4:	5b                   	pop    %ebx
    42a5:	5e                   	pop    %esi
    42a6:	5f                   	pop    %edi
    42a7:	5d                   	pop    %ebp
    42a8:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
    42a9:	31 d2                	xor    %edx,%edx
    42ab:	31 c9                	xor    %ecx,%ecx
    42ad:	eb d4                	jmp    4283 <strcat+0x23>
    42af:	90                   	nop

000042b0 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
    42b0:	55                   	push   %ebp
    42b1:	89 e5                	mov    %esp,%ebp
    42b3:	57                   	push   %edi
    42b4:	56                   	push   %esi
    42b5:	53                   	push   %ebx
    42b6:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    42b9:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
    42bc:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    42bf:	0f b6 00             	movzbl (%eax),%eax
    42c2:	84 c0                	test   %al,%al
    42c4:	88 45 f3             	mov    %al,-0xd(%ebp)
    42c7:	0f 84 a0 00 00 00    	je     436d <strstr+0xbd>
    42cd:	8b 55 0c             	mov    0xc(%ebp),%edx
    42d0:	31 c0                	xor    %eax,%eax
    42d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    42d8:	83 c0 01             	add    $0x1,%eax
    42db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    42df:	75 f7                	jne    42d8 <strstr+0x28>
    42e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    42e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    42e7:	0f b6 07             	movzbl (%edi),%eax
    42ea:	84 c0                	test   %al,%al
    42ec:	74 68                	je     4356 <strstr+0xa6>
    42ee:	31 d2                	xor    %edx,%edx
    42f0:	83 c2 01             	add    $0x1,%edx
    42f3:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
    42f7:	75 f7                	jne    42f0 <strstr+0x40>
    42f9:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    42fc:	84 c0                	test   %al,%al
    42fe:	89 5d ec             	mov    %ebx,-0x14(%ebp)
    4301:	74 4d                	je     4350 <strstr+0xa0>
    4303:	90                   	nop
    4304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4308:	38 45 f3             	cmp    %al,-0xd(%ebp)
    430b:	75 34                	jne    4341 <strstr+0x91>
    430d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
    4310:	83 eb 01             	sub    $0x1,%ebx
    4313:	74 4b                	je     4360 <strstr+0xb0>
    4315:	8b 55 0c             	mov    0xc(%ebp),%edx
    4318:	89 f8                	mov    %edi,%eax
    431a:	eb 10                	jmp    432c <strstr+0x7c>
    431c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4320:	3a 4a 01             	cmp    0x1(%edx),%cl
    4323:	75 1c                	jne    4341 <strstr+0x91>
    4325:	83 eb 01             	sub    $0x1,%ebx
    4328:	89 f2                	mov    %esi,%edx
    432a:	74 34                	je     4360 <strstr+0xb0>
    p++, q++;
    432c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    432f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
    4332:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    4335:	84 c9                	test   %cl,%cl
    4337:	75 e7                	jne    4320 <strstr+0x70>
    4339:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    433d:	84 c0                	test   %al,%al
    433f:	74 1f                	je     4360 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
    4341:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
    4344:	3b 7d ec             	cmp    -0x14(%ebp),%edi
    4347:	74 0d                	je     4356 <strstr+0xa6>
    4349:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    434c:	84 c0                	test   %al,%al
    434e:	75 b8                	jne    4308 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    4350:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    4354:	eb e7                	jmp    433d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
    4356:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
    4359:	31 c0                	xor    %eax,%eax
}
    435b:	5b                   	pop    %ebx
    435c:	5e                   	pop    %esi
    435d:	5f                   	pop    %edi
    435e:	5d                   	pop    %ebp
    435f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
    4360:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
    4363:	83 c4 10             	add    $0x10,%esp
    4366:	5b                   	pop    %ebx
    4367:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
    4368:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
    436a:	5f                   	pop    %edi
    436b:	5d                   	pop    %ebp
    436c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    436d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4374:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    437b:	e9 67 ff ff ff       	jmp    42e7 <strstr+0x37>

00004380 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4380:	b8 01 00 00 00       	mov    $0x1,%eax
    4385:	cd 40                	int    $0x40
    4387:	c3                   	ret    

00004388 <exit>:
SYSCALL(exit)
    4388:	b8 02 00 00 00       	mov    $0x2,%eax
    438d:	cd 40                	int    $0x40
    438f:	c3                   	ret    

00004390 <wait>:
SYSCALL(wait)
    4390:	b8 03 00 00 00       	mov    $0x3,%eax
    4395:	cd 40                	int    $0x40
    4397:	c3                   	ret    

00004398 <pipe>:
SYSCALL(pipe)
    4398:	b8 04 00 00 00       	mov    $0x4,%eax
    439d:	cd 40                	int    $0x40
    439f:	c3                   	ret    

000043a0 <read>:
SYSCALL(read)
    43a0:	b8 05 00 00 00       	mov    $0x5,%eax
    43a5:	cd 40                	int    $0x40
    43a7:	c3                   	ret    

000043a8 <write>:
SYSCALL(write)
    43a8:	b8 10 00 00 00       	mov    $0x10,%eax
    43ad:	cd 40                	int    $0x40
    43af:	c3                   	ret    

000043b0 <close>:
SYSCALL(close)
    43b0:	b8 15 00 00 00       	mov    $0x15,%eax
    43b5:	cd 40                	int    $0x40
    43b7:	c3                   	ret    

000043b8 <kill>:
SYSCALL(kill)
    43b8:	b8 06 00 00 00       	mov    $0x6,%eax
    43bd:	cd 40                	int    $0x40
    43bf:	c3                   	ret    

000043c0 <exec>:
SYSCALL(exec)
    43c0:	b8 07 00 00 00       	mov    $0x7,%eax
    43c5:	cd 40                	int    $0x40
    43c7:	c3                   	ret    

000043c8 <open>:
SYSCALL(open)
    43c8:	b8 0f 00 00 00       	mov    $0xf,%eax
    43cd:	cd 40                	int    $0x40
    43cf:	c3                   	ret    

000043d0 <mknod>:
SYSCALL(mknod)
    43d0:	b8 11 00 00 00       	mov    $0x11,%eax
    43d5:	cd 40                	int    $0x40
    43d7:	c3                   	ret    

000043d8 <unlink>:
SYSCALL(unlink)
    43d8:	b8 12 00 00 00       	mov    $0x12,%eax
    43dd:	cd 40                	int    $0x40
    43df:	c3                   	ret    

000043e0 <fstat>:
SYSCALL(fstat)
    43e0:	b8 08 00 00 00       	mov    $0x8,%eax
    43e5:	cd 40                	int    $0x40
    43e7:	c3                   	ret    

000043e8 <link>:
SYSCALL(link)
    43e8:	b8 13 00 00 00       	mov    $0x13,%eax
    43ed:	cd 40                	int    $0x40
    43ef:	c3                   	ret    

000043f0 <mkdir>:
SYSCALL(mkdir)
    43f0:	b8 14 00 00 00       	mov    $0x14,%eax
    43f5:	cd 40                	int    $0x40
    43f7:	c3                   	ret    

000043f8 <chdir>:
SYSCALL(chdir)
    43f8:	b8 09 00 00 00       	mov    $0x9,%eax
    43fd:	cd 40                	int    $0x40
    43ff:	c3                   	ret    

00004400 <dup>:
SYSCALL(dup)
    4400:	b8 0a 00 00 00       	mov    $0xa,%eax
    4405:	cd 40                	int    $0x40
    4407:	c3                   	ret    

00004408 <getpid>:
SYSCALL(getpid)
    4408:	b8 0b 00 00 00       	mov    $0xb,%eax
    440d:	cd 40                	int    $0x40
    440f:	c3                   	ret    

00004410 <sbrk>:
SYSCALL(sbrk)
    4410:	b8 0c 00 00 00       	mov    $0xc,%eax
    4415:	cd 40                	int    $0x40
    4417:	c3                   	ret    

00004418 <sleep>:
SYSCALL(sleep)
    4418:	b8 0d 00 00 00       	mov    $0xd,%eax
    441d:	cd 40                	int    $0x40
    441f:	c3                   	ret    

00004420 <uptime>:
SYSCALL(uptime)
    4420:	b8 0e 00 00 00       	mov    $0xe,%eax
    4425:	cd 40                	int    $0x40
    4427:	c3                   	ret    

00004428 <mount>:
SYSCALL(mount)
    4428:	b8 16 00 00 00       	mov    $0x16,%eax
    442d:	cd 40                	int    $0x40
    442f:	c3                   	ret    

00004430 <umount>:
SYSCALL(umount)
    4430:	b8 17 00 00 00       	mov    $0x17,%eax
    4435:	cd 40                	int    $0x40
    4437:	c3                   	ret    

00004438 <printmounts>:
SYSCALL(printmounts)
    4438:	b8 18 00 00 00       	mov    $0x18,%eax
    443d:	cd 40                	int    $0x40
    443f:	c3                   	ret    

00004440 <printdevices>:
SYSCALL(printdevices)
    4440:	b8 19 00 00 00       	mov    $0x19,%eax
    4445:	cd 40                	int    $0x40
    4447:	c3                   	ret    

00004448 <unshare>:
SYSCALL(unshare)
    4448:	b8 1a 00 00 00       	mov    $0x1a,%eax
    444d:	cd 40                	int    $0x40
    444f:	c3                   	ret    

00004450 <usleep>:
SYSCALL(usleep)
    4450:	b8 1b 00 00 00       	mov    $0x1b,%eax
    4455:	cd 40                	int    $0x40
    4457:	c3                   	ret    

00004458 <ioctl>:
SYSCALL(ioctl)
    4458:	b8 1c 00 00 00       	mov    $0x1c,%eax
    445d:	cd 40                	int    $0x40
    445f:	c3                   	ret    

00004460 <getppid>:
SYSCALL(getppid)
    4460:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4465:	cd 40                	int    $0x40
    4467:	c3                   	ret    

00004468 <getcpu>:
SYSCALL(getcpu)
    4468:	b8 1e 00 00 00       	mov    $0x1e,%eax
    446d:	cd 40                	int    $0x40
    446f:	c3                   	ret    

00004470 <getmem>:
SYSCALL(getmem)
    4470:	b8 1f 00 00 00       	mov    $0x1f,%eax
    4475:	cd 40                	int    $0x40
    4477:	c3                   	ret    

00004478 <kmemtest>:
SYSCALL(kmemtest)
    4478:	b8 20 00 00 00       	mov    $0x20,%eax
    447d:	cd 40                	int    $0x40
    447f:	c3                   	ret    

00004480 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    4480:	55                   	push   %ebp
    4481:	89 e5                	mov    %esp,%ebp
    4483:	57                   	push   %edi
    4484:	56                   	push   %esi
    4485:	53                   	push   %ebx
    4486:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    4489:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    448c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    448f:	85 db                	test   %ebx,%ebx
    4491:	0f 84 91 00 00 00    	je     4528 <printint+0xa8>
    4497:	89 d0                	mov    %edx,%eax
    4499:	c1 e8 1f             	shr    $0x1f,%eax
    449c:	84 c0                	test   %al,%al
    449e:	0f 84 84 00 00 00    	je     4528 <printint+0xa8>
    neg = 1;
    x = -xx;
    44a4:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    44a6:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    44ad:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
    44af:	31 ff                	xor    %edi,%edi
    44b1:	8d 75 c7             	lea    -0x39(%ebp),%esi
    44b4:	eb 0c                	jmp    44c2 <printint+0x42>
    44b6:	8d 76 00             	lea    0x0(%esi),%esi
    44b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
    44c0:	89 df                	mov    %ebx,%edi
    44c2:	31 d2                	xor    %edx,%edx
    44c4:	8d 5f 01             	lea    0x1(%edi),%ebx
    44c7:	f7 f1                	div    %ecx
    44c9:	0f b6 92 28 65 00 00 	movzbl 0x6528(%edx),%edx
  }while((x /= base) != 0);
    44d0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    44d2:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    44d5:	75 e9                	jne    44c0 <printint+0x40>
  if(neg)
    44d7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    44da:	85 c0                	test   %eax,%eax
    44dc:	74 08                	je     44e6 <printint+0x66>
    buf[i++] = '-';
    44de:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
    44e3:	8d 5f 02             	lea    0x2(%edi),%ebx
    44e6:	8d 7d d8             	lea    -0x28(%ebp),%edi
    44e9:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
    44ed:	89 fa                	mov    %edi,%edx
    44ef:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
    44f0:	0f b6 08             	movzbl (%eax),%ecx
    44f3:	83 e8 01             	sub    $0x1,%eax
    44f6:	83 c2 01             	add    $0x1,%edx
    44f9:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
    44fc:	39 f0                	cmp    %esi,%eax
    44fe:	75 f0                	jne    44f0 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
    4500:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
    4503:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
    4508:	57                   	push   %edi
    4509:	e8 f2 fa ff ff       	call   4000 <strlen>
    450e:	83 c4 0c             	add    $0xc,%esp
    4511:	50                   	push   %eax
    4512:	57                   	push   %edi
    4513:	ff 75 c0             	pushl  -0x40(%ebp)
    4516:	e8 8d fe ff ff       	call   43a8 <write>
}
    451b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    451e:	5b                   	pop    %ebx
    451f:	5e                   	pop    %esi
    4520:	5f                   	pop    %edi
    4521:	5d                   	pop    %ebp
    4522:	c3                   	ret    
    4523:	90                   	nop
    4524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    4528:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    452a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    4531:	e9 79 ff ff ff       	jmp    44af <printint+0x2f>
    4536:	8d 76 00             	lea    0x0(%esi),%esi
    4539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004540 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
    4540:	55                   	push   %ebp
    4541:	89 e5                	mov    %esp,%ebp
    4543:	57                   	push   %edi
    4544:	56                   	push   %esi
    4545:	53                   	push   %ebx
    4546:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4549:	8b 75 0c             	mov    0xc(%ebp),%esi
    454c:	0f b6 06             	movzbl (%esi),%eax
    454f:	84 c0                	test   %al,%al
    4551:	0f 84 90 01 00 00    	je     46e7 <printf+0x1a7>
    4557:	8d 5d 10             	lea    0x10(%ebp),%ebx
    455a:	31 ff                	xor    %edi,%edi
    455c:	31 d2                	xor    %edx,%edx
    455e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    4561:	31 db                	xor    %ebx,%ebx
    4563:	eb 39                	jmp    459e <printf+0x5e>
    4565:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    4568:	83 f9 25             	cmp    $0x25,%ecx
    456b:	0f 84 af 00 00 00    	je     4620 <printf+0xe0>
    4571:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    4574:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    4577:	83 ec 04             	sub    $0x4,%esp
    457a:	6a 01                	push   $0x1
    457c:	50                   	push   %eax
    457d:	ff 75 08             	pushl  0x8(%ebp)
    4580:	e8 23 fe ff ff       	call   43a8 <write>
    4585:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
    4588:	85 c0                	test   %eax,%eax
    458a:	78 35                	js     45c1 <printf+0x81>
    458c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    458f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    4592:	01 c7                	add    %eax,%edi
    4594:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4596:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    459a:	84 c0                	test   %al,%al
    459c:	74 21                	je     45bf <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
    459e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
    45a1:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    45a3:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    45a6:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
    45a9:	74 bd                	je     4568 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
    45ab:	83 fa 25             	cmp    $0x25,%edx
    45ae:	74 20                	je     45d0 <printf+0x90>
    45b0:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    45b2:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    45b5:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    45b7:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    45bb:	84 c0                	test   %al,%al
    45bd:	75 df                	jne    459e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    45bf:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
    45c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    45c4:	5b                   	pop    %ebx
    45c5:	5e                   	pop    %esi
    45c6:	5f                   	pop    %edi
    45c7:	5d                   	pop    %ebp
    45c8:	c3                   	ret    
    45c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
    45d0:	83 f9 64             	cmp    $0x64,%ecx
    45d3:	0f 84 7f 00 00 00    	je     4658 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    45d9:	0f be d0             	movsbl %al,%edx
    45dc:	81 e2 f7 00 00 00    	and    $0xf7,%edx
    45e2:	83 fa 70             	cmp    $0x70,%edx
    45e5:	74 49                	je     4630 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    45e7:	83 f9 73             	cmp    $0x73,%ecx
    45ea:	0f 84 98 00 00 00    	je     4688 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
    45f0:	83 f9 63             	cmp    $0x63,%ecx
    45f3:	0f 84 c7 00 00 00    	je     46c0 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    45f9:	83 f9 25             	cmp    $0x25,%ecx
    45fc:	74 6a                	je     4668 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
    45fe:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
    4601:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    4604:	83 ec 04             	sub    $0x4,%esp
    4607:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    4609:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
    460d:	50                   	push   %eax
    460e:	ff 75 08             	pushl  0x8(%ebp)
    4611:	e8 92 fd ff ff       	call   43a8 <write>
    4616:	83 c4 10             	add    $0x10,%esp
    4619:	e9 6a ff ff ff       	jmp    4588 <printf+0x48>
    461e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    4620:	ba 25 00 00 00       	mov    $0x25,%edx
    4625:	31 c0                	xor    %eax,%eax
    4627:	eb 89                	jmp    45b2 <printf+0x72>
    4629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    4630:	83 ec 0c             	sub    $0xc,%esp
    4633:	b9 10 00 00 00       	mov    $0x10,%ecx
    4638:	6a 00                	push   $0x0
    463a:	8b 75 d0             	mov    -0x30(%ebp),%esi
    463d:	8b 45 08             	mov    0x8(%ebp),%eax
    4640:	8b 16                	mov    (%esi),%edx
        ap++;
    4642:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    4645:	e8 36 fe ff ff       	call   4480 <printint>
        ap++;
    464a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    464d:	83 c4 10             	add    $0x10,%esp
    4650:	e9 33 ff ff ff       	jmp    4588 <printf+0x48>
    4655:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
    4658:	83 ec 0c             	sub    $0xc,%esp
    465b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4660:	6a 01                	push   $0x1
    4662:	eb d6                	jmp    463a <printf+0xfa>
    4664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4668:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    466b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    466e:	83 ec 04             	sub    $0x4,%esp
    4671:	6a 01                	push   $0x1
    4673:	50                   	push   %eax
    4674:	ff 75 08             	pushl  0x8(%ebp)
    4677:	e8 2c fd ff ff       	call   43a8 <write>
    467c:	83 c4 10             	add    $0x10,%esp
    467f:	e9 04 ff ff ff       	jmp    4588 <printf+0x48>
    4684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    4688:	8b 45 d0             	mov    -0x30(%ebp),%eax
    468b:	8b 30                	mov    (%eax),%esi
        ap++;
    468d:	83 c0 04             	add    $0x4,%eax
    4690:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
    4693:	b8 20 65 00 00       	mov    $0x6520,%eax
    4698:	85 f6                	test   %esi,%esi
    469a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
    469d:	83 ec 0c             	sub    $0xc,%esp
    46a0:	56                   	push   %esi
    46a1:	e8 5a f9 ff ff       	call   4000 <strlen>
    46a6:	83 c4 0c             	add    $0xc,%esp
    46a9:	50                   	push   %eax
    46aa:	56                   	push   %esi
    46ab:	ff 75 08             	pushl  0x8(%ebp)
    46ae:	e8 f5 fc ff ff       	call   43a8 <write>
    46b3:	83 c4 10             	add    $0x10,%esp
    46b6:	e9 cd fe ff ff       	jmp    4588 <printf+0x48>
    46bb:	90                   	nop
    46bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    46c0:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    46c3:	83 ec 04             	sub    $0x4,%esp
    46c6:	8b 06                	mov    (%esi),%eax
    46c8:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    46ca:	83 c6 04             	add    $0x4,%esi
    46cd:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    46d0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    46d3:	50                   	push   %eax
    46d4:	ff 75 08             	pushl  0x8(%ebp)
    46d7:	e8 cc fc ff ff       	call   43a8 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    46dc:	89 75 d0             	mov    %esi,-0x30(%ebp)
    46df:	83 c4 10             	add    $0x10,%esp
    46e2:	e9 a1 fe ff ff       	jmp    4588 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
    46e7:	31 c0                	xor    %eax,%eax
    46e9:	e9 d3 fe ff ff       	jmp    45c1 <printf+0x81>
    46ee:	66 90                	xchg   %ax,%ax

000046f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    46f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    46f1:	a1 a0 80 00 00       	mov    0x80a0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    46f6:	89 e5                	mov    %esp,%ebp
    46f8:	57                   	push   %edi
    46f9:	56                   	push   %esi
    46fa:	53                   	push   %ebx
    46fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    46fe:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4700:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4703:	39 c8                	cmp    %ecx,%eax
    4705:	73 19                	jae    4720 <free+0x30>
    4707:	89 f6                	mov    %esi,%esi
    4709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    4710:	39 d1                	cmp    %edx,%ecx
    4712:	72 1c                	jb     4730 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4714:	39 d0                	cmp    %edx,%eax
    4716:	73 18                	jae    4730 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    4718:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    471a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    471c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    471e:	72 f0                	jb     4710 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4720:	39 d0                	cmp    %edx,%eax
    4722:	72 f4                	jb     4718 <free+0x28>
    4724:	39 d1                	cmp    %edx,%ecx
    4726:	73 f0                	jae    4718 <free+0x28>
    4728:	90                   	nop
    4729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    4730:	8b 73 fc             	mov    -0x4(%ebx),%esi
    4733:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    4736:	39 d7                	cmp    %edx,%edi
    4738:	74 19                	je     4753 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    473a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    473d:	8b 50 04             	mov    0x4(%eax),%edx
    4740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4743:	39 f1                	cmp    %esi,%ecx
    4745:	74 23                	je     476a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    4747:	89 08                	mov    %ecx,(%eax)
  freep = p;
    4749:	a3 a0 80 00 00       	mov    %eax,0x80a0
}
    474e:	5b                   	pop    %ebx
    474f:	5e                   	pop    %esi
    4750:	5f                   	pop    %edi
    4751:	5d                   	pop    %ebp
    4752:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    4753:	03 72 04             	add    0x4(%edx),%esi
    4756:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    4759:	8b 10                	mov    (%eax),%edx
    475b:	8b 12                	mov    (%edx),%edx
    475d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    4760:	8b 50 04             	mov    0x4(%eax),%edx
    4763:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4766:	39 f1                	cmp    %esi,%ecx
    4768:	75 dd                	jne    4747 <free+0x57>
    p->s.size += bp->s.size;
    476a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    476d:	a3 a0 80 00 00       	mov    %eax,0x80a0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    4772:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4775:	8b 53 f8             	mov    -0x8(%ebx),%edx
    4778:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    477a:	5b                   	pop    %ebx
    477b:	5e                   	pop    %esi
    477c:	5f                   	pop    %edi
    477d:	5d                   	pop    %ebp
    477e:	c3                   	ret    
    477f:	90                   	nop

00004780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4780:	55                   	push   %ebp
    4781:	89 e5                	mov    %esp,%ebp
    4783:	57                   	push   %edi
    4784:	56                   	push   %esi
    4785:	53                   	push   %ebx
    4786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    478c:	8b 15 a0 80 00 00    	mov    0x80a0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4792:	8d 78 07             	lea    0x7(%eax),%edi
    4795:	c1 ef 03             	shr    $0x3,%edi
    4798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    479b:	85 d2                	test   %edx,%edx
    479d:	0f 84 a3 00 00 00    	je     4846 <malloc+0xc6>
    47a3:	8b 02                	mov    (%edx),%eax
    47a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    47a8:	39 cf                	cmp    %ecx,%edi
    47aa:	76 74                	jbe    4820 <malloc+0xa0>
    47ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    47b2:	be 00 10 00 00       	mov    $0x1000,%esi
    47b7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    47be:	0f 43 f7             	cmovae %edi,%esi
    47c1:	ba 00 80 00 00       	mov    $0x8000,%edx
    47c6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    47cc:	0f 46 da             	cmovbe %edx,%ebx
    47cf:	eb 10                	jmp    47e1 <malloc+0x61>
    47d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    47d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    47da:	8b 48 04             	mov    0x4(%eax),%ecx
    47dd:	39 cf                	cmp    %ecx,%edi
    47df:	76 3f                	jbe    4820 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    47e1:	39 05 a0 80 00 00    	cmp    %eax,0x80a0
    47e7:	89 c2                	mov    %eax,%edx
    47e9:	75 ed                	jne    47d8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    47eb:	83 ec 0c             	sub    $0xc,%esp
    47ee:	53                   	push   %ebx
    47ef:	e8 1c fc ff ff       	call   4410 <sbrk>
  if(p == (char*)-1)
    47f4:	83 c4 10             	add    $0x10,%esp
    47f7:	83 f8 ff             	cmp    $0xffffffff,%eax
    47fa:	74 1c                	je     4818 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    47fc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    47ff:	83 ec 0c             	sub    $0xc,%esp
    4802:	83 c0 08             	add    $0x8,%eax
    4805:	50                   	push   %eax
    4806:	e8 e5 fe ff ff       	call   46f0 <free>
  return freep;
    480b:	8b 15 a0 80 00 00    	mov    0x80a0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    4811:	83 c4 10             	add    $0x10,%esp
    4814:	85 d2                	test   %edx,%edx
    4816:	75 c0                	jne    47d8 <malloc+0x58>
        return 0;
    4818:	31 c0                	xor    %eax,%eax
    481a:	eb 1c                	jmp    4838 <malloc+0xb8>
    481c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    4820:	39 cf                	cmp    %ecx,%edi
    4822:	74 1c                	je     4840 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    4824:	29 f9                	sub    %edi,%ecx
    4826:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    4829:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    482c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    482f:	89 15 a0 80 00 00    	mov    %edx,0x80a0
      return (void*)(p + 1);
    4835:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    4838:	8d 65 f4             	lea    -0xc(%ebp),%esp
    483b:	5b                   	pop    %ebx
    483c:	5e                   	pop    %esi
    483d:	5f                   	pop    %edi
    483e:	5d                   	pop    %ebp
    483f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    4840:	8b 08                	mov    (%eax),%ecx
    4842:	89 0a                	mov    %ecx,(%edx)
    4844:	eb e9                	jmp    482f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    4846:	c7 05 a0 80 00 00 a4 	movl   $0x80a4,0x80a0
    484d:	80 00 00 
    4850:	c7 05 a4 80 00 00 a4 	movl   $0x80a4,0x80a4
    4857:	80 00 00 
    base.s.size = 0;
    485a:	b8 a4 80 00 00       	mov    $0x80a4,%eax
    485f:	c7 05 a8 80 00 00 00 	movl   $0x0,0x80a8
    4866:	00 00 00 
    4869:	e9 3e ff ff ff       	jmp    47ac <malloc+0x2c>
    486e:	66 90                	xchg   %ax,%ax

00004870 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    4870:	55                   	push   %ebp
    4871:	89 e5                	mov    %esp,%ebp
    4873:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    4876:	6a 10                	push   $0x10
    4878:	6a 02                	push   $0x2
    487a:	ff 75 08             	pushl  0x8(%ebp)
    487d:	e8 d6 fb ff ff       	call   4458 <ioctl>
}
    4882:	c9                   	leave  
    4883:	c3                   	ret    
    4884:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    488a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00004890 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
    4890:	55                   	push   %ebp
    4891:	89 e5                	mov    %esp,%ebp
    4893:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
    4896:	68 00 10 00 00       	push   $0x1000
    489b:	6a 02                	push   $0x2
    489d:	ff 75 08             	pushl  0x8(%ebp)
    48a0:	e8 b3 fb ff ff       	call   4458 <ioctl>
}
    48a5:	c9                   	leave  
    48a6:	c3                   	ret    
    48a7:	89 f6                	mov    %esi,%esi
    48a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000048b0 <attach_tty>:

int
attach_tty(int tty_fd)
{
    48b0:	55                   	push   %ebp
    48b1:	89 e5                	mov    %esp,%ebp
    48b3:	53                   	push   %ebx
    48b4:	83 ec 08             	sub    $0x8,%esp
    48b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
    48ba:	6a 10                	push   $0x10
    48bc:	6a 01                	push   $0x1
    48be:	53                   	push   %ebx
    48bf:	e8 94 fb ff ff       	call   4458 <ioctl>
    48c4:	83 c4 10             	add    $0x10,%esp
    48c7:	85 c0                	test   %eax,%eax
    48c9:	78 55                	js     4920 <attach_tty+0x70>
     return -1;

    close(0);
    48cb:	83 ec 0c             	sub    $0xc,%esp
    48ce:	6a 00                	push   $0x0
    48d0:	e8 db fa ff ff       	call   43b0 <close>
    close(1);
    48d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    48dc:	e8 cf fa ff ff       	call   43b0 <close>
    close(2);
    48e1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    48e8:	e8 c3 fa ff ff       	call   43b0 <close>
    if(dup(tty_fd) < 0)
    48ed:	89 1c 24             	mov    %ebx,(%esp)
    48f0:	e8 0b fb ff ff       	call   4400 <dup>
    48f5:	83 c4 10             	add    $0x10,%esp
    48f8:	85 c0                	test   %eax,%eax
    48fa:	78 24                	js     4920 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    48fc:	83 ec 0c             	sub    $0xc,%esp
    48ff:	53                   	push   %ebx
    4900:	e8 fb fa ff ff       	call   4400 <dup>
    4905:	83 c4 10             	add    $0x10,%esp
    4908:	85 c0                	test   %eax,%eax
    490a:	78 14                	js     4920 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    490c:	83 ec 0c             	sub    $0xc,%esp
    490f:	53                   	push   %ebx
    4910:	e8 eb fa ff ff       	call   4400 <dup>
    4915:	83 c4 10             	add    $0x10,%esp
    4918:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
    491b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    491e:	c9                   	leave  
    491f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
    4920:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
    4925:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4928:	c9                   	leave  
    4929:	c3                   	ret    
    492a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00004930 <detach_tty>:

int
detach_tty(int tty_fd)
{
    4930:	55                   	push   %ebp
    4931:	89 e5                	mov    %esp,%ebp
    4933:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
    4936:	6a 20                	push   $0x20
    4938:	6a 01                	push   $0x1
    493a:	ff 75 08             	pushl  0x8(%ebp)
    493d:	e8 16 fb ff ff       	call   4458 <ioctl>
    return 0;
}
    4942:	31 c0                	xor    %eax,%eax
    4944:	c9                   	leave  
    4945:	c3                   	ret    
    4946:	8d 76 00             	lea    0x0(%esi),%esi
    4949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004950 <connect_tty>:


int
connect_tty(int tty_fd)
{
    4950:	55                   	push   %ebp
    4951:	89 e5                	mov    %esp,%ebp
    4953:	53                   	push   %ebx
    4954:	83 ec 08             	sub    $0x8,%esp
    4957:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    495a:	6a 10                	push   $0x10
    495c:	6a 02                	push   $0x2
    495e:	53                   	push   %ebx
    495f:	e8 f4 fa ff ff       	call   4458 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
    4964:	83 c4 10             	add    $0x10,%esp
    4967:	85 c0                	test   %eax,%eax
    4969:	74 1d                	je     4988 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
    496b:	83 ec 04             	sub    $0x4,%esp
    496e:	68 00 10 00 00       	push   $0x1000
    4973:	6a 01                	push   $0x1
    4975:	53                   	push   %ebx
    4976:	e8 dd fa ff ff       	call   4458 <ioctl>
     return tty_fd;
    497b:	83 c4 10             	add    $0x10,%esp
    497e:	89 d8                	mov    %ebx,%eax
}
    4980:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4983:	c9                   	leave  
    4984:	c3                   	ret    
    4985:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
    4988:	83 ec 0c             	sub    $0xc,%esp
    498b:	53                   	push   %ebx
    498c:	e8 1f fa ff ff       	call   43b0 <close>
       return -1;
    4991:	83 c4 10             	add    $0x10,%esp
    4994:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4999:	eb e5                	jmp    4980 <connect_tty+0x30>
    499b:	90                   	nop
    499c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000049a0 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
    49a0:	55                   	push   %ebp
    49a1:	89 e5                	mov    %esp,%ebp
    49a3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
    49a6:	68 00 20 00 00       	push   $0x2000
    49ab:	6a 01                	push   $0x1
    49ad:	ff 75 08             	pushl  0x8(%ebp)
    49b0:	e8 a3 fa ff ff       	call   4458 <ioctl>
}
    49b5:	c9                   	leave  
    49b6:	c3                   	ret    
