
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	56                   	push   %esi
       4:	53                   	push   %ebx
       5:	8b 75 0c             	mov    0xc(%ebp),%esi
       8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 a8 19 00 00       	push   $0x19a8
      13:	6a 02                	push   $0x2
      15:	e8 16 15 00 00       	call   1530 <printf>
  memset(buf, 0, nbuf);
      1a:	83 c4 0c             	add    $0xc,%esp
      1d:	56                   	push   %esi
      1e:	6a 00                	push   $0x0
      20:	53                   	push   %ebx
      21:	e8 fa 0f 00 00       	call   1020 <memset>
  gets(buf, nbuf);
      26:	58                   	pop    %eax
      27:	5a                   	pop    %edx
      28:	56                   	push   %esi
      29:	53                   	push   %ebx
      2a:	e8 51 10 00 00       	call   1080 <gets>
      2f:	83 c4 10             	add    $0x10,%esp
      32:	31 c0                	xor    %eax,%eax
      34:	80 3b 00             	cmpb   $0x0,(%ebx)
      37:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
      3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
      3d:	f7 d8                	neg    %eax
      3f:	5b                   	pop    %ebx
      40:	5e                   	pop    %esi
      41:	5d                   	pop    %ebp
      42:	c3                   	ret    
      43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000050 <get_internal_cmd_type>:

