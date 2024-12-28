
_pouch:     file format elf32-i386


Disassembly of section .text:

00000000 <print_help_inside_cnt>:
  if(close(tty_fd) < 0)
      return -1;
  return 0;
}

static int print_help_inside_cnt(){
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 0c             	sub    $0xc,%esp
    int retval = 0;
    retval = printf(stderr,"\nPouch commands inside containers:\n");
       7:	68 f8 1e 00 00       	push   $0x1ef8
       c:	6a 02                	push   $0x2
       e:	e8 6d 1a 00 00       	call   1a80 <printf>
      13:	89 c3                	mov    %eax,%ebx
    retval |= printf(stderr,"       pouch disconnect \n");
      15:	58                   	pop    %eax
      16:	5a                   	pop    %edx
      17:	68 54 24 00 00       	push   $0x2454
      1c:	6a 02                	push   $0x2
      1e:	e8 5d 1a 00 00       	call   1a80 <printf>
    retval |= printf(stderr,"          : disconnect a currently connected container\n");
      23:	59                   	pop    %ecx
}

static int print_help_inside_cnt(){
    int retval = 0;
    retval = printf(stderr,"\nPouch commands inside containers:\n");
    retval |= printf(stderr,"       pouch disconnect \n");
      24:	09 c3                	or     %eax,%ebx
    retval |= printf(stderr,"          : disconnect a currently connected container\n");
      26:	58                   	pop    %eax
      27:	68 1c 1f 00 00       	push   $0x1f1c
      2c:	6a 02                	push   $0x2
      2e:	e8 4d 1a 00 00       	call   1a80 <printf>
      33:	09 c3                	or     %eax,%ebx
    retval |= printf(stderr,"       pouch info\n");
      35:	58                   	pop    %eax
      36:	5a                   	pop    %edx
      37:	68 6e 24 00 00       	push   $0x246e
      3c:	6a 02                	push   $0x2
      3e:	e8 3d 1a 00 00       	call   1a80 <printf>
    retval |= printf(stderr,"          : query information about currently connected container\n");
      43:	59                   	pop    %ecx
static int print_help_inside_cnt(){
    int retval = 0;
    retval = printf(stderr,"\nPouch commands inside containers:\n");
    retval |= printf(stderr,"       pouch disconnect \n");
    retval |= printf(stderr,"          : disconnect a currently connected container\n");
    retval |= printf(stderr,"       pouch info\n");
      44:	09 c3                	or     %eax,%ebx
    retval |= printf(stderr,"          : query information about currently connected container\n");
      46:	58                   	pop    %eax
      47:	68 54 1f 00 00       	push   $0x1f54
      4c:	6a 02                	push   $0x2
      4e:	e8 2d 1a 00 00       	call   1a80 <printf>
    return retval;
      53:	09 d8                	or     %ebx,%eax
}
      55:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      58:	c9                   	leave  
      59:	c3                   	ret    
      5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000060 <read_from_pconf>:
    }
    close(ttyc_fd);
    return 0;
}

static int read_from_pconf(char * ttyname, char * cname){
      60:	55                   	push   %ebp
      61:	89 e5                	mov    %esp,%ebp
      63:	57                   	push   %edi
      64:	56                   	push   %esi
      65:	53                   	push   %ebx
    char ttyc[] = "tty.cX";
    int ttyc_fd;
    ttyc[5] = ttyname[4];
    if((ttyc_fd = open(ttyc, O_RDWR)) < 0){
      66:	8d 75 e1             	lea    -0x1f(%ebp),%esi
    }
    close(ttyc_fd);
    return 0;
}

static int read_from_pconf(char * ttyname, char * cname){
      69:	89 d7                	mov    %edx,%edi
    char ttyc[] = "tty.cX";
      6b:	ba 63 58 00 00       	mov    $0x5863,%edx
    }
    close(ttyc_fd);
    return 0;
}

static int read_from_pconf(char * ttyname, char * cname){
      70:	83 ec 24             	sub    $0x24,%esp
    char ttyc[] = "tty.cX";
    int ttyc_fd;
    ttyc[5] = ttyname[4];
      73:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    close(ttyc_fd);
    return 0;
}

static int read_from_pconf(char * ttyname, char * cname){
    char ttyc[] = "tty.cX";
      77:	66 89 55 e5          	mov    %dx,-0x1b(%ebp)
    int ttyc_fd;
    ttyc[5] = ttyname[4];
    if((ttyc_fd = open(ttyc, O_RDWR)) < 0){
      7b:	6a 02                	push   $0x2
      7d:	56                   	push   %esi
    close(ttyc_fd);
    return 0;
}

static int read_from_pconf(char * ttyname, char * cname){
    char ttyc[] = "tty.cX";
      7e:	c7 45 e1 74 74 79 2e 	movl   $0x2e797474,-0x1f(%ebp)
      85:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    int ttyc_fd;
    ttyc[5] = ttyname[4];
      89:	88 45 e6             	mov    %al,-0x1a(%ebp)
    if((ttyc_fd = open(ttyc, O_RDWR)) < 0){
      8c:	e8 77 18 00 00       	call   1908 <open>
      91:	83 c4 10             	add    $0x10,%esp
      94:	85 c0                	test   %eax,%eax
      96:	78 28                	js     c0 <read_from_pconf+0x60>
        printf(stderr, "cannot open %s fd\n", ttyc);
        return -1;
    }
    read(ttyc_fd, cname, CNTNAMESIZE);
      98:	83 ec 04             	sub    $0x4,%esp
      9b:	89 c3                	mov    %eax,%ebx
      9d:	6a 64                	push   $0x64
      9f:	57                   	push   %edi
      a0:	50                   	push   %eax
      a1:	e8 3a 18 00 00       	call   18e0 <read>
    close(ttyc_fd);
      a6:	89 1c 24             	mov    %ebx,(%esp)
      a9:	e8 42 18 00 00       	call   18f0 <close>
    return 0;
      ae:	83 c4 10             	add    $0x10,%esp
      b1:	31 c0                	xor    %eax,%eax
}
      b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
      b6:	5b                   	pop    %ebx
      b7:	5e                   	pop    %esi
      b8:	5f                   	pop    %edi
      b9:	5d                   	pop    %ebp
      ba:	c3                   	ret    
      bb:	90                   	nop
      bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static int read_from_pconf(char * ttyname, char * cname){
    char ttyc[] = "tty.cX";
    int ttyc_fd;
    ttyc[5] = ttyname[4];
    if((ttyc_fd = open(ttyc, O_RDWR)) < 0){
        printf(stderr, "cannot open %s fd\n", ttyc);
      c0:	83 ec 04             	sub    $0x4,%esp
      c3:	56                   	push   %esi
      c4:	68 81 24 00 00       	push   $0x2481
      c9:	6a 02                	push   $0x2
      cb:	e8 b0 19 00 00       	call   1a80 <printf>
        return -1;
      d0:	83 c4 10             	add    $0x10,%esp
      d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      d8:	eb d9                	jmp    b3 <read_from_pconf+0x53>
      da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000e0 <panic>:
        string[i] = 0;
}

void
panic(char *s)
{
      e0:	55                   	push   %ebp
      e1:	89 e5                	mov    %esp,%ebp
      e3:	83 ec 0c             	sub    $0xc,%esp
  printf(stderr, "%s\n", s);
      e6:	ff 75 08             	pushl  0x8(%ebp)
      e9:	68 31 26 00 00       	push   $0x2631
      ee:	6a 02                	push   $0x2
      f0:	e8 8b 19 00 00       	call   1a80 <printf>
  exit(1);
      f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      fc:	e8 c7 17 00 00       	call   18c8 <exit>
     101:	eb 0d                	jmp    110 <pouch_cmd>
     103:	90                   	nop
     104:	90                   	nop
     105:	90                   	nop
     106:	90                   	nop
     107:	90                   	nop
     108:	90                   	nop
     109:	90                   	nop
     10a:	90                   	nop
     10b:	90                   	nop
     10c:	90                   	nop
     10d:	90                   	nop
     10e:	90                   	nop
     10f:	90                   	nop

00000110 <pouch_cmd>:
    strcpy(cg_cname,"/cgroup/");
    strcat(cg_cname, container_name);
    return 0;
}

static int pouch_cmd(char* container_name, enum p_cmd cmd){
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	57                   	push   %edi
     114:	56                   	push   %esi
     115:	53                   	push   %ebx
     116:	81 ec 2c 03 00 00    	sub    $0x32c,%esp
        int tty_fd;
        int pid;
        char tty_name[10];
        char cg_cname[256];

        if(cmd == START){
     11c:	85 d2                	test   %edx,%edx
    strcpy(cg_cname,"/cgroup/");
    strcat(cg_cname, container_name);
    return 0;
}

static int pouch_cmd(char* container_name, enum p_cmd cmd){
     11e:	89 85 d0 fc ff ff    	mov    %eax,-0x330(%ebp)
        int tty_fd;
        int pid;
        char tty_name[10];
        char cg_cname[256];

        if(cmd == START){
     124:	0f 84 b3 01 00 00    	je     2dd <pouch_cmd+0x1cd>
           return pouch_fork(container_name);
        }

        if(cmd == LIST){
     12a:	83 fa 06             	cmp    $0x6,%edx
     12d:	89 d3                	mov    %edx,%ebx
     12f:	0f 84 e0 00 00 00    	je     215 <pouch_cmd+0x105>
    return 0;
}

static int read_from_cconf(char* container_name, char* tty_name, int* pid){
   char pid_str[sizeof("PPID:") + 10];
   int cont_fd = open(container_name, 0);
     135:	56                   	push   %esi
     136:	56                   	push   %esi
     137:	6a 00                	push   $0x0
     139:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     13f:	e8 c4 17 00 00       	call   1908 <open>

   if(cont_fd < 0){
     144:	83 c4 10             	add    $0x10,%esp
     147:	85 c0                	test   %eax,%eax
    return 0;
}

static int read_from_cconf(char* container_name, char* tty_name, int* pid){
   char pid_str[sizeof("PPID:") + 10];
   int cont_fd = open(container_name, 0);
     149:	89 c6                	mov    %eax,%esi

   if(cont_fd < 0){
     14b:	0f 88 07 0b 00 00    	js     c58 <pouch_cmd+0xb48>
      printf(stderr, "There is no container: %s in a started stage\n", container_name);
      exit(1);
    }

   if(read(cont_fd, tty_name, sizeof("/ttyX")) < sizeof("/ttyX")) {
     151:	8d 85 de fc ff ff    	lea    -0x322(%ebp),%eax
     157:	51                   	push   %ecx
     158:	6a 06                	push   $0x6
     15a:	50                   	push   %eax
     15b:	56                   	push   %esi
     15c:	89 85 cc fc ff ff    	mov    %eax,-0x334(%ebp)
     162:	e8 79 17 00 00       	call   18e0 <read>
     167:	83 c4 10             	add    $0x10,%esp
     16a:	83 f8 05             	cmp    $0x5,%eax
     16d:	0f 86 e4 09 00 00    	jbe    b57 <pouch_cmd+0xa47>
      return -1;
   }

   tty_name[sizeof("/ttyX")-1] = 0;

   if(read(cont_fd, pid_str, sizeof(pid_str)) < sizeof("PPID:")+2) {
     173:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     179:	57                   	push   %edi
     17a:	6a 10                	push   $0x10
      close(cont_fd);
      printf(stderr,"CONT TTY NOT FOUND\n");
      return -1;
   }

   tty_name[sizeof("/ttyX")-1] = 0;
     17c:	c6 85 e3 fc ff ff 00 	movb   $0x0,-0x31d(%ebp)

   if(read(cont_fd, pid_str, sizeof(pid_str)) < sizeof("PPID:")+2) {
     183:	50                   	push   %eax
     184:	56                   	push   %esi
     185:	89 85 d4 fc ff ff    	mov    %eax,-0x32c(%ebp)
     18b:	e8 50 17 00 00       	call   18e0 <read>
     190:	83 c4 10             	add    $0x10,%esp
     193:	83 f8 07             	cmp    $0x7,%eax
     196:	0f 86 da 09 00 00    	jbe    b76 <pouch_cmd+0xa66>
      printf(stderr,"CONT PID NOT FOUND\n");
      return -1;
   }

   pid_str[sizeof(pid_str)-1] = 0;
   *pid = atoi(pid_str+sizeof("PPID:"));
     19c:	8d 85 ee fe ff ff    	lea    -0x112(%ebp),%eax
     1a2:	83 ec 0c             	sub    $0xc,%esp
      close(cont_fd);
      printf(stderr,"CONT PID NOT FOUND\n");
      return -1;
   }

   pid_str[sizeof(pid_str)-1] = 0;
     1a5:	c6 85 f7 fe ff ff 00 	movb   $0x0,-0x109(%ebp)
   *pid = atoi(pid_str+sizeof("PPID:"));
     1ac:	50                   	push   %eax
     1ad:	e8 ce 14 00 00       	call   1680 <atoi>

   close(cont_fd);
     1b2:	89 34 24             	mov    %esi,(%esp)
      printf(stderr,"CONT PID NOT FOUND\n");
      return -1;
   }

   pid_str[sizeof(pid_str)-1] = 0;
   *pid = atoi(pid_str+sizeof("PPID:"));
     1b5:	89 c7                	mov    %eax,%edi

   close(cont_fd);
     1b7:	e8 34 17 00 00       	call   18f0 <close>

        if(read_from_cconf(container_name, tty_name, &pid) < 0){
           return -1;
        }

        if(cmd == INFO){
     1bc:	83 c4 10             	add    $0x10,%esp
     1bf:	83 fb 05             	cmp    $0x5,%ebx
     1c2:	0f 84 b4 03 00 00    	je     57c <pouch_cmd+0x46c>
                return -1;
            }
            return 0;
        }

        if((tty_fd = open(tty_name, O_RDWR)) < 0){
     1c8:	50                   	push   %eax
     1c9:	50                   	push   %eax
     1ca:	6a 02                	push   $0x2
     1cc:	ff b5 cc fc ff ff    	pushl  -0x334(%ebp)
     1d2:	e8 31 17 00 00       	call   1908 <open>
     1d7:	83 c4 10             	add    $0x10,%esp
     1da:	85 c0                	test   %eax,%eax
     1dc:	89 c2                	mov    %eax,%edx
     1de:	0f 88 1d 0a 00 00    	js     c01 <pouch_cmd+0xaf1>
           printf(stderr, "cannot open tty: %s\n",tty_name);
           return -1;
        }

        if(cmd == DESTROY && pid != 0){
     1e4:	83 fb 03             	cmp    $0x3,%ebx
     1e7:	0f 84 c9 05 00 00    	je     7b6 <pouch_cmd+0x6a6>
           return 0;
        }



        if(cmd == CONNECT){
     1ed:	83 fb 01             	cmp    $0x1,%ebx
     1f0:	0f 84 9e 07 00 00    	je     994 <pouch_cmd+0x884>
                }
            }else{
                printf(1, "Pouch: %s is already connected\n",container_name);
            }

        }else if(cmd == DISCONNECT && disconnect_tty(tty_fd) < 0){
     1f6:	83 fb 02             	cmp    $0x2,%ebx
     1f9:	0f 84 ed 07 00 00    	je     9ec <pouch_cmd+0x8dc>
           close(tty_fd);
           printf(stderr, "cannot disconnect from tty\n");
           return -1;
        }

        close(tty_fd);
     1ff:	83 ec 0c             	sub    $0xc,%esp
     202:	52                   	push   %edx
     203:	e8 e8 16 00 00       	call   18f0 <close>
        return 0;
     208:	83 c4 10             	add    $0x10,%esp
     20b:	31 c0                	xor    %eax,%eax
}
     20d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     210:	5b                   	pop    %ebx
     211:	5e                   	pop    %esi
     212:	5f                   	pop    %edi
     213:	5d                   	pop    %ebp
     214:	c3                   	ret    

static int print_clist(){
    int i;
    int tty_fd;
    char tty[] = "/ttyX";
    char buf[CNTNAMESIZE] = {0};
     215:	8d bd e8 fe ff ff    	lea    -0x118(%ebp),%edi
     21b:	31 c0                	xor    %eax,%eax
     21d:	b9 19 00 00 00       	mov    $0x19,%ecx
     222:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
}

