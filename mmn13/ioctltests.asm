
_ioctltests:     file format elf32-i386


Disassembly of section .text:

00000000 <init_tests>:
  - verify the creation of tty devices
  - on the init we are able to open all tty devices
  - make sure no tty devices in use, e.g. make sure pouch containers occupy no tty device.
  - no re-run tests afterwards
*/
int init_tests() {
       0:	55                   	push   %ebp
  int i;
  int tty_fd;
  char tty[] = "/ttyX";
       1:	b8 58 00 00 00       	mov    $0x58,%eax
  - verify the creation of tty devices
  - on the init we are able to open all tty devices
  - make sure no tty devices in use, e.g. make sure pouch containers occupy no tty device.
  - no re-run tests afterwards
*/
int init_tests() {
       6:	89 e5                	mov    %esp,%ebp
       8:	56                   	push   %esi
       9:	53                   	push   %ebx
       a:	8d 75 f2             	lea    -0xe(%ebp),%esi
  int i;
  int tty_fd;
  char tty[] = "/ttyX";
       d:	bb 30 00 00 00       	mov    $0x30,%ebx
  - verify the creation of tty devices
  - on the init we are able to open all tty devices
  - make sure no tty devices in use, e.g. make sure pouch containers occupy no tty device.
  - no re-run tests afterwards
*/
int init_tests() {
      12:	83 ec 10             	sub    $0x10,%esp
  int i;
  int tty_fd;
  char tty[] = "/ttyX";
      15:	c7 45 f2 2f 74 74 79 	movl   $0x7974742f,-0xe(%ebp)
      1c:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  for(i = 0; i<3; i++){
    tty[4] = '0' + i;
    if((tty_fd = open(tty, O_RDWR))<0){
      20:	83 ec 08             	sub    $0x8,%esp
  int i;
  int tty_fd;
  char tty[] = "/ttyX";

  for(i = 0; i<3; i++){
    tty[4] = '0' + i;
      23:	88 5d f6             	mov    %bl,-0xa(%ebp)
    if((tty_fd = open(tty, O_RDWR))<0){
      26:	6a 02                	push   $0x2
      28:	56                   	push   %esi
      29:	e8 1a 0b 00 00       	call   b48 <open>
      2e:	83 c4 10             	add    $0x10,%esp
      31:	85 c0                	test   %eax,%eax
      33:	78 23                	js     58 <init_tests+0x58>
      printf(stderr, "failed to open %s\n",tty);
      return -1;
    }
    close(tty_fd);
      35:	83 ec 0c             	sub    $0xc,%esp
      38:	83 c3 01             	add    $0x1,%ebx
      3b:	50                   	push   %eax
      3c:	e8 ef 0a 00 00       	call   b30 <close>
int init_tests() {
  int i;
  int tty_fd;
  char tty[] = "/ttyX";

  for(i = 0; i<3; i++){
      41:	83 c4 10             	add    $0x10,%esp
      44:	80 fb 33             	cmp    $0x33,%bl
      47:	75 d7                	jne    20 <init_tests+0x20>
      return -1;
    }
    close(tty_fd);
  }
  return 0;
}
      49:	8d 65 f8             	lea    -0x8(%ebp),%esp
      printf(stderr, "failed to open %s\n",tty);
      return -1;
    }
    close(tty_fd);
  }
  return 0;
      4c:	31 c0                	xor    %eax,%eax
}
      4e:	5b                   	pop    %ebx
      4f:	5e                   	pop    %esi
      50:	5d                   	pop    %ebp
      51:	c3                   	ret    
      52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  char tty[] = "/ttyX";

  for(i = 0; i<3; i++){
    tty[4] = '0' + i;
    if((tty_fd = open(tty, O_RDWR))<0){
      printf(stderr, "failed to open %s\n",tty);
      58:	83 ec 04             	sub    $0x4,%esp
      5b:	56                   	push   %esi
      5c:	68 38 11 00 00       	push   $0x1138
      61:	6a 02                	push   $0x2
      63:	e8 58 0c 00 00       	call   cc0 <printf>
      return -1;
      68:	83 c4 10             	add    $0x10,%esp
    }
    close(tty_fd);
  }
  return 0;
}
      6b:	8d 65 f8             	lea    -0x8(%ebp),%esp

  for(i = 0; i<3; i++){
    tty[4] = '0' + i;
    if((tty_fd = open(tty, O_RDWR))<0){
      printf(stderr, "failed to open %s\n",tty);
      return -1;
      6e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    close(tty_fd);
  }
  return 0;
}
      73:	5b                   	pop    %ebx
      74:	5e                   	pop    %esi
      75:	5d                   	pop    %ebp
      76:	c3                   	ret    
      77:	89 f6                	mov    %esi,%esi
      79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000080 <ioctl_attach_detach_test>:
   but TTY_GET/DEV_DETATCH will return "1", when we attach the given tty
   using TTY_SET/DEV_ATTACH : TTY_GET/DEV_ATTACH will return "1" and TTY_GET/DEV_DETATCH
   will return "0".
   TTYSETS return "0" on operation success.
*/
int ioctl_attach_detach_test() {
      80:	55                   	push   %ebp
      81:	89 e5                	mov    %esp,%ebp
      83:	56                   	push   %esi
      84:	53                   	push   %ebx
  int tty_fd;
  char * tty_name = "tty0";

  if((tty_fd = open(tty_name, O_RDWR)) < 0){
      85:	83 ec 08             	sub    $0x8,%esp
      88:	6a 02                	push   $0x2
      8a:	68 4b 11 00 00       	push   $0x114b
      8f:	e8 b4 0a 00 00       	call   b48 <open>
      94:	83 c4 10             	add    $0x10,%esp
      97:	85 c0                	test   %eax,%eax
      99:	0f 88 61 01 00 00    	js     200 <ioctl_attach_detach_test+0x180>
    printf(stderr, "failed to open %s\n",tty_name);
    return -1;
  }

  // pre condition, verify tty is not attached
  if(ioctl(tty_fd, TTYGETS, DEV_ATTACH) != 0){
      9f:	83 ec 04             	sub    $0x4,%esp
      a2:	89 c3                	mov    %eax,%ebx
      a4:	6a 10                	push   $0x10
      a6:	6a 02                	push   $0x2
      a8:	50                   	push   %eax
      a9:	e8 2a 0b 00 00       	call   bd8 <ioctl>
      ae:	83 c4 10             	add    $0x10,%esp
      b1:	85 c0                	test   %eax,%eax
      b3:	0f 85 e7 00 00 00    	jne    1a0 <ioctl_attach_detach_test+0x120>
      printf(stderr, "step 1. %s atach precondition failed  \n",tty_name);
      goto fail;
  }

  // test - attach tty
  if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0){
      b9:	83 ec 04             	sub    $0x4,%esp
      bc:	6a 10                	push   $0x10
      be:	6a 01                	push   $0x1
      c0:	53                   	push   %ebx
      c1:	e8 12 0b 00 00       	call   bd8 <ioctl>
      c6:	83 c4 10             	add    $0x10,%esp
      c9:	85 c0                	test   %eax,%eax
      cb:	0f 88 57 01 00 00    	js     228 <ioctl_attach_detach_test+0x1a8>
    printf(stderr, "step 2. %s failed TTYSETS & DEV_ATTACH \n",tty_name);
    goto fail;
  }

  int status = ioctl(tty_fd, TTYGETS, DEV_ATTACH);
      d1:	83 ec 04             	sub    $0x4,%esp
      d4:	6a 10                	push   $0x10
      d6:	6a 02                	push   $0x2
      d8:	53                   	push   %ebx
      d9:	e8 fa 0a 00 00       	call   bd8 <ioctl>

  if(status == 0){
      de:	83 c4 10             	add    $0x10,%esp
      e1:	85 c0                	test   %eax,%eax
      e3:	0f 84 f7 00 00 00    	je     1e0 <ioctl_attach_detach_test+0x160>
    printf(stderr, "step 3. %s failed TTYGETS & DEV_ATTACH, expected: >0 \n",tty_name);
    goto fail;
  }
  else if(status == -1){
      e9:	83 f8 ff             	cmp    $0xffffffff,%eax
      ec:	74 5c                	je     14a <ioctl_attach_detach_test+0xca>
    printf(stderr, "step 3. ioctl failed");
    goto fail;
  }
  else if(status == 1){
      ee:	83 f8 01             	cmp    $0x1,%eax
      f1:	75 69                	jne    15c <ioctl_attach_detach_test+0xdc>

    if(ioctl(tty_fd, TTYSETS, DEV_DETACH) == 0){
      f3:	83 ec 04             	sub    $0x4,%esp
      f6:	6a 20                	push   $0x20
      f8:	6a 01                	push   $0x1
      fa:	53                   	push   %ebx
      fb:	e8 d8 0a 00 00       	call   bd8 <ioctl>
     100:	83 c4 10             	add    $0x10,%esp
     103:	85 c0                	test   %eax,%eax
     105:	89 c6                	mov    %eax,%esi
     107:	0f 85 b3 00 00 00    	jne    1c0 <ioctl_attach_detach_test+0x140>
      printf(stderr, "%s detached \n",tty_name);
     10d:	83 ec 04             	sub    $0x4,%esp
     110:	68 4b 11 00 00       	push   $0x114b
     115:	68 65 11 00 00       	push   $0x1165
     11a:	6a 02                	push   $0x2
     11c:	e8 9f 0b 00 00       	call   cc0 <printf>
    }else{
      printf(stderr, "step 3. %s detach failed \n",tty_name);
      goto fail;
    }

    status = ioctl(tty_fd, TTYGETS, DEV_DETACH);
     121:	83 c4 0c             	add    $0xc,%esp
     124:	6a 20                	push   $0x20
     126:	6a 02                	push   $0x2
     128:	53                   	push   %ebx
     129:	e8 aa 0a 00 00       	call   bd8 <ioctl>

    if(status == 0){
     12e:	83 c4 10             	add    $0x10,%esp
     131:	85 c0                	test   %eax,%eax
     133:	75 4b                	jne    180 <ioctl_attach_detach_test+0x100>
      close(tty_fd);
     135:	83 ec 0c             	sub    $0xc,%esp
     138:	53                   	push   %ebx
     139:	e8 f2 09 00 00       	call   b30 <close>
      return 0;
     13e:	83 c4 10             	add    $0x10,%esp
    }
  }
fail:
  close(tty_fd);
  return -1;
}
     141:	8d 65 f8             	lea    -0x8(%ebp),%esp
     144:	89 f0                	mov    %esi,%eax
     146:	5b                   	pop    %ebx
     147:	5e                   	pop    %esi
     148:	5d                   	pop    %ebp
     149:	c3                   	ret    
  if(status == 0){
    printf(stderr, "step 3. %s failed TTYGETS & DEV_ATTACH, expected: >0 \n",tty_name);
    goto fail;
  }
  else if(status == -1){
    printf(stderr, "step 3. ioctl failed");
     14a:	83 ec 08             	sub    $0x8,%esp
     14d:	68 50 11 00 00       	push   $0x1150
     152:	6a 02                	push   $0x2
     154:	e8 67 0b 00 00       	call   cc0 <printf>
    goto fail;
     159:	83 c4 10             	add    $0x10,%esp
      printf(stderr, "step 3. ioctl GETS & DETACH failed");
      goto fail;
    }
  }
fail:
  close(tty_fd);
     15c:	83 ec 0c             	sub    $0xc,%esp
  return -1;
     15f:	be ff ff ff ff       	mov    $0xffffffff,%esi
      printf(stderr, "step 3. ioctl GETS & DETACH failed");
      goto fail;
    }
  }
