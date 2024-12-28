
_mounttest:     file format elf32-i386


Disassembly of section .text:

00000000 <umounta>:

  return 0;
}

static int
umounta(void) {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 14             	sub    $0x14,%esp
  int res = umount("a");
       6:	68 c9 15 00 00       	push   $0x15c9
       b:	e8 6f 10 00 00       	call   107f <umount>
  if (res != 0) {
      10:	83 c4 10             	add    $0x10,%esp
      13:	85 c0                	test   %eax,%eax
      15:	74 1a                	je     31 <umounta+0x31>
    printf(1, "umounta: umount returned %d\n", res);
      17:	83 ec 04             	sub    $0x4,%esp
      1a:	50                   	push   %eax
      1b:	68 a0 15 00 00       	push   $0x15a0
      20:	6a 01                	push   $0x1
      22:	e8 a1 11 00 00       	call   11c8 <printf>
    return -1;
      27:	83 c4 10             	add    $0x10,%esp
      2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      2f:	eb 05                	jmp    36 <umounta+0x36>
  }

  return 0;
      31:	b8 00 00 00 00       	mov    $0x0,%eax
}
      36:	c9                   	leave  
      37:	c3                   	ret    

00000038 <mounta>:

  return 0;
}

static int
mounta(void) {
      38:	55                   	push   %ebp
      39:	89 e5                	mov    %esp,%ebp
      3b:	83 ec 14             	sub    $0x14,%esp
  mkdir("a");
      3e:	68 c9 15 00 00       	push   $0x15c9
      43:	e8 f7 0f 00 00       	call   103f <mkdir>
  int res = mount("internal_fs_a", "a", 0);
      48:	83 c4 0c             	add    $0xc,%esp
      4b:	6a 00                	push   $0x0
      4d:	68 c9 15 00 00       	push   $0x15c9
      52:	68 bd 15 00 00       	push   $0x15bd
      57:	e8 1b 10 00 00       	call   1077 <mount>
  if (res != 0) {
      5c:	83 c4 10             	add    $0x10,%esp
      5f:	85 c0                	test   %eax,%eax
      61:	74 1a                	je     7d <mounta+0x45>
    printf(1, "mounta: mount returned %d\n", res);
      63:	83 ec 04             	sub    $0x4,%esp
      66:	50                   	push   %eax
      67:	68 cb 15 00 00       	push   $0x15cb
      6c:	6a 01                	push   $0x1
      6e:	e8 55 11 00 00       	call   11c8 <printf>
    return -1;
      73:	83 c4 10             	add    $0x10,%esp
      76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      7b:	eb 05                	jmp    82 <mounta+0x4a>
  }

  return 0;
      7d:	b8 00 00 00 00       	mov    $0x0,%eax
}
      82:	c9                   	leave  
      83:	c3                   	ret    

00000084 <cdinthenouttest>:
    return 0;
  }
}