static int print_clist(){
    int i;
    int tty_fd;
    char tty[] = "/ttyX";
     228:	c7 85 e8 fd ff ff 2f 	movl   $0x7974742f,-0x218(%ebp)
     22f:	74 74 79 
     232:	66 c7 85 ec fd ff ff 	movw   $0x58,-0x214(%ebp)
     239:	58 00 
    char buf[CNTNAMESIZE] = {0};
     23b:	89 bd d4 fc ff ff    	mov    %edi,-0x32c(%ebp)
    int is_empty_flag = 0;
    int id = 1;
    printf(stderr,"     Pouch containers:\n");
     241:	bb 30 00 00 00       	mov    $0x30,%ebx

static int print_clist(){
    int i;
    int tty_fd;
    char tty[] = "/ttyX";
    char buf[CNTNAMESIZE] = {0};
     246:	f3 ab                	rep stos %eax,%es:(%edi)
    int is_empty_flag = 0;
    int id = 1;
    printf(stderr,"     Pouch containers:\n");
     248:	50                   	push   %eax
     249:	50                   	push   %eax
     24a:	8d bd 4c ff ff ff    	lea    -0xb4(%ebp),%edi
     250:	68 55 25 00 00       	push   $0x2555
     255:	6a 02                	push   $0x2
     257:	e8 24 18 00 00       	call   1a80 <printf>
     25c:	83 c4 10             	add    $0x10,%esp
static int print_clist(){
    int i;
    int tty_fd;
    char tty[] = "/ttyX";
    char buf[CNTNAMESIZE] = {0};
    int is_empty_flag = 0;
     25f:	c7 85 cc fc ff ff 00 	movl   $0x0,-0x334(%ebp)
     266:	00 00 00 
    int id = 1;
     269:	c7 85 c8 fc ff ff 01 	movl   $0x1,-0x338(%ebp)
     270:	00 00 00 
     273:	89 b5 d0 fc ff ff    	mov    %esi,-0x330(%ebp)
    printf(stderr,"     Pouch containers:\n");

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        tty[4] = '0' + i;
        if((tty_fd = open(tty, O_RDWR)) < 0){
     279:	50                   	push   %eax
     27a:	50                   	push   %eax
     27b:	6a 02                	push   $0x2
     27d:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
    int id = 1;
    printf(stderr,"     Pouch containers:\n");

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        tty[4] = '0' + i;
     283:	88 9d ec fd ff ff    	mov    %bl,-0x214(%ebp)
        if((tty_fd = open(tty, O_RDWR)) < 0){
     289:	e8 7a 16 00 00       	call   1908 <open>
     28e:	83 c4 10             	add    $0x10,%esp
     291:	85 c0                	test   %eax,%eax
     293:	89 c6                	mov    %eax,%esi
     295:	0f 88 fa 08 00 00    	js     b95 <pouch_cmd+0xa85>
            printf(stderr, "cannot open %s fd\n", tty);
            return -1;
        }
        if(read_from_pconf(tty,buf) <0 ){
     29b:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     2a1:	8b 85 d0 fc ff ff    	mov    -0x330(%ebp),%eax
     2a7:	e8 b4 fd ff ff       	call   60 <read_from_pconf>
     2ac:	85 c0                	test   %eax,%eax
     2ae:	0f 88 fd 08 00 00    	js     bb1 <pouch_cmd+0xaa1>
            printf(stderr, "failed to read pconf from %s\n", tty);
            return -1;
        }
        if(!buf[0]){
     2b4:	80 bd e8 fe ff ff 00 	cmpb   $0x0,-0x118(%ebp)
     2bb:	0f 85 70 04 00 00    	jne    731 <pouch_cmd+0x621>
     2c1:	83 c3 01             	add    $0x1,%ebx
    int is_empty_flag = 0;
    int id = 1;
    printf(stderr,"     Pouch containers:\n");

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
     2c4:	80 fb 33             	cmp    $0x33,%bl
     2c7:	75 b0                	jne    279 <pouch_cmd+0x169>
        }else{
            printf(stderr,"started \n");
        }
        close(tty_fd);
    }
    if(!is_empty_flag){
     2c9:	83 bd cc fc ff ff 00 	cmpl   $0x0,-0x334(%ebp)
     2d0:	0f 84 43 04 00 00    	je     719 <pouch_cmd+0x609>

        if(cmd == INFO){
            if(print_cinfo(container_name, tty_name, pid) <0){
                return -1;
            }
            return 0;
     2d6:	31 c0                	xor    %eax,%eax
     2d8:	e9 30 ff ff ff       	jmp    20d <pouch_cmd+0xfd>
     2dd:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
}

static int find_tty(char* tty_name){
        int i;
        int tty_fd;
        char tty[] = "/ttyX";
     2e3:	c7 85 e8 fe ff ff 2f 	movl   $0x7974742f,-0x118(%ebp)
     2ea:	74 74 79 
     2ed:	66 c7 85 ec fe ff ff 	movw   $0x58,-0x114(%ebp)
     2f4:	58 00 
     2f6:	be 30 00 00 00       	mov    $0x30,%esi
     2fb:	89 85 d4 fc ff ff    	mov    %eax,-0x32c(%ebp)
     301:	89 c7                	mov    %eax,%edi

        // Not including the console tty
        for(i=0; i < (MAX_TTY - 1); i++){
            tty[4] = '0' + i;
            if((tty_fd = open(tty, O_RDWR)) < 0){
     303:	53                   	push   %ebx
     304:	53                   	push   %ebx
        int tty_fd;
        char tty[] = "/ttyX";

        // Not including the console tty
        for(i=0; i < (MAX_TTY - 1); i++){
            tty[4] = '0' + i;
     305:	89 f0                	mov    %esi,%eax
            if((tty_fd = open(tty, O_RDWR)) < 0){
     307:	6a 02                	push   $0x2
     309:	57                   	push   %edi
        int tty_fd;
        char tty[] = "/ttyX";

        // Not including the console tty
        for(i=0; i < (MAX_TTY - 1); i++){
            tty[4] = '0' + i;
     30a:	88 85 ec fe ff ff    	mov    %al,-0x114(%ebp)
            if((tty_fd = open(tty, O_RDWR)) < 0){
     310:	e8 f3 15 00 00       	call   1908 <open>
     315:	83 c4 10             	add    $0x10,%esp
     318:	85 c0                	test   %eax,%eax
     31a:	89 c3                	mov    %eax,%ebx
     31c:	0f 88 ab 08 00 00    	js     bcd <pouch_cmd+0xabd>
                printf(stderr, "cannot open %s fd\n", tty);
                return -1;
            }

            if(!is_attached_tty(tty_fd)){
     322:	83 ec 0c             	sub    $0xc,%esp
     325:	50                   	push   %eax
     326:	e8 85 1a 00 00       	call   1db0 <is_attached_tty>
     32b:	83 c4 10             	add    $0x10,%esp
     32e:	85 c0                	test   %eax,%eax
     330:	74 2f                	je     361 <pouch_cmd+0x251>
                strcpy(tty_name,tty);
                close(tty_fd);
                return 0;
            }
            close(tty_fd);
     332:	83 ec 0c             	sub    $0xc,%esp
     335:	83 c6 01             	add    $0x1,%esi
     338:	53                   	push   %ebx
     339:	e8 b2 15 00 00       	call   18f0 <close>
        int i;
        int tty_fd;
        char tty[] = "/ttyX";

        // Not including the console tty
        for(i=0; i < (MAX_TTY - 1); i++){
     33e:	89 f0                	mov    %esi,%eax
     340:	83 c4 10             	add    $0x10,%esp
     343:	3c 33                	cmp    $0x33,%al
     345:	75 bc                	jne    303 <pouch_cmd+0x1f3>
   char cg_cname[256];
   int daemonize = 1;

   //Find tty name
   if(find_tty(tty_name) < 0){
      printf(1, "Pouch: cannot create more containers\n");
     347:	52                   	push   %edx
     348:	52                   	push   %edx
     349:	68 d8 20 00 00       	push   $0x20d8
     34e:	6a 01                	push   $0x1
     350:	e8 2b 17 00 00       	call   1a80 <printf>
      exit(1);
     355:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     35c:	e8 67 15 00 00       	call   18c8 <exit>
                printf(stderr, "cannot open %s fd\n", tty);
                return -1;
            }

            if(!is_attached_tty(tty_fd)){
                strcpy(tty_name,tty);
     361:	50                   	push   %eax
     362:	50                   	push   %eax
     363:	8d 85 de fc ff ff    	lea    -0x322(%ebp),%eax
     369:	ff b5 d4 fc ff ff    	pushl  -0x32c(%ebp)
     36f:	50                   	push   %eax
     370:	89 85 cc fc ff ff    	mov    %eax,-0x334(%ebp)
     376:	e8 b5 10 00 00       	call   1430 <strcpy>
                close(tty_fd);
     37b:	89 1c 24             	mov    %ebx,(%esp)
     37e:	e8 6d 15 00 00       	call   18f0 <close>
   if(find_tty(tty_name) < 0){
      printf(1, "Pouch: cannot create more containers\n");
      exit(1);
   }

   int cont_fd = open(container_name, 0);
     383:	58                   	pop    %eax
     384:	5a                   	pop    %edx
     385:	6a 00                	push   $0x0
     387:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     38d:	e8 76 15 00 00       	call   1908 <open>
   if(cont_fd < 0){
     392:	83 c4 10             	add    $0x10,%esp
     395:	85 c0                	test   %eax,%eax
     397:	0f 89 da 08 00 00    	jns    c77 <pouch_cmd+0xb67>
      printf(1, "Pouch: %s starting\n",container_name);
     39d:	8b b5 d0 fc ff ff    	mov    -0x330(%ebp),%esi
     3a3:	50                   	push   %eax
    printf(1, "Pouch: %s cgroup applied \n",container_name);
    return 0;
}

static int prepare_cgroup_cname(char* container_name, char* cg_cname){
    strcpy(cg_cname,"/cgroup/");
     3a4:	8d 9d e8 fc ff ff    	lea    -0x318(%ebp),%ebx
      exit(1);
   }

   int cont_fd = open(container_name, 0);
   if(cont_fd < 0){
      printf(1, "Pouch: %s starting\n",container_name);
     3aa:	56                   	push   %esi
     3ab:	68 94 24 00 00       	push   $0x2494
     3b0:	6a 01                	push   $0x1
     3b2:	e8 c9 16 00 00       	call   1a80 <printf>
    printf(1, "Pouch: %s cgroup applied \n",container_name);
    return 0;
}

static int prepare_cgroup_cname(char* container_name, char* cg_cname){
    strcpy(cg_cname,"/cgroup/");
     3b7:	58                   	pop    %eax
     3b8:	5a                   	pop    %edx
     3b9:	68 a8 24 00 00       	push   $0x24a8
     3be:	53                   	push   %ebx
     3bf:	e8 6c 10 00 00       	call   1430 <strcpy>
    strcat(cg_cname, container_name);
     3c4:	59                   	pop    %ecx
     3c5:	5f                   	pop    %edi
     3c6:	56                   	push   %esi
     3c7:	53                   	push   %ebx
     3c8:	e8 d3 13 00 00       	call   17a0 <strcat>
    printf(stderr,"          - [value] : argument for the state-object, multiple values delimited by ','\n");
}

static int create_pouch_cgroup(char *cg_cname, char *cname){

    if(mkdir(cg_cname) != 0){
     3cd:	89 1c 24             	mov    %ebx,(%esp)
     3d0:	e8 5b 15 00 00       	call   1930 <mkdir>
     3d5:	83 c4 10             	add    $0x10,%esp
     3d8:	85 c0                	test   %eax,%eax
     3da:	0f 85 75 06 00 00    	jne    a55 <pouch_cmd+0x945>
        printf(stderr,"Pouch: Failed to create cgroup with the given name. Consider another container name: %s \n",cname);
        return -1;
    }
    char cgpath[256];
    memset(cgpath,'\0',256);
     3e0:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
     3e6:	51                   	push   %ecx
     3e7:	68 00 01 00 00       	push   $0x100
     3ec:	6a 00                	push   $0x0
     3ee:	56                   	push   %esi
     3ef:	e8 7c 11 00 00       	call   1570 <memset>
    strcpy(cgpath, cg_cname);
     3f4:	5f                   	pop    %edi
     3f5:	58                   	pop    %eax
     3f6:	53                   	push   %ebx
     3f7:	56                   	push   %esi
     3f8:	e8 33 10 00 00       	call   1430 <strcpy>
    strcat(cgpath,"/cgroup.subtree_control");
     3fd:	58                   	pop    %eax
     3fe:	5a                   	pop    %edx
     3ff:	68 b1 24 00 00       	push   $0x24b1
     404:	56                   	push   %esi
     405:	e8 96 13 00 00       	call   17a0 <strcat>

    int cgroup_subtree_control_fd =
     40a:	59                   	pop    %ecx
     40b:	5f                   	pop    %edi
     40c:	6a 02                	push   $0x2
     40e:	56                   	push   %esi
     40f:	e8 f4 14 00 00       	call   1908 <open>
        open(cgpath, O_RDWR);

    if(cgroup_subtree_control_fd < 0)
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
    char cgpath[256];
    memset(cgpath,'\0',256);
    strcpy(cgpath, cg_cname);
    strcat(cgpath,"/cgroup.subtree_control");

    int cgroup_subtree_control_fd =
     419:	89 c6                	mov    %eax,%esi
        open(cgpath, O_RDWR);

    if(cgroup_subtree_control_fd < 0)
     41b:	0f 88 4a 06 00 00    	js     a6b <pouch_cmd+0x95b>
        return -1;

    // Enable cpu controller
    char buf[256];
    memset(buf,'\0',256);
     421:	8b bd d4 fc ff ff    	mov    -0x32c(%ebp),%edi
     427:	50                   	push   %eax
     428:	68 00 01 00 00       	push   $0x100
     42d:	6a 00                	push   $0x0
     42f:	57                   	push   %edi
     430:	e8 3b 11 00 00       	call   1570 <memset>
    strcpy(buf, "+cpu");
     435:	58                   	pop    %eax
     436:	5a                   	pop    %edx
     437:	68 c9 24 00 00       	push   $0x24c9
     43c:	57                   	push   %edi
     43d:	e8 ee 0f 00 00       	call   1430 <strcpy>
    if(write(cgroup_subtree_control_fd, buf, sizeof(buf)) < 0)
     442:	83 c4 0c             	add    $0xc,%esp
     445:	68 00 01 00 00       	push   $0x100
     44a:	57                   	push   %edi
     44b:	56                   	push   %esi
     44c:	e8 97 14 00 00       	call   18e8 <write>
     451:	83 c4 10             	add    $0x10,%esp
     454:	85 c0                	test   %eax,%eax
     456:	0f 88 0f 06 00 00    	js     a6b <pouch_cmd+0x95b>
        return -1;
    if(close(cgroup_subtree_control_fd) < 0)
     45c:	83 ec 0c             	sub    $0xc,%esp
     45f:	56                   	push   %esi
     460:	e8 8b 14 00 00       	call   18f0 <close>
     465:	83 c4 10             	add    $0x10,%esp
     468:	85 c0                	test   %eax,%eax
     46a:	0f 88 fb 05 00 00    	js     a6b <pouch_cmd+0x95b>
}

static int write_to_pconf(char * ttyname, char * cname){
    char ttyc[] = "tty.cX";
    int ttyc_fd;
    ttyc[5] = ttyname[4];
     470:	0f b6 85 e2 fc ff ff 	movzbl -0x31e(%ebp),%eax
    }
    return 0;
}

static int write_to_pconf(char * ttyname, char * cname){
    char ttyc[] = "tty.cX";
     477:	8b bd d4 fc ff ff    	mov    -0x32c(%ebp),%edi
     47d:	be ab 26 00 00       	mov    $0x26ab,%esi
     482:	b9 07 00 00 00       	mov    $0x7,%ecx
     487:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
    int ttyc_fd;
    ttyc[5] = ttyname[4];
     489:	88 85 ed fe ff ff    	mov    %al,-0x113(%ebp)
    if((ttyc_fd = open(ttyc, O_CREATE | O_WRONLY)) < 0){
     48f:	50                   	push   %eax
     490:	50                   	push   %eax
     491:	68 01 02 00 00       	push   $0x201
     496:	ff b5 d4 fc ff ff    	pushl  -0x32c(%ebp)
     49c:	e8 67 14 00 00       	call   1908 <open>
     4a1:	83 c4 10             	add    $0x10,%esp
     4a4:	85 c0                	test   %eax,%eax
     4a6:	89 c6                	mov    %eax,%esi
     4a8:	0f 88 8f 07 00 00    	js     c3d <pouch_cmd+0xb2d>
        printf(stderr, "cannot open %s fd\n", ttyc);
        return -1;
    }
    printf(ttyc_fd, "%s",cname);
     4ae:	50                   	push   %eax
     4af:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     4b5:	68 ce 24 00 00       	push   $0x24ce
     4ba:	56                   	push   %esi
     4bb:	e8 c0 15 00 00       	call   1a80 <printf>
    close(ttyc_fd);
     4c0:	89 34 24             	mov    %esi,(%esp)
     4c3:	e8 28 14 00 00       	call   18f0 <close>
     4c8:	83 c4 10             	add    $0x10,%esp
      exit(1);

   //update cname in pouch conf
   write_to_pconf(tty_name,container_name);

   if((tty_fd = open(tty_name, O_RDWR)) < 0){
     4cb:	57                   	push   %edi
     4cc:	57                   	push   %edi
     4cd:	6a 02                	push   $0x2
     4cf:	ff b5 cc fc ff ff    	pushl  -0x334(%ebp)
     4d5:	e8 2e 14 00 00       	call   1908 <open>
     4da:	83 c4 10             	add    $0x10,%esp
     4dd:	85 c0                	test   %eax,%eax
     4df:	89 c6                	mov    %eax,%esi
     4e1:	0f 88 38 07 00 00    	js     c1f <pouch_cmd+0xb0f>
      printf(stderr, "cannot open tty %s %d\n", tty_name, tty_fd);
      return -1;
   }

   //Parent process forking child process
   if(!daemonize || (daemonize && (pid2 = fork()) == 0)){
     4e7:	e8 d4 13 00 00       	call   18c0 <fork>
     4ec:	85 c0                	test   %eax,%eax
     4ee:	75 78                	jne    568 <pouch_cmd+0x458>
      //Set up pid namespace before fork
      if(unshare(PID_NS) != 0){
     4f0:	83 ec 0c             	sub    $0xc,%esp
     4f3:	6a 02                	push   $0x2
     4f5:	e8 8e 14 00 00       	call   1988 <unshare>
     4fa:	83 c4 10             	add    $0x10,%esp
     4fd:	85 c0                	test   %eax,%eax
     4ff:	0f 85 e3 06 00 00    	jne    be8 <pouch_cmd+0xad8>
        printf(stderr, "Cannot create pid namespace\n");
        return -1;
      }

      pid = fork();
     505:	e8 b6 13 00 00       	call   18c0 <fork>
      if(pid == -1){
     50a:	83 f8 ff             	cmp    $0xffffffff,%eax
      if(unshare(PID_NS) != 0){
        printf(stderr, "Cannot create pid namespace\n");
        return -1;
      }

      pid = fork();
     50d:	89 c7                	mov    %eax,%edi
      if(pid == -1){
     50f:	0f 84 b2 07 00 00    	je     cc7 <pouch_cmd+0xbb7>
         panic("fork");
      }

      if(pid == 0) {
     515:	85 c0                	test   %eax,%eax
     517:	0f 85 8b 05 00 00    	jne    aa8 <pouch_cmd+0x998>
         if(tty_fd != -1){
            //attach stderr stdin stdout
            if(attach_tty(tty_fd) < 0){
     51d:	83 ec 0c             	sub    $0xc,%esp
     520:	56                   	push   %esi
     521:	e8 ca 18 00 00       	call   1df0 <attach_tty>
     526:	83 c4 10             	add    $0x10,%esp
     529:	85 c0                	test   %eax,%eax
     52b:	0f 88 bd 07 00 00    	js     cee <pouch_cmd+0xbde>
              exit(1);
            }

           //"Child process - setting up namespaces for the container
           // Set up mount namespace.
           if(unshare(MOUNT_NS) < 0) {
     531:	83 ec 0c             	sub    $0xc,%esp
     534:	6a 01                	push   $0x1
     536:	e8 4d 14 00 00       	call   1988 <unshare>
     53b:	83 c4 10             	add    $0x10,%esp
     53e:	85 c0                	test   %eax,%eax
     540:	0f 88 8e 07 00 00    	js     cd4 <pouch_cmd+0xbc4>
             printf(1, "Cannot create mount namespace\n");
             exit(1);
           }

           printf(stderr,"Entering container\n");
     546:	57                   	push   %edi
     547:	57                   	push   %edi
     548:	68 18 25 00 00       	push   $0x2518
     54d:	6a 02                	push   $0x2
     54f:	e8 2c 15 00 00       	call   1a80 <printf>
           exec("sh", argv);
     554:	58                   	pop    %eax
     555:	5a                   	pop    %edx
     556:	68 00 40 00 00       	push   $0x4000
     55b:	68 2c 25 00 00       	push   $0x252c
     560:	e8 9b 13 00 00       	call   1900 <exec>
     565:	83 c4 10             	add    $0x10,%esp

        exit(0);
      }
    }

  if(close(tty_fd) < 0)
     568:	83 ec 0c             	sub    $0xc,%esp
     56b:	56                   	push   %esi
     56c:	e8 7f 13 00 00       	call   18f0 <close>
     571:	83 c4 10             	add    $0x10,%esp
     574:	c1 f8 1f             	sar    $0x1f,%eax
        int pid;
        char tty_name[10];
        char cg_cname[256];

        if(cmd == START){
           return pouch_fork(container_name);
     577:	e9 91 fc ff ff       	jmp    20d <pouch_cmd+0xfd>
static int print_cinfo(char* container_name, char * tty_name, int pid){
    char buf[256];
    char cgmax[256];
    char cgstat[256];

    strcpy(cgmax, "/cgroup/");
     57c:	56                   	push   %esi
     57d:	56                   	push   %esi
     57e:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
     584:	68 a8 24 00 00       	push   $0x24a8
     589:	56                   	push   %esi
     58a:	e8 a1 0e 00 00       	call   1430 <strcpy>
    strcat(cgmax,container_name);
     58f:	58                   	pop    %eax
     590:	5a                   	pop    %edx
     591:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     597:	56                   	push   %esi
     598:	e8 03 12 00 00       	call   17a0 <strcat>
    strcat(cgmax,"/cpu.max");
     59d:	59                   	pop    %ecx
     59e:	5b                   	pop    %ebx
     59f:	68 da 25 00 00       	push   $0x25da
     5a4:	56                   	push   %esi
     5a5:	e8 f6 11 00 00       	call   17a0 <strcat>

    strcpy(cgstat, "/cgroup/");
     5aa:	8b 9d d4 fc ff ff    	mov    -0x32c(%ebp),%ebx
     5b0:	58                   	pop    %eax
     5b1:	5a                   	pop    %edx
     5b2:	68 a8 24 00 00       	push   $0x24a8
     5b7:	53                   	push   %ebx
     5b8:	e8 73 0e 00 00       	call   1430 <strcpy>
    strcat(cgstat,container_name);
     5bd:	59                   	pop    %ecx
     5be:	58                   	pop    %eax
     5bf:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     5c5:	53                   	push   %ebx
     5c6:	e8 d5 11 00 00       	call   17a0 <strcat>
    strcat(cgstat,"/cpu.stat");
     5cb:	58                   	pop    %eax
     5cc:	5a                   	pop    %edx
     5cd:	68 e3 25 00 00       	push   $0x25e3
     5d2:	53                   	push   %ebx
     5d3:	e8 c8 11 00 00       	call   17a0 <strcat>

    int cpu_max_fd = open(cgmax, O_RDWR);
     5d8:	59                   	pop    %ecx
     5d9:	58                   	pop    %eax
     5da:	6a 02                	push   $0x2
     5dc:	56                   	push   %esi
     5dd:	e8 26 13 00 00       	call   1908 <open>
     5e2:	89 85 d4 fc ff ff    	mov    %eax,-0x32c(%ebp)
    int cpu_stat_fd = open(cgstat, O_RDWR);
     5e8:	58                   	pop    %eax
     5e9:	5a                   	pop    %edx
     5ea:	6a 02                	push   $0x2
     5ec:	53                   	push   %ebx
     5ed:	e8 16 13 00 00       	call   1908 <open>
     5f2:	89 85 c8 fc ff ff    	mov    %eax,-0x338(%ebp)
    int ppid = getppid();
     5f8:	e8 a3 13 00 00       	call   19a0 <getppid>

    if(ppid == 1){
     5fd:	83 c4 10             	add    $0x10,%esp
     600:	83 e8 01             	sub    $0x1,%eax
     603:	0f 84 84 04 00 00    	je     a8d <pouch_cmd+0x97d>
        printf(1, "     Pouch container- %s: connected\n",container_name);
    }else{
        printf(1, "     Pouch container- %s: started\n",container_name);
     609:	51                   	push   %ecx
     60a:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     610:	68 94 20 00 00       	push   $0x2094
     615:	6a 01                	push   $0x1
     617:	e8 64 14 00 00       	call   1a80 <printf>
     61c:	83 c4 10             	add    $0x10,%esp
    }

    printf(1,"tty - %s\n",tty_name);
     61f:	50                   	push   %eax
     620:	ff b5 cc fc ff ff    	pushl  -0x334(%ebp)
     626:	68 ed 25 00 00       	push   $0x25ed
     62b:	6a 01                	push   $0x1
     62d:	e8 4e 14 00 00       	call   1a80 <printf>
    printf(1,"pid - %d\n",pid);
     632:	83 c4 0c             	add    $0xc,%esp
     635:	57                   	push   %edi
     636:	68 f7 25 00 00       	push   $0x25f7
     63b:	6a 01                	push   $0x1
     63d:	e8 3e 14 00 00       	call   1a80 <printf>
    printf(1,"     cgroups:\n");
     642:	58                   	pop    %eax
     643:	5a                   	pop    %edx
     644:	68 01 26 00 00       	push   $0x2601
     649:	6a 01                	push   $0x1
     64b:	e8 30 14 00 00       	call   1a80 <printf>
    if(cpu_max_fd > 0 && cpu_stat_fd > 0){
     650:	83 c4 10             	add    $0x10,%esp
     653:	83 bd d4 fc ff ff 00 	cmpl   $0x0,-0x32c(%ebp)
     65a:	0f 8e 15 04 00 00    	jle    a75 <pouch_cmd+0x965>
     660:	83 bd c8 fc ff ff 00 	cmpl   $0x0,-0x338(%ebp)
     667:	0f 8e 08 04 00 00    	jle    a75 <pouch_cmd+0x965>
     66d:	8d 9d e8 fc ff ff    	lea    -0x318(%ebp),%ebx
     673:	89 df                	mov    %ebx,%edi
     675:	89 d8                	mov    %ebx,%eax
     677:	89 f6                	mov    %esi,%esi
     679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
*   Helper functions
*/
static void empty_string(char * string, int length)
{
    for (int i = 0; i < length; i++)
        string[i] = 0;
     680:	c6 00 00             	movb   $0x0,(%eax)
     683:	83 c0 01             	add    $0x1,%eax
/*
*   Helper functions
*/
static void empty_string(char * string, int length)
{
    for (int i = 0; i < length; i++)
     686:	39 c6                	cmp    %eax,%esi
     688:	75 f6                	jne    680 <pouch_cmd+0x570>
    printf(1,"tty - %s\n",tty_name);
    printf(1,"pid - %d\n",pid);
    printf(1,"     cgroups:\n");
    if(cpu_max_fd > 0 && cpu_stat_fd > 0){
        empty_string(buf, sizeof(buf));
        if(read(cpu_max_fd, buf, sizeof(buf)) < 0)
     68a:	50                   	push   %eax
     68b:	68 00 01 00 00       	push   $0x100
     690:	53                   	push   %ebx
     691:	ff b5 d4 fc ff ff    	pushl  -0x32c(%ebp)
     697:	e8 44 12 00 00       	call   18e0 <read>
     69c:	83 c4 10             	add    $0x10,%esp
     69f:	85 c0                	test   %eax,%eax
     6a1:	78 6e                	js     711 <pouch_cmd+0x601>
            return -1;
        printf(1, "cpu.max:     \n%s\n", buf);
     6a3:	51                   	push   %ecx
     6a4:	53                   	push   %ebx
     6a5:	68 10 26 00 00       	push   $0x2610
     6aa:	6a 01                	push   $0x1
     6ac:	e8 cf 13 00 00       	call   1a80 <printf>
     6b1:	83 c4 10             	add    $0x10,%esp
     6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
*   Helper functions
*/
static void empty_string(char * string, int length)
{
    for (int i = 0; i < length; i++)
        string[i] = 0;
     6b8:	c6 07 00             	movb   $0x0,(%edi)
     6bb:	83 c7 01             	add    $0x1,%edi
/*
*   Helper functions
*/
static void empty_string(char * string, int length)
{
    for (int i = 0; i < length; i++)
     6be:	39 fe                	cmp    %edi,%esi
     6c0:	75 f6                	jne    6b8 <pouch_cmd+0x5a8>
        empty_string(buf, sizeof(buf));
        if(read(cpu_max_fd, buf, sizeof(buf)) < 0)
            return -1;
        printf(1, "cpu.max:     \n%s\n", buf);
        empty_string(buf, sizeof(buf));
        if(read(cpu_stat_fd, buf, sizeof(buf)) < 0)
     6c2:	8b b5 c8 fc ff ff    	mov    -0x338(%ebp),%esi
     6c8:	52                   	push   %edx
     6c9:	68 00 01 00 00       	push   $0x100
     6ce:	53                   	push   %ebx
     6cf:	56                   	push   %esi
     6d0:	e8 0b 12 00 00       	call   18e0 <read>
     6d5:	83 c4 10             	add    $0x10,%esp
     6d8:	85 c0                	test   %eax,%eax
     6da:	78 35                	js     711 <pouch_cmd+0x601>
            return -1;
        printf(1, "cpu.stat:     \n%s\n", buf);
     6dc:	50                   	push   %eax
     6dd:	53                   	push   %ebx
     6de:	68 22 26 00 00       	push   $0x2622
     6e3:	6a 01                	push   $0x1
     6e5:	e8 96 13 00 00       	call   1a80 <printf>

        if(close(cpu_max_fd) < 0)
     6ea:	58                   	pop    %eax
     6eb:	ff b5 d4 fc ff ff    	pushl  -0x32c(%ebp)
     6f1:	e8 fa 11 00 00       	call   18f0 <close>
     6f6:	83 c4 10             	add    $0x10,%esp
     6f9:	85 c0                	test   %eax,%eax
     6fb:	78 14                	js     711 <pouch_cmd+0x601>
            return -1;
        if(close(cpu_stat_fd) < 0)
     6fd:	83 ec 0c             	sub    $0xc,%esp
     700:	56                   	push   %esi
     701:	e8 ea 11 00 00       	call   18f0 <close>
     706:	83 c4 10             	add    $0x10,%esp
     709:	85 c0                	test   %eax,%eax
     70b:	0f 89 c5 fb ff ff    	jns    2d6 <pouch_cmd+0x1c6>

           if(unlink(cg_cname) < 0){
               return -1;
           }
           if(remove_from_pconf(tty_name) < 0)
               return -1;
     711:	83 c8 ff             	or     $0xffffffff,%eax
     714:	e9 f4 fa ff ff       	jmp    20d <pouch_cmd+0xfd>
            printf(stderr,"started \n");
        }
        close(tty_fd);
    }
    if(!is_empty_flag){
        printf(stderr,"None.\n");
     719:	57                   	push   %edi
     71a:	57                   	push   %edi
     71b:	68 ab 25 00 00       	push   $0x25ab
     720:	6a 02                	push   $0x2
     722:	e8 59 13 00 00       	call   1a80 <printf>
     727:	83 c4 10             	add    $0x10,%esp

        if(cmd == INFO){
            if(print_cinfo(container_name, tty_name, pid) <0){
                return -1;
            }
            return 0;
     72a:	31 c0                	xor    %eax,%eax
     72c:	e9 dc fa ff ff       	jmp    20d <pouch_cmd+0xfd>
        }
        if(!buf[0]){
            continue;
        }
        is_empty_flag = 1;
        printf(stderr,"%d. %s : ",id++, buf);
     731:	8b 85 c8 fc ff ff    	mov    -0x338(%ebp),%eax
     737:	ff b5 d4 fc ff ff    	pushl  -0x32c(%ebp)
     73d:	8d 48 01             	lea    0x1(%eax),%ecx
     740:	50                   	push   %eax
     741:	68 8b 25 00 00       	push   $0x258b
     746:	6a 02                	push   $0x2
     748:	89 8d cc fc ff ff    	mov    %ecx,-0x334(%ebp)
     74e:	e8 2d 13 00 00       	call   1a80 <printf>
     753:	8b 85 d4 fc ff ff    	mov    -0x32c(%ebp),%eax
     759:	83 c4 10             	add    $0x10,%esp
     75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
*   Helper functions
*/
static void empty_string(char * string, int length)
{
    for (int i = 0; i < length; i++)
        string[i] = 0;
     760:	c6 00 00             	movb   $0x0,(%eax)
     763:	83 c0 01             	add    $0x1,%eax
/*
*   Helper functions
*/
static void empty_string(char * string, int length)
{
    for (int i = 0; i < length; i++)
     766:	39 c7                	cmp    %eax,%edi
     768:	75 f6                	jne    760 <pouch_cmd+0x650>
        }
        is_empty_flag = 1;
        printf(stderr,"%d. %s : ",id++, buf);
        empty_string(buf, sizeof(buf));

        if(is_connected_tty(tty_fd)){
     76a:	83 ec 0c             	sub    $0xc,%esp
     76d:	56                   	push   %esi
     76e:	e8 5d 16 00 00       	call   1dd0 <is_connected_tty>
     773:	83 c4 10             	add    $0x10,%esp
     776:	85 c0                	test   %eax,%eax
     778:	0f 84 00 02 00 00    	je     97e <pouch_cmd+0x86e>
            printf(stderr,"connected \n");
     77e:	50                   	push   %eax
     77f:	50                   	push   %eax
     780:	68 95 25 00 00       	push   $0x2595
     785:	6a 02                	push   $0x2
     787:	e8 f4 12 00 00       	call   1a80 <printf>
     78c:	83 c4 10             	add    $0x10,%esp
        }else{
            printf(stderr,"started \n");
        }
        close(tty_fd);
     78f:	83 ec 0c             	sub    $0xc,%esp
     792:	56                   	push   %esi
     793:	e8 58 11 00 00       	call   18f0 <close>
        }
        if(!buf[0]){
            continue;
        }
        is_empty_flag = 1;
        printf(stderr,"%d. %s : ",id++, buf);
     798:	8b 85 cc fc ff ff    	mov    -0x334(%ebp),%eax
        if(is_connected_tty(tty_fd)){
            printf(stderr,"connected \n");
        }else{
            printf(stderr,"started \n");
        }
        close(tty_fd);
     79e:	83 c4 10             	add    $0x10,%esp
            return -1;
        }
        if(!buf[0]){
            continue;
        }
        is_empty_flag = 1;
     7a1:	c7 85 cc fc ff ff 01 	movl   $0x1,-0x334(%ebp)
     7a8:	00 00 00 
        printf(stderr,"%d. %s : ",id++, buf);
     7ab:	89 85 c8 fc ff ff    	mov    %eax,-0x338(%ebp)
     7b1:	e9 0b fb ff ff       	jmp    2c1 <pouch_cmd+0x1b1>
        if((tty_fd = open(tty_name, O_RDWR)) < 0){
           printf(stderr, "cannot open tty: %s\n",tty_name);
           return -1;
        }

        if(cmd == DESTROY && pid != 0){
     7b6:	85 ff                	test   %edi,%edi
     7b8:	0f 84 41 fa ff ff    	je     1ff <pouch_cmd+0xef>

            // Return the process to root cgroup.
            char cur_pid_buf[10];
            int cgroup_procs_fd = open("/cgroup/cgroup.procs", O_RDWR);
     7be:	53                   	push   %ebx
     7bf:	53                   	push   %ebx
     7c0:	6a 02                	push   $0x2
     7c2:	68 4a 26 00 00       	push   $0x264a
     7c7:	89 85 cc fc ff ff    	mov    %eax,-0x334(%ebp)
     7cd:	e8 36 11 00 00       	call   1908 <open>
            itoa(cur_pid_buf, pid);
     7d2:	5e                   	pop    %esi

        if(cmd == DESTROY && pid != 0){

            // Return the process to root cgroup.
            char cur_pid_buf[10];
            int cgroup_procs_fd = open("/cgroup/cgroup.procs", O_RDWR);
     7d3:	89 c3                	mov    %eax,%ebx
            itoa(cur_pid_buf, pid);
     7d5:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
     7db:	58                   	pop    %eax
     7dc:	57                   	push   %edi
     7dd:	56                   	push   %esi
     7de:	e8 0d 0f 00 00       	call   16f0 <itoa>
            if(write(cgroup_procs_fd, cur_pid_buf, sizeof(cur_pid_buf)) < 0)
     7e3:	83 c4 0c             	add    $0xc,%esp
     7e6:	6a 0a                	push   $0xa
     7e8:	56                   	push   %esi
     7e9:	53                   	push   %ebx
     7ea:	e8 f9 10 00 00       	call   18e8 <write>
     7ef:	83 c4 10             	add    $0x10,%esp
     7f2:	85 c0                	test   %eax,%eax
     7f4:	8b 95 cc fc ff ff    	mov    -0x334(%ebp),%edx
     7fa:	0f 88 11 ff ff ff    	js     711 <pouch_cmd+0x601>
                return -1;
            if(close(cgroup_procs_fd) < 0)
     800:	83 ec 0c             	sub    $0xc,%esp
     803:	89 95 cc fc ff ff    	mov    %edx,-0x334(%ebp)
     809:	53                   	push   %ebx
     80a:	e8 e1 10 00 00       	call   18f0 <close>
     80f:	83 c4 10             	add    $0x10,%esp
     812:	85 c0                	test   %eax,%eax
     814:	0f 88 f7 fe ff ff    	js     711 <pouch_cmd+0x601>
                return -1;

           if(kill(pid) < 0){
     81a:	83 ec 0c             	sub    $0xc,%esp
     81d:	57                   	push   %edi
     81e:	e8 d5 10 00 00       	call   18f8 <kill>
     823:	83 c4 10             	add    $0x10,%esp
     826:	85 c0                	test   %eax,%eax
     828:	0f 88 e3 fe ff ff    	js     711 <pouch_cmd+0x601>
                return -1;
           }
           if(unlink(container_name) < 0)
     82e:	8b b5 d0 fc ff ff    	mov    -0x330(%ebp),%esi
     834:	83 ec 0c             	sub    $0xc,%esp
     837:	56                   	push   %esi
     838:	e8 db 10 00 00       	call   1918 <unlink>
     83d:	83 c4 10             	add    $0x10,%esp
     840:	85 c0                	test   %eax,%eax
     842:	0f 88 c9 fe ff ff    	js     711 <pouch_cmd+0x601>
    printf(1, "Pouch: %s cgroup applied \n",container_name);
    return 0;
}

static int prepare_cgroup_cname(char* container_name, char* cg_cname){
    strcpy(cg_cname,"/cgroup/");
     848:	8b 9d d4 fc ff ff    	mov    -0x32c(%ebp),%ebx
     84e:	50                   	push   %eax
     84f:	50                   	push   %eax
     850:	68 a8 24 00 00       	push   $0x24a8
     855:	53                   	push   %ebx
     856:	e8 d5 0b 00 00       	call   1430 <strcpy>
    strcat(cg_cname, container_name);
     85b:	5a                   	pop    %edx
     85c:	59                   	pop    %ecx
     85d:	56                   	push   %esi
     85e:	53                   	push   %ebx
     85f:	e8 3c 0f 00 00       	call   17a0 <strcat>
           if(unlink(container_name) < 0)
               return -1;

           prepare_cgroup_cname(container_name,cg_cname);

           if(unlink(cg_cname) < 0){
     864:	89 1c 24             	mov    %ebx,(%esp)
     867:	e8 ac 10 00 00       	call   1918 <unlink>
     86c:	83 c4 10             	add    $0x10,%esp
     86f:	85 c0                	test   %eax,%eax
     871:	0f 88 9a fe ff ff    	js     711 <pouch_cmd+0x601>
}

static int remove_from_pconf(char * ttyname){
    char ttyc[] = "tty.cX";
    int ttyc_fd;
    ttyc[5] = ttyname[4];
     877:	0f b6 85 e2 fc ff ff 	movzbl -0x31e(%ebp),%eax
    if((ttyc_fd = open(ttyc, O_RDWR)) < 0){
     87e:	8d 9d e8 fc ff ff    	lea    -0x318(%ebp),%ebx
    close(ttyc_fd);
    return 0;
}

static int remove_from_pconf(char * ttyname){
    char ttyc[] = "tty.cX";
     884:	8d bd e8 fc ff ff    	lea    -0x318(%ebp),%edi
     88a:	be ab 26 00 00       	mov    $0x26ab,%esi
     88f:	b9 07 00 00 00       	mov    $0x7,%ecx
     894:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
    int ttyc_fd;
    ttyc[5] = ttyname[4];
     896:	88 85 ed fc ff ff    	mov    %al,-0x313(%ebp)
    if((ttyc_fd = open(ttyc, O_RDWR)) < 0){
     89c:	50                   	push   %eax
     89d:	50                   	push   %eax
     89e:	6a 02                	push   $0x2
     8a0:	53                   	push   %ebx
     8a1:	e8 62 10 00 00       	call   1908 <open>
     8a6:	83 c4 10             	add    $0x10,%esp
     8a9:	85 c0                	test   %eax,%eax
     8ab:	8b 95 cc fc ff ff    	mov    -0x334(%ebp),%edx
     8b1:	0f 88 fa 03 00 00    	js     cb1 <pouch_cmd+0xba1>
        printf(stderr, "cannot open %s fd\n", ttyc);
        return -1;
    }
    if(unlink(ttyc) < 0)
     8b7:	83 ec 0c             	sub    $0xc,%esp
     8ba:	89 95 d4 fc ff ff    	mov    %edx,-0x32c(%ebp)
     8c0:	53                   	push   %ebx
     8c1:	e8 52 10 00 00       	call   1918 <unlink>
     8c6:	83 c4 10             	add    $0x10,%esp
     8c9:	85 c0                	test   %eax,%eax
     8cb:	0f 88 40 fe ff ff    	js     711 <pouch_cmd+0x601>
        return -1;
    if((ttyc_fd = open(ttyc, O_CREATE|O_RDWR)) < 0){
     8d1:	50                   	push   %eax
     8d2:	50                   	push   %eax
     8d3:	68 02 02 00 00       	push   $0x202
     8d8:	53                   	push   %ebx
     8d9:	e8 2a 10 00 00       	call   1908 <open>
     8de:	83 c4 10             	add    $0x10,%esp
     8e1:	85 c0                	test   %eax,%eax
     8e3:	0f 88 c8 03 00 00    	js     cb1 <pouch_cmd+0xba1>
        printf(stderr, "cannot open %s fd\n", ttyc);
        return -1;
    }
    close(ttyc_fd);
     8e9:	83 ec 0c             	sub    $0xc,%esp
     8ec:	50                   	push   %eax
     8ed:	e8 fe 0f 00 00       	call   18f0 <close>
               return -1;
           }
           if(remove_from_pconf(tty_name) < 0)
               return -1;

           if(is_connected_tty(tty_fd)){
     8f2:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     8f8:	89 14 24             	mov    %edx,(%esp)
     8fb:	e8 d0 14 00 00       	call   1dd0 <is_connected_tty>
     900:	83 c4 10             	add    $0x10,%esp
     903:	85 c0                	test   %eax,%eax
     905:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     90b:	74 20                	je     92d <pouch_cmd+0x81d>
               if(disconnect_tty(tty_fd) < 0)
     90d:	83 ec 0c             	sub    $0xc,%esp
     910:	89 95 d4 fc ff ff    	mov    %edx,-0x32c(%ebp)
     916:	52                   	push   %edx
     917:	e8 c4 15 00 00       	call   1ee0 <disconnect_tty>
     91c:	83 c4 10             	add    $0x10,%esp
     91f:	85 c0                	test   %eax,%eax
     921:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     927:	0f 88 e4 fd ff ff    	js     711 <pouch_cmd+0x601>
                   return -1;
           }
           if(detach_tty(tty_fd) < 0)
     92d:	83 ec 0c             	sub    $0xc,%esp
     930:	89 95 d4 fc ff ff    	mov    %edx,-0x32c(%ebp)
     936:	52                   	push   %edx
     937:	e8 34 15 00 00       	call   1e70 <detach_tty>
     93c:	83 c4 10             	add    $0x10,%esp
     93f:	85 c0                	test   %eax,%eax
     941:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     947:	0f 88 c4 fd ff ff    	js     711 <pouch_cmd+0x601>
               return -1;
           if(close(tty_fd) < 0)
     94d:	83 ec 0c             	sub    $0xc,%esp
     950:	52                   	push   %edx
     951:	e8 9a 0f 00 00       	call   18f0 <close>
     956:	83 c4 10             	add    $0x10,%esp
     959:	85 c0                	test   %eax,%eax
     95b:	0f 88 b0 fd ff ff    	js     711 <pouch_cmd+0x601>
               return -1;

           printf(1, "Pouch: %s destroyed\n",container_name);
     961:	50                   	push   %eax
     962:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     968:	68 5f 26 00 00       	push   $0x265f
     96d:	6a 01                	push   $0x1
     96f:	e8 0c 11 00 00       	call   1a80 <printf>
           return 0;
     974:	83 c4 10             	add    $0x10,%esp
     977:	31 c0                	xor    %eax,%eax
     979:	e9 8f f8 ff ff       	jmp    20d <pouch_cmd+0xfd>
        empty_string(buf, sizeof(buf));

        if(is_connected_tty(tty_fd)){
            printf(stderr,"connected \n");
        }else{
            printf(stderr,"started \n");
     97e:	50                   	push   %eax
     97f:	50                   	push   %eax
     980:	68 a1 25 00 00       	push   $0x25a1
     985:	6a 02                	push   $0x2
     987:	e8 f4 10 00 00       	call   1a80 <printf>
     98c:	83 c4 10             	add    $0x10,%esp
     98f:	e9 fb fd ff ff       	jmp    78f <pouch_cmd+0x67f>
        }



        if(cmd == CONNECT){
            if(!is_connected_tty(tty_fd)){
     994:	83 ec 0c             	sub    $0xc,%esp
     997:	89 85 d4 fc ff ff    	mov    %eax,-0x32c(%ebp)
     99d:	50                   	push   %eax
     99e:	e8 2d 14 00 00       	call   1dd0 <is_connected_tty>
     9a3:	83 c4 10             	add    $0x10,%esp
     9a6:	85 c0                	test   %eax,%eax
     9a8:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     9ae:	75 7e                	jne    a2e <pouch_cmd+0x91e>
                if(connect_tty(tty_fd) < 0){
     9b0:	83 ec 0c             	sub    $0xc,%esp
     9b3:	52                   	push   %edx
     9b4:	e8 d7 14 00 00       	call   1e90 <connect_tty>
     9b9:	83 c4 10             	add    $0x10,%esp
     9bc:	85 c0                	test   %eax,%eax
     9be:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     9c4:	0f 89 35 f8 ff ff    	jns    1ff <pouch_cmd+0xef>
                     close(tty_fd);
     9ca:	83 ec 0c             	sub    $0xc,%esp
     9cd:	52                   	push   %edx
     9ce:	e8 1d 0f 00 00       	call   18f0 <close>
                     printf(stderr, "cannot connect to the tty\n");
     9d3:	5f                   	pop    %edi
     9d4:	58                   	pop    %eax
     9d5:	68 74 26 00 00       	push   $0x2674
     9da:	6a 02                	push   $0x2
     9dc:	e8 9f 10 00 00       	call   1a80 <printf>
                     return -1;
     9e1:	83 c4 10             	add    $0x10,%esp
     9e4:	83 c8 ff             	or     $0xffffffff,%eax
     9e7:	e9 21 f8 ff ff       	jmp    20d <pouch_cmd+0xfd>
                }
            }else{
                printf(1, "Pouch: %s is already connected\n",container_name);
            }

        }else if(cmd == DISCONNECT && disconnect_tty(tty_fd) < 0){
     9ec:	83 ec 0c             	sub    $0xc,%esp
     9ef:	89 85 d4 fc ff ff    	mov    %eax,-0x32c(%ebp)
     9f5:	50                   	push   %eax
     9f6:	e8 e5 14 00 00       	call   1ee0 <disconnect_tty>
     9fb:	83 c4 10             	add    $0x10,%esp
     9fe:	85 c0                	test   %eax,%eax
     a00:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     a06:	0f 89 f3 f7 ff ff    	jns    1ff <pouch_cmd+0xef>
           close(tty_fd);
     a0c:	83 ec 0c             	sub    $0xc,%esp
     a0f:	52                   	push   %edx
     a10:	e8 db 0e 00 00       	call   18f0 <close>
           printf(stderr, "cannot disconnect from tty\n");
     a15:	59                   	pop    %ecx
     a16:	5b                   	pop    %ebx
     a17:	68 8f 26 00 00       	push   $0x268f
     a1c:	6a 02                	push   $0x2
     a1e:	e8 5d 10 00 00       	call   1a80 <printf>
           return -1;
     a23:	83 c4 10             	add    $0x10,%esp
     a26:	83 c8 ff             	or     $0xffffffff,%eax
     a29:	e9 df f7 ff ff       	jmp    20d <pouch_cmd+0xfd>
                     close(tty_fd);
                     printf(stderr, "cannot connect to the tty\n");
                     return -1;
                }
            }else{
                printf(1, "Pouch: %s is already connected\n",container_name);
     a2e:	56                   	push   %esi
     a2f:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     a35:	68 b8 20 00 00       	push   $0x20b8
     a3a:	6a 01                	push   $0x1
     a3c:	89 95 d4 fc ff ff    	mov    %edx,-0x32c(%ebp)
     a42:	e8 39 10 00 00       	call   1a80 <printf>
     a47:	83 c4 10             	add    $0x10,%esp
     a4a:	8b 95 d4 fc ff ff    	mov    -0x32c(%ebp),%edx
     a50:	e9 aa f7 ff ff       	jmp    1ff <pouch_cmd+0xef>
}

static int create_pouch_cgroup(char *cg_cname, char *cname){

    if(mkdir(cg_cname) != 0){
        printf(stderr,"Pouch: Failed to create cgroup with the given name. Consider another container name: %s \n",cname);
     a55:	50                   	push   %eax
     a56:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     a5c:	68 98 1f 00 00       	push   $0x1f98
     a61:	6a 02                	push   $0x2
     a63:	e8 18 10 00 00       	call   1a80 <printf>
     a68:	83 c4 10             	add    $0x10,%esp
   }

   //Prepare cgroup name for container
   prepare_cgroup_cname(container_name,cg_cname);
   if(create_pouch_cgroup(cg_cname, container_name) <0)
      exit(1);
     a6b:	83 ec 0c             	sub    $0xc,%esp
     a6e:	6a 01                	push   $0x1
     a70:	e8 53 0e 00 00       	call   18c8 <exit>
        if(close(cpu_max_fd) < 0)
            return -1;
        if(close(cpu_stat_fd) < 0)
            return -1;
    }else{
        printf(1,"None.\n");
     a75:	50                   	push   %eax
     a76:	50                   	push   %eax
     a77:	68 ab 25 00 00       	push   $0x25ab
     a7c:	6a 01                	push   $0x1
     a7e:	e8 fd 0f 00 00       	call   1a80 <printf>
     a83:	83 c4 10             	add    $0x10,%esp

        if(cmd == INFO){
            if(print_cinfo(container_name, tty_name, pid) <0){
                return -1;
            }
            return 0;
     a86:	31 c0                	xor    %eax,%eax
     a88:	e9 80 f7 ff ff       	jmp    20d <pouch_cmd+0xfd>
    int cpu_max_fd = open(cgmax, O_RDWR);
    int cpu_stat_fd = open(cgstat, O_RDWR);
    int ppid = getppid();

    if(ppid == 1){
        printf(1, "     Pouch container- %s: connected\n",container_name);
     a8d:	53                   	push   %ebx
     a8e:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     a94:	68 6c 20 00 00       	push   $0x206c
     a99:	6a 01                	push   $0x1
     a9b:	e8 e0 0f 00 00       	call   1a80 <printf>
     aa0:	83 c4 10             	add    $0x10,%esp
     aa3:	e9 77 fb ff ff       	jmp    61f <pouch_cmd+0x50f>
      }else{

        //"Parent process - waiting for child

        // Move the current process to "/cgroup/<cname>" cgroup.
        strcat(cg_cname,"/cgroup.procs");
     aa8:	56                   	push   %esi
     aa9:	56                   	push   %esi
     aaa:	68 51 26 00 00       	push   $0x2651
     aaf:	53                   	push   %ebx
     ab0:	e8 eb 0c 00 00       	call   17a0 <strcat>
        int cgroup_procs_fd = open(cg_cname, O_RDWR);
     ab5:	58                   	pop    %eax
     ab6:	5a                   	pop    %edx
     ab7:	6a 02                	push   $0x2
     ab9:	53                   	push   %ebx
     aba:	e8 49 0e 00 00       	call   1908 <open>
        char cur_pid_buf[10];
        itoa(cur_pid_buf, pid);
     abf:	59                   	pop    %ecx
     ac0:	5e                   	pop    %esi
     ac1:	8b b5 d4 fc ff ff    	mov    -0x32c(%ebp),%esi
     ac7:	57                   	push   %edi

        //"Parent process - waiting for child

        // Move the current process to "/cgroup/<cname>" cgroup.
        strcat(cg_cname,"/cgroup.procs");
        int cgroup_procs_fd = open(cg_cname, O_RDWR);
     ac8:	89 c3                	mov    %eax,%ebx
        char cur_pid_buf[10];
        itoa(cur_pid_buf, pid);
     aca:	56                   	push   %esi
     acb:	e8 20 0c 00 00       	call   16f0 <itoa>
        if(write(cgroup_procs_fd, cur_pid_buf, sizeof(cur_pid_buf)) < 0)
     ad0:	83 c4 0c             	add    $0xc,%esp
     ad3:	6a 0a                	push   $0xa
     ad5:	56                   	push   %esi
     ad6:	53                   	push   %ebx
     ad7:	e8 0c 0e 00 00       	call   18e8 <write>
     adc:	83 c4 10             	add    $0x10,%esp
     adf:	85 c0                	test   %eax,%eax
     ae1:	0f 88 2a fc ff ff    	js     711 <pouch_cmd+0x601>
            return -1;
        if(close(cgroup_procs_fd) < 0)
     ae7:	83 ec 0c             	sub    $0xc,%esp
     aea:	53                   	push   %ebx
     aeb:	e8 00 0e 00 00       	call   18f0 <close>
     af0:	83 c4 10             	add    $0x10,%esp
     af3:	85 c0                	test   %eax,%eax
     af5:	0f 88 16 fc ff ff    	js     711 <pouch_cmd+0x601>
   close(cont_fd);
   return 0;
}

static int write_to_cconf(char* container_name, char* tty_name, int pid){
   int cont_fd = open(container_name, O_CREATE|O_RDWR);
     afb:	51                   	push   %ecx
     afc:	51                   	push   %ecx
     afd:	68 02 02 00 00       	push   $0x202
     b02:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     b08:	e8 fb 0d 00 00       	call   1908 <open>
   if(cont_fd < 0){
     b0d:	83 c4 10             	add    $0x10,%esp
     b10:	85 c0                	test   %eax,%eax
   close(cont_fd);
   return 0;
}

static int write_to_cconf(char* container_name, char* tty_name, int pid){
   int cont_fd = open(container_name, O_CREATE|O_RDWR);
     b12:	89 c3                	mov    %eax,%ebx
   if(cont_fd < 0){
     b14:	0f 88 7c 01 00 00    	js     c96 <pouch_cmd+0xb86>
        printf(stderr, "cannot open %s\n", container_name);
        return -1;
   }
   printf(cont_fd, "%s\nPPID: %d\nNAME: %s\n",tty_name, pid, container_name);
     b1a:	83 ec 0c             	sub    $0xc,%esp
     b1d:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     b23:	57                   	push   %edi
     b24:	ff b5 cc fc ff ff    	pushl  -0x334(%ebp)
     b2a:	68 3f 25 00 00       	push   $0x253f
     b2f:	50                   	push   %eax
     b30:	e8 4b 0f 00 00       	call   1a80 <printf>
   close(cont_fd);
     b35:	83 c4 14             	add    $0x14,%esp
     b38:	53                   	push   %ebx
     b39:	e8 b2 0d 00 00       	call   18f0 <close>
        if(write(cgroup_procs_fd, cur_pid_buf, sizeof(cur_pid_buf)) < 0)
            return -1;
        if(close(cgroup_procs_fd) < 0)
            return -1;
        if(write_to_cconf(container_name, tty_name, pid) >= 0)
           wait(0);
     b3e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b45:	e8 86 0d 00 00       	call   18d0 <wait>
     b4a:	83 c4 10             	add    $0x10,%esp



        exit(0);
     b4d:	83 ec 0c             	sub    $0xc,%esp
     b50:	6a 00                	push   $0x0
     b52:	e8 71 0d 00 00       	call   18c8 <exit>
      printf(stderr, "There is no container: %s in a started stage\n", container_name);
      exit(1);
    }

   if(read(cont_fd, tty_name, sizeof("/ttyX")) < sizeof("/ttyX")) {
      close(cont_fd);
     b57:	83 ec 0c             	sub    $0xc,%esp
     b5a:	56                   	push   %esi
     b5b:	e8 90 0d 00 00       	call   18f0 <close>
      printf(stderr,"CONT TTY NOT FOUND\n");
     b60:	58                   	pop    %eax
     b61:	5a                   	pop    %edx
     b62:	68 b2 25 00 00       	push   $0x25b2
     b67:	6a 02                	push   $0x2
     b69:	e8 12 0f 00 00       	call   1a80 <printf>
     b6e:	83 c4 10             	add    $0x10,%esp
     b71:	e9 9b fb ff ff       	jmp    711 <pouch_cmd+0x601>
   }

   tty_name[sizeof("/ttyX")-1] = 0;

   if(read(cont_fd, pid_str, sizeof(pid_str)) < sizeof("PPID:")+2) {
      close(cont_fd);
     b76:	83 ec 0c             	sub    $0xc,%esp
     b79:	56                   	push   %esi
     b7a:	e8 71 0d 00 00       	call   18f0 <close>
      printf(stderr,"CONT PID NOT FOUND\n");
     b7f:	59                   	pop    %ecx
     b80:	5b                   	pop    %ebx
     b81:	68 c6 25 00 00       	push   $0x25c6
     b86:	6a 02                	push   $0x2
     b88:	e8 f3 0e 00 00       	call   1a80 <printf>
     b8d:	83 c4 10             	add    $0x10,%esp
     b90:	e9 7c fb ff ff       	jmp    711 <pouch_cmd+0x601>
     b95:	8b b5 d0 fc ff ff    	mov    -0x330(%ebp),%esi

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        tty[4] = '0' + i;
        if((tty_fd = open(tty, O_RDWR)) < 0){
            printf(stderr, "cannot open %s fd\n", tty);
     b9b:	50                   	push   %eax
     b9c:	56                   	push   %esi
     b9d:	68 81 24 00 00       	push   $0x2481
     ba2:	6a 02                	push   $0x2
     ba4:	e8 d7 0e 00 00       	call   1a80 <printf>
     ba9:	83 c4 10             	add    $0x10,%esp
     bac:	e9 60 fb ff ff       	jmp    711 <pouch_cmd+0x601>
     bb1:	8b b5 d0 fc ff ff    	mov    -0x330(%ebp),%esi
            return -1;
        }
        if(read_from_pconf(tty,buf) <0 ){
            printf(stderr, "failed to read pconf from %s\n", tty);
     bb7:	50                   	push   %eax
     bb8:	56                   	push   %esi
     bb9:	68 6d 25 00 00       	push   $0x256d
     bbe:	6a 02                	push   $0x2
     bc0:	e8 bb 0e 00 00       	call   1a80 <printf>
     bc5:	83 c4 10             	add    $0x10,%esp
     bc8:	e9 44 fb ff ff       	jmp    711 <pouch_cmd+0x601>

        // Not including the console tty
        for(i=0; i < (MAX_TTY - 1); i++){
            tty[4] = '0' + i;
            if((tty_fd = open(tty, O_RDWR)) < 0){
                printf(stderr, "cannot open %s fd\n", tty);
     bcd:	51                   	push   %ecx
     bce:	ff b5 d4 fc ff ff    	pushl  -0x32c(%ebp)
     bd4:	68 81 24 00 00       	push   $0x2481
     bd9:	6a 02                	push   $0x2
     bdb:	e8 a0 0e 00 00       	call   1a80 <printf>
     be0:	83 c4 10             	add    $0x10,%esp
     be3:	e9 5f f7 ff ff       	jmp    347 <pouch_cmd+0x237>

   //Parent process forking child process
   if(!daemonize || (daemonize && (pid2 = fork()) == 0)){
      //Set up pid namespace before fork
      if(unshare(PID_NS) != 0){
        printf(stderr, "Cannot create pid namespace\n");
     be8:	56                   	push   %esi
     be9:	56                   	push   %esi
     bea:	68 e8 24 00 00       	push   $0x24e8
     bef:	6a 02                	push   $0x2
     bf1:	e8 8a 0e 00 00       	call   1a80 <printf>
     bf6:	83 c4 10             	add    $0x10,%esp
        return -1;
     bf9:	83 c8 ff             	or     $0xffffffff,%eax
     bfc:	e9 0c f6 ff ff       	jmp    20d <pouch_cmd+0xfd>
            }
            return 0;
        }

        if((tty_fd = open(tty_name, O_RDWR)) < 0){
           printf(stderr, "cannot open tty: %s\n",tty_name);
     c01:	50                   	push   %eax
     c02:	ff b5 cc fc ff ff    	pushl  -0x334(%ebp)
     c08:	68 35 26 00 00       	push   $0x2635
     c0d:	6a 02                	push   $0x2
     c0f:	e8 6c 0e 00 00       	call   1a80 <printf>
           return -1;
     c14:	83 c4 10             	add    $0x10,%esp
     c17:	83 c8 ff             	or     $0xffffffff,%eax
     c1a:	e9 ee f5 ff ff       	jmp    20d <pouch_cmd+0xfd>

   //update cname in pouch conf
   write_to_pconf(tty_name,container_name);

   if((tty_fd = open(tty_name, O_RDWR)) < 0){
      printf(stderr, "cannot open tty %s %d\n", tty_name, tty_fd);
     c1f:	50                   	push   %eax
     c20:	ff b5 cc fc ff ff    	pushl  -0x334(%ebp)
     c26:	68 d1 24 00 00       	push   $0x24d1
     c2b:	6a 02                	push   $0x2
     c2d:	e8 4e 0e 00 00       	call   1a80 <printf>
     c32:	83 c4 10             	add    $0x10,%esp
      return -1;
     c35:	83 c8 ff             	or     $0xffffffff,%eax
     c38:	e9 d0 f5 ff ff       	jmp    20d <pouch_cmd+0xfd>
static int write_to_pconf(char * ttyname, char * cname){
    char ttyc[] = "tty.cX";
    int ttyc_fd;
    ttyc[5] = ttyname[4];
    if((ttyc_fd = open(ttyc, O_CREATE | O_WRONLY)) < 0){
        printf(stderr, "cannot open %s fd\n", ttyc);
     c3d:	50                   	push   %eax
     c3e:	ff b5 d4 fc ff ff    	pushl  -0x32c(%ebp)
     c44:	68 81 24 00 00       	push   $0x2481
     c49:	6a 02                	push   $0x2
     c4b:	e8 30 0e 00 00       	call   1a80 <printf>
     c50:	83 c4 10             	add    $0x10,%esp
     c53:	e9 73 f8 ff ff       	jmp    4cb <pouch_cmd+0x3bb>
static int read_from_cconf(char* container_name, char* tty_name, int* pid){
   char pid_str[sizeof("PPID:") + 10];
   int cont_fd = open(container_name, 0);

   if(cont_fd < 0){
      printf(stderr, "There is no container: %s in a started stage\n", container_name);
     c58:	53                   	push   %ebx
     c59:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     c5f:	68 3c 20 00 00       	push   $0x203c
     c64:	6a 02                	push   $0x2
     c66:	e8 15 0e 00 00       	call   1a80 <printf>
      exit(1);
     c6b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c72:	e8 51 0c 00 00       	call   18c8 <exit>

   int cont_fd = open(container_name, 0);
   if(cont_fd < 0){
      printf(1, "Pouch: %s starting\n",container_name);
   }else{
      printf(stderr, "Pouch: %s container is already started\n", container_name);
     c77:	50                   	push   %eax
     c78:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     c7e:	68 f4 1f 00 00       	push   $0x1ff4
     c83:	6a 02                	push   $0x2
     c85:	e8 f6 0d 00 00       	call   1a80 <printf>
      exit(1);
     c8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c91:	e8 32 0c 00 00       	call   18c8 <exit>
}

static int write_to_cconf(char* container_name, char* tty_name, int pid){
   int cont_fd = open(container_name, O_CREATE|O_RDWR);
   if(cont_fd < 0){
        printf(stderr, "cannot open %s\n", container_name);
     c96:	52                   	push   %edx
     c97:	ff b5 d0 fc ff ff    	pushl  -0x330(%ebp)
     c9d:	68 2f 25 00 00       	push   $0x252f
     ca2:	6a 02                	push   $0x2
     ca4:	e8 d7 0d 00 00       	call   1a80 <printf>
     ca9:	83 c4 10             	add    $0x10,%esp
     cac:	e9 9c fe ff ff       	jmp    b4d <pouch_cmd+0xa3d>
static int remove_from_pconf(char * ttyname){
    char ttyc[] = "tty.cX";
    int ttyc_fd;
    ttyc[5] = ttyname[4];
    if((ttyc_fd = open(ttyc, O_RDWR)) < 0){
        printf(stderr, "cannot open %s fd\n", ttyc);
     cb1:	50                   	push   %eax
     cb2:	53                   	push   %ebx
     cb3:	68 81 24 00 00       	push   $0x2481
     cb8:	6a 02                	push   $0x2
     cba:	e8 c1 0d 00 00       	call   1a80 <printf>
     cbf:	83 c4 10             	add    $0x10,%esp
     cc2:	e9 4a fa ff ff       	jmp    711 <pouch_cmd+0x601>
        return -1;
      }

      pid = fork();
      if(pid == -1){
         panic("fork");
     cc7:	83 ec 0c             	sub    $0xc,%esp
     cca:	68 05 25 00 00       	push   $0x2505
     ccf:	e8 0c f4 ff ff       	call   e0 <panic>
            }

           //"Child process - setting up namespaces for the container
           // Set up mount namespace.
           if(unshare(MOUNT_NS) < 0) {
             printf(1, "Cannot create mount namespace\n");
     cd4:	51                   	push   %ecx
     cd5:	51                   	push   %ecx
     cd6:	68 1c 20 00 00       	push   $0x201c
     cdb:	6a 01                	push   $0x1
     cdd:	e8 9e 0d 00 00       	call   1a80 <printf>
             exit(1);
     ce2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ce9:	e8 da 0b 00 00       	call   18c8 <exit>

      if(pid == 0) {
         if(tty_fd != -1){
            //attach stderr stdin stdout
            if(attach_tty(tty_fd) < 0){
              printf(stderr,"attach failed");
     cee:	53                   	push   %ebx
     cef:	53                   	push   %ebx
     cf0:	68 0a 25 00 00       	push   $0x250a
     cf5:	6a 02                	push   $0x2
     cf7:	e8 84 0d 00 00       	call   1a80 <printf>
              exit(1);
     cfc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d03:	e8 c0 0b 00 00       	call   18c8 <exit>
     d08:	90                   	nop
     d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d10 <print_help_outside_cnt>:
    retval |= printf(stderr,"       pouch info\n");
    retval |= printf(stderr,"          : query information about currently connected container\n");
    return retval;
}

void print_help_outside_cnt(){
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	83 ec 10             	sub    $0x10,%esp
    printf(stderr,"\nPouch commands outside containers:\n");
     d16:	68 00 21 00 00       	push   $0x2100
     d1b:	6a 02                	push   $0x2
     d1d:	e8 5e 0d 00 00       	call   1a80 <printf>
    printf(stderr,"       pouch start {name}\n");
     d22:	58                   	pop    %eax
     d23:	5a                   	pop    %edx
     d24:	68 b2 26 00 00       	push   $0x26b2
     d29:	6a 02                	push   $0x2
     d2b:	e8 50 0d 00 00       	call   1a80 <printf>
    printf(stderr,"          : starts a new container\n");
     d30:	59                   	pop    %ecx
     d31:	58                   	pop    %eax
     d32:	68 28 21 00 00       	push   $0x2128
     d37:	6a 02                	push   $0x2
     d39:	e8 42 0d 00 00       	call   1a80 <printf>
    printf(stderr,"          - {name} : container name\n");
     d3e:	58                   	pop    %eax
     d3f:	5a                   	pop    %edx
     d40:	68 4c 21 00 00       	push   $0x214c
     d45:	6a 02                	push   $0x2
     d47:	e8 34 0d 00 00       	call   1a80 <printf>
    printf(stderr,"       pouch connect {name}\n");
     d4c:	59                   	pop    %ecx
     d4d:	58                   	pop    %eax
     d4e:	68 cd 26 00 00       	push   $0x26cd
     d53:	6a 02                	push   $0x2
     d55:	e8 26 0d 00 00       	call   1a80 <printf>
    printf(stderr,"          : connect already started container\n");
     d5a:	58                   	pop    %eax
     d5b:	5a                   	pop    %edx
     d5c:	68 74 21 00 00       	push   $0x2174
     d61:	6a 02                	push   $0x2
     d63:	e8 18 0d 00 00       	call   1a80 <printf>
    printf(stderr,"          - {name} : container name\n");
     d68:	59                   	pop    %ecx
     d69:	58                   	pop    %eax
     d6a:	68 4c 21 00 00       	push   $0x214c
     d6f:	6a 02                	push   $0x2
     d71:	e8 0a 0d 00 00       	call   1a80 <printf>
    printf(stderr,"       pouch destroy {name}\n");
     d76:	58                   	pop    %eax
     d77:	5a                   	pop    %edx
     d78:	68 ea 26 00 00       	push   $0x26ea
     d7d:	6a 02                	push   $0x2
     d7f:	e8 fc 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          : destroy a container\n");
     d84:	59                   	pop    %ecx
     d85:	58                   	pop    %eax
     d86:	68 a4 21 00 00       	push   $0x21a4
     d8b:	6a 02                	push   $0x2
     d8d:	e8 ee 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          - {name} : container name\n");
     d92:	58                   	pop    %eax
     d93:	5a                   	pop    %edx
     d94:	68 4c 21 00 00       	push   $0x214c
     d99:	6a 02                	push   $0x2
     d9b:	e8 e0 0c 00 00       	call   1a80 <printf>
    printf(stderr,"       pouch info {name}\n");
     da0:	59                   	pop    %ecx
     da1:	58                   	pop    %eax
     da2:	68 07 27 00 00       	push   $0x2707
     da7:	6a 02                	push   $0x2
     da9:	e8 d2 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          : query information about a container\n");
     dae:	58                   	pop    %eax
     daf:	5a                   	pop    %edx
     db0:	68 c8 21 00 00       	push   $0x21c8
     db5:	6a 02                	push   $0x2
     db7:	e8 c4 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          - {name} : container name\n");
     dbc:	59                   	pop    %ecx
     dbd:	58                   	pop    %eax
     dbe:	68 4c 21 00 00       	push   $0x214c
     dc3:	6a 02                	push   $0x2
     dc5:	e8 b6 0c 00 00       	call   1a80 <printf>
    printf(stderr,"       pouch list all\n");
     dca:	58                   	pop    %eax
     dcb:	5a                   	pop    %edx
     dcc:	68 21 27 00 00       	push   $0x2721
     dd1:	6a 02                	push   $0x2
     dd3:	e8 a8 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          : displays state of all created containers\n");
     dd8:	59                   	pop    %ecx
     dd9:	58                   	pop    %eax
     dda:	68 fc 21 00 00       	push   $0x21fc
     ddf:	6a 02                	push   $0x2
     de1:	e8 9a 0c 00 00       	call   1a80 <printf>
    printf(stderr,"      \ncontainers cgroups:\n");
     de6:	58                   	pop    %eax
     de7:	5a                   	pop    %edx
     de8:	68 38 27 00 00       	push   $0x2738
     ded:	6a 02                	push   $0x2
     def:	e8 8c 0c 00 00       	call   1a80 <printf>
    printf(stderr,"       pouch cgroup {cname} {state-object} [value]\n");
     df4:	59                   	pop    %ecx
     df5:	58                   	pop    %eax
     df6:	68 34 22 00 00       	push   $0x2234
     dfb:	6a 02                	push   $0x2
     dfd:	e8 7e 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          : limit given cgroup state-object\n");
     e02:	58                   	pop    %eax
     e03:	5a                   	pop    %edx
     e04:	68 68 22 00 00       	push   $0x2268
     e09:	6a 02                	push   $0x2
     e0b:	e8 70 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          - {name} : container name\n");
     e10:	59                   	pop    %ecx
     e11:	58                   	pop    %eax
     e12:	68 4c 21 00 00       	push   $0x214c
     e17:	6a 02                	push   $0x2
     e19:	e8 62 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          - {state-object} : cgroups state-object. Refer spec.\n");
     e1e:	58                   	pop    %eax
     e1f:	5a                   	pop    %edx
     e20:	68 98 22 00 00       	push   $0x2298
     e25:	6a 02                	push   $0x2
     e27:	e8 54 0c 00 00       	call   1a80 <printf>
    printf(stderr,"          - [value] : argument for the state-object, multiple values delimited by ','\n");
     e2c:	59                   	pop    %ecx
     e2d:	58                   	pop    %eax
     e2e:	68 d8 22 00 00       	push   $0x22d8
     e33:	6a 02                	push   $0x2
     e35:	e8 46 0c 00 00       	call   1a80 <printf>
}
     e3a:	83 c4 10             	add    $0x10,%esp
     e3d:	c9                   	leave  
     e3e:	c3                   	ret    
     e3f:	90                   	nop

00000e40 <main>:
    return 0;
}

int
main(int argc, char *argv[])
{
     e40:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     e44:	83 e4 f0             	and    $0xfffffff0,%esp
     e47:	ff 71 fc             	pushl  -0x4(%ecx)
     e4a:	55                   	push   %ebp
     e4b:	89 e5                	mov    %esp,%ebp
     e4d:	57                   	push   %edi
     e4e:	56                   	push   %esi
     e4f:	53                   	push   %ebx
     e50:	51                   	push   %ecx
     e51:	81 ec 88 01 00 00    	sub    $0x188,%esp
     e57:	8b 01                	mov    (%ecx),%eax
     e59:	8b 59 04             	mov    0x4(%ecx),%ebx
     e5c:	89 c7                	mov    %eax,%edi
     e5e:	89 85 70 fe ff ff    	mov    %eax,-0x190(%ebp)
  enum p_cmd cmd = START;
  char container_name[CNTNAMESIZE];

  // get parent pid
  int ppid = getppid();
     e64:	e8 37 0b 00 00       	call   19a0 <getppid>

  if(argc >= 3){
     e69:	83 ff 02             	cmp    $0x2,%edi
{
  enum p_cmd cmd = START;
  char container_name[CNTNAMESIZE];

  // get parent pid
  int ppid = getppid();
     e6c:	89 85 74 fe ff ff    	mov    %eax,-0x18c(%ebp)

  if(argc >= 3){
     e72:	7f 22                	jg     e96 <main+0x56>
         else
             print_help_outside_cnt();
        exit(0);
     }
     strcpy(container_name, argv[2]);
  }else if(argc == 2){
     e74:	0f 84 8c 01 00 00    	je     1006 <main+0x1c6>
  // get parent pid
  int ppid = getppid();

  if(argc >= 3){
     if((strcmp(argv[1],"--help") == 0) || (char)*argv[1] == '-'){
         if(ppid == 1)
     e7a:	83 bd 74 fe ff ff 01 	cmpl   $0x1,-0x18c(%ebp)
     e81:	0f 84 75 01 00 00    	je     ffc <main+0x1bc>
            print_help_inside_cnt();
         else
             print_help_outside_cnt();
     e87:	e8 84 fe ff ff       	call   d10 <print_help_outside_cnt>
        exit(0);
     e8c:	83 ec 0c             	sub    $0xc,%esp
     e8f:	6a 00                	push   $0x0
     e91:	e8 32 0a 00 00       	call   18c8 <exit>

  // get parent pid
  int ppid = getppid();

  if(argc >= 3){
     if((strcmp(argv[1],"--help") == 0) || (char)*argv[1] == '-'){
     e96:	50                   	push   %eax
     e97:	50                   	push   %eax
     e98:	68 54 27 00 00       	push   $0x2754
     e9d:	ff 73 04             	pushl  0x4(%ebx)
     ea0:	e8 bb 05 00 00       	call   1460 <strcmp>
     ea5:	83 c4 10             	add    $0x10,%esp
     ea8:	85 c0                	test   %eax,%eax
     eaa:	74 ce                	je     e7a <main+0x3a>
     eac:	8b 43 04             	mov    0x4(%ebx),%eax
     eaf:	80 38 2d             	cmpb   $0x2d,(%eax)
     eb2:	74 c6                	je     e7a <main+0x3a>
            print_help_inside_cnt();
         else
             print_help_outside_cnt();
        exit(0);
     }
     strcpy(container_name, argv[2]);
     eb4:	50                   	push   %eax
     eb5:	50                   	push   %eax
     eb6:	8d 85 84 fe ff ff    	lea    -0x17c(%ebp),%eax
     ebc:	ff 73 08             	pushl  0x8(%ebx)
     ebf:	50                   	push   %eax
     ec0:	e8 6b 05 00 00       	call   1430 <strcpy>
     ec5:	83 c4 10             	add    $0x10,%esp
    exit(0);
  }

  // get command type
  if(argc >= 2){
     if((strcmp(argv[1],"start")) == 0){
     ec8:	52                   	push   %edx
     ec9:	52                   	push   %edx
     eca:	68 5b 27 00 00       	push   $0x275b
     ecf:	ff 73 04             	pushl  0x4(%ebx)
     ed2:	e8 89 05 00 00       	call   1460 <strcmp>
     ed7:	83 c4 10             	add    $0x10,%esp
     eda:	85 c0                	test   %eax,%eax
     edc:	0f 84 df 01 00 00    	je     10c1 <main+0x281>
        cmd = START;
     }else if((strcmp(argv[1],"connect")) == 0){
     ee2:	50                   	push   %eax
     ee3:	50                   	push   %eax
     ee4:	68 64 27 00 00       	push   $0x2764
     ee9:	ff 73 04             	pushl  0x4(%ebx)
     eec:	e8 6f 05 00 00       	call   1460 <strcmp>
     ef1:	83 c4 10             	add    $0x10,%esp
     ef4:	85 c0                	test   %eax,%eax
        cmd = CONNECT;
     ef6:	c7 85 68 fe ff ff 01 	movl   $0x1,-0x198(%ebp)
     efd:	00 00 00 

  // get command type
  if(argc >= 2){
     if((strcmp(argv[1],"start")) == 0){
        cmd = START;
     }else if((strcmp(argv[1],"connect")) == 0){
     f00:	0f 85 a0 02 00 00    	jne    11a6 <main+0x366>
}

static int init_pouch_cgroup(){

    int cgroup_fd = -1;
    if((cgroup_fd = open("/cgroup", O_RDWR)) < 0){
     f06:	51                   	push   %ecx
     f07:	51                   	push   %ecx
     f08:	6a 02                	push   $0x2
     f0a:	68 82 27 00 00       	push   $0x2782
     f0f:	e8 f4 09 00 00       	call   1908 <open>
     f14:	83 c4 10             	add    $0x10,%esp
     f17:	85 c0                	test   %eax,%eax
     f19:	0f 88 c8 02 00 00    	js     11e7 <main+0x3a7>
        if(mount(0, "/cgroup", "cgroup") != 0){
            printf(1, "Pouch: Failed to mount cgroup fs.\n");
            return -1;
        }
    }else{
        if(close(cgroup_fd) < 0)
     f1f:	83 ec 0c             	sub    $0xc,%esp
     f22:	50                   	push   %eax
     f23:	e8 c8 09 00 00       	call   18f0 <close>
     f28:	83 c4 10             	add    $0x10,%esp
     f2b:	85 c0                	test   %eax,%eax
     f2d:	0f 88 fa 02 00 00    	js     122d <main+0x3ed>

static int init_pouch_conf(){
    //create a file for eacth tty that will hold cname inside currently connected to it
    int i;
    int ttyc_fd;
    char ttyc[] = "tty.cX";
     f33:	8d bd e8 fe ff ff    	lea    -0x118(%ebp),%edi
     f39:	be ab 26 00 00       	mov    $0x26ab,%esi
     f3e:	b9 07 00 00 00       	mov    $0x7,%ecx
     f43:	89 f8                	mov    %edi,%eax
     f45:	89 bd 6c fe ff ff    	mov    %edi,-0x194(%ebp)
     f4b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
     f4d:	be 30 00 00 00       	mov    $0x30,%esi
     f52:	89 df                	mov    %ebx,%edi
     f54:	89 f3                	mov    %esi,%ebx
     f56:	89 c6                	mov    %eax,%esi

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        ttyc[5] = '0' + i;
        if((ttyc_fd = open(ttyc, O_CREATE|O_RDWR)) < 0){
     f58:	50                   	push   %eax
     f59:	50                   	push   %eax
     f5a:	68 02 02 00 00       	push   $0x202
     f5f:	56                   	push   %esi
    int ttyc_fd;
    char ttyc[] = "tty.cX";

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        ttyc[5] = '0' + i;
     f60:	88 9d ed fe ff ff    	mov    %bl,-0x113(%ebp)
        if((ttyc_fd = open(ttyc, O_CREATE|O_RDWR)) < 0){
     f66:	e8 9d 09 00 00       	call   1908 <open>
     f6b:	83 c4 10             	add    $0x10,%esp
     f6e:	85 c0                	test   %eax,%eax
     f70:	0f 88 3a 03 00 00    	js     12b0 <main+0x470>
            printf(stderr, "cannot open %s fd\n", ttyc);
            return -1;
        }
        if(close(ttyc_fd) < 0)
     f76:	83 ec 0c             	sub    $0xc,%esp
     f79:	50                   	push   %eax
     f7a:	e8 71 09 00 00       	call   18f0 <close>
     f7f:	83 c4 10             	add    $0x10,%esp
     f82:	85 c0                	test   %eax,%eax
     f84:	0f 88 d6 02 00 00    	js     1260 <main+0x420>
     f8a:	83 c3 01             	add    $0x1,%ebx
    int i;
    int ttyc_fd;
    char ttyc[] = "tty.cX";

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
     f8d:	80 fb 33             	cmp    $0x33,%bl
     f90:	75 c6                	jne    f58 <main+0x118>
         printf(1, "Pouch: operation failed.\n");
         exit(1);
     }

     // Inside the container the are only few commands permitted, disable others.
     if(ppid == 1 && cmd != LIMIT && cmd != DISCONNECT /* && cmd != LIST*/
     f92:	8b 85 68 fe ff ff    	mov    -0x198(%ebp),%eax
     f98:	89 fb                	mov    %edi,%ebx
     f9a:	83 e8 04             	sub    $0x4,%eax
     f9d:	83 f8 01             	cmp    $0x1,%eax
     fa0:	0f 86 2a 01 00 00    	jbe    10d0 <main+0x290>
     fa6:	83 bd 74 fe ff ff 01 	cmpl   $0x1,-0x18c(%ebp)
     fad:	0f 85 1d 01 00 00    	jne    10d0 <main+0x290>
             && cmd != INFO){
     fb3:	8b 85 68 fe ff ff    	mov    -0x198(%ebp),%eax
     fb9:	83 f8 02             	cmp    $0x2,%eax
     fbc:	0f 84 85 02 00 00    	je     1247 <main+0x407>
         if(cmd == START){
     fc2:	83 f8 01             	cmp    $0x1,%eax
     fc5:	0f 86 cb 02 00 00    	jbe    1296 <main+0x456>
         }
         else if(cmd == CONNECT){
             printf(1, "Nesting containers is not supported.\n");
             exit(1);
         }
         else if(cmd == DESTROY){
     fcb:	83 bd 68 fe ff ff 03 	cmpl   $0x3,-0x198(%ebp)
     fd2:	0f 84 af 03 00 00    	je     1387 <main+0x547>
             printf(1, "Container can't be destroyed while connected.\n");
             exit(1);
         }else if(cmd == LIST){
     fd8:	83 bd 68 fe ff ff 06 	cmpl   $0x6,-0x198(%ebp)
     fdf:	0f 85 a7 fe ff ff    	jne    e8c <main+0x4c>
             if (print_help_inside_cnt() < 0) {
     fe5:	e8 16 f0 ff ff       	call   0 <print_help_inside_cnt>
     fea:	85 c0                	test   %eax,%eax
     fec:	0f 89 9a fe ff ff    	jns    e8c <main+0x4c>
         }
     }else{
         //command execution
         if(cmd == LIMIT && argc == 5){
             if(pouch_limit_cgroup(container_name, argv[3], argv[4]) < 0){
                 exit(1);
     ff2:	83 ec 0c             	sub    $0xc,%esp
     ff5:	6a 01                	push   $0x1
     ff7:	e8 cc 08 00 00       	call   18c8 <exit>
  int ppid = getppid();

  if(argc >= 3){
     if((strcmp(argv[1],"--help") == 0) || (char)*argv[1] == '-'){
         if(ppid == 1)
            print_help_inside_cnt();
     ffc:	e8 ff ef ff ff       	call   0 <print_help_inside_cnt>
    1001:	e9 86 fe ff ff       	jmp    e8c <main+0x4c>
             print_help_outside_cnt();
        exit(0);
     }
     strcpy(container_name, argv[2]);
  }else if(argc == 2){
      if(ppid == 1 && get_connected_cname(container_name) < 0){
    1006:	83 bd 74 fe ff ff 01 	cmpl   $0x1,-0x18c(%ebp)
    100d:	0f 85 74 fe ff ff    	jne    e87 <main+0x47>

static int get_connected_cname(char * cname){
    int i;
    int tty_fd;
    char tty[] = "/ttyX";
    char buf[CNTNAMESIZE] = {0};
    1013:	8d bd e8 fe ff ff    	lea    -0x118(%ebp),%edi
    1019:	b9 19 00 00 00       	mov    $0x19,%ecx
    101e:	31 c0                	xor    %eax,%eax
}

static int get_connected_cname(char * cname){
    int i;
    int tty_fd;
    char tty[] = "/ttyX";
    1020:	c7 85 7e fe ff ff 2f 	movl   $0x7974742f,-0x182(%ebp)
    1027:	74 74 79 
    102a:	66 c7 85 82 fe ff ff 	movw   $0x58,-0x17e(%ebp)
    1031:	58 00 
    char buf[CNTNAMESIZE] = {0};
    1033:	89 bd 6c fe ff ff    	mov    %edi,-0x194(%ebp)
    1039:	f3 ab                	rep stos %eax,%es:(%edi)
    103b:	bf 30 00 00 00       	mov    $0x30,%edi
            printf(stderr, "cannot open %s fd\n", tty);
            return -1;
        }
        read_from_pconf(tty,buf);
        if(is_connected_tty(tty_fd)){
            strcpy(cname,buf);
    1040:	89 fe                	mov    %edi,%esi
    1042:	89 df                	mov    %ebx,%edi
    char tty[] = "/ttyX";
    char buf[CNTNAMESIZE] = {0};

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        tty[4] = '0' + i;
    1044:	89 f0                	mov    %esi,%eax
    1046:	88 85 82 fe ff ff    	mov    %al,-0x17e(%ebp)
        if((tty_fd = open(tty, O_RDWR)) < 0){
    104c:	50                   	push   %eax
    104d:	50                   	push   %eax
    104e:	8d 85 7e fe ff ff    	lea    -0x182(%ebp),%eax
    1054:	6a 02                	push   $0x2
    1056:	50                   	push   %eax
    1057:	e8 ac 08 00 00       	call   1908 <open>
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	85 c0                	test   %eax,%eax
    1061:	89 c3                	mov    %eax,%ebx
    1063:	0f 88 02 03 00 00    	js     136b <main+0x52b>
            printf(stderr, "cannot open %s fd\n", tty);
            return -1;
        }
        read_from_pconf(tty,buf);
    1069:	8b 95 6c fe ff ff    	mov    -0x194(%ebp),%edx
    106f:	8d 85 7e fe ff ff    	lea    -0x182(%ebp),%eax
    1075:	e8 e6 ef ff ff       	call   60 <read_from_pconf>
        if(is_connected_tty(tty_fd)){
    107a:	83 ec 0c             	sub    $0xc,%esp
    107d:	53                   	push   %ebx
    107e:	e8 4d 0d 00 00       	call   1dd0 <is_connected_tty>
    1083:	83 c4 10             	add    $0x10,%esp
    1086:	85 c0                	test   %eax,%eax
    1088:	0f 85 ec 01 00 00    	jne    127a <main+0x43a>
            strcpy(cname,buf);
        }
        close(tty_fd);
    108e:	83 ec 0c             	sub    $0xc,%esp
    1091:	83 c6 01             	add    $0x1,%esi
    1094:	53                   	push   %ebx
    1095:	e8 56 08 00 00       	call   18f0 <close>
    int tty_fd;
    char tty[] = "/ttyX";
    char buf[CNTNAMESIZE] = {0};

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
    109a:	89 f0                	mov    %esi,%eax
    109c:	83 c4 10             	add    $0x10,%esp
    109f:	3c 33                	cmp    $0x33,%al
    10a1:	75 a1                	jne    1044 <main+0x204>
        if(is_connected_tty(tty_fd)){
            strcpy(cname,buf);
        }
        close(tty_fd);
    }
    if(!buf[0]){
    10a3:	80 bd e8 fe ff ff 00 	cmpb   $0x0,-0x118(%ebp)
    10aa:	89 fb                	mov    %edi,%ebx
    10ac:	0f 85 16 fe ff ff    	jne    ec8 <main+0x88>
        exit(0);
     }
     strcpy(container_name, argv[2]);
  }else if(argc == 2){
      if(ppid == 1 && get_connected_cname(container_name) < 0){
          print_help_inside_cnt();
    10b2:	e8 49 ef ff ff       	call   0 <print_help_inside_cnt>
          exit(1);
    10b7:	83 ec 0c             	sub    $0xc,%esp
    10ba:	6a 01                	push   $0x1
    10bc:	e8 07 08 00 00       	call   18c8 <exit>
  }

  // get command type
  if(argc >= 2){
     if((strcmp(argv[1],"start")) == 0){
        cmd = START;
    10c1:	c7 85 68 fe ff ff 00 	movl   $0x0,-0x198(%ebp)
    10c8:	00 00 00 
    10cb:	e9 36 fe ff ff       	jmp    f06 <main+0xc6>
                exit(1);
             }
         }
     }else{
         //command execution
         if(cmd == LIMIT && argc == 5){
    10d0:	83 bd 68 fe ff ff 04 	cmpl   $0x4,-0x198(%ebp)
    10d7:	0f 85 6a 01 00 00    	jne    1247 <main+0x407>
    10dd:	83 bd 70 fe ff ff 05 	cmpl   $0x5,-0x190(%ebp)
    10e4:	0f 85 5d 01 00 00    	jne    1247 <main+0x407>
             if(pouch_limit_cgroup(container_name, argv[3], argv[4]) < 0){
    10ea:	8b 7b 0c             	mov    0xc(%ebx),%edi
    10ed:	8b 73 10             	mov    0x10(%ebx),%esi
    return 0;
}

static int prepare_cgroup_cname(char* container_name, char* cg_cname){
    strcpy(cg_cname,"/cgroup/");
    strcat(cg_cname, container_name);
    10f0:	8d 9d 84 fe ff ff    	lea    -0x17c(%ebp),%ebx
    printf(1, "Pouch: %s cgroup applied \n",container_name);
    return 0;
}

static int prepare_cgroup_cname(char* container_name, char* cg_cname){
    strcpy(cg_cname,"/cgroup/");
    10f6:	50                   	push   %eax
    10f7:	50                   	push   %eax
    10f8:	68 a8 24 00 00       	push   $0x24a8
    10fd:	ff b5 6c fe ff ff    	pushl  -0x194(%ebp)
    1103:	e8 28 03 00 00       	call   1430 <strcpy>
    strcat(cg_cname, container_name);
    1108:	58                   	pop    %eax
    1109:	5a                   	pop    %edx
    110a:	53                   	push   %ebx
    110b:	ff b5 6c fe ff ff    	pushl  -0x194(%ebp)
    1111:	e8 8a 06 00 00       	call   17a0 <strcat>
static int pouch_limit_cgroup(char* container_name, char* cgroup_state_obj, char * limitation){

    char cg_limit_cname[256];

    prepare_cgroup_cname(container_name,cg_limit_cname);
    strcat(cg_limit_cname, "/");
    1116:	59                   	pop    %ecx
    1117:	58                   	pop    %eax
    1118:	68 af 24 00 00       	push   $0x24af
    111d:	ff b5 6c fe ff ff    	pushl  -0x194(%ebp)
    1123:	e8 78 06 00 00       	call   17a0 <strcat>
    strcat(cg_limit_cname,cgroup_state_obj);
    1128:	58                   	pop    %eax
    1129:	5a                   	pop    %edx
    112a:	57                   	push   %edi
    112b:	ff b5 6c fe ff ff    	pushl  -0x194(%ebp)
    1131:	e8 6a 06 00 00       	call   17a0 <strcat>

    int cont_fd = open(container_name, 0);
    1136:	59                   	pop    %ecx
    1137:	5f                   	pop    %edi
    1138:	6a 00                	push   $0x0
    113a:	53                   	push   %ebx
    113b:	e8 c8 07 00 00       	call   1908 <open>
    if(cont_fd < 0){
    1140:	83 c4 10             	add    $0x10,%esp
    1143:	85 c0                	test   %eax,%eax
    1145:	0f 88 c8 02 00 00    	js     1413 <main+0x5d3>
       printf(stderr, "There is no container: %s in a started stage\n", container_name);
       exit(1);
    }
    int cname_fd = open(cg_limit_cname, O_RDWR);
    114b:	50                   	push   %eax
    114c:	50                   	push   %eax
    114d:	6a 02                	push   $0x2
    114f:	ff b5 6c fe ff ff    	pushl  -0x194(%ebp)
    1155:	e8 ae 07 00 00       	call   1908 <open>
    if(cname_fd < 0){
    115a:	83 c4 10             	add    $0x10,%esp
    115d:	85 c0                	test   %eax,%eax
    int cont_fd = open(container_name, 0);
    if(cont_fd < 0){
       printf(stderr, "There is no container: %s in a started stage\n", container_name);
       exit(1);
    }
    int cname_fd = open(cg_limit_cname, O_RDWR);
    115f:	89 c7                	mov    %eax,%edi
    if(cname_fd < 0){
    1161:	0f 88 92 02 00 00    	js     13f9 <main+0x5b9>
       printf(stderr, "Incorrect cgroup object-state provided. Not applied.\n", container_name);
       exit(1);
    }

    if(write(cname_fd, limitation, sizeof(limitation)) < 0)
    1167:	50                   	push   %eax
    1168:	6a 04                	push   $0x4
    116a:	56                   	push   %esi
    116b:	57                   	push   %edi
    116c:	e8 77 07 00 00       	call   18e8 <write>
    1171:	83 c4 10             	add    $0x10,%esp
    1174:	85 c0                	test   %eax,%eax
    1176:	0f 88 76 fe ff ff    	js     ff2 <main+0x1b2>
       return -1;
    if(close(cname_fd) < 0)
    117c:	83 ec 0c             	sub    $0xc,%esp
    117f:	57                   	push   %edi
    1180:	e8 6b 07 00 00       	call   18f0 <close>
    1185:	83 c4 10             	add    $0x10,%esp
    1188:	85 c0                	test   %eax,%eax
    118a:	0f 88 62 fe ff ff    	js     ff2 <main+0x1b2>
       return -1;
    printf(1, "Pouch: %s cgroup applied \n",container_name);
    1190:	51                   	push   %ecx
    1191:	53                   	push   %ebx
    1192:	68 8a 27 00 00       	push   $0x278a
    1197:	6a 01                	push   $0x1
    1199:	e8 e2 08 00 00       	call   1a80 <printf>
    119e:	83 c4 10             	add    $0x10,%esp
    11a1:	e9 e6 fc ff ff       	jmp    e8c <main+0x4c>
  if(argc >= 2){
     if((strcmp(argv[1],"start")) == 0){
        cmd = START;
     }else if((strcmp(argv[1],"connect")) == 0){
        cmd = CONNECT;
     }else if((strcmp(argv[1],"disconnect")) == 0){
    11a6:	50                   	push   %eax
    11a7:	50                   	push   %eax
    11a8:	68 61 27 00 00       	push   $0x2761
    11ad:	ff 73 04             	pushl  0x4(%ebx)
    11b0:	e8 ab 02 00 00       	call   1460 <strcmp>
    11b5:	83 c4 10             	add    $0x10,%esp
    11b8:	85 c0                	test   %eax,%eax
    11ba:	0f 85 17 01 00 00    	jne    12d7 <main+0x497>
        cmd = DISCONNECT;
        if(ppid != 1){
    11c0:	83 bd 74 fe ff ff 01 	cmpl   $0x1,-0x18c(%ebp)
    11c7:	0f 84 fb 00 00 00    	je     12c8 <main+0x488>
            printf(1, "Pouch: no container is connected\n");
    11cd:	50                   	push   %eax
    11ce:	50                   	push   %eax
    11cf:	68 30 23 00 00       	push   $0x2330
    11d4:	6a 01                	push   $0x1
    11d6:	e8 a5 08 00 00       	call   1a80 <printf>
            exit(1);
    11db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11e2:	e8 e1 06 00 00       	call   18c8 <exit>
static int init_pouch_cgroup(){

    int cgroup_fd = -1;
    if((cgroup_fd = open("/cgroup", O_RDWR)) < 0){

        if(mkdir("/cgroup") != 0){
    11e7:	83 ec 0c             	sub    $0xc,%esp
    11ea:	68 82 27 00 00       	push   $0x2782
    11ef:	e8 3c 07 00 00       	call   1930 <mkdir>
    11f4:	83 c4 10             	add    $0x10,%esp
    11f7:	85 c0                	test   %eax,%eax
    11f9:	0f 85 a2 01 00 00    	jne    13a1 <main+0x561>
            printf(1, "Pouch: Failed to create root cgroup.\n");
            return -1;
        }
        if(mount(0, "/cgroup", "cgroup") != 0){
    11ff:	50                   	push   %eax
    1200:	68 83 27 00 00       	push   $0x2783
    1205:	68 82 27 00 00       	push   $0x2782
    120a:	6a 00                	push   $0x0
    120c:	e8 57 07 00 00       	call   1968 <mount>
    1211:	83 c4 10             	add    $0x10,%esp
    1214:	85 c0                	test   %eax,%eax
    1216:	0f 84 17 fd ff ff    	je     f33 <main+0xf3>
            printf(1, "Pouch: Failed to mount cgroup fs.\n");
    121c:	50                   	push   %eax
    121d:	50                   	push   %eax
    121e:	68 7c 23 00 00       	push   $0x237c
    1223:	6a 01                	push   $0x1
    1225:	e8 56 08 00 00       	call   1a80 <printf>
    122a:	83 c4 10             	add    $0x10,%esp
            print_help_outside_cnt();
        exit(1);
     }

     if(init_pouch_cgroup() < 0){
         printf(1, "Pouch: cgroup operation failed.\n");
    122d:	52                   	push   %edx
    122e:	52                   	push   %edx
    122f:	68 30 24 00 00       	push   $0x2430
    1234:	6a 01                	push   $0x1
    1236:	e8 45 08 00 00       	call   1a80 <printf>
         exit(1);
    123b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1242:	e8 81 06 00 00       	call   18c8 <exit>
         //command execution
         if(cmd == LIMIT && argc == 5){
             if(pouch_limit_cgroup(container_name, argv[3], argv[4]) < 0){
                 exit(1);
             }
         }else if(pouch_cmd(container_name, cmd) < 0 ){
    1247:	8b 95 68 fe ff ff    	mov    -0x198(%ebp),%edx
    124d:	8d 85 84 fe ff ff    	lea    -0x17c(%ebp),%eax
    1253:	e8 b8 ee ff ff       	call   110 <pouch_cmd>
    1258:	85 c0                	test   %eax,%eax
    125a:	0f 89 2c fc ff ff    	jns    e8c <main+0x4c>
         printf(1, "Pouch: cgroup operation failed.\n");
         exit(1);
     }

     if(init_pouch_conf() < 0){
         printf(1, "Pouch: operation failed.\n");
    1260:	50                   	push   %eax
    1261:	50                   	push   %eax
    1262:	68 a5 27 00 00       	push   $0x27a5
    1267:	6a 01                	push   $0x1
    1269:	e8 12 08 00 00       	call   1a80 <printf>
         exit(1);
    126e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1275:	e8 4e 06 00 00       	call   18c8 <exit>
            printf(stderr, "cannot open %s fd\n", tty);
            return -1;
        }
        read_from_pconf(tty,buf);
        if(is_connected_tty(tty_fd)){
            strcpy(cname,buf);
    127a:	8d 85 84 fe ff ff    	lea    -0x17c(%ebp),%eax
    1280:	51                   	push   %ecx
    1281:	51                   	push   %ecx
    1282:	ff b5 6c fe ff ff    	pushl  -0x194(%ebp)
    1288:	50                   	push   %eax
    1289:	e8 a2 01 00 00       	call   1430 <strcpy>
    128e:	83 c4 10             	add    $0x10,%esp
    1291:	e9 f8 fd ff ff       	jmp    108e <main+0x24e>

     // Inside the container the are only few commands permitted, disable others.
     if(ppid == 1 && cmd != LIMIT && cmd != DISCONNECT /* && cmd != LIST*/
             && cmd != INFO){
         if(cmd == START){
             printf(1, "Nesting containers is not supported.\n");
    1296:	50                   	push   %eax
    1297:	50                   	push   %eax
    1298:	68 a0 23 00 00       	push   $0x23a0
    129d:	6a 01                	push   $0x1
    129f:	e8 dc 07 00 00       	call   1a80 <printf>
             exit(1);
    12a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12ab:	e8 18 06 00 00       	call   18c8 <exit>

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        ttyc[5] = '0' + i;
        if((ttyc_fd = open(ttyc, O_CREATE|O_RDWR)) < 0){
            printf(stderr, "cannot open %s fd\n", ttyc);
    12b0:	50                   	push   %eax
    12b1:	ff b5 6c fe ff ff    	pushl  -0x194(%ebp)
    12b7:	68 81 24 00 00       	push   $0x2481
    12bc:	6a 02                	push   $0x2
    12be:	e8 bd 07 00 00       	call   1a80 <printf>
    12c3:	83 c4 10             	add    $0x10,%esp
    12c6:	eb 98                	jmp    1260 <main+0x420>
     if((strcmp(argv[1],"start")) == 0){
        cmd = START;
     }else if((strcmp(argv[1],"connect")) == 0){
        cmd = CONNECT;
     }else if((strcmp(argv[1],"disconnect")) == 0){
        cmd = DISCONNECT;
    12c8:	c7 85 68 fe ff ff 02 	movl   $0x2,-0x198(%ebp)
    12cf:	00 00 00 
    12d2:	e9 2f fc ff ff       	jmp    f06 <main+0xc6>
        if(ppid != 1){
            printf(1, "Pouch: no container is connected\n");
            exit(1);
        }
     }else if((strcmp(argv[1],"destroy")) == 0){
    12d7:	50                   	push   %eax
    12d8:	50                   	push   %eax
    12d9:	68 6c 27 00 00       	push   $0x276c
    12de:	ff 73 04             	pushl  0x4(%ebx)
    12e1:	e8 7a 01 00 00       	call   1460 <strcmp>
    12e6:	83 c4 10             	add    $0x10,%esp
    12e9:	85 c0                	test   %eax,%eax
        cmd = DESTROY;
    12eb:	c7 85 68 fe ff ff 03 	movl   $0x3,-0x198(%ebp)
    12f2:	00 00 00 
        cmd = DISCONNECT;
        if(ppid != 1){
            printf(1, "Pouch: no container is connected\n");
            exit(1);
        }
     }else if((strcmp(argv[1],"destroy")) == 0){
    12f5:	0f 84 0b fc ff ff    	je     f06 <main+0xc6>
        cmd = DESTROY;
     }else if((strcmp(argv[1],"cgroup")) == 0 && argc == 5){
    12fb:	50                   	push   %eax
    12fc:	50                   	push   %eax
    12fd:	68 83 27 00 00       	push   $0x2783
    1302:	ff 73 04             	pushl  0x4(%ebx)
    1305:	e8 56 01 00 00       	call   1460 <strcmp>
    130a:	83 c4 10             	add    $0x10,%esp
    130d:	85 c0                	test   %eax,%eax
    130f:	75 0d                	jne    131e <main+0x4de>
    1311:	83 bd 70 fe ff ff 05 	cmpl   $0x5,-0x190(%ebp)
    1318:	0f 84 99 00 00 00    	je     13b7 <main+0x577>
        cmd = LIMIT;
     }else if((strcmp(argv[1],"info")) == 0 ){
    131e:	50                   	push   %eax
    131f:	50                   	push   %eax
    1320:	68 74 27 00 00       	push   $0x2774
    1325:	ff 73 04             	pushl  0x4(%ebx)
    1328:	e8 33 01 00 00       	call   1460 <strcmp>
    132d:	83 c4 10             	add    $0x10,%esp
    1330:	85 c0                	test   %eax,%eax
        cmd = INFO;
    1332:	c7 85 68 fe ff ff 05 	movl   $0x5,-0x198(%ebp)
    1339:	00 00 00 
        }
     }else if((strcmp(argv[1],"destroy")) == 0){
        cmd = DESTROY;
     }else if((strcmp(argv[1],"cgroup")) == 0 && argc == 5){
        cmd = LIMIT;
     }else if((strcmp(argv[1],"info")) == 0 ){
    133c:	0f 84 c4 fb ff ff    	je     f06 <main+0xc6>
        cmd = INFO;
     }else if((strcmp(argv[1],"list")) == 0 && (strcmp(argv[2],"all")) == 0 ){
    1342:	57                   	push   %edi
    1343:	57                   	push   %edi
    1344:	68 79 27 00 00       	push   $0x2779
    1349:	ff 73 04             	pushl  0x4(%ebx)
    134c:	e8 0f 01 00 00       	call   1460 <strcmp>
    1351:	83 c4 10             	add    $0x10,%esp
    1354:	85 c0                	test   %eax,%eax
    1356:	74 78                	je     13d0 <main+0x590>
        cmd = LIST;
     }else{
        if(ppid == 1)
    1358:	83 bd 74 fe ff ff 01 	cmpl   $0x1,-0x18c(%ebp)
    135f:	74 65                	je     13c6 <main+0x586>
            print_help_inside_cnt();
        else
            print_help_outside_cnt();
    1361:	e8 aa f9 ff ff       	call   d10 <print_help_outside_cnt>
    1366:	e9 87 fc ff ff       	jmp    ff2 <main+0x1b2>

    // Not including the console tty
    for(i=0; i < (MAX_TTY - 1); i++){
        tty[4] = '0' + i;
        if((tty_fd = open(tty, O_RDWR)) < 0){
            printf(stderr, "cannot open %s fd\n", tty);
    136b:	8d 85 7e fe ff ff    	lea    -0x182(%ebp),%eax
    1371:	53                   	push   %ebx
    1372:	50                   	push   %eax
    1373:	68 81 24 00 00       	push   $0x2481
    1378:	6a 02                	push   $0x2
    137a:	e8 01 07 00 00       	call   1a80 <printf>
    137f:	83 c4 10             	add    $0x10,%esp
    1382:	e9 2b fd ff ff       	jmp    10b2 <main+0x272>
         else if(cmd == CONNECT){
             printf(1, "Nesting containers is not supported.\n");
             exit(1);
         }
         else if(cmd == DESTROY){
             printf(1, "Container can't be destroyed while connected.\n");
    1387:	50                   	push   %eax
    1388:	50                   	push   %eax
    1389:	68 c8 23 00 00       	push   $0x23c8
    138e:	6a 01                	push   $0x1
    1390:	e8 eb 06 00 00       	call   1a80 <printf>
             exit(1);
    1395:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    139c:	e8 27 05 00 00       	call   18c8 <exit>

    int cgroup_fd = -1;
    if((cgroup_fd = open("/cgroup", O_RDWR)) < 0){

        if(mkdir("/cgroup") != 0){
            printf(1, "Pouch: Failed to create root cgroup.\n");
    13a1:	52                   	push   %edx
    13a2:	52                   	push   %edx
    13a3:	68 54 23 00 00       	push   $0x2354
    13a8:	6a 01                	push   $0x1
    13aa:	e8 d1 06 00 00       	call   1a80 <printf>
    13af:	83 c4 10             	add    $0x10,%esp
    13b2:	e9 76 fe ff ff       	jmp    122d <main+0x3ed>
            exit(1);
        }
     }else if((strcmp(argv[1],"destroy")) == 0){
        cmd = DESTROY;
     }else if((strcmp(argv[1],"cgroup")) == 0 && argc == 5){
        cmd = LIMIT;
    13b7:	c7 85 68 fe ff ff 04 	movl   $0x4,-0x198(%ebp)
    13be:	00 00 00 
    13c1:	e9 40 fb ff ff       	jmp    f06 <main+0xc6>
        cmd = INFO;
     }else if((strcmp(argv[1],"list")) == 0 && (strcmp(argv[2],"all")) == 0 ){
        cmd = LIST;
     }else{
        if(ppid == 1)
            print_help_inside_cnt();
    13c6:	e8 35 ec ff ff       	call   0 <print_help_inside_cnt>
    13cb:	e9 22 fc ff ff       	jmp    ff2 <main+0x1b2>
        cmd = DESTROY;
     }else if((strcmp(argv[1],"cgroup")) == 0 && argc == 5){
        cmd = LIMIT;
     }else if((strcmp(argv[1],"info")) == 0 ){
        cmd = INFO;
     }else if((strcmp(argv[1],"list")) == 0 && (strcmp(argv[2],"all")) == 0 ){
    13d0:	56                   	push   %esi
    13d1:	56                   	push   %esi
    13d2:	68 7e 27 00 00       	push   $0x277e
    13d7:	ff 73 08             	pushl  0x8(%ebx)
    13da:	e8 81 00 00 00       	call   1460 <strcmp>
    13df:	83 c4 10             	add    $0x10,%esp
    13e2:	85 c0                	test   %eax,%eax
    13e4:	0f 85 6e ff ff ff    	jne    1358 <main+0x518>
        cmd = LIST;
    13ea:	c7 85 68 fe ff ff 06 	movl   $0x6,-0x198(%ebp)
    13f1:	00 00 00 
    13f4:	e9 0d fb ff ff       	jmp    f06 <main+0xc6>
       printf(stderr, "There is no container: %s in a started stage\n", container_name);
       exit(1);
    }
    int cname_fd = open(cg_limit_cname, O_RDWR);
    if(cname_fd < 0){
       printf(stderr, "Incorrect cgroup object-state provided. Not applied.\n", container_name);
    13f9:	50                   	push   %eax
    13fa:	53                   	push   %ebx
    13fb:	68 f8 23 00 00       	push   $0x23f8
    1400:	6a 02                	push   $0x2
    1402:	e8 79 06 00 00       	call   1a80 <printf>
       exit(1);
    1407:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    140e:	e8 b5 04 00 00       	call   18c8 <exit>
    strcat(cg_limit_cname, "/");
    strcat(cg_limit_cname,cgroup_state_obj);

    int cont_fd = open(container_name, 0);
    if(cont_fd < 0){
       printf(stderr, "There is no container: %s in a started stage\n", container_name);
    1413:	50                   	push   %eax
    1414:	53                   	push   %ebx
    1415:	68 3c 20 00 00       	push   $0x203c
    141a:	6a 02                	push   $0x2
    141c:	e8 5f 06 00 00       	call   1a80 <printf>
       exit(1);
    1421:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1428:	e8 9b 04 00 00       	call   18c8 <exit>
    142d:	66 90                	xchg   %ax,%ax
    142f:	90                   	nop

00001430 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	53                   	push   %ebx
    1434:	8b 45 08             	mov    0x8(%ebp),%eax
    1437:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    143a:	89 c2                	mov    %eax,%edx
    143c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1440:	83 c1 01             	add    $0x1,%ecx
    1443:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1447:	83 c2 01             	add    $0x1,%edx
    144a:	84 db                	test   %bl,%bl
    144c:	88 5a ff             	mov    %bl,-0x1(%edx)
    144f:	75 ef                	jne    1440 <strcpy+0x10>
    ;
  return os;
}
    1451:	5b                   	pop    %ebx
    1452:	5d                   	pop    %ebp
    1453:	c3                   	ret    
    1454:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    145a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001460 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	56                   	push   %esi
    1464:	53                   	push   %ebx
    1465:	8b 55 08             	mov    0x8(%ebp),%edx
    1468:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    146b:	0f b6 02             	movzbl (%edx),%eax
    146e:	0f b6 19             	movzbl (%ecx),%ebx
    1471:	84 c0                	test   %al,%al
    1473:	75 1e                	jne    1493 <strcmp+0x33>
    1475:	eb 29                	jmp    14a0 <strcmp+0x40>
    1477:	89 f6                	mov    %esi,%esi
    1479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1480:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1483:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1486:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1489:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    148d:	84 c0                	test   %al,%al
    148f:	74 0f                	je     14a0 <strcmp+0x40>
    1491:	89 f1                	mov    %esi,%ecx
    1493:	38 d8                	cmp    %bl,%al
    1495:	74 e9                	je     1480 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1497:	29 d8                	sub    %ebx,%eax
}
    1499:	5b                   	pop    %ebx
    149a:	5e                   	pop    %esi
    149b:	5d                   	pop    %ebp
    149c:	c3                   	ret    
    149d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    14a0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    14a2:	29 d8                	sub    %ebx,%eax
}
    14a4:	5b                   	pop    %ebx
    14a5:	5e                   	pop    %esi
    14a6:	5d                   	pop    %ebp
    14a7:	c3                   	ret    
    14a8:	90                   	nop
    14a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000014b0 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
    14b0:	55                   	push   %ebp
    14b1:	89 e5                	mov    %esp,%ebp
    14b3:	57                   	push   %edi
    14b4:	56                   	push   %esi
    14b5:	8b 55 08             	mov    0x8(%ebp),%edx
    14b8:	53                   	push   %ebx
    14b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
    14bc:	0f b6 32             	movzbl (%edx),%esi
    14bf:	89 f0                	mov    %esi,%eax
    14c1:	84 c0                	test   %al,%al
    14c3:	74 67                	je     152c <strncmp+0x7c>
    14c5:	0f b6 19             	movzbl (%ecx),%ebx
    14c8:	89 f0                	mov    %esi,%eax
    14ca:	38 d8                	cmp    %bl,%al
    14cc:	75 65                	jne    1533 <strncmp+0x83>
    14ce:	8b 5d 10             	mov    0x10(%ebp),%ebx
    14d1:	89 f0                	mov    %esi,%eax
    14d3:	0f b6 f0             	movzbl %al,%esi
    14d6:	89 f0                	mov    %esi,%eax
    14d8:	83 eb 01             	sub    $0x1,%ebx
    14db:	75 14                	jne    14f1 <strncmp+0x41>
    14dd:	eb 25                	jmp    1504 <strncmp+0x54>
    14df:	90                   	nop
    14e0:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
    14e4:	89 f1                	mov    %esi,%ecx
    14e6:	38 c8                	cmp    %cl,%al
    14e8:	75 26                	jne    1510 <strncmp+0x60>
    14ea:	83 eb 01             	sub    $0x1,%ebx
    14ed:	89 f9                	mov    %edi,%ecx
    14ef:	74 2f                	je     1520 <strncmp+0x70>
    p++, q++;
    14f1:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    14f4:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    14f7:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    14fa:	84 c0                	test   %al,%al
    14fc:	75 e2                	jne    14e0 <strncmp+0x30>
    14fe:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
    1502:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
    1504:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1505:	29 f0                	sub    %esi,%eax
}
    1507:	5e                   	pop    %esi
    1508:	5f                   	pop    %edi
    1509:	5d                   	pop    %ebp
    150a:	c3                   	ret    
    150b:	90                   	nop
    150c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1510:	0f b6 f1             	movzbl %cl,%esi
    1513:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1514:	29 f0                	sub    %esi,%eax
}
    1516:	5e                   	pop    %esi
    1517:	5f                   	pop    %edi
    1518:	5d                   	pop    %ebp
    1519:	c3                   	ret    
    151a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1520:	0f b6 f0             	movzbl %al,%esi
    1523:	89 f0                	mov    %esi,%eax
    1525:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1526:	29 f0                	sub    %esi,%eax
}
    1528:	5e                   	pop    %esi
    1529:	5f                   	pop    %edi
    152a:	5d                   	pop    %ebp
    152b:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    152c:	31 c0                	xor    %eax,%eax
    152e:	0f b6 31             	movzbl (%ecx),%esi
    1531:	eb d1                	jmp    1504 <strncmp+0x54>
    1533:	0f b6 c0             	movzbl %al,%eax
    1536:	0f b6 f3             	movzbl %bl,%esi
    1539:	eb c9                	jmp    1504 <strncmp+0x54>
    153b:	90                   	nop
    153c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001540 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1546:	80 39 00             	cmpb   $0x0,(%ecx)
    1549:	74 12                	je     155d <strlen+0x1d>
    154b:	31 d2                	xor    %edx,%edx
    154d:	8d 76 00             	lea    0x0(%esi),%esi
    1550:	83 c2 01             	add    $0x1,%edx
    1553:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1557:	89 d0                	mov    %edx,%eax
    1559:	75 f5                	jne    1550 <strlen+0x10>
    ;
  return n;
}
    155b:	5d                   	pop    %ebp
    155c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    155d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    155f:	5d                   	pop    %ebp
    1560:	c3                   	ret    
    1561:	eb 0d                	jmp    1570 <memset>
    1563:	90                   	nop
    1564:	90                   	nop
    1565:	90                   	nop
    1566:	90                   	nop
    1567:	90                   	nop
    1568:	90                   	nop
    1569:	90                   	nop
    156a:	90                   	nop
    156b:	90                   	nop
    156c:	90                   	nop
    156d:	90                   	nop
    156e:	90                   	nop
    156f:	90                   	nop

00001570 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1570:	55                   	push   %ebp
    1571:	89 e5                	mov    %esp,%ebp
    1573:	57                   	push   %edi
    1574:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1577:	8b 4d 10             	mov    0x10(%ebp),%ecx
    157a:	8b 45 0c             	mov    0xc(%ebp),%eax
    157d:	89 d7                	mov    %edx,%edi
    157f:	fc                   	cld    
    1580:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1582:	89 d0                	mov    %edx,%eax
    1584:	5f                   	pop    %edi
    1585:	5d                   	pop    %ebp
    1586:	c3                   	ret    
    1587:	89 f6                	mov    %esi,%esi
    1589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001590 <strchr>:

char*
strchr(const char *s, char c)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	53                   	push   %ebx
    1594:	8b 45 08             	mov    0x8(%ebp),%eax
    1597:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    159a:	0f b6 10             	movzbl (%eax),%edx
    159d:	84 d2                	test   %dl,%dl
    159f:	74 1d                	je     15be <strchr+0x2e>
    if(*s == c)
    15a1:	38 d3                	cmp    %dl,%bl
    15a3:	89 d9                	mov    %ebx,%ecx
    15a5:	75 0d                	jne    15b4 <strchr+0x24>
    15a7:	eb 17                	jmp    15c0 <strchr+0x30>
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15b0:	38 ca                	cmp    %cl,%dl
    15b2:	74 0c                	je     15c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    15b4:	83 c0 01             	add    $0x1,%eax
    15b7:	0f b6 10             	movzbl (%eax),%edx
    15ba:	84 d2                	test   %dl,%dl
    15bc:	75 f2                	jne    15b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    15be:	31 c0                	xor    %eax,%eax
}
    15c0:	5b                   	pop    %ebx
    15c1:	5d                   	pop    %ebp
    15c2:	c3                   	ret    
    15c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000015d0 <gets>:

char*
gets(char *buf, int max)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
    15d3:	57                   	push   %edi
    15d4:	56                   	push   %esi
    15d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    15d6:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    15d9:	31 db                	xor    %ebx,%ebx
    15db:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    15e0:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    15e3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    15e6:	7d 30                	jge    1618 <gets+0x48>
    cc = read(0, &c, 1);
    15e8:	83 ec 04             	sub    $0x4,%esp
    15eb:	6a 01                	push   $0x1
    15ed:	56                   	push   %esi
    15ee:	6a 00                	push   $0x0
    15f0:	e8 eb 02 00 00       	call   18e0 <read>
    if(cc < 1)
    15f5:	83 c4 10             	add    $0x10,%esp
    15f8:	85 c0                	test   %eax,%eax
    15fa:	7e e7                	jle    15e3 <gets+0x13>
      continue;
    buf[i++] = c;
    15fc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1600:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1603:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    1605:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1608:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    160a:	74 0c                	je     1618 <gets+0x48>
    160c:	3c 0d                	cmp    $0xd,%al
    160e:	74 08                	je     1618 <gets+0x48>
    1610:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1613:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    1616:	7c d0                	jl     15e8 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1618:	8b 45 08             	mov    0x8(%ebp),%eax
    161b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    161f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1622:	5b                   	pop    %ebx
    1623:	5e                   	pop    %esi
    1624:	5f                   	pop    %edi
    1625:	5d                   	pop    %ebp
    1626:	c3                   	ret    
    1627:	89 f6                	mov    %esi,%esi
    1629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001630 <stat>:

int
stat(const char *n, struct stat *st)
{
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	56                   	push   %esi
    1634:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1635:	83 ec 08             	sub    $0x8,%esp
    1638:	6a 00                	push   $0x0
    163a:	ff 75 08             	pushl  0x8(%ebp)
    163d:	e8 c6 02 00 00       	call   1908 <open>
  if(fd < 0)
    1642:	83 c4 10             	add    $0x10,%esp
    1645:	85 c0                	test   %eax,%eax
    1647:	78 27                	js     1670 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1649:	83 ec 08             	sub    $0x8,%esp
    164c:	ff 75 0c             	pushl  0xc(%ebp)
    164f:	89 c3                	mov    %eax,%ebx
    1651:	50                   	push   %eax
    1652:	e8 c9 02 00 00       	call   1920 <fstat>
    1657:	89 c6                	mov    %eax,%esi
  close(fd);
    1659:	89 1c 24             	mov    %ebx,(%esp)
    165c:	e8 8f 02 00 00       	call   18f0 <close>
  return r;
    1661:	83 c4 10             	add    $0x10,%esp
    1664:	89 f0                	mov    %esi,%eax
}
    1666:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1669:	5b                   	pop    %ebx
    166a:	5e                   	pop    %esi
    166b:	5d                   	pop    %ebp
    166c:	c3                   	ret    
    166d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1670:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1675:	eb ef                	jmp    1666 <stat+0x36>
    1677:	89 f6                	mov    %esi,%esi
    1679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001680 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	53                   	push   %ebx
    1684:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1687:	0f be 11             	movsbl (%ecx),%edx
    168a:	8d 42 d0             	lea    -0x30(%edx),%eax
    168d:	3c 09                	cmp    $0x9,%al
    168f:	b8 00 00 00 00       	mov    $0x0,%eax
    1694:	77 1f                	ja     16b5 <atoi+0x35>
    1696:	8d 76 00             	lea    0x0(%esi),%esi
    1699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    16a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    16a3:	83 c1 01             	add    $0x1,%ecx
    16a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    16aa:	0f be 11             	movsbl (%ecx),%edx
    16ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
    16b0:	80 fb 09             	cmp    $0x9,%bl
    16b3:	76 eb                	jbe    16a0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    16b5:	5b                   	pop    %ebx
    16b6:	5d                   	pop    %ebp
    16b7:	c3                   	ret    
    16b8:	90                   	nop
    16b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000016c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    16c0:	55                   	push   %ebp
    16c1:	89 e5                	mov    %esp,%ebp
    16c3:	56                   	push   %esi
    16c4:	53                   	push   %ebx
    16c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16c8:	8b 45 08             	mov    0x8(%ebp),%eax
    16cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    16ce:	85 db                	test   %ebx,%ebx
    16d0:	7e 14                	jle    16e6 <memmove+0x26>
    16d2:	31 d2                	xor    %edx,%edx
    16d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    16d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    16dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    16df:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    16e2:	39 da                	cmp    %ebx,%edx
    16e4:	75 f2                	jne    16d8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    16e6:	5b                   	pop    %ebx
    16e7:	5e                   	pop    %esi
    16e8:	5d                   	pop    %ebp
    16e9:	c3                   	ret    
    16ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000016f0 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	57                   	push   %edi
    16f4:	56                   	push   %esi
    16f5:	53                   	push   %ebx
    16f6:	83 ec 04             	sub    $0x4,%esp
    16f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
    16fc:	83 f9 00             	cmp    $0x0,%ecx
    16ff:	7e 76                	jle    1777 <itoa+0x87>
    1701:	89 cb                	mov    %ecx,%ebx
    1703:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
    1705:	bf 67 66 66 66       	mov    $0x66666667,%edi
    170a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1710:	89 d8                	mov    %ebx,%eax
    1712:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
    1715:	83 c6 01             	add    $0x1,%esi
        i /= 10;
    1718:	f7 ef                	imul   %edi
    171a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
    171d:	29 da                	sub    %ebx,%edx
    171f:	89 d3                	mov    %edx,%ebx
    1721:	75 ed                	jne    1710 <itoa+0x20>
        length++;
    1723:	89 f3                	mov    %esi,%ebx
    1725:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
    1728:	bf 67 66 66 66       	mov    $0x66666667,%edi
    172d:	8b 75 08             	mov    0x8(%ebp),%esi
    1730:	eb 0a                	jmp    173c <itoa+0x4c>
    1732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    1738:	85 db                	test   %ebx,%ebx
    173a:	7e 25                	jle    1761 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
    173c:	89 c8                	mov    %ecx,%eax
    173e:	f7 ef                	imul   %edi
    1740:	89 c8                	mov    %ecx,%eax
    1742:	c1 f8 1f             	sar    $0x1f,%eax
    1745:	c1 fa 02             	sar    $0x2,%edx
    1748:	29 c2                	sub    %eax,%edx
    174a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    174d:	01 c0                	add    %eax,%eax
    174f:	29 c1                	sub    %eax,%ecx
    1751:	83 c1 30             	add    $0x30,%ecx
    1754:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    1758:	83 eb 01             	sub    $0x1,%ebx
    175b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    175d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    175f:	7f d7                	jg     1738 <itoa+0x48>
    1761:	8b 75 f0             	mov    -0x10(%ebp),%esi
    1764:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
    1766:	8b 7d 08             	mov    0x8(%ebp),%edi
    1769:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
    176d:	83 c4 04             	add    $0x4,%esp
    1770:	89 f0                	mov    %esi,%eax
    1772:	5b                   	pop    %ebx
    1773:	5e                   	pop    %esi
    1774:	5f                   	pop    %edi
    1775:	5d                   	pop    %ebp
    1776:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
    1777:	75 12                	jne    178b <itoa+0x9b>
        buf[0] = '0';
    1779:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
    177c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
    1781:	c6 00 30             	movb   $0x30,(%eax)
    1784:	b8 01 00 00 00       	mov    $0x1,%eax
    1789:	eb db                	jmp    1766 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
    178b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
    178d:	31 f6                	xor    %esi,%esi
    178f:	eb d5                	jmp    1766 <itoa+0x76>
    1791:	eb 0d                	jmp    17a0 <strcat>
    1793:	90                   	nop
    1794:	90                   	nop
    1795:	90                   	nop
    1796:	90                   	nop
    1797:	90                   	nop
    1798:	90                   	nop
    1799:	90                   	nop
    179a:	90                   	nop
    179b:	90                   	nop
    179c:	90                   	nop
    179d:	90                   	nop
    179e:	90                   	nop
    179f:	90                   	nop

000017a0 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
    17a0:	55                   	push   %ebp
    17a1:	89 e5                	mov    %esp,%ebp
    17a3:	57                   	push   %edi
    17a4:	56                   	push   %esi
    17a5:	8b 45 08             	mov    0x8(%ebp),%eax
    17a8:	53                   	push   %ebx
    17a9:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
    17ac:	80 38 00             	cmpb   $0x0,(%eax)
    17af:	74 38                	je     17e9 <strcat+0x49>
    17b1:	31 c9                	xor    %ecx,%ecx
    17b3:	90                   	nop
    17b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17b8:	83 c1 01             	add    $0x1,%ecx
    17bb:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
    17bf:	89 ca                	mov    %ecx,%edx
    17c1:	75 f5                	jne    17b8 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
    17c3:	0f b6 1e             	movzbl (%esi),%ebx
    17c6:	84 db                	test   %bl,%bl
    17c8:	74 16                	je     17e0 <strcat+0x40>
    17ca:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
    17cd:	31 d2                	xor    %edx,%edx
    17cf:	90                   	nop
                dest[i + j] = source[j];
    17d0:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
    17d3:	83 c2 01             	add    $0x1,%edx
    17d6:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
    17da:	84 db                	test   %bl,%bl
    17dc:	75 f2                	jne    17d0 <strcat+0x30>
    17de:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
    17e0:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
    17e4:	5b                   	pop    %ebx
    17e5:	5e                   	pop    %esi
    17e6:	5f                   	pop    %edi
    17e7:	5d                   	pop    %ebp
    17e8:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
    17e9:	31 d2                	xor    %edx,%edx
    17eb:	31 c9                	xor    %ecx,%ecx
    17ed:	eb d4                	jmp    17c3 <strcat+0x23>
    17ef:	90                   	nop

000017f0 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
    17f0:	55                   	push   %ebp
    17f1:	89 e5                	mov    %esp,%ebp
    17f3:	57                   	push   %edi
    17f4:	56                   	push   %esi
    17f5:	53                   	push   %ebx
    17f6:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    17f9:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
    17fc:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    17ff:	0f b6 00             	movzbl (%eax),%eax
    1802:	84 c0                	test   %al,%al
    1804:	88 45 f3             	mov    %al,-0xd(%ebp)
    1807:	0f 84 a0 00 00 00    	je     18ad <strstr+0xbd>
    180d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1810:	31 c0                	xor    %eax,%eax
    1812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1818:	83 c0 01             	add    $0x1,%eax
    181b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    181f:	75 f7                	jne    1818 <strstr+0x28>
    1821:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1824:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1827:	0f b6 07             	movzbl (%edi),%eax
    182a:	84 c0                	test   %al,%al
    182c:	74 68                	je     1896 <strstr+0xa6>
    182e:	31 d2                	xor    %edx,%edx
    1830:	83 c2 01             	add    $0x1,%edx
    1833:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
    1837:	75 f7                	jne    1830 <strstr+0x40>
    1839:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    183c:	84 c0                	test   %al,%al
    183e:	89 5d ec             	mov    %ebx,-0x14(%ebp)
    1841:	74 4d                	je     1890 <strstr+0xa0>
    1843:	90                   	nop
    1844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1848:	38 45 f3             	cmp    %al,-0xd(%ebp)
    184b:	75 34                	jne    1881 <strstr+0x91>
    184d:	8b 5d e8             	mov    -0x18(%ebp),%ebx
    1850:	83 eb 01             	sub    $0x1,%ebx
    1853:	74 4b                	je     18a0 <strstr+0xb0>
    1855:	8b 55 0c             	mov    0xc(%ebp),%edx
    1858:	89 f8                	mov    %edi,%eax
    185a:	eb 10                	jmp    186c <strstr+0x7c>
    185c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1860:	3a 4a 01             	cmp    0x1(%edx),%cl
    1863:	75 1c                	jne    1881 <strstr+0x91>
    1865:	83 eb 01             	sub    $0x1,%ebx
    1868:	89 f2                	mov    %esi,%edx
    186a:	74 34                	je     18a0 <strstr+0xb0>
    p++, q++;
    186c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    186f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
    1872:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    1875:	84 c9                	test   %cl,%cl
    1877:	75 e7                	jne    1860 <strstr+0x70>
    1879:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    187d:	84 c0                	test   %al,%al
    187f:	74 1f                	je     18a0 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
    1881:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
    1884:	3b 7d ec             	cmp    -0x14(%ebp),%edi
    1887:	74 0d                	je     1896 <strstr+0xa6>
    1889:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    188c:	84 c0                	test   %al,%al
    188e:	75 b8                	jne    1848 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    1890:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    1894:	eb e7                	jmp    187d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
    1896:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
    1899:	31 c0                	xor    %eax,%eax
}
    189b:	5b                   	pop    %ebx
    189c:	5e                   	pop    %esi
    189d:	5f                   	pop    %edi
    189e:	5d                   	pop    %ebp
    189f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
    18a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
    18a3:	83 c4 10             	add    $0x10,%esp
    18a6:	5b                   	pop    %ebx
    18a7:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
    18a8:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
    18aa:	5f                   	pop    %edi
    18ab:	5d                   	pop    %ebp
    18ac:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    18ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    18b4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    18bb:	e9 67 ff ff ff       	jmp    1827 <strstr+0x37>

000018c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    18c0:	b8 01 00 00 00       	mov    $0x1,%eax
    18c5:	cd 40                	int    $0x40
    18c7:	c3                   	ret    

000018c8 <exit>:
SYSCALL(exit)
    18c8:	b8 02 00 00 00       	mov    $0x2,%eax
    18cd:	cd 40                	int    $0x40
    18cf:	c3                   	ret    

000018d0 <wait>:
SYSCALL(wait)
    18d0:	b8 03 00 00 00       	mov    $0x3,%eax
    18d5:	cd 40                	int    $0x40
    18d7:	c3                   	ret    

000018d8 <pipe>:
SYSCALL(pipe)
    18d8:	b8 04 00 00 00       	mov    $0x4,%eax
    18dd:	cd 40                	int    $0x40
    18df:	c3                   	ret    

000018e0 <read>:
SYSCALL(read)
    18e0:	b8 05 00 00 00       	mov    $0x5,%eax
    18e5:	cd 40                	int    $0x40
    18e7:	c3                   	ret    

000018e8 <write>:
SYSCALL(write)
    18e8:	b8 10 00 00 00       	mov    $0x10,%eax
    18ed:	cd 40                	int    $0x40
    18ef:	c3                   	ret    

000018f0 <close>:
SYSCALL(close)
    18f0:	b8 15 00 00 00       	mov    $0x15,%eax
    18f5:	cd 40                	int    $0x40
    18f7:	c3                   	ret    

000018f8 <kill>:
SYSCALL(kill)
    18f8:	b8 06 00 00 00       	mov    $0x6,%eax
    18fd:	cd 40                	int    $0x40
    18ff:	c3                   	ret    

00001900 <exec>:
SYSCALL(exec)
    1900:	b8 07 00 00 00       	mov    $0x7,%eax
    1905:	cd 40                	int    $0x40
    1907:	c3                   	ret    

00001908 <open>:
SYSCALL(open)
    1908:	b8 0f 00 00 00       	mov    $0xf,%eax
    190d:	cd 40                	int    $0x40
    190f:	c3                   	ret    

00001910 <mknod>:
SYSCALL(mknod)
    1910:	b8 11 00 00 00       	mov    $0x11,%eax
    1915:	cd 40                	int    $0x40
    1917:	c3                   	ret    

00001918 <unlink>:
SYSCALL(unlink)
    1918:	b8 12 00 00 00       	mov    $0x12,%eax
    191d:	cd 40                	int    $0x40
    191f:	c3                   	ret    

00001920 <fstat>:
SYSCALL(fstat)
    1920:	b8 08 00 00 00       	mov    $0x8,%eax
    1925:	cd 40                	int    $0x40
    1927:	c3                   	ret    

00001928 <link>:
SYSCALL(link)
    1928:	b8 13 00 00 00       	mov    $0x13,%eax
    192d:	cd 40                	int    $0x40
    192f:	c3                   	ret    

00001930 <mkdir>:
SYSCALL(mkdir)
    1930:	b8 14 00 00 00       	mov    $0x14,%eax
    1935:	cd 40                	int    $0x40
    1937:	c3                   	ret    

00001938 <chdir>:
SYSCALL(chdir)
    1938:	b8 09 00 00 00       	mov    $0x9,%eax
    193d:	cd 40                	int    $0x40
    193f:	c3                   	ret    

00001940 <dup>:
SYSCALL(dup)
    1940:	b8 0a 00 00 00       	mov    $0xa,%eax
    1945:	cd 40                	int    $0x40
    1947:	c3                   	ret    

00001948 <getpid>:
SYSCALL(getpid)
    1948:	b8 0b 00 00 00       	mov    $0xb,%eax
    194d:	cd 40                	int    $0x40
    194f:	c3                   	ret    

00001950 <sbrk>:
SYSCALL(sbrk)
    1950:	b8 0c 00 00 00       	mov    $0xc,%eax
    1955:	cd 40                	int    $0x40
    1957:	c3                   	ret    

00001958 <sleep>:
SYSCALL(sleep)
    1958:	b8 0d 00 00 00       	mov    $0xd,%eax
    195d:	cd 40                	int    $0x40
    195f:	c3                   	ret    

00001960 <uptime>:
SYSCALL(uptime)
    1960:	b8 0e 00 00 00       	mov    $0xe,%eax
    1965:	cd 40                	int    $0x40
    1967:	c3                   	ret    

00001968 <mount>:
SYSCALL(mount)
    1968:	b8 16 00 00 00       	mov    $0x16,%eax
    196d:	cd 40                	int    $0x40
    196f:	c3                   	ret    

00001970 <umount>:
SYSCALL(umount)
    1970:	b8 17 00 00 00       	mov    $0x17,%eax
    1975:	cd 40                	int    $0x40
    1977:	c3                   	ret    

00001978 <printmounts>:
SYSCALL(printmounts)
    1978:	b8 18 00 00 00       	mov    $0x18,%eax
    197d:	cd 40                	int    $0x40
    197f:	c3                   	ret    

00001980 <printdevices>:
SYSCALL(printdevices)
    1980:	b8 19 00 00 00       	mov    $0x19,%eax
    1985:	cd 40                	int    $0x40
    1987:	c3                   	ret    

00001988 <unshare>:
SYSCALL(unshare)
    1988:	b8 1a 00 00 00       	mov    $0x1a,%eax
    198d:	cd 40                	int    $0x40
    198f:	c3                   	ret    

00001990 <usleep>:
SYSCALL(usleep)
    1990:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1995:	cd 40                	int    $0x40
    1997:	c3                   	ret    

00001998 <ioctl>:
SYSCALL(ioctl)
    1998:	b8 1c 00 00 00       	mov    $0x1c,%eax
    199d:	cd 40                	int    $0x40
    199f:	c3                   	ret    

000019a0 <getppid>:
SYSCALL(getppid)
    19a0:	b8 1d 00 00 00       	mov    $0x1d,%eax
    19a5:	cd 40                	int    $0x40
    19a7:	c3                   	ret    

000019a8 <getcpu>:
SYSCALL(getcpu)
    19a8:	b8 1e 00 00 00       	mov    $0x1e,%eax
    19ad:	cd 40                	int    $0x40
    19af:	c3                   	ret    

000019b0 <getmem>:
SYSCALL(getmem)
    19b0:	b8 1f 00 00 00       	mov    $0x1f,%eax
    19b5:	cd 40                	int    $0x40
    19b7:	c3                   	ret    

000019b8 <kmemtest>:
SYSCALL(kmemtest)
    19b8:	b8 20 00 00 00       	mov    $0x20,%eax
    19bd:	cd 40                	int    $0x40
    19bf:	c3                   	ret    

000019c0 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    19c3:	57                   	push   %edi
    19c4:	56                   	push   %esi
    19c5:	53                   	push   %ebx
    19c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    19c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    19cc:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    19cf:	85 db                	test   %ebx,%ebx
    19d1:	0f 84 91 00 00 00    	je     1a68 <printint+0xa8>
    19d7:	89 d0                	mov    %edx,%eax
    19d9:	c1 e8 1f             	shr    $0x1f,%eax
    19dc:	84 c0                	test   %al,%al
    19de:	0f 84 84 00 00 00    	je     1a68 <printint+0xa8>
    neg = 1;
    x = -xx;
    19e4:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    19e6:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    19ed:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
    19ef:	31 ff                	xor    %edi,%edi
    19f1:	8d 75 c7             	lea    -0x39(%ebp),%esi
    19f4:	eb 0c                	jmp    1a02 <printint+0x42>
    19f6:	8d 76 00             	lea    0x0(%esi),%esi
    19f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
    1a00:	89 df                	mov    %ebx,%edi
    1a02:	31 d2                	xor    %edx,%edx
    1a04:	8d 5f 01             	lea    0x1(%edi),%ebx
    1a07:	f7 f1                	div    %ecx
    1a09:	0f b6 92 c8 27 00 00 	movzbl 0x27c8(%edx),%edx
  }while((x /= base) != 0);
    1a10:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    1a12:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    1a15:	75 e9                	jne    1a00 <printint+0x40>
  if(neg)
    1a17:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1a1a:	85 c0                	test   %eax,%eax
    1a1c:	74 08                	je     1a26 <printint+0x66>
    buf[i++] = '-';
    1a1e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
    1a23:	8d 5f 02             	lea    0x2(%edi),%ebx
    1a26:	8d 7d d8             	lea    -0x28(%ebp),%edi
    1a29:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
    1a2d:	89 fa                	mov    %edi,%edx
    1a2f:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
    1a30:	0f b6 08             	movzbl (%eax),%ecx
    1a33:	83 e8 01             	sub    $0x1,%eax
    1a36:	83 c2 01             	add    $0x1,%edx
    1a39:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
    1a3c:	39 f0                	cmp    %esi,%eax
    1a3e:	75 f0                	jne    1a30 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
    1a40:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
    1a43:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
    1a48:	57                   	push   %edi
    1a49:	e8 f2 fa ff ff       	call   1540 <strlen>
    1a4e:	83 c4 0c             	add    $0xc,%esp
    1a51:	50                   	push   %eax
    1a52:	57                   	push   %edi
    1a53:	ff 75 c0             	pushl  -0x40(%ebp)
    1a56:	e8 8d fe ff ff       	call   18e8 <write>
}
    1a5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a5e:	5b                   	pop    %ebx
    1a5f:	5e                   	pop    %esi
    1a60:	5f                   	pop    %edi
    1a61:	5d                   	pop    %ebp
    1a62:	c3                   	ret    
    1a63:	90                   	nop
    1a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1a68:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1a6a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1a71:	e9 79 ff ff ff       	jmp    19ef <printint+0x2f>
    1a76:	8d 76 00             	lea    0x0(%esi),%esi
    1a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001a80 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
    1a80:	55                   	push   %ebp
    1a81:	89 e5                	mov    %esp,%ebp
    1a83:	57                   	push   %edi
    1a84:	56                   	push   %esi
    1a85:	53                   	push   %ebx
    1a86:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1a89:	8b 75 0c             	mov    0xc(%ebp),%esi
    1a8c:	0f b6 06             	movzbl (%esi),%eax
    1a8f:	84 c0                	test   %al,%al
    1a91:	0f 84 90 01 00 00    	je     1c27 <printf+0x1a7>
    1a97:	8d 5d 10             	lea    0x10(%ebp),%ebx
    1a9a:	31 ff                	xor    %edi,%edi
    1a9c:	31 d2                	xor    %edx,%edx
    1a9e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1aa1:	31 db                	xor    %ebx,%ebx
    1aa3:	eb 39                	jmp    1ade <printf+0x5e>
    1aa5:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1aa8:	83 f9 25             	cmp    $0x25,%ecx
    1aab:	0f 84 af 00 00 00    	je     1b60 <printf+0xe0>
    1ab1:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1ab4:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1ab7:	83 ec 04             	sub    $0x4,%esp
    1aba:	6a 01                	push   $0x1
    1abc:	50                   	push   %eax
    1abd:	ff 75 08             	pushl  0x8(%ebp)
    1ac0:	e8 23 fe ff ff       	call   18e8 <write>
    1ac5:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
    1ac8:	85 c0                	test   %eax,%eax
    1aca:	78 35                	js     1b01 <printf+0x81>
    1acc:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1acf:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    1ad2:	01 c7                	add    %eax,%edi
    1ad4:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1ad6:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    1ada:	84 c0                	test   %al,%al
    1adc:	74 21                	je     1aff <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
    1ade:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
    1ae1:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    1ae3:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    1ae6:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
    1ae9:	74 bd                	je     1aa8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
    1aeb:	83 fa 25             	cmp    $0x25,%edx
    1aee:	74 20                	je     1b10 <printf+0x90>
    1af0:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1af2:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    1af5:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1af7:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    1afb:	84 c0                	test   %al,%al
    1afd:	75 df                	jne    1ade <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    1aff:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
    1b01:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b04:	5b                   	pop    %ebx
    1b05:	5e                   	pop    %esi
    1b06:	5f                   	pop    %edi
    1b07:	5d                   	pop    %ebp
    1b08:	c3                   	ret    
    1b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
    1b10:	83 f9 64             	cmp    $0x64,%ecx
    1b13:	0f 84 7f 00 00 00    	je     1b98 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1b19:	0f be d0             	movsbl %al,%edx
    1b1c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
    1b22:	83 fa 70             	cmp    $0x70,%edx
    1b25:	74 49                	je     1b70 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1b27:	83 f9 73             	cmp    $0x73,%ecx
    1b2a:	0f 84 98 00 00 00    	je     1bc8 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
    1b30:	83 f9 63             	cmp    $0x63,%ecx
    1b33:	0f 84 c7 00 00 00    	je     1c00 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1b39:	83 f9 25             	cmp    $0x25,%ecx
    1b3c:	74 6a                	je     1ba8 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
    1b3e:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
    1b41:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1b44:	83 ec 04             	sub    $0x4,%esp
    1b47:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    1b49:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
    1b4d:	50                   	push   %eax
    1b4e:	ff 75 08             	pushl  0x8(%ebp)
    1b51:	e8 92 fd ff ff       	call   18e8 <write>
    1b56:	83 c4 10             	add    $0x10,%esp
    1b59:	e9 6a ff ff ff       	jmp    1ac8 <printf+0x48>
    1b5e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1b60:	ba 25 00 00 00       	mov    $0x25,%edx
    1b65:	31 c0                	xor    %eax,%eax
    1b67:	eb 89                	jmp    1af2 <printf+0x72>
    1b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    1b70:	83 ec 0c             	sub    $0xc,%esp
    1b73:	b9 10 00 00 00       	mov    $0x10,%ecx
    1b78:	6a 00                	push   $0x0
    1b7a:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1b7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b80:	8b 16                	mov    (%esi),%edx
        ap++;
    1b82:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    1b85:	e8 36 fe ff ff       	call   19c0 <printint>
        ap++;
    1b8a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    1b8d:	83 c4 10             	add    $0x10,%esp
    1b90:	e9 33 ff ff ff       	jmp    1ac8 <printf+0x48>
    1b95:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
    1b98:	83 ec 0c             	sub    $0xc,%esp
    1b9b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1ba0:	6a 01                	push   $0x1
    1ba2:	eb d6                	jmp    1b7a <printf+0xfa>
    1ba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1ba8:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1bab:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bae:	83 ec 04             	sub    $0x4,%esp
    1bb1:	6a 01                	push   $0x1
    1bb3:	50                   	push   %eax
    1bb4:	ff 75 08             	pushl  0x8(%ebp)
    1bb7:	e8 2c fd ff ff       	call   18e8 <write>
    1bbc:	83 c4 10             	add    $0x10,%esp
    1bbf:	e9 04 ff ff ff       	jmp    1ac8 <printf+0x48>
    1bc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    1bc8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1bcb:	8b 30                	mov    (%eax),%esi
        ap++;
    1bcd:	83 c0 04             	add    $0x4,%eax
    1bd0:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
    1bd3:	b8 bf 27 00 00       	mov    $0x27bf,%eax
    1bd8:	85 f6                	test   %esi,%esi
    1bda:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
    1bdd:	83 ec 0c             	sub    $0xc,%esp
    1be0:	56                   	push   %esi
    1be1:	e8 5a f9 ff ff       	call   1540 <strlen>
    1be6:	83 c4 0c             	add    $0xc,%esp
    1be9:	50                   	push   %eax
    1bea:	56                   	push   %esi
    1beb:	ff 75 08             	pushl  0x8(%ebp)
    1bee:	e8 f5 fc ff ff       	call   18e8 <write>
    1bf3:	83 c4 10             	add    $0x10,%esp
    1bf6:	e9 cd fe ff ff       	jmp    1ac8 <printf+0x48>
    1bfb:	90                   	nop
    1bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c00:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1c03:	83 ec 04             	sub    $0x4,%esp
    1c06:	8b 06                	mov    (%esi),%eax
    1c08:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    1c0a:	83 c6 04             	add    $0x4,%esi
    1c0d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1c10:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1c13:	50                   	push   %eax
    1c14:	ff 75 08             	pushl  0x8(%ebp)
    1c17:	e8 cc fc ff ff       	call   18e8 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    1c1c:	89 75 d0             	mov    %esi,-0x30(%ebp)
    1c1f:	83 c4 10             	add    $0x10,%esp
    1c22:	e9 a1 fe ff ff       	jmp    1ac8 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
    1c27:	31 c0                	xor    %eax,%eax
    1c29:	e9 d3 fe ff ff       	jmp    1b01 <printf+0x81>
    1c2e:	66 90                	xchg   %ax,%ax

00001c30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1c30:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1c31:	a1 08 40 00 00       	mov    0x4008,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1c36:	89 e5                	mov    %esp,%ebp
    1c38:	57                   	push   %edi
    1c39:	56                   	push   %esi
    1c3a:	53                   	push   %ebx
    1c3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1c3e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1c40:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1c43:	39 c8                	cmp    %ecx,%eax
    1c45:	73 19                	jae    1c60 <free+0x30>
    1c47:	89 f6                	mov    %esi,%esi
    1c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1c50:	39 d1                	cmp    %edx,%ecx
    1c52:	72 1c                	jb     1c70 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1c54:	39 d0                	cmp    %edx,%eax
    1c56:	73 18                	jae    1c70 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1c58:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1c5a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1c5c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1c5e:	72 f0                	jb     1c50 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1c60:	39 d0                	cmp    %edx,%eax
    1c62:	72 f4                	jb     1c58 <free+0x28>
    1c64:	39 d1                	cmp    %edx,%ecx
    1c66:	73 f0                	jae    1c58 <free+0x28>
    1c68:	90                   	nop
    1c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1c70:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1c73:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1c76:	39 d7                	cmp    %edx,%edi
    1c78:	74 19                	je     1c93 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1c7a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1c7d:	8b 50 04             	mov    0x4(%eax),%edx
    1c80:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1c83:	39 f1                	cmp    %esi,%ecx
    1c85:	74 23                	je     1caa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1c87:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1c89:	a3 08 40 00 00       	mov    %eax,0x4008
}
    1c8e:	5b                   	pop    %ebx
    1c8f:	5e                   	pop    %esi
    1c90:	5f                   	pop    %edi
    1c91:	5d                   	pop    %ebp
    1c92:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1c93:	03 72 04             	add    0x4(%edx),%esi
    1c96:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1c99:	8b 10                	mov    (%eax),%edx
    1c9b:	8b 12                	mov    (%edx),%edx
    1c9d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1ca0:	8b 50 04             	mov    0x4(%eax),%edx
    1ca3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1ca6:	39 f1                	cmp    %esi,%ecx
    1ca8:	75 dd                	jne    1c87 <free+0x57>
    p->s.size += bp->s.size;
    1caa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1cad:	a3 08 40 00 00       	mov    %eax,0x4008
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1cb2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1cb5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1cb8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1cba:	5b                   	pop    %ebx
    1cbb:	5e                   	pop    %esi
    1cbc:	5f                   	pop    %edi
    1cbd:	5d                   	pop    %ebp
    1cbe:	c3                   	ret    
    1cbf:	90                   	nop

00001cc0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1cc0:	55                   	push   %ebp
    1cc1:	89 e5                	mov    %esp,%ebp
    1cc3:	57                   	push   %edi
    1cc4:	56                   	push   %esi
    1cc5:	53                   	push   %ebx
    1cc6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1cc9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1ccc:	8b 15 08 40 00 00    	mov    0x4008,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1cd2:	8d 78 07             	lea    0x7(%eax),%edi
    1cd5:	c1 ef 03             	shr    $0x3,%edi
    1cd8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    1cdb:	85 d2                	test   %edx,%edx
    1cdd:	0f 84 a3 00 00 00    	je     1d86 <malloc+0xc6>
    1ce3:	8b 02                	mov    (%edx),%eax
    1ce5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1ce8:	39 cf                	cmp    %ecx,%edi
    1cea:	76 74                	jbe    1d60 <malloc+0xa0>
    1cec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1cf2:	be 00 10 00 00       	mov    $0x1000,%esi
    1cf7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    1cfe:	0f 43 f7             	cmovae %edi,%esi
    1d01:	ba 00 80 00 00       	mov    $0x8000,%edx
    1d06:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    1d0c:	0f 46 da             	cmovbe %edx,%ebx
    1d0f:	eb 10                	jmp    1d21 <malloc+0x61>
    1d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1d18:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1d1a:	8b 48 04             	mov    0x4(%eax),%ecx
    1d1d:	39 cf                	cmp    %ecx,%edi
    1d1f:	76 3f                	jbe    1d60 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1d21:	39 05 08 40 00 00    	cmp    %eax,0x4008
    1d27:	89 c2                	mov    %eax,%edx
    1d29:	75 ed                	jne    1d18 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1d2b:	83 ec 0c             	sub    $0xc,%esp
    1d2e:	53                   	push   %ebx
    1d2f:	e8 1c fc ff ff       	call   1950 <sbrk>
  if(p == (char*)-1)
    1d34:	83 c4 10             	add    $0x10,%esp
    1d37:	83 f8 ff             	cmp    $0xffffffff,%eax
    1d3a:	74 1c                	je     1d58 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1d3c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    1d3f:	83 ec 0c             	sub    $0xc,%esp
    1d42:	83 c0 08             	add    $0x8,%eax
    1d45:	50                   	push   %eax
    1d46:	e8 e5 fe ff ff       	call   1c30 <free>
  return freep;
    1d4b:	8b 15 08 40 00 00    	mov    0x4008,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1d51:	83 c4 10             	add    $0x10,%esp
    1d54:	85 d2                	test   %edx,%edx
    1d56:	75 c0                	jne    1d18 <malloc+0x58>
        return 0;
    1d58:	31 c0                	xor    %eax,%eax
    1d5a:	eb 1c                	jmp    1d78 <malloc+0xb8>
    1d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1d60:	39 cf                	cmp    %ecx,%edi
    1d62:	74 1c                	je     1d80 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1d64:	29 f9                	sub    %edi,%ecx
    1d66:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1d69:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1d6c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    1d6f:	89 15 08 40 00 00    	mov    %edx,0x4008
      return (void*)(p + 1);
    1d75:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1d78:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d7b:	5b                   	pop    %ebx
    1d7c:	5e                   	pop    %esi
    1d7d:	5f                   	pop    %edi
    1d7e:	5d                   	pop    %ebp
    1d7f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1d80:	8b 08                	mov    (%eax),%ecx
    1d82:	89 0a                	mov    %ecx,(%edx)
    1d84:	eb e9                	jmp    1d6f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1d86:	c7 05 08 40 00 00 0c 	movl   $0x400c,0x4008
    1d8d:	40 00 00 
    1d90:	c7 05 0c 40 00 00 0c 	movl   $0x400c,0x400c
    1d97:	40 00 00 
    base.s.size = 0;
    1d9a:	b8 0c 40 00 00       	mov    $0x400c,%eax
    1d9f:	c7 05 10 40 00 00 00 	movl   $0x0,0x4010
    1da6:	00 00 00 
    1da9:	e9 3e ff ff ff       	jmp    1cec <malloc+0x2c>
    1dae:	66 90                	xchg   %ax,%ax

00001db0 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    1db0:	55                   	push   %ebp
    1db1:	89 e5                	mov    %esp,%ebp
    1db3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    1db6:	6a 10                	push   $0x10
    1db8:	6a 02                	push   $0x2
    1dba:	ff 75 08             	pushl  0x8(%ebp)
    1dbd:	e8 d6 fb ff ff       	call   1998 <ioctl>
}
    1dc2:	c9                   	leave  
    1dc3:	c3                   	ret    
    1dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001dd0 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
    1dd0:	55                   	push   %ebp
    1dd1:	89 e5                	mov    %esp,%ebp
    1dd3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
    1dd6:	68 00 10 00 00       	push   $0x1000
    1ddb:	6a 02                	push   $0x2
    1ddd:	ff 75 08             	pushl  0x8(%ebp)
    1de0:	e8 b3 fb ff ff       	call   1998 <ioctl>
}
    1de5:	c9                   	leave  
    1de6:	c3                   	ret    
    1de7:	89 f6                	mov    %esi,%esi
    1de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001df0 <attach_tty>:

int
attach_tty(int tty_fd)
{
    1df0:	55                   	push   %ebp
    1df1:	89 e5                	mov    %esp,%ebp
    1df3:	53                   	push   %ebx
    1df4:	83 ec 08             	sub    $0x8,%esp
    1df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
    1dfa:	6a 10                	push   $0x10
    1dfc:	6a 01                	push   $0x1
    1dfe:	53                   	push   %ebx
    1dff:	e8 94 fb ff ff       	call   1998 <ioctl>
    1e04:	83 c4 10             	add    $0x10,%esp
    1e07:	85 c0                	test   %eax,%eax
    1e09:	78 55                	js     1e60 <attach_tty+0x70>
     return -1;

    close(0);
    1e0b:	83 ec 0c             	sub    $0xc,%esp
    1e0e:	6a 00                	push   $0x0
    1e10:	e8 db fa ff ff       	call   18f0 <close>
    close(1);
    1e15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e1c:	e8 cf fa ff ff       	call   18f0 <close>
    close(2);
    1e21:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1e28:	e8 c3 fa ff ff       	call   18f0 <close>
    if(dup(tty_fd) < 0)
    1e2d:	89 1c 24             	mov    %ebx,(%esp)
    1e30:	e8 0b fb ff ff       	call   1940 <dup>
    1e35:	83 c4 10             	add    $0x10,%esp
    1e38:	85 c0                	test   %eax,%eax
    1e3a:	78 24                	js     1e60 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    1e3c:	83 ec 0c             	sub    $0xc,%esp
    1e3f:	53                   	push   %ebx
    1e40:	e8 fb fa ff ff       	call   1940 <dup>
    1e45:	83 c4 10             	add    $0x10,%esp
    1e48:	85 c0                	test   %eax,%eax
    1e4a:	78 14                	js     1e60 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    1e4c:	83 ec 0c             	sub    $0xc,%esp
    1e4f:	53                   	push   %ebx
    1e50:	e8 eb fa ff ff       	call   1940 <dup>
    1e55:	83 c4 10             	add    $0x10,%esp
    1e58:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
    1e5b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1e5e:	c9                   	leave  
    1e5f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
    1e60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
    1e65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1e68:	c9                   	leave  
    1e69:	c3                   	ret    
    1e6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001e70 <detach_tty>:

int
detach_tty(int tty_fd)
{
    1e70:	55                   	push   %ebp
    1e71:	89 e5                	mov    %esp,%ebp
    1e73:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
    1e76:	6a 20                	push   $0x20
    1e78:	6a 01                	push   $0x1
    1e7a:	ff 75 08             	pushl  0x8(%ebp)
    1e7d:	e8 16 fb ff ff       	call   1998 <ioctl>
    return 0;
}
    1e82:	31 c0                	xor    %eax,%eax
    1e84:	c9                   	leave  
    1e85:	c3                   	ret    
    1e86:	8d 76 00             	lea    0x0(%esi),%esi
    1e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001e90 <connect_tty>:


int
connect_tty(int tty_fd)
{
    1e90:	55                   	push   %ebp
    1e91:	89 e5                	mov    %esp,%ebp
    1e93:	53                   	push   %ebx
    1e94:	83 ec 08             	sub    $0x8,%esp
    1e97:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    1e9a:	6a 10                	push   $0x10
    1e9c:	6a 02                	push   $0x2
    1e9e:	53                   	push   %ebx
    1e9f:	e8 f4 fa ff ff       	call   1998 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
    1ea4:	83 c4 10             	add    $0x10,%esp
    1ea7:	85 c0                	test   %eax,%eax
    1ea9:	74 1d                	je     1ec8 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
    1eab:	83 ec 04             	sub    $0x4,%esp
    1eae:	68 00 10 00 00       	push   $0x1000
    1eb3:	6a 01                	push   $0x1
    1eb5:	53                   	push   %ebx
    1eb6:	e8 dd fa ff ff       	call   1998 <ioctl>
     return tty_fd;
    1ebb:	83 c4 10             	add    $0x10,%esp
    1ebe:	89 d8                	mov    %ebx,%eax
}
    1ec0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1ec3:	c9                   	leave  
    1ec4:	c3                   	ret    
    1ec5:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
    1ec8:	83 ec 0c             	sub    $0xc,%esp
    1ecb:	53                   	push   %ebx
    1ecc:	e8 1f fa ff ff       	call   18f0 <close>
       return -1;
    1ed1:	83 c4 10             	add    $0x10,%esp
    1ed4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ed9:	eb e5                	jmp    1ec0 <connect_tty+0x30>
    1edb:	90                   	nop
    1edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001ee0 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
    1ee0:	55                   	push   %ebp
    1ee1:	89 e5                	mov    %esp,%ebp
    1ee3:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
    1ee6:	68 00 20 00 00       	push   $0x2000
    1eeb:	6a 01                	push   $0x1
    1eed:	ff 75 08             	pushl  0x8(%ebp)
    1ef0:	e8 a3 fa ff ff       	call   1998 <ioctl>
}
    1ef5:	c9                   	leave  
    1ef6:	c3                   	ret    