fail:
  close(tty_fd);
     164:	53                   	push   %ebx
     165:	e8 c6 09 00 00       	call   b30 <close>
  return -1;
     16a:	83 c4 10             	add    $0x10,%esp
}
     16d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     170:	89 f0                	mov    %esi,%eax
     172:	5b                   	pop    %ebx
     173:	5e                   	pop    %esi
     174:	5d                   	pop    %ebp
     175:	c3                   	ret    
     176:	8d 76 00             	lea    0x0(%esi),%esi
     179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

    if(status == 0){
      close(tty_fd);
      return 0;
    }
    else if(status == -1){
     180:	83 f8 ff             	cmp    $0xffffffff,%eax
     183:	75 d7                	jne    15c <ioctl_attach_detach_test+0xdc>
      printf(stderr, "step 3. ioctl GETS & DETACH failed");
     185:	83 ec 08             	sub    $0x8,%esp
     188:	68 60 12 00 00       	push   $0x1260
     18d:	6a 02                	push   $0x2
     18f:	e8 2c 0b 00 00       	call   cc0 <printf>
      goto fail;
     194:	83 c4 10             	add    $0x10,%esp
     197:	eb c3                	jmp    15c <ioctl_attach_detach_test+0xdc>
     199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  }

  // pre condition, verify tty is not attached
  if(ioctl(tty_fd, TTYGETS, DEV_ATTACH) != 0){
      printf(stderr, "step 1. %s atach precondition failed  \n",tty_name);
     1a0:	83 ec 04             	sub    $0x4,%esp
     1a3:	68 4b 11 00 00       	push   $0x114b
     1a8:	68 d4 11 00 00       	push   $0x11d4
     1ad:	6a 02                	push   $0x2
     1af:	e8 0c 0b 00 00       	call   cc0 <printf>
      goto fail;
     1b4:	83 c4 10             	add    $0x10,%esp
     1b7:	eb a3                	jmp    15c <ioctl_attach_detach_test+0xdc>
     1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  else if(status == 1){

    if(ioctl(tty_fd, TTYSETS, DEV_DETACH) == 0){
      printf(stderr, "%s detached \n",tty_name);
    }else{
      printf(stderr, "step 3. %s detach failed \n",tty_name);
     1c0:	83 ec 04             	sub    $0x4,%esp
     1c3:	68 4b 11 00 00       	push   $0x114b
     1c8:	68 73 11 00 00       	push   $0x1173
     1cd:	6a 02                	push   $0x2
     1cf:	e8 ec 0a 00 00       	call   cc0 <printf>
      goto fail;
     1d4:	83 c4 10             	add    $0x10,%esp
     1d7:	eb 83                	jmp    15c <ioctl_attach_detach_test+0xdc>
     1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }

  int status = ioctl(tty_fd, TTYGETS, DEV_ATTACH);

  if(status == 0){
    printf(stderr, "step 3. %s failed TTYGETS & DEV_ATTACH, expected: >0 \n",tty_name);
     1e0:	83 ec 04             	sub    $0x4,%esp
     1e3:	68 4b 11 00 00       	push   $0x114b
     1e8:	68 28 12 00 00       	push   $0x1228
     1ed:	6a 02                	push   $0x2
     1ef:	e8 cc 0a 00 00       	call   cc0 <printf>
    goto fail;
     1f4:	83 c4 10             	add    $0x10,%esp
     1f7:	e9 60 ff ff ff       	jmp    15c <ioctl_attach_detach_test+0xdc>
     1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int ioctl_attach_detach_test() {
  int tty_fd;
  char * tty_name = "tty0";

  if((tty_fd = open(tty_name, O_RDWR)) < 0){
    printf(stderr, "failed to open %s\n",tty_name);
     200:	83 ec 04             	sub    $0x4,%esp
    return -1;
     203:	be ff ff ff ff       	mov    $0xffffffff,%esi
int ioctl_attach_detach_test() {
  int tty_fd;
  char * tty_name = "tty0";

  if((tty_fd = open(tty_name, O_RDWR)) < 0){
    printf(stderr, "failed to open %s\n",tty_name);
     208:	68 4b 11 00 00       	push   $0x114b
     20d:	68 38 11 00 00       	push   $0x1138
     212:	6a 02                	push   $0x2
     214:	e8 a7 0a 00 00       	call   cc0 <printf>
    return -1;
     219:	83 c4 10             	add    $0x10,%esp
     21c:	e9 20 ff ff ff       	jmp    141 <ioctl_attach_detach_test+0xc1>
     221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      goto fail;
  }

  // test - attach tty
  if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0){
    printf(stderr, "step 2. %s failed TTYSETS & DEV_ATTACH \n",tty_name);
     228:	83 ec 04             	sub    $0x4,%esp
     22b:	68 4b 11 00 00       	push   $0x114b
     230:	68 fc 11 00 00       	push   $0x11fc
     235:	6a 02                	push   $0x2
     237:	e8 84 0a 00 00       	call   cc0 <printf>
    goto fail;
     23c:	83 c4 10             	add    $0x10,%esp
     23f:	e9 18 ff ff ff       	jmp    15c <ioctl_attach_detach_test+0xdc>
     244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     24a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000250 <ioctl_connect_disconnect_test>:
   but TTY_GET/DEV_DISCONNECT will return "1", when we connect the given tty
   using TTY_SET/DEV_CONNECT : TTY_GET/DEV_CONNECT will return "1" and TTY_GET/DEV_DISCONNECT
   will return "0".
   TTYSETS return "0" on operation success.
*/
int ioctl_connect_disconnect_test() {
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	57                   	push   %edi
     254:	56                   	push   %esi
     255:	53                   	push   %ebx
     256:	83 ec 14             	sub    $0x14,%esp
  int tty_fd;
  char * tty_name = "tty0";

  if((tty_fd = open(tty_name, O_RDWR)) < 0){
     259:	6a 02                	push   $0x2
     25b:	68 4b 11 00 00       	push   $0x114b
     260:	e8 e3 08 00 00       	call   b48 <open>
     265:	83 c4 10             	add    $0x10,%esp
     268:	85 c0                	test   %eax,%eax
     26a:	89 c3                	mov    %eax,%ebx
     26c:	0f 88 06 01 00 00    	js     378 <ioctl_connect_disconnect_test+0x128>
    printf(stderr, "failed to open %s\n",tty_name);
  }

  // pre condition, verify tty is not connected
  if(ioctl(tty_fd, TTYGETS, DEV_CONNECT) != 0){
     272:	83 ec 04             	sub    $0x4,%esp
     275:	68 00 10 00 00       	push   $0x1000
     27a:	6a 02                	push   $0x2
     27c:	53                   	push   %ebx
     27d:	e8 56 09 00 00       	call   bd8 <ioctl>
     282:	83 c4 10             	add    $0x10,%esp
     285:	85 c0                	test   %eax,%eax
     287:	0f 85 0b 01 00 00    	jne    398 <ioctl_connect_disconnect_test+0x148>
      printf(stderr, "step 1. %s connect precondition failed  \n",tty_name);
      goto fail;
  }

  // test connect
  if(ioctl(tty_fd, TTYSETS, DEV_CONNECT) < 0){
     28d:	83 ec 04             	sub    $0x4,%esp
     290:	68 00 10 00 00       	push   $0x1000
     295:	6a 01                	push   $0x1
     297:	53                   	push   %ebx
     298:	e8 3b 09 00 00       	call   bd8 <ioctl>
     29d:	83 c4 10             	add    $0x10,%esp
     2a0:	85 c0                	test   %eax,%eax
     2a2:	0f 88 10 01 00 00    	js     3b8 <ioctl_connect_disconnect_test+0x168>
    printf(stderr, "step 2. %s failed TTYSETS & DEV_CONNECT \n",tty_name);
    goto fail;
  }

  int status = ioctl(tty_fd, TTYGETS, DEV_CONNECT);
     2a8:	83 ec 04             	sub    $0x4,%esp
     2ab:	68 00 10 00 00       	push   $0x1000
     2b0:	6a 02                	push   $0x2
     2b2:	53                   	push   %ebx
     2b3:	e8 20 09 00 00       	call   bd8 <ioctl>

  if(ioctl(tty_fd, TTYSETS, DEV_DISCONNECT) == 0){
     2b8:	83 c4 0c             	add    $0xc,%esp
  if(ioctl(tty_fd, TTYSETS, DEV_CONNECT) < 0){
    printf(stderr, "step 2. %s failed TTYSETS & DEV_CONNECT \n",tty_name);
    goto fail;
  }

  int status = ioctl(tty_fd, TTYGETS, DEV_CONNECT);
     2bb:	89 c6                	mov    %eax,%esi

  if(ioctl(tty_fd, TTYSETS, DEV_DISCONNECT) == 0){
     2bd:	68 00 20 00 00       	push   $0x2000
     2c2:	6a 01                	push   $0x1
     2c4:	53                   	push   %ebx
     2c5:	e8 0e 09 00 00       	call   bd8 <ioctl>
     2ca:	83 c4 10             	add    $0x10,%esp
     2cd:	85 c0                	test   %eax,%eax
     2cf:	0f 85 82 00 00 00    	jne    357 <ioctl_connect_disconnect_test+0x107>
      printf(stderr, "%s disconnected \n",tty_name);
     2d5:	83 ec 04             	sub    $0x4,%esp
     2d8:	68 4b 11 00 00       	push   $0x114b
     2dd:	68 8e 11 00 00       	push   $0x118e
     2e2:	6a 02                	push   $0x2
     2e4:	e8 d7 09 00 00       	call   cc0 <printf>
      if(ioctl(tty_fd, TTYSETS, DEV_DETACH) == 0){
     2e9:	83 c4 0c             	add    $0xc,%esp
     2ec:	6a 20                	push   $0x20
     2ee:	6a 01                	push   $0x1
     2f0:	53                   	push   %ebx
     2f1:	e8 e2 08 00 00       	call   bd8 <ioctl>
     2f6:	83 c4 10             	add    $0x10,%esp
     2f9:	85 c0                	test   %eax,%eax
     2fb:	89 c7                	mov    %eax,%edi
     2fd:	75 58                	jne    357 <ioctl_connect_disconnect_test+0x107>
        printf(stderr, "%s detatched \n",tty_name);
     2ff:	83 ec 04             	sub    $0x4,%esp
     302:	68 4b 11 00 00       	push   $0x114b
     307:	68 a0 11 00 00       	push   $0x11a0
     30c:	6a 02                	push   $0x2
     30e:	e8 ad 09 00 00       	call   cc0 <printf>
      }
  }else{
      goto fail;
  }

  if(status == 0){
     313:	83 c4 10             	add    $0x10,%esp
     316:	85 f6                	test   %esi,%esi
     318:	74 26                	je     340 <ioctl_connect_disconnect_test+0xf0>
    printf(stderr, "step 3. %s failed TTYGETS & DEV_CONNECT, expected: > 0 \n",tty_name);
    goto fail;
  }
  else if(status == -1){
     31a:	83 fe ff             	cmp    $0xffffffff,%esi
     31d:	0f 84 ae 00 00 00    	je     3d1 <ioctl_connect_disconnect_test+0x181>
    printf(stderr, "step 3. ioctl failed");
    goto fail;
  }
  else if(status == 1){
     323:	83 fe 01             	cmp    $0x1,%esi
     326:	75 2f                	jne    357 <ioctl_connect_disconnect_test+0x107>
    close(tty_fd);
     328:	83 ec 0c             	sub    $0xc,%esp
     32b:	53                   	push   %ebx
     32c:	e8 ff 07 00 00       	call   b30 <close>
    return 0;
     331:	83 c4 10             	add    $0x10,%esp
  }
fail:
  close(tty_fd);
  return -1;
}
     334:	8d 65 f4             	lea    -0xc(%ebp),%esp
     337:	89 f8                	mov    %edi,%eax
     339:	5b                   	pop    %ebx
     33a:	5e                   	pop    %esi
     33b:	5f                   	pop    %edi
     33c:	5d                   	pop    %ebp
     33d:	c3                   	ret    
     33e:	66 90                	xchg   %ax,%ax
  }else{
      goto fail;
  }

  if(status == 0){
    printf(stderr, "step 3. %s failed TTYGETS & DEV_CONNECT, expected: > 0 \n",tty_name);
     340:	83 ec 04             	sub    $0x4,%esp
     343:	68 4b 11 00 00       	push   $0x114b
     348:	68 dc 12 00 00       	push   $0x12dc
     34d:	6a 02                	push   $0x2
     34f:	e8 6c 09 00 00       	call   cc0 <printf>
    goto fail;
     354:	83 c4 10             	add    $0x10,%esp
  else if(status == 1){
    close(tty_fd);
    return 0;
  }
fail:
  close(tty_fd);
     357:	83 ec 0c             	sub    $0xc,%esp
  return -1;
     35a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  else if(status == 1){
    close(tty_fd);
    return 0;
  }
fail:
  close(tty_fd);
     35f:	53                   	push   %ebx
     360:	e8 cb 07 00 00       	call   b30 <close>
  return -1;
     365:	83 c4 10             	add    $0x10,%esp
}
     368:	8d 65 f4             	lea    -0xc(%ebp),%esp
     36b:	89 f8                	mov    %edi,%eax
     36d:	5b                   	pop    %ebx
     36e:	5e                   	pop    %esi
     36f:	5f                   	pop    %edi
     370:	5d                   	pop    %ebp
     371:	c3                   	ret    
     372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int ioctl_connect_disconnect_test() {
  int tty_fd;
  char * tty_name = "tty0";

  if((tty_fd = open(tty_name, O_RDWR)) < 0){
    printf(stderr, "failed to open %s\n",tty_name);
     378:	83 ec 04             	sub    $0x4,%esp
     37b:	68 4b 11 00 00       	push   $0x114b
     380:	68 38 11 00 00       	push   $0x1138
     385:	6a 02                	push   $0x2
     387:	e8 34 09 00 00       	call   cc0 <printf>
     38c:	83 c4 10             	add    $0x10,%esp
     38f:	e9 de fe ff ff       	jmp    272 <ioctl_connect_disconnect_test+0x22>
     394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // pre condition, verify tty is not connected
  if(ioctl(tty_fd, TTYGETS, DEV_CONNECT) != 0){
      printf(stderr, "step 1. %s connect precondition failed  \n",tty_name);
     398:	83 ec 04             	sub    $0x4,%esp
     39b:	68 4b 11 00 00       	push   $0x114b
     3a0:	68 84 12 00 00       	push   $0x1284
     3a5:	6a 02                	push   $0x2
     3a7:	e8 14 09 00 00       	call   cc0 <printf>
      goto fail;
     3ac:	83 c4 10             	add    $0x10,%esp
     3af:	eb a6                	jmp    357 <ioctl_connect_disconnect_test+0x107>
     3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }

  // test connect
  if(ioctl(tty_fd, TTYSETS, DEV_CONNECT) < 0){
    printf(stderr, "step 2. %s failed TTYSETS & DEV_CONNECT \n",tty_name);
     3b8:	83 ec 04             	sub    $0x4,%esp
     3bb:	68 4b 11 00 00       	push   $0x114b
     3c0:	68 b0 12 00 00       	push   $0x12b0
     3c5:	6a 02                	push   $0x2
     3c7:	e8 f4 08 00 00       	call   cc0 <printf>
    goto fail;
     3cc:	83 c4 10             	add    $0x10,%esp
     3cf:	eb 86                	jmp    357 <ioctl_connect_disconnect_test+0x107>
  if(status == 0){
    printf(stderr, "step 3. %s failed TTYGETS & DEV_CONNECT, expected: > 0 \n",tty_name);
    goto fail;
  }
  else if(status == -1){
    printf(stderr, "step 3. ioctl failed");
     3d1:	83 ec 08             	sub    $0x8,%esp
     3d4:	68 50 11 00 00       	push   $0x1150
     3d9:	6a 02                	push   $0x2
     3db:	e8 e0 08 00 00       	call   cc0 <printf>
    goto fail;
     3e0:	83 c4 10             	add    $0x10,%esp
     3e3:	e9 6f ff ff ff       	jmp    357 <ioctl_connect_disconnect_test+0x107>
     3e8:	90                   	nop
     3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <ioctl_console_test>:
}

/* Verify that any attatch/connect operations to the console device fails
  - console should not be used as a tty for a container.
*/
int ioctl_console_test() {
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 0c             	sub    $0xc,%esp
  int tty_fd = 1; //CONSOLE
  char * tty_name = "console";


  if( ioctl(tty_fd, TTYGETS, DEV_CONNECT) == 0){
     3f6:	68 00 10 00 00       	push   $0x1000
     3fb:	6a 02                	push   $0x2
     3fd:	6a 01                	push   $0x1
     3ff:	e8 d4 07 00 00       	call   bd8 <ioctl>
     404:	83 c4 10             	add    $0x10,%esp
     407:	85 c0                	test   %eax,%eax
     409:	74 4d                	je     458 <ioctl_console_test+0x68>
    printf(stderr, " %s  connected TTYGETS / DEV_CONNECT, expect: disconnected \n",tty_name);
    return -1;
  }

  if(ioctl(tty_fd, TTYGETS, DEV_ATTACH)  == 0){
     40b:	83 ec 04             	sub    $0x4,%esp
     40e:	6a 10                	push   $0x10
     410:	6a 02                	push   $0x2
     412:	6a 01                	push   $0x1
     414:	e8 bf 07 00 00       	call   bd8 <ioctl>
     419:	83 c4 10             	add    $0x10,%esp
     41c:	85 c0                	test   %eax,%eax
     41e:	74 60                	je     480 <ioctl_console_test+0x90>
    printf(stderr, " %s  attached TTYGETS / DEV_ATTACH, expect: detached \n",tty_name);
    return -1;
  }

  if(ioctl(tty_fd, TTYSETS, DEV_ATTACH)  == 0){
     420:	83 ec 04             	sub    $0x4,%esp
     423:	6a 10                	push   $0x10
     425:	6a 01                	push   $0x1
     427:	6a 01                	push   $0x1
     429:	e8 aa 07 00 00       	call   bd8 <ioctl>
     42e:	83 c4 10             	add    $0x10,%esp
     431:	85 c0                	test   %eax,%eax
     433:	74 6b                	je     4a0 <ioctl_console_test+0xb0>
    printf(stderr, " %s  attached TTYSETS / DEV_ATTACH, expect: -1 \n",tty_name);
    return -1;
  }

  if( ioctl(tty_fd, TTYSETS, DEV_CONNECT) == 0){
     435:	83 ec 04             	sub    $0x4,%esp
     438:	68 00 10 00 00       	push   $0x1000
     43d:	6a 01                	push   $0x1
     43f:	6a 01                	push   $0x1
     441:	e8 92 07 00 00       	call   bd8 <ioctl>
     446:	83 c4 10             	add    $0x10,%esp
     449:	85 c0                	test   %eax,%eax
     44b:	74 73                	je     4c0 <ioctl_console_test+0xd0>
    printf(stderr, " %s  connected TTYSETS / DEV_CONNECT, expect: -1 \n",tty_name);
    return -1;
  }
  return 0;
     44d:	31 c0                	xor    %eax,%eax
}
     44f:	c9                   	leave  
     450:	c3                   	ret    
     451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tty_fd = 1; //CONSOLE
  char * tty_name = "console";


  if( ioctl(tty_fd, TTYGETS, DEV_CONNECT) == 0){
    printf(stderr, " %s  connected TTYGETS / DEV_CONNECT, expect: disconnected \n",tty_name);
     458:	83 ec 04             	sub    $0x4,%esp
     45b:	68 af 11 00 00       	push   $0x11af
     460:	68 18 13 00 00       	push   $0x1318
     465:	6a 02                	push   $0x2
     467:	e8 54 08 00 00       	call   cc0 <printf>
    return -1;
     46c:	83 c4 10             	add    $0x10,%esp
     46f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if( ioctl(tty_fd, TTYSETS, DEV_CONNECT) == 0){
    printf(stderr, " %s  connected TTYSETS / DEV_CONNECT, expect: -1 \n",tty_name);
    return -1;
  }
  return 0;
}
     474:	c9                   	leave  
     475:	c3                   	ret    
     476:	8d 76 00             	lea    0x0(%esi),%esi
     479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(stderr, " %s  connected TTYGETS / DEV_CONNECT, expect: disconnected \n",tty_name);
    return -1;
  }

  if(ioctl(tty_fd, TTYGETS, DEV_ATTACH)  == 0){
    printf(stderr, " %s  attached TTYGETS / DEV_ATTACH, expect: detached \n",tty_name);
     480:	83 ec 04             	sub    $0x4,%esp
     483:	68 af 11 00 00       	push   $0x11af
     488:	68 58 13 00 00       	push   $0x1358
     48d:	6a 02                	push   $0x2
     48f:	e8 2c 08 00 00       	call   cc0 <printf>
    return -1;
     494:	83 c4 10             	add    $0x10,%esp
     497:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if( ioctl(tty_fd, TTYSETS, DEV_CONNECT) == 0){
    printf(stderr, " %s  connected TTYSETS / DEV_CONNECT, expect: -1 \n",tty_name);
    return -1;
  }
  return 0;
}
     49c:	c9                   	leave  
     49d:	c3                   	ret    
     49e:	66 90                	xchg   %ax,%ax
    printf(stderr, " %s  attached TTYGETS / DEV_ATTACH, expect: detached \n",tty_name);
    return -1;
  }

  if(ioctl(tty_fd, TTYSETS, DEV_ATTACH)  == 0){
    printf(stderr, " %s  attached TTYSETS / DEV_ATTACH, expect: -1 \n",tty_name);
     4a0:	83 ec 04             	sub    $0x4,%esp
     4a3:	68 af 11 00 00       	push   $0x11af
     4a8:	68 90 13 00 00       	push   $0x1390
     4ad:	6a 02                	push   $0x2
     4af:	e8 0c 08 00 00       	call   cc0 <printf>
    return -1;
     4b4:	83 c4 10             	add    $0x10,%esp
     4b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if( ioctl(tty_fd, TTYSETS, DEV_CONNECT) == 0){
    printf(stderr, " %s  connected TTYSETS / DEV_CONNECT, expect: -1 \n",tty_name);
    return -1;
  }
  return 0;
}
     4bc:	c9                   	leave  
     4bd:	c3                   	ret    
     4be:	66 90                	xchg   %ax,%ax
    printf(stderr, " %s  attached TTYSETS / DEV_ATTACH, expect: -1 \n",tty_name);
    return -1;
  }

  if( ioctl(tty_fd, TTYSETS, DEV_CONNECT) == 0){
    printf(stderr, " %s  connected TTYSETS / DEV_CONNECT, expect: -1 \n",tty_name);
     4c0:	83 ec 04             	sub    $0x4,%esp
     4c3:	68 af 11 00 00       	push   $0x11af
     4c8:	68 c4 13 00 00       	push   $0x13c4
     4cd:	6a 02                	push   $0x2
     4cf:	e8 ec 07 00 00       	call   cc0 <printf>
    return -1;
     4d4:	83 c4 10             	add    $0x10,%esp
     4d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
     4dc:	c9                   	leave  
     4dd:	c3                   	ret    
     4de:	66 90                	xchg   %ax,%ax

000004e0 <ioctl_wrong_device_test>:

/* Verify wrong device usage
  - only specified devices created by init (tty0-2) can be used as ttys
  - mknod()is xv6 syscall to create a device, user should specify minor and major numbers
*/
int ioctl_wrong_device_test() {
     4e0:	55                   	push   %ebp
     4e1:	89 e5                	mov    %esp,%ebp
     4e3:	56                   	push   %esi
     4e4:	53                   	push   %ebx
  int tty_fd;
  char * tty_name = "tty_test";

  if(mknod(tty_name,1,5) < 0){
     4e5:	83 ec 04             	sub    $0x4,%esp
     4e8:	6a 05                	push   $0x5
     4ea:	6a 01                	push   $0x1
     4ec:	68 b7 11 00 00       	push   $0x11b7
     4f1:	e8 5a 06 00 00       	call   b50 <mknod>
     4f6:	83 c4 10             	add    $0x10,%esp
     4f9:	85 c0                	test   %eax,%eax
     4fb:	0f 88 9f 00 00 00    	js     5a0 <ioctl_wrong_device_test+0xc0>
    printf(stderr, "failed to create test device %s\n",tty_name);
    return -1;
  }

  if((tty_fd = open(tty_name, O_RDWR)) < 0){
     501:	83 ec 08             	sub    $0x8,%esp
     504:	6a 02                	push   $0x2
     506:	68 b7 11 00 00       	push   $0x11b7
     50b:	e8 38 06 00 00       	call   b48 <open>
     510:	83 c4 10             	add    $0x10,%esp
     513:	85 c0                	test   %eax,%eax
     515:	89 c3                	mov    %eax,%ebx
     517:	0f 88 a3 00 00 00    	js     5c0 <ioctl_wrong_device_test+0xe0>
    printf(stderr, "failed to open %s\n",tty_name);
    return -1;
  }

  int status = ioctl(tty_fd, TTYGETS, DEV_ATTACH);
     51d:	83 ec 04             	sub    $0x4,%esp
     520:	6a 10                	push   $0x10
     522:	6a 02                	push   $0x2
     524:	50                   	push   %eax
     525:	e8 ae 06 00 00       	call   bd8 <ioctl>
     52a:	89 c6                	mov    %eax,%esi

  unlink(tty_name);
     52c:	c7 04 24 b7 11 00 00 	movl   $0x11b7,(%esp)
     533:	e8 20 06 00 00       	call   b58 <unlink>

  if (status == 0){
     538:	83 c4 10             	add    $0x10,%esp
     53b:	85 f6                	test   %esi,%esi
     53d:	74 29                	je     568 <ioctl_wrong_device_test+0x88>
    printf(stderr, " %s device passed verification? - wrong! Expected: -1 \n",tty_name);
    goto fail;
  }
  else if(status == 1){
     53f:	83 fe 01             	cmp    $0x1,%esi
     542:	0f 84 99 00 00 00    	je     5e1 <ioctl_wrong_device_test+0x101>
    printf(stderr, " %s return status: %d - wrong! Expected: -1 \n",tty_name, status);
    goto fail;
  }else if(status == -1){
     548:	83 fe ff             	cmp    $0xffffffff,%esi
     54b:	75 32                	jne    57f <ioctl_wrong_device_test+0x9f>
    close(tty_fd);
     54d:	83 ec 0c             	sub    $0xc,%esp
     550:	53                   	push   %ebx
     551:	e8 da 05 00 00       	call   b30 <close>
    return 0;
     556:	83 c4 10             	add    $0x10,%esp
     559:	31 c0                	xor    %eax,%eax
  }

fail:
  close(tty_fd);
  return -1;
}
     55b:	8d 65 f8             	lea    -0x8(%ebp),%esp
     55e:	5b                   	pop    %ebx
     55f:	5e                   	pop    %esi
     560:	5d                   	pop    %ebp
     561:	c3                   	ret    
     562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int status = ioctl(tty_fd, TTYGETS, DEV_ATTACH);

  unlink(tty_name);

  if (status == 0){
    printf(stderr, " %s device passed verification? - wrong! Expected: -1 \n",tty_name);
     568:	83 ec 04             	sub    $0x4,%esp
     56b:	68 b7 11 00 00       	push   $0x11b7
     570:	68 1c 14 00 00       	push   $0x141c
     575:	6a 02                	push   $0x2
     577:	e8 44 07 00 00       	call   cc0 <printf>
    goto fail;
     57c:	83 c4 10             	add    $0x10,%esp
    close(tty_fd);
    return 0;
  }

fail:
  close(tty_fd);
     57f:	83 ec 0c             	sub    $0xc,%esp
     582:	53                   	push   %ebx
     583:	e8 a8 05 00 00       	call   b30 <close>
  return -1;
     588:	83 c4 10             	add    $0x10,%esp
}
     58b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
  }

fail:
  close(tty_fd);
  return -1;
     58e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     593:	5b                   	pop    %ebx
     594:	5e                   	pop    %esi
     595:	5d                   	pop    %ebp
     596:	c3                   	ret    
     597:	89 f6                	mov    %esi,%esi
     599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
int ioctl_wrong_device_test() {
  int tty_fd;
  char * tty_name = "tty_test";

  if(mknod(tty_name,1,5) < 0){
    printf(stderr, "failed to create test device %s\n",tty_name);
     5a0:	83 ec 04             	sub    $0x4,%esp
     5a3:	68 b7 11 00 00       	push   $0x11b7
     5a8:	68 f8 13 00 00       	push   $0x13f8
     5ad:	6a 02                	push   $0x2
     5af:	e8 0c 07 00 00       	call   cc0 <printf>
    return -1;
     5b4:	83 c4 10             	add    $0x10,%esp
     5b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     5bc:	eb 9d                	jmp    55b <ioctl_wrong_device_test+0x7b>
     5be:	66 90                	xchg   %ax,%ax
  }

  if((tty_fd = open(tty_name, O_RDWR)) < 0){
    printf(stderr, "failed to open %s\n",tty_name);
     5c0:	83 ec 04             	sub    $0x4,%esp
     5c3:	68 b7 11 00 00       	push   $0x11b7
     5c8:	68 38 11 00 00       	push   $0x1138
     5cd:	6a 02                	push   $0x2
     5cf:	e8 ec 06 00 00       	call   cc0 <printf>
    return -1;
     5d4:	83 c4 10             	add    $0x10,%esp
     5d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     5dc:	e9 7a ff ff ff       	jmp    55b <ioctl_wrong_device_test+0x7b>
  if (status == 0){
    printf(stderr, " %s device passed verification? - wrong! Expected: -1 \n",tty_name);
    goto fail;
  }
  else if(status == 1){
    printf(stderr, " %s return status: %d - wrong! Expected: -1 \n",tty_name, status);
     5e1:	6a 01                	push   $0x1
     5e3:	68 b7 11 00 00       	push   $0x11b7
     5e8:	68 54 14 00 00       	push   $0x1454
     5ed:	6a 02                	push   $0x2
     5ef:	e8 cc 06 00 00       	call   cc0 <printf>
    goto fail;
     5f4:	83 c4 10             	add    $0x10,%esp
     5f7:	eb 86                	jmp    57f <ioctl_wrong_device_test+0x9f>
     5f9:	66 90                	xchg   %ax,%ax
     5fb:	66 90                	xchg   %ax,%ax
     5fd:	66 90                	xchg   %ax,%ax
     5ff:	90                   	nop

00000600 <main>:
fail:
  close(tty_fd);
  return -1;
}

int main() {
     600:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     604:	83 e4 f0             	and    $0xfffffff0,%esp
     607:	ff 71 fc             	pushl  -0x4(%ecx)
     60a:	55                   	push   %ebp
     60b:	89 e5                	mov    %esp,%ebp
     60d:	51                   	push   %ecx
     60e:	83 ec 04             	sub    $0x4,%esp

  //TTY INIT TESTS
  if(init_tests() < 0)
     611:	e8 ea f9 ff ff       	call   0 <init_tests>
     616:	85 c0                	test   %eax,%eax
     618:	78 46                	js     660 <main+0x60>
    exit(1);

  //ioctl TESTS
  if(ioctl_wrong_device_test() < 0)
     61a:	e8 c1 fe ff ff       	call   4e0 <ioctl_wrong_device_test>
     61f:	85 c0                	test   %eax,%eax
     621:	78 3d                	js     660 <main+0x60>
    exit(1);

  if(ioctl_console_test() < 0)
     623:	e8 c8 fd ff ff       	call   3f0 <ioctl_console_test>
     628:	85 c0                	test   %eax,%eax
     62a:	78 34                	js     660 <main+0x60>
    exit(1);

  //ioctl SCENARIO TESTS
  if(ioctl_attach_detach_test() < 0)
     62c:	e8 4f fa ff ff       	call   80 <ioctl_attach_detach_test>
     631:	85 c0                	test   %eax,%eax
     633:	78 2b                	js     660 <main+0x60>
    exit(1);

  if(ioctl_connect_disconnect_test() < 0)
     635:	e8 16 fc ff ff       	call   250 <ioctl_connect_disconnect_test>
     63a:	85 c0                	test   %eax,%eax
     63c:	78 22                	js     660 <main+0x60>
    exit(1);

  printf(stderr, "ioctl TESTS PASS:\n");
     63e:	50                   	push   %eax
     63f:	50                   	push   %eax
     640:	68 c0 11 00 00       	push   $0x11c0
     645:	6a 02                	push   $0x2
     647:	e8 74 06 00 00       	call   cc0 <printf>
  exit(0);
     64c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     653:	e8 b0 04 00 00       	call   b08 <exit>
     658:	90                   	nop
     659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

int main() {

  //TTY INIT TESTS
  if(init_tests() < 0)
    exit(1);
     660:	83 ec 0c             	sub    $0xc,%esp
     663:	6a 01                	push   $0x1
     665:	e8 9e 04 00 00       	call   b08 <exit>
     66a:	66 90                	xchg   %ax,%ax
     66c:	66 90                	xchg   %ax,%ax
     66e:	66 90                	xchg   %ax,%ax

00000670 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	53                   	push   %ebx
     674:	8b 45 08             	mov    0x8(%ebp),%eax
     677:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     67a:	89 c2                	mov    %eax,%edx
     67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     680:	83 c1 01             	add    $0x1,%ecx
     683:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     687:	83 c2 01             	add    $0x1,%edx
     68a:	84 db                	test   %bl,%bl
     68c:	88 5a ff             	mov    %bl,-0x1(%edx)
     68f:	75 ef                	jne    680 <strcpy+0x10>
    ;
  return os;
}
     691:	5b                   	pop    %ebx
     692:	5d                   	pop    %ebp
     693:	c3                   	ret    
     694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     69a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	56                   	push   %esi
     6a4:	53                   	push   %ebx
     6a5:	8b 55 08             	mov    0x8(%ebp),%edx
     6a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     6ab:	0f b6 02             	movzbl (%edx),%eax
     6ae:	0f b6 19             	movzbl (%ecx),%ebx
     6b1:	84 c0                	test   %al,%al
     6b3:	75 1e                	jne    6d3 <strcmp+0x33>
     6b5:	eb 29                	jmp    6e0 <strcmp+0x40>
     6b7:	89 f6                	mov    %esi,%esi
     6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     6c0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     6c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     6c6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     6c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     6cd:	84 c0                	test   %al,%al
     6cf:	74 0f                	je     6e0 <strcmp+0x40>
     6d1:	89 f1                	mov    %esi,%ecx
     6d3:	38 d8                	cmp    %bl,%al
     6d5:	74 e9                	je     6c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     6d7:	29 d8                	sub    %ebx,%eax
}
     6d9:	5b                   	pop    %ebx
     6da:	5e                   	pop    %esi
     6db:	5d                   	pop    %ebp
     6dc:	c3                   	ret    
     6dd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     6e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     6e2:	29 d8                	sub    %ebx,%eax
}
     6e4:	5b                   	pop    %ebx
     6e5:	5e                   	pop    %esi
     6e6:	5d                   	pop    %ebp
     6e7:	c3                   	ret    
     6e8:	90                   	nop
     6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006f0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	57                   	push   %edi
     6f4:	56                   	push   %esi
     6f5:	8b 55 08             	mov    0x8(%ebp),%edx
     6f8:	53                   	push   %ebx
     6f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
     6fc:	0f b6 32             	movzbl (%edx),%esi
     6ff:	89 f0                	mov    %esi,%eax
     701:	84 c0                	test   %al,%al
     703:	74 67                	je     76c <strncmp+0x7c>
     705:	0f b6 19             	movzbl (%ecx),%ebx
     708:	89 f0                	mov    %esi,%eax
     70a:	38 d8                	cmp    %bl,%al
     70c:	75 65                	jne    773 <strncmp+0x83>
     70e:	8b 5d 10             	mov    0x10(%ebp),%ebx
     711:	89 f0                	mov    %esi,%eax
     713:	0f b6 f0             	movzbl %al,%esi
     716:	89 f0                	mov    %esi,%eax
     718:	83 eb 01             	sub    $0x1,%ebx
     71b:	75 14                	jne    731 <strncmp+0x41>
     71d:	eb 25                	jmp    744 <strncmp+0x54>
     71f:	90                   	nop
     720:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
     724:	89 f1                	mov    %esi,%ecx
     726:	38 c8                	cmp    %cl,%al
     728:	75 26                	jne    750 <strncmp+0x60>
     72a:	83 eb 01             	sub    $0x1,%ebx
     72d:	89 f9                	mov    %edi,%ecx
     72f:	74 2f                	je     760 <strncmp+0x70>
    p++, q++;
     731:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     734:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     737:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     73a:	84 c0                	test   %al,%al
     73c:	75 e2                	jne    720 <strncmp+0x30>
     73e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
     742:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     744:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     745:	29 f0                	sub    %esi,%eax
}
     747:	5e                   	pop    %esi
     748:	5f                   	pop    %edi
     749:	5d                   	pop    %ebp
     74a:	c3                   	ret    
     74b:	90                   	nop
     74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     750:	0f b6 f1             	movzbl %cl,%esi
     753:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     754:	29 f0                	sub    %esi,%eax
}
     756:	5e                   	pop    %esi
     757:	5f                   	pop    %edi
     758:	5d                   	pop    %ebp
     759:	c3                   	ret    
     75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     760:	0f b6 f0             	movzbl %al,%esi
     763:	89 f0                	mov    %esi,%eax
     765:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     766:	29 f0                	sub    %esi,%eax
}
     768:	5e                   	pop    %esi
     769:	5f                   	pop    %edi
     76a:	5d                   	pop    %ebp
     76b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     76c:	31 c0                	xor    %eax,%eax
     76e:	0f b6 31             	movzbl (%ecx),%esi
     771:	eb d1                	jmp    744 <strncmp+0x54>
     773:	0f b6 c0             	movzbl %al,%eax
     776:	0f b6 f3             	movzbl %bl,%esi
     779:	eb c9                	jmp    744 <strncmp+0x54>
     77b:	90                   	nop
     77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000780 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     786:	80 39 00             	cmpb   $0x0,(%ecx)
     789:	74 12                	je     79d <strlen+0x1d>
     78b:	31 d2                	xor    %edx,%edx
     78d:	8d 76 00             	lea    0x0(%esi),%esi
     790:	83 c2 01             	add    $0x1,%edx
     793:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     797:	89 d0                	mov    %edx,%eax
     799:	75 f5                	jne    790 <strlen+0x10>
    ;
  return n;
}
     79b:	5d                   	pop    %ebp
     79c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     79d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     79f:	5d                   	pop    %ebp
     7a0:	c3                   	ret    
     7a1:	eb 0d                	jmp    7b0 <memset>
     7a3:	90                   	nop
     7a4:	90                   	nop
     7a5:	90                   	nop
     7a6:	90                   	nop
     7a7:	90                   	nop
     7a8:	90                   	nop
     7a9:	90                   	nop
     7aa:	90                   	nop
     7ab:	90                   	nop
     7ac:	90                   	nop
     7ad:	90                   	nop
     7ae:	90                   	nop
     7af:	90                   	nop

000007b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	57                   	push   %edi
     7b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     7b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     7ba:	8b 45 0c             	mov    0xc(%ebp),%eax
     7bd:	89 d7                	mov    %edx,%edi
     7bf:	fc                   	cld    
     7c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     7c2:	89 d0                	mov    %edx,%eax
     7c4:	5f                   	pop    %edi
     7c5:	5d                   	pop    %ebp
     7c6:	c3                   	ret    
     7c7:	89 f6                	mov    %esi,%esi
     7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007d0 <strchr>:

char*
strchr(const char *s, char c)
{
     7d0:	55                   	push   %ebp
     7d1:	89 e5                	mov    %esp,%ebp
     7d3:	53                   	push   %ebx
     7d4:	8b 45 08             	mov    0x8(%ebp),%eax
     7d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     7da:	0f b6 10             	movzbl (%eax),%edx
     7dd:	84 d2                	test   %dl,%dl
     7df:	74 1d                	je     7fe <strchr+0x2e>
    if(*s == c)
     7e1:	38 d3                	cmp    %dl,%bl
     7e3:	89 d9                	mov    %ebx,%ecx
     7e5:	75 0d                	jne    7f4 <strchr+0x24>
     7e7:	eb 17                	jmp    800 <strchr+0x30>
     7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7f0:	38 ca                	cmp    %cl,%dl
     7f2:	74 0c                	je     800 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     7f4:	83 c0 01             	add    $0x1,%eax
     7f7:	0f b6 10             	movzbl (%eax),%edx
     7fa:	84 d2                	test   %dl,%dl
     7fc:	75 f2                	jne    7f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     7fe:	31 c0                	xor    %eax,%eax
}
     800:	5b                   	pop    %ebx
     801:	5d                   	pop    %ebp
     802:	c3                   	ret    
     803:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000810 <gets>:

char*
gets(char *buf, int max)
{
     810:	55                   	push   %ebp
     811:	89 e5                	mov    %esp,%ebp
     813:	57                   	push   %edi
     814:	56                   	push   %esi
     815:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     816:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     819:	31 db                	xor    %ebx,%ebx
     81b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     820:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     823:	3b 7d 0c             	cmp    0xc(%ebp),%edi
     826:	7d 30                	jge    858 <gets+0x48>
    cc = read(0, &c, 1);
     828:	83 ec 04             	sub    $0x4,%esp
     82b:	6a 01                	push   $0x1
     82d:	56                   	push   %esi
     82e:	6a 00                	push   $0x0
     830:	e8 eb 02 00 00       	call   b20 <read>
    if(cc < 1)
     835:	83 c4 10             	add    $0x10,%esp
     838:	85 c0                	test   %eax,%eax
     83a:	7e e7                	jle    823 <gets+0x13>
      continue;
    buf[i++] = c;
     83c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     840:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
     843:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
     845:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     848:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     84a:	74 0c                	je     858 <gets+0x48>
     84c:	3c 0d                	cmp    $0xd,%al
     84e:	74 08                	je     858 <gets+0x48>
     850:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     853:	3b 7d 0c             	cmp    0xc(%ebp),%edi
     856:	7c d0                	jl     828 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     858:	8b 45 08             	mov    0x8(%ebp),%eax
     85b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     85f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     862:	5b                   	pop    %ebx
     863:	5e                   	pop    %esi
     864:	5f                   	pop    %edi
     865:	5d                   	pop    %ebp
     866:	c3                   	ret    
     867:	89 f6                	mov    %esi,%esi
     869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000870 <stat>:

int
stat(const char *n, struct stat *st)
{
     870:	55                   	push   %ebp
     871:	89 e5                	mov    %esp,%ebp
     873:	56                   	push   %esi
     874:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     875:	83 ec 08             	sub    $0x8,%esp
     878:	6a 00                	push   $0x0
     87a:	ff 75 08             	pushl  0x8(%ebp)
     87d:	e8 c6 02 00 00       	call   b48 <open>
  if(fd < 0)
     882:	83 c4 10             	add    $0x10,%esp
     885:	85 c0                	test   %eax,%eax
     887:	78 27                	js     8b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     889:	83 ec 08             	sub    $0x8,%esp
     88c:	ff 75 0c             	pushl  0xc(%ebp)
     88f:	89 c3                	mov    %eax,%ebx
     891:	50                   	push   %eax
     892:	e8 c9 02 00 00       	call   b60 <fstat>
     897:	89 c6                	mov    %eax,%esi
  close(fd);
     899:	89 1c 24             	mov    %ebx,(%esp)
     89c:	e8 8f 02 00 00       	call   b30 <close>
  return r;
     8a1:	83 c4 10             	add    $0x10,%esp
     8a4:	89 f0                	mov    %esi,%eax
}
     8a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     8a9:	5b                   	pop    %ebx
     8aa:	5e                   	pop    %esi
     8ab:	5d                   	pop    %ebp
     8ac:	c3                   	ret    
     8ad:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     8b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     8b5:	eb ef                	jmp    8a6 <stat+0x36>
     8b7:	89 f6                	mov    %esi,%esi
     8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	53                   	push   %ebx
     8c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     8c7:	0f be 11             	movsbl (%ecx),%edx
     8ca:	8d 42 d0             	lea    -0x30(%edx),%eax
     8cd:	3c 09                	cmp    $0x9,%al
     8cf:	b8 00 00 00 00       	mov    $0x0,%eax
     8d4:	77 1f                	ja     8f5 <atoi+0x35>
     8d6:	8d 76 00             	lea    0x0(%esi),%esi
     8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     8e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     8e3:	83 c1 01             	add    $0x1,%ecx
     8e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     8ea:	0f be 11             	movsbl (%ecx),%edx
     8ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
     8f0:	80 fb 09             	cmp    $0x9,%bl
     8f3:	76 eb                	jbe    8e0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     8f5:	5b                   	pop    %ebx
     8f6:	5d                   	pop    %ebp
     8f7:	c3                   	ret    
     8f8:	90                   	nop
     8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	56                   	push   %esi
     904:	53                   	push   %ebx
     905:	8b 5d 10             	mov    0x10(%ebp),%ebx
     908:	8b 45 08             	mov    0x8(%ebp),%eax
     90b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     90e:	85 db                	test   %ebx,%ebx
     910:	7e 14                	jle    926 <memmove+0x26>
     912:	31 d2                	xor    %edx,%edx
     914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     918:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     91c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     91f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     922:	39 da                	cmp    %ebx,%edx
     924:	75 f2                	jne    918 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     926:	5b                   	pop    %ebx
     927:	5e                   	pop    %esi
     928:	5d                   	pop    %ebp
     929:	c3                   	ret    
     92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000930 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
     930:	55                   	push   %ebp
     931:	89 e5                	mov    %esp,%ebp
     933:	57                   	push   %edi
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	83 ec 04             	sub    $0x4,%esp
     939:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
     93c:	83 f9 00             	cmp    $0x0,%ecx
     93f:	7e 76                	jle    9b7 <itoa+0x87>
     941:	89 cb                	mov    %ecx,%ebx
     943:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
     945:	bf 67 66 66 66       	mov    $0x66666667,%edi
     94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     950:	89 d8                	mov    %ebx,%eax
     952:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
     955:	83 c6 01             	add    $0x1,%esi
        i /= 10;
     958:	f7 ef                	imul   %edi
     95a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
     95d:	29 da                	sub    %ebx,%edx
     95f:	89 d3                	mov    %edx,%ebx
     961:	75 ed                	jne    950 <itoa+0x20>
        length++;
     963:	89 f3                	mov    %esi,%ebx
     965:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
     968:	bf 67 66 66 66       	mov    $0x66666667,%edi
     96d:	8b 75 08             	mov    0x8(%ebp),%esi
     970:	eb 0a                	jmp    97c <itoa+0x4c>
     972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
     978:	85 db                	test   %ebx,%ebx
     97a:	7e 25                	jle    9a1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
     97c:	89 c8                	mov    %ecx,%eax
     97e:	f7 ef                	imul   %edi
     980:	89 c8                	mov    %ecx,%eax
     982:	c1 f8 1f             	sar    $0x1f,%eax
     985:	c1 fa 02             	sar    $0x2,%edx
     988:	29 c2                	sub    %eax,%edx
     98a:	8d 04 92             	lea    (%edx,%edx,4),%eax
     98d:	01 c0                	add    %eax,%eax
     98f:	29 c1                	sub    %eax,%ecx
     991:	83 c1 30             	add    $0x30,%ecx
     994:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
     998:	83 eb 01             	sub    $0x1,%ebx
     99b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
     99d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
     99f:	7f d7                	jg     978 <itoa+0x48>
     9a1:	8b 75 f0             	mov    -0x10(%ebp),%esi
     9a4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
     9a6:	8b 7d 08             	mov    0x8(%ebp),%edi
     9a9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
     9ad:	83 c4 04             	add    $0x4,%esp
     9b0:	89 f0                	mov    %esi,%eax
     9b2:	5b                   	pop    %ebx
     9b3:	5e                   	pop    %esi
     9b4:	5f                   	pop    %edi
     9b5:	5d                   	pop    %ebp
     9b6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
     9b7:	75 12                	jne    9cb <itoa+0x9b>
        buf[0] = '0';
     9b9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
     9bc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
     9c1:	c6 00 30             	movb   $0x30,(%eax)
     9c4:	b8 01 00 00 00       	mov    $0x1,%eax
     9c9:	eb db                	jmp    9a6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
     9cb:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
     9cd:	31 f6                	xor    %esi,%esi
     9cf:	eb d5                	jmp    9a6 <itoa+0x76>
     9d1:	eb 0d                	jmp    9e0 <strcat>
     9d3:	90                   	nop
     9d4:	90                   	nop
     9d5:	90                   	nop
     9d6:	90                   	nop
     9d7:	90                   	nop
     9d8:	90                   	nop
     9d9:	90                   	nop
     9da:	90                   	nop
     9db:	90                   	nop
     9dc:	90                   	nop
     9dd:	90                   	nop
     9de:	90                   	nop
     9df:	90                   	nop

000009e0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
     9e0:	55                   	push   %ebp
     9e1:	89 e5                	mov    %esp,%ebp
     9e3:	57                   	push   %edi
     9e4:	56                   	push   %esi
     9e5:	8b 45 08             	mov    0x8(%ebp),%eax
     9e8:	53                   	push   %ebx
     9e9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
     9ec:	80 38 00             	cmpb   $0x0,(%eax)
     9ef:	74 38                	je     a29 <strcat+0x49>
     9f1:	31 c9                	xor    %ecx,%ecx
     9f3:	90                   	nop
     9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9f8:	83 c1 01             	add    $0x1,%ecx
     9fb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
     9ff:	89 ca                	mov    %ecx,%edx
     a01:	75 f5                	jne    9f8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
     a03:	0f b6 1e             	movzbl (%esi),%ebx
     a06:	84 db                	test   %bl,%bl
     a08:	74 16                	je     a20 <strcat+0x40>
     a0a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
     a0d:	31 d2                	xor    %edx,%edx
     a0f:	90                   	nop
                dest[i + j] = source[j];
     a10:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
     a13:	83 c2 01             	add    $0x1,%edx
     a16:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
     a1a:	84 db                	test   %bl,%bl
     a1c:	75 f2                	jne    a10 <strcat+0x30>
     a1e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
     a20:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
     a24:	5b                   	pop    %ebx
     a25:	5e                   	pop    %esi
     a26:	5f                   	pop    %edi
     a27:	5d                   	pop    %ebp
     a28:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
     a29:	31 d2                	xor    %edx,%edx
     a2b:	31 c9                	xor    %ecx,%ecx
     a2d:	eb d4                	jmp    a03 <strcat+0x23>
     a2f:	90                   	nop

00000a30 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	57                   	push   %edi
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     a39:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
     a3c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     a3f:	0f b6 00             	movzbl (%eax),%eax
     a42:	84 c0                	test   %al,%al
     a44:	88 45 f3             	mov    %al,-0xd(%ebp)
     a47:	0f 84 a0 00 00 00    	je     aed <strstr+0xbd>
     a4d:	8b 55 0c             	mov    0xc(%ebp),%edx
     a50:	31 c0                	xor    %eax,%eax
     a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a58:	83 c0 01             	add    $0x1,%eax
     a5b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     a5f:	75 f7                	jne    a58 <strstr+0x28>
     a61:	89 45 e8             	mov    %eax,-0x18(%ebp)
     a64:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a67:	0f b6 07             	movzbl (%edi),%eax
     a6a:	84 c0                	test   %al,%al
     a6c:	74 68                	je     ad6 <strstr+0xa6>
     a6e:	31 d2                	xor    %edx,%edx
     a70:	83 c2 01             	add    $0x1,%edx
     a73:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
     a77:	75 f7                	jne    a70 <strstr+0x40>
     a79:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     a7c:	84 c0                	test   %al,%al
     a7e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
     a81:	74 4d                	je     ad0 <strstr+0xa0>
     a83:	90                   	nop
     a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a88:	38 45 f3             	cmp    %al,-0xd(%ebp)
     a8b:	75 34                	jne    ac1 <strstr+0x91>
     a8d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
     a90:	83 eb 01             	sub    $0x1,%ebx
     a93:	74 4b                	je     ae0 <strstr+0xb0>
     a95:	8b 55 0c             	mov    0xc(%ebp),%edx
     a98:	89 f8                	mov    %edi,%eax
     a9a:	eb 10                	jmp    aac <strstr+0x7c>
     a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     aa0:	3a 4a 01             	cmp    0x1(%edx),%cl
     aa3:	75 1c                	jne    ac1 <strstr+0x91>
     aa5:	83 eb 01             	sub    $0x1,%ebx
     aa8:	89 f2                	mov    %esi,%edx
     aaa:	74 34                	je     ae0 <strstr+0xb0>
    p++, q++;
     aac:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     aaf:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
     ab2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     ab5:	84 c9                	test   %cl,%cl
     ab7:	75 e7                	jne    aa0 <strstr+0x70>
     ab9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
     abd:	84 c0                	test   %al,%al
     abf:	74 1f                	je     ae0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
     ac1:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
     ac4:	3b 7d ec             	cmp    -0x14(%ebp),%edi
     ac7:	74 0d                	je     ad6 <strstr+0xa6>
     ac9:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     acc:	84 c0                	test   %al,%al
     ace:	75 b8                	jne    a88 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     ad0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
     ad4:	eb e7                	jmp    abd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
     ad6:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
     ad9:	31 c0                	xor    %eax,%eax
}
     adb:	5b                   	pop    %ebx
     adc:	5e                   	pop    %esi
     add:	5f                   	pop    %edi
     ade:	5d                   	pop    %ebp
     adf:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
     ae0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
     ae3:	83 c4 10             	add    $0x10,%esp
     ae6:	5b                   	pop    %ebx
     ae7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
     ae8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
     aea:	5f                   	pop    %edi
     aeb:	5d                   	pop    %ebp
     aec:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     aed:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     af4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     afb:	e9 67 ff ff ff       	jmp    a67 <strstr+0x37>

00000b00 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     b00:	b8 01 00 00 00       	mov    $0x1,%eax
     b05:	cd 40                	int    $0x40
     b07:	c3                   	ret    

00000b08 <exit>:
SYSCALL(exit)
     b08:	b8 02 00 00 00       	mov    $0x2,%eax
     b0d:	cd 40                	int    $0x40
     b0f:	c3                   	ret    

00000b10 <wait>:
SYSCALL(wait)
     b10:	b8 03 00 00 00       	mov    $0x3,%eax
     b15:	cd 40                	int    $0x40
     b17:	c3                   	ret    

00000b18 <pipe>:
SYSCALL(pipe)
     b18:	b8 04 00 00 00       	mov    $0x4,%eax
     b1d:	cd 40                	int    $0x40
     b1f:	c3                   	ret    

00000b20 <read>:
SYSCALL(read)
     b20:	b8 05 00 00 00       	mov    $0x5,%eax
     b25:	cd 40                	int    $0x40
     b27:	c3                   	ret    

00000b28 <write>:
SYSCALL(write)
     b28:	b8 10 00 00 00       	mov    $0x10,%eax
     b2d:	cd 40                	int    $0x40
     b2f:	c3                   	ret    

00000b30 <close>:
SYSCALL(close)
     b30:	b8 15 00 00 00       	mov    $0x15,%eax
     b35:	cd 40                	int    $0x40
     b37:	c3                   	ret    

00000b38 <kill>:
SYSCALL(kill)
     b38:	b8 06 00 00 00       	mov    $0x6,%eax
     b3d:	cd 40                	int    $0x40
     b3f:	c3                   	ret    

00000b40 <exec>:
SYSCALL(exec)
     b40:	b8 07 00 00 00       	mov    $0x7,%eax
     b45:	cd 40                	int    $0x40
     b47:	c3                   	ret    

00000b48 <open>:
SYSCALL(open)
     b48:	b8 0f 00 00 00       	mov    $0xf,%eax
     b4d:	cd 40                	int    $0x40
     b4f:	c3                   	ret    

00000b50 <mknod>:
SYSCALL(mknod)
     b50:	b8 11 00 00 00       	mov    $0x11,%eax
     b55:	cd 40                	int    $0x40
     b57:	c3                   	ret    

00000b58 <unlink>:
SYSCALL(unlink)
     b58:	b8 12 00 00 00       	mov    $0x12,%eax
     b5d:	cd 40                	int    $0x40
     b5f:	c3                   	ret    

00000b60 <fstat>:
SYSCALL(fstat)
     b60:	b8 08 00 00 00       	mov    $0x8,%eax
     b65:	cd 40                	int    $0x40
     b67:	c3                   	ret    

00000b68 <link>:
SYSCALL(link)
     b68:	b8 13 00 00 00       	mov    $0x13,%eax
     b6d:	cd 40                	int    $0x40
     b6f:	c3                   	ret    

00000b70 <mkdir>:
SYSCALL(mkdir)
     b70:	b8 14 00 00 00       	mov    $0x14,%eax
     b75:	cd 40                	int    $0x40
     b77:	c3                   	ret    

00000b78 <chdir>:
SYSCALL(chdir)
     b78:	b8 09 00 00 00       	mov    $0x9,%eax
     b7d:	cd 40                	int    $0x40
     b7f:	c3                   	ret    

00000b80 <dup>:
SYSCALL(dup)
     b80:	b8 0a 00 00 00       	mov    $0xa,%eax
     b85:	cd 40                	int    $0x40
     b87:	c3                   	ret    

00000b88 <getpid>:
SYSCALL(getpid)
     b88:	b8 0b 00 00 00       	mov    $0xb,%eax
     b8d:	cd 40                	int    $0x40
     b8f:	c3                   	ret    

00000b90 <sbrk>:
SYSCALL(sbrk)
     b90:	b8 0c 00 00 00       	mov    $0xc,%eax
     b95:	cd 40                	int    $0x40
     b97:	c3                   	ret    

00000b98 <sleep>:
SYSCALL(sleep)
     b98:	b8 0d 00 00 00       	mov    $0xd,%eax
     b9d:	cd 40                	int    $0x40
     b9f:	c3                   	ret    

00000ba0 <uptime>:
SYSCALL(uptime)
     ba0:	b8 0e 00 00 00       	mov    $0xe,%eax
     ba5:	cd 40                	int    $0x40
     ba7:	c3                   	ret    

00000ba8 <mount>:
SYSCALL(mount)
     ba8:	b8 16 00 00 00       	mov    $0x16,%eax
     bad:	cd 40                	int    $0x40
     baf:	c3                   	ret    

00000bb0 <umount>:
SYSCALL(umount)
     bb0:	b8 17 00 00 00       	mov    $0x17,%eax
     bb5:	cd 40                	int    $0x40
     bb7:	c3                   	ret    

00000bb8 <printmounts>:
SYSCALL(printmounts)
     bb8:	b8 18 00 00 00       	mov    $0x18,%eax
     bbd:	cd 40                	int    $0x40
     bbf:	c3                   	ret    

00000bc0 <printdevices>:
SYSCALL(printdevices)
     bc0:	b8 19 00 00 00       	mov    $0x19,%eax
     bc5:	cd 40                	int    $0x40
     bc7:	c3                   	ret    

00000bc8 <unshare>:
SYSCALL(unshare)
     bc8:	b8 1a 00 00 00       	mov    $0x1a,%eax
     bcd:	cd 40                	int    $0x40
     bcf:	c3                   	ret    

00000bd0 <usleep>:
SYSCALL(usleep)
     bd0:	b8 1b 00 00 00       	mov    $0x1b,%eax
     bd5:	cd 40                	int    $0x40
     bd7:	c3                   	ret    

00000bd8 <ioctl>:
SYSCALL(ioctl)
     bd8:	b8 1c 00 00 00       	mov    $0x1c,%eax
     bdd:	cd 40                	int    $0x40
     bdf:	c3                   	ret    

00000be0 <getppid>:
SYSCALL(getppid)
     be0:	b8 1d 00 00 00       	mov    $0x1d,%eax
     be5:	cd 40                	int    $0x40
     be7:	c3                   	ret    

00000be8 <getcpu>:
SYSCALL(getcpu)
     be8:	b8 1e 00 00 00       	mov    $0x1e,%eax
     bed:	cd 40                	int    $0x40
     bef:	c3                   	ret    

00000bf0 <getmem>:
SYSCALL(getmem)
     bf0:	b8 1f 00 00 00       	mov    $0x1f,%eax
     bf5:	cd 40                	int    $0x40
     bf7:	c3                   	ret    

00000bf8 <kmemtest>:
SYSCALL(kmemtest)
     bf8:	b8 20 00 00 00       	mov    $0x20,%eax
     bfd:	cd 40                	int    $0x40
     bff:	c3                   	ret    

00000c00 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	57                   	push   %edi
     c04:	56                   	push   %esi
     c05:	53                   	push   %ebx
     c06:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     c09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
     c0c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     c0f:	85 db                	test   %ebx,%ebx
     c11:	0f 84 91 00 00 00    	je     ca8 <printint+0xa8>
     c17:	89 d0                	mov    %edx,%eax
     c19:	c1 e8 1f             	shr    $0x1f,%eax
     c1c:	84 c0                	test   %al,%al
     c1e:	0f 84 84 00 00 00    	je     ca8 <printint+0xa8>
    neg = 1;
    x = -xx;
     c24:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     c26:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     c2d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
     c2f:	31 ff                	xor    %edi,%edi
     c31:	8d 75 c7             	lea    -0x39(%ebp),%esi
     c34:	eb 0c                	jmp    c42 <printint+0x42>
     c36:	8d 76 00             	lea    0x0(%esi),%esi
     c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
     c40:	89 df                	mov    %ebx,%edi
     c42:	31 d2                	xor    %edx,%edx
     c44:	8d 5f 01             	lea    0x1(%edi),%ebx
     c47:	f7 f1                	div    %ecx
     c49:	0f b6 92 8c 14 00 00 	movzbl 0x148c(%edx),%edx
  }while((x /= base) != 0);
     c50:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     c52:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     c55:	75 e9                	jne    c40 <printint+0x40>
  if(neg)
     c57:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     c5a:	85 c0                	test   %eax,%eax
     c5c:	74 08                	je     c66 <printint+0x66>
    buf[i++] = '-';
     c5e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
     c63:	8d 5f 02             	lea    0x2(%edi),%ebx
     c66:	8d 7d d8             	lea    -0x28(%ebp),%edi
     c69:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
     c6d:	89 fa                	mov    %edi,%edx
     c6f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
     c70:	0f b6 08             	movzbl (%eax),%ecx
     c73:	83 e8 01             	sub    $0x1,%eax
     c76:	83 c2 01             	add    $0x1,%edx
     c79:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
     c7c:	39 f0                	cmp    %esi,%eax
     c7e:	75 f0                	jne    c70 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
     c80:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
     c83:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
     c88:	57                   	push   %edi
     c89:	e8 f2 fa ff ff       	call   780 <strlen>
     c8e:	83 c4 0c             	add    $0xc,%esp
     c91:	50                   	push   %eax
     c92:	57                   	push   %edi
     c93:	ff 75 c0             	pushl  -0x40(%ebp)
     c96:	e8 8d fe ff ff       	call   b28 <write>
}
     c9b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c9e:	5b                   	pop    %ebx
     c9f:	5e                   	pop    %esi
     ca0:	5f                   	pop    %edi
     ca1:	5d                   	pop    %ebp
     ca2:	c3                   	ret    
     ca3:	90                   	nop
     ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     ca8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     caa:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     cb1:	e9 79 ff ff ff       	jmp    c2f <printint+0x2f>
     cb6:	8d 76 00             	lea    0x0(%esi),%esi
     cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cc0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	57                   	push   %edi
     cc4:	56                   	push   %esi
     cc5:	53                   	push   %ebx
     cc6:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     cc9:	8b 75 0c             	mov    0xc(%ebp),%esi
     ccc:	0f b6 06             	movzbl (%esi),%eax
     ccf:	84 c0                	test   %al,%al
     cd1:	0f 84 90 01 00 00    	je     e67 <printf+0x1a7>
     cd7:	8d 5d 10             	lea    0x10(%ebp),%ebx
     cda:	31 ff                	xor    %edi,%edi
     cdc:	31 d2                	xor    %edx,%edx
     cde:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     ce1:	31 db                	xor    %ebx,%ebx
     ce3:	eb 39                	jmp    d1e <printf+0x5e>
     ce5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     ce8:	83 f9 25             	cmp    $0x25,%ecx
     ceb:	0f 84 af 00 00 00    	je     da0 <printf+0xe0>
     cf1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
     cf4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     cf7:	83 ec 04             	sub    $0x4,%esp
     cfa:	6a 01                	push   $0x1
     cfc:	50                   	push   %eax
     cfd:	ff 75 08             	pushl  0x8(%ebp)
     d00:	e8 23 fe ff ff       	call   b28 <write>
     d05:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
     d08:	85 c0                	test   %eax,%eax
     d0a:	78 35                	js     d41 <printf+0x81>
     d0c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     d0f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
     d12:	01 c7                	add    %eax,%edi
     d14:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     d16:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
     d1a:	84 c0                	test   %al,%al
     d1c:	74 21                	je     d3f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
     d1e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
     d21:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
     d23:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     d26:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
     d29:	74 bd                	je     ce8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
     d2b:	83 fa 25             	cmp    $0x25,%edx
     d2e:	74 20                	je     d50 <printf+0x90>
     d30:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     d32:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
     d35:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     d37:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
     d3b:	84 c0                	test   %al,%al
     d3d:	75 df                	jne    d1e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
     d3f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
     d41:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d44:	5b                   	pop    %ebx
     d45:	5e                   	pop    %esi
     d46:	5f                   	pop    %edi
     d47:	5d                   	pop    %ebp
     d48:	c3                   	ret    
     d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
     d50:	83 f9 64             	cmp    $0x64,%ecx
     d53:	0f 84 7f 00 00 00    	je     dd8 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     d59:	0f be d0             	movsbl %al,%edx
     d5c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
     d62:	83 fa 70             	cmp    $0x70,%edx
     d65:	74 49                	je     db0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     d67:	83 f9 73             	cmp    $0x73,%ecx
     d6a:	0f 84 98 00 00 00    	je     e08 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
     d70:	83 f9 63             	cmp    $0x63,%ecx
     d73:	0f 84 c7 00 00 00    	je     e40 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     d79:	83 f9 25             	cmp    $0x25,%ecx
     d7c:	74 6a                	je     de8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
     d7e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
     d81:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     d84:	83 ec 04             	sub    $0x4,%esp
     d87:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
     d89:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
     d8d:	50                   	push   %eax
     d8e:	ff 75 08             	pushl  0x8(%ebp)
     d91:	e8 92 fd ff ff       	call   b28 <write>
     d96:	83 c4 10             	add    $0x10,%esp
     d99:	e9 6a ff ff ff       	jmp    d08 <printf+0x48>
     d9e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     da0:	ba 25 00 00 00       	mov    $0x25,%edx
     da5:	31 c0                	xor    %eax,%eax
     da7:	eb 89                	jmp    d32 <printf+0x72>
     da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
     db0:	83 ec 0c             	sub    $0xc,%esp
     db3:	b9 10 00 00 00       	mov    $0x10,%ecx
     db8:	6a 00                	push   $0x0
     dba:	8b 75 d0             	mov    -0x30(%ebp),%esi
     dbd:	8b 45 08             	mov    0x8(%ebp),%eax
     dc0:	8b 16                	mov    (%esi),%edx
        ap++;
     dc2:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
     dc5:	e8 36 fe ff ff       	call   c00 <printint>
        ap++;
     dca:	89 75 d0             	mov    %esi,-0x30(%ebp)
     dcd:	83 c4 10             	add    $0x10,%esp
     dd0:	e9 33 ff ff ff       	jmp    d08 <printf+0x48>
     dd5:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
     dd8:	83 ec 0c             	sub    $0xc,%esp
     ddb:	b9 0a 00 00 00       	mov    $0xa,%ecx
     de0:	6a 01                	push   $0x1
     de2:	eb d6                	jmp    dba <printf+0xfa>
     de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     de8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
     deb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     dee:	83 ec 04             	sub    $0x4,%esp
     df1:	6a 01                	push   $0x1
     df3:	50                   	push   %eax
     df4:	ff 75 08             	pushl  0x8(%ebp)
     df7:	e8 2c fd ff ff       	call   b28 <write>
     dfc:	83 c4 10             	add    $0x10,%esp
     dff:	e9 04 ff ff ff       	jmp    d08 <printf+0x48>
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
     e08:	8b 45 d0             	mov    -0x30(%ebp),%eax
     e0b:	8b 30                	mov    (%eax),%esi
        ap++;
     e0d:	83 c0 04             	add    $0x4,%eax
     e10:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
     e13:	b8 84 14 00 00       	mov    $0x1484,%eax
     e18:	85 f6                	test   %esi,%esi
     e1a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
     e1d:	83 ec 0c             	sub    $0xc,%esp
     e20:	56                   	push   %esi
     e21:	e8 5a f9 ff ff       	call   780 <strlen>
     e26:	83 c4 0c             	add    $0xc,%esp
     e29:	50                   	push   %eax
     e2a:	56                   	push   %esi
     e2b:	ff 75 08             	pushl  0x8(%ebp)
     e2e:	e8 f5 fc ff ff       	call   b28 <write>
     e33:	83 c4 10             	add    $0x10,%esp
     e36:	e9 cd fe ff ff       	jmp    d08 <printf+0x48>
     e3b:	90                   	nop
     e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e40:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
     e43:	83 ec 04             	sub    $0x4,%esp
     e46:	8b 06                	mov    (%esi),%eax
     e48:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
     e4a:	83 c6 04             	add    $0x4,%esi
     e4d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
     e50:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     e53:	50                   	push   %eax
     e54:	ff 75 08             	pushl  0x8(%ebp)
     e57:	e8 cc fc ff ff       	call   b28 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
     e5c:	89 75 d0             	mov    %esi,-0x30(%ebp)
     e5f:	83 c4 10             	add    $0x10,%esp
     e62:	e9 a1 fe ff ff       	jmp    d08 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
     e67:	31 c0                	xor    %eax,%eax
     e69:	e9 d3 fe ff ff       	jmp    d41 <printf+0x81>
     e6e:	66 90                	xchg   %ax,%ax