static int
cdinthenouttest(void) {
      84:	55                   	push   %ebp
      85:	89 e5                	mov    %esp,%ebp
      87:	53                   	push   %ebx
      88:	83 ec 24             	sub    $0x24,%esp
  if (mounta() != 0) {
      8b:	e8 a8 ff ff ff       	call   38 <mounta>
      90:	85 c0                	test   %eax,%eax
      92:	75 7a                	jne    10e <cdinthenouttest+0x8a>
      94:	89 c3                	mov    %eax,%ebx
    return 1;
  }

  chdir("a");
      96:	83 ec 0c             	sub    $0xc,%esp
      99:	68 c9 15 00 00       	push   $0x15c9
      9e:	e8 a4 0f 00 00       	call   1047 <chdir>
  chdir("..");
      a3:	c7 04 24 e6 15 00 00 	movl   $0x15e6,(%esp)
      aa:	e8 98 0f 00 00       	call   1047 <chdir>

  // tmp replacment of pwd - checking if the wd contains the "a" dir
  struct stat st;
  if(stat("a", &st) < 0) {
      af:	83 c4 08             	add    $0x8,%esp
      b2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
      b5:	50                   	push   %eax
      b6:	68 c9 15 00 00       	push   $0x15c9
      bb:	e8 51 0d 00 00       	call   e11 <stat>
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	85 c0                	test   %eax,%eax
      c5:	79 19                	jns    e0 <cdinthenouttest+0x5c>
    printf(1, "cdinthenouttest: not in root or couldnt find a dir\n");
      c7:	83 ec 08             	sub    $0x8,%esp
      ca:	68 d0 17 00 00       	push   $0x17d0
      cf:	6a 01                	push   $0x1
      d1:	e8 f2 10 00 00       	call   11c8 <printf>
    return 1;
      d6:	83 c4 10             	add    $0x10,%esp
      d9:	bb 01 00 00 00       	mov    $0x1,%ebx
      de:	eb 33                	jmp    113 <cdinthenouttest+0x8f>
  }

  int res = umount("a");
      e0:	83 ec 0c             	sub    $0xc,%esp
      e3:	68 c9 15 00 00       	push   $0x15c9
      e8:	e8 92 0f 00 00       	call   107f <umount>
  if (res != 0) {
      ed:	83 c4 10             	add    $0x10,%esp
      f0:	85 c0                	test   %eax,%eax
      f2:	74 1f                	je     113 <cdinthenouttest+0x8f>
    printf(1, "cdinthenouttest: unmount returned %d\n", res);
      f4:	83 ec 04             	sub    $0x4,%esp
      f7:	50                   	push   %eax
      f8:	68 04 18 00 00       	push   $0x1804
      fd:	6a 01                	push   $0x1
      ff:	e8 c4 10 00 00       	call   11c8 <printf>
    return 1;
     104:	83 c4 10             	add    $0x10,%esp
     107:	bb 01 00 00 00       	mov    $0x1,%ebx
     10c:	eb 05                	jmp    113 <cdinthenouttest+0x8f>
}

static int
cdinthenouttest(void) {
  if (mounta() != 0) {
    return 1;
     10e:	bb 01 00 00 00       	mov    $0x1,%ebx
  if (res != 0) {
    printf(1, "cdinthenouttest: unmount returned %d\n", res);
    return 1;
  }
  return 0;
}
     113:	89 d8                	mov    %ebx,%eax
     115:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     118:	c9                   	leave  
     119:	c3                   	ret    

0000011a <errorondeletedevicetest>:

  return 0;
}

static int
errorondeletedevicetest(void) {
     11a:	55                   	push   %ebp
     11b:	89 e5                	mov    %esp,%ebp
     11d:	83 ec 08             	sub    $0x8,%esp
  if (mounta() != 0) {
     120:	e8 13 ff ff ff       	call   38 <mounta>
     125:	85 c0                	test   %eax,%eax
     127:	75 3f                	jne    168 <errorondeletedevicetest+0x4e>
    return 1;
  }

  int res = unlink("internal_fs_a");
     129:	83 ec 0c             	sub    $0xc,%esp
     12c:	68 bd 15 00 00       	push   $0x15bd
     131:	e8 f1 0e 00 00       	call   1027 <unlink>
  if (res != -1) {
     136:	83 c4 10             	add    $0x10,%esp
     139:	83 f8 ff             	cmp    $0xffffffff,%eax
     13c:	74 1a                	je     158 <errorondeletedevicetest+0x3e>
    printf(1, "errorondeletedevicetest: unlink did not fail as expected %d\n", res);
     13e:	83 ec 04             	sub    $0x4,%esp
     141:	50                   	push   %eax
     142:	68 2c 18 00 00       	push   $0x182c
     147:	6a 01                	push   $0x1
     149:	e8 7a 10 00 00       	call   11c8 <printf>
    return 1;
     14e:	83 c4 10             	add    $0x10,%esp
     151:	b8 01 00 00 00       	mov    $0x1,%eax
     156:	eb 15                	jmp    16d <errorondeletedevicetest+0x53>
  }

  if (umounta() != 0) {
     158:	e8 a3 fe ff ff       	call   0 <umounta>
     15d:	85 c0                	test   %eax,%eax
     15f:	74 0c                	je     16d <errorondeletedevicetest+0x53>
    return 1;
     161:	b8 01 00 00 00       	mov    $0x1,%eax
     166:	eb 05                	jmp    16d <errorondeletedevicetest+0x53>
}

static int
errorondeletedevicetest(void) {
  if (mounta() != 0) {
    return 1;
     168:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     16d:	c9                   	leave  
     16e:	c3                   	ret    

0000016f <mounttest>:

  return 0;
}

static int
mounttest(void) {
     16f:	55                   	push   %ebp
     170:	89 e5                	mov    %esp,%ebp
     172:	83 ec 08             	sub    $0x8,%esp
  if (mounta() != 0) {
     175:	e8 be fe ff ff       	call   38 <mounta>
     17a:	85 c0                	test   %eax,%eax
     17c:	75 10                	jne    18e <mounttest+0x1f>
    return 1;
  }
  
  if (umounta() != 0) {
     17e:	e8 7d fe ff ff       	call   0 <umounta>
     183:	85 c0                	test   %eax,%eax
     185:	74 0c                	je     193 <mounttest+0x24>
    return 1;
     187:	b8 01 00 00 00       	mov    $0x1,%eax
     18c:	eb 05                	jmp    193 <mounttest+0x24>
}

static int
mounttest(void) {
  if (mounta() != 0) {
    return 1;
     18e:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     193:	c9                   	leave  
     194:	c3                   	ret    

00000195 <samedirectorytest>:

  return 0;
}

static int
samedirectorytest(void) {
     195:	55                   	push   %ebp
     196:	89 e5                	mov    %esp,%ebp
     198:	83 ec 08             	sub    $0x8,%esp
  if (mounta() != 0) {
     19b:	e8 98 fe ff ff       	call   38 <mounta>
     1a0:	85 c0                	test   %eax,%eax
     1a2:	75 46                	jne    1ea <samedirectorytest+0x55>
    return 1;
  }

  int res = mount("internal_fs_b", "a", 0);
     1a4:	83 ec 04             	sub    $0x4,%esp
     1a7:	6a 00                	push   $0x0
     1a9:	68 c9 15 00 00       	push   $0x15c9
     1ae:	68 e9 15 00 00       	push   $0x15e9
     1b3:	e8 bf 0e 00 00       	call   1077 <mount>
  if (res != -1) {
     1b8:	83 c4 10             	add    $0x10,%esp
     1bb:	83 f8 ff             	cmp    $0xffffffff,%eax
     1be:	74 1a                	je     1da <samedirectorytest+0x45>
    printf(1, "samedirectorytest: mount did not fail as expected %d\n", res);
     1c0:	83 ec 04             	sub    $0x4,%esp
     1c3:	50                   	push   %eax
     1c4:	68 6c 18 00 00       	push   $0x186c
     1c9:	6a 01                	push   $0x1
     1cb:	e8 f8 0f 00 00       	call   11c8 <printf>
    return 1;
     1d0:	83 c4 10             	add    $0x10,%esp
     1d3:	b8 01 00 00 00       	mov    $0x1,%eax
     1d8:	eb 15                	jmp    1ef <samedirectorytest+0x5a>
  }

  if (umounta() != 0) {
     1da:	e8 21 fe ff ff       	call   0 <umounta>
     1df:	85 c0                	test   %eax,%eax
     1e1:	74 0c                	je     1ef <samedirectorytest+0x5a>
    return 1;
     1e3:	b8 01 00 00 00       	mov    $0x1,%eax
     1e8:	eb 05                	jmp    1ef <samedirectorytest+0x5a>
}

static int
samedirectorytest(void) {
  if (mounta() != 0) {
    return 1;
     1ea:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     1ef:	c9                   	leave  
     1f0:	c3                   	ret    

000001f1 <doublemounttest>:

  return 0;
}

static int
doublemounttest(void) {
     1f1:	55                   	push   %ebp
     1f2:	89 e5                	mov    %esp,%ebp
     1f4:	53                   	push   %ebx
     1f5:	83 ec 04             	sub    $0x4,%esp
  if (mounta() != 0) {
     1f8:	e8 3b fe ff ff       	call   38 <mounta>
     1fd:	85 c0                	test   %eax,%eax
     1ff:	75 7b                	jne    27c <doublemounttest+0x8b>
    return 1;
  }

  mkdir("b");
     201:	83 ec 0c             	sub    $0xc,%esp
     204:	68 8e 16 00 00       	push   $0x168e
     209:	e8 31 0e 00 00       	call   103f <mkdir>
  int res = mount("internal_fs_a", "b", 0);
     20e:	83 c4 0c             	add    $0xc,%esp
     211:	6a 00                	push   $0x0
     213:	68 8e 16 00 00       	push   $0x168e
     218:	68 bd 15 00 00       	push   $0x15bd
     21d:	e8 55 0e 00 00       	call   1077 <mount>
  if (res != 0) {
     222:	83 c4 10             	add    $0x10,%esp
     225:	85 c0                	test   %eax,%eax
     227:	74 1a                	je     243 <doublemounttest+0x52>
    printf(1, "doublemounttest: mount returned %d\n", res);
     229:	83 ec 04             	sub    $0x4,%esp
     22c:	50                   	push   %eax
     22d:	68 a4 18 00 00       	push   $0x18a4
     232:	6a 01                	push   $0x1
     234:	e8 8f 0f 00 00       	call   11c8 <printf>
    return 1;
     239:	83 c4 10             	add    $0x10,%esp
     23c:	bb 01 00 00 00       	mov    $0x1,%ebx
     241:	eb 45                	jmp    288 <doublemounttest+0x97>
  }

  if (umounta() != 0) {
     243:	e8 b8 fd ff ff       	call   0 <umounta>
     248:	89 c3                	mov    %eax,%ebx
     24a:	85 c0                	test   %eax,%eax
     24c:	75 35                	jne    283 <doublemounttest+0x92>
    return 1;
  }

  res = umount("b");
     24e:	83 ec 0c             	sub    $0xc,%esp
     251:	68 8e 16 00 00       	push   $0x168e
     256:	e8 24 0e 00 00       	call   107f <umount>
  if (res != 0) {
     25b:	83 c4 10             	add    $0x10,%esp
     25e:	85 c0                	test   %eax,%eax
     260:	74 26                	je     288 <doublemounttest+0x97>
    printf(1, "doublemounttest: umount returned %d\n", res);
     262:	83 ec 04             	sub    $0x4,%esp
     265:	50                   	push   %eax
     266:	68 c8 18 00 00       	push   $0x18c8
     26b:	6a 01                	push   $0x1
     26d:	e8 56 0f 00 00       	call   11c8 <printf>
    return 1;
     272:	83 c4 10             	add    $0x10,%esp
     275:	bb 01 00 00 00       	mov    $0x1,%ebx
     27a:	eb 0c                	jmp    288 <doublemounttest+0x97>
}

static int
doublemounttest(void) {
  if (mounta() != 0) {
    return 1;
     27c:	bb 01 00 00 00       	mov    $0x1,%ebx
     281:	eb 05                	jmp    288 <doublemounttest+0x97>
    printf(1, "doublemounttest: mount returned %d\n", res);
    return 1;
  }

  if (umounta() != 0) {
    return 1;
     283:	bb 01 00 00 00       	mov    $0x1,%ebx
    printf(1, "doublemounttest: umount returned %d\n", res);
    return 1;
  }

  return 0;
}
     288:	89 d8                	mov    %ebx,%eax
     28a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     28d:	c9                   	leave  
     28e:	c3                   	ret    

0000028f <invalidpathtest>:

  return 0;
}

static int
invalidpathtest(void) {
     28f:	55                   	push   %ebp
     290:	89 e5                	mov    %esp,%ebp
     292:	83 ec 0c             	sub    $0xc,%esp
  int res = mount("internal_fs_a", "AAA", 0);
     295:	6a 00                	push   $0x0
     297:	68 f7 15 00 00       	push   $0x15f7
     29c:	68 bd 15 00 00       	push   $0x15bd
     2a1:	e8 d1 0d 00 00       	call   1077 <mount>
  if (res != -1) {
     2a6:	83 c4 10             	add    $0x10,%esp
     2a9:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ac:	74 1d                	je     2cb <invalidpathtest+0x3c>
    printf(1, "invalidpathtest: mount did not fail as expected %d\n", res);
     2ae:	83 ec 04             	sub    $0x4,%esp
     2b1:	50                   	push   %eax
     2b2:	68 f0 18 00 00       	push   $0x18f0
     2b7:	6a 01                	push   $0x1
     2b9:	e8 0a 0f 00 00       	call   11c8 <printf>
    return 1;
     2be:	83 c4 10             	add    $0x10,%esp
     2c1:	b8 01 00 00 00       	mov    $0x1,%eax
     2c6:	e9 88 00 00 00       	jmp    353 <invalidpathtest+0xc4>
  }

  if (mounta() != 0) {
     2cb:	e8 68 fd ff ff       	call   38 <mounta>
     2d0:	85 c0                	test   %eax,%eax
     2d2:	75 7a                	jne    34e <invalidpathtest+0xbf>
    return 1;
  }

  res = umount("b");
     2d4:	83 ec 0c             	sub    $0xc,%esp
     2d7:	68 8e 16 00 00       	push   $0x168e
     2dc:	e8 9e 0d 00 00       	call   107f <umount>
  if (res != -1) {
     2e1:	83 c4 10             	add    $0x10,%esp
     2e4:	83 f8 ff             	cmp    $0xffffffff,%eax
     2e7:	74 1a                	je     303 <invalidpathtest+0x74>
    printf(1, "invalidpathtest: umount did not fail as expected %d\n", res);
     2e9:	83 ec 04             	sub    $0x4,%esp
     2ec:	50                   	push   %eax
     2ed:	68 24 19 00 00       	push   $0x1924
     2f2:	6a 01                	push   $0x1
     2f4:	e8 cf 0e 00 00       	call   11c8 <printf>
    return 1;
     2f9:	83 c4 10             	add    $0x10,%esp
     2fc:	b8 01 00 00 00       	mov    $0x1,%eax
     301:	eb 50                	jmp    353 <invalidpathtest+0xc4>
  }

  mkdir("b");
     303:	83 ec 0c             	sub    $0xc,%esp
     306:	68 8e 16 00 00       	push   $0x168e
     30b:	e8 2f 0d 00 00       	call   103f <mkdir>
  res = umount("b");
     310:	c7 04 24 8e 16 00 00 	movl   $0x168e,(%esp)
     317:	e8 63 0d 00 00       	call   107f <umount>
  if (res != -1) {
     31c:	83 c4 10             	add    $0x10,%esp
     31f:	83 f8 ff             	cmp    $0xffffffff,%eax
     322:	74 1a                	je     33e <invalidpathtest+0xaf>
    printf(1, "invalidpathtest: umount did not fail as expected %d\n", res);
     324:	83 ec 04             	sub    $0x4,%esp
     327:	50                   	push   %eax
     328:	68 24 19 00 00       	push   $0x1924
     32d:	6a 01                	push   $0x1
     32f:	e8 94 0e 00 00       	call   11c8 <printf>
    return 1;
     334:	83 c4 10             	add    $0x10,%esp
     337:	b8 01 00 00 00       	mov    $0x1,%eax
     33c:	eb 15                	jmp    353 <invalidpathtest+0xc4>
  }

  if (umounta() != 0) {
     33e:	e8 bd fc ff ff       	call   0 <umounta>
     343:	85 c0                	test   %eax,%eax
     345:	74 0c                	je     353 <invalidpathtest+0xc4>
    return 1;
     347:	b8 01 00 00 00       	mov    $0x1,%eax
     34c:	eb 05                	jmp    353 <invalidpathtest+0xc4>
    printf(1, "invalidpathtest: mount did not fail as expected %d\n", res);
    return 1;
  }

  if (mounta() != 0) {
    return 1;
     34e:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     353:	c9                   	leave  
     354:	c3                   	ret    

00000355 <namespacetest>:

  return 0;
}

static int
namespacetest(void) {
     355:	55                   	push   %ebp
     356:	89 e5                	mov    %esp,%ebp
     358:	83 ec 08             	sub    $0x8,%esp
  if (mounta() != 0) {
     35b:	e8 d8 fc ff ff       	call   38 <mounta>
     360:	85 c0                	test   %eax,%eax
     362:	75 41                	jne    3a5 <namespacetest+0x50>
    return 1;
  }

  int pid = fork();
     364:	e8 66 0c 00 00       	call   fcf <fork>
  if (pid == 0) {
     369:	85 c0                	test   %eax,%eax
     36b:	75 1b                	jne    388 <namespacetest+0x33>
    unshare(MOUNT_NS);
     36d:	83 ec 0c             	sub    $0xc,%esp
     370:	6a 01                	push   $0x1
     372:	e8 20 0d 00 00       	call   1097 <unshare>

    umounta();
     377:	e8 84 fc ff ff       	call   0 <umounta>

    exit(0);
     37c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     383:	e8 4f 0c 00 00       	call   fd7 <exit>
  } else {
    wait(0);
     388:	83 ec 0c             	sub    $0xc,%esp
     38b:	6a 00                	push   $0x0
     38d:	e8 4d 0c 00 00       	call   fdf <wait>
    if (umounta() != 0) {
     392:	e8 69 fc ff ff       	call   0 <umounta>
     397:	83 c4 10             	add    $0x10,%esp
     39a:	85 c0                	test   %eax,%eax
     39c:	74 0c                	je     3aa <namespacetest+0x55>
      return 1;
     39e:	b8 01 00 00 00       	mov    $0x1,%eax
     3a3:	eb 05                	jmp    3aa <namespacetest+0x55>
}

static int
namespacetest(void) {
  if (mounta() != 0) {
    return 1;
     3a5:	b8 01 00 00 00       	mov    $0x1,%eax
      return 1;
    }

    return 0;
  }
}
     3aa:	c9                   	leave  
     3ab:	c3                   	ret    

000003ac <umountwithopenfiletest>:

  return 0;
}

static int
umountwithopenfiletest(void) {
     3ac:	55                   	push   %ebp
     3ad:	89 e5                	mov    %esp,%ebp
     3af:	53                   	push   %ebx
     3b0:	83 ec 04             	sub    $0x4,%esp
  if (mounta() != 0) {
     3b3:	e8 80 fc ff ff       	call   38 <mounta>
     3b8:	85 c0                	test   %eax,%eax
     3ba:	75 7f                	jne    43b <umountwithopenfiletest+0x8f>
    return 1;
  }

  int fd;
  if((fd = open("a/umountwithop", O_WRONLY|O_CREATE)) < 0){
     3bc:	83 ec 08             	sub    $0x8,%esp
     3bf:	68 01 02 00 00       	push   $0x201
     3c4:	68 fb 15 00 00       	push   $0x15fb
     3c9:	e8 49 0c 00 00       	call   1017 <open>
     3ce:	89 c3                	mov    %eax,%ebx
     3d0:	83 c4 10             	add    $0x10,%esp
     3d3:	85 c0                	test   %eax,%eax
     3d5:	79 19                	jns    3f0 <umountwithopenfiletest+0x44>
    printf(1, "umountwithopenfiletest: cannot open file\n");
     3d7:	83 ec 08             	sub    $0x8,%esp
     3da:	68 5c 19 00 00       	push   $0x195c
     3df:	6a 01                	push   $0x1
     3e1:	e8 e2 0d 00 00       	call   11c8 <printf>
    return 1;
     3e6:	83 c4 10             	add    $0x10,%esp
     3e9:	b8 01 00 00 00       	mov    $0x1,%eax
     3ee:	eb 50                	jmp    440 <umountwithopenfiletest+0x94>
  }

  int res = umount("a");
     3f0:	83 ec 0c             	sub    $0xc,%esp
     3f3:	68 c9 15 00 00       	push   $0x15c9
     3f8:	e8 82 0c 00 00       	call   107f <umount>
  if (res != -1) {
     3fd:	83 c4 10             	add    $0x10,%esp
     400:	83 f8 ff             	cmp    $0xffffffff,%eax
     403:	74 1a                	je     41f <umountwithopenfiletest+0x73>
    printf(1, "umountwithopenfiletest: umount did not fail as expected %d\n", res);
     405:	83 ec 04             	sub    $0x4,%esp
     408:	50                   	push   %eax
     409:	68 88 19 00 00       	push   $0x1988
     40e:	6a 01                	push   $0x1
     410:	e8 b3 0d 00 00       	call   11c8 <printf>
    return 1;
     415:	83 c4 10             	add    $0x10,%esp
     418:	b8 01 00 00 00       	mov    $0x1,%eax
     41d:	eb 21                	jmp    440 <umountwithopenfiletest+0x94>
  }

  close(fd);
     41f:	83 ec 0c             	sub    $0xc,%esp
     422:	53                   	push   %ebx
     423:	e8 d7 0b 00 00       	call   fff <close>

  if (umounta() != 0) {
     428:	e8 d3 fb ff ff       	call   0 <umounta>
     42d:	83 c4 10             	add    $0x10,%esp
     430:	85 c0                	test   %eax,%eax
     432:	74 0c                	je     440 <umountwithopenfiletest+0x94>
    return 1;
     434:	b8 01 00 00 00       	mov    $0x1,%eax
     439:	eb 05                	jmp    440 <umountwithopenfiletest+0x94>
}

static int
umountwithopenfiletest(void) {
  if (mounta() != 0) {
    return 1;
     43b:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     440:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     443:	c9                   	leave  
     444:	c3                   	ret    

00000445 <createfile>:
#include "ns_types.h"
#include "tester.h"


static int
createfile(char *path, char *contents) {
     445:	55                   	push   %ebp
     446:	89 e5                	mov    %esp,%ebp
     448:	57                   	push   %edi
     449:	56                   	push   %esi
     44a:	53                   	push   %ebx
     44b:	83 ec 14             	sub    $0x14,%esp
     44e:	89 c7                	mov    %eax,%edi
     450:	89 d6                	mov    %edx,%esi
  int fd;
  if((fd = open(path, O_WRONLY|O_CREATE)) < 0){
     452:	68 01 02 00 00       	push   $0x201
     457:	50                   	push   %eax
     458:	e8 ba 0b 00 00       	call   1017 <open>
     45d:	83 c4 10             	add    $0x10,%esp
     460:	85 c0                	test   %eax,%eax
     462:	79 1a                	jns    47e <createfile+0x39>
    printf(1, "createfile: cannot open %s\n", path);
     464:	83 ec 04             	sub    $0x4,%esp
     467:	57                   	push   %edi
     468:	68 0a 16 00 00       	push   $0x160a
     46d:	6a 01                	push   $0x1
     46f:	e8 54 0d 00 00       	call   11c8 <printf>
    return -1;
     474:	83 c4 10             	add    $0x10,%esp
     477:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     47c:	eb 50                	jmp    4ce <createfile+0x89>
     47e:	89 c3                	mov    %eax,%ebx
  }

  if (write(fd, contents, strlen(contents)) < 0) {
     480:	83 ec 0c             	sub    $0xc,%esp
     483:	56                   	push   %esi
     484:	e8 db 08 00 00       	call   d64 <strlen>
     489:	83 c4 0c             	add    $0xc,%esp
     48c:	50                   	push   %eax
     48d:	56                   	push   %esi
     48e:	53                   	push   %ebx
     48f:	e8 63 0b 00 00       	call   ff7 <write>
     494:	83 c4 10             	add    $0x10,%esp
     497:	85 c0                	test   %eax,%eax
     499:	79 22                	jns    4bd <createfile+0x78>
    printf(1, "createfile: failed writing\n", path);
     49b:	83 ec 04             	sub    $0x4,%esp
     49e:	57                   	push   %edi
     49f:	68 26 16 00 00       	push   $0x1626
     4a4:	6a 01                	push   $0x1
     4a6:	e8 1d 0d 00 00       	call   11c8 <printf>
    close(fd);
     4ab:	89 1c 24             	mov    %ebx,(%esp)
     4ae:	e8 4c 0b 00 00       	call   fff <close>
    return -1;
     4b3:	83 c4 10             	add    $0x10,%esp
     4b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     4bb:	eb 11                	jmp    4ce <createfile+0x89>
  }

  close(fd);
     4bd:	83 ec 0c             	sub    $0xc,%esp
     4c0:	53                   	push   %ebx
     4c1:	e8 39 0b 00 00       	call   fff <close>

  return 0;
     4c6:	83 c4 10             	add    $0x10,%esp
     4c9:	b8 00 00 00 00       	mov    $0x0,%eax
}
     4ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4d1:	5b                   	pop    %ebx
     4d2:	5e                   	pop    %esi
     4d3:	5f                   	pop    %edi
     4d4:	5d                   	pop    %ebp
     4d5:	c3                   	ret    

000004d6 <namespacefiletest>:
    return 0;
  }
}

static int
namespacefiletest(void) {
     4d6:	55                   	push   %ebp
     4d7:	89 e5                	mov    %esp,%ebp
     4d9:	53                   	push   %ebx
     4da:	83 ec 04             	sub    $0x4,%esp
  if (mounta() != 0) {
     4dd:	e8 56 fb ff ff       	call   38 <mounta>
     4e2:	85 c0                	test   %eax,%eax
     4e4:	0f 85 58 01 00 00    	jne    642 <namespacefiletest+0x16c>
    return 1;
  }

  int pid = fork();
     4ea:	e8 e0 0a 00 00       	call   fcf <fork>
  if (pid == 0) {
     4ef:	85 c0                	test   %eax,%eax
     4f1:	75 67                	jne    55a <namespacefiletest+0x84>
    unshare(MOUNT_NS);
     4f3:	83 ec 0c             	sub    $0xc,%esp
     4f6:	6a 01                	push   $0x1
     4f8:	e8 9a 0b 00 00       	call   1097 <unshare>
    mkdir("b");
     4fd:	c7 04 24 8e 16 00 00 	movl   $0x168e,(%esp)
     504:	e8 36 0b 00 00       	call   103f <mkdir>
    int res = mount("internal_fs_b", "b", 0);
     509:	83 c4 0c             	add    $0xc,%esp
     50c:	6a 00                	push   $0x0
     50e:	68 8e 16 00 00       	push   $0x168e
     513:	68 e9 15 00 00       	push   $0x15e9
     518:	e8 5a 0b 00 00       	call   1077 <mount>
    if (res != 0) {
     51d:	83 c4 10             	add    $0x10,%esp
     520:	85 c0                	test   %eax,%eax
     522:	74 1d                	je     541 <namespacefiletest+0x6b>
      printf(1, "namespacefiletest: mount returned %d\n", res);
     524:	83 ec 04             	sub    $0x4,%esp
     527:	50                   	push   %eax
     528:	68 c4 19 00 00       	push   $0x19c4
     52d:	6a 01                	push   $0x1
     52f:	e8 94 0c 00 00       	call   11c8 <printf>
      return 1;
     534:	83 c4 10             	add    $0x10,%esp
     537:	bb 01 00 00 00       	mov    $0x1,%ebx
     53c:	e9 0d 01 00 00       	jmp    64e <namespacefiletest+0x178>
    }

    createfile("b/nsfiletest", "aaa");
     541:	ba 42 16 00 00       	mov    $0x1642,%edx
     546:	b8 46 16 00 00       	mov    $0x1646,%eax
     54b:	e8 f5 fe ff ff       	call   445 <createfile>
    exit(0);
     550:	83 ec 0c             	sub    $0xc,%esp
     553:	6a 00                	push   $0x0
     555:	e8 7d 0a 00 00       	call   fd7 <exit>
  } else {
    wait(0);
     55a:	83 ec 0c             	sub    $0xc,%esp
     55d:	6a 00                	push   $0x0
     55f:	e8 7b 0a 00 00       	call   fdf <wait>

    if (umounta() != 0) {
     564:	e8 97 fa ff ff       	call   0 <umounta>
     569:	89 c3                	mov    %eax,%ebx
     56b:	83 c4 10             	add    $0x10,%esp
     56e:	85 c0                	test   %eax,%eax
     570:	0f 85 d3 00 00 00    	jne    649 <namespacefiletest+0x173>
      return 1;
    }
    if (open("b/nsfiletest", 0) >= 0) {
     576:	83 ec 08             	sub    $0x8,%esp
     579:	6a 00                	push   $0x0
     57b:	68 46 16 00 00       	push   $0x1646
     580:	e8 92 0a 00 00       	call   1017 <open>
     585:	83 c4 10             	add    $0x10,%esp
     588:	85 c0                	test   %eax,%eax
     58a:	78 1c                	js     5a8 <namespacefiletest+0xd2>
      printf(1, "namespacefiletest: should not have been able to open file\n");
     58c:	83 ec 08             	sub    $0x8,%esp
     58f:	68 ec 19 00 00       	push   $0x19ec
     594:	6a 01                	push   $0x1
     596:	e8 2d 0c 00 00       	call   11c8 <printf>
      return 1;
     59b:	83 c4 10             	add    $0x10,%esp
     59e:	bb 01 00 00 00       	mov    $0x1,%ebx
     5a3:	e9 a6 00 00 00       	jmp    64e <namespacefiletest+0x178>
    }

    int res = mount("internal_fs_b", "b", 0);
     5a8:	83 ec 04             	sub    $0x4,%esp
     5ab:	6a 00                	push   $0x0
     5ad:	68 8e 16 00 00       	push   $0x168e
     5b2:	68 e9 15 00 00       	push   $0x15e9
     5b7:	e8 bb 0a 00 00       	call   1077 <mount>
    if (res != 0) {
     5bc:	83 c4 10             	add    $0x10,%esp
     5bf:	85 c0                	test   %eax,%eax
     5c1:	74 1a                	je     5dd <namespacefiletest+0x107>
      printf(1, "namespacefiletest: mount returned %d\n", res);
     5c3:	83 ec 04             	sub    $0x4,%esp
     5c6:	50                   	push   %eax
     5c7:	68 c4 19 00 00       	push   $0x19c4
     5cc:	6a 01                	push   $0x1
     5ce:	e8 f5 0b 00 00       	call   11c8 <printf>
      return 1;
     5d3:	83 c4 10             	add    $0x10,%esp
     5d6:	bb 01 00 00 00       	mov    $0x1,%ebx
     5db:	eb 71                	jmp    64e <namespacefiletest+0x178>
    }

    int fd;
    if ((fd = open("b/nsfiletest", 0)) < 0) {
     5dd:	83 ec 08             	sub    $0x8,%esp
     5e0:	6a 00                	push   $0x0
     5e2:	68 46 16 00 00       	push   $0x1646
     5e7:	e8 2b 0a 00 00       	call   1017 <open>
     5ec:	83 c4 10             	add    $0x10,%esp
     5ef:	85 c0                	test   %eax,%eax
     5f1:	79 19                	jns    60c <namespacefiletest+0x136>
      printf(1, "namespacefiletest: failed to open file after mount\n");
     5f3:	83 ec 08             	sub    $0x8,%esp
     5f6:	68 28 1a 00 00       	push   $0x1a28
     5fb:	6a 01                	push   $0x1
     5fd:	e8 c6 0b 00 00       	call   11c8 <printf>
      return 1;
     602:	83 c4 10             	add    $0x10,%esp
     605:	bb 01 00 00 00       	mov    $0x1,%ebx
     60a:	eb 42                	jmp    64e <namespacefiletest+0x178>
    }

    close(fd);
     60c:	83 ec 0c             	sub    $0xc,%esp
     60f:	50                   	push   %eax
     610:	e8 ea 09 00 00       	call   fff <close>

    res = umount("b");
     615:	c7 04 24 8e 16 00 00 	movl   $0x168e,(%esp)
     61c:	e8 5e 0a 00 00       	call   107f <umount>
    if (res != 0) {
     621:	83 c4 10             	add    $0x10,%esp
     624:	85 c0                	test   %eax,%eax
     626:	74 26                	je     64e <namespacefiletest+0x178>
      printf(1, "namespacefiletest: umount returned %d\n", res);
     628:	83 ec 04             	sub    $0x4,%esp
     62b:	50                   	push   %eax
     62c:	68 5c 1a 00 00       	push   $0x1a5c
     631:	6a 01                	push   $0x1
     633:	e8 90 0b 00 00       	call   11c8 <printf>
      return 1;
     638:	83 c4 10             	add    $0x10,%esp
     63b:	bb 01 00 00 00       	mov    $0x1,%ebx
     640:	eb 0c                	jmp    64e <namespacefiletest+0x178>
}

static int
namespacefiletest(void) {
  if (mounta() != 0) {
    return 1;
     642:	bb 01 00 00 00       	mov    $0x1,%ebx
     647:	eb 05                	jmp    64e <namespacefiletest+0x178>
    exit(0);
  } else {
    wait(0);

    if (umounta() != 0) {
      return 1;
     649:	bb 01 00 00 00       	mov    $0x1,%ebx
      return 1;
    }

    return 0;
  }
}
     64e:	89 d8                	mov    %ebx,%eax
     650:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     653:	c9                   	leave  
     654:	c3                   	ret    

00000655 <verifyfilecontents>:

  return 0;
}

static int
verifyfilecontents(char *path, char *contents) {
     655:	55                   	push   %ebp
     656:	89 e5                	mov    %esp,%ebp
     658:	57                   	push   %edi
     659:	56                   	push   %esi
     65a:	53                   	push   %ebx
     65b:	81 ec a4 00 00 00    	sub    $0xa4,%esp
     661:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
     667:	89 d7                	mov    %edx,%edi
  int fd;
  struct stat st;
  if((fd = open(path, 0)) < 0){
     669:	6a 00                	push   $0x0
     66b:	50                   	push   %eax
     66c:	e8 a6 09 00 00       	call   1017 <open>
     671:	83 c4 10             	add    $0x10,%esp
     674:	85 c0                	test   %eax,%eax
     676:	79 22                	jns    69a <verifyfilecontents+0x45>
    printf(1, "verifyfilecontents: cannot open %s\n", path);
     678:	83 ec 04             	sub    $0x4,%esp
     67b:	ff b5 64 ff ff ff    	pushl  -0x9c(%ebp)
     681:	68 84 1a 00 00       	push   $0x1a84
     686:	6a 01                	push   $0x1
     688:	e8 3b 0b 00 00       	call   11c8 <printf>
    return -1;
     68d:	83 c4 10             	add    $0x10,%esp
     690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     695:	e9 0a 01 00 00       	jmp    7a4 <verifyfilecontents+0x14f>
     69a:	89 c3                	mov    %eax,%ebx
  }

  if(fstat(fd, &st) < 0){
     69c:	83 ec 08             	sub    $0x8,%esp
     69f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     6a2:	50                   	push   %eax
     6a3:	53                   	push   %ebx
     6a4:	e8 86 09 00 00       	call   102f <fstat>
     6a9:	83 c4 10             	add    $0x10,%esp
     6ac:	85 c0                	test   %eax,%eax
     6ae:	79 2a                	jns    6da <verifyfilecontents+0x85>
    printf(1, "verifyfilecontents: cannot stat %s\n", path);
     6b0:	83 ec 04             	sub    $0x4,%esp
     6b3:	ff b5 64 ff ff ff    	pushl  -0x9c(%ebp)
     6b9:	68 a8 1a 00 00       	push   $0x1aa8
     6be:	6a 01                	push   $0x1
     6c0:	e8 03 0b 00 00       	call   11c8 <printf>
    close(fd);
     6c5:	89 1c 24             	mov    %ebx,(%esp)
     6c8:	e8 32 09 00 00       	call   fff <close>
    return -1;
     6cd:	83 c4 10             	add    $0x10,%esp
     6d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     6d5:	e9 ca 00 00 00       	jmp    7a4 <verifyfilecontents+0x14f>
  }

  int contentlen = strlen(contents);
     6da:	83 ec 0c             	sub    $0xc,%esp
     6dd:	57                   	push   %edi
     6de:	e8 81 06 00 00       	call   d64 <strlen>
     6e3:	89 c6                	mov    %eax,%esi


  if (st.size != contentlen) {
     6e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6e8:	83 c4 10             	add    $0x10,%esp
     6eb:	39 c6                	cmp    %eax,%esi
     6ed:	74 28                	je     717 <verifyfilecontents+0xc2>
    printf(1, "verifyfilecontents: incorrect length (%d) for file %s\n", st.size, path);
     6ef:	ff b5 64 ff ff ff    	pushl  -0x9c(%ebp)
     6f5:	50                   	push   %eax
     6f6:	68 cc 1a 00 00       	push   $0x1acc
     6fb:	6a 01                	push   $0x1
     6fd:	e8 c6 0a 00 00       	call   11c8 <printf>
    close(fd);
     702:	89 1c 24             	mov    %ebx,(%esp)
     705:	e8 f5 08 00 00       	call   fff <close>
    return -1;
     70a:	83 c4 10             	add    $0x10,%esp
     70d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     712:	e9 8d 00 00 00       	jmp    7a4 <verifyfilecontents+0x14f>
  }

  char buf[100];
  int res;
  if ((res = read(fd, buf, contentlen)) != contentlen) {
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	56                   	push   %esi
     71b:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
     721:	50                   	push   %eax
     722:	53                   	push   %ebx
     723:	e8 c7 08 00 00       	call   fef <read>
     728:	83 c4 10             	add    $0x10,%esp
     72b:	39 c6                	cmp    %eax,%esi
     72d:	74 25                	je     754 <verifyfilecontents+0xff>
    printf(1, "verifyfilecontents: incorrect length read (%d) for file %s\n", res, path);
     72f:	ff b5 64 ff ff ff    	pushl  -0x9c(%ebp)
     735:	50                   	push   %eax
     736:	68 04 1b 00 00       	push   $0x1b04
     73b:	6a 01                	push   $0x1
     73d:	e8 86 0a 00 00       	call   11c8 <printf>
    close(fd);
     742:	89 1c 24             	mov    %ebx,(%esp)
     745:	e8 b5 08 00 00       	call   fff <close>
    return -1;
     74a:	83 c4 10             	add    $0x10,%esp
     74d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     752:	eb 50                	jmp    7a4 <verifyfilecontents+0x14f>
  }
  buf[contentlen] = '\0';
     754:	c6 84 35 70 ff ff ff 	movb   $0x0,-0x90(%ebp,%esi,1)
     75b:	00 
  close(fd);
     75c:	83 ec 0c             	sub    $0xc,%esp
     75f:	53                   	push   %ebx
     760:	e8 9a 08 00 00       	call   fff <close>

  if ((res = strcmp(contents, buf)) != 0) {
     765:	83 c4 08             	add    $0x8,%esp
     768:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
     76e:	50                   	push   %eax
     76f:	57                   	push   %edi
     770:	e8 99 05 00 00       	call   d0e <strcmp>
     775:	83 c4 10             	add    $0x10,%esp
     778:	85 c0                	test   %eax,%eax
     77a:	74 23                	je     79f <verifyfilecontents+0x14a>
    printf(1, "verifyfilecontents: incorrect content read (%s) for file %s\n", buf, path); 
     77c:	ff b5 64 ff ff ff    	pushl  -0x9c(%ebp)
     782:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
     788:	50                   	push   %eax
     789:	68 40 1b 00 00       	push   $0x1b40
     78e:	6a 01                	push   $0x1
     790:	e8 33 0a 00 00       	call   11c8 <printf>
    return -1;
     795:	83 c4 10             	add    $0x10,%esp
     798:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     79d:	eb 05                	jmp    7a4 <verifyfilecontents+0x14f>
  }

  return 0;
     79f:	b8 00 00 00 00       	mov    $0x0,%eax
}
     7a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7a7:	5b                   	pop    %ebx
     7a8:	5e                   	pop    %esi
     7a9:	5f                   	pop    %edi
     7aa:	5d                   	pop    %ebp
     7ab:	c3                   	ret    

000007ac <devicefilestoretest>:

  return 0;
}

static int
devicefilestoretest(void) {
     7ac:	55                   	push   %ebp
     7ad:	89 e5                	mov    %esp,%ebp
     7af:	53                   	push   %ebx
     7b0:	83 ec 04             	sub    $0x4,%esp
  if (mounta() != 0) {
     7b3:	e8 80 f8 ff ff       	call   38 <mounta>
     7b8:	85 c0                	test   %eax,%eax
     7ba:	0f 85 bb 00 00 00    	jne    87b <devicefilestoretest+0xcf>
    return 1;
  }

  if (createfile("a/devicefilestoretest", "ababab") != 0) {
     7c0:	ba 53 16 00 00       	mov    $0x1653,%edx
     7c5:	b8 5a 16 00 00       	mov    $0x165a,%eax
     7ca:	e8 76 fc ff ff       	call   445 <createfile>
     7cf:	85 c0                	test   %eax,%eax
     7d1:	0f 85 ab 00 00 00    	jne    882 <devicefilestoretest+0xd6>
    return 1;
  }

  if (umounta() != 0) {
     7d7:	e8 24 f8 ff ff       	call   0 <umounta>
     7dc:	85 c0                	test   %eax,%eax
     7de:	0f 85 a5 00 00 00    	jne    889 <devicefilestoretest+0xdd>
    return 1;
  }

  mkdir("ccc");
     7e4:	83 ec 0c             	sub    $0xc,%esp
     7e7:	68 70 16 00 00       	push   $0x1670
     7ec:	e8 4e 08 00 00       	call   103f <mkdir>
  int res = mount("internal_fs_a", "ccc", 0);
     7f1:	83 c4 0c             	add    $0xc,%esp
     7f4:	6a 00                	push   $0x0
     7f6:	68 70 16 00 00       	push   $0x1670
     7fb:	68 bd 15 00 00       	push   $0x15bd
     800:	e8 72 08 00 00       	call   1077 <mount>
  if (res != 0) {
     805:	83 c4 10             	add    $0x10,%esp
     808:	85 c0                	test   %eax,%eax
     80a:	74 1a                	je     826 <devicefilestoretest+0x7a>
    printf(1, "devicefilestoretest: mount returned %d\n", res);
     80c:	83 ec 04             	sub    $0x4,%esp
     80f:	50                   	push   %eax
     810:	68 80 1b 00 00       	push   $0x1b80
     815:	6a 01                	push   $0x1
     817:	e8 ac 09 00 00       	call   11c8 <printf>
    return 1;
     81c:	83 c4 10             	add    $0x10,%esp
     81f:	bb 01 00 00 00       	mov    $0x1,%ebx
     824:	eb 6f                	jmp    895 <devicefilestoretest+0xe9>
  }

  if (verifyfilecontents("ccc/devicefilestoretest", "ababab") != 0) {
     826:	ba 53 16 00 00       	mov    $0x1653,%edx
     82b:	b8 74 16 00 00       	mov    $0x1674,%eax
     830:	e8 20 fe ff ff       	call   655 <verifyfilecontents>
     835:	89 c3                	mov    %eax,%ebx
     837:	85 c0                	test   %eax,%eax
     839:	75 55                	jne    890 <devicefilestoretest+0xe4>
    return 1;
  }

  res = umount("ccc");
     83b:	83 ec 0c             	sub    $0xc,%esp
     83e:	68 70 16 00 00       	push   $0x1670
     843:	e8 37 08 00 00       	call   107f <umount>
  if (res != 0) {
     848:	83 c4 10             	add    $0x10,%esp
     84b:	85 c0                	test   %eax,%eax
     84d:	74 1a                	je     869 <devicefilestoretest+0xbd>
    printf(1, "devicefilestoretest: umount did not fail as expected %d\n", res);
     84f:	83 ec 04             	sub    $0x4,%esp
     852:	50                   	push   %eax
     853:	68 a8 1b 00 00       	push   $0x1ba8
     858:	6a 01                	push   $0x1
     85a:	e8 69 09 00 00       	call   11c8 <printf>
    return 1;
     85f:	83 c4 10             	add    $0x10,%esp
     862:	bb 01 00 00 00       	mov    $0x1,%ebx
     867:	eb 2c                	jmp    895 <devicefilestoretest+0xe9>
  }

  unlink("ccc");
     869:	83 ec 0c             	sub    $0xc,%esp
     86c:	68 70 16 00 00       	push   $0x1670
     871:	e8 b1 07 00 00       	call   1027 <unlink>

  return 0;
     876:	83 c4 10             	add    $0x10,%esp
     879:	eb 1a                	jmp    895 <devicefilestoretest+0xe9>
}

static int
devicefilestoretest(void) {
  if (mounta() != 0) {
    return 1;
     87b:	bb 01 00 00 00       	mov    $0x1,%ebx
     880:	eb 13                	jmp    895 <devicefilestoretest+0xe9>
  }

  if (createfile("a/devicefilestoretest", "ababab") != 0) {
    return 1;
     882:	bb 01 00 00 00       	mov    $0x1,%ebx
     887:	eb 0c                	jmp    895 <devicefilestoretest+0xe9>
  }

  if (umounta() != 0) {
    return 1;
     889:	bb 01 00 00 00       	mov    $0x1,%ebx
     88e:	eb 05                	jmp    895 <devicefilestoretest+0xe9>
    printf(1, "devicefilestoretest: mount returned %d\n", res);
    return 1;
  }

  if (verifyfilecontents("ccc/devicefilestoretest", "ababab") != 0) {
    return 1;
     890:	bb 01 00 00 00       	mov    $0x1,%ebx
  }

  unlink("ccc");

  return 0;
}
     895:	89 d8                	mov    %ebx,%eax
     897:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     89a:	c9                   	leave  
     89b:	c3                   	ret    

0000089c <testfile>:

  return 0;
}

static int
testfile(char *path) {
     89c:	55                   	push   %ebp
     89d:	89 e5                	mov    %esp,%ebp
     89f:	53                   	push   %ebx
     8a0:	83 ec 04             	sub    $0x4,%esp
     8a3:	89 c3                	mov    %eax,%ebx
  if (createfile(path, "aaa") != 0) {
     8a5:	ba 42 16 00 00       	mov    $0x1642,%edx
     8aa:	e8 96 fb ff ff       	call   445 <createfile>
     8af:	85 c0                	test   %eax,%eax
     8b1:	75 17                	jne    8ca <testfile+0x2e>
    return -1;
  }

  if (verifyfilecontents(path, "aaa") != 0) {
     8b3:	ba 42 16 00 00       	mov    $0x1642,%edx
     8b8:	89 d8                	mov    %ebx,%eax
     8ba:	e8 96 fd ff ff       	call   655 <verifyfilecontents>
     8bf:	85 c0                	test   %eax,%eax
     8c1:	74 0c                	je     8cf <testfile+0x33>
    return -1;
     8c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     8c8:	eb 05                	jmp    8cf <testfile+0x33>
}

static int
testfile(char *path) {
  if (createfile(path, "aaa") != 0) {
    return -1;
     8ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if (verifyfilecontents(path, "aaa") != 0) {
    return -1;
  }

  return 0;
}
     8cf:	83 c4 04             	add    $0x4,%esp
     8d2:	5b                   	pop    %ebx
     8d3:	5d                   	pop    %ebp
     8d4:	c3                   	ret    

000008d5 <nestedmounttest>:

  return 0;
}

static int
nestedmounttest(void) {
     8d5:	55                   	push   %ebp
     8d6:	89 e5                	mov    %esp,%ebp
     8d8:	83 ec 08             	sub    $0x8,%esp
  if (mounta() != 0) {
     8db:	e8 58 f7 ff ff       	call   38 <mounta>
     8e0:	85 c0                	test   %eax,%eax
     8e2:	0f 85 c0 00 00 00    	jne    9a8 <nestedmounttest+0xd3>
    return 1;
  }

  mkdir("a/b");
     8e8:	83 ec 0c             	sub    $0xc,%esp
     8eb:	68 8c 16 00 00       	push   $0x168c
     8f0:	e8 4a 07 00 00       	call   103f <mkdir>
  int res = mount("internal_fs_b", "a/b", 0);
     8f5:	83 c4 0c             	add    $0xc,%esp
     8f8:	6a 00                	push   $0x0
     8fa:	68 8c 16 00 00       	push   $0x168c
     8ff:	68 e9 15 00 00       	push   $0x15e9
     904:	e8 6e 07 00 00       	call   1077 <mount>
  if (res != 0) {
     909:	83 c4 10             	add    $0x10,%esp
     90c:	85 c0                	test   %eax,%eax
     90e:	74 1d                	je     92d <nestedmounttest+0x58>
    printf(1, "nestedmounttest: mount returned %d\n", res);
     910:	83 ec 04             	sub    $0x4,%esp
     913:	50                   	push   %eax
     914:	68 e4 1b 00 00       	push   $0x1be4
     919:	6a 01                	push   $0x1
     91b:	e8 a8 08 00 00       	call   11c8 <printf>
    return 1;
     920:	83 c4 10             	add    $0x10,%esp
     923:	b8 01 00 00 00       	mov    $0x1,%eax
     928:	e9 87 00 00 00       	jmp    9b4 <nestedmounttest+0xdf>
  }

  if (testfile("a/b/test1") != 0) {
     92d:	b8 90 16 00 00       	mov    $0x1690,%eax
     932:	e8 65 ff ff ff       	call   89c <testfile>
     937:	85 c0                	test   %eax,%eax
     939:	75 74                	jne    9af <nestedmounttest+0xda>
    return 1;
  }

  res = umount("a");
     93b:	83 ec 0c             	sub    $0xc,%esp
     93e:	68 c9 15 00 00       	push   $0x15c9
     943:	e8 37 07 00 00       	call   107f <umount>
  if (res != -1) {
     948:	83 c4 10             	add    $0x10,%esp
     94b:	83 f8 ff             	cmp    $0xffffffff,%eax
     94e:	74 1a                	je     96a <nestedmounttest+0x95>
    printf(1, "nestedmounttest: umount did not fail as expected %d\n", res);
     950:	83 ec 04             	sub    $0x4,%esp
     953:	50                   	push   %eax
     954:	68 08 1c 00 00       	push   $0x1c08
     959:	6a 01                	push   $0x1
     95b:	e8 68 08 00 00       	call   11c8 <printf>
    return 1;
     960:	83 c4 10             	add    $0x10,%esp
     963:	b8 01 00 00 00       	mov    $0x1,%eax
     968:	eb 4a                	jmp    9b4 <nestedmounttest+0xdf>
  }

  res = umount("a/b");
     96a:	83 ec 0c             	sub    $0xc,%esp
     96d:	68 8c 16 00 00       	push   $0x168c
     972:	e8 08 07 00 00       	call   107f <umount>
  if (res != 0) {
     977:	83 c4 10             	add    $0x10,%esp
     97a:	85 c0                	test   %eax,%eax
     97c:	74 1a                	je     998 <nestedmounttest+0xc3>
    printf(1, "nestedmounttest: umount returned %d\n", res);
     97e:	83 ec 04             	sub    $0x4,%esp
     981:	50                   	push   %eax
     982:	68 40 1c 00 00       	push   $0x1c40
     987:	6a 01                	push   $0x1
     989:	e8 3a 08 00 00       	call   11c8 <printf>
    return 1;
     98e:	83 c4 10             	add    $0x10,%esp
     991:	b8 01 00 00 00       	mov    $0x1,%eax
     996:	eb 1c                	jmp    9b4 <nestedmounttest+0xdf>
  }

  if (umounta() != 0) {
     998:	e8 63 f6 ff ff       	call   0 <umounta>
     99d:	85 c0                	test   %eax,%eax
     99f:	74 13                	je     9b4 <nestedmounttest+0xdf>
    return 1;
     9a1:	b8 01 00 00 00       	mov    $0x1,%eax
     9a6:	eb 0c                	jmp    9b4 <nestedmounttest+0xdf>
}

static int
nestedmounttest(void) {
  if (mounta() != 0) {
    return 1;
     9a8:	b8 01 00 00 00       	mov    $0x1,%eax
     9ad:	eb 05                	jmp    9b4 <nestedmounttest+0xdf>
    printf(1, "nestedmounttest: mount returned %d\n", res);
    return 1;
  }

  if (testfile("a/b/test1") != 0) {
    return 1;
     9af:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     9b4:	c9                   	leave  
     9b5:	c3                   	ret    

000009b6 <directorywithintest>:

  return 0;
}

static int
directorywithintest(void) {
     9b6:	55                   	push   %ebp
     9b7:	89 e5                	mov    %esp,%ebp
     9b9:	83 ec 08             	sub    $0x8,%esp
  if (mounta() != 0) {
     9bc:	e8 77 f6 ff ff       	call   38 <mounta>
     9c1:	85 c0                	test   %eax,%eax
     9c3:	75 2e                	jne    9f3 <directorywithintest+0x3d>
    return 1;
  }

  mkdir ("a/ttt");
     9c5:	83 ec 0c             	sub    $0xc,%esp
     9c8:	68 9a 16 00 00       	push   $0x169a
     9cd:	e8 6d 06 00 00       	call   103f <mkdir>
  if (testfile("a/ttt/test1") != 0) {
     9d2:	b8 a0 16 00 00       	mov    $0x16a0,%eax
     9d7:	e8 c0 fe ff ff       	call   89c <testfile>
     9dc:	83 c4 10             	add    $0x10,%esp
     9df:	85 c0                	test   %eax,%eax
     9e1:	75 17                	jne    9fa <directorywithintest+0x44>
    return 1;
  }

  if (umounta() != 0) {
     9e3:	e8 18 f6 ff ff       	call   0 <umounta>
     9e8:	85 c0                	test   %eax,%eax
     9ea:	74 13                	je     9ff <directorywithintest+0x49>
    return 1;
     9ec:	b8 01 00 00 00       	mov    $0x1,%eax
     9f1:	eb 0c                	jmp    9ff <directorywithintest+0x49>
}

static int
directorywithintest(void) {
  if (mounta() != 0) {
    return 1;
     9f3:	b8 01 00 00 00       	mov    $0x1,%eax
     9f8:	eb 05                	jmp    9ff <directorywithintest+0x49>
  }

  mkdir ("a/ttt");
  if (testfile("a/ttt/test1") != 0) {
    return 1;
     9fa:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     9ff:	c9                   	leave  
     a00:	c3                   	ret    

00000a01 <writefiletest>:
  }
  return 0;
}

static int
writefiletest(void) {
     a01:	55                   	push   %ebp
     a02:	89 e5                	mov    %esp,%ebp
     a04:	83 ec 08             	sub    $0x8,%esp
  if (mounta() != 0) {
     a07:	e8 2c f6 ff ff       	call   38 <mounta>
     a0c:	85 c0                	test   %eax,%eax
     a0e:	75 1e                	jne    a2e <writefiletest+0x2d>
    return 1;
  }

  if (testfile("a/test1") != 0) {
     a10:	b8 ac 16 00 00       	mov    $0x16ac,%eax
     a15:	e8 82 fe ff ff       	call   89c <testfile>
     a1a:	85 c0                	test   %eax,%eax
     a1c:	75 17                	jne    a35 <writefiletest+0x34>
    return 1;
  }

  if (umounta() != 0) {
     a1e:	e8 dd f5 ff ff       	call   0 <umounta>
     a23:	85 c0                	test   %eax,%eax
     a25:	74 13                	je     a3a <writefiletest+0x39>
    return 1;
     a27:	b8 01 00 00 00       	mov    $0x1,%eax
     a2c:	eb 0c                	jmp    a3a <writefiletest+0x39>
}

static int
writefiletest(void) {
  if (mounta() != 0) {
    return 1;
     a2e:	b8 01 00 00 00       	mov    $0x1,%eax
     a33:	eb 05                	jmp    a3a <writefiletest+0x39>
  }

  if (testfile("a/test1") != 0) {
    return 1;
     a35:	b8 01 00 00 00       	mov    $0x1,%eax
  if (umounta() != 0) {
    return 1;
  }

  return 0;
}
     a3a:	c9                   	leave  
     a3b:	c3                   	ret    

00000a3c <check>:

typedef int(*test_func_t)(void);
int testsPassed = 0; /*In case all tests passed, this value will remain 0, else
			it will become 1*/

int check(int r, const char *msg) {
     a3c:	55                   	push   %ebp
     a3d:	89 e5                	mov    %esp,%ebp
     a3f:	83 ec 08             	sub    $0x8,%esp
     a42:	8b 45 08             	mov    0x8(%ebp),%eax
  if (r < 0) {
     a45:	85 c0                	test   %eax,%eax
     a47:	79 1e                	jns    a67 <check+0x2b>
    printf(stderr, "%s\n", (char *)msg);
     a49:	83 ec 04             	sub    $0x4,%esp
     a4c:	ff 75 0c             	pushl  0xc(%ebp)
     a4f:	68 22 16 00 00       	push   $0x1622
     a54:	6a 02                	push   $0x2
     a56:	e8 6d 07 00 00       	call   11c8 <printf>
    exit(1);
     a5b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a62:	e8 70 05 00 00       	call   fd7 <exit>
  }

  return r;
}
     a67:	c9                   	leave  
     a68:	c3                   	ret    

00000a69 <child_exit_status>:

static int child_exit_status(int pid) {
     a69:	55                   	push   %ebp
     a6a:	89 e5                	mov    %esp,%ebp
     a6c:	53                   	push   %ebx
     a6d:	83 ec 14             	sub    $0x14,%esp
     a70:	89 c3                	mov    %eax,%ebx
  int changed_pid = -1;
  int wstatus;
  do {
    changed_pid = check(wait(&wstatus), "failed to waitpid");
     a72:	83 ec 0c             	sub    $0xc,%esp
     a75:	8d 45 f4             	lea    -0xc(%ebp),%eax
     a78:	50                   	push   %eax
     a79:	e8 61 05 00 00       	call   fdf <wait>
     a7e:	83 c4 08             	add    $0x8,%esp
     a81:	68 b4 16 00 00       	push   $0x16b4
     a86:	50                   	push   %eax
     a87:	e8 b0 ff ff ff       	call   a3c <check>
  } while (changed_pid != pid);
     a8c:	83 c4 10             	add    $0x10,%esp
     a8f:	39 d8                	cmp    %ebx,%eax
     a91:	75 df                	jne    a72 <child_exit_status+0x9>

  return WEXITSTATUS(wstatus);
     a93:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a96:	c1 f8 08             	sar    $0x8,%eax
}
     a99:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a9c:	c9                   	leave  
     a9d:	c3                   	ret    

00000a9e <statroottest>:

  return 0;
}

static int
statroottest(void) {
     a9e:	55                   	push   %ebp
     a9f:	89 e5                	mov    %esp,%ebp
     aa1:	83 ec 28             	sub    $0x28,%esp
  int pid = fork();
     aa4:	e8 26 05 00 00       	call   fcf <fork>

  if (pid < 0) {
     aa9:	85 c0                	test   %eax,%eax
     aab:	78 57                	js     b04 <statroottest+0x66>
    return 1; // exit on error in fork
  }

  if (pid == 0) {
     aad:	85 c0                	test   %eax,%eax
     aaf:	75 10                	jne    ac1 <statroottest+0x23>
    // in child, only mount
    if (mounta() != 0) {
     ab1:	e8 82 f5 ff ff       	call   38 <mounta>
     ab6:	85 c0                	test   %eax,%eax
     ab8:	74 6b                	je     b25 <statroottest+0x87>
      return 1;
     aba:	b8 01 00 00 00       	mov    $0x1,%eax
     abf:	eb 64                	jmp    b25 <statroottest+0x87>
    }
    return 0;
  }

  int ret_val = child_exit_status(pid); // get child exit status
     ac1:	e8 a3 ff ff ff       	call   a69 <child_exit_status>
  if (ret_val != 0) {
     ac6:	85 c0                	test   %eax,%eax
     ac8:	75 41                	jne    b0b <statroottest+0x6d>
    return 1;
  }

  struct stat st;
  stat("a", &st);
     aca:	83 ec 08             	sub    $0x8,%esp
     acd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     ad0:	50                   	push   %eax
     ad1:	68 c9 15 00 00       	push   $0x15c9
     ad6:	e8 36 03 00 00       	call   e11 <stat>
  if (st.type != T_DIR || st.ino != 1 || st.size != BSIZE) {
     adb:	83 c4 10             	add    $0x10,%esp
     ade:	66 83 7d e4 01       	cmpw   $0x1,-0x1c(%ebp)
     ae3:	75 2d                	jne    b12 <statroottest+0x74>
     ae5:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
     ae9:	75 2e                	jne    b19 <statroottest+0x7b>
     aeb:	81 7d f4 00 04 00 00 	cmpl   $0x400,-0xc(%ebp)
     af2:	75 2c                	jne    b20 <statroottest+0x82>
    return 1;
  }

  if (umounta() != 0) {
     af4:	e8 07 f5 ff ff       	call   0 <umounta>
     af9:	85 c0                	test   %eax,%eax
     afb:	74 28                	je     b25 <statroottest+0x87>
    return 1;
     afd:	b8 01 00 00 00       	mov    $0x1,%eax
     b02:	eb 21                	jmp    b25 <statroottest+0x87>
static int
statroottest(void) {
  int pid = fork();

  if (pid < 0) {
    return 1; // exit on error in fork
     b04:	b8 01 00 00 00       	mov    $0x1,%eax
     b09:	eb 1a                	jmp    b25 <statroottest+0x87>
    return 0;
  }

  int ret_val = child_exit_status(pid); // get child exit status
  if (ret_val != 0) {
    return 1;
     b0b:	b8 01 00 00 00       	mov    $0x1,%eax
     b10:	eb 13                	jmp    b25 <statroottest+0x87>
  }

  struct stat st;
  stat("a", &st);
  if (st.type != T_DIR || st.ino != 1 || st.size != BSIZE) {
    return 1;
     b12:	b8 01 00 00 00       	mov    $0x1,%eax
     b17:	eb 0c                	jmp    b25 <statroottest+0x87>
     b19:	b8 01 00 00 00       	mov    $0x1,%eax
     b1e:	eb 05                	jmp    b25 <statroottest+0x87>
     b20:	b8 01 00 00 00       	mov    $0x1,%eax

  if (umounta() != 0) {
    return 1;
  }
  return 0;
}
     b25:	c9                   	leave  
     b26:	c3                   	ret    

00000b27 <run_test>:


/*This function runs the test, if a test fails, it will print which test failed,
and set the variable testsPassed to be 1*/
void run_test(test_func_t func, const char *name) {
     b27:	55                   	push   %ebp
     b28:	89 e5                	mov    %esp,%ebp
     b2a:	83 ec 08             	sub    $0x8,%esp
  int pid = -1;

  int ret = check(fork(), "fork failed");
     b2d:	e8 9d 04 00 00       	call   fcf <fork>
     b32:	83 ec 08             	sub    $0x8,%esp
     b35:	68 c6 16 00 00       	push   $0x16c6
     b3a:	50                   	push   %eax
     b3b:	e8 fc fe ff ff       	call   a3c <check>
  if (ret == 0) {
     b40:	83 c4 10             	add    $0x10,%esp
     b43:	85 c0                	test   %eax,%eax
     b45:	75 0c                	jne    b53 <run_test+0x2c>
    exit(func());
     b47:	ff 55 08             	call   *0x8(%ebp)
     b4a:	83 ec 0c             	sub    $0xc,%esp
     b4d:	50                   	push   %eax
     b4e:	e8 84 04 00 00       	call   fd7 <exit>
  }

  pid = ret;
  if (child_exit_status(pid) != 0) { /*Test failed*/
     b53:	e8 11 ff ff ff       	call   a69 <child_exit_status>
     b58:	85 c0                	test   %eax,%eax
     b5a:	74 1f                	je     b7b <run_test+0x54>
    printf(stderr, "failed test - '%s'\n", name);
     b5c:	83 ec 04             	sub    $0x4,%esp
     b5f:	ff 75 0c             	pushl  0xc(%ebp)
     b62:	68 d2 16 00 00       	push   $0x16d2
     b67:	6a 02                	push   $0x2
     b69:	e8 5a 06 00 00       	call   11c8 <printf>
    testsPassed = 1; /*Denotes some test has failed to pass*/
     b6e:	c7 05 00 30 00 00 01 	movl   $0x1,0x3000
     b75:	00 00 00 
     b78:	83 c4 10             	add    $0x10,%esp
  }
     b7b:	c9                   	leave  
     b7c:	c3                   	ret    

00000b7d <main>:



int
main(int argc, char *argv[])
{
     b7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     b81:	83 e4 f0             	and    $0xfffffff0,%esp
     b84:	ff 71 fc             	pushl  -0x4(%ecx)
     b87:	55                   	push   %ebp
     b88:	89 e5                	mov    %esp,%ebp
     b8a:	51                   	push   %ecx
     b8b:	83 ec 0c             	sub    $0xc,%esp
  printf(stderr, "Running all mounttest\n");
     b8e:	68 e6 16 00 00       	push   $0x16e6
     b93:	6a 02                	push   $0x2
     b95:	e8 2e 06 00 00       	call   11c8 <printf>
  run_test(mounttest, "mounttest");
     b9a:	83 c4 08             	add    $0x8,%esp
     b9d:	68 64 17 00 00       	push   $0x1764
     ba2:	68 6f 01 00 00       	push   $0x16f
     ba7:	e8 7b ff ff ff       	call   b27 <run_test>
  run_test(statroottest, "statroottest");
     bac:	83 c4 08             	add    $0x8,%esp
     baf:	68 fd 16 00 00       	push   $0x16fd
     bb4:	68 9e 0a 00 00       	push   $0xa9e
     bb9:	e8 69 ff ff ff       	call   b27 <run_test>
  run_test(invalidpathtest, "invalidpathtest");
     bbe:	83 c4 08             	add    $0x8,%esp
     bc1:	68 0a 17 00 00       	push   $0x170a
     bc6:	68 8f 02 00 00       	push   $0x28f
     bcb:	e8 57 ff ff ff       	call   b27 <run_test>
  run_test(doublemounttest, "doublemounttest");
     bd0:	83 c4 08             	add    $0x8,%esp
     bd3:	68 1a 17 00 00       	push   $0x171a
     bd8:	68 f1 01 00 00       	push   $0x1f1
     bdd:	e8 45 ff ff ff       	call   b27 <run_test>
  run_test(samedirectorytest, "samedirectorytest");
     be2:	83 c4 08             	add    $0x8,%esp
     be5:	68 2a 17 00 00       	push   $0x172a
     bea:	68 95 01 00 00       	push   $0x195
     bef:	e8 33 ff ff ff       	call   b27 <run_test>
  run_test(writefiletest, "writefiletest");
     bf4:	83 c4 08             	add    $0x8,%esp
     bf7:	68 3c 17 00 00       	push   $0x173c
     bfc:	68 01 0a 00 00       	push   $0xa01
     c01:	e8 21 ff ff ff       	call   b27 <run_test>
  run_test(directorywithintest, "directorywithintest");
     c06:	83 c4 08             	add    $0x8,%esp
     c09:	68 4a 17 00 00       	push   $0x174a
     c0e:	68 b6 09 00 00       	push   $0x9b6
     c13:	e8 0f ff ff ff       	call   b27 <run_test>
  run_test(nestedmounttest, "nestedmounttest");
     c18:	83 c4 08             	add    $0x8,%esp
     c1b:	68 5e 17 00 00       	push   $0x175e
     c20:	68 d5 08 00 00       	push   $0x8d5
     c25:	e8 fd fe ff ff       	call   b27 <run_test>
  run_test(devicefilestoretest, "devicefilestoretest");
     c2a:	83 c4 08             	add    $0x8,%esp
     c2d:	68 5c 16 00 00       	push   $0x165c
     c32:	68 ac 07 00 00       	push   $0x7ac
     c37:	e8 eb fe ff ff       	call   b27 <run_test>
  run_test(umountwithopenfiletest, "umountwithopenfiletest");
     c3c:	83 c4 08             	add    $0x8,%esp
     c3f:	68 6e 17 00 00       	push   $0x176e
     c44:	68 ac 03 00 00       	push   $0x3ac
     c49:	e8 d9 fe ff ff       	call   b27 <run_test>
  run_test(errorondeletedevicetest, "errorondeletedevicetest");
     c4e:	83 c4 08             	add    $0x8,%esp
     c51:	68 85 17 00 00       	push   $0x1785
     c56:	68 1a 01 00 00       	push   $0x11a
     c5b:	e8 c7 fe ff ff       	call   b27 <run_test>
  run_test(namespacetest, "namespacetest");
     c60:	83 c4 08             	add    $0x8,%esp
     c63:	68 9d 17 00 00       	push   $0x179d
     c68:	68 55 03 00 00       	push   $0x355
     c6d:	e8 b5 fe ff ff       	call   b27 <run_test>
  run_test(namespacefiletest, "namespacefiletest");
     c72:	83 c4 08             	add    $0x8,%esp
     c75:	68 ab 17 00 00       	push   $0x17ab
     c7a:	68 d6 04 00 00       	push   $0x4d6
     c7f:	e8 a3 fe ff ff       	call   b27 <run_test>
  run_test(cdinthenouttest, "cdinthenouttest");
     c84:	83 c4 08             	add    $0x8,%esp
     c87:	68 bd 17 00 00       	push   $0x17bd
     c8c:	68 84 00 00 00       	push   $0x84
     c91:	e8 91 fe ff ff       	call   b27 <run_test>

  unlink("a");
     c96:	c7 04 24 c9 15 00 00 	movl   $0x15c9,(%esp)
     c9d:	e8 85 03 00 00       	call   1027 <unlink>
  unlink("b");
     ca2:	c7 04 24 8e 16 00 00 	movl   $0x168e,(%esp)
     ca9:	e8 79 03 00 00       	call   1027 <unlink>

  if (testsPassed == 0) {
     cae:	83 c4 10             	add    $0x10,%esp
     cb1:	83 3d 00 30 00 00 00 	cmpl   $0x0,0x3000
     cb8:	75 1b                	jne    cd5 <main+0x158>
    printf(stderr, "mounttest tests passed successfully\n");
     cba:	83 ec 08             	sub    $0x8,%esp
     cbd:	68 68 1c 00 00       	push   $0x1c68
     cc2:	6a 02                	push   $0x2
     cc4:	e8 ff 04 00 00       	call   11c8 <printf>
    exit(0);
     cc9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cd0:	e8 02 03 00 00       	call   fd7 <exit>
  }
  else {
    printf(stderr, "mounttest tests failed to pass\n");
     cd5:	83 ec 08             	sub    $0x8,%esp
     cd8:	68 90 1c 00 00       	push   $0x1c90
     cdd:	6a 02                	push   $0x2
     cdf:	e8 e4 04 00 00       	call   11c8 <printf>
    exit(1);
     ce4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ceb:	e8 e7 02 00 00       	call   fd7 <exit>

00000cf0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	53                   	push   %ebx
     cf4:	8b 45 08             	mov    0x8(%ebp),%eax
     cf7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     cfa:	89 c2                	mov    %eax,%edx
     cfc:	0f b6 19             	movzbl (%ecx),%ebx
     cff:	88 1a                	mov    %bl,(%edx)
     d01:	8d 52 01             	lea    0x1(%edx),%edx
     d04:	8d 49 01             	lea    0x1(%ecx),%ecx
     d07:	84 db                	test   %bl,%bl
     d09:	75 f1                	jne    cfc <strcpy+0xc>
    ;
  return os;
}
     d0b:	5b                   	pop    %ebx
     d0c:	5d                   	pop    %ebp
     d0d:	c3                   	ret    

00000d0e <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d0e:	55                   	push   %ebp
     d0f:	89 e5                	mov    %esp,%ebp
     d11:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d14:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     d17:	eb 06                	jmp    d1f <strcmp+0x11>
    p++, q++;
     d19:	83 c1 01             	add    $0x1,%ecx
     d1c:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d1f:	0f b6 01             	movzbl (%ecx),%eax
     d22:	84 c0                	test   %al,%al
     d24:	74 04                	je     d2a <strcmp+0x1c>
     d26:	3a 02                	cmp    (%edx),%al
     d28:	74 ef                	je     d19 <strcmp+0xb>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     d2a:	0f b6 c0             	movzbl %al,%eax
     d2d:	0f b6 12             	movzbl (%edx),%edx
     d30:	29 d0                	sub    %edx,%eax
}
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    

00000d34 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
     d34:	55                   	push   %ebp
     d35:	89 e5                	mov    %esp,%ebp
     d37:	53                   	push   %ebx
     d38:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d3b:	8b 55 0c             	mov    0xc(%ebp),%edx
     d3e:	8b 5d 10             	mov    0x10(%ebp),%ebx
  while(*p && *p == *q && --n)
     d41:	eb 06                	jmp    d49 <strncmp+0x15>
    p++, q++;
     d43:	83 c1 01             	add    $0x1,%ecx
     d46:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     d49:	0f b6 01             	movzbl (%ecx),%eax
     d4c:	84 c0                	test   %al,%al
     d4e:	74 09                	je     d59 <strncmp+0x25>
     d50:	3a 02                	cmp    (%edx),%al
     d52:	75 05                	jne    d59 <strncmp+0x25>
     d54:	83 eb 01             	sub    $0x1,%ebx
     d57:	75 ea                	jne    d43 <strncmp+0xf>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     d59:	0f b6 c0             	movzbl %al,%eax
     d5c:	0f b6 12             	movzbl (%edx),%edx
     d5f:	29 d0                	sub    %edx,%eax
}
     d61:	5b                   	pop    %ebx
     d62:	5d                   	pop    %ebp
     d63:	c3                   	ret    

00000d64 <strlen>:

uint
strlen(const char *s)
{
     d64:	55                   	push   %ebp
     d65:	89 e5                	mov    %esp,%ebp
     d67:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     d6a:	ba 00 00 00 00       	mov    $0x0,%edx
     d6f:	eb 03                	jmp    d74 <strlen+0x10>
     d71:	83 c2 01             	add    $0x1,%edx
     d74:	89 d0                	mov    %edx,%eax
     d76:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     d7a:	75 f5                	jne    d71 <strlen+0xd>
    ;
  return n;
}
     d7c:	5d                   	pop    %ebp
     d7d:	c3                   	ret    

00000d7e <memset>:

void*
memset(void *dst, int c, uint n)
{
     d7e:	55                   	push   %ebp
     d7f:	89 e5                	mov    %esp,%ebp
     d81:	57                   	push   %edi
     d82:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     d85:	89 d7                	mov    %edx,%edi
     d87:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d8a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d8d:	fc                   	cld    
     d8e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d90:	89 d0                	mov    %edx,%eax
     d92:	5f                   	pop    %edi
     d93:	5d                   	pop    %ebp
     d94:	c3                   	ret    

00000d95 <strchr>:

char*
strchr(const char *s, char c)
{
     d95:	55                   	push   %ebp
     d96:	89 e5                	mov    %esp,%ebp
     d98:	8b 45 08             	mov    0x8(%ebp),%eax
     d9b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d9f:	eb 07                	jmp    da8 <strchr+0x13>
    if(*s == c)
     da1:	38 ca                	cmp    %cl,%dl
     da3:	74 0f                	je     db4 <strchr+0x1f>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     da5:	83 c0 01             	add    $0x1,%eax
     da8:	0f b6 10             	movzbl (%eax),%edx
     dab:	84 d2                	test   %dl,%dl
     dad:	75 f2                	jne    da1 <strchr+0xc>
    if(*s == c)
      return (char*)s;
  return 0;
     daf:	b8 00 00 00 00       	mov    $0x0,%eax
}
     db4:	5d                   	pop    %ebp
     db5:	c3                   	ret    

00000db6 <gets>:

char*
gets(char *buf, int max)
{
     db6:	55                   	push   %ebp
     db7:	89 e5                	mov    %esp,%ebp
     db9:	57                   	push   %edi
     dba:	56                   	push   %esi
     dbb:	53                   	push   %ebx
     dbc:	83 ec 1c             	sub    $0x1c,%esp
     dbf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     dc2:	be 00 00 00 00       	mov    $0x0,%esi
     dc7:	eb 2e                	jmp    df7 <gets+0x41>
    cc = read(0, &c, 1);
     dc9:	83 ec 04             	sub    $0x4,%esp
     dcc:	6a 01                	push   $0x1
     dce:	8d 45 e7             	lea    -0x19(%ebp),%eax
     dd1:	50                   	push   %eax
     dd2:	6a 00                	push   $0x0
     dd4:	e8 16 02 00 00       	call   fef <read>
    if(cc < 1)
     dd9:	83 c4 10             	add    $0x10,%esp
     ddc:	85 c0                	test   %eax,%eax
     dde:	7e 17                	jle    df7 <gets+0x41>
      continue;
    buf[i++] = c;
     de0:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     de4:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
     de7:	3c 0a                	cmp    $0xa,%al
     de9:	0f 94 c2             	sete   %dl
     dec:	3c 0d                	cmp    $0xd,%al
     dee:	0f 94 c0             	sete   %al
     df1:	08 c2                	or     %al,%dl
     df3:	75 0c                	jne    e01 <gets+0x4b>

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
     df5:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     df7:	8d 5e 01             	lea    0x1(%esi),%ebx
     dfa:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     dfd:	7c ca                	jl     dc9 <gets+0x13>
     dff:	eb 02                	jmp    e03 <gets+0x4d>
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
     e01:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     e03:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     e07:	89 f8                	mov    %edi,%eax
     e09:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e0c:	5b                   	pop    %ebx
     e0d:	5e                   	pop    %esi
     e0e:	5f                   	pop    %edi
     e0f:	5d                   	pop    %ebp
     e10:	c3                   	ret    

00000e11 <stat>:

int
stat(const char *n, struct stat *st)
{
     e11:	55                   	push   %ebp
     e12:	89 e5                	mov    %esp,%ebp
     e14:	56                   	push   %esi
     e15:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e16:	83 ec 08             	sub    $0x8,%esp
     e19:	6a 00                	push   $0x0
     e1b:	ff 75 08             	pushl  0x8(%ebp)
     e1e:	e8 f4 01 00 00       	call   1017 <open>
  if(fd < 0)
     e23:	83 c4 10             	add    $0x10,%esp
     e26:	85 c0                	test   %eax,%eax
     e28:	78 1f                	js     e49 <stat+0x38>
     e2a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     e2c:	83 ec 08             	sub    $0x8,%esp
     e2f:	ff 75 0c             	pushl  0xc(%ebp)
     e32:	50                   	push   %eax
     e33:	e8 f7 01 00 00       	call   102f <fstat>
     e38:	89 c6                	mov    %eax,%esi
  close(fd);
     e3a:	89 1c 24             	mov    %ebx,(%esp)
     e3d:	e8 bd 01 00 00       	call   fff <close>
  return r;
     e42:	83 c4 10             	add    $0x10,%esp
     e45:	89 f0                	mov    %esi,%eax
     e47:	eb 05                	jmp    e4e <stat+0x3d>
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     e49:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  r = fstat(fd, st);
  close(fd);
  return r;
}
     e4e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e51:	5b                   	pop    %ebx
     e52:	5e                   	pop    %esi
     e53:	5d                   	pop    %ebp
     e54:	c3                   	ret    

00000e55 <atoi>:

int
atoi(const char *s)
{
     e55:	55                   	push   %ebp
     e56:	89 e5                	mov    %esp,%ebp
     e58:	53                   	push   %ebx
     e59:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
     e5c:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     e61:	eb 10                	jmp    e73 <atoi+0x1e>
    n = n*10 + *s++ - '0';
     e63:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
     e66:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
     e69:	83 c1 01             	add    $0x1,%ecx
     e6c:	0f be d2             	movsbl %dl,%edx
     e6f:	8d 44 10 d0          	lea    -0x30(%eax,%edx,1),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     e73:	0f b6 11             	movzbl (%ecx),%edx
     e76:	8d 5a d0             	lea    -0x30(%edx),%ebx
     e79:	80 fb 09             	cmp    $0x9,%bl
     e7c:	76 e5                	jbe    e63 <atoi+0xe>
    n = n*10 + *s++ - '0';
  return n;
}
     e7e:	5b                   	pop    %ebx
     e7f:	5d                   	pop    %ebp
     e80:	c3                   	ret    

00000e81 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     e81:	55                   	push   %ebp
     e82:	89 e5                	mov    %esp,%ebp
     e84:	56                   	push   %esi
     e85:	53                   	push   %ebx
     e86:	8b 45 08             	mov    0x8(%ebp),%eax
     e89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     e8c:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
     e8f:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
     e91:	eb 0d                	jmp    ea0 <memmove+0x1f>
    *dst++ = *src++;
     e93:	0f b6 13             	movzbl (%ebx),%edx
     e96:	88 11                	mov    %dl,(%ecx)
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e98:	89 f2                	mov    %esi,%edx
    *dst++ = *src++;
     e9a:	8d 5b 01             	lea    0x1(%ebx),%ebx
     e9d:	8d 49 01             	lea    0x1(%ecx),%ecx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ea0:	8d 72 ff             	lea    -0x1(%edx),%esi
     ea3:	85 d2                	test   %edx,%edx
     ea5:	7f ec                	jg     e93 <memmove+0x12>
    *dst++ = *src++;
  return vdst;
}
     ea7:	5b                   	pop    %ebx
     ea8:	5e                   	pop    %esi
     ea9:	5d                   	pop    %ebp
     eaa:	c3                   	ret    

00000eab <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
     eab:	55                   	push   %ebp
     eac:	89 e5                	mov    %esp,%ebp
     eae:	57                   	push   %edi
     eaf:	56                   	push   %esi
     eb0:	53                   	push   %ebx
     eb1:	83 ec 04             	sub    $0x4,%esp
     eb4:	8b 7d 08             	mov    0x8(%ebp),%edi
     eb7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int i = n;
     eba:	89 d9                	mov    %ebx,%ecx
    int length = 0;
     ebc:	be 00 00 00 00       	mov    $0x0,%esi

    while (i > 0) {
     ec1:	eb 16                	jmp    ed9 <itoa+0x2e>
        length++;
     ec3:	83 c6 01             	add    $0x1,%esi
        i /= 10;
     ec6:	ba 67 66 66 66       	mov    $0x66666667,%edx
     ecb:	89 c8                	mov    %ecx,%eax
     ecd:	f7 ea                	imul   %edx
     ecf:	c1 fa 02             	sar    $0x2,%edx
     ed2:	c1 f9 1f             	sar    $0x1f,%ecx
     ed5:	29 ca                	sub    %ecx,%edx
     ed7:	89 d1                	mov    %edx,%ecx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
     ed9:	85 c9                	test   %ecx,%ecx
     edb:	7f e6                	jg     ec3 <itoa+0x18>
        length++;
        i /= 10;
    }

    if (n == 0) {
     edd:	85 db                	test   %ebx,%ebx
     edf:	75 06                	jne    ee7 <itoa+0x3c>
        buf[0] = '0';
     ee1:	c6 07 30             	movb   $0x30,(%edi)
        length++;
     ee4:	83 c6 01             	add    $0x1,%esi
    }
    for (i = length; n > 0 && i > 0; i--) {
     ee7:	89 f1                	mov    %esi,%ecx
     ee9:	89 75 f0             	mov    %esi,-0x10(%ebp)
     eec:	eb 2a                	jmp    f18 <itoa+0x6d>
        buf[i - 1] = (n % 10) + '0';
     eee:	83 e9 01             	sub    $0x1,%ecx
     ef1:	ba 67 66 66 66       	mov    $0x66666667,%edx
     ef6:	89 d8                	mov    %ebx,%eax
     ef8:	f7 ea                	imul   %edx
     efa:	c1 fa 02             	sar    $0x2,%edx
     efd:	89 d8                	mov    %ebx,%eax
     eff:	c1 f8 1f             	sar    $0x1f,%eax
     f02:	29 c2                	sub    %eax,%edx
     f04:	89 d6                	mov    %edx,%esi
     f06:	8d 14 92             	lea    (%edx,%edx,4),%edx
     f09:	8d 04 12             	lea    (%edx,%edx,1),%eax
     f0c:	29 c3                	sub    %eax,%ebx
     f0e:	89 da                	mov    %ebx,%edx
     f10:	83 c2 30             	add    $0x30,%edx
     f13:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
        n /= 10;
     f16:	89 f3                	mov    %esi,%ebx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
     f18:	85 db                	test   %ebx,%ebx
     f1a:	0f 9f c2             	setg   %dl
     f1d:	85 c9                	test   %ecx,%ecx
     f1f:	0f 9f c0             	setg   %al
     f22:	84 c2                	test   %al,%dl
     f24:	75 c8                	jne    eee <itoa+0x43>
     f26:	8b 75 f0             	mov    -0x10(%ebp),%esi
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
     f29:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
    return length;
}
     f2d:	89 f0                	mov    %esi,%eax
     f2f:	83 c4 04             	add    $0x4,%esp
     f32:	5b                   	pop    %ebx
     f33:	5e                   	pop    %esi
     f34:	5f                   	pop    %edi
     f35:	5d                   	pop    %ebp
     f36:	c3                   	ret    

00000f37 <strcat>:

char* strcat(char* dest, const char* source)
{
     f37:	55                   	push   %ebp
     f38:	89 e5                	mov    %esp,%ebp
     f3a:	57                   	push   %edi
     f3b:	56                   	push   %esi
     f3c:	53                   	push   %ebx
     f3d:	8b 45 08             	mov    0x8(%ebp),%eax
     f40:	8b 7d 0c             	mov    0xc(%ebp),%edi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
     f43:	b9 00 00 00 00       	mov    $0x0,%ecx
     f48:	eb 03                	jmp    f4d <strcat+0x16>
     f4a:	83 c1 01             	add    $0x1,%ecx
     f4d:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
     f51:	75 f7                	jne    f4a <strcat+0x13>
     f53:	ba 00 00 00 00       	mov    $0x0,%edx
     f58:	eb 09                	jmp    f63 <strcat+0x2c>

        for (j = 0; source[j] != '\0'; j++)
                dest[i + j] = source[j];
     f5a:	8d 34 11             	lea    (%ecx,%edx,1),%esi
     f5d:	88 1c 30             	mov    %bl,(%eax,%esi,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
     f60:	83 c2 01             	add    $0x1,%edx
     f63:	0f b6 1c 17          	movzbl (%edi,%edx,1),%ebx
     f67:	84 db                	test   %bl,%bl
     f69:	75 ef                	jne    f5a <strcat+0x23>
                dest[i + j] = source[j];

        dest[i + j] = '\0';
     f6b:	01 ca                	add    %ecx,%edx
     f6d:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
     f71:	5b                   	pop    %ebx
     f72:	5e                   	pop    %esi
     f73:	5f                   	pop    %edi
     f74:	5d                   	pop    %ebp
     f75:	c3                   	ret    

00000f76 <strstr>:

char * strstr(char * src, char * needle)
{
     f76:	55                   	push   %ebp
     f77:	89 e5                	mov    %esp,%ebp
     f79:	57                   	push   %edi
     f7a:	56                   	push   %esi
     f7b:	53                   	push   %ebx
     f7c:	83 ec 04             	sub    $0x4,%esp
     f7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint i = 0;
  uint needle_size = strlen(needle);
     f82:	ff 75 0c             	pushl  0xc(%ebp)
     f85:	e8 da fd ff ff       	call   d64 <strlen>
     f8a:	89 c7                	mov    %eax,%edi
  uint src_len = strlen(src);
     f8c:	89 1c 24             	mov    %ebx,(%esp)
     f8f:	e8 d0 fd ff ff       	call   d64 <strlen>
     f94:	83 c4 04             	add    $0x4,%esp
     f97:	89 45 f0             	mov    %eax,-0x10(%ebp)

  for(i = 0; i < src_len; i++)
     f9a:	be 00 00 00 00       	mov    $0x0,%esi
     f9f:	eb 1c                	jmp    fbd <strstr+0x47>
  {
    if(0 == strncmp(src, needle, needle_size))
     fa1:	57                   	push   %edi
     fa2:	ff 75 0c             	pushl  0xc(%ebp)
     fa5:	53                   	push   %ebx
     fa6:	e8 89 fd ff ff       	call   d34 <strncmp>
     fab:	83 c4 0c             	add    $0xc,%esp
     fae:	85 c0                	test   %eax,%eax
     fb0:	75 05                	jne    fb7 <strstr+0x41>
    {
      return src + needle_size;
     fb2:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
     fb5:	eb 10                	jmp    fc7 <strstr+0x51>
    }
    src++;
     fb7:	83 c3 01             	add    $0x1,%ebx
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
     fba:	83 c6 01             	add    $0x1,%esi
     fbd:	3b 75 f0             	cmp    -0x10(%ebp),%esi
     fc0:	72 df                	jb     fa1 <strstr+0x2b>
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
     fc2:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fc7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fca:	5b                   	pop    %ebx
     fcb:	5e                   	pop    %esi
     fcc:	5f                   	pop    %edi
     fcd:	5d                   	pop    %ebp
     fce:	c3                   	ret    

00000fcf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     fcf:	b8 01 00 00 00       	mov    $0x1,%eax
     fd4:	cd 40                	int    $0x40
     fd6:	c3                   	ret    

00000fd7 <exit>:
SYSCALL(exit)
     fd7:	b8 02 00 00 00       	mov    $0x2,%eax
     fdc:	cd 40                	int    $0x40
     fde:	c3                   	ret    

00000fdf <wait>:
SYSCALL(wait)
     fdf:	b8 03 00 00 00       	mov    $0x3,%eax
     fe4:	cd 40                	int    $0x40
     fe6:	c3                   	ret    

00000fe7 <pipe>:
SYSCALL(pipe)
     fe7:	b8 04 00 00 00       	mov    $0x4,%eax
     fec:	cd 40                	int    $0x40
     fee:	c3                   	ret    

00000fef <read>:
SYSCALL(read)
     fef:	b8 05 00 00 00       	mov    $0x5,%eax
     ff4:	cd 40                	int    $0x40
     ff6:	c3                   	ret    

00000ff7 <write>:
SYSCALL(write)
     ff7:	b8 10 00 00 00       	mov    $0x10,%eax
     ffc:	cd 40                	int    $0x40
     ffe:	c3                   	ret    

00000fff <close>:
SYSCALL(close)
     fff:	b8 15 00 00 00       	mov    $0x15,%eax
    1004:	cd 40                	int    $0x40
    1006:	c3                   	ret    

00001007 <kill>:
SYSCALL(kill)
    1007:	b8 06 00 00 00       	mov    $0x6,%eax
    100c:	cd 40                	int    $0x40
    100e:	c3                   	ret    

0000100f <exec>:
SYSCALL(exec)
    100f:	b8 07 00 00 00       	mov    $0x7,%eax
    1014:	cd 40                	int    $0x40
    1016:	c3                   	ret    

00001017 <open>:
SYSCALL(open)
    1017:	b8 0f 00 00 00       	mov    $0xf,%eax
    101c:	cd 40                	int    $0x40
    101e:	c3                   	ret    

0000101f <mknod>:
SYSCALL(mknod)
    101f:	b8 11 00 00 00       	mov    $0x11,%eax
    1024:	cd 40                	int    $0x40
    1026:	c3                   	ret    

00001027 <unlink>:
SYSCALL(unlink)
    1027:	b8 12 00 00 00       	mov    $0x12,%eax
    102c:	cd 40                	int    $0x40
    102e:	c3                   	ret    

0000102f <fstat>:
SYSCALL(fstat)
    102f:	b8 08 00 00 00       	mov    $0x8,%eax
    1034:	cd 40                	int    $0x40
    1036:	c3                   	ret    

00001037 <link>:
SYSCALL(link)
    1037:	b8 13 00 00 00       	mov    $0x13,%eax
    103c:	cd 40                	int    $0x40
    103e:	c3                   	ret    

0000103f <mkdir>:
SYSCALL(mkdir)
    103f:	b8 14 00 00 00       	mov    $0x14,%eax
    1044:	cd 40                	int    $0x40
    1046:	c3                   	ret    

00001047 <chdir>:
SYSCALL(chdir)
    1047:	b8 09 00 00 00       	mov    $0x9,%eax
    104c:	cd 40                	int    $0x40
    104e:	c3                   	ret    

0000104f <dup>:
SYSCALL(dup)
    104f:	b8 0a 00 00 00       	mov    $0xa,%eax
    1054:	cd 40                	int    $0x40
    1056:	c3                   	ret    

00001057 <getpid>:
SYSCALL(getpid)
    1057:	b8 0b 00 00 00       	mov    $0xb,%eax
    105c:	cd 40                	int    $0x40
    105e:	c3                   	ret    

0000105f <sbrk>:
SYSCALL(sbrk)
    105f:	b8 0c 00 00 00       	mov    $0xc,%eax
    1064:	cd 40                	int    $0x40
    1066:	c3                   	ret    

00001067 <sleep>:
SYSCALL(sleep)
    1067:	b8 0d 00 00 00       	mov    $0xd,%eax
    106c:	cd 40                	int    $0x40
    106e:	c3                   	ret    

0000106f <uptime>:
SYSCALL(uptime)
    106f:	b8 0e 00 00 00       	mov    $0xe,%eax
    1074:	cd 40                	int    $0x40
    1076:	c3                   	ret    

00001077 <mount>:
SYSCALL(mount)
    1077:	b8 16 00 00 00       	mov    $0x16,%eax
    107c:	cd 40                	int    $0x40
    107e:	c3                   	ret    

0000107f <umount>:
SYSCALL(umount)
    107f:	b8 17 00 00 00       	mov    $0x17,%eax
    1084:	cd 40                	int    $0x40
    1086:	c3                   	ret    

00001087 <printmounts>:
SYSCALL(printmounts)
    1087:	b8 18 00 00 00       	mov    $0x18,%eax
    108c:	cd 40                	int    $0x40
    108e:	c3                   	ret    

0000108f <printdevices>:
SYSCALL(printdevices)
    108f:	b8 19 00 00 00       	mov    $0x19,%eax
    1094:	cd 40                	int    $0x40
    1096:	c3                   	ret    

00001097 <unshare>:
SYSCALL(unshare)
    1097:	b8 1a 00 00 00       	mov    $0x1a,%eax
    109c:	cd 40                	int    $0x40
    109e:	c3                   	ret    

0000109f <usleep>:
SYSCALL(usleep)
    109f:	b8 1b 00 00 00       	mov    $0x1b,%eax
    10a4:	cd 40                	int    $0x40
    10a6:	c3                   	ret    

000010a7 <ioctl>:
SYSCALL(ioctl)
    10a7:	b8 1c 00 00 00       	mov    $0x1c,%eax
    10ac:	cd 40                	int    $0x40
    10ae:	c3                   	ret    

000010af <getppid>:
SYSCALL(getppid)
    10af:	b8 1d 00 00 00       	mov    $0x1d,%eax
    10b4:	cd 40                	int    $0x40
    10b6:	c3                   	ret    

000010b7 <getcpu>:
SYSCALL(getcpu)
    10b7:	b8 1e 00 00 00       	mov    $0x1e,%eax
    10bc:	cd 40                	int    $0x40
    10be:	c3                   	ret    

000010bf <getmem>:
SYSCALL(getmem)
    10bf:	b8 1f 00 00 00       	mov    $0x1f,%eax
    10c4:	cd 40                	int    $0x40
    10c6:	c3                   	ret    

000010c7 <kmemtest>:
SYSCALL(kmemtest)
    10c7:	b8 20 00 00 00       	mov    $0x20,%eax
    10cc:	cd 40                	int    $0x40
    10ce:	c3                   	ret    

000010cf <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    10cf:	55                   	push   %ebp
    10d0:	89 e5                	mov    %esp,%ebp
    10d2:	57                   	push   %edi
    10d3:	56                   	push   %esi
    10d4:	53                   	push   %ebx
    10d5:	83 ec 3c             	sub    $0x3c,%esp
    10d8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    10db:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    10df:	0f 95 c3             	setne  %bl
    10e2:	89 d0                	mov    %edx,%eax
    10e4:	c1 e8 1f             	shr    $0x1f,%eax
    10e7:	84 c3                	test   %al,%bl
    10e9:	74 09                	je     10f4 <printint+0x25>
    neg = 1;
    x = -xx;
    10eb:	f7 da                	neg    %edx
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    10ed:	bf 01 00 00 00       	mov    $0x1,%edi
    10f2:	eb 05                	jmp    10f9 <printint+0x2a>
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    10f4:	bf 00 00 00 00       	mov    $0x0,%edi
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
    10f9:	be 00 00 00 00       	mov    $0x0,%esi
    10fe:	eb 02                	jmp    1102 <printint+0x33>
  do{
    buf[i++] = digits[x % base];
    1100:	89 de                	mov    %ebx,%esi
    1102:	8d 5e 01             	lea    0x1(%esi),%ebx
    1105:	89 d0                	mov    %edx,%eax
    1107:	ba 00 00 00 00       	mov    $0x0,%edx
    110c:	f7 f1                	div    %ecx
    110e:	0f b6 92 b8 1c 00 00 	movzbl 0x1cb8(%edx),%edx
    1115:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
    1119:	89 c2                	mov    %eax,%edx
    111b:	85 c0                	test   %eax,%eax
    111d:	75 e1                	jne    1100 <printint+0x31>
  if(neg)
    111f:	85 ff                	test   %edi,%edi
    1121:	74 08                	je     112b <printint+0x5c>
    buf[i++] = '-';
    1123:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    1128:	8d 5e 02             	lea    0x2(%esi),%ebx
    112b:	b8 00 00 00 00       	mov    $0x0,%eax
    1130:	eb 0c                	jmp    113e <printint+0x6f>

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
    1132:	0f b6 54 1d d8       	movzbl -0x28(%ebp,%ebx,1),%edx
    1137:	88 54 05 c8          	mov    %dl,-0x38(%ebp,%eax,1)
    113b:	8d 40 01             	lea    0x1(%eax),%eax
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
    113e:	83 eb 01             	sub    $0x1,%ebx
    1141:	79 ef                	jns    1132 <printint+0x63>
      str[j++] = buf[i];
  }
  str[j] = '\0';
    1143:	c6 44 05 c8 00       	movb   $0x0,-0x38(%ebp,%eax,1)
  
  return write(fd, str, strlen(str));
    1148:	83 ec 0c             	sub    $0xc,%esp
    114b:	8d 5d c8             	lea    -0x38(%ebp),%ebx
    114e:	53                   	push   %ebx
    114f:	e8 10 fc ff ff       	call   d64 <strlen>
    1154:	83 c4 0c             	add    $0xc,%esp
    1157:	50                   	push   %eax
    1158:	53                   	push   %ebx
    1159:	ff 75 c4             	pushl  -0x3c(%ebp)
    115c:	e8 96 fe ff ff       	call   ff7 <write>
}
    1161:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1164:	5b                   	pop    %ebx
    1165:	5e                   	pop    %esi
    1166:	5f                   	pop    %edi
    1167:	5d                   	pop    %ebp
    1168:	c3                   	ret    

00001169 <printstr>:

static int
printstr(int fd, char *str)
{
    1169:	55                   	push   %ebp
    116a:	89 e5                	mov    %esp,%ebp
    116c:	56                   	push   %esi
    116d:	53                   	push   %ebx
    116e:	89 c6                	mov    %eax,%esi
    1170:	89 d3                	mov    %edx,%ebx

  if (str == 0)
    1172:	85 d2                	test   %edx,%edx
    1174:	75 05                	jne    117b <printstr+0x12>
    str = "(null)";
    1176:	bb b0 1c 00 00       	mov    $0x1cb0,%ebx

  return write(fd , str, strlen(str));
    117b:	83 ec 0c             	sub    $0xc,%esp
    117e:	53                   	push   %ebx
    117f:	e8 e0 fb ff ff       	call   d64 <strlen>
    1184:	83 c4 0c             	add    $0xc,%esp
    1187:	50                   	push   %eax
    1188:	53                   	push   %ebx
    1189:	56                   	push   %esi
    118a:	e8 68 fe ff ff       	call   ff7 <write>
}
    118f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1192:	5b                   	pop    %ebx
    1193:	5e                   	pop    %esi
    1194:	5d                   	pop    %ebp
    1195:	c3                   	ret    

00001196 <putc>:
#include "stat.h"
#include "user.h"

static int
putc(int fd, char c)
{
    1196:	55                   	push   %ebp
    1197:	89 e5                	mov    %esp,%ebp
    1199:	83 ec 1c             	sub    $0x1c,%esp
    119c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  return write(fd, &c, 1);
    119f:	6a 01                	push   $0x1
    11a1:	8d 55 f4             	lea    -0xc(%ebp),%edx
    11a4:	52                   	push   %edx
    11a5:	50                   	push   %eax
    11a6:	e8 4c fe ff ff       	call   ff7 <write>
}
    11ab:	c9                   	leave  
    11ac:	c3                   	ret    

000011ad <printunknown>:
  return write(fd , str, strlen(str));
}

static int
printunknown(int fd, char c)
{
    11ad:	55                   	push   %ebp
    11ae:	89 e5                	mov    %esp,%ebp
    11b0:	83 ec 1c             	sub    $0x1c,%esp
    char str[2];
    str[0] = '%';
    11b3:	c6 45 f6 25          	movb   $0x25,-0xa(%ebp)
    str[1] = c;
    11b7:	88 55 f7             	mov    %dl,-0x9(%ebp)
 
    return write(fd, str, 2);
    11ba:	6a 02                	push   $0x2
    11bc:	8d 55 f6             	lea    -0xa(%ebp),%edx
    11bf:	52                   	push   %edx
    11c0:	50                   	push   %eax
    11c1:	e8 31 fe ff ff       	call   ff7 <write>
}
    11c6:	c9                   	leave  
    11c7:	c3                   	ret    

000011c8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
    11c8:	55                   	push   %ebp
    11c9:	89 e5                	mov    %esp,%ebp
    11cb:	57                   	push   %edi
    11cc:	56                   	push   %esi
    11cd:	53                   	push   %ebx
    11ce:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
    11d1:	bb 00 00 00 00       	mov    $0x0,%ebx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    11d6:	8d 45 10             	lea    0x10(%ebp),%eax
    11d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;

  state = 0;
    11dc:	bf 00 00 00 00       	mov    $0x0,%edi
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    11e1:	be 00 00 00 00       	mov    $0x0,%esi
    11e6:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
    11e9:	e9 14 01 00 00       	jmp    1302 <printf+0x13a>
    num_chars = 0;
    c = fmt[i] & 0xff;
    11ee:	0f be d0             	movsbl %al,%edx
    11f1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    11f4:	85 ff                	test   %edi,%edi
    11f6:	75 16                	jne    120e <printf+0x46>
      if(c == '%'){
    11f8:	83 f8 25             	cmp    $0x25,%eax
    11fb:	0f 84 e6 00 00 00    	je     12e7 <printf+0x11f>
        state = '%';
      } else {
        num_chars = putc(fd, c);
    1201:	8b 45 08             	mov    0x8(%ebp),%eax
    1204:	e8 8d ff ff ff       	call   1196 <putc>
    1209:	e9 ea 00 00 00       	jmp    12f8 <printf+0x130>
      }
    } else if(state == '%'){
    120e:	83 ff 25             	cmp    $0x25,%edi
    1211:	0f 85 dc 00 00 00    	jne    12f3 <printf+0x12b>
      if(c == 'd'){
    1217:	83 f8 64             	cmp    $0x64,%eax
    121a:	75 2c                	jne    1248 <printf+0x80>
        num_chars = printint(fd, *ap, 10, 1);
    121c:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    121f:	8b 13                	mov    (%ebx),%edx
    1221:	83 ec 0c             	sub    $0xc,%esp
    1224:	6a 01                	push   $0x1
    1226:	b9 0a 00 00 00       	mov    $0xa,%ecx
    122b:	8b 45 08             	mov    0x8(%ebp),%eax
    122e:	e8 9c fe ff ff       	call   10cf <printint>
        ap++;
    1233:	89 d9                	mov    %ebx,%ecx
    1235:	83 c1 04             	add    $0x4,%ecx
    1238:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    123b:	83 c4 10             	add    $0x10,%esp
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    123e:	bf 00 00 00 00       	mov    $0x0,%edi
    1243:	e9 b0 00 00 00       	jmp    12f8 <printf+0x130>
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1248:	83 f8 78             	cmp    $0x78,%eax
    124b:	0f 94 c1             	sete   %cl
    124e:	89 cf                	mov    %ecx,%edi
    1250:	83 f8 70             	cmp    $0x70,%eax
    1253:	0f 94 c1             	sete   %cl
    1256:	89 fb                	mov    %edi,%ebx
    1258:	08 cb                	or     %cl,%bl
    125a:	74 27                	je     1283 <printf+0xbb>
        num_chars = printint(fd, *ap, 16, 0);
    125c:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    125f:	8b 13                	mov    (%ebx),%edx
    1261:	83 ec 0c             	sub    $0xc,%esp
    1264:	6a 00                	push   $0x0
    1266:	b9 10 00 00 00       	mov    $0x10,%ecx
    126b:	8b 45 08             	mov    0x8(%ebp),%eax
    126e:	e8 5c fe ff ff       	call   10cf <printint>
        ap++;
    1273:	83 c3 04             	add    $0x4,%ebx
    1276:	89 5d e0             	mov    %ebx,-0x20(%ebp)
    1279:	83 c4 10             	add    $0x10,%esp
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    127c:	bf 00 00 00 00       	mov    $0x0,%edi
    1281:	eb 75                	jmp    12f8 <printf+0x130>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1283:	83 f8 73             	cmp    $0x73,%eax
    1286:	75 1a                	jne    12a2 <printf+0xda>
        s = (char*)*ap;
    1288:	8b 45 e0             	mov    -0x20(%ebp),%eax
    128b:	8b 10                	mov    (%eax),%edx
        ap++;
    128d:	83 c0 04             	add    $0x4,%eax
    1290:	89 45 e0             	mov    %eax,-0x20(%ebp)
        num_chars = printstr(fd, s);
    1293:	8b 45 08             	mov    0x8(%ebp),%eax
    1296:	e8 ce fe ff ff       	call   1169 <printstr>
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    129b:	bf 00 00 00 00       	mov    $0x0,%edi
    12a0:	eb 56                	jmp    12f8 <printf+0x130>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
    12a2:	83 f8 63             	cmp    $0x63,%eax
    12a5:	75 1d                	jne    12c4 <printf+0xfc>
        num_chars = putc(fd, *ap);
    12a7:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    12aa:	0f be 13             	movsbl (%ebx),%edx
    12ad:	8b 45 08             	mov    0x8(%ebp),%eax
    12b0:	e8 e1 fe ff ff       	call   1196 <putc>
        ap++;
    12b5:	89 d9                	mov    %ebx,%ecx
    12b7:	83 c1 04             	add    $0x4,%ecx
    12ba:	89 4d e0             	mov    %ecx,-0x20(%ebp)
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    12bd:	bf 00 00 00 00       	mov    $0x0,%edi
    12c2:	eb 34                	jmp    12f8 <printf+0x130>
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    12c4:	83 f8 25             	cmp    $0x25,%eax
    12c7:	75 0f                	jne    12d8 <printf+0x110>
        num_chars = putc(fd, c);
    12c9:	8b 45 08             	mov    0x8(%ebp),%eax
    12cc:	e8 c5 fe ff ff       	call   1196 <putc>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    12d1:	bf 00 00 00 00       	mov    $0x0,%edi
    12d6:	eb 20                	jmp    12f8 <printf+0x130>
        ap++;
      } else if(c == '%'){
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
    12d8:	8b 45 08             	mov    0x8(%ebp),%eax
    12db:	e8 cd fe ff ff       	call   11ad <printunknown>
      }
      state = 0;
    12e0:	bf 00 00 00 00       	mov    $0x0,%edi
    12e5:	eb 11                	jmp    12f8 <printf+0x130>
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    12e7:	b8 00 00 00 00       	mov    $0x0,%eax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    12ec:	bf 25 00 00 00       	mov    $0x25,%edi
    12f1:	eb 05                	jmp    12f8 <printf+0x130>
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    12f3:	b8 00 00 00 00       	mov    $0x0,%eax
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
    12f8:	85 c0                	test   %eax,%eax
    12fa:	78 1b                	js     1317 <printf+0x14f>
      return num_chars;
    }
    retval += num_chars;
    12fc:	01 45 e4             	add    %eax,-0x1c(%ebp)
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    12ff:	83 c6 01             	add    $0x1,%esi
    1302:	89 f0                	mov    %esi,%eax
    1304:	03 45 0c             	add    0xc(%ebp),%eax
    1307:	0f b6 00             	movzbl (%eax),%eax
    130a:	84 c0                	test   %al,%al
    130c:	0f 85 dc fe ff ff    	jne    11ee <printf+0x26>
    1312:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
  }
  return retval;
    1315:	89 d8                	mov    %ebx,%eax
}
    1317:	8d 65 f4             	lea    -0xc(%ebp),%esp
    131a:	5b                   	pop    %ebx
    131b:	5e                   	pop    %esi
    131c:	5f                   	pop    %edi
    131d:	5d                   	pop    %ebp
    131e:	c3                   	ret    

0000131f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    131f:	55                   	push   %ebp
    1320:	89 e5                	mov    %esp,%ebp
    1322:	57                   	push   %edi
    1323:	56                   	push   %esi
    1324:	53                   	push   %ebx
    1325:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1328:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    132b:	a1 04 30 00 00       	mov    0x3004,%eax
    1330:	eb 14                	jmp    1346 <free+0x27>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1332:	8b 10                	mov    (%eax),%edx
    1334:	39 d0                	cmp    %edx,%eax
    1336:	72 0c                	jb     1344 <free+0x25>
    1338:	39 c8                	cmp    %ecx,%eax
    133a:	72 12                	jb     134e <free+0x2f>
    133c:	39 d1                	cmp    %edx,%ecx
    133e:	72 0e                	jb     134e <free+0x2f>
    1340:	89 d0                	mov    %edx,%eax
    1342:	eb 02                	jmp    1346 <free+0x27>
    1344:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1346:	39 c8                	cmp    %ecx,%eax
    1348:	73 e8                	jae    1332 <free+0x13>
    134a:	3b 08                	cmp    (%eax),%ecx
    134c:	73 e4                	jae    1332 <free+0x13>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    134e:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1351:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1354:	8b 10                	mov    (%eax),%edx
    1356:	39 d7                	cmp    %edx,%edi
    1358:	75 0f                	jne    1369 <free+0x4a>
    bp->s.size += p->s.ptr->s.size;
    135a:	03 72 04             	add    0x4(%edx),%esi
    135d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1360:	8b 10                	mov    (%eax),%edx
    1362:	8b 12                	mov    (%edx),%edx
    1364:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1367:	eb 03                	jmp    136c <free+0x4d>
  } else
    bp->s.ptr = p->s.ptr;
    1369:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    136c:	8b 50 04             	mov    0x4(%eax),%edx
    136f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1372:	39 f1                	cmp    %esi,%ecx
    1374:	75 0d                	jne    1383 <free+0x64>
    p->s.size += bp->s.size;
    1376:	03 53 fc             	add    -0x4(%ebx),%edx
    1379:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    137c:	8b 53 f8             	mov    -0x8(%ebx),%edx
    137f:	89 10                	mov    %edx,(%eax)
    1381:	eb 02                	jmp    1385 <free+0x66>
  } else
    p->s.ptr = bp;
    1383:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1385:	a3 04 30 00 00       	mov    %eax,0x3004
}
    138a:	5b                   	pop    %ebx
    138b:	5e                   	pop    %esi
    138c:	5f                   	pop    %edi
    138d:	5d                   	pop    %ebp
    138e:	c3                   	ret    

0000138f <morecore>:

static Header*
morecore(uint nu)
{
    138f:	55                   	push   %ebp
    1390:	89 e5                	mov    %esp,%ebp
    1392:	53                   	push   %ebx
    1393:	83 ec 04             	sub    $0x4,%esp
    1396:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    1398:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    139d:	77 05                	ja     13a4 <morecore+0x15>
    nu = 4096;
    139f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    13a4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    13ab:	83 ec 0c             	sub    $0xc,%esp
    13ae:	50                   	push   %eax
    13af:	e8 ab fc ff ff       	call   105f <sbrk>
  if(p == (char*)-1)
    13b4:	83 c4 10             	add    $0x10,%esp
    13b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13ba:	74 19                	je     13d5 <morecore+0x46>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    13bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13bf:	83 ec 0c             	sub    $0xc,%esp
    13c2:	83 c0 08             	add    $0x8,%eax
    13c5:	50                   	push   %eax
    13c6:	e8 54 ff ff ff       	call   131f <free>
  return freep;
    13cb:	a1 04 30 00 00       	mov    0x3004,%eax
    13d0:	83 c4 10             	add    $0x10,%esp
    13d3:	eb 05                	jmp    13da <morecore+0x4b>

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
    return 0;
    13d5:	b8 00 00 00 00       	mov    $0x0,%eax
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
  return freep;
}
    13da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13dd:	c9                   	leave  
    13de:	c3                   	ret    

000013df <malloc>:

void*
malloc(uint nbytes)
{
    13df:	55                   	push   %ebp
    13e0:	89 e5                	mov    %esp,%ebp
    13e2:	53                   	push   %ebx
    13e3:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13e6:	8b 45 08             	mov    0x8(%ebp),%eax
    13e9:	8d 58 07             	lea    0x7(%eax),%ebx
    13ec:	c1 eb 03             	shr    $0x3,%ebx
    13ef:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    13f2:	8b 0d 04 30 00 00    	mov    0x3004,%ecx
    13f8:	85 c9                	test   %ecx,%ecx
    13fa:	75 23                	jne    141f <malloc+0x40>
    base.s.ptr = freep = prevp = &base;
    13fc:	c7 05 04 30 00 00 08 	movl   $0x3008,0x3004
    1403:	30 00 00 
    1406:	c7 05 08 30 00 00 08 	movl   $0x3008,0x3008
    140d:	30 00 00 
    base.s.size = 0;
    1410:	c7 05 0c 30 00 00 00 	movl   $0x0,0x300c
    1417:	00 00 00 
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    141a:	b9 08 30 00 00       	mov    $0x3008,%ecx
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    141f:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    1421:	8b 50 04             	mov    0x4(%eax),%edx
    1424:	39 d3                	cmp    %edx,%ebx
    1426:	77 20                	ja     1448 <malloc+0x69>
      if(p->s.size == nunits)
    1428:	39 d3                	cmp    %edx,%ebx
    142a:	75 06                	jne    1432 <malloc+0x53>
        prevp->s.ptr = p->s.ptr;
    142c:	8b 10                	mov    (%eax),%edx
    142e:	89 11                	mov    %edx,(%ecx)
    1430:	eb 0b                	jmp    143d <malloc+0x5e>
      else {
        p->s.size -= nunits;
    1432:	29 da                	sub    %ebx,%edx
    1434:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1437:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    143a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    143d:	89 0d 04 30 00 00    	mov    %ecx,0x3004
      return (void*)(p + 1);
    1443:	83 c0 08             	add    $0x8,%eax
    1446:	eb 1e                	jmp    1466 <malloc+0x87>
    }
    if(p == freep)
    1448:	3b 05 04 30 00 00    	cmp    0x3004,%eax
    144e:	75 0b                	jne    145b <malloc+0x7c>
      if((p = morecore(nunits)) == 0)
    1450:	89 d8                	mov    %ebx,%eax
    1452:	e8 38 ff ff ff       	call   138f <morecore>
    1457:	85 c0                	test   %eax,%eax
    1459:	74 06                	je     1461 <malloc+0x82>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    145b:	89 c1                	mov    %eax,%ecx
    145d:	8b 00                	mov    (%eax),%eax
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    145f:	eb c0                	jmp    1421 <malloc+0x42>
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
    1461:	b8 00 00 00 00       	mov    $0x0,%eax
  }
}
    1466:	83 c4 04             	add    $0x4,%esp
    1469:	5b                   	pop    %ebx
    146a:	5d                   	pop    %ebp
    146b:	c3                   	ret    

0000146c <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    146c:	55                   	push   %ebp
    146d:	89 e5                	mov    %esp,%ebp
    146f:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    1472:	6a 10                	push   $0x10
    1474:	6a 02                	push   $0x2
    1476:	ff 75 08             	pushl  0x8(%ebp)
    1479:	e8 29 fc ff ff       	call   10a7 <ioctl>
}
    147e:	c9                   	leave  
    147f:	c3                   	ret    

00001480 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
    1486:	68 00 10 00 00       	push   $0x1000
    148b:	6a 02                	push   $0x2
    148d:	ff 75 08             	pushl  0x8(%ebp)
    1490:	e8 12 fc ff ff       	call   10a7 <ioctl>
}
    1495:	c9                   	leave  
    1496:	c3                   	ret    

00001497 <attach_tty>:

int
attach_tty(int tty_fd)
{
    1497:	55                   	push   %ebp
    1498:	89 e5                	mov    %esp,%ebp
    149a:	53                   	push   %ebx
    149b:	83 ec 08             	sub    $0x8,%esp
    149e:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
    14a1:	6a 10                	push   $0x10
    14a3:	6a 01                	push   $0x1
    14a5:	53                   	push   %ebx
    14a6:	e8 fc fb ff ff       	call   10a7 <ioctl>
    14ab:	83 c4 10             	add    $0x10,%esp
    14ae:	85 c0                	test   %eax,%eax
    14b0:	78 58                	js     150a <attach_tty+0x73>
     return -1;

    close(0);
    14b2:	83 ec 0c             	sub    $0xc,%esp
    14b5:	6a 00                	push   $0x0
    14b7:	e8 43 fb ff ff       	call   fff <close>
    close(1);
    14bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14c3:	e8 37 fb ff ff       	call   fff <close>
    close(2);
    14c8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    14cf:	e8 2b fb ff ff       	call   fff <close>
    if(dup(tty_fd) < 0)
    14d4:	89 1c 24             	mov    %ebx,(%esp)
    14d7:	e8 73 fb ff ff       	call   104f <dup>
    14dc:	83 c4 10             	add    $0x10,%esp
    14df:	85 c0                	test   %eax,%eax
    14e1:	78 2e                	js     1511 <attach_tty+0x7a>
      return -1;

    if(dup(tty_fd) < 0)
    14e3:	83 ec 0c             	sub    $0xc,%esp
    14e6:	53                   	push   %ebx
    14e7:	e8 63 fb ff ff       	call   104f <dup>
    14ec:	83 c4 10             	add    $0x10,%esp
    14ef:	85 c0                	test   %eax,%eax
    14f1:	78 25                	js     1518 <attach_tty+0x81>
      return -1;

    if(dup(tty_fd) < 0)
    14f3:	83 ec 0c             	sub    $0xc,%esp
    14f6:	53                   	push   %ebx
    14f7:	e8 53 fb ff ff       	call   104f <dup>
    14fc:	83 c4 10             	add    $0x10,%esp
    14ff:	85 c0                	test   %eax,%eax
    1501:	79 1c                	jns    151f <attach_tty+0x88>
      return -1;
    1503:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1508:	eb 1a                	jmp    1524 <attach_tty+0x8d>

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
    150a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    150f:	eb 13                	jmp    1524 <attach_tty+0x8d>

    close(0);
    close(1);
    close(2);
    if(dup(tty_fd) < 0)
      return -1;
    1511:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1516:	eb 0c                	jmp    1524 <attach_tty+0x8d>

    if(dup(tty_fd) < 0)
      return -1;
    1518:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    151d:	eb 05                	jmp    1524 <attach_tty+0x8d>

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
    151f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1524:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1527:	c9                   	leave  
    1528:	c3                   	ret    

00001529 <detach_tty>:

int
detach_tty(int tty_fd)
{
    1529:	55                   	push   %ebp
    152a:	89 e5                	mov    %esp,%ebp
    152c:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
    152f:	6a 20                	push   $0x20
    1531:	6a 01                	push   $0x1
    1533:	ff 75 08             	pushl  0x8(%ebp)
    1536:	e8 6c fb ff ff       	call   10a7 <ioctl>
    return 0;
}
    153b:	b8 00 00 00 00       	mov    $0x0,%eax
    1540:	c9                   	leave  
    1541:	c3                   	ret    

00001542 <connect_tty>:


int
connect_tty(int tty_fd)
{
    1542:	55                   	push   %ebp
    1543:	89 e5                	mov    %esp,%ebp
    1545:	53                   	push   %ebx
    1546:	83 ec 10             	sub    $0x10,%esp
    1549:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(!is_attached_tty(tty_fd)){
    154c:	53                   	push   %ebx
    154d:	e8 1a ff ff ff       	call   146c <is_attached_tty>
    1552:	83 c4 10             	add    $0x10,%esp
    1555:	85 c0                	test   %eax,%eax
    1557:	75 13                	jne    156c <connect_tty+0x2a>
      close(tty_fd);
    1559:	83 ec 0c             	sub    $0xc,%esp
    155c:	53                   	push   %ebx
    155d:	e8 9d fa ff ff       	call   fff <close>
       return -1;
    1562:	83 c4 10             	add    $0x10,%esp
    1565:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    156a:	eb 15                	jmp    1581 <connect_tty+0x3f>
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
    156c:	83 ec 04             	sub    $0x4,%esp
    156f:	68 00 10 00 00       	push   $0x1000
    1574:	6a 01                	push   $0x1
    1576:	53                   	push   %ebx
    1577:	e8 2b fb ff ff       	call   10a7 <ioctl>
     return tty_fd;
    157c:	83 c4 10             	add    $0x10,%esp
    157f:	89 d8                	mov    %ebx,%eax
}
    1581:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1584:	c9                   	leave  
    1585:	c3                   	ret    

00001586 <disconnect_tty>:

int
disconnect_tty(int tty_fd)
{
    1586:	55                   	push   %ebp
    1587:	89 e5                	mov    %esp,%ebp
    1589:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
    158c:	68 00 20 00 00       	push   $0x2000
    1591:	6a 01                	push   $0x1
    1593:	ff 75 08             	pushl  0x8(%ebp)
    1596:	e8 0c fb ff ff       	call   10a7 <ioctl>
}
    159b:	c9                   	leave  
    159c:	c3                   	ret    