int get_internal_cmd_type(struct execcmd* cmd)
{
      50:	55                   	push   %ebp
      51:	89 e5                	mov    %esp,%ebp
      53:	53                   	push   %ebx
      54:	83 ec 0c             	sub    $0xc,%esp
      57:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int cmd_type = INTERNAL_CMD_NONE;

    if ((strcmp(cmd->argv[0], "echo") == 0) && (strcmp(cmd->argv[1], "$?") == 0)) {
      5a:	68 ab 19 00 00       	push   $0x19ab
      5f:	ff 73 04             	pushl  0x4(%ebx)
      62:	e8 a9 0e 00 00       	call   f10 <strcmp>
      67:	83 c4 10             	add    $0x10,%esp
      6a:	85 c0                	test   %eax,%eax
      6c:	75 1c                	jne    8a <get_internal_cmd_type+0x3a>
      6e:	83 ec 08             	sub    $0x8,%esp
      71:	68 b3 19 00 00       	push   $0x19b3
      76:	ff 73 08             	pushl  0x8(%ebx)
      79:	e8 92 0e 00 00       	call   f10 <strcmp>
      7e:	83 c4 10             	add    $0x10,%esp
      81:	85 c0                	test   %eax,%eax
        cmd_type = INTERNAL_CMD_DOLLAR_QUESTION;
      83:	ba 01 00 00 00       	mov    $0x1,%edx

int get_internal_cmd_type(struct execcmd* cmd)
{
    int cmd_type = INTERNAL_CMD_NONE;

    if ((strcmp(cmd->argv[0], "echo") == 0) && (strcmp(cmd->argv[1], "$?") == 0)) {
      88:	74 1c                	je     a6 <get_internal_cmd_type+0x56>
        cmd_type = INTERNAL_CMD_DOLLAR_QUESTION;
    }
    else if (strcmp(cmd->argv[0], "cd") == 0) {
      8a:	83 ec 08             	sub    $0x8,%esp
      8d:	68 b0 19 00 00       	push   $0x19b0
      92:	ff 73 04             	pushl  0x4(%ebx)
      95:	e8 76 0e 00 00       	call   f10 <strcmp>
      9a:	83 c4 10             	add    $0x10,%esp
      9d:	85 c0                	test   %eax,%eax
        cmd_type = INTERNAL_CMD_CD;
      9f:	ba 02 00 00 00       	mov    $0x2,%edx
    int cmd_type = INTERNAL_CMD_NONE;

    if ((strcmp(cmd->argv[0], "echo") == 0) && (strcmp(cmd->argv[1], "$?") == 0)) {
        cmd_type = INTERNAL_CMD_DOLLAR_QUESTION;
    }
    else if (strcmp(cmd->argv[0], "cd") == 0) {
      a4:	75 0a                	jne    b0 <get_internal_cmd_type+0x60>
    else if (strcmp(cmd->argv[0], "pid") == 0) {
        cmd_type = INTERNAL_CMD_PID;
    }

    return cmd_type;
}
      a6:	89 d0                	mov    %edx,%eax
      a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      ab:	c9                   	leave  
      ac:	c3                   	ret    
      ad:	8d 76 00             	lea    0x0(%esi),%esi
        cmd_type = INTERNAL_CMD_DOLLAR_QUESTION;
    }
    else if (strcmp(cmd->argv[0], "cd") == 0) {
        cmd_type = INTERNAL_CMD_CD;
    }
    else if (strcmp(cmd->argv[0], "exit") == 0) {
      b0:	83 ec 08             	sub    $0x8,%esp
      b3:	68 b6 19 00 00       	push   $0x19b6
      b8:	ff 73 04             	pushl  0x4(%ebx)
      bb:	e8 50 0e 00 00       	call   f10 <strcmp>
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	85 c0                	test   %eax,%eax
        cmd_type = INTERNAL_CMD_EXIT;
      c5:	ba 03 00 00 00       	mov    $0x3,%edx
        cmd_type = INTERNAL_CMD_DOLLAR_QUESTION;
    }
    else if (strcmp(cmd->argv[0], "cd") == 0) {
        cmd_type = INTERNAL_CMD_CD;
    }
    else if (strcmp(cmd->argv[0], "exit") == 0) {
      ca:	74 da                	je     a6 <get_internal_cmd_type+0x56>
        cmd_type = INTERNAL_CMD_EXIT;
    }
    else if ((strcmp(cmd->argv[0], "connect") == 0) && (strcmp(cmd->argv[1], "tty") == 0)) {
      cc:	83 ec 08             	sub    $0x8,%esp
      cf:	68 be 19 00 00       	push   $0x19be
      d4:	ff 73 04             	pushl  0x4(%ebx)
      d7:	e8 34 0e 00 00       	call   f10 <strcmp>
      dc:	83 c4 10             	add    $0x10,%esp
      df:	85 c0                	test   %eax,%eax
      e1:	75 1c                	jne    ff <get_internal_cmd_type+0xaf>
      e3:	83 ec 08             	sub    $0x8,%esp
      e6:	68 c6 19 00 00       	push   $0x19c6
      eb:	ff 73 08             	pushl  0x8(%ebx)
      ee:	e8 1d 0e 00 00       	call   f10 <strcmp>
      f3:	83 c4 10             	add    $0x10,%esp
      f6:	85 c0                	test   %eax,%eax
        cmd_type = INTERNAL_CMD_CONNECT_TTY;
      f8:	ba 04 00 00 00       	mov    $0x4,%edx
        cmd_type = INTERNAL_CMD_CD;
    }
    else if (strcmp(cmd->argv[0], "exit") == 0) {
        cmd_type = INTERNAL_CMD_EXIT;
    }
    else if ((strcmp(cmd->argv[0], "connect") == 0) && (strcmp(cmd->argv[1], "tty") == 0)) {
      fd:	74 a7                	je     a6 <get_internal_cmd_type+0x56>
        cmd_type = INTERNAL_CMD_CONNECT_TTY;
    }
    else if (strcmp(cmd->argv[0], "disconnect") == 0) {
      ff:	83 ec 08             	sub    $0x8,%esp
     102:	68 bb 19 00 00       	push   $0x19bb
     107:	ff 73 04             	pushl  0x4(%ebx)
     10a:	e8 01 0e 00 00       	call   f10 <strcmp>
     10f:	83 c4 10             	add    $0x10,%esp
     112:	85 c0                	test   %eax,%eax
        cmd_type = INTERNAL_CMD_DISCONNECT_TTY;
     114:	ba 05 00 00 00       	mov    $0x5,%edx
        cmd_type = INTERNAL_CMD_EXIT;
    }
    else if ((strcmp(cmd->argv[0], "connect") == 0) && (strcmp(cmd->argv[1], "tty") == 0)) {
        cmd_type = INTERNAL_CMD_CONNECT_TTY;
    }
    else if (strcmp(cmd->argv[0], "disconnect") == 0) {
     119:	74 8b                	je     a6 <get_internal_cmd_type+0x56>
        cmd_type = INTERNAL_CMD_DISCONNECT_TTY;
    }
    else if ((strcmp(cmd->argv[0], "attach") == 0) && (strcmp(cmd->argv[1], "tty") == 0)) {
     11b:	83 ec 08             	sub    $0x8,%esp
     11e:	68 ca 19 00 00       	push   $0x19ca
     123:	ff 73 04             	pushl  0x4(%ebx)
     126:	e8 e5 0d 00 00       	call   f10 <strcmp>
     12b:	83 c4 10             	add    $0x10,%esp
     12e:	85 c0                	test   %eax,%eax
     130:	75 21                	jne    153 <get_internal_cmd_type+0x103>
     132:	83 ec 08             	sub    $0x8,%esp
     135:	68 c6 19 00 00       	push   $0x19c6
     13a:	ff 73 08             	pushl  0x8(%ebx)
     13d:	e8 ce 0d 00 00       	call   f10 <strcmp>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	75 0a                	jne    153 <get_internal_cmd_type+0x103>
        cmd_type = INTERNAL_CMD_ATTACH_TTY;
     149:	ba 06 00 00 00       	mov    $0x6,%edx
     14e:	e9 53 ff ff ff       	jmp    a6 <get_internal_cmd_type+0x56>
    }
    else if (strcmp(cmd->argv[0], "pid") == 0) {
     153:	83 ec 08             	sub    $0x8,%esp
     156:	68 d1 19 00 00       	push   $0x19d1
     15b:	ff 73 04             	pushl  0x4(%ebx)
     15e:	e8 ad 0d 00 00       	call   f10 <strcmp>
     163:	83 c4 10             	add    $0x10,%esp
        cmd_type = INTERNAL_CMD_PID;
     166:	83 f8 01             	cmp    $0x1,%eax
     169:	19 d2                	sbb    %edx,%edx
     16b:	83 e2 07             	and    $0x7,%edx
     16e:	e9 33 ff ff ff       	jmp    a6 <get_internal_cmd_type+0x56>
     173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <runinternal>:
// Returns
// RUN_INTERNAL_CMD_OK : Successful internal command run
// RUN_INTERNAL_CMD_NONE : No internal command ran
// RUN_INTERNAL_CMD_ERROR : There was an error during execution of internal command
int
runinternal(struct cmd** pcmd) {
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	56                   	push   %esi
     184:	53                   	push   %ebx
    struct execcmd* cmd = (struct execcmd*)*pcmd;
     185:	8b 45 08             	mov    0x8(%ebp),%eax

    int cmd_type = get_internal_cmd_type(cmd);
     188:	83 ec 0c             	sub    $0xc,%esp
// RUN_INTERNAL_CMD_OK : Successful internal command run
// RUN_INTERNAL_CMD_NONE : No internal command ran
// RUN_INTERNAL_CMD_ERROR : There was an error during execution of internal command
int
runinternal(struct cmd** pcmd) {
    struct execcmd* cmd = (struct execcmd*)*pcmd;
     18b:	8b 18                	mov    (%eax),%ebx

    int cmd_type = get_internal_cmd_type(cmd);
     18d:	53                   	push   %ebx
     18e:	e8 bd fe ff ff       	call   50 <get_internal_cmd_type>
    int tty_fd;
    switch (cmd_type)
     193:	83 c4 10             	add    $0x10,%esp
     196:	83 f8 07             	cmp    $0x7,%eax
     199:	0f 87 89 01 00 00    	ja     328 <runinternal+0x1a8>
     19f:	ff 24 85 04 1b 00 00 	jmp    *0x1b04(,%eax,4)
     1a6:	8d 76 00             	lea    0x0(%esi),%esi
     1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(2, "%s attached\n", cmd->argv[2]);
      return RUN_INTERNAL_CMD_OK;
      break;

    case INTERNAL_CMD_PID:
      printf(2, "PID: %d\n", getpid());
     1b0:	e8 43 12 00 00       	call   13f8 <getpid>
     1b5:	83 ec 04             	sub    $0x4,%esp
     1b8:	50                   	push   %eax
     1b9:	68 52 1a 00 00       	push   $0x1a52
     1be:	6a 02                	push   $0x2
     1c0:	e8 6b 13 00 00       	call   1530 <printf>
      return RUN_INTERNAL_CMD_OK;
     1c5:	83 c4 10             	add    $0x10,%esp
     1c8:	31 c0                	xor    %eax,%eax
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     1ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1cd:	5b                   	pop    %ebx
     1ce:	5e                   	pop    %esi
     1cf:	5d                   	pop    %ebp
     1d0:	c3                   	ret    
     1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    int cmd_type = get_internal_cmd_type(cmd);
    int tty_fd;
    switch (cmd_type)
    {
    case INTERNAL_CMD_DOLLAR_QUESTION:
      printf(1, "%d\n", last_cmd_retval);
     1d8:	83 ec 04             	sub    $0x4,%esp
     1db:	ff 35 84 30 00 00    	pushl  0x3084
     1e1:	68 57 1a 00 00       	push   $0x1a57
     1e6:	6a 01                	push   $0x1
     1e8:	e8 43 13 00 00       	call   1530 <printf>
      return RUN_INTERNAL_CMD_OK;
     1ed:	83 c4 10             	add    $0x10,%esp
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     1f0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    int tty_fd;
    switch (cmd_type)
    {
    case INTERNAL_CMD_DOLLAR_QUESTION:
      printf(1, "%d\n", last_cmd_retval);
      return RUN_INTERNAL_CMD_OK;
     1f3:	31 c0                	xor    %eax,%eax
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     1f5:	5b                   	pop    %ebx
     1f6:	5e                   	pop    %esi
     1f7:	5d                   	pop    %ebp
     1f8:	c3                   	ret    
     1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return RUN_INTERNAL_CMD_OK;
      break;

    case INTERNAL_CMD_CD:
      // Chdir must be called by the parent, not the child.
      if (chdir(cmd->argv[1]) < 0) {
     200:	83 ec 0c             	sub    $0xc,%esp
     203:	ff 73 08             	pushl  0x8(%ebx)
     206:	e8 dd 11 00 00       	call   13e8 <chdir>
     20b:	83 c4 10             	add    $0x10,%esp
     20e:	85 c0                	test   %eax,%eax
     210:	0f 88 93 01 00 00    	js     3a9 <runinternal+0x229>
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     216:	8d 65 f8             	lea    -0x8(%ebp),%esp
      if (chdir(cmd->argv[1]) < 0) {
        printf(2, "cannot cd %s\n", cmd->argv[1]);
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
      }
      return RUN_INTERNAL_CMD_OK;
     219:	31 c0                	xor    %eax,%eax
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     21b:	5b                   	pop    %ebx
     21c:	5e                   	pop    %esi
     21d:	5d                   	pop    %ebp
     21e:	c3                   	ret    
     21f:	90                   	nop
      return RUN_INTERNAL_CMD_OK;
      break;

    case INTERNAL_CMD_EXIT:
      // exit must be called by the parent, not the child.
      disconnect_tty(0);
     220:	83 ec 0c             	sub    $0xc,%esp
     223:	6a 00                	push   $0x0
     225:	e8 66 17 00 00       	call   1990 <disconnect_tty>
      exit(0);
     22a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     231:	e8 42 11 00 00       	call   1378 <exit>
     236:	8d 76 00             	lea    0x0(%esi),%esi
     239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      break;

    case INTERNAL_CMD_CONNECT_TTY:

      tty_fd = open(cmd->argv[2], O_RDWR);
     240:	83 ec 08             	sub    $0x8,%esp
     243:	6a 02                	push   $0x2
     245:	ff 73 0c             	pushl  0xc(%ebx)
     248:	e8 6b 11 00 00       	call   13b8 <open>
      if(tty_fd < 0){
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
      exit(0);
      break;

    case INTERNAL_CMD_CONNECT_TTY:

      tty_fd = open(cmd->argv[2], O_RDWR);
     252:	89 c3                	mov    %eax,%ebx
      if(tty_fd < 0){
     254:	0f 88 45 01 00 00    	js     39f <runinternal+0x21f>
        printf(2, "exec connect tty failed\n");
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
      }

      if(connect_tty(tty_fd) < 0){
     25a:	83 ec 0c             	sub    $0xc,%esp
     25d:	50                   	push   %eax
     25e:	e8 dd 16 00 00       	call   1940 <connect_tty>
     263:	83 c4 10             	add    $0x10,%esp
     266:	85 c0                	test   %eax,%eax
     268:	0f 88 11 01 00 00    	js     37f <runinternal+0x1ff>
        close(tty_fd);
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
      }

      close(tty_fd);
     26e:	83 ec 0c             	sub    $0xc,%esp
     271:	53                   	push   %ebx
     272:	e8 29 11 00 00       	call   13a0 <close>
      return RUN_INTERNAL_CMD_OK;
     277:	83 c4 10             	add    $0x10,%esp
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     27a:	8d 65 f8             	lea    -0x8(%ebp),%esp
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
      }

      close(tty_fd);
      return RUN_INTERNAL_CMD_OK;
     27d:	31 c0                	xor    %eax,%eax
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     27f:	5b                   	pop    %ebx
     280:	5e                   	pop    %esi
     281:	5d                   	pop    %ebp
     282:	c3                   	ret    
     283:	90                   	nop
     284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return RUN_INTERNAL_CMD_OK;
      break;

    case INTERNAL_CMD_DISCONNECT_TTY:
    
      if (disconnect_tty(0) != 0)
     288:	83 ec 0c             	sub    $0xc,%esp
     28b:	6a 00                	push   $0x0
     28d:	e8 fe 16 00 00       	call   1990 <disconnect_tty>
     292:	83 c4 10             	add    $0x10,%esp
     295:	85 c0                	test   %eax,%eax
     297:	74 12                	je     2ab <runinternal+0x12b>
          printf(2, "disconnect tty failed\n");
     299:	83 ec 08             	sub    $0x8,%esp
     29c:	68 fc 19 00 00       	push   $0x19fc
     2a1:	6a 02                	push   $0x2
     2a3:	e8 88 12 00 00       	call   1530 <printf>
     2a8:	83 c4 10             	add    $0x10,%esp
      sleep(100);
     2ab:	83 ec 0c             	sub    $0xc,%esp
     2ae:	6a 64                	push   $0x64
     2b0:	e8 53 11 00 00       	call   1408 <sleep>
      return RUN_INTERNAL_CMD_OK;
     2b5:	83 c4 10             	add    $0x10,%esp
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     2b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    case INTERNAL_CMD_DISCONNECT_TTY:
    
      if (disconnect_tty(0) != 0)
          printf(2, "disconnect tty failed\n");
      sleep(100);
      return RUN_INTERNAL_CMD_OK;
     2bb:	31 c0                	xor    %eax,%eax
    default:
      return RUN_INTERNAL_CMD_NONE;
      break;
    }

}
     2bd:	5b                   	pop    %ebx
     2be:	5e                   	pop    %esi
     2bf:	5d                   	pop    %ebp
     2c0:	c3                   	ret    
     2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return RUN_INTERNAL_CMD_OK;
      break;

    case INTERNAL_CMD_ATTACH_TTY:

      tty_fd = open(cmd->argv[2], O_RDWR);
     2c8:	83 ec 08             	sub    $0x8,%esp
     2cb:	6a 02                	push   $0x2
     2cd:	ff 73 0c             	pushl  0xc(%ebx)
     2d0:	e8 e3 10 00 00       	call   13b8 <open>
      if(tty_fd < 0){
     2d5:	83 c4 10             	add    $0x10,%esp
     2d8:	85 c0                	test   %eax,%eax
      return RUN_INTERNAL_CMD_OK;
      break;

    case INTERNAL_CMD_ATTACH_TTY:

      tty_fd = open(cmd->argv[2], O_RDWR);
     2da:	89 c6                	mov    %eax,%esi
      if(tty_fd < 0){
     2dc:	78 7b                	js     359 <runinternal+0x1d9>
        printf(2, "exec attach tty failed\n");
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
      }

      if(attach_tty(tty_fd) < 0){
     2de:	83 ec 0c             	sub    $0xc,%esp
     2e1:	50                   	push   %eax
     2e2:	e8 b9 15 00 00       	call   18a0 <attach_tty>
     2e7:	83 c4 10             	add    $0x10,%esp
     2ea:	85 c0                	test   %eax,%eax
     2ec:	78 4a                	js     338 <runinternal+0x1b8>
        printf(2, "exec attach tty failed 2\n");
        close(tty_fd);
        return RUN_INTERNAL_CMD_OK;
      }

      ioctl(tty_fd, TTYSETS, DEV_CONNECT);
     2ee:	83 ec 04             	sub    $0x4,%esp
     2f1:	68 00 10 00 00       	push   $0x1000
     2f6:	6a 01                	push   $0x1
     2f8:	56                   	push   %esi
     2f9:	e8 4a 11 00 00       	call   1448 <ioctl>
      close(tty_fd);
     2fe:	89 34 24             	mov    %esi,(%esp)
     301:	e8 9a 10 00 00       	call   13a0 <close>
      printf(2, "%s attached\n", cmd->argv[2]);
     306:	83 c4 0c             	add    $0xc,%esp
     309:	ff 73 0c             	pushl  0xc(%ebx)
     30c:	68 45 1a 00 00       	push   $0x1a45
     311:	6a 02                	push   $0x2
     313:	e8 18 12 00 00       	call   1530 <printf>
      return RUN_INTERNAL_CMD_OK;
     318:	83 c4 10             	add    $0x10,%esp
     31b:	31 c0                	xor    %eax,%eax
     31d:	e9 a8 fe ff ff       	jmp    1ca <runinternal+0x4a>
     322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(2, "PID: %d\n", getpid());
      return RUN_INTERNAL_CMD_OK;
      break;

    default:
      return RUN_INTERNAL_CMD_NONE;
     328:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     32d:	e9 98 fe ff ff       	jmp    1ca <runinternal+0x4a>
     332:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
      }

      if(attach_tty(tty_fd) < 0){
        printf(2, "exec attach tty failed 2\n");
     338:	83 ec 08             	sub    $0x8,%esp
     33b:	68 2b 1a 00 00       	push   $0x1a2b
     340:	6a 02                	push   $0x2
     342:	e8 e9 11 00 00       	call   1530 <printf>
        close(tty_fd);
     347:	89 34 24             	mov    %esi,(%esp)
     34a:	e8 51 10 00 00       	call   13a0 <close>
        return RUN_INTERNAL_CMD_OK;
     34f:	83 c4 10             	add    $0x10,%esp
     352:	31 c0                	xor    %eax,%eax
     354:	e9 71 fe ff ff       	jmp    1ca <runinternal+0x4a>

    case INTERNAL_CMD_ATTACH_TTY:

      tty_fd = open(cmd->argv[2], O_RDWR);
      if(tty_fd < 0){
        printf(2, "exec attach tty failed\n");
     359:	83 ec 08             	sub    $0x8,%esp
     35c:	68 13 1a 00 00       	push   $0x1a13

    case INTERNAL_CMD_CONNECT_TTY:

      tty_fd = open(cmd->argv[2], O_RDWR);
      if(tty_fd < 0){
        printf(2, "exec connect tty failed\n");
     361:	6a 02                	push   $0x2
     363:	e8 c8 11 00 00       	call   1530 <printf>
  last_cmd_retval = 0;
}

static void last_cmd_retval_set_error(int err)
{
  last_cmd_retval = err;
     368:	c7 05 84 30 00 00 fe 	movl   $0xfffffffe,0x3084
     36f:	ff ff ff 

      tty_fd = open(cmd->argv[2], O_RDWR);
      if(tty_fd < 0){
        printf(2, "exec connect tty failed\n");
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
     372:	83 c4 10             	add    $0x10,%esp
     375:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
     37a:	e9 4b fe ff ff       	jmp    1ca <runinternal+0x4a>
      }

      if(connect_tty(tty_fd) < 0){
        close(tty_fd);
     37f:	83 ec 0c             	sub    $0xc,%esp
     382:	53                   	push   %ebx
     383:	e8 18 10 00 00       	call   13a0 <close>
  last_cmd_retval = 0;
}

static void last_cmd_retval_set_error(int err)
{
  last_cmd_retval = err;
     388:	c7 05 84 30 00 00 fe 	movl   $0xfffffffe,0x3084
     38f:	ff ff ff 
      }

      if(connect_tty(tty_fd) < 0){
        close(tty_fd);
        last_cmd_retval_set_error(RUN_INTERNAL_CMD_ERR);
        return RUN_INTERNAL_CMD_ERR;
     392:	83 c4 10             	add    $0x10,%esp
     395:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
     39a:	e9 2b fe ff ff       	jmp    1ca <runinternal+0x4a>

    case INTERNAL_CMD_CONNECT_TTY:

      tty_fd = open(cmd->argv[2], O_RDWR);
      if(tty_fd < 0){
        printf(2, "exec connect tty failed\n");
     39f:	83 ec 08             	sub    $0x8,%esp
     3a2:	68 e3 19 00 00       	push   $0x19e3
     3a7:	eb b8                	jmp    361 <runinternal+0x1e1>
      break;

    case INTERNAL_CMD_CD:
      // Chdir must be called by the parent, not the child.
      if (chdir(cmd->argv[1]) < 0) {
        printf(2, "cannot cd %s\n", cmd->argv[1]);
     3a9:	50                   	push   %eax
     3aa:	ff 73 08             	pushl  0x8(%ebx)
     3ad:	68 d5 19 00 00       	push   $0x19d5
     3b2:	eb ad                	jmp    361 <runinternal+0x1e1>
     3b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     3ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003c0 <panic>:
  exit(0);
}

void
panic(char *s)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     3c6:	ff 75 08             	pushl  0x8(%ebp)
     3c9:	68 f5 1a 00 00       	push   $0x1af5
     3ce:	6a 02                	push   $0x2
     3d0:	e8 5b 11 00 00       	call   1530 <printf>
  exit(1);
     3d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3dc:	e8 97 0f 00 00       	call   1378 <exit>
     3e1:	eb 0d                	jmp    3f0 <runcmd>
     3e3:	90                   	nop
     3e4:	90                   	nop
     3e5:	90                   	nop
     3e6:	90                   	nop
     3e7:	90                   	nop
     3e8:	90                   	nop
     3e9:	90                   	nop
     3ea:	90                   	nop
     3eb:	90                   	nop
     3ec:	90                   	nop
     3ed:	90                   	nop
     3ee:	90                   	nop
     3ef:	90                   	nop

000003f0 <runcmd>:
}

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	57                   	push   %edi
     3f4:	56                   	push   %esi
     3f5:	53                   	push   %ebx
     3f6:	83 ec 1c             	sub    $0x1c,%esp
     3f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0){
     3fc:	85 db                	test   %ebx,%ebx
     3fe:	0f 84 5c 01 00 00    	je     560 <runcmd+0x170>
      exit(1);
    }



  switch(cmd->type){
     404:	83 3b 05             	cmpl   $0x5,(%ebx)
     407:	0f 87 46 01 00 00    	ja     553 <runcmd+0x163>
     40d:	8b 03                	mov    (%ebx),%eax
     40f:	ff 24 85 24 1b 00 00 	jmp    *0x1b24(,%eax,4)
int
fork1(void)
{
  int pid;

  pid = fork();
     416:	e8 55 0f 00 00       	call   1370 <fork>
  if(pid == -1)
     41b:	83 f8 ff             	cmp    $0xffffffff,%eax
     41e:	0f 84 46 01 00 00    	je     56a <runcmd+0x17a>
    wait(0);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     424:	85 c0                	test   %eax,%eax
     426:	0f 84 84 00 00 00    	je     4b0 <runcmd+0xc0>
      runcmd(bcmd->cmd);
    break;
  }

  exit(0);
     42c:	83 ec 0c             	sub    $0xc,%esp
     42f:	6a 00                	push   $0x0
     431:	e8 42 0f 00 00       	call   1378 <exit>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0){
     436:	8b 43 04             	mov    0x4(%ebx),%eax
     439:	85 c0                	test   %eax,%eax
     43b:	0f 84 1f 01 00 00    	je     560 <runcmd+0x170>
      exit(1);
    }

    exec(ecmd->argv[0], ecmd->argv);
     441:	8d 73 04             	lea    0x4(%ebx),%esi
     444:	52                   	push   %edx
     445:	52                   	push   %edx
     446:	56                   	push   %esi
     447:	50                   	push   %eax
     448:	e8 63 0f 00 00       	call   13b0 <exec>

    fd = open(ecmd->argv[0], O_RDONLY);
     44d:	59                   	pop    %ecx
     44e:	5f                   	pop    %edi
     44f:	6a 00                	push   $0x0
     451:	ff 73 04             	pushl  0x4(%ebx)
     454:	e8 5f 0f 00 00       	call   13b8 <open>
    if (-1 != fd) {
     459:	83 c4 10             	add    $0x10,%esp
     45c:	83 f8 ff             	cmp    $0xffffffff,%eax
     45f:	0f 84 3b 01 00 00    	je     5a0 <runcmd+0x1b0>
        close(fd);
     465:	83 ec 0c             	sub    $0xc,%esp
     468:	50                   	push   %eax
     469:	e8 32 0f 00 00       	call   13a0 <close>
     46e:	83 c4 10             	add    $0x10,%esp
        strcpy(root_cmd + 1, ecmd->argv[0]);
        exec(root_cmd, ecmd->argv);
        free(root_cmd);
    }

    printf(2, "exec %s failed\n", ecmd->argv[0]);
     471:	56                   	push   %esi
     472:	ff 73 04             	pushl  0x4(%ebx)
     475:	68 62 1a 00 00       	push   $0x1a62
     47a:	6a 02                	push   $0x2
     47c:	e8 af 10 00 00       	call   1530 <printf>
    exit(1);
     481:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     488:	e8 eb 0e 00 00       	call   1378 <exit>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     48d:	83 ec 0c             	sub    $0xc,%esp
     490:	ff 73 14             	pushl  0x14(%ebx)
     493:	e8 08 0f 00 00       	call   13a0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     498:	5a                   	pop    %edx
     499:	59                   	pop    %ecx
     49a:	ff 73 10             	pushl  0x10(%ebx)
     49d:	ff 73 08             	pushl  0x8(%ebx)
     4a0:	e8 13 0f 00 00       	call   13b8 <open>
     4a5:	83 c4 10             	add    $0x10,%esp
     4a8:	85 c0                	test   %eax,%eax
     4aa:	0f 88 c7 00 00 00    	js     577 <runcmd+0x187>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     4b0:	83 ec 0c             	sub    $0xc,%esp
     4b3:	ff 73 04             	pushl  0x4(%ebx)
     4b6:	e8 35 ff ff ff       	call   3f0 <runcmd>
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     4bb:	8d 45 e0             	lea    -0x20(%ebp),%eax
     4be:	83 ec 0c             	sub    $0xc,%esp
     4c1:	50                   	push   %eax
     4c2:	e8 c1 0e 00 00       	call   1388 <pipe>
     4c7:	83 c4 10             	add    $0x10,%esp
     4ca:	85 c0                	test   %eax,%eax
     4cc:	0f 88 c1 00 00 00    	js     593 <runcmd+0x1a3>
int
fork1(void)
{
  int pid;

  pid = fork();
     4d2:	e8 99 0e 00 00       	call   1370 <fork>
  if(pid == -1)
     4d7:	83 f8 ff             	cmp    $0xffffffff,%eax
     4da:	0f 84 8a 00 00 00    	je     56a <runcmd+0x17a>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     4e0:	85 c0                	test   %eax,%eax
     4e2:	0f 84 fa 00 00 00    	je     5e2 <runcmd+0x1f2>
int
fork1(void)
{
  int pid;

  pid = fork();
     4e8:	e8 83 0e 00 00       	call   1370 <fork>
  if(pid == -1)
     4ed:	83 f8 ff             	cmp    $0xffffffff,%eax
     4f0:	74 78                	je     56a <runcmd+0x17a>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     4f2:	85 c0                	test   %eax,%eax
     4f4:	0f 84 16 01 00 00    	je     610 <runcmd+0x220>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     4fa:	83 ec 0c             	sub    $0xc,%esp
     4fd:	ff 75 e0             	pushl  -0x20(%ebp)
     500:	e8 9b 0e 00 00       	call   13a0 <close>
    close(p[1]);
     505:	58                   	pop    %eax
     506:	ff 75 e4             	pushl  -0x1c(%ebp)
     509:	e8 92 0e 00 00       	call   13a0 <close>
    wait(0);
     50e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     515:	e8 66 0e 00 00       	call   1380 <wait>
    wait(0);
     51a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     521:	e8 5a 0e 00 00       	call   1380 <wait>
    break;
     526:	83 c4 10             	add    $0x10,%esp
     529:	e9 fe fe ff ff       	jmp    42c <runcmd+0x3c>
int
fork1(void)
{
  int pid;

  pid = fork();
     52e:	e8 3d 0e 00 00       	call   1370 <fork>
  if(pid == -1)
     533:	83 f8 ff             	cmp    $0xffffffff,%eax
     536:	74 32                	je     56a <runcmd+0x17a>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     538:	85 c0                	test   %eax,%eax
     53a:	0f 84 70 ff ff ff    	je     4b0 <runcmd+0xc0>
      runcmd(lcmd->left);
    wait(0);
     540:	83 ec 0c             	sub    $0xc,%esp
     543:	6a 00                	push   $0x0
     545:	e8 36 0e 00 00       	call   1380 <wait>
    runcmd(lcmd->right);
     54a:	58                   	pop    %eax
     54b:	ff 73 08             	pushl  0x8(%ebx)
     54e:	e8 9d fe ff ff       	call   3f0 <runcmd>



  switch(cmd->type){
  default:
    panic("runcmd");
     553:	83 ec 0c             	sub    $0xc,%esp
     556:	68 5b 1a 00 00       	push   $0x1a5b
     55b:	e8 60 fe ff ff       	call   3c0 <panic>
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0){
      exit(1);
     560:	83 ec 0c             	sub    $0xc,%esp
     563:	6a 01                	push   $0x1
     565:	e8 0e 0e 00 00       	call   1378 <exit>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     56a:	83 ec 0c             	sub    $0xc,%esp
     56d:	68 82 1a 00 00       	push   $0x1a82
     572:	e8 49 fe ff ff       	call   3c0 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     577:	50                   	push   %eax
     578:	ff 73 08             	pushl  0x8(%ebx)
     57b:	68 72 1a 00 00       	push   $0x1a72
     580:	6a 02                	push   $0x2
     582:	e8 a9 0f 00 00       	call   1530 <printf>
      exit(1);
     587:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     58e:	e8 e5 0d 00 00       	call   1378 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     593:	83 ec 0c             	sub    $0xc,%esp
     596:	68 87 1a 00 00       	push   $0x1a87
     59b:	e8 20 fe ff ff       	call   3c0 <panic>
    fd = open(ecmd->argv[0], O_RDONLY);
    if (-1 != fd) {
        close(fd);
        fd = -1;
    } else {
        char * root_cmd = malloc(strlen(ecmd->argv[0]) + 1);
     5a0:	83 ec 0c             	sub    $0xc,%esp
     5a3:	ff 73 04             	pushl  0x4(%ebx)
     5a6:	e8 45 0a 00 00       	call   ff0 <strlen>
     5ab:	83 c0 01             	add    $0x1,%eax
     5ae:	89 04 24             	mov    %eax,(%esp)
     5b1:	e8 ba 11 00 00       	call   1770 <malloc>
     5b6:	89 c7                	mov    %eax,%edi
        root_cmd[0] = '/';
     5b8:	c6 00 2f             	movb   $0x2f,(%eax)
        strcpy(root_cmd + 1, ecmd->argv[0]);
     5bb:	58                   	pop    %eax
     5bc:	8d 47 01             	lea    0x1(%edi),%eax
     5bf:	5a                   	pop    %edx
     5c0:	ff 73 04             	pushl  0x4(%ebx)
     5c3:	50                   	push   %eax
     5c4:	e8 17 09 00 00       	call   ee0 <strcpy>
        exec(root_cmd, ecmd->argv);
     5c9:	59                   	pop    %ecx
     5ca:	58                   	pop    %eax
     5cb:	56                   	push   %esi
     5cc:	57                   	push   %edi
     5cd:	e8 de 0d 00 00       	call   13b0 <exec>
        free(root_cmd);
     5d2:	89 3c 24             	mov    %edi,(%esp)
     5d5:	e8 06 11 00 00       	call   16e0 <free>
     5da:	83 c4 10             	add    $0x10,%esp
     5dd:	e9 8f fe ff ff       	jmp    471 <runcmd+0x81>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     5e2:	83 ec 0c             	sub    $0xc,%esp
     5e5:	6a 01                	push   $0x1
     5e7:	e8 b4 0d 00 00       	call   13a0 <close>
      dup(p[1]);
     5ec:	58                   	pop    %eax
     5ed:	ff 75 e4             	pushl  -0x1c(%ebp)
     5f0:	e8 fb 0d 00 00       	call   13f0 <dup>
      close(p[0]);
     5f5:	58                   	pop    %eax
     5f6:	ff 75 e0             	pushl  -0x20(%ebp)
     5f9:	e8 a2 0d 00 00       	call   13a0 <close>
      close(p[1]);
     5fe:	58                   	pop    %eax
     5ff:	ff 75 e4             	pushl  -0x1c(%ebp)
     602:	e8 99 0d 00 00       	call   13a0 <close>
      runcmd(pcmd->left);
     607:	58                   	pop    %eax
     608:	ff 73 04             	pushl  0x4(%ebx)
     60b:	e8 e0 fd ff ff       	call   3f0 <runcmd>
    }
    if(fork1() == 0){
      close(0);
     610:	83 ec 0c             	sub    $0xc,%esp
     613:	6a 00                	push   $0x0
     615:	e8 86 0d 00 00       	call   13a0 <close>
      dup(p[0]);
     61a:	5a                   	pop    %edx
     61b:	ff 75 e0             	pushl  -0x20(%ebp)
     61e:	e8 cd 0d 00 00       	call   13f0 <dup>
      close(p[0]);
     623:	59                   	pop    %ecx
     624:	ff 75 e0             	pushl  -0x20(%ebp)
     627:	e8 74 0d 00 00       	call   13a0 <close>
      close(p[1]);
     62c:	5e                   	pop    %esi
     62d:	ff 75 e4             	pushl  -0x1c(%ebp)
     630:	e8 6b 0d 00 00       	call   13a0 <close>
      runcmd(pcmd->right);
     635:	5f                   	pop    %edi
     636:	ff 73 08             	pushl  0x8(%ebx)
     639:	e8 b2 fd ff ff       	call   3f0 <runcmd>
     63e:	66 90                	xchg   %ax,%ax

00000640 <fork1>:
  exit(1);
}

int
fork1(void)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     646:	e8 25 0d 00 00       	call   1370 <fork>
  if(pid == -1)
     64b:	83 f8 ff             	cmp    $0xffffffff,%eax
     64e:	74 02                	je     652 <fork1+0x12>
    panic("fork");
  return pid;
}
     650:	c9                   	leave  
     651:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     652:	83 ec 0c             	sub    $0xc,%esp
     655:	68 82 1a 00 00       	push   $0x1a82
     65a:	e8 61 fd ff ff       	call   3c0 <panic>
     65f:	90                   	nop

00000660 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	53                   	push   %ebx
     664:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     667:	6a 54                	push   $0x54
     669:	e8 02 11 00 00       	call   1770 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     66e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     671:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     673:	6a 54                	push   $0x54
     675:	6a 00                	push   $0x0
     677:	50                   	push   %eax
     678:	e8 a3 09 00 00       	call   1020 <memset>
  cmd->type = EXEC;
     67d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     683:	89 d8                	mov    %ebx,%eax
     685:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     688:	c9                   	leave  
     689:	c3                   	ret    
     68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000690 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     690:	55                   	push   %ebp
     691:	89 e5                	mov    %esp,%ebp
     693:	53                   	push   %ebx
     694:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     697:	6a 18                	push   $0x18
     699:	e8 d2 10 00 00       	call   1770 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     69e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6a1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     6a3:	6a 18                	push   $0x18
     6a5:	6a 00                	push   $0x0
     6a7:	50                   	push   %eax
     6a8:	e8 73 09 00 00       	call   1020 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     6ad:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     6b0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     6b6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     6b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     6bc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     6bf:	8b 45 10             	mov    0x10(%ebp),%eax
     6c2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     6c5:	8b 45 14             	mov    0x14(%ebp),%eax
     6c8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     6cb:	8b 45 18             	mov    0x18(%ebp),%eax
     6ce:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     6d1:	89 d8                	mov    %ebx,%eax
     6d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6d6:	c9                   	leave  
     6d7:	c3                   	ret    
     6d8:	90                   	nop
     6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006e0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     6e0:	55                   	push   %ebp
     6e1:	89 e5                	mov    %esp,%ebp
     6e3:	53                   	push   %ebx
     6e4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6e7:	6a 0c                	push   $0xc
     6e9:	e8 82 10 00 00       	call   1770 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6ee:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6f1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     6f3:	6a 0c                	push   $0xc
     6f5:	6a 00                	push   $0x0
     6f7:	50                   	push   %eax
     6f8:	e8 23 09 00 00       	call   1020 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     6fd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     700:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     706:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     709:	8b 45 0c             	mov    0xc(%ebp),%eax
     70c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     70f:	89 d8                	mov    %ebx,%eax
     711:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     714:	c9                   	leave  
     715:	c3                   	ret    
     716:	8d 76 00             	lea    0x0(%esi),%esi
     719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000720 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	53                   	push   %ebx
     724:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     727:	6a 0c                	push   $0xc
     729:	e8 42 10 00 00       	call   1770 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     72e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     731:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     733:	6a 0c                	push   $0xc
     735:	6a 00                	push   $0x0
     737:	50                   	push   %eax
     738:	e8 e3 08 00 00       	call   1020 <memset>
  cmd->type = LIST;
  cmd->left = left;
     73d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     740:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     746:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     749:	8b 45 0c             	mov    0xc(%ebp),%eax
     74c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     74f:	89 d8                	mov    %ebx,%eax
     751:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     754:	c9                   	leave  
     755:	c3                   	ret    
     756:	8d 76 00             	lea    0x0(%esi),%esi
     759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000760 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     760:	55                   	push   %ebp
     761:	89 e5                	mov    %esp,%ebp
     763:	53                   	push   %ebx
     764:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     767:	6a 08                	push   $0x8
     769:	e8 02 10 00 00       	call   1770 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     76e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     771:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     773:	6a 08                	push   $0x8
     775:	6a 00                	push   $0x0
     777:	50                   	push   %eax
     778:	e8 a3 08 00 00       	call   1020 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     77d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     780:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     786:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     789:	89 d8                	mov    %ebx,%eax
     78b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     78e:	c9                   	leave  
     78f:	c3                   	ret    

00000790 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     799:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     79c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     79f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     7a2:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     7a4:	39 df                	cmp    %ebx,%edi
     7a6:	72 13                	jb     7bb <gettoken+0x2b>
     7a8:	eb 29                	jmp    7d3 <gettoken+0x43>
     7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     7b0:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     7b3:	39 fb                	cmp    %edi,%ebx
     7b5:	0f 84 ed 00 00 00    	je     8a8 <gettoken+0x118>
     7bb:	0f be 07             	movsbl (%edi),%eax
     7be:	83 ec 08             	sub    $0x8,%esp
     7c1:	50                   	push   %eax
     7c2:	68 08 30 00 00       	push   $0x3008
     7c7:	e8 74 08 00 00       	call   1040 <strchr>
     7cc:	83 c4 10             	add    $0x10,%esp
     7cf:	85 c0                	test   %eax,%eax
     7d1:	75 dd                	jne    7b0 <gettoken+0x20>
    s++;
  if(q)
     7d3:	85 f6                	test   %esi,%esi
     7d5:	74 02                	je     7d9 <gettoken+0x49>
    *q = s;
     7d7:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     7d9:	0f be 37             	movsbl (%edi),%esi
     7dc:	89 f1                	mov    %esi,%ecx
     7de:	89 f0                	mov    %esi,%eax
  switch(*s){
     7e0:	80 f9 29             	cmp    $0x29,%cl
     7e3:	7f 5b                	jg     840 <gettoken+0xb0>
     7e5:	80 f9 28             	cmp    $0x28,%cl
     7e8:	7d 61                	jge    84b <gettoken+0xbb>
     7ea:	84 c9                	test   %cl,%cl
     7ec:	0f 85 de 00 00 00    	jne    8d0 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     7f2:	8b 55 14             	mov    0x14(%ebp),%edx
     7f5:	85 d2                	test   %edx,%edx
     7f7:	74 05                	je     7fe <gettoken+0x6e>
    *eq = s;
     7f9:	8b 45 14             	mov    0x14(%ebp),%eax
     7fc:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     7fe:	39 fb                	cmp    %edi,%ebx
     800:	77 0d                	ja     80f <gettoken+0x7f>
     802:	eb 23                	jmp    827 <gettoken+0x97>
     804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     808:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     80b:	39 fb                	cmp    %edi,%ebx
     80d:	74 18                	je     827 <gettoken+0x97>
     80f:	0f be 07             	movsbl (%edi),%eax
     812:	83 ec 08             	sub    $0x8,%esp
     815:	50                   	push   %eax
     816:	68 08 30 00 00       	push   $0x3008
     81b:	e8 20 08 00 00       	call   1040 <strchr>
     820:	83 c4 10             	add    $0x10,%esp
     823:	85 c0                	test   %eax,%eax
     825:	75 e1                	jne    808 <gettoken+0x78>
    s++;
  *ps = s;
     827:	8b 45 08             	mov    0x8(%ebp),%eax
     82a:	89 38                	mov    %edi,(%eax)
  return ret;
}
     82c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     82f:	89 f0                	mov    %esi,%eax
     831:	5b                   	pop    %ebx
     832:	5e                   	pop    %esi
     833:	5f                   	pop    %edi
     834:	5d                   	pop    %ebp
     835:	c3                   	ret    
     836:	8d 76 00             	lea    0x0(%esi),%esi
     839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     840:	80 f9 3e             	cmp    $0x3e,%cl
     843:	75 0b                	jne    850 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     845:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     849:	74 75                	je     8c0 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     84b:	83 c7 01             	add    $0x1,%edi
     84e:	eb a2                	jmp    7f2 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     850:	7f 5e                	jg     8b0 <gettoken+0x120>
     852:	83 e9 3b             	sub    $0x3b,%ecx
     855:	80 f9 01             	cmp    $0x1,%cl
     858:	76 f1                	jbe    84b <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     85a:	39 fb                	cmp    %edi,%ebx
     85c:	77 24                	ja     882 <gettoken+0xf2>
     85e:	eb 7c                	jmp    8dc <gettoken+0x14c>
     860:	0f be 07             	movsbl (%edi),%eax
     863:	83 ec 08             	sub    $0x8,%esp
     866:	50                   	push   %eax
     867:	68 00 30 00 00       	push   $0x3000
     86c:	e8 cf 07 00 00       	call   1040 <strchr>
     871:	83 c4 10             	add    $0x10,%esp
     874:	85 c0                	test   %eax,%eax
     876:	75 1f                	jne    897 <gettoken+0x107>
      s++;
     878:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     87b:	39 fb                	cmp    %edi,%ebx
     87d:	74 5b                	je     8da <gettoken+0x14a>
     87f:	0f be 07             	movsbl (%edi),%eax
     882:	83 ec 08             	sub    $0x8,%esp
     885:	50                   	push   %eax
     886:	68 08 30 00 00       	push   $0x3008
     88b:	e8 b0 07 00 00       	call   1040 <strchr>
     890:	83 c4 10             	add    $0x10,%esp
     893:	85 c0                	test   %eax,%eax
     895:	74 c9                	je     860 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     897:	be 61 00 00 00       	mov    $0x61,%esi
     89c:	e9 51 ff ff ff       	jmp    7f2 <gettoken+0x62>
     8a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8a8:	89 df                	mov    %ebx,%edi
     8aa:	e9 24 ff ff ff       	jmp    7d3 <gettoken+0x43>
     8af:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     8b0:	80 f9 7c             	cmp    $0x7c,%cl
     8b3:	74 96                	je     84b <gettoken+0xbb>
     8b5:	eb a3                	jmp    85a <gettoken+0xca>
     8b7:	89 f6                	mov    %esi,%esi
     8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     8c0:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     8c3:	be 2b 00 00 00       	mov    $0x2b,%esi
     8c8:	e9 25 ff ff ff       	jmp    7f2 <gettoken+0x62>
     8cd:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     8d0:	80 f9 26             	cmp    $0x26,%cl
     8d3:	75 85                	jne    85a <gettoken+0xca>
     8d5:	e9 71 ff ff ff       	jmp    84b <gettoken+0xbb>
     8da:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     8dc:	8b 45 14             	mov    0x14(%ebp),%eax
     8df:	be 61 00 00 00       	mov    $0x61,%esi
     8e4:	85 c0                	test   %eax,%eax
     8e6:	0f 85 0d ff ff ff    	jne    7f9 <gettoken+0x69>
     8ec:	e9 36 ff ff ff       	jmp    827 <gettoken+0x97>
     8f1:	eb 0d                	jmp    900 <peek>
     8f3:	90                   	nop
     8f4:	90                   	nop
     8f5:	90                   	nop
     8f6:	90                   	nop
     8f7:	90                   	nop
     8f8:	90                   	nop
     8f9:	90                   	nop
     8fa:	90                   	nop
     8fb:	90                   	nop
     8fc:	90                   	nop
     8fd:	90                   	nop
     8fe:	90                   	nop
     8ff:	90                   	nop

00000900 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 0c             	sub    $0xc,%esp
     909:	8b 7d 08             	mov    0x8(%ebp),%edi
     90c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     90f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     911:	39 f3                	cmp    %esi,%ebx
     913:	72 12                	jb     927 <peek+0x27>
     915:	eb 28                	jmp    93f <peek+0x3f>
     917:	89 f6                	mov    %esi,%esi
     919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     920:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     923:	39 de                	cmp    %ebx,%esi
     925:	74 18                	je     93f <peek+0x3f>
     927:	0f be 03             	movsbl (%ebx),%eax
     92a:	83 ec 08             	sub    $0x8,%esp
     92d:	50                   	push   %eax
     92e:	68 08 30 00 00       	push   $0x3008
     933:	e8 08 07 00 00       	call   1040 <strchr>
     938:	83 c4 10             	add    $0x10,%esp
     93b:	85 c0                	test   %eax,%eax
     93d:	75 e1                	jne    920 <peek+0x20>
    s++;
  *ps = s;
     93f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     941:	0f be 13             	movsbl (%ebx),%edx
     944:	31 c0                	xor    %eax,%eax
     946:	84 d2                	test   %dl,%dl
     948:	74 17                	je     961 <peek+0x61>
     94a:	83 ec 08             	sub    $0x8,%esp
     94d:	52                   	push   %edx
     94e:	ff 75 10             	pushl  0x10(%ebp)
     951:	e8 ea 06 00 00       	call   1040 <strchr>
     956:	83 c4 10             	add    $0x10,%esp
     959:	85 c0                	test   %eax,%eax
     95b:	0f 95 c0             	setne  %al
     95e:	0f b6 c0             	movzbl %al,%eax
}
     961:	8d 65 f4             	lea    -0xc(%ebp),%esp
     964:	5b                   	pop    %ebx
     965:	5e                   	pop    %esi
     966:	5f                   	pop    %edi
     967:	5d                   	pop    %ebp
     968:	c3                   	ret    
     969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000970 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     970:	55                   	push   %ebp
     971:	89 e5                	mov    %esp,%ebp
     973:	57                   	push   %edi
     974:	56                   	push   %esi
     975:	53                   	push   %ebx
     976:	83 ec 1c             	sub    $0x1c,%esp
     979:	8b 75 0c             	mov    0xc(%ebp),%esi
     97c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     97f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     980:	83 ec 04             	sub    $0x4,%esp
     983:	68 a9 1a 00 00       	push   $0x1aa9
     988:	53                   	push   %ebx
     989:	56                   	push   %esi
     98a:	e8 71 ff ff ff       	call   900 <peek>
     98f:	83 c4 10             	add    $0x10,%esp
     992:	85 c0                	test   %eax,%eax
     994:	74 6a                	je     a00 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     996:	6a 00                	push   $0x0
     998:	6a 00                	push   $0x0
     99a:	53                   	push   %ebx
     99b:	56                   	push   %esi
     99c:	e8 ef fd ff ff       	call   790 <gettoken>
     9a1:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     9a3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     9a6:	50                   	push   %eax
     9a7:	8d 45 e0             	lea    -0x20(%ebp),%eax
     9aa:	50                   	push   %eax
     9ab:	53                   	push   %ebx
     9ac:	56                   	push   %esi
     9ad:	e8 de fd ff ff       	call   790 <gettoken>
     9b2:	83 c4 20             	add    $0x20,%esp
     9b5:	83 f8 61             	cmp    $0x61,%eax
     9b8:	75 51                	jne    a0b <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     9ba:	83 ff 3c             	cmp    $0x3c,%edi
     9bd:	74 31                	je     9f0 <parseredirs+0x80>
     9bf:	83 ff 3e             	cmp    $0x3e,%edi
     9c2:	74 05                	je     9c9 <parseredirs+0x59>
     9c4:	83 ff 2b             	cmp    $0x2b,%edi
     9c7:	75 b7                	jne    980 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9c9:	83 ec 0c             	sub    $0xc,%esp
     9cc:	6a 01                	push   $0x1
     9ce:	68 01 02 00 00       	push   $0x201
     9d3:	ff 75 e4             	pushl  -0x1c(%ebp)
     9d6:	ff 75 e0             	pushl  -0x20(%ebp)
     9d9:	ff 75 08             	pushl  0x8(%ebp)
     9dc:	e8 af fc ff ff       	call   690 <redircmd>
      break;
     9e1:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9e4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9e7:	eb 97                	jmp    980 <parseredirs+0x10>
     9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     9f0:	83 ec 0c             	sub    $0xc,%esp
     9f3:	6a 00                	push   $0x0
     9f5:	6a 00                	push   $0x0
     9f7:	eb da                	jmp    9d3 <parseredirs+0x63>
     9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     a00:	8b 45 08             	mov    0x8(%ebp),%eax
     a03:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a06:	5b                   	pop    %ebx
     a07:	5e                   	pop    %esi
     a08:	5f                   	pop    %edi
     a09:	5d                   	pop    %ebp
     a0a:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     a0b:	83 ec 0c             	sub    $0xc,%esp
     a0e:	68 8c 1a 00 00       	push   $0x1a8c
     a13:	e8 a8 f9 ff ff       	call   3c0 <panic>
     a18:	90                   	nop
     a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 30             	sub    $0x30,%esp
     a29:	8b 75 08             	mov    0x8(%ebp),%esi
     a2c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     a2f:	68 ac 1a 00 00       	push   $0x1aac
     a34:	57                   	push   %edi
     a35:	56                   	push   %esi
     a36:	e8 c5 fe ff ff       	call   900 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	0f 85 9a 00 00 00    	jne    ae0 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     a46:	e8 15 fc ff ff       	call   660 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     a4b:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     a4e:	89 c3                	mov    %eax,%ebx
     a50:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     a53:	57                   	push   %edi
     a54:	56                   	push   %esi
     a55:	8d 5b 04             	lea    0x4(%ebx),%ebx
     a58:	50                   	push   %eax
     a59:	e8 12 ff ff ff       	call   970 <parseredirs>
     a5e:	83 c4 10             	add    $0x10,%esp
     a61:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     a64:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     a6b:	eb 16                	jmp    a83 <parseexec+0x63>
     a6d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     a70:	83 ec 04             	sub    $0x4,%esp
     a73:	57                   	push   %edi
     a74:	56                   	push   %esi
     a75:	ff 75 d0             	pushl  -0x30(%ebp)
     a78:	e8 f3 fe ff ff       	call   970 <parseredirs>
     a7d:	83 c4 10             	add    $0x10,%esp
     a80:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     a83:	83 ec 04             	sub    $0x4,%esp
     a86:	68 c3 1a 00 00       	push   $0x1ac3
     a8b:	57                   	push   %edi
     a8c:	56                   	push   %esi
     a8d:	e8 6e fe ff ff       	call   900 <peek>
     a92:	83 c4 10             	add    $0x10,%esp
     a95:	85 c0                	test   %eax,%eax
     a97:	75 5f                	jne    af8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     a99:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     a9c:	50                   	push   %eax
     a9d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     aa0:	50                   	push   %eax
     aa1:	57                   	push   %edi
     aa2:	56                   	push   %esi
     aa3:	e8 e8 fc ff ff       	call   790 <gettoken>
     aa8:	83 c4 10             	add    $0x10,%esp
     aab:	85 c0                	test   %eax,%eax
     aad:	74 49                	je     af8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     aaf:	83 f8 61             	cmp    $0x61,%eax
     ab2:	75 66                	jne    b1a <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     ab4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     ab7:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     abb:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     abe:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     ac1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ac4:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     ac7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     aca:	83 f8 0a             	cmp    $0xa,%eax
     acd:	75 a1                	jne    a70 <parseexec+0x50>
      panic("too many args");
     acf:	83 ec 0c             	sub    $0xc,%esp
     ad2:	68 b5 1a 00 00       	push   $0x1ab5
     ad7:	e8 e4 f8 ff ff       	call   3c0 <panic>
     adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     ae0:	83 ec 08             	sub    $0x8,%esp
     ae3:	57                   	push   %edi
     ae4:	56                   	push   %esi
     ae5:	e8 56 01 00 00       	call   c40 <parseblock>
     aea:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     aed:	8d 65 f4             	lea    -0xc(%ebp),%esp
     af0:	5b                   	pop    %ebx
     af1:	5e                   	pop    %esi
     af2:	5f                   	pop    %edi
     af3:	5d                   	pop    %ebp
     af4:	c3                   	ret    
     af5:	8d 76 00             	lea    0x0(%esi),%esi
     af8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     afb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     afe:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     b01:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     b08:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     b0f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     b12:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b15:	5b                   	pop    %ebx
     b16:	5e                   	pop    %esi
     b17:	5f                   	pop    %edi
     b18:	5d                   	pop    %ebp
     b19:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     b1a:	83 ec 0c             	sub    $0xc,%esp
     b1d:	68 ae 1a 00 00       	push   $0x1aae
     b22:	e8 99 f8 ff ff       	call   3c0 <panic>
     b27:	89 f6                	mov    %esi,%esi
     b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b30 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	83 ec 14             	sub    $0x14,%esp
     b39:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b3c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     b3f:	56                   	push   %esi
     b40:	53                   	push   %ebx
     b41:	e8 da fe ff ff       	call   a20 <parseexec>
  if(peek(ps, es, "|")){
     b46:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     b49:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     b4b:	68 c8 1a 00 00       	push   $0x1ac8
     b50:	56                   	push   %esi
     b51:	53                   	push   %ebx
     b52:	e8 a9 fd ff ff       	call   900 <peek>
     b57:	83 c4 10             	add    $0x10,%esp
     b5a:	85 c0                	test   %eax,%eax
     b5c:	75 12                	jne    b70 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     b5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b61:	89 f8                	mov    %edi,%eax
     b63:	5b                   	pop    %ebx
     b64:	5e                   	pop    %esi
     b65:	5f                   	pop    %edi
     b66:	5d                   	pop    %ebp
     b67:	c3                   	ret    
     b68:	90                   	nop
     b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     b70:	6a 00                	push   $0x0
     b72:	6a 00                	push   $0x0
     b74:	56                   	push   %esi
     b75:	53                   	push   %ebx
     b76:	e8 15 fc ff ff       	call   790 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b7b:	58                   	pop    %eax
     b7c:	5a                   	pop    %edx
     b7d:	56                   	push   %esi
     b7e:	53                   	push   %ebx
     b7f:	e8 ac ff ff ff       	call   b30 <parsepipe>
     b84:	89 7d 08             	mov    %edi,0x8(%ebp)
     b87:	89 45 0c             	mov    %eax,0xc(%ebp)
     b8a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     b8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b90:	5b                   	pop    %ebx
     b91:	5e                   	pop    %esi
     b92:	5f                   	pop    %edi
     b93:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b94:	e9 47 fb ff ff       	jmp    6e0 <pipecmd>
     b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	57                   	push   %edi
     ba4:	56                   	push   %esi
     ba5:	53                   	push   %ebx
     ba6:	83 ec 14             	sub    $0x14,%esp
     ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     bac:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     baf:	56                   	push   %esi
     bb0:	53                   	push   %ebx
     bb1:	e8 7a ff ff ff       	call   b30 <parsepipe>
  while(peek(ps, es, "&")){
     bb6:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     bb9:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     bbb:	eb 1b                	jmp    bd8 <parseline+0x38>
     bbd:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     bc0:	6a 00                	push   $0x0
     bc2:	6a 00                	push   $0x0
     bc4:	56                   	push   %esi
     bc5:	53                   	push   %ebx
     bc6:	e8 c5 fb ff ff       	call   790 <gettoken>
    cmd = backcmd(cmd);
     bcb:	89 3c 24             	mov    %edi,(%esp)
     bce:	e8 8d fb ff ff       	call   760 <backcmd>
     bd3:	83 c4 10             	add    $0x10,%esp
     bd6:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     bd8:	83 ec 04             	sub    $0x4,%esp
     bdb:	68 ca 1a 00 00       	push   $0x1aca
     be0:	56                   	push   %esi
     be1:	53                   	push   %ebx
     be2:	e8 19 fd ff ff       	call   900 <peek>
     be7:	83 c4 10             	add    $0x10,%esp
     bea:	85 c0                	test   %eax,%eax
     bec:	75 d2                	jne    bc0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     bee:	83 ec 04             	sub    $0x4,%esp
     bf1:	68 c6 1a 00 00       	push   $0x1ac6
     bf6:	56                   	push   %esi
     bf7:	53                   	push   %ebx
     bf8:	e8 03 fd ff ff       	call   900 <peek>
     bfd:	83 c4 10             	add    $0x10,%esp
     c00:	85 c0                	test   %eax,%eax
     c02:	75 0c                	jne    c10 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     c04:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c07:	89 f8                	mov    %edi,%eax
     c09:	5b                   	pop    %ebx
     c0a:	5e                   	pop    %esi
     c0b:	5f                   	pop    %edi
     c0c:	5d                   	pop    %ebp
     c0d:	c3                   	ret    
     c0e:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     c10:	6a 00                	push   $0x0
     c12:	6a 00                	push   $0x0
     c14:	56                   	push   %esi
     c15:	53                   	push   %ebx
     c16:	e8 75 fb ff ff       	call   790 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     c1b:	58                   	pop    %eax
     c1c:	5a                   	pop    %edx
     c1d:	56                   	push   %esi
     c1e:	53                   	push   %ebx
     c1f:	e8 7c ff ff ff       	call   ba0 <parseline>
     c24:	89 7d 08             	mov    %edi,0x8(%ebp)
     c27:	89 45 0c             	mov    %eax,0xc(%ebp)
     c2a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     c2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c30:	5b                   	pop    %ebx
     c31:	5e                   	pop    %esi
     c32:	5f                   	pop    %edi
     c33:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     c34:	e9 e7 fa ff ff       	jmp    720 <listcmd>
     c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c40 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	57                   	push   %edi
     c44:	56                   	push   %esi
     c45:	53                   	push   %ebx
     c46:	83 ec 10             	sub    $0x10,%esp
     c49:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c4c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     c4f:	68 ac 1a 00 00       	push   $0x1aac
     c54:	56                   	push   %esi
     c55:	53                   	push   %ebx
     c56:	e8 a5 fc ff ff       	call   900 <peek>
     c5b:	83 c4 10             	add    $0x10,%esp
     c5e:	85 c0                	test   %eax,%eax
     c60:	74 4a                	je     cac <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     c62:	6a 00                	push   $0x0
     c64:	6a 00                	push   $0x0
     c66:	56                   	push   %esi
     c67:	53                   	push   %ebx
     c68:	e8 23 fb ff ff       	call   790 <gettoken>
  cmd = parseline(ps, es);
     c6d:	58                   	pop    %eax
     c6e:	5a                   	pop    %edx
     c6f:	56                   	push   %esi
     c70:	53                   	push   %ebx
     c71:	e8 2a ff ff ff       	call   ba0 <parseline>
  if(!peek(ps, es, ")"))
     c76:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     c79:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     c7b:	68 e8 1a 00 00       	push   $0x1ae8
     c80:	56                   	push   %esi
     c81:	53                   	push   %ebx
     c82:	e8 79 fc ff ff       	call   900 <peek>
     c87:	83 c4 10             	add    $0x10,%esp
     c8a:	85 c0                	test   %eax,%eax
     c8c:	74 2b                	je     cb9 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     c8e:	6a 00                	push   $0x0
     c90:	6a 00                	push   $0x0
     c92:	56                   	push   %esi
     c93:	53                   	push   %ebx
     c94:	e8 f7 fa ff ff       	call   790 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     c99:	83 c4 0c             	add    $0xc,%esp
     c9c:	56                   	push   %esi
     c9d:	53                   	push   %ebx
     c9e:	57                   	push   %edi
     c9f:	e8 cc fc ff ff       	call   970 <parseredirs>
  return cmd;
}
     ca4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ca7:	5b                   	pop    %ebx
     ca8:	5e                   	pop    %esi
     ca9:	5f                   	pop    %edi
     caa:	5d                   	pop    %ebp
     cab:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     cac:	83 ec 0c             	sub    $0xc,%esp
     caf:	68 cc 1a 00 00       	push   $0x1acc
     cb4:	e8 07 f7 ff ff       	call   3c0 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     cb9:	83 ec 0c             	sub    $0xc,%esp
     cbc:	68 d7 1a 00 00       	push   $0x1ad7
     cc1:	e8 fa f6 ff ff       	call   3c0 <panic>
     cc6:	8d 76 00             	lea    0x0(%esi),%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	53                   	push   %ebx
     cd4:	83 ec 04             	sub    $0x4,%esp
     cd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     cda:	85 db                	test   %ebx,%ebx
     cdc:	0f 84 96 00 00 00    	je     d78 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     ce2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ce5:	77 48                	ja     d2f <nulterminate+0x5f>
     ce7:	8b 03                	mov    (%ebx),%eax
     ce9:	ff 24 85 3c 1b 00 00 	jmp    *0x1b3c(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     cf0:	83 ec 0c             	sub    $0xc,%esp
     cf3:	ff 73 04             	pushl  0x4(%ebx)
     cf6:	e8 d5 ff ff ff       	call   cd0 <nulterminate>
    nulterminate(lcmd->right);
     cfb:	58                   	pop    %eax
     cfc:	ff 73 08             	pushl  0x8(%ebx)
     cff:	e8 cc ff ff ff       	call   cd0 <nulterminate>
    break;
     d04:	83 c4 10             	add    $0x10,%esp
     d07:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     d09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d0c:	c9                   	leave  
     d0d:	c3                   	ret    
     d0e:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     d10:	8b 4b 04             	mov    0x4(%ebx),%ecx
     d13:	8d 43 2c             	lea    0x2c(%ebx),%eax
     d16:	85 c9                	test   %ecx,%ecx
     d18:	74 15                	je     d2f <nulterminate+0x5f>
     d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     d20:	8b 10                	mov    (%eax),%edx
     d22:	83 c0 04             	add    $0x4,%eax
     d25:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     d28:	8b 50 d8             	mov    -0x28(%eax),%edx
     d2b:	85 d2                	test   %edx,%edx
     d2d:	75 f1                	jne    d20 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     d2f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     d31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d34:	c9                   	leave  
     d35:	c3                   	ret    
     d36:	8d 76 00             	lea    0x0(%esi),%esi
     d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     d40:	83 ec 0c             	sub    $0xc,%esp
     d43:	ff 73 04             	pushl  0x4(%ebx)
     d46:	e8 85 ff ff ff       	call   cd0 <nulterminate>
    break;
     d4b:	89 d8                	mov    %ebx,%eax
     d4d:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     d50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d53:	c9                   	leave  
     d54:	c3                   	ret    
     d55:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     d58:	83 ec 0c             	sub    $0xc,%esp
     d5b:	ff 73 04             	pushl  0x4(%ebx)
     d5e:	e8 6d ff ff ff       	call   cd0 <nulterminate>
    *rcmd->efile = 0;
     d63:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     d66:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     d69:	c6 00 00             	movb   $0x0,(%eax)
    break;
     d6c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     d6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d71:	c9                   	leave  
     d72:	c3                   	ret    
     d73:	90                   	nop
     d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     d78:	31 c0                	xor    %eax,%eax
     d7a:	eb 8d                	jmp    d09 <nulterminate+0x39>
     d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d80 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	56                   	push   %esi
     d84:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     d85:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d88:	83 ec 0c             	sub    $0xc,%esp
     d8b:	53                   	push   %ebx
     d8c:	e8 5f 02 00 00       	call   ff0 <strlen>
  cmd = parseline(&s, es);
     d91:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     d92:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     d94:	8d 45 08             	lea    0x8(%ebp),%eax
     d97:	5e                   	pop    %esi
     d98:	53                   	push   %ebx
     d99:	50                   	push   %eax
     d9a:	e8 01 fe ff ff       	call   ba0 <parseline>
     d9f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     da1:	8d 45 08             	lea    0x8(%ebp),%eax
     da4:	83 c4 0c             	add    $0xc,%esp
     da7:	68 44 1a 00 00       	push   $0x1a44
     dac:	53                   	push   %ebx
     dad:	50                   	push   %eax
     dae:	e8 4d fb ff ff       	call   900 <peek>
  if(s != es){
     db3:	8b 45 08             	mov    0x8(%ebp),%eax
     db6:	83 c4 10             	add    $0x10,%esp
     db9:	39 c3                	cmp    %eax,%ebx
     dbb:	75 12                	jne    dcf <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     dbd:	83 ec 0c             	sub    $0xc,%esp
     dc0:	56                   	push   %esi
     dc1:	e8 0a ff ff ff       	call   cd0 <nulterminate>
  return cmd;
}
     dc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dc9:	89 f0                	mov    %esi,%eax
     dcb:	5b                   	pop    %ebx
     dcc:	5e                   	pop    %esi
     dcd:	5d                   	pop    %ebp
     dce:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     dcf:	52                   	push   %edx
     dd0:	50                   	push   %eax
     dd1:	68 ea 1a 00 00       	push   $0x1aea
     dd6:	6a 02                	push   $0x2
     dd8:	e8 53 07 00 00       	call   1530 <printf>
    panic("syntax");
     ddd:	c7 04 24 ae 1a 00 00 	movl   $0x1aae,(%esp)
     de4:	e8 d7 f5 ff ff       	call   3c0 <panic>
     de9:	66 90                	xchg   %ax,%ax
     deb:	66 90                	xchg   %ax,%ax
     ded:	66 90                	xchg   %ax,%ax
     def:	90                   	nop

00000df0 <main>:

}

int
main(void)
{
     df0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     df4:	83 e4 f0             	and    $0xfffffff0,%esp
     df7:	ff 71 fc             	pushl  -0x4(%ecx)
     dfa:	55                   	push   %ebp
     dfb:	89 e5                	mov    %esp,%ebp
     dfd:	53                   	push   %ebx
     dfe:	51                   	push   %ecx
     dff:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd, retval;
  struct cmd* pcmd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     e02:	eb 0d                	jmp    e11 <main+0x21>
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
     e08:	83 f8 02             	cmp    $0x2,%eax
     e0b:	0f 8f a1 00 00 00    	jg     eb2 <main+0xc2>
  static char buf[100];
  int fd, retval;
  struct cmd* pcmd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     e11:	83 ec 08             	sub    $0x8,%esp
     e14:	6a 02                	push   $0x2
     e16:	68 f9 1a 00 00       	push   $0x1af9
     e1b:	e8 98 05 00 00       	call   13b8 <open>
     e20:	83 c4 10             	add    $0x10,%esp
     e23:	85 c0                	test   %eax,%eax
     e25:	79 e1                	jns    e08 <main+0x18>
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      pcmd = parsecmd(buf);
      retval = runinternal(&pcmd);
     e27:	8d 5d f4             	lea    -0xc(%ebp),%ebx
     e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     e30:	83 ec 08             	sub    $0x8,%esp
     e33:	6a 64                	push   $0x64
     e35:	68 20 30 00 00       	push   $0x3020
     e3a:	e8 c1 f1 ff ff       	call   0 <getcmd>
     e3f:	83 c4 10             	add    $0x10,%esp
     e42:	85 c0                	test   %eax,%eax
     e44:	78 62                	js     ea8 <main+0xb8>
      pcmd = parsecmd(buf);
     e46:	83 ec 0c             	sub    $0xc,%esp
     e49:	68 20 30 00 00       	push   $0x3020
     e4e:	e8 2d ff ff ff       	call   d80 <parsecmd>
      retval = runinternal(&pcmd);
     e53:	89 1c 24             	mov    %ebx,(%esp)
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      pcmd = parsecmd(buf);
     e56:	89 45 f4             	mov    %eax,-0xc(%ebp)
      retval = runinternal(&pcmd);
     e59:	e8 22 f3 ff ff       	call   180 <runinternal>
      if(retval == 0) {
     e5e:	83 c4 10             	add    $0x10,%esp
     e61:	85 c0                	test   %eax,%eax
     e63:	75 13                	jne    e78 <main+0x88>
static int last_cmd_retval; // keeps the value of last cmd's return value


static void last_cmd_retval_no_error(void)
{
  last_cmd_retval = 0;
     e65:	c7 05 84 30 00 00 00 	movl   $0x0,0x3084
     e6c:	00 00 00 
  while(getcmd(buf, sizeof(buf)) >= 0){
      pcmd = parsecmd(buf);
      retval = runinternal(&pcmd);
      if(retval == 0) {
      last_cmd_retval_no_error();
      continue;
     e6f:	eb bf                	jmp    e30 <main+0x40>
     e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if (retval == -2) {
     e78:	83 f8 fe             	cmp    $0xfffffffe,%eax
     e7b:	74 b3                	je     e30 <main+0x40>
int
fork1(void)
{
  int pid;

  pid = fork();
     e7d:	e8 ee 04 00 00       	call   1370 <fork>
  if(pid == -1)
     e82:	83 f8 ff             	cmp    $0xffffffff,%eax
     e85:	74 3c                	je     ec3 <main+0xd3>
      continue;
    } else if (retval == -2) {
      continue;
    }

    if(fork1() == 0)
     e87:	85 c0                	test   %eax,%eax
     e89:	74 45                	je     ed0 <main+0xe0>
      runcmd(pcmd);
    wait(&last_cmd_retval);
     e8b:	83 ec 0c             	sub    $0xc,%esp
     e8e:	68 84 30 00 00       	push   $0x3084
     e93:	e8 e8 04 00 00       	call   1380 <wait>
  last_cmd_retval = err;
}

static void last_cmd_retval_update_wait_exit_status(void)
{
  last_cmd_retval = WEXITSTATUS(last_cmd_retval);
     e98:	c1 3d 84 30 00 00 08 	sarl   $0x8,0x3084
     e9f:	83 c4 10             	add    $0x10,%esp
     ea2:	eb 8c                	jmp    e30 <main+0x40>
     ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fork1() == 0)
      runcmd(pcmd);
    wait(&last_cmd_retval);
    last_cmd_retval_update_wait_exit_status();
  }
  exit(0);
     ea8:	83 ec 0c             	sub    $0xc,%esp
     eab:	6a 00                	push   $0x0
     ead:	e8 c6 04 00 00       	call   1378 <exit>
  struct cmd* pcmd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
     eb2:	83 ec 0c             	sub    $0xc,%esp
     eb5:	50                   	push   %eax
     eb6:	e8 e5 04 00 00       	call   13a0 <close>
      break;
     ebb:	83 c4 10             	add    $0x10,%esp
     ebe:	e9 64 ff ff ff       	jmp    e27 <main+0x37>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     ec3:	83 ec 0c             	sub    $0xc,%esp
     ec6:	68 82 1a 00 00       	push   $0x1a82
     ecb:	e8 f0 f4 ff ff       	call   3c0 <panic>
    } else if (retval == -2) {
      continue;
    }

    if(fork1() == 0)
      runcmd(pcmd);
     ed0:	83 ec 0c             	sub    $0xc,%esp
     ed3:	ff 75 f4             	pushl  -0xc(%ebp)
     ed6:	e8 15 f5 ff ff       	call   3f0 <runcmd>
     edb:	66 90                	xchg   %ax,%ax
     edd:	66 90                	xchg   %ax,%ax
     edf:	90                   	nop

00000ee0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     ee0:	55                   	push   %ebp
     ee1:	89 e5                	mov    %esp,%ebp
     ee3:	53                   	push   %ebx
     ee4:	8b 45 08             	mov    0x8(%ebp),%eax
     ee7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     eea:	89 c2                	mov    %eax,%edx
     eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ef0:	83 c1 01             	add    $0x1,%ecx
     ef3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     ef7:	83 c2 01             	add    $0x1,%edx
     efa:	84 db                	test   %bl,%bl
     efc:	88 5a ff             	mov    %bl,-0x1(%edx)
     eff:	75 ef                	jne    ef0 <strcpy+0x10>
    ;
  return os;
}
     f01:	5b                   	pop    %ebx
     f02:	5d                   	pop    %ebp
     f03:	c3                   	ret    
     f04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000f10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     f10:	55                   	push   %ebp
     f11:	89 e5                	mov    %esp,%ebp
     f13:	56                   	push   %esi
     f14:	53                   	push   %ebx
     f15:	8b 55 08             	mov    0x8(%ebp),%edx
     f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     f1b:	0f b6 02             	movzbl (%edx),%eax
     f1e:	0f b6 19             	movzbl (%ecx),%ebx
     f21:	84 c0                	test   %al,%al
     f23:	75 1e                	jne    f43 <strcmp+0x33>
     f25:	eb 29                	jmp    f50 <strcmp+0x40>
     f27:	89 f6                	mov    %esi,%esi
     f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     f30:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     f33:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     f36:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     f39:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     f3d:	84 c0                	test   %al,%al
     f3f:	74 0f                	je     f50 <strcmp+0x40>
     f41:	89 f1                	mov    %esi,%ecx
     f43:	38 d8                	cmp    %bl,%al
     f45:	74 e9                	je     f30 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     f47:	29 d8                	sub    %ebx,%eax
}
     f49:	5b                   	pop    %ebx
     f4a:	5e                   	pop    %esi
     f4b:	5d                   	pop    %ebp
     f4c:	c3                   	ret    
     f4d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     f50:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     f52:	29 d8                	sub    %ebx,%eax
}
     f54:	5b                   	pop    %ebx
     f55:	5e                   	pop    %esi
     f56:	5d                   	pop    %ebp
     f57:	c3                   	ret    
     f58:	90                   	nop
     f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f60 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	57                   	push   %edi
     f64:	56                   	push   %esi
     f65:	8b 55 08             	mov    0x8(%ebp),%edx
     f68:	53                   	push   %ebx
     f69:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
     f6c:	0f b6 32             	movzbl (%edx),%esi
     f6f:	89 f0                	mov    %esi,%eax
     f71:	84 c0                	test   %al,%al
     f73:	74 67                	je     fdc <strncmp+0x7c>
     f75:	0f b6 19             	movzbl (%ecx),%ebx
     f78:	89 f0                	mov    %esi,%eax
     f7a:	38 d8                	cmp    %bl,%al
     f7c:	75 65                	jne    fe3 <strncmp+0x83>
     f7e:	8b 5d 10             	mov    0x10(%ebp),%ebx
     f81:	89 f0                	mov    %esi,%eax
     f83:	0f b6 f0             	movzbl %al,%esi
     f86:	89 f0                	mov    %esi,%eax
     f88:	83 eb 01             	sub    $0x1,%ebx
     f8b:	75 14                	jne    fa1 <strncmp+0x41>
     f8d:	eb 25                	jmp    fb4 <strncmp+0x54>
     f8f:	90                   	nop
     f90:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
     f94:	89 f1                	mov    %esi,%ecx
     f96:	38 c8                	cmp    %cl,%al
     f98:	75 26                	jne    fc0 <strncmp+0x60>
     f9a:	83 eb 01             	sub    $0x1,%ebx
     f9d:	89 f9                	mov    %edi,%ecx
     f9f:	74 2f                	je     fd0 <strncmp+0x70>
    p++, q++;
     fa1:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     fa4:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     fa7:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     faa:	84 c0                	test   %al,%al
     fac:	75 e2                	jne    f90 <strncmp+0x30>
     fae:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
     fb2:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     fb4:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     fb5:	29 f0                	sub    %esi,%eax
}
     fb7:	5e                   	pop    %esi
     fb8:	5f                   	pop    %edi
     fb9:	5d                   	pop    %ebp
     fba:	c3                   	ret    
     fbb:	90                   	nop
     fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fc0:	0f b6 f1             	movzbl %cl,%esi
     fc3:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     fc4:	29 f0                	sub    %esi,%eax
}
     fc6:	5e                   	pop    %esi
     fc7:	5f                   	pop    %edi
     fc8:	5d                   	pop    %ebp
     fc9:	c3                   	ret    
     fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fd0:	0f b6 f0             	movzbl %al,%esi
     fd3:	89 f0                	mov    %esi,%eax
     fd5:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     fd6:	29 f0                	sub    %esi,%eax
}
     fd8:	5e                   	pop    %esi
     fd9:	5f                   	pop    %edi
     fda:	5d                   	pop    %ebp
     fdb:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     fdc:	31 c0                	xor    %eax,%eax
     fde:	0f b6 31             	movzbl (%ecx),%esi
     fe1:	eb d1                	jmp    fb4 <strncmp+0x54>
     fe3:	0f b6 c0             	movzbl %al,%eax
     fe6:	0f b6 f3             	movzbl %bl,%esi
     fe9:	eb c9                	jmp    fb4 <strncmp+0x54>
     feb:	90                   	nop
     fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ff0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     ff6:	80 39 00             	cmpb   $0x0,(%ecx)
     ff9:	74 12                	je     100d <strlen+0x1d>
     ffb:	31 d2                	xor    %edx,%edx
     ffd:	8d 76 00             	lea    0x0(%esi),%esi
    1000:	83 c2 01             	add    $0x1,%edx
    1003:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1007:	89 d0                	mov    %edx,%eax
    1009:	75 f5                	jne    1000 <strlen+0x10>
    ;
  return n;
}
    100b:	5d                   	pop    %ebp
    100c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    100d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    100f:	5d                   	pop    %ebp
    1010:	c3                   	ret    
    1011:	eb 0d                	jmp    1020 <memset>
    1013:	90                   	nop
    1014:	90                   	nop
    1015:	90                   	nop
    1016:	90                   	nop
    1017:	90                   	nop
    1018:	90                   	nop
    1019:	90                   	nop
    101a:	90                   	nop
    101b:	90                   	nop
    101c:	90                   	nop
    101d:	90                   	nop
    101e:	90                   	nop
    101f:	90                   	nop

00001020 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1020:	55                   	push   %ebp
    1021:	89 e5                	mov    %esp,%ebp
    1023:	57                   	push   %edi
    1024:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1027:	8b 4d 10             	mov    0x10(%ebp),%ecx
    102a:	8b 45 0c             	mov    0xc(%ebp),%eax
    102d:	89 d7                	mov    %edx,%edi
    102f:	fc                   	cld    
    1030:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1032:	89 d0                	mov    %edx,%eax
    1034:	5f                   	pop    %edi
    1035:	5d                   	pop    %ebp
    1036:	c3                   	ret    
    1037:	89 f6                	mov    %esi,%esi
    1039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001040 <strchr>:

char*
strchr(const char *s, char c)
{
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	53                   	push   %ebx
    1044:	8b 45 08             	mov    0x8(%ebp),%eax
    1047:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    104a:	0f b6 10             	movzbl (%eax),%edx
    104d:	84 d2                	test   %dl,%dl
    104f:	74 1d                	je     106e <strchr+0x2e>
    if(*s == c)
    1051:	38 d3                	cmp    %dl,%bl
    1053:	89 d9                	mov    %ebx,%ecx
    1055:	75 0d                	jne    1064 <strchr+0x24>
    1057:	eb 17                	jmp    1070 <strchr+0x30>
    1059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1060:	38 ca                	cmp    %cl,%dl
    1062:	74 0c                	je     1070 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1064:	83 c0 01             	add    $0x1,%eax
    1067:	0f b6 10             	movzbl (%eax),%edx
    106a:	84 d2                	test   %dl,%dl
    106c:	75 f2                	jne    1060 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    106e:	31 c0                	xor    %eax,%eax
}
    1070:	5b                   	pop    %ebx
    1071:	5d                   	pop    %ebp
    1072:	c3                   	ret    
    1073:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001080 <gets>:

char*
gets(char *buf, int max)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	57                   	push   %edi
    1084:	56                   	push   %esi
    1085:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1086:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1089:	31 db                	xor    %ebx,%ebx
    108b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    1090:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1093:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    1096:	7d 30                	jge    10c8 <gets+0x48>
    cc = read(0, &c, 1);
    1098:	83 ec 04             	sub    $0x4,%esp
    109b:	6a 01                	push   $0x1
    109d:	56                   	push   %esi
    109e:	6a 00                	push   $0x0
    10a0:	e8 eb 02 00 00       	call   1390 <read>
    if(cc < 1)
    10a5:	83 c4 10             	add    $0x10,%esp
    10a8:	85 c0                	test   %eax,%eax
    10aa:	7e e7                	jle    1093 <gets+0x13>
      continue;
    buf[i++] = c;
    10ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    10b0:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    10b3:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    10b5:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    10b8:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    10ba:	74 0c                	je     10c8 <gets+0x48>
    10bc:	3c 0d                	cmp    $0xd,%al
    10be:	74 08                	je     10c8 <gets+0x48>
    10c0:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    10c3:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    10c6:	7c d0                	jl     1098 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    10c8:	8b 45 08             	mov    0x8(%ebp),%eax
    10cb:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    10cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10d2:	5b                   	pop    %ebx
    10d3:	5e                   	pop    %esi
    10d4:	5f                   	pop    %edi
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	89 f6                	mov    %esi,%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <stat>:

int
stat(const char *n, struct stat *st)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	56                   	push   %esi
    10e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    10e5:	83 ec 08             	sub    $0x8,%esp
    10e8:	6a 00                	push   $0x0
    10ea:	ff 75 08             	pushl  0x8(%ebp)
    10ed:	e8 c6 02 00 00       	call   13b8 <open>
  if(fd < 0)
    10f2:	83 c4 10             	add    $0x10,%esp
    10f5:	85 c0                	test   %eax,%eax
    10f7:	78 27                	js     1120 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    10f9:	83 ec 08             	sub    $0x8,%esp
    10fc:	ff 75 0c             	pushl  0xc(%ebp)
    10ff:	89 c3                	mov    %eax,%ebx
    1101:	50                   	push   %eax
    1102:	e8 c9 02 00 00       	call   13d0 <fstat>
    1107:	89 c6                	mov    %eax,%esi
  close(fd);
    1109:	89 1c 24             	mov    %ebx,(%esp)
    110c:	e8 8f 02 00 00       	call   13a0 <close>
  return r;
    1111:	83 c4 10             	add    $0x10,%esp
    1114:	89 f0                	mov    %esi,%eax
}
    1116:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1119:	5b                   	pop    %ebx
    111a:	5e                   	pop    %esi
    111b:	5d                   	pop    %ebp
    111c:	c3                   	ret    
    111d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1120:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1125:	eb ef                	jmp    1116 <stat+0x36>
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1137:	0f be 11             	movsbl (%ecx),%edx
    113a:	8d 42 d0             	lea    -0x30(%edx),%eax
    113d:	3c 09                	cmp    $0x9,%al
    113f:	b8 00 00 00 00       	mov    $0x0,%eax
    1144:	77 1f                	ja     1165 <atoi+0x35>
    1146:	8d 76 00             	lea    0x0(%esi),%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1150:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1153:	83 c1 01             	add    $0x1,%ecx
    1156:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    115a:	0f be 11             	movsbl (%ecx),%edx
    115d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1160:	80 fb 09             	cmp    $0x9,%bl
    1163:	76 eb                	jbe    1150 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1165:	5b                   	pop    %ebx
    1166:	5d                   	pop    %ebp
    1167:	c3                   	ret    
    1168:	90                   	nop
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001170 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	56                   	push   %esi
    1174:	53                   	push   %ebx
    1175:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1178:	8b 45 08             	mov    0x8(%ebp),%eax
    117b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    117e:	85 db                	test   %ebx,%ebx
    1180:	7e 14                	jle    1196 <memmove+0x26>
    1182:	31 d2                	xor    %edx,%edx
    1184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1188:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    118c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    118f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1192:	39 da                	cmp    %ebx,%edx
    1194:	75 f2                	jne    1188 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1196:	5b                   	pop    %ebx
    1197:	5e                   	pop    %esi
    1198:	5d                   	pop    %ebp
    1199:	c3                   	ret    
    119a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011a0 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	56                   	push   %esi
    11a5:	53                   	push   %ebx
    11a6:	83 ec 04             	sub    $0x4,%esp
    11a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
    11ac:	83 f9 00             	cmp    $0x0,%ecx
    11af:	7e 76                	jle    1227 <itoa+0x87>
    11b1:	89 cb                	mov    %ecx,%ebx
    11b3:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
    11b5:	bf 67 66 66 66       	mov    $0x66666667,%edi
    11ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11c0:	89 d8                	mov    %ebx,%eax
    11c2:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
    11c5:	83 c6 01             	add    $0x1,%esi
        i /= 10;
    11c8:	f7 ef                	imul   %edi
    11ca:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
    11cd:	29 da                	sub    %ebx,%edx
    11cf:	89 d3                	mov    %edx,%ebx
    11d1:	75 ed                	jne    11c0 <itoa+0x20>
        length++;
    11d3:	89 f3                	mov    %esi,%ebx
    11d5:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
    11d8:	bf 67 66 66 66       	mov    $0x66666667,%edi
    11dd:	8b 75 08             	mov    0x8(%ebp),%esi
    11e0:	eb 0a                	jmp    11ec <itoa+0x4c>
    11e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    11e8:	85 db                	test   %ebx,%ebx
    11ea:	7e 25                	jle    1211 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
    11ec:	89 c8                	mov    %ecx,%eax
    11ee:	f7 ef                	imul   %edi
    11f0:	89 c8                	mov    %ecx,%eax
    11f2:	c1 f8 1f             	sar    $0x1f,%eax
    11f5:	c1 fa 02             	sar    $0x2,%edx
    11f8:	29 c2                	sub    %eax,%edx
    11fa:	8d 04 92             	lea    (%edx,%edx,4),%eax
    11fd:	01 c0                	add    %eax,%eax
    11ff:	29 c1                	sub    %eax,%ecx
    1201:	83 c1 30             	add    $0x30,%ecx
    1204:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    1208:	83 eb 01             	sub    $0x1,%ebx
    120b:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    120d:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    120f:	7f d7                	jg     11e8 <itoa+0x48>
    1211:	8b 75 f0             	mov    -0x10(%ebp),%esi
    1214:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
    1216:	8b 7d 08             	mov    0x8(%ebp),%edi
    1219:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
    121d:	83 c4 04             	add    $0x4,%esp
    1220:	89 f0                	mov    %esi,%eax
    1222:	5b                   	pop    %ebx
    1223:	5e                   	pop    %esi
    1224:	5f                   	pop    %edi
    1225:	5d                   	pop    %ebp
    1226:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
    1227:	75 12                	jne    123b <itoa+0x9b>
        buf[0] = '0';
    1229:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
    122c:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
    1231:	c6 00 30             	movb   $0x30,(%eax)
    1234:	b8 01 00 00 00       	mov    $0x1,%eax
    1239:	eb db                	jmp    1216 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
    123b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
    123d:	31 f6                	xor    %esi,%esi
    123f:	eb d5                	jmp    1216 <itoa+0x76>
    1241:	eb 0d                	jmp    1250 <strcat>
    1243:	90                   	nop
    1244:	90                   	nop
    1245:	90                   	nop
    1246:	90                   	nop
    1247:	90                   	nop
    1248:	90                   	nop
    1249:	90                   	nop
    124a:	90                   	nop
    124b:	90                   	nop
    124c:	90                   	nop
    124d:	90                   	nop
    124e:	90                   	nop
    124f:	90                   	nop

00001250 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	56                   	push   %esi
    1255:	8b 45 08             	mov    0x8(%ebp),%eax
    1258:	53                   	push   %ebx
    1259:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
    125c:	80 38 00             	cmpb   $0x0,(%eax)
    125f:	74 38                	je     1299 <strcat+0x49>
    1261:	31 c9                	xor    %ecx,%ecx
    1263:	90                   	nop
    1264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1268:	83 c1 01             	add    $0x1,%ecx
    126b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
    126f:	89 ca                	mov    %ecx,%edx
    1271:	75 f5                	jne    1268 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
    1273:	0f b6 1e             	movzbl (%esi),%ebx
    1276:	84 db                	test   %bl,%bl
    1278:	74 16                	je     1290 <strcat+0x40>
    127a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
    127d:	31 d2                	xor    %edx,%edx
    127f:	90                   	nop
                dest[i + j] = source[j];
    1280:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
    1283:	83 c2 01             	add    $0x1,%edx
    1286:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
    128a:	84 db                	test   %bl,%bl
    128c:	75 f2                	jne    1280 <strcat+0x30>
    128e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
    1290:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
    1294:	5b                   	pop    %ebx
    1295:	5e                   	pop    %esi
    1296:	5f                   	pop    %edi
    1297:	5d                   	pop    %ebp
    1298:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
    1299:	31 d2                	xor    %edx,%edx
    129b:	31 c9                	xor    %ecx,%ecx
    129d:	eb d4                	jmp    1273 <strcat+0x23>
    129f:	90                   	nop

000012a0 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	56                   	push   %esi
    12a5:	53                   	push   %ebx
    12a6:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    12a9:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
    12ac:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    12af:	0f b6 00             	movzbl (%eax),%eax
    12b2:	84 c0                	test   %al,%al
    12b4:	88 45 f3             	mov    %al,-0xd(%ebp)
    12b7:	0f 84 a0 00 00 00    	je     135d <strstr+0xbd>
    12bd:	8b 55 0c             	mov    0xc(%ebp),%edx
    12c0:	31 c0                	xor    %eax,%eax
    12c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12c8:	83 c0 01             	add    $0x1,%eax
    12cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    12cf:	75 f7                	jne    12c8 <strstr+0x28>
    12d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    12d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    12d7:	0f b6 07             	movzbl (%edi),%eax
    12da:	84 c0                	test   %al,%al
    12dc:	74 68                	je     1346 <strstr+0xa6>
    12de:	31 d2                	xor    %edx,%edx
    12e0:	83 c2 01             	add    $0x1,%edx
    12e3:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
    12e7:	75 f7                	jne    12e0 <strstr+0x40>
    12e9:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    12ec:	84 c0                	test   %al,%al
    12ee:	89 5d ec             	mov    %ebx,-0x14(%ebp)
    12f1:	74 4d                	je     1340 <strstr+0xa0>
    12f3:	90                   	nop
    12f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12f8:	38 45 f3             	cmp    %al,-0xd(%ebp)
    12fb:	75 34                	jne    1331 <strstr+0x91>
    12fd:	8b 5d e8             	mov    -0x18(%ebp),%ebx
    1300:	83 eb 01             	sub    $0x1,%ebx
    1303:	74 4b                	je     1350 <strstr+0xb0>
    1305:	8b 55 0c             	mov    0xc(%ebp),%edx
    1308:	89 f8                	mov    %edi,%eax
    130a:	eb 10                	jmp    131c <strstr+0x7c>
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1310:	3a 4a 01             	cmp    0x1(%edx),%cl
    1313:	75 1c                	jne    1331 <strstr+0x91>
    1315:	83 eb 01             	sub    $0x1,%ebx
    1318:	89 f2                	mov    %esi,%edx
    131a:	74 34                	je     1350 <strstr+0xb0>
    p++, q++;
    131c:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    131f:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
    1322:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    1325:	84 c9                	test   %cl,%cl
    1327:	75 e7                	jne    1310 <strstr+0x70>
    1329:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    132d:	84 c0                	test   %al,%al
    132f:	74 1f                	je     1350 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
    1331:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
    1334:	3b 7d ec             	cmp    -0x14(%ebp),%edi
    1337:	74 0d                	je     1346 <strstr+0xa6>
    1339:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    133c:	84 c0                	test   %al,%al
    133e:	75 b8                	jne    12f8 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    1340:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    1344:	eb e7                	jmp    132d <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
    1346:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
    1349:	31 c0                	xor    %eax,%eax
}
    134b:	5b                   	pop    %ebx
    134c:	5e                   	pop    %esi
    134d:	5f                   	pop    %edi
    134e:	5d                   	pop    %ebp
    134f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
    1350:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
    1353:	83 c4 10             	add    $0x10,%esp
    1356:	5b                   	pop    %ebx
    1357:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
    1358:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
    135a:	5f                   	pop    %edi
    135b:	5d                   	pop    %ebp
    135c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    135d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1364:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    136b:	e9 67 ff ff ff       	jmp    12d7 <strstr+0x37>

00001370 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1370:	b8 01 00 00 00       	mov    $0x1,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <exit>:
SYSCALL(exit)
    1378:	b8 02 00 00 00       	mov    $0x2,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <wait>:
SYSCALL(wait)
    1380:	b8 03 00 00 00       	mov    $0x3,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <pipe>:
SYSCALL(pipe)
    1388:	b8 04 00 00 00       	mov    $0x4,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <read>:
SYSCALL(read)
    1390:	b8 05 00 00 00       	mov    $0x5,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <write>:
SYSCALL(write)
    1398:	b8 10 00 00 00       	mov    $0x10,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <close>:
SYSCALL(close)
    13a0:	b8 15 00 00 00       	mov    $0x15,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <kill>:
SYSCALL(kill)
    13a8:	b8 06 00 00 00       	mov    $0x6,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <exec>:
SYSCALL(exec)
    13b0:	b8 07 00 00 00       	mov    $0x7,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <open>:
SYSCALL(open)
    13b8:	b8 0f 00 00 00       	mov    $0xf,%eax
    13bd:	cd 40                	int    $0x40
    13bf:	c3                   	ret    

000013c0 <mknod>:
SYSCALL(mknod)
    13c0:	b8 11 00 00 00       	mov    $0x11,%eax
    13c5:	cd 40                	int    $0x40
    13c7:	c3                   	ret    

000013c8 <unlink>:
SYSCALL(unlink)
    13c8:	b8 12 00 00 00       	mov    $0x12,%eax
    13cd:	cd 40                	int    $0x40
    13cf:	c3                   	ret    

000013d0 <fstat>:
SYSCALL(fstat)
    13d0:	b8 08 00 00 00       	mov    $0x8,%eax
    13d5:	cd 40                	int    $0x40
    13d7:	c3                   	ret    

000013d8 <link>:
SYSCALL(link)
    13d8:	b8 13 00 00 00       	mov    $0x13,%eax
    13dd:	cd 40                	int    $0x40
    13df:	c3                   	ret    

000013e0 <mkdir>:
SYSCALL(mkdir)
    13e0:	b8 14 00 00 00       	mov    $0x14,%eax
    13e5:	cd 40                	int    $0x40
    13e7:	c3                   	ret    

000013e8 <chdir>:
SYSCALL(chdir)
    13e8:	b8 09 00 00 00       	mov    $0x9,%eax
    13ed:	cd 40                	int    $0x40
    13ef:	c3                   	ret    

000013f0 <dup>:
SYSCALL(dup)
    13f0:	b8 0a 00 00 00       	mov    $0xa,%eax
    13f5:	cd 40                	int    $0x40
    13f7:	c3                   	ret    

000013f8 <getpid>:
SYSCALL(getpid)
    13f8:	b8 0b 00 00 00       	mov    $0xb,%eax
    13fd:	cd 40                	int    $0x40
    13ff:	c3                   	ret    

00001400 <sbrk>:
SYSCALL(sbrk)
    1400:	b8 0c 00 00 00       	mov    $0xc,%eax
    1405:	cd 40                	int    $0x40
    1407:	c3                   	ret    

00001408 <sleep>:
SYSCALL(sleep)
    1408:	b8 0d 00 00 00       	mov    $0xd,%eax
    140d:	cd 40                	int    $0x40
    140f:	c3                   	ret    

00001410 <uptime>:
SYSCALL(uptime)
    1410:	b8 0e 00 00 00       	mov    $0xe,%eax
    1415:	cd 40                	int    $0x40
    1417:	c3                   	ret    

00001418 <mount>:
SYSCALL(mount)
    1418:	b8 16 00 00 00       	mov    $0x16,%eax
    141d:	cd 40                	int    $0x40
    141f:	c3                   	ret    

00001420 <umount>:
SYSCALL(umount)
    1420:	b8 17 00 00 00       	mov    $0x17,%eax
    1425:	cd 40                	int    $0x40
    1427:	c3                   	ret    

00001428 <printmounts>:
SYSCALL(printmounts)
    1428:	b8 18 00 00 00       	mov    $0x18,%eax
    142d:	cd 40                	int    $0x40
    142f:	c3                   	ret    

00001430 <printdevices>:
SYSCALL(printdevices)
    1430:	b8 19 00 00 00       	mov    $0x19,%eax
    1435:	cd 40                	int    $0x40
    1437:	c3                   	ret    

00001438 <unshare>:
SYSCALL(unshare)
    1438:	b8 1a 00 00 00       	mov    $0x1a,%eax
    143d:	cd 40                	int    $0x40
    143f:	c3                   	ret    

00001440 <usleep>:
SYSCALL(usleep)
    1440:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1445:	cd 40                	int    $0x40
    1447:	c3                   	ret    

00001448 <ioctl>:
SYSCALL(ioctl)
    1448:	b8 1c 00 00 00       	mov    $0x1c,%eax
    144d:	cd 40                	int    $0x40
    144f:	c3                   	ret    

00001450 <getppid>:
SYSCALL(getppid)
    1450:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1455:	cd 40                	int    $0x40
    1457:	c3                   	ret    

00001458 <getcpu>:
SYSCALL(getcpu)
    1458:	b8 1e 00 00 00       	mov    $0x1e,%eax
    145d:	cd 40                	int    $0x40
    145f:	c3                   	ret    

00001460 <getmem>:
SYSCALL(getmem)
    1460:	b8 1f 00 00 00       	mov    $0x1f,%eax
    1465:	cd 40                	int    $0x40
    1467:	c3                   	ret    

00001468 <kmemtest>:
SYSCALL(kmemtest)
    1468:	b8 20 00 00 00       	mov    $0x20,%eax
    146d:	cd 40                	int    $0x40
    146f:	c3                   	ret    

00001470 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	53                   	push   %ebx
    1476:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1479:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    147c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    147f:	85 db                	test   %ebx,%ebx
    1481:	0f 84 91 00 00 00    	je     1518 <printint+0xa8>
    1487:	89 d0                	mov    %edx,%eax
    1489:	c1 e8 1f             	shr    $0x1f,%eax
    148c:	84 c0                	test   %al,%al
    148e:	0f 84 84 00 00 00    	je     1518 <printint+0xa8>
    neg = 1;
    x = -xx;
    1494:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    1496:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    149d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
    149f:	31 ff                	xor    %edi,%edi
    14a1:	8d 75 c7             	lea    -0x39(%ebp),%esi
    14a4:	eb 0c                	jmp    14b2 <printint+0x42>
    14a6:	8d 76 00             	lea    0x0(%esi),%esi
    14a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
    14b0:	89 df                	mov    %ebx,%edi
    14b2:	31 d2                	xor    %edx,%edx
    14b4:	8d 5f 01             	lea    0x1(%edi),%ebx
    14b7:	f7 f1                	div    %ecx
    14b9:	0f b6 92 5c 1b 00 00 	movzbl 0x1b5c(%edx),%edx
  }while((x /= base) != 0);
    14c0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    14c2:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    14c5:	75 e9                	jne    14b0 <printint+0x40>
  if(neg)
    14c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    14ca:	85 c0                	test   %eax,%eax
    14cc:	74 08                	je     14d6 <printint+0x66>
    buf[i++] = '-';
    14ce:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
    14d3:	8d 5f 02             	lea    0x2(%edi),%ebx
    14d6:	8d 7d d8             	lea    -0x28(%ebp),%edi
    14d9:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
    14dd:	89 fa                	mov    %edi,%edx
    14df:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
    14e0:	0f b6 08             	movzbl (%eax),%ecx
    14e3:	83 e8 01             	sub    $0x1,%eax
    14e6:	83 c2 01             	add    $0x1,%edx
    14e9:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
    14ec:	39 f0                	cmp    %esi,%eax
    14ee:	75 f0                	jne    14e0 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
    14f0:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
    14f3:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
    14f8:	57                   	push   %edi
    14f9:	e8 f2 fa ff ff       	call   ff0 <strlen>
    14fe:	83 c4 0c             	add    $0xc,%esp
    1501:	50                   	push   %eax
    1502:	57                   	push   %edi
    1503:	ff 75 c0             	pushl  -0x40(%ebp)
    1506:	e8 8d fe ff ff       	call   1398 <write>
}
    150b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    150e:	5b                   	pop    %ebx
    150f:	5e                   	pop    %esi
    1510:	5f                   	pop    %edi
    1511:	5d                   	pop    %ebp
    1512:	c3                   	ret    
    1513:	90                   	nop
    1514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1518:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    151a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1521:	e9 79 ff ff ff       	jmp    149f <printint+0x2f>
    1526:	8d 76 00             	lea    0x0(%esi),%esi
    1529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001530 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
    1530:	55                   	push   %ebp
    1531:	89 e5                	mov    %esp,%ebp
    1533:	57                   	push   %edi
    1534:	56                   	push   %esi
    1535:	53                   	push   %ebx
    1536:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1539:	8b 75 0c             	mov    0xc(%ebp),%esi
    153c:	0f b6 06             	movzbl (%esi),%eax
    153f:	84 c0                	test   %al,%al
    1541:	0f 84 90 01 00 00    	je     16d7 <printf+0x1a7>
    1547:	8d 5d 10             	lea    0x10(%ebp),%ebx
    154a:	31 ff                	xor    %edi,%edi
    154c:	31 d2                	xor    %edx,%edx
    154e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1551:	31 db                	xor    %ebx,%ebx
    1553:	eb 39                	jmp    158e <printf+0x5e>
    1555:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1558:	83 f9 25             	cmp    $0x25,%ecx
    155b:	0f 84 af 00 00 00    	je     1610 <printf+0xe0>
    1561:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1564:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1567:	83 ec 04             	sub    $0x4,%esp
    156a:	6a 01                	push   $0x1
    156c:	50                   	push   %eax
    156d:	ff 75 08             	pushl  0x8(%ebp)
    1570:	e8 23 fe ff ff       	call   1398 <write>
    1575:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
    1578:	85 c0                	test   %eax,%eax
    157a:	78 35                	js     15b1 <printf+0x81>
    157c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    157f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    1582:	01 c7                	add    %eax,%edi
    1584:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1586:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    158a:	84 c0                	test   %al,%al
    158c:	74 21                	je     15af <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
    158e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
    1591:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    1593:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    1596:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
    1599:	74 bd                	je     1558 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
    159b:	83 fa 25             	cmp    $0x25,%edx
    159e:	74 20                	je     15c0 <printf+0x90>
    15a0:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15a2:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    15a5:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15a7:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    15ab:	84 c0                	test   %al,%al
    15ad:	75 df                	jne    158e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    15af:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
    15b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15b4:	5b                   	pop    %ebx
    15b5:	5e                   	pop    %esi
    15b6:	5f                   	pop    %edi
    15b7:	5d                   	pop    %ebp
    15b8:	c3                   	ret    
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
    15c0:	83 f9 64             	cmp    $0x64,%ecx
    15c3:	0f 84 7f 00 00 00    	je     1648 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    15c9:	0f be d0             	movsbl %al,%edx
    15cc:	81 e2 f7 00 00 00    	and    $0xf7,%edx
    15d2:	83 fa 70             	cmp    $0x70,%edx
    15d5:	74 49                	je     1620 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15d7:	83 f9 73             	cmp    $0x73,%ecx
    15da:	0f 84 98 00 00 00    	je     1678 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
    15e0:	83 f9 63             	cmp    $0x63,%ecx
    15e3:	0f 84 c7 00 00 00    	je     16b0 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    15e9:	83 f9 25             	cmp    $0x25,%ecx
    15ec:	74 6a                	je     1658 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
    15ee:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
    15f1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    15f4:	83 ec 04             	sub    $0x4,%esp
    15f7:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    15f9:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
    15fd:	50                   	push   %eax
    15fe:	ff 75 08             	pushl  0x8(%ebp)
    1601:	e8 92 fd ff ff       	call   1398 <write>
    1606:	83 c4 10             	add    $0x10,%esp
    1609:	e9 6a ff ff ff       	jmp    1578 <printf+0x48>
    160e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1610:	ba 25 00 00 00       	mov    $0x25,%edx
    1615:	31 c0                	xor    %eax,%eax
    1617:	eb 89                	jmp    15a2 <printf+0x72>
    1619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    1620:	83 ec 0c             	sub    $0xc,%esp
    1623:	b9 10 00 00 00       	mov    $0x10,%ecx
    1628:	6a 00                	push   $0x0
    162a:	8b 75 d0             	mov    -0x30(%ebp),%esi
    162d:	8b 45 08             	mov    0x8(%ebp),%eax
    1630:	8b 16                	mov    (%esi),%edx
        ap++;
    1632:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    1635:	e8 36 fe ff ff       	call   1470 <printint>
        ap++;
    163a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    163d:	83 c4 10             	add    $0x10,%esp
    1640:	e9 33 ff ff ff       	jmp    1578 <printf+0x48>
    1645:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
    1648:	83 ec 0c             	sub    $0xc,%esp
    164b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1650:	6a 01                	push   $0x1
    1652:	eb d6                	jmp    162a <printf+0xfa>
    1654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1658:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    165b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    165e:	83 ec 04             	sub    $0x4,%esp
    1661:	6a 01                	push   $0x1
    1663:	50                   	push   %eax
    1664:	ff 75 08             	pushl  0x8(%ebp)
    1667:	e8 2c fd ff ff       	call   1398 <write>
    166c:	83 c4 10             	add    $0x10,%esp
    166f:	e9 04 ff ff ff       	jmp    1578 <printf+0x48>
    1674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    1678:	8b 45 d0             	mov    -0x30(%ebp),%eax
    167b:	8b 30                	mov    (%eax),%esi
        ap++;
    167d:	83 c0 04             	add    $0x4,%eax
    1680:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
    1683:	b8 54 1b 00 00       	mov    $0x1b54,%eax
    1688:	85 f6                	test   %esi,%esi
    168a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
    168d:	83 ec 0c             	sub    $0xc,%esp
    1690:	56                   	push   %esi
    1691:	e8 5a f9 ff ff       	call   ff0 <strlen>
    1696:	83 c4 0c             	add    $0xc,%esp
    1699:	50                   	push   %eax
    169a:	56                   	push   %esi
    169b:	ff 75 08             	pushl  0x8(%ebp)
    169e:	e8 f5 fc ff ff       	call   1398 <write>
    16a3:	83 c4 10             	add    $0x10,%esp
    16a6:	e9 cd fe ff ff       	jmp    1578 <printf+0x48>
    16ab:	90                   	nop
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16b0:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    16b3:	83 ec 04             	sub    $0x4,%esp
    16b6:	8b 06                	mov    (%esi),%eax
    16b8:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    16ba:	83 c6 04             	add    $0x4,%esi
    16bd:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    16c0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16c3:	50                   	push   %eax
    16c4:	ff 75 08             	pushl  0x8(%ebp)
    16c7:	e8 cc fc ff ff       	call   1398 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    16cc:	89 75 d0             	mov    %esi,-0x30(%ebp)
    16cf:	83 c4 10             	add    $0x10,%esp
    16d2:	e9 a1 fe ff ff       	jmp    1578 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
    16d7:	31 c0                	xor    %eax,%eax
    16d9:	e9 d3 fe ff ff       	jmp    15b1 <printf+0x81>
    16de:	66 90                	xchg   %ax,%ax

000016e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16e1:	a1 88 30 00 00       	mov    0x3088,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    16e6:	89 e5                	mov    %esp,%ebp
    16e8:	57                   	push   %edi
    16e9:	56                   	push   %esi
    16ea:	53                   	push   %ebx
    16eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16ee:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16f0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16f3:	39 c8                	cmp    %ecx,%eax
    16f5:	73 19                	jae    1710 <free+0x30>
    16f7:	89 f6                	mov    %esi,%esi
    16f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1700:	39 d1                	cmp    %edx,%ecx
    1702:	72 1c                	jb     1720 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1704:	39 d0                	cmp    %edx,%eax
    1706:	73 18                	jae    1720 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1708:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    170a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    170c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    170e:	72 f0                	jb     1700 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1710:	39 d0                	cmp    %edx,%eax
    1712:	72 f4                	jb     1708 <free+0x28>
    1714:	39 d1                	cmp    %edx,%ecx
    1716:	73 f0                	jae    1708 <free+0x28>
    1718:	90                   	nop
    1719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1720:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1723:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1726:	39 d7                	cmp    %edx,%edi
    1728:	74 19                	je     1743 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    172a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    172d:	8b 50 04             	mov    0x4(%eax),%edx
    1730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1733:	39 f1                	cmp    %esi,%ecx
    1735:	74 23                	je     175a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1737:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1739:	a3 88 30 00 00       	mov    %eax,0x3088
}
    173e:	5b                   	pop    %ebx
    173f:	5e                   	pop    %esi
    1740:	5f                   	pop    %edi
    1741:	5d                   	pop    %ebp
    1742:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1743:	03 72 04             	add    0x4(%edx),%esi
    1746:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1749:	8b 10                	mov    (%eax),%edx
    174b:	8b 12                	mov    (%edx),%edx
    174d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1750:	8b 50 04             	mov    0x4(%eax),%edx
    1753:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1756:	39 f1                	cmp    %esi,%ecx
    1758:	75 dd                	jne    1737 <free+0x57>
    p->s.size += bp->s.size;
    175a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    175d:	a3 88 30 00 00       	mov    %eax,0x3088
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1762:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1765:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1768:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    176a:	5b                   	pop    %ebx
    176b:	5e                   	pop    %esi
    176c:	5f                   	pop    %edi
    176d:	5d                   	pop    %ebp
    176e:	c3                   	ret    
    176f:	90                   	nop

00001770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	57                   	push   %edi
    1774:	56                   	push   %esi
    1775:	53                   	push   %ebx
    1776:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    177c:	8b 15 88 30 00 00    	mov    0x3088,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1782:	8d 78 07             	lea    0x7(%eax),%edi
    1785:	c1 ef 03             	shr    $0x3,%edi
    1788:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    178b:	85 d2                	test   %edx,%edx
    178d:	0f 84 a3 00 00 00    	je     1836 <malloc+0xc6>
    1793:	8b 02                	mov    (%edx),%eax
    1795:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1798:	39 cf                	cmp    %ecx,%edi
    179a:	76 74                	jbe    1810 <malloc+0xa0>
    179c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    17a2:	be 00 10 00 00       	mov    $0x1000,%esi
    17a7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    17ae:	0f 43 f7             	cmovae %edi,%esi
    17b1:	ba 00 80 00 00       	mov    $0x8000,%edx
    17b6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    17bc:	0f 46 da             	cmovbe %edx,%ebx
    17bf:	eb 10                	jmp    17d1 <malloc+0x61>
    17c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    17ca:	8b 48 04             	mov    0x4(%eax),%ecx
    17cd:	39 cf                	cmp    %ecx,%edi
    17cf:	76 3f                	jbe    1810 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17d1:	39 05 88 30 00 00    	cmp    %eax,0x3088
    17d7:	89 c2                	mov    %eax,%edx
    17d9:	75 ed                	jne    17c8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    17db:	83 ec 0c             	sub    $0xc,%esp
    17de:	53                   	push   %ebx
    17df:	e8 1c fc ff ff       	call   1400 <sbrk>
  if(p == (char*)-1)
    17e4:	83 c4 10             	add    $0x10,%esp
    17e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    17ea:	74 1c                	je     1808 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    17ec:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    17ef:	83 ec 0c             	sub    $0xc,%esp
    17f2:	83 c0 08             	add    $0x8,%eax
    17f5:	50                   	push   %eax
    17f6:	e8 e5 fe ff ff       	call   16e0 <free>
  return freep;
    17fb:	8b 15 88 30 00 00    	mov    0x3088,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1801:	83 c4 10             	add    $0x10,%esp
    1804:	85 d2                	test   %edx,%edx
    1806:	75 c0                	jne    17c8 <malloc+0x58>
        return 0;
    1808:	31 c0                	xor    %eax,%eax
    180a:	eb 1c                	jmp    1828 <malloc+0xb8>
    180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1810:	39 cf                	cmp    %ecx,%edi
    1812:	74 1c                	je     1830 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1814:	29 f9                	sub    %edi,%ecx
    1816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    181c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    181f:	89 15 88 30 00 00    	mov    %edx,0x3088
      return (void*)(p + 1);
    1825:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1828:	8d 65 f4             	lea    -0xc(%ebp),%esp
    182b:	5b                   	pop    %ebx
    182c:	5e                   	pop    %esi
    182d:	5f                   	pop    %edi
    182e:	5d                   	pop    %ebp
    182f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1830:	8b 08                	mov    (%eax),%ecx
    1832:	89 0a                	mov    %ecx,(%edx)
    1834:	eb e9                	jmp    181f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1836:	c7 05 88 30 00 00 8c 	movl   $0x308c,0x3088
    183d:	30 00 00 
    1840:	c7 05 8c 30 00 00 8c 	movl   $0x308c,0x308c
    1847:	30 00 00 
    base.s.size = 0;
    184a:	b8 8c 30 00 00       	mov    $0x308c,%eax
    184f:	c7 05 90 30 00 00 00 	movl   $0x0,0x3090
    1856:	00 00 00 
    1859:	e9 3e ff ff ff       	jmp    179c <malloc+0x2c>
    185e:	66 90                	xchg   %ax,%ax

00001860 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    1860:	55                   	push   %ebp
    1861:	89 e5                	mov    %esp,%ebp
    1863:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    1866:	6a 10                	push   $0x10
    1868:	6a 02                	push   $0x2
    186a:	ff 75 08             	pushl  0x8(%ebp)
    186d:	e8 d6 fb ff ff       	call   1448 <ioctl>
}
    1872:	c9                   	leave  
    1873:	c3                   	ret    
    1874:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    187a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001880 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
    1880:	55                   	push   %ebp
    1881:	89 e5                	mov    %esp,%ebp
    1883:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
    1886:	68 00 10 00 00       	push   $0x1000
    188b:	6a 02                	push   $0x2
    188d:	ff 75 08             	pushl  0x8(%ebp)
    1890:	e8 b3 fb ff ff       	call   1448 <ioctl>
}
    1895:	c9                   	leave  
    1896:	c3                   	ret    
    1897:	89 f6                	mov    %esi,%esi
    1899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000018a0 <attach_tty>:

int
attach_tty(int tty_fd)
{
    18a0:	55                   	push   %ebp
    18a1:	89 e5                	mov    %esp,%ebp
    18a3:	53                   	push   %ebx
    18a4:	83 ec 08             	sub    $0x8,%esp
    18a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
    18aa:	6a 10                	push   $0x10
    18ac:	6a 01                	push   $0x1
    18ae:	53                   	push   %ebx
    18af:	e8 94 fb ff ff       	call   1448 <ioctl>
    18b4:	83 c4 10             	add    $0x10,%esp
    18b7:	85 c0                	test   %eax,%eax
    18b9:	78 55                	js     1910 <attach_tty+0x70>
     return -1;

    close(0);
    18bb:	83 ec 0c             	sub    $0xc,%esp
    18be:	6a 00                	push   $0x0
    18c0:	e8 db fa ff ff       	call   13a0 <close>
    close(1);
    18c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18cc:	e8 cf fa ff ff       	call   13a0 <close>
    close(2);
    18d1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    18d8:	e8 c3 fa ff ff       	call   13a0 <close>
    if(dup(tty_fd) < 0)
    18dd:	89 1c 24             	mov    %ebx,(%esp)
    18e0:	e8 0b fb ff ff       	call   13f0 <dup>
    18e5:	83 c4 10             	add    $0x10,%esp
    18e8:	85 c0                	test   %eax,%eax
    18ea:	78 24                	js     1910 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    18ec:	83 ec 0c             	sub    $0xc,%esp
    18ef:	53                   	push   %ebx
    18f0:	e8 fb fa ff ff       	call   13f0 <dup>
    18f5:	83 c4 10             	add    $0x10,%esp
    18f8:	85 c0                	test   %eax,%eax
    18fa:	78 14                	js     1910 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    18fc:	83 ec 0c             	sub    $0xc,%esp
    18ff:	53                   	push   %ebx
    1900:	e8 eb fa ff ff       	call   13f0 <dup>
    1905:	83 c4 10             	add    $0x10,%esp
    1908:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
    190b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    190e:	c9                   	leave  
    190f:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
    1910:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
    1915:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1918:	c9                   	leave  
    1919:	c3                   	ret    
    191a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001920 <detach_tty>:

int
detach_tty(int tty_fd)
{
    1920:	55                   	push   %ebp
    1921:	89 e5                	mov    %esp,%ebp
    1923:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
    1926:	6a 20                	push   $0x20
    1928:	6a 01                	push   $0x1
    192a:	ff 75 08             	pushl  0x8(%ebp)
    192d:	e8 16 fb ff ff       	call   1448 <ioctl>
    return 0;
}
    1932:	31 c0                	xor    %eax,%eax
    1934:	c9                   	leave  
    1935:	c3                   	ret    
    1936:	8d 76 00             	lea    0x0(%esi),%esi
    1939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001940 <connect_tty>:


int
connect_tty(int tty_fd)
{
    1940:	55                   	push   %ebp
    1941:	89 e5                	mov    %esp,%ebp
    1943:	53                   	push   %ebx
    1944:	83 ec 08             	sub    $0x8,%esp
    1947:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    194a:	6a 10                	push   $0x10
    194c:	6a 02                	push   $0x2
    194e:	53                   	push   %ebx
    194f:	e8 f4 fa ff ff       	call   1448 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
    1954:	83 c4 10             	add    $0x10,%esp
    1957:	85 c0                	test   %eax,%eax
    1959:	74 1d                	je     1978 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
    195b:	83 ec 04             	sub    $0x4,%esp
    195e:	68 00 10 00 00       	push   $0x1000
    1963:	6a 01                	push   $0x1
    1965:	53                   	push   %ebx
    1966:	e8 dd fa ff ff       	call   1448 <ioctl>
     return tty_fd;
    196b:	83 c4 10             	add    $0x10,%esp
    196e:	89 d8                	mov    %ebx,%eax
}
    1970:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1973:	c9                   	leave  
    1974:	c3                   	ret    
    1975:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
    1978:	83 ec 0c             	sub    $0xc,%esp
    197b:	53                   	push   %ebx
    197c:	e8 1f fa ff ff       	call   13a0 <close>
       return -1;
    1981:	83 c4 10             	add    $0x10,%esp
    1984:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1989:	eb e5                	jmp    1970 <connect_tty+0x30>
    198b:	90                   	nop
    198c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001990 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
    1990:	55                   	push   %ebp
    1991:	89 e5                	mov    %esp,%ebp
    1993:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
    1996:	68 00 20 00 00       	push   $0x2000
    199b:	6a 01                	push   $0x1
    199d:	ff 75 08             	pushl  0x8(%ebp)
    19a0:	e8 a3 fa ff ff       	call   1448 <ioctl>
}
    19a5:	c9                   	leave  
    19a6:	c3                   	ret    