00000e70 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e70:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e71:	a1 00 30 00 00       	mov    0x3000,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     e76:	89 e5                	mov    %esp,%ebp
     e78:	57                   	push   %edi
     e79:	56                   	push   %esi
     e7a:	53                   	push   %ebx
     e7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e7e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e80:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e83:	39 c8                	cmp    %ecx,%eax
     e85:	73 19                	jae    ea0 <free+0x30>
     e87:	89 f6                	mov    %esi,%esi
     e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     e90:	39 d1                	cmp    %edx,%ecx
     e92:	72 1c                	jb     eb0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e94:	39 d0                	cmp    %edx,%eax
     e96:	73 18                	jae    eb0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     e98:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e9a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e9c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e9e:	72 f0                	jb     e90 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ea0:	39 d0                	cmp    %edx,%eax
     ea2:	72 f4                	jb     e98 <free+0x28>
     ea4:	39 d1                	cmp    %edx,%ecx
     ea6:	73 f0                	jae    e98 <free+0x28>
     ea8:	90                   	nop
     ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     eb0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     eb3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     eb6:	39 d7                	cmp    %edx,%edi
     eb8:	74 19                	je     ed3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     eba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     ebd:	8b 50 04             	mov    0x4(%eax),%edx
     ec0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     ec3:	39 f1                	cmp    %esi,%ecx
     ec5:	74 23                	je     eea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     ec7:	89 08                	mov    %ecx,(%eax)
  freep = p;
     ec9:	a3 00 30 00 00       	mov    %eax,0x3000
}
     ece:	5b                   	pop    %ebx
     ecf:	5e                   	pop    %esi
     ed0:	5f                   	pop    %edi
     ed1:	5d                   	pop    %ebp
     ed2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     ed3:	03 72 04             	add    0x4(%edx),%esi
     ed6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     ed9:	8b 10                	mov    (%eax),%edx
     edb:	8b 12                	mov    (%edx),%edx
     edd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     ee0:	8b 50 04             	mov    0x4(%eax),%edx
     ee3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     ee6:	39 f1                	cmp    %esi,%ecx
     ee8:	75 dd                	jne    ec7 <free+0x57>
    p->s.size += bp->s.size;
     eea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     eed:	a3 00 30 00 00       	mov    %eax,0x3000
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     ef2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     ef5:	8b 53 f8             	mov    -0x8(%ebx),%edx
     ef8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     efa:	5b                   	pop    %ebx
     efb:	5e                   	pop    %esi
     efc:	5f                   	pop    %edi
     efd:	5d                   	pop    %ebp
     efe:	c3                   	ret    
     eff:	90                   	nop

00000f00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	57                   	push   %edi
     f04:	56                   	push   %esi
     f05:	53                   	push   %ebx
     f06:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     f0c:	8b 15 00 30 00 00    	mov    0x3000,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f12:	8d 78 07             	lea    0x7(%eax),%edi
     f15:	c1 ef 03             	shr    $0x3,%edi
     f18:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     f1b:	85 d2                	test   %edx,%edx
     f1d:	0f 84 a3 00 00 00    	je     fc6 <malloc+0xc6>
     f23:	8b 02                	mov    (%edx),%eax
     f25:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     f28:	39 cf                	cmp    %ecx,%edi
     f2a:	76 74                	jbe    fa0 <malloc+0xa0>
     f2c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     f32:	be 00 10 00 00       	mov    $0x1000,%esi
     f37:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     f3e:	0f 43 f7             	cmovae %edi,%esi
     f41:	ba 00 80 00 00       	mov    $0x8000,%edx
     f46:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     f4c:	0f 46 da             	cmovbe %edx,%ebx
     f4f:	eb 10                	jmp    f61 <malloc+0x61>
     f51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     f5a:	8b 48 04             	mov    0x4(%eax),%ecx
     f5d:	39 cf                	cmp    %ecx,%edi
     f5f:	76 3f                	jbe    fa0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     f61:	39 05 00 30 00 00    	cmp    %eax,0x3000
     f67:	89 c2                	mov    %eax,%edx
     f69:	75 ed                	jne    f58 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     f6b:	83 ec 0c             	sub    $0xc,%esp
     f6e:	53                   	push   %ebx
     f6f:	e8 1c fc ff ff       	call   b90 <sbrk>
  if(p == (char*)-1)
     f74:	83 c4 10             	add    $0x10,%esp
     f77:	83 f8 ff             	cmp    $0xffffffff,%eax
     f7a:	74 1c                	je     f98 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     f7c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     f7f:	83 ec 0c             	sub    $0xc,%esp
     f82:	83 c0 08             	add    $0x8,%eax
     f85:	50                   	push   %eax
     f86:	e8 e5 fe ff ff       	call   e70 <free>
  return freep;
     f8b:	8b 15 00 30 00 00    	mov    0x3000,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     f91:	83 c4 10             	add    $0x10,%esp
     f94:	85 d2                	test   %edx,%edx
     f96:	75 c0                	jne    f58 <malloc+0x58>
        return 0;
     f98:	31 c0                	xor    %eax,%eax
     f9a:	eb 1c                	jmp    fb8 <malloc+0xb8>
     f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     fa0:	39 cf                	cmp    %ecx,%edi
     fa2:	74 1c                	je     fc0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     fa4:	29 f9                	sub    %edi,%ecx
     fa6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     fa9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     fac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     faf:	89 15 00 30 00 00    	mov    %edx,0x3000
      return (void*)(p + 1);
     fb5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     fb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fbb:	5b                   	pop    %ebx
     fbc:	5e                   	pop    %esi
     fbd:	5f                   	pop    %edi
     fbe:	5d                   	pop    %ebp
     fbf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     fc0:	8b 08                	mov    (%eax),%ecx
     fc2:	89 0a                	mov    %ecx,(%edx)
     fc4:	eb e9                	jmp    faf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     fc6:	c7 05 00 30 00 00 04 	movl   $0x3004,0x3000
     fcd:	30 00 00 
     fd0:	c7 05 04 30 00 00 04 	movl   $0x3004,0x3004
     fd7:	30 00 00 
    base.s.size = 0;
     fda:	b8 04 30 00 00       	mov    $0x3004,%eax
     fdf:	c7 05 08 30 00 00 00 	movl   $0x0,0x3008
     fe6:	00 00 00 
     fe9:	e9 3e ff ff ff       	jmp    f2c <malloc+0x2c>
     fee:	66 90                	xchg   %ax,%ax

00000ff0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
     ff6:	6a 10                	push   $0x10
     ff8:	6a 02                	push   $0x2
     ffa:	ff 75 08             	pushl  0x8(%ebp)
     ffd:	e8 d6 fb ff ff       	call   bd8 <ioctl>
}
    1002:	c9                   	leave  
    1003:	c3                   	ret    
    1004:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    100a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001010 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
    1016:	68 00 10 00 00       	push   $0x1000
    101b:	6a 02                	push   $0x2
    101d:	ff 75 08             	pushl  0x8(%ebp)
    1020:	e8 b3 fb ff ff       	call   bd8 <ioctl>
}
    1025:	c9                   	leave  
    1026:	c3                   	ret    
    1027:	89 f6                	mov    %esi,%esi
    1029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001030 <attach_tty>:

int
attach_tty(int tty_fd)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	53                   	push   %ebx
    1034:	83 ec 08             	sub    $0x8,%esp
    1037:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
    103a:	6a 10                	push   $0x10
    103c:	6a 01                	push   $0x1
    103e:	53                   	push   %ebx
    103f:	e8 94 fb ff ff       	call   bd8 <ioctl>
    1044:	83 c4 10             	add    $0x10,%esp
    1047:	85 c0                	test   %eax,%eax
    1049:	78 55                	js     10a0 <attach_tty+0x70>
     return -1;

    close(0);
    104b:	83 ec 0c             	sub    $0xc,%esp
    104e:	6a 00                	push   $0x0
    1050:	e8 db fa ff ff       	call   b30 <close>
    close(1);
    1055:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    105c:	e8 cf fa ff ff       	call   b30 <close>
    close(2);
    1061:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1068:	e8 c3 fa ff ff       	call   b30 <close>
    if(dup(tty_fd) < 0)
    106d:	89 1c 24             	mov    %ebx,(%esp)
    1070:	e8 0b fb ff ff       	call   b80 <dup>
    1075:	83 c4 10             	add    $0x10,%esp
    1078:	85 c0                	test   %eax,%eax
    107a:	78 24                	js     10a0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    107c:	83 ec 0c             	sub    $0xc,%esp
    107f:	53                   	push   %ebx
    1080:	e8 fb fa ff ff       	call   b80 <dup>
    1085:	83 c4 10             	add    $0x10,%esp
    1088:	85 c0                	test   %eax,%eax
    108a:	78 14                	js     10a0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    108c:	83 ec 0c             	sub    $0xc,%esp
    108f:	53                   	push   %ebx
    1090:	e8 eb fa ff ff       	call   b80 <dup>
    1095:	83 c4 10             	add    $0x10,%esp
    1098:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
    109b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    109e:	c9                   	leave  
    109f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
    10a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
    10a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10a8:	c9                   	leave  
    10a9:	c3                   	ret    
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010b0 <detach_tty>:

int
detach_tty(int tty_fd)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
    10b6:	6a 20                	push   $0x20
    10b8:	6a 01                	push   $0x1
    10ba:	ff 75 08             	pushl  0x8(%ebp)
    10bd:	e8 16 fb ff ff       	call   bd8 <ioctl>
    return 0;
}
    10c2:	31 c0                	xor    %eax,%eax
    10c4:	c9                   	leave  
    10c5:	c3                   	ret    
    10c6:	8d 76 00             	lea    0x0(%esi),%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010d0 <connect_tty>:


int
connect_tty(int tty_fd)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	83 ec 08             	sub    $0x8,%esp
    10d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    10da:	6a 10                	push   $0x10
    10dc:	6a 02                	push   $0x2
    10de:	53                   	push   %ebx
    10df:	e8 f4 fa ff ff       	call   bd8 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
    10e4:	83 c4 10             	add    $0x10,%esp
    10e7:	85 c0                	test   %eax,%eax
    10e9:	74 1d                	je     1108 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
    10eb:	83 ec 04             	sub    $0x4,%esp
    10ee:	68 00 10 00 00       	push   $0x1000
    10f3:	6a 01                	push   $0x1
    10f5:	53                   	push   %ebx
    10f6:	e8 dd fa ff ff       	call   bd8 <ioctl>
     return tty_fd;
    10fb:	83 c4 10             	add    $0x10,%esp
    10fe:	89 d8                	mov    %ebx,%eax
}
    1100:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1103:	c9                   	leave  
    1104:	c3                   	ret    
    1105:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
    1108:	83 ec 0c             	sub    $0xc,%esp
    110b:	53                   	push   %ebx
    110c:	e8 1f fa ff ff       	call   b30 <close>
       return -1;
    1111:	83 c4 10             	add    $0x10,%esp
    1114:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1119:	eb e5                	jmp    1100 <connect_tty+0x30>
    111b:	90                   	nop
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001120 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
    1126:	68 00 20 00 00       	push   $0x2000
    112b:	6a 01                	push   $0x1
    112d:	ff 75 08             	pushl  0x8(%ebp)
    1130:	e8 a3 fa ff ff       	call   bd8 <ioctl>
}
    1135:	c9                   	leave  
    1136:	c3                   	ret    
