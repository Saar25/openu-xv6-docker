
_pidns_tests:     file format elf32-i386


Disassembly of section .text:

00000000 <loop_forever>:
    }
  }
}

/* support function to busy wait forever */
int loop_forever() {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	eb fe                	jmp    3 <loop_forever+0x3>
       5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
       9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000010 <sleep_1s>:
  }
  return 0;
}

/* support function to busy wait about 1 secound */
int sleep_1s() {
      10:	55                   	push   %ebp
      11:	89 e5                	mov    %esp,%ebp
      13:	83 ec 14             	sub    $0x14,%esp
  // TODO: find a better way to sync the destruction
  sleep(10);
      16:	6a 0a                	push   $0xa
      18:	e8 bb 0e 00 00       	call   ed8 <sleep>
  return 0;
}
      1d:	31 c0                	xor    %eax,%eax
      1f:	c9                   	leave  
      20:	c3                   	ret    
      21:	eb 0d                	jmp    30 <unshare_twice>
      23:	90                   	nop
      24:	90                   	nop
      25:	90                   	nop
      26:	90                   	nop
      27:	90                   	nop
      28:	90                   	nop
      29:	90                   	nop
      2a:	90                   	nop
      2b:	90                   	nop
      2c:	90                   	nop
      2d:	90                   	nop
      2e:	90                   	nop
      2f:	90                   	nop

00000030 <unshare_twice>:
/* Verify that a process can call unshare PID only once
  - Unshare
  - Unshare
  - Verify the last Unshare failed
*/
int unshare_twice() {
      30:	55                   	push   %ebp
      31:	89 e5                	mov    %esp,%ebp
      33:	83 ec 14             	sub    $0x14,%esp
  // first call should succeed
  int ret = unshare(CLONE_NEWPID);
      36:	6a 02                	push   $0x2
      38:	e8 cb 0e 00 00       	call   f08 <unshare>
  if (ret < 0) {
      3d:	83 c4 10             	add    $0x10,%esp
      40:	85 c0                	test   %eax,%eax
      42:	ba 01 00 00 00       	mov    $0x1,%edx
      47:	78 14                	js     5d <unshare_twice+0x2d>
    return 1;
  }

  // second call should fail
  ret = unshare(CLONE_NEWPID);
      49:	83 ec 0c             	sub    $0xc,%esp
      4c:	6a 02                	push   $0x2
      4e:	e8 b5 0e 00 00       	call   f08 <unshare>
*/
int unshare_twice() {
  // first call should succeed
  int ret = unshare(CLONE_NEWPID);
  if (ret < 0) {
    return 1;
      53:	f7 d0                	not    %eax
      55:	83 c4 10             	add    $0x10,%esp
      58:	89 c2                	mov    %eax,%edx
      5a:	c1 ea 1f             	shr    $0x1f,%edx
  if (ret < 0) {
    return 0;
  }

  return 1;
}
      5d:	89 d0                	mov    %edx,%eax
      5f:	c9                   	leave  
      60:	c3                   	ret    
      61:	eb 0d                	jmp    70 <assert_msg.part.3>
      63:	90                   	nop
      64:	90                   	nop
      65:	90                   	nop
      66:	90                   	nop
      67:	90                   	nop
      68:	90                   	nop
      69:	90                   	nop
      6a:	90                   	nop
      6b:	90                   	nop
      6c:	90                   	nop
      6d:	90                   	nop
      6e:	90                   	nop
      6f:	90                   	nop

00000070 <assert_msg.part.3>:
#define NULL 0

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
      70:	55                   	push   %ebp
      71:	89 e5                	mov    %esp,%ebp
      73:	83 ec 0c             	sub    $0xc,%esp
  if (r) {
    return;
  }
  printf(stderr, "%s\n", (char *)msg);
      76:	50                   	push   %eax
      77:	68 78 14 00 00       	push   $0x1478
      7c:	6a 02                	push   $0x2
      7e:	e8 7d 0f 00 00       	call   1000 <printf>
  exit(1);
      83:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      8a:	e8 b9 0d 00 00       	call   e48 <exit>
      8f:	90                   	nop

00000090 <child_exit_status>:
  }

  return r;
}

static int child_exit_status(int pid) {
      90:	55                   	push   %ebp
      91:	89 e5                	mov    %esp,%ebp
      93:	56                   	push   %esi
      94:	53                   	push   %ebx
      95:	8d 5d f4             	lea    -0xc(%ebp),%ebx
      98:	89 c6                	mov    %eax,%esi
      9a:	83 ec 10             	sub    $0x10,%esp
      9d:	8d 76 00             	lea    0x0(%esi),%esi
  int changed_pid = -1;
  int wstatus;
  do {
    changed_pid = check(wait(&wstatus), "failed to waitpid");
      a0:	83 ec 0c             	sub    $0xc,%esp
      a3:	53                   	push   %ebx
      a4:	e8 a7 0d 00 00       	call   e50 <wait>
typedef int(*test_func_t)(void);
int testsPassed = 0; /*In case all tests passed, this value will remain 0, else
			it will become 1*/

int check(int r, const char *msg) {
  if (r < 0) {
      a9:	83 c4 10             	add    $0x10,%esp
      ac:	85 c0                	test   %eax,%eax
      ae:	78 11                	js     c1 <child_exit_status+0x31>
static int child_exit_status(int pid) {
  int changed_pid = -1;
  int wstatus;
  do {
    changed_pid = check(wait(&wstatus), "failed to waitpid");
  } while (changed_pid != pid);
      b0:	39 f0                	cmp    %esi,%eax
      b2:	75 ec                	jne    a0 <child_exit_status+0x10>

  return WEXITSTATUS(wstatus);
      b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
      b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
      ba:	5b                   	pop    %ebx
  int wstatus;
  do {
    changed_pid = check(wait(&wstatus), "failed to waitpid");
  } while (changed_pid != pid);

  return WEXITSTATUS(wstatus);
      bb:	c1 f8 08             	sar    $0x8,%eax
}
      be:	5e                   	pop    %esi
      bf:	5d                   	pop    %ebp
      c0:	c3                   	ret    
      c1:	b8 7c 14 00 00       	mov    $0x147c,%eax
      c6:	e8 a5 ff ff ff       	call   70 <assert_msg.part.3>
      cb:	90                   	nop
      cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000d0 <test_calling_fork_twice_after_unshare>:
  }

  return 1;
}

int test_calling_fork_twice_after_unshare() {
      d0:	55                   	push   %ebp
      d1:	89 e5                	mov    %esp,%ebp
      d3:	53                   	push   %ebx
      d4:	83 ec 10             	sub    $0x10,%esp
  check(unshare(CLONE_NEWPID), "failed to unshare");
      d7:	6a 02                	push   $0x2
      d9:	e8 2a 0e 00 00       	call   f08 <unshare>
typedef int(*test_func_t)(void);
int testsPassed = 0; /*In case all tests passed, this value will remain 0, else
			it will become 1*/

int check(int r, const char *msg) {
  if (r < 0) {
      de:	83 c4 10             	add    $0x10,%esp
      e1:	85 c0                	test   %eax,%eax
      e3:	0f 88 9f 00 00 00    	js     188 <test_calling_fork_twice_after_unshare+0xb8>

  int ret = check(fork(), "failed to fork");
      e9:	e8 52 0d 00 00       	call   e40 <fork>
      ee:	85 c0                	test   %eax,%eax
      f0:	89 c3                	mov    %eax,%ebx
      f2:	0f 88 86 00 00 00    	js     17e <test_calling_fork_twice_after_unshare+0xae>
  if (ret == 0) {
      f8:	74 26                	je     120 <test_calling_fork_twice_after_unshare+0x50>

    // pid 1 exits
    exit(0);
  }

  int ret2 = check(fork(), "failed to fork");
      fa:	e8 41 0d 00 00       	call   e40 <fork>
      ff:	85 c0                	test   %eax,%eax
     101:	78 7b                	js     17e <test_calling_fork_twice_after_unshare+0xae>
  if (ret2 == 0) {
     103:	75 33                	jne    138 <test_calling_fork_twice_after_unshare+0x68>

    // child is pid 2
    assert_msg(getpid() == 2, "pid not equal to 2");
     105:	e8 be 0d 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     10a:	83 f8 02             	cmp    $0x2,%eax
     10d:	74 49                	je     158 <test_calling_fork_twice_after_unshare+0x88>
     10f:	b8 c2 14 00 00       	mov    $0x14c2,%eax
     114:	e8 57 ff ff ff       	call   70 <assert_msg.part.3>
     119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  int ret = check(fork(), "failed to fork");
  if (ret == 0) {

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");
     120:	e8 a3 0d 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     125:	83 f8 01             	cmp    $0x1,%eax
     128:	74 3e                	je     168 <test_calling_fork_twice_after_unshare+0x98>
     12a:	b8 af 14 00 00       	mov    $0x14af,%eax
     12f:	e8 3c ff ff ff       	call   70 <assert_msg.part.3>
     134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    // pid 1 exits
    exit(0);
  }

  // make sure it's dead
  int status = child_exit_status(ret2);
     138:	e8 53 ff ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     13d:	85 c0                	test   %eax,%eax
     13f:	75 51                	jne    192 <test_calling_fork_twice_after_unshare+0xc2>
  // make sure it's dead
  int status = child_exit_status(ret2);
  assert_msg(status == 0, "child process failed");

  // make sure it's dead
  status = child_exit_status(ret);
     141:	89 d8                	mov    %ebx,%eax
     143:	e8 48 ff ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     148:	85 c0                	test   %eax,%eax
     14a:	75 46                	jne    192 <test_calling_fork_twice_after_unshare+0xc2>
  // make sure it's dead
  status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");

  return 0;
}
     14c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     14f:	c9                   	leave  
     150:	c3                   	ret    
     151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // child is pid 2
    assert_msg(getpid() == 2, "pid not equal to 2");

    // pid 1 exits
    exit(0);
     158:	83 ec 0c             	sub    $0xc,%esp
     15b:	6a 00                	push   $0x0
     15d:	e8 e6 0c 00 00       	call   e48 <exit>
     162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (ret == 0) {

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");

    sleep(5); /*Changed to 5 to remove a zombie process appearing*/
     168:	83 ec 0c             	sub    $0xc,%esp
     16b:	6a 05                	push   $0x5
     16d:	e8 66 0d 00 00       	call   ed8 <sleep>

    // pid 1 exits
    exit(0);
     172:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     179:	e8 ca 0c 00 00       	call   e48 <exit>
     17e:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     183:	e8 e8 fe ff ff       	call   70 <assert_msg.part.3>
     188:	b8 8e 14 00 00       	mov    $0x148e,%eax
     18d:	e8 de fe ff ff       	call   70 <assert_msg.part.3>
     192:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     197:	e8 d4 fe ff ff       	call   70 <assert_msg.part.3>
     19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <test_simple_pidns_fork>:
  - Unshare pid ns
  - Fork
  - Child process fork
  - Verify that the pid is correct
*/
int test_simple_pidns_fork() {
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	53                   	push   %ebx
     1a4:	83 ec 10             	sub    $0x10,%esp
  check(unshare(CLONE_NEWPID), "failed to unshare");
     1a7:	6a 02                	push   $0x2
     1a9:	e8 5a 0d 00 00       	call   f08 <unshare>
     1ae:	83 c4 10             	add    $0x10,%esp
     1b1:	85 c0                	test   %eax,%eax
     1b3:	0f 88 89 00 00 00    	js     242 <test_simple_pidns_fork+0xa2>

  int ret = check(fork(), "failed to fork");
     1b9:	e8 82 0c 00 00       	call   e40 <fork>
     1be:	85 c0                	test   %eax,%eax
     1c0:	89 c3                	mov    %eax,%ebx
     1c2:	0f 88 84 00 00 00    	js     24c <test_simple_pidns_fork+0xac>
  // child
  if (ret == 0) {
     1c8:	75 36                	jne    200 <test_simple_pidns_fork+0x60>
    assert_msg(getpid() == 1, "pid not equal to 1");
     1ca:	e8 f9 0c 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     1cf:	83 f8 01             	cmp    $0x1,%eax
     1d2:	0f 85 88 00 00 00    	jne    260 <test_simple_pidns_fork+0xc0>
  int ret = check(fork(), "failed to fork");
  // child
  if (ret == 0) {
    assert_msg(getpid() == 1, "pid not equal to 1");

    ret = check(fork(), "failed to fork 2");
     1d8:	e8 63 0c 00 00       	call   e40 <fork>
     1dd:	85 c0                	test   %eax,%eax
     1df:	0f 88 85 00 00 00    	js     26a <test_simple_pidns_fork+0xca>
    // child
    if (ret == 0) {
     1e5:	75 39                	jne    220 <test_simple_pidns_fork+0x80>
      assert_msg(getpid() == 2, "pid not equal to 2");
     1e7:	e8 dc 0c 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     1ec:	83 f8 02             	cmp    $0x2,%eax
     1ef:	74 38                	je     229 <test_simple_pidns_fork+0x89>
     1f1:	b8 c2 14 00 00       	mov    $0x14c2,%eax
     1f6:	e8 75 fe ff ff       	call   70 <assert_msg.part.3>
     1fb:	90                   	nop
     1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit(0);
  }

  // flaky test because pid can recycle. However strictly speaking pid should be
  // increasing
  assert_msg(getpid() < ret, "wrong pid");
     200:	e8 c3 0c 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     205:	39 c3                	cmp    %eax,%ebx
     207:	7e 4d                	jle    256 <test_simple_pidns_fork+0xb6>

  // flaky test because pid can recycle. However strictly speaking pid should be
  // increasing
  assert_msg(getpid() < ret, "wrong pid");

  int status = child_exit_status(ret);
     209:	89 d8                	mov    %ebx,%eax
     20b:	e8 80 fe ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     210:	85 c0                	test   %eax,%eax
     212:	75 24                	jne    238 <test_simple_pidns_fork+0x98>
  assert_msg(getpid() < ret, "wrong pid");

  int status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");
  return 0;
}
     214:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     217:	c9                   	leave  
     218:	c3                   	ret    
     219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (ret == 0) {
      assert_msg(getpid() == 2, "pid not equal to 2");
      exit(0);
    }

    int status = child_exit_status(ret);
     220:	e8 6b fe ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     225:	85 c0                	test   %eax,%eax
     227:	75 0f                	jne    238 <test_simple_pidns_fork+0x98>

    ret = check(fork(), "failed to fork 2");
    // child
    if (ret == 0) {
      assert_msg(getpid() == 2, "pid not equal to 2");
      exit(0);
     229:	83 ec 0c             	sub    $0xc,%esp
     22c:	6a 00                	push   $0x0
     22e:	e8 15 0c 00 00       	call   e48 <exit>
     233:	90                   	nop
     234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     238:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     23d:	e8 2e fe ff ff       	call   70 <assert_msg.part.3>
     242:	b8 8e 14 00 00       	mov    $0x148e,%eax
     247:	e8 24 fe ff ff       	call   70 <assert_msg.part.3>
     24c:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     251:	e8 1a fe ff ff       	call   70 <assert_msg.part.3>
     256:	b8 fb 14 00 00       	mov    $0x14fb,%eax
     25b:	e8 10 fe ff ff       	call   70 <assert_msg.part.3>
     260:	b8 af 14 00 00       	mov    $0x14af,%eax
     265:	e8 06 fe ff ff       	call   70 <assert_msg.part.3>
     26a:	b8 ea 14 00 00       	mov    $0x14ea,%eax
     26f:	e8 fc fd ff ff       	call   70 <assert_msg.part.3>
     274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     27a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000280 <test_simple_pidns>:
/* Verify simple pid namespace works
  - Unshare pid ns
  - Fork
  - Verify pid is correct from parent and child views
*/
int test_simple_pidns() {
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	53                   	push   %ebx
     284:	83 ec 10             	sub    $0x10,%esp
  check(unshare(CLONE_NEWPID), "failed to unshare");
     287:	6a 02                	push   $0x2
     289:	e8 7a 0c 00 00       	call   f08 <unshare>
     28e:	83 c4 10             	add    $0x10,%esp
     291:	85 c0                	test   %eax,%eax
     293:	78 4d                	js     2e2 <test_simple_pidns+0x62>

  int ret = check(fork(), "failed to fork");
     295:	e8 a6 0b 00 00       	call   e40 <fork>
     29a:	85 c0                	test   %eax,%eax
     29c:	89 c3                	mov    %eax,%ebx
     29e:	78 4c                	js     2ec <test_simple_pidns+0x6c>
  // child
  if (ret == 0) {
     2a0:	74 1e                	je     2c0 <test_simple_pidns+0x40>
    exit(0);
  }

  // flaky test because pid can recycle. However strictly speaking pid should be
  // increasing
  assert_msg(getpid() < ret, "wrong pid");
     2a2:	e8 21 0c 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     2a7:	39 c3                	cmp    %eax,%ebx
     2a9:	7e 4b                	jle    2f6 <test_simple_pidns+0x76>

  // flaky test because pid can recycle. However strictly speaking pid should be
  // increasing
  assert_msg(getpid() < ret, "wrong pid");

  int status = child_exit_status(ret);
     2ab:	89 d8                	mov    %ebx,%eax
     2ad:	e8 de fd ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     2b2:	85 c0                	test   %eax,%eax
     2b4:	75 4a                	jne    300 <test_simple_pidns+0x80>
  assert_msg(getpid() < ret, "wrong pid");

  int status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");
  return 0;
}
     2b6:	31 c0                	xor    %eax,%eax
     2b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2bb:	c9                   	leave  
     2bc:	c3                   	ret    
     2bd:	8d 76 00             	lea    0x0(%esi),%esi
  check(unshare(CLONE_NEWPID), "failed to unshare");

  int ret = check(fork(), "failed to fork");
  // child
  if (ret == 0) {
    assert_msg(getpid() == 1, "pid not equal to 1");
     2c0:	e8 03 0c 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     2c5:	83 f8 01             	cmp    $0x1,%eax
     2c8:	74 0e                	je     2d8 <test_simple_pidns+0x58>
     2ca:	b8 af 14 00 00       	mov    $0x14af,%eax
     2cf:	e8 9c fd ff ff       	call   70 <assert_msg.part.3>
     2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  int ret = check(fork(), "failed to fork");
  // child
  if (ret == 0) {
    assert_msg(getpid() == 1, "pid not equal to 1");
    exit(0);
     2d8:	83 ec 0c             	sub    $0xc,%esp
     2db:	6a 00                	push   $0x0
     2dd:	e8 66 0b 00 00       	call   e48 <exit>
     2e2:	b8 8e 14 00 00       	mov    $0x148e,%eax
     2e7:	e8 84 fd ff ff       	call   70 <assert_msg.part.3>
     2ec:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     2f1:	e8 7a fd ff ff       	call   70 <assert_msg.part.3>
     2f6:	b8 fb 14 00 00       	mov    $0x14fb,%eax
     2fb:	e8 70 fd ff ff       	call   70 <assert_msg.part.3>
     300:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     305:	e8 66 fd ff ff       	call   70 <assert_msg.part.3>
     30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <test_nested_pidns_create>:
  - Fork
  - Child process unshare pid ns
  - Child process fork
  - Verify pid is correct from parent and children views
*/
int test_nested_pidns_create() {
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	83 ec 14             	sub    $0x14,%esp
  check(unshare(CLONE_NEWPID), "failed to unshare");
     316:	6a 02                	push   $0x2
     318:	e8 eb 0b 00 00       	call   f08 <unshare>
     31d:	83 c4 10             	add    $0x10,%esp
     320:	85 c0                	test   %eax,%eax
     322:	78 42                	js     366 <test_nested_pidns_create+0x56>

  int ret = check(fork(), "failed to fork");
     324:	e8 17 0b 00 00       	call   e40 <fork>
     329:	85 c0                	test   %eax,%eax
     32b:	78 43                	js     370 <test_nested_pidns_create+0x60>
  if (ret == 0) {
     32d:	75 19                	jne    348 <test_nested_pidns_create+0x38>
    assert_msg(getpid() == 1, "pid not equal to 1");
     32f:	e8 94 0b 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     334:	83 f8 01             	cmp    $0x1,%eax
     337:	74 1f                	je     358 <test_nested_pidns_create+0x48>
     339:	b8 af 14 00 00       	mov    $0x14af,%eax
     33e:	e8 2d fd ff ff       	call   70 <assert_msg.part.3>
     343:	90                   	nop
     344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (ret == 0) {
    assert_msg(getpid() == 1, "pid not equal to 1");
    exit(test_simple_pidns_fork());
  }

  int status = child_exit_status(ret);
     348:	e8 43 fd ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     34d:	85 c0                	test   %eax,%eax
     34f:	75 29                	jne    37a <test_nested_pidns_create+0x6a>
  }

  int status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");
  return 0;
}
     351:	31 c0                	xor    %eax,%eax
     353:	c9                   	leave  
     354:	c3                   	ret    
     355:	8d 76 00             	lea    0x0(%esi),%esi
  check(unshare(CLONE_NEWPID), "failed to unshare");

  int ret = check(fork(), "failed to fork");
  if (ret == 0) {
    assert_msg(getpid() == 1, "pid not equal to 1");
    exit(test_simple_pidns_fork());
     358:	e8 43 fe ff ff       	call   1a0 <test_simple_pidns_fork>
     35d:	83 ec 0c             	sub    $0xc,%esp
     360:	50                   	push   %eax
     361:	e8 e2 0a 00 00       	call   e48 <exit>
     366:	b8 8e 14 00 00       	mov    $0x148e,%eax
     36b:	e8 00 fd ff ff       	call   70 <assert_msg.part.3>
     370:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     375:	e8 f6 fc ff ff       	call   70 <assert_msg.part.3>
     37a:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     37f:	e8 ec fc ff ff       	call   70 <assert_msg.part.3>
     384:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     38a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000390 <test_calling_fork_after_nspid1_dies_fails>:
  - Unshare pid ns
  - Fork (1)
  - Child (1) dies
  - Fork fails
*/
int test_calling_fork_after_nspid1_dies_fails() {
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	83 ec 14             	sub    $0x14,%esp
  check(unshare(CLONE_NEWPID), "failed to unshare");
     396:	6a 02                	push   $0x2
     398:	e8 6b 0b 00 00       	call   f08 <unshare>
     39d:	83 c4 10             	add    $0x10,%esp
     3a0:	85 c0                	test   %eax,%eax
     3a2:	78 46                	js     3ea <test_calling_fork_after_nspid1_dies_fails+0x5a>

  int ret = check(fork(), "failed to fork");
     3a4:	e8 97 0a 00 00       	call   e40 <fork>
     3a9:	85 c0                	test   %eax,%eax
     3ab:	78 47                	js     3f4 <test_calling_fork_after_nspid1_dies_fails+0x64>
  if (ret == 0) {
     3ad:	74 19                	je     3c8 <test_calling_fork_after_nspid1_dies_fails+0x38>
    // pid 1 exits
    exit(0);
  }

  // make sure it's dead
  int status = child_exit_status(ret);
     3af:	e8 dc fc ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     3b4:	85 c0                	test   %eax,%eax
     3b6:	75 46                	jne    3fe <test_calling_fork_after_nspid1_dies_fails+0x6e>

  // make sure it's dead
  int status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");

  ret = fork();
     3b8:	e8 83 0a 00 00       	call   e40 <fork>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     3bd:	85 c0                	test   %eax,%eax
     3bf:	79 47                	jns    408 <test_calling_fork_after_nspid1_dies_fails+0x78>

  ret = fork();
  assert_msg(ret < 0, "fork didn't fail as expected");

  return 0;
}
     3c1:	31 c0                	xor    %eax,%eax
     3c3:	c9                   	leave  
     3c4:	c3                   	ret    
     3c5:	8d 76 00             	lea    0x0(%esi),%esi

  int ret = check(fork(), "failed to fork");
  if (ret == 0) {

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");
     3c8:	e8 fb 0a 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     3cd:	83 f8 01             	cmp    $0x1,%eax
     3d0:	74 0e                	je     3e0 <test_calling_fork_after_nspid1_dies_fails+0x50>
     3d2:	b8 af 14 00 00       	mov    $0x14af,%eax
     3d7:	e8 94 fc ff ff       	call   70 <assert_msg.part.3>
     3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");

    // pid 1 exits
    exit(0);
     3e0:	83 ec 0c             	sub    $0xc,%esp
     3e3:	6a 00                	push   $0x0
     3e5:	e8 5e 0a 00 00       	call   e48 <exit>
     3ea:	b8 8e 14 00 00       	mov    $0x148e,%eax
     3ef:	e8 7c fc ff ff       	call   70 <assert_msg.part.3>
     3f4:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     3f9:	e8 72 fc ff ff       	call   70 <assert_msg.part.3>
     3fe:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     403:	e8 68 fc ff ff       	call   70 <assert_msg.part.3>
     408:	b8 05 15 00 00       	mov    $0x1505,%eax
     40d:	e8 5e fc ff ff       	call   70 <assert_msg.part.3>
     412:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <check>:

typedef int(*test_func_t)(void);
int testsPassed = 0; /*In case all tests passed, this value will remain 0, else
			it will become 1*/

int check(int r, const char *msg) {
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	83 ec 08             	sub    $0x8,%esp
     426:	8b 45 08             	mov    0x8(%ebp),%eax
  if (r < 0) {
     429:	85 c0                	test   %eax,%eax
     42b:	78 02                	js     42f <check+0xf>
    printf(stderr, "%s\n", (char *)msg);
    exit(1);
  }

  return r;
}
     42d:	c9                   	leave  
     42e:	c3                   	ret    
     42f:	8b 45 0c             	mov    0xc(%ebp),%eax
     432:	e8 39 fc ff ff       	call   70 <assert_msg.part.3>
     437:	89 f6                	mov    %esi,%esi
     439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <run_test>:
}


/*This function runs the test, if a test fails, it will print which test failed,
and set the variable testsPassed to be 1*/
void run_test(test_func_t func, const char *name) {
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	83 ec 08             	sub    $0x8,%esp
  int pid = -1;

  int ret = check(fork(), "fork failed");
     446:	e8 f5 09 00 00       	call   e40 <fork>
typedef int(*test_func_t)(void);
int testsPassed = 0; /*In case all tests passed, this value will remain 0, else
			it will become 1*/

int check(int r, const char *msg) {
  if (r < 0) {
     44b:	85 c0                	test   %eax,%eax
     44d:	78 3e                	js     48d <run_test+0x4d>
and set the variable testsPassed to be 1*/
void run_test(test_func_t func, const char *name) {
  int pid = -1;

  int ret = check(fork(), "fork failed");
  if (ret == 0) {
     44f:	74 30                	je     481 <run_test+0x41>
    exit(func());
  }

  pid = ret;
  if (child_exit_status(pid) != 0) { /*Test failed*/
     451:	e8 3a fc ff ff       	call   90 <child_exit_status>
     456:	85 c0                	test   %eax,%eax
     458:	75 06                	jne    460 <run_test+0x20>
    printf(stderr, "failed test - '%s'\n", name);
    testsPassed = 1; /*Denotes some test has failed to pass*/
  }
     45a:	c9                   	leave  
     45b:	c3                   	ret    
     45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit(func());
  }

  pid = ret;
  if (child_exit_status(pid) != 0) { /*Test failed*/
    printf(stderr, "failed test - '%s'\n", name);
     460:	83 ec 04             	sub    $0x4,%esp
     463:	ff 75 0c             	pushl  0xc(%ebp)
     466:	68 2e 15 00 00       	push   $0x152e
     46b:	6a 02                	push   $0x2
     46d:	e8 8e 0b 00 00       	call   1000 <printf>
    testsPassed = 1; /*Denotes some test has failed to pass*/
     472:	c7 05 04 30 00 00 01 	movl   $0x1,0x3004
     479:	00 00 00 
     47c:	83 c4 10             	add    $0x10,%esp
  }
     47f:	c9                   	leave  
     480:	c3                   	ret    
void create_children(int n, pid_t *child_pids, test_func_t func) {
  for (int i = 0; i < n; i++) {
    int ret = check(fork(), "failed to fork in create_children");
    if (ret == 0) {
      // child
      exit(func());
     481:	ff 55 08             	call   *0x8(%ebp)
     484:	83 ec 0c             	sub    $0xc,%esp
     487:	50                   	push   %eax
     488:	e8 bb 09 00 00       	call   e48 <exit>
     48d:	b8 22 15 00 00       	mov    $0x1522,%eax
     492:	e8 d9 fb ff ff       	call   70 <assert_msg.part.3>
     497:	89 f6                	mov    %esi,%esi
     499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <assert_msg>:
#define NULL 0

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
     4a0:	55                   	push   %ebp
     4a1:	89 e5                	mov    %esp,%ebp
     4a3:	83 ec 08             	sub    $0x8,%esp
  if (r) {
     4a6:	8b 45 08             	mov    0x8(%ebp),%eax
     4a9:	85 c0                	test   %eax,%eax
     4ab:	74 02                	je     4af <assert_msg+0xf>
    return;
  }
  printf(stderr, "%s\n", (char *)msg);
  exit(1);
}
     4ad:	c9                   	leave  
     4ae:	c3                   	ret    
     4af:	8b 45 0c             	mov    0xc(%ebp),%eax
     4b2:	e8 b9 fb ff ff       	call   70 <assert_msg.part.3>
     4b7:	89 f6                	mov    %esi,%esi
     4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <create_children>:
  assert_msg(status == 0, "child process failed");
  return 0;
}

/* support function to create multiple children */
void create_children(int n, pid_t *child_pids, test_func_t func) {
     4c0:	55                   	push   %ebp
     4c1:	89 e5                	mov    %esp,%ebp
     4c3:	57                   	push   %edi
     4c4:	56                   	push   %esi
     4c5:	53                   	push   %ebx
     4c6:	83 ec 0c             	sub    $0xc,%esp
     4c9:	8b 7d 08             	mov    0x8(%ebp),%edi
     4cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  for (int i = 0; i < n; i++) {
     4cf:	85 ff                	test   %edi,%edi
     4d1:	7e 1e                	jle    4f1 <create_children+0x31>
     4d3:	31 db                	xor    %ebx,%ebx
     4d5:	8d 76 00             	lea    0x0(%esi),%esi
    int ret = check(fork(), "failed to fork in create_children");
     4d8:	e8 63 09 00 00       	call   e40 <fork>
typedef int(*test_func_t)(void);
int testsPassed = 0; /*In case all tests passed, this value will remain 0, else
			it will become 1*/

int check(int r, const char *msg) {
  if (r < 0) {
     4dd:	85 c0                	test   %eax,%eax
     4df:	78 18                	js     4f9 <create_children+0x39>
    if (ret == 0) {
     4e1:	74 20                	je     503 <create_children+0x43>
      // child
      exit(func());
    }
    if (child_pids) {
     4e3:	85 f6                	test   %esi,%esi
     4e5:	74 03                	je     4ea <create_children+0x2a>
      child_pids[i] = ret;
     4e7:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
  return 0;
}

/* support function to create multiple children */
void create_children(int n, pid_t *child_pids, test_func_t func) {
  for (int i = 0; i < n; i++) {
     4ea:	83 c3 01             	add    $0x1,%ebx
     4ed:	39 df                	cmp    %ebx,%edi
     4ef:	75 e7                	jne    4d8 <create_children+0x18>
    }
    if (child_pids) {
      child_pids[i] = ret;
    }
  }
}
     4f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4f4:	5b                   	pop    %ebx
     4f5:	5e                   	pop    %esi
     4f6:	5f                   	pop    %edi
     4f7:	5d                   	pop    %ebp
     4f8:	c3                   	ret    
     4f9:	b8 50 16 00 00       	mov    $0x1650,%eax
     4fe:	e8 6d fb ff ff       	call   70 <assert_msg.part.3>
void create_children(int n, pid_t *child_pids, test_func_t func) {
  for (int i = 0; i < n; i++) {
    int ret = check(fork(), "failed to fork in create_children");
    if (ret == 0) {
      // child
      exit(func());
     503:	ff 55 10             	call   *0x10(%ebp)
     506:	83 ec 0c             	sub    $0xc,%esp
     509:	50                   	push   %eax
     50a:	e8 39 09 00 00       	call   e48 <exit>
     50f:	90                   	nop

00000510 <test_all_children_kill_when_nspid1_dies>:
  - Child process fork (2)
  - Child process fork (3)
  - Child process dies
  - Verify that (2) & (3) are dead
*/
int test_all_children_kill_when_nspid1_dies() {
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	83 ec 24             	sub    $0x24,%esp
  check(unshare(CLONE_NEWPID), "failed to unshare");
     516:	6a 02                	push   $0x2
     518:	e8 eb 09 00 00       	call   f08 <unshare>
     51d:	83 c4 10             	add    $0x10,%esp
     520:	85 c0                	test   %eax,%eax
     522:	78 53                	js     577 <test_all_children_kill_when_nspid1_dies+0x67>

  int ret = check(fork(), "failed to fork");
     524:	e8 17 09 00 00       	call   e40 <fork>
     529:	85 c0                	test   %eax,%eax
     52b:	78 54                	js     581 <test_all_children_kill_when_nspid1_dies+0x71>
  if (ret == 0) {
     52d:	75 19                	jne    548 <test_all_children_kill_when_nspid1_dies+0x38>
    pid_t child_pids[2];

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");
     52f:	e8 94 09 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     534:	83 f8 01             	cmp    $0x1,%eax
     537:	74 1f                	je     558 <test_all_children_kill_when_nspid1_dies+0x48>
     539:	b8 af 14 00 00       	mov    $0x14af,%eax
     53e:	e8 2d fb ff ff       	call   70 <assert_msg.part.3>
     543:	90                   	nop
     544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Note: I'm supposed to only wait on one process sincew the other proccesses
  // are reaped by the kernel (which is inconsistent and wierd).

  // This test will fail on an infinite loop
  int status = child_exit_status(ret);
     548:	e8 43 fb ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     54d:	85 c0                	test   %eax,%eax
     54f:	75 3a                	jne    58b <test_all_children_kill_when_nspid1_dies+0x7b>

  // This test will fail on an infinite loop
  int status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");
  return 0;
}
     551:	31 c0                	xor    %eax,%eax
     553:	c9                   	leave  
     554:	c3                   	ret    
     555:	8d 76 00             	lea    0x0(%esi),%esi
    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");

    //create_children(2, NULL, loop_forever);

    create_children(ARRAY_SIZE(child_pids), child_pids, loop_forever);
     558:	8d 45 f0             	lea    -0x10(%ebp),%eax
     55b:	83 ec 04             	sub    $0x4,%esp
     55e:	68 00 00 00 00       	push   $0x0
     563:	50                   	push   %eax
     564:	6a 02                	push   $0x2
     566:	e8 55 ff ff ff       	call   4c0 <create_children>

    // pid 1 exits
    exit(0);
     56b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     572:	e8 d1 08 00 00       	call   e48 <exit>
     577:	b8 8e 14 00 00       	mov    $0x148e,%eax
     57c:	e8 ef fa ff ff       	call   70 <assert_msg.part.3>
     581:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     586:	e8 e5 fa ff ff       	call   70 <assert_msg.part.3>
     58b:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     590:	e8 db fa ff ff       	call   70 <assert_msg.part.3>
     595:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005a0 <reap_children>:
    }
  }
}

/* support function to wait on multiple children */
void reap_children(int n, pid_t *child_pids) {
     5a0:	55                   	push   %ebp
     5a1:	89 e5                	mov    %esp,%ebp
     5a3:	57                   	push   %edi
     5a4:	56                   	push   %esi
     5a5:	53                   	push   %ebx
     5a6:	83 ec 1c             	sub    $0x1c,%esp
     5a9:	8b 75 08             	mov    0x8(%ebp),%esi
     5ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int count = 0;
  int wstatus = 0;
     5af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while (count < n) {
     5b6:	85 f6                	test   %esi,%esi
     5b8:	7e 36                	jle    5f0 <reap_children+0x50>
     5ba:	31 db                	xor    %ebx,%ebx
     5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int pid = check(wait(&wstatus), "failed to wait()");
     5c0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     5c3:	83 ec 0c             	sub    $0xc,%esp
     5c6:	50                   	push   %eax
     5c7:	e8 84 08 00 00       	call   e50 <wait>
     5cc:	83 c4 10             	add    $0x10,%esp
     5cf:	85 c0                	test   %eax,%eax
     5d1:	78 56                	js     629 <reap_children+0x89>

    // if we don't verify the child pids just count them
    if (!child_pids) {
     5d3:	85 ff                	test   %edi,%edi
     5d5:	74 49                	je     620 <reap_children+0x80>
      count++;
      continue;
    }

    for (int i = 0; i < n; i++) {
      if (child_pids[i] == pid) {
     5d7:	3b 07                	cmp    (%edi),%eax
     5d9:	74 25                	je     600 <reap_children+0x60>
     5db:	31 d2                	xor    %edx,%edx
     5dd:	eb 06                	jmp    5e5 <reap_children+0x45>
     5df:	90                   	nop
     5e0:	3b 04 97             	cmp    (%edi,%edx,4),%eax
     5e3:	74 1b                	je     600 <reap_children+0x60>
    if (!child_pids) {
      count++;
      continue;
    }

    for (int i = 0; i < n; i++) {
     5e5:	83 c2 01             	add    $0x1,%edx
     5e8:	39 d6                	cmp    %edx,%esi
     5ea:	75 f4                	jne    5e0 <reap_children+0x40>

/* support function to wait on multiple children */
void reap_children(int n, pid_t *child_pids) {
  int count = 0;
  int wstatus = 0;
  while (count < n) {
     5ec:	39 de                	cmp    %ebx,%esi
     5ee:	7f d0                	jg     5c0 <reap_children+0x20>
        assert_msg(WEXITSTATUS(wstatus) == 0, "exit code is not 0");
        break;
      }
    }
  }
}
     5f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5f3:	5b                   	pop    %ebx
     5f4:	5e                   	pop    %esi
     5f5:	5f                   	pop    %edi
     5f6:	5d                   	pop    %ebp
     5f7:	c3                   	ret    
     5f8:	90                   	nop
     5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     600:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      continue;
    }

    for (int i = 0; i < n; i++) {
      if (child_pids[i] == pid) {
        count++;
     603:	83 c3 01             	add    $0x1,%ebx

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     606:	c1 f8 08             	sar    $0x8,%eax
     609:	85 c0                	test   %eax,%eax
     60b:	74 df                	je     5ec <reap_children+0x4c>
     60d:	b8 53 15 00 00       	mov    $0x1553,%eax
     612:	e8 59 fa ff ff       	call   70 <assert_msg.part.3>
     617:	89 f6                	mov    %esi,%esi
     619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while (count < n) {
    int pid = check(wait(&wstatus), "failed to wait()");

    // if we don't verify the child pids just count them
    if (!child_pids) {
      count++;
     620:	83 c3 01             	add    $0x1,%ebx

/* support function to wait on multiple children */
void reap_children(int n, pid_t *child_pids) {
  int count = 0;
  int wstatus = 0;
  while (count < n) {
     623:	39 de                	cmp    %ebx,%esi
     625:	7f 99                	jg     5c0 <reap_children+0x20>
     627:	eb c7                	jmp    5f0 <reap_children+0x50>
     629:	b8 42 15 00 00       	mov    $0x1542,%eax
     62e:	e8 3d fa ff ff       	call   70 <assert_msg.part.3>
     633:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <test_children_reaped_by_nspid1>:
  - Child (2) process fork (4)
  - Child (2) process dies
  - Grandchildren (3) & (4) dies
  - Verify that wait returns with correct pids for (2) and grandchildren (3) & (4)
*/
int test_children_reaped_by_nspid1() {
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	57                   	push   %edi
     644:	56                   	push   %esi
     645:	53                   	push   %ebx
     646:	83 ec 28             	sub    $0x28,%esp
  check(unshare(CLONE_NEWPID), "failed to unshare");
     649:	6a 02                	push   $0x2
     64b:	e8 b8 08 00 00       	call   f08 <unshare>
     650:	83 c4 10             	add    $0x10,%esp
     653:	85 c0                	test   %eax,%eax
     655:	0f 88 50 01 00 00    	js     7ab <test_children_reaped_by_nspid1+0x16b>
  int ret = check(fork(), "failed to fork");
     65b:	e8 e0 07 00 00       	call   e40 <fork>
     660:	85 c0                	test   %eax,%eax
     662:	0f 88 39 01 00 00    	js     7a1 <test_children_reaped_by_nspid1+0x161>
  if (ret == 0) {
     668:	0f 85 a2 00 00 00    	jne    710 <test_children_reaped_by_nspid1+0xd0>
    pid_t child_pids[2];
    int fd[2];

    check(pipe(fd), "failed to create pipes");
     66e:	8d 45 e0             	lea    -0x20(%ebp),%eax
     671:	83 ec 0c             	sub    $0xc,%esp
     674:	50                   	push   %eax
     675:	e8 de 07 00 00       	call   e58 <pipe>
     67a:	83 c4 10             	add    $0x10,%esp
     67d:	85 c0                	test   %eax,%eax
     67f:	0f 88 4e 01 00 00    	js     7d3 <test_children_reaped_by_nspid1+0x193>

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");
     685:	e8 3e 08 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     68a:	83 f8 01             	cmp    $0x1,%eax
     68d:	0f 85 36 01 00 00    	jne    7c9 <test_children_reaped_by_nspid1+0x189>

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");

    // create pid 2
    int ret = check(fork(), "failed to fork2");
     693:	e8 a8 07 00 00       	call   e40 <fork>
     698:	85 c0                	test   %eax,%eax
     69a:	0f 88 1f 01 00 00    	js     7bf <test_children_reaped_by_nspid1+0x17f>
    if (ret == 0) {
     6a0:	0f 85 8a 00 00 00    	jne    730 <test_children_reaped_by_nspid1+0xf0>
      create_children(ARRAY_SIZE(child_pids), child_pids, sleep_1s);
     6a6:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     6a9:	83 ec 04             	sub    $0x4,%esp
  printf(stderr, "%s\n", (char *)msg);
  exit(1);
}

static void write_all(int fd, unsigned char *buf, size_t len) {
  size_t bytes_read = 0;
     6ac:	31 f6                	xor    %esi,%esi
    assert_msg(getpid() == 1, "pid not equal to 1");

    // create pid 2
    int ret = check(fork(), "failed to fork2");
    if (ret == 0) {
      create_children(ARRAY_SIZE(child_pids), child_pids, sleep_1s);
     6ae:	68 10 00 00 00       	push   $0x10
     6b3:	53                   	push   %ebx
     6b4:	6a 02                	push   $0x2
     6b6:	e8 05 fe ff ff       	call   4c0 <create_children>
      write_all(fd[1], (void *)child_pids, sizeof(child_pids));
     6bb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     6be:	83 c4 10             	add    $0x10,%esp
     6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static void write_all(int fd, unsigned char *buf, size_t len) {
  size_t bytes_read = 0;

  while (bytes_read < len) {
    size_t ret =
        check(write(fd, &buf[bytes_read], len - bytes_read), "failed to write");
     6c8:	b8 08 00 00 00       	mov    $0x8,%eax
     6cd:	83 ec 04             	sub    $0x4,%esp
     6d0:	29 f0                	sub    %esi,%eax
     6d2:	50                   	push   %eax
     6d3:	8d 04 33             	lea    (%ebx,%esi,1),%eax
     6d6:	50                   	push   %eax
     6d7:	57                   	push   %edi
     6d8:	e8 8b 07 00 00       	call   e68 <write>
     6dd:	83 c4 10             	add    $0x10,%esp
     6e0:	85 c0                	test   %eax,%eax
     6e2:	0f 88 a5 00 00 00    	js     78d <test_children_reaped_by_nspid1+0x14d>
    bytes_read += ret;
     6e8:	01 c6                	add    %eax,%esi
}

static void write_all(int fd, unsigned char *buf, size_t len) {
  size_t bytes_read = 0;

  while (bytes_read < len) {
     6ea:	83 fe 07             	cmp    $0x7,%esi
     6ed:	7e d9                	jle    6c8 <test_children_reaped_by_nspid1+0x88>
    if (ret == 0) {
      create_children(ARRAY_SIZE(child_pids), child_pids, sleep_1s);
      write_all(fd[1], (void *)child_pids, sizeof(child_pids));

      // cleanup fds
      close(fd[0]);
     6ef:	83 ec 0c             	sub    $0xc,%esp
     6f2:	ff 75 e0             	pushl  -0x20(%ebp)
     6f5:	e8 76 07 00 00       	call   e70 <close>
      close(fd[1]);
     6fa:	5b                   	pop    %ebx
     6fb:	ff 75 e4             	pushl  -0x1c(%ebp)
     6fe:	e8 6d 07 00 00       	call   e70 <close>

      // kill pid 2
      exit(0);
     703:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     70a:	e8 39 07 00 00       	call   e48 <exit>
     70f:	90                   	nop
    // reap child pids
    reap_children(ARRAY_SIZE(child_pids), child_pids);
    exit(0);
  }

  int status = child_exit_status(ret);
     710:	e8 7b f9 ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     715:	85 c0                	test   %eax,%eax
     717:	0f 85 98 00 00 00    	jne    7b5 <test_children_reaped_by_nspid1+0x175>
  }

  int status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");
  return 0;
}
     71d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     720:	31 c0                	xor    %eax,%eax
     722:	5b                   	pop    %ebx
     723:	5e                   	pop    %esi
     724:	5f                   	pop    %edi
     725:	5d                   	pop    %ebp
     726:	c3                   	ret    
     727:	89 f6                	mov    %esi,%esi
     729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

      // kill pid 2
      exit(0);
    }

    read_all(fd[0], (void *)child_pids, sizeof(child_pids));
     730:	8b 7d e0             	mov    -0x20(%ebp),%edi
     733:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    bytes_read += ret;
  }
}

static void read_all(int fd, unsigned char *buf, size_t len) {
  size_t bytes_read = 0;
     736:	31 f6                	xor    %esi,%esi
     738:	90                   	nop
     739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  while (bytes_read < len) {
    size_t ret =
        check(read(fd, &buf[bytes_read], len - bytes_read), "failed to read");
     740:	b8 08 00 00 00       	mov    $0x8,%eax
     745:	83 ec 04             	sub    $0x4,%esp
     748:	29 f0                	sub    %esi,%eax
     74a:	50                   	push   %eax
     74b:	8d 04 33             	lea    (%ebx,%esi,1),%eax
     74e:	50                   	push   %eax
     74f:	57                   	push   %edi
     750:	e8 0b 07 00 00       	call   e60 <read>
     755:	83 c4 10             	add    $0x10,%esp
     758:	85 c0                	test   %eax,%eax
     75a:	78 3b                	js     797 <test_children_reaped_by_nspid1+0x157>
    bytes_read += ret;
     75c:	01 c6                	add    %eax,%esi
}

static void read_all(int fd, unsigned char *buf, size_t len) {
  size_t bytes_read = 0;

  while (bytes_read < len) {
     75e:	83 fe 07             	cmp    $0x7,%esi
     761:	7e dd                	jle    740 <test_children_reaped_by_nspid1+0x100>
    }

    read_all(fd[0], (void *)child_pids, sizeof(child_pids));

    // cleanup fds
    close(fd[0]);
     763:	83 ec 0c             	sub    $0xc,%esp
     766:	ff 75 e0             	pushl  -0x20(%ebp)
     769:	e8 02 07 00 00       	call   e70 <close>
    close(fd[1]);
     76e:	58                   	pop    %eax
     76f:	ff 75 e4             	pushl  -0x1c(%ebp)
     772:	e8 f9 06 00 00       	call   e70 <close>

    // reap child pids
    reap_children(ARRAY_SIZE(child_pids), child_pids);
     777:	5a                   	pop    %edx
     778:	59                   	pop    %ecx
     779:	53                   	push   %ebx
     77a:	6a 02                	push   $0x2
     77c:	e8 1f fe ff ff       	call   5a0 <reap_children>
    exit(0);
     781:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     788:	e8 bb 06 00 00       	call   e48 <exit>
     78d:	b8 8d 15 00 00       	mov    $0x158d,%eax
     792:	e8 d9 f8 ff ff       	call   70 <assert_msg.part.3>
     797:	b8 9d 15 00 00       	mov    $0x159d,%eax
     79c:	e8 cf f8 ff ff       	call   70 <assert_msg.part.3>
     7a1:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     7a6:	e8 c5 f8 ff ff       	call   70 <assert_msg.part.3>
     7ab:	b8 8e 14 00 00       	mov    $0x148e,%eax
     7b0:	e8 bb f8 ff ff       	call   70 <assert_msg.part.3>
     7b5:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     7ba:	e8 b1 f8 ff ff       	call   70 <assert_msg.part.3>
     7bf:	b8 7d 15 00 00       	mov    $0x157d,%eax
     7c4:	e8 a7 f8 ff ff       	call   70 <assert_msg.part.3>
     7c9:	b8 af 14 00 00       	mov    $0x14af,%eax
     7ce:	e8 9d f8 ff ff       	call   70 <assert_msg.part.3>
     7d3:	b8 66 15 00 00       	mov    $0x1566,%eax
     7d8:	e8 93 f8 ff ff       	call   70 <assert_msg.part.3>
     7dd:	8d 76 00             	lea    0x0(%esi),%esi

000007e0 <_test_unshare_recrusive_limit>:
  - Unshare (2)
  - Fork (3)
  - Unshare (3)
  - Verify that will fail Fork (4)
*/
int _test_unshare_recrusive_limit(int count) {
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	53                   	push   %ebx
     7e4:	83 ec 04             	sub    $0x4,%esp
     7e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (count == 0) {
     7ea:	85 db                	test   %ebx,%ebx
     7ec:	75 22                	jne    810 <_test_unshare_recrusive_limit+0x30>
    assert_msg(unshare(CLONE_NEWPID) < 0, "unshare didn't fail as expected");
     7ee:	83 ec 0c             	sub    $0xc,%esp
     7f1:	6a 02                	push   $0x2
     7f3:	e8 10 07 00 00       	call   f08 <unshare>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     7f8:	83 c4 10             	add    $0x10,%esp
     7fb:	85 c0                	test   %eax,%eax
     7fd:	79 71                	jns    870 <_test_unshare_recrusive_limit+0x90>
  // make sure it's dead
  int status = child_exit_status(ret);
  assert_msg(status == 0, "child process failed");

  return 0;
}
     7ff:	31 c0                	xor    %eax,%eax
     801:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     804:	c9                   	leave  
     805:	c3                   	ret    
     806:	8d 76 00             	lea    0x0(%esi),%esi
     809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if (count == 0) {
    assert_msg(unshare(CLONE_NEWPID) < 0, "unshare didn't fail as expected");
    return 0;
  }

  check(unshare(CLONE_NEWPID), "failed to unshare");
     810:	83 ec 0c             	sub    $0xc,%esp
     813:	6a 02                	push   $0x2
     815:	e8 ee 06 00 00       	call   f08 <unshare>
     81a:	83 c4 10             	add    $0x10,%esp
     81d:	85 c0                	test   %eax,%eax
     81f:	78 59                	js     87a <_test_unshare_recrusive_limit+0x9a>

  int ret = check(fork(), "failed to fork");
     821:	e8 1a 06 00 00       	call   e40 <fork>
     826:	85 c0                	test   %eax,%eax
     828:	78 5a                	js     884 <_test_unshare_recrusive_limit+0xa4>
  if (ret == 0) {
     82a:	75 14                	jne    840 <_test_unshare_recrusive_limit+0x60>

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");
     82c:	e8 97 06 00 00       	call   ec8 <getpid>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     831:	83 f8 01             	cmp    $0x1,%eax
     834:	74 22                	je     858 <_test_unshare_recrusive_limit+0x78>
     836:	b8 af 14 00 00       	mov    $0x14af,%eax
     83b:	e8 30 f8 ff ff       	call   70 <assert_msg.part.3>
    // pid 1 exits
    exit(0);
  }

  // make sure it's dead
  int status = child_exit_status(ret);
     840:	e8 4b f8 ff ff       	call   90 <child_exit_status>

typedef   signed int          pid_t;
typedef   signed int          size_t;

void assert_msg(int r, const char *msg) {
  if (r) {
     845:	85 c0                	test   %eax,%eax
     847:	74 b6                	je     7ff <_test_unshare_recrusive_limit+0x1f>
     849:	b8 d5 14 00 00       	mov    $0x14d5,%eax
     84e:	e8 1d f8 ff ff       	call   70 <assert_msg.part.3>
     853:	90                   	nop
     854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (ret == 0) {

    // child is pid 1
    assert_msg(getpid() == 1, "pid not equal to 1");

    _test_unshare_recrusive_limit(count - 1);
     858:	83 ec 0c             	sub    $0xc,%esp
     85b:	83 eb 01             	sub    $0x1,%ebx
     85e:	53                   	push   %ebx
     85f:	e8 7c ff ff ff       	call   7e0 <_test_unshare_recrusive_limit>

    // pid 1 exits
    exit(0);
     864:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     86b:	e8 d8 05 00 00       	call   e48 <exit>
     870:	b8 74 16 00 00       	mov    $0x1674,%eax
     875:	e8 f6 f7 ff ff       	call   70 <assert_msg.part.3>
     87a:	b8 8e 14 00 00       	mov    $0x148e,%eax
     87f:	e8 ec f7 ff ff       	call   70 <assert_msg.part.3>
     884:	b8 a0 14 00 00       	mov    $0x14a0,%eax
     889:	e8 e2 f7 ff ff       	call   70 <assert_msg.part.3>
     88e:	66 90                	xchg   %ax,%ax

00000890 <test_unshare_recrusive_limit>:
  assert_msg(status == 0, "child process failed");

  return 0;
}

int test_unshare_recrusive_limit() {
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	83 ec 14             	sub    $0x14,%esp
  // there's an init namespace so we start counting from 1
  _test_unshare_recrusive_limit(MAX_RECURSION-1);
     896:	a1 00 30 00 00       	mov    0x3000,%eax
     89b:	83 e8 01             	sub    $0x1,%eax
     89e:	50                   	push   %eax
     89f:	e8 3c ff ff ff       	call   7e0 <_test_unshare_recrusive_limit>
  return 0;
}
     8a4:	31 c0                	xor    %eax,%eax
     8a6:	c9                   	leave  
     8a7:	c3                   	ret    
     8a8:	66 90                	xchg   %ax,%ax
     8aa:	66 90                	xchg   %ax,%ax
     8ac:	66 90                	xchg   %ax,%ax
     8ae:	66 90                	xchg   %ax,%ax

000008b0 <main>:
  assert_msg(status == 0, "child process failed");

  return 0;
}

int main() {
     8b0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     8b4:	83 e4 f0             	and    $0xfffffff0,%esp
     8b7:	ff 71 fc             	pushl  -0x4(%ecx)
     8ba:	55                   	push   %ebp
     8bb:	89 e5                	mov    %esp,%ebp
     8bd:	51                   	push   %ecx
     8be:	83 ec 0c             	sub    $0xc,%esp
  printf(stderr, "Running all pidns tests\n");
     8c1:	68 ac 15 00 00       	push   $0x15ac
     8c6:	6a 02                	push   $0x2
     8c8:	e8 33 07 00 00       	call   1000 <printf>
  run_test(unshare_twice, "unshare_twice");
     8cd:	59                   	pop    %ecx
     8ce:	58                   	pop    %eax
     8cf:	68 c5 15 00 00       	push   $0x15c5
     8d4:	68 30 00 00 00       	push   $0x30
     8d9:	e8 62 fb ff ff       	call   440 <run_test>
  run_test(test_simple_pidns, "test_simple_pidns");
     8de:	58                   	pop    %eax
     8df:	5a                   	pop    %edx
     8e0:	68 d3 15 00 00       	push   $0x15d3
     8e5:	68 80 02 00 00       	push   $0x280
     8ea:	e8 51 fb ff ff       	call   440 <run_test>
  run_test(test_simple_pidns_fork, "test_simple_pidns_fork");
     8ef:	59                   	pop    %ecx
     8f0:	58                   	pop    %eax
     8f1:	68 e5 15 00 00       	push   $0x15e5
     8f6:	68 a0 01 00 00       	push   $0x1a0
     8fb:	e8 40 fb ff ff       	call   440 <run_test>
  run_test(test_nested_pidns_create, "test_nested_pidns_create");
     900:	58                   	pop    %eax
     901:	5a                   	pop    %edx
     902:	68 fc 15 00 00       	push   $0x15fc
     907:	68 10 03 00 00       	push   $0x310
     90c:	e8 2f fb ff ff       	call   440 <run_test>
  run_test(test_children_reaped_by_nspid1, "test_children_reaped_by_nspid1");
     911:	59                   	pop    %ecx
     912:	58                   	pop    %eax
     913:	68 94 16 00 00       	push   $0x1694
     918:	68 40 06 00 00       	push   $0x640
     91d:	e8 1e fb ff ff       	call   440 <run_test>
  run_test(test_all_children_kill_when_nspid1_dies, "test_all_children_kill_when_nspid1_dies");
     922:	58                   	pop    %eax
     923:	5a                   	pop    %edx
     924:	68 b4 16 00 00       	push   $0x16b4
     929:	68 10 05 00 00       	push   $0x510
     92e:	e8 0d fb ff ff       	call   440 <run_test>
  run_test(test_calling_fork_twice_after_unshare, "test_calling_fork_twice_after_unshare");
     933:	59                   	pop    %ecx
     934:	58                   	pop    %eax
     935:	68 dc 16 00 00       	push   $0x16dc
     93a:	68 d0 00 00 00       	push   $0xd0
     93f:	e8 fc fa ff ff       	call   440 <run_test>
  run_test(test_calling_fork_after_nspid1_dies_fails, "test_calling_fork_after_nspid1_dies_fails");
     944:	58                   	pop    %eax
     945:	5a                   	pop    %edx
     946:	68 04 17 00 00       	push   $0x1704
     94b:	68 90 03 00 00       	push   $0x390
     950:	e8 eb fa ff ff       	call   440 <run_test>
  run_test(test_unshare_recrusive_limit, "test_unshare_recrusive_limit");
     955:	59                   	pop    %ecx
     956:	58                   	pop    %eax
     957:	68 15 16 00 00       	push   $0x1615
     95c:	68 90 08 00 00       	push   $0x890
     961:	e8 da fa ff ff       	call   440 <run_test>

  if (testsPassed == 0) {
     966:	a1 04 30 00 00       	mov    0x3004,%eax
     96b:	83 c4 10             	add    $0x10,%esp
     96e:	85 c0                	test   %eax,%eax
     970:	75 1a                	jne    98c <main+0xdc>
    printf(stderr, "Pidns tests passed successfully\n");
     972:	52                   	push   %edx
     973:	52                   	push   %edx
     974:	68 30 17 00 00       	push   $0x1730
     979:	6a 02                	push   $0x2
     97b:	e8 80 06 00 00       	call   1000 <printf>
    exit(0);
     980:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     987:	e8 bc 04 00 00       	call   e48 <exit>
  }
  else {
    printf(stderr, "Pidns tests failed to pass\n");
     98c:	50                   	push   %eax
     98d:	50                   	push   %eax
     98e:	68 32 16 00 00       	push   $0x1632
     993:	6a 02                	push   $0x2
     995:	e8 66 06 00 00       	call   1000 <printf>
    exit(1);
     99a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9a1:	e8 a2 04 00 00       	call   e48 <exit>
     9a6:	66 90                	xchg   %ax,%ax
     9a8:	66 90                	xchg   %ax,%ax
     9aa:	66 90                	xchg   %ax,%ax
     9ac:	66 90                	xchg   %ax,%ax
     9ae:	66 90                	xchg   %ax,%ax

000009b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	53                   	push   %ebx
     9b4:	8b 45 08             	mov    0x8(%ebp),%eax
     9b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     9ba:	89 c2                	mov    %eax,%edx
     9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9c0:	83 c1 01             	add    $0x1,%ecx
     9c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     9c7:	83 c2 01             	add    $0x1,%edx
     9ca:	84 db                	test   %bl,%bl
     9cc:	88 5a ff             	mov    %bl,-0x1(%edx)
     9cf:	75 ef                	jne    9c0 <strcpy+0x10>
    ;
  return os;
}
     9d1:	5b                   	pop    %ebx
     9d2:	5d                   	pop    %ebp
     9d3:	c3                   	ret    
     9d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     9da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000009e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     9e0:	55                   	push   %ebp
     9e1:	89 e5                	mov    %esp,%ebp
     9e3:	56                   	push   %esi
     9e4:	53                   	push   %ebx
     9e5:	8b 55 08             	mov    0x8(%ebp),%edx
     9e8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     9eb:	0f b6 02             	movzbl (%edx),%eax
     9ee:	0f b6 19             	movzbl (%ecx),%ebx
     9f1:	84 c0                	test   %al,%al
     9f3:	75 1e                	jne    a13 <strcmp+0x33>
     9f5:	eb 29                	jmp    a20 <strcmp+0x40>
     9f7:	89 f6                	mov    %esi,%esi
     9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     a00:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     a03:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     a06:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     a09:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     a0d:	84 c0                	test   %al,%al
     a0f:	74 0f                	je     a20 <strcmp+0x40>
     a11:	89 f1                	mov    %esi,%ecx
     a13:	38 d8                	cmp    %bl,%al
     a15:	74 e9                	je     a00 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     a17:	29 d8                	sub    %ebx,%eax
}
     a19:	5b                   	pop    %ebx
     a1a:	5e                   	pop    %esi
     a1b:	5d                   	pop    %ebp
     a1c:	c3                   	ret    
     a1d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     a20:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     a22:	29 d8                	sub    %ebx,%eax
}
     a24:	5b                   	pop    %ebx
     a25:	5e                   	pop    %esi
     a26:	5d                   	pop    %ebp
     a27:	c3                   	ret    
     a28:	90                   	nop
     a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a30 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	57                   	push   %edi
     a34:	56                   	push   %esi
     a35:	8b 55 08             	mov    0x8(%ebp),%edx
     a38:	53                   	push   %ebx
     a39:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q && --n)
     a3c:	0f b6 32             	movzbl (%edx),%esi
     a3f:	89 f0                	mov    %esi,%eax
     a41:	84 c0                	test   %al,%al
     a43:	74 67                	je     aac <strncmp+0x7c>
     a45:	0f b6 19             	movzbl (%ecx),%ebx
     a48:	89 f0                	mov    %esi,%eax
     a4a:	38 d8                	cmp    %bl,%al
     a4c:	75 65                	jne    ab3 <strncmp+0x83>
     a4e:	8b 5d 10             	mov    0x10(%ebp),%ebx
     a51:	89 f0                	mov    %esi,%eax
     a53:	0f b6 f0             	movzbl %al,%esi
     a56:	89 f0                	mov    %esi,%eax
     a58:	83 eb 01             	sub    $0x1,%ebx
     a5b:	75 14                	jne    a71 <strncmp+0x41>
     a5d:	eb 25                	jmp    a84 <strncmp+0x54>
     a5f:	90                   	nop
     a60:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
     a64:	89 f1                	mov    %esi,%ecx
     a66:	38 c8                	cmp    %cl,%al
     a68:	75 26                	jne    a90 <strncmp+0x60>
     a6a:	83 eb 01             	sub    $0x1,%ebx
     a6d:	89 f9                	mov    %edi,%ecx
     a6f:	74 2f                	je     aa0 <strncmp+0x70>
    p++, q++;
     a71:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     a74:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     a77:	8d 79 01             	lea    0x1(%ecx),%edi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     a7a:	84 c0                	test   %al,%al
     a7c:	75 e2                	jne    a60 <strncmp+0x30>
     a7e:	0f b6 71 01          	movzbl 0x1(%ecx),%esi
     a82:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     a84:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     a85:	29 f0                	sub    %esi,%eax
}
     a87:	5e                   	pop    %esi
     a88:	5f                   	pop    %edi
     a89:	5d                   	pop    %ebp
     a8a:	c3                   	ret    
     a8b:	90                   	nop
     a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a90:	0f b6 f1             	movzbl %cl,%esi
     a93:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     a94:	29 f0                	sub    %esi,%eax
}
     a96:	5e                   	pop    %esi
     a97:	5f                   	pop    %edi
     a98:	5d                   	pop    %ebp
     a99:	c3                   	ret    
     a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     aa0:	0f b6 f0             	movzbl %al,%esi
     aa3:	89 f0                	mov    %esi,%eax
     aa5:	5b                   	pop    %ebx
int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     aa6:	29 f0                	sub    %esi,%eax
}
     aa8:	5e                   	pop    %esi
     aa9:	5f                   	pop    %edi
     aaa:	5d                   	pop    %ebp
     aab:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     aac:	31 c0                	xor    %eax,%eax
     aae:	0f b6 31             	movzbl (%ecx),%esi
     ab1:	eb d1                	jmp    a84 <strncmp+0x54>
     ab3:	0f b6 c0             	movzbl %al,%eax
     ab6:	0f b6 f3             	movzbl %bl,%esi
     ab9:	eb c9                	jmp    a84 <strncmp+0x54>
     abb:	90                   	nop
     abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ac0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     ac6:	80 39 00             	cmpb   $0x0,(%ecx)
     ac9:	74 12                	je     add <strlen+0x1d>
     acb:	31 d2                	xor    %edx,%edx
     acd:	8d 76 00             	lea    0x0(%esi),%esi
     ad0:	83 c2 01             	add    $0x1,%edx
     ad3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ad7:	89 d0                	mov    %edx,%eax
     ad9:	75 f5                	jne    ad0 <strlen+0x10>
    ;
  return n;
}
     adb:	5d                   	pop    %ebp
     adc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     add:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     adf:	5d                   	pop    %ebp
     ae0:	c3                   	ret    
     ae1:	eb 0d                	jmp    af0 <memset>
     ae3:	90                   	nop
     ae4:	90                   	nop
     ae5:	90                   	nop
     ae6:	90                   	nop
     ae7:	90                   	nop
     ae8:	90                   	nop
     ae9:	90                   	nop
     aea:	90                   	nop
     aeb:	90                   	nop
     aec:	90                   	nop
     aed:	90                   	nop
     aee:	90                   	nop
     aef:	90                   	nop

00000af0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	57                   	push   %edi
     af4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     af7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     afa:	8b 45 0c             	mov    0xc(%ebp),%eax
     afd:	89 d7                	mov    %edx,%edi
     aff:	fc                   	cld    
     b00:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b02:	89 d0                	mov    %edx,%eax
     b04:	5f                   	pop    %edi
     b05:	5d                   	pop    %ebp
     b06:	c3                   	ret    
     b07:	89 f6                	mov    %esi,%esi
     b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b10 <strchr>:

char*
strchr(const char *s, char c)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	53                   	push   %ebx
     b14:	8b 45 08             	mov    0x8(%ebp),%eax
     b17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     b1a:	0f b6 10             	movzbl (%eax),%edx
     b1d:	84 d2                	test   %dl,%dl
     b1f:	74 1d                	je     b3e <strchr+0x2e>
    if(*s == c)
     b21:	38 d3                	cmp    %dl,%bl
     b23:	89 d9                	mov    %ebx,%ecx
     b25:	75 0d                	jne    b34 <strchr+0x24>
     b27:	eb 17                	jmp    b40 <strchr+0x30>
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b30:	38 ca                	cmp    %cl,%dl
     b32:	74 0c                	je     b40 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     b34:	83 c0 01             	add    $0x1,%eax
     b37:	0f b6 10             	movzbl (%eax),%edx
     b3a:	84 d2                	test   %dl,%dl
     b3c:	75 f2                	jne    b30 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     b3e:	31 c0                	xor    %eax,%eax
}
     b40:	5b                   	pop    %ebx
     b41:	5d                   	pop    %ebp
     b42:	c3                   	ret    
     b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <gets>:

char*
gets(char *buf, int max)
{
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	57                   	push   %edi
     b54:	56                   	push   %esi
     b55:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     b56:	8d 75 e7             	lea    -0x19(%ebp),%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b59:	31 db                	xor    %ebx,%ebx
     b5b:	bf 01 00 00 00       	mov    $0x1,%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     b60:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b63:	3b 7d 0c             	cmp    0xc(%ebp),%edi
     b66:	7d 30                	jge    b98 <gets+0x48>
    cc = read(0, &c, 1);
     b68:	83 ec 04             	sub    $0x4,%esp
     b6b:	6a 01                	push   $0x1
     b6d:	56                   	push   %esi
     b6e:	6a 00                	push   $0x0
     b70:	e8 eb 02 00 00       	call   e60 <read>
    if(cc < 1)
     b75:	83 c4 10             	add    $0x10,%esp
     b78:	85 c0                	test   %eax,%eax
     b7a:	7e e7                	jle    b63 <gets+0x13>
      continue;
    buf[i++] = c;
     b7c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b80:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
     b83:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
     b85:	88 04 1a             	mov    %al,(%edx,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b88:	89 fb                	mov    %edi,%ebx
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     b8a:	74 0c                	je     b98 <gets+0x48>
     b8c:	3c 0d                	cmp    $0xd,%al
     b8e:	74 08                	je     b98 <gets+0x48>
     b90:	83 c7 01             	add    $0x1,%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b93:	3b 7d 0c             	cmp    0xc(%ebp),%edi
     b96:	7c d0                	jl     b68 <gets+0x18>
      continue;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     b98:	8b 45 08             	mov    0x8(%ebp),%eax
     b9b:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     b9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba2:	5b                   	pop    %ebx
     ba3:	5e                   	pop    %esi
     ba4:	5f                   	pop    %edi
     ba5:	5d                   	pop    %ebp
     ba6:	c3                   	ret    
     ba7:	89 f6                	mov    %esi,%esi
     ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <stat>:

int
stat(const char *n, struct stat *st)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	56                   	push   %esi
     bb4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     bb5:	83 ec 08             	sub    $0x8,%esp
     bb8:	6a 00                	push   $0x0
     bba:	ff 75 08             	pushl  0x8(%ebp)
     bbd:	e8 c6 02 00 00       	call   e88 <open>
  if(fd < 0)
     bc2:	83 c4 10             	add    $0x10,%esp
     bc5:	85 c0                	test   %eax,%eax
     bc7:	78 27                	js     bf0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     bc9:	83 ec 08             	sub    $0x8,%esp
     bcc:	ff 75 0c             	pushl  0xc(%ebp)
     bcf:	89 c3                	mov    %eax,%ebx
     bd1:	50                   	push   %eax
     bd2:	e8 c9 02 00 00       	call   ea0 <fstat>
     bd7:	89 c6                	mov    %eax,%esi
  close(fd);
     bd9:	89 1c 24             	mov    %ebx,(%esp)
     bdc:	e8 8f 02 00 00       	call   e70 <close>
  return r;
     be1:	83 c4 10             	add    $0x10,%esp
     be4:	89 f0                	mov    %esi,%eax
}
     be6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     be9:	5b                   	pop    %ebx
     bea:	5e                   	pop    %esi
     beb:	5d                   	pop    %ebp
     bec:	c3                   	ret    
     bed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     bf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     bf5:	eb ef                	jmp    be6 <stat+0x36>
     bf7:	89 f6                	mov    %esi,%esi
     bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c00 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	53                   	push   %ebx
     c04:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c07:	0f be 11             	movsbl (%ecx),%edx
     c0a:	8d 42 d0             	lea    -0x30(%edx),%eax
     c0d:	3c 09                	cmp    $0x9,%al
     c0f:	b8 00 00 00 00       	mov    $0x0,%eax
     c14:	77 1f                	ja     c35 <atoi+0x35>
     c16:	8d 76 00             	lea    0x0(%esi),%esi
     c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     c20:	8d 04 80             	lea    (%eax,%eax,4),%eax
     c23:	83 c1 01             	add    $0x1,%ecx
     c26:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c2a:	0f be 11             	movsbl (%ecx),%edx
     c2d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     c30:	80 fb 09             	cmp    $0x9,%bl
     c33:	76 eb                	jbe    c20 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     c35:	5b                   	pop    %ebx
     c36:	5d                   	pop    %ebp
     c37:	c3                   	ret    
     c38:	90                   	nop
     c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c40 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	56                   	push   %esi
     c44:	53                   	push   %ebx
     c45:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c48:	8b 45 08             	mov    0x8(%ebp),%eax
     c4b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c4e:	85 db                	test   %ebx,%ebx
     c50:	7e 14                	jle    c66 <memmove+0x26>
     c52:	31 d2                	xor    %edx,%edx
     c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     c58:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     c5c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c5f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c62:	39 da                	cmp    %ebx,%edx
     c64:	75 f2                	jne    c58 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     c66:	5b                   	pop    %ebx
     c67:	5e                   	pop    %esi
     c68:	5d                   	pop    %ebp
     c69:	c3                   	ret    
     c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c70 <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
     c70:	55                   	push   %ebp
     c71:	89 e5                	mov    %esp,%ebp
     c73:	57                   	push   %edi
     c74:	56                   	push   %esi
     c75:	53                   	push   %ebx
     c76:	83 ec 04             	sub    $0x4,%esp
     c79:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int i = n;
    int length = 0;

    while (i > 0) {
     c7c:	83 f9 00             	cmp    $0x0,%ecx
     c7f:	7e 76                	jle    cf7 <itoa+0x87>
     c81:	89 cb                	mov    %ecx,%ebx
     c83:	31 f6                	xor    %esi,%esi
        length++;
        i /= 10;
     c85:	bf 67 66 66 66       	mov    $0x66666667,%edi
     c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c90:	89 d8                	mov    %ebx,%eax
     c92:	c1 fb 1f             	sar    $0x1f,%ebx
{
    int i = n;
    int length = 0;

    while (i > 0) {
        length++;
     c95:	83 c6 01             	add    $0x1,%esi
        i /= 10;
     c98:	f7 ef                	imul   %edi
     c9a:	c1 fa 02             	sar    $0x2,%edx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
     c9d:	29 da                	sub    %ebx,%edx
     c9f:	89 d3                	mov    %edx,%ebx
     ca1:	75 ed                	jne    c90 <itoa+0x20>
        length++;
     ca3:	89 f3                	mov    %esi,%ebx
     ca5:	89 75 f0             	mov    %esi,-0x10(%ebp)
    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
        buf[i - 1] = (n % 10) + '0';
     ca8:	bf 67 66 66 66       	mov    $0x66666667,%edi
     cad:	8b 75 08             	mov    0x8(%ebp),%esi
     cb0:	eb 0a                	jmp    cbc <itoa+0x4c>
     cb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
     cb8:	85 db                	test   %ebx,%ebx
     cba:	7e 25                	jle    ce1 <itoa+0x71>
        buf[i - 1] = (n % 10) + '0';
     cbc:	89 c8                	mov    %ecx,%eax
     cbe:	f7 ef                	imul   %edi
     cc0:	89 c8                	mov    %ecx,%eax
     cc2:	c1 f8 1f             	sar    $0x1f,%eax
     cc5:	c1 fa 02             	sar    $0x2,%edx
     cc8:	29 c2                	sub    %eax,%edx
     cca:	8d 04 92             	lea    (%edx,%edx,4),%eax
     ccd:	01 c0                	add    %eax,%eax
     ccf:	29 c1                	sub    %eax,%ecx
     cd1:	83 c1 30             	add    $0x30,%ecx
     cd4:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
     cd8:	83 eb 01             	sub    $0x1,%ebx
     cdb:	85 d2                	test   %edx,%edx
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
     cdd:	89 d1                	mov    %edx,%ecx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
     cdf:	7f d7                	jg     cb8 <itoa+0x48>
     ce1:	8b 75 f0             	mov    -0x10(%ebp),%esi
     ce4:	89 f0                	mov    %esi,%eax
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
     ce6:	8b 7d 08             	mov    0x8(%ebp),%edi
     ce9:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
    return length;
}
     ced:	83 c4 04             	add    $0x4,%esp
     cf0:	89 f0                	mov    %esi,%eax
     cf2:	5b                   	pop    %ebx
     cf3:	5e                   	pop    %esi
     cf4:	5f                   	pop    %edi
     cf5:	5d                   	pop    %ebp
     cf6:	c3                   	ret    
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
     cf7:	75 12                	jne    d0b <itoa+0x9b>
        buf[0] = '0';
     cf9:	8b 45 08             	mov    0x8(%ebp),%eax
        length++;
     cfc:	be 01 00 00 00       	mov    $0x1,%esi
        length++;
        i /= 10;
    }

    if (n == 0) {
        buf[0] = '0';
     d01:	c6 00 30             	movb   $0x30,(%eax)
     d04:	b8 01 00 00 00       	mov    $0x1,%eax
     d09:	eb db                	jmp    ce6 <itoa+0x76>
    while (i > 0) {
        length++;
        i /= 10;
    }

    if (n == 0) {
     d0b:	31 c0                	xor    %eax,%eax
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;
     d0d:	31 f6                	xor    %esi,%esi
     d0f:	eb d5                	jmp    ce6 <itoa+0x76>
     d11:	eb 0d                	jmp    d20 <strcat>
     d13:	90                   	nop
     d14:	90                   	nop
     d15:	90                   	nop
     d16:	90                   	nop
     d17:	90                   	nop
     d18:	90                   	nop
     d19:	90                   	nop
     d1a:	90                   	nop
     d1b:	90                   	nop
     d1c:	90                   	nop
     d1d:	90                   	nop
     d1e:	90                   	nop
     d1f:	90                   	nop

00000d20 <strcat>:
    buf[length] = '\0';
    return length;
}

char* strcat(char* dest, const char* source)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	57                   	push   %edi
     d24:	56                   	push   %esi
     d25:	8b 45 08             	mov    0x8(%ebp),%eax
     d28:	53                   	push   %ebx
     d29:	8b 75 0c             	mov    0xc(%ebp),%esi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
     d2c:	80 38 00             	cmpb   $0x0,(%eax)
     d2f:	74 38                	je     d69 <strcat+0x49>
     d31:	31 c9                	xor    %ecx,%ecx
     d33:	90                   	nop
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d38:	83 c1 01             	add    $0x1,%ecx
     d3b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
     d3f:	89 ca                	mov    %ecx,%edx
     d41:	75 f5                	jne    d38 <strcat+0x18>

        for (j = 0; source[j] != '\0'; j++)
     d43:	0f b6 1e             	movzbl (%esi),%ebx
     d46:	84 db                	test   %bl,%bl
     d48:	74 16                	je     d60 <strcat+0x40>
     d4a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
     d4d:	31 d2                	xor    %edx,%edx
     d4f:	90                   	nop
                dest[i + j] = source[j];
     d50:	88 1c 17             	mov    %bl,(%edi,%edx,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
     d53:	83 c2 01             	add    $0x1,%edx
     d56:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
     d5a:	84 db                	test   %bl,%bl
     d5c:	75 f2                	jne    d50 <strcat+0x30>
     d5e:	01 ca                	add    %ecx,%edx
                dest[i + j] = source[j];

        dest[i + j] = '\0';
     d60:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
     d64:	5b                   	pop    %ebx
     d65:	5e                   	pop    %esi
     d66:	5f                   	pop    %edi
     d67:	5d                   	pop    %ebp
     d68:	c3                   	ret    

char* strcat(char* dest, const char* source)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
     d69:	31 d2                	xor    %edx,%edx
     d6b:	31 c9                	xor    %ecx,%ecx
     d6d:	eb d4                	jmp    d43 <strcat+0x23>
     d6f:	90                   	nop

00000d70 <strstr>:

        return dest;
}

char * strstr(char * src, char * needle)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 10             	sub    $0x10,%esp
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     d79:	8b 45 0c             	mov    0xc(%ebp),%eax

        return dest;
}

char * strstr(char * src, char * needle)
{
     d7c:	8b 7d 08             	mov    0x8(%ebp),%edi
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     d7f:	0f b6 00             	movzbl (%eax),%eax
     d82:	84 c0                	test   %al,%al
     d84:	88 45 f3             	mov    %al,-0xd(%ebp)
     d87:	0f 84 a0 00 00 00    	je     e2d <strstr+0xbd>
     d8d:	8b 55 0c             	mov    0xc(%ebp),%edx
     d90:	31 c0                	xor    %eax,%eax
     d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d98:	83 c0 01             	add    $0x1,%eax
     d9b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     d9f:	75 f7                	jne    d98 <strstr+0x28>
     da1:	89 45 e8             	mov    %eax,-0x18(%ebp)
     da4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     da7:	0f b6 07             	movzbl (%edi),%eax
     daa:	84 c0                	test   %al,%al
     dac:	74 68                	je     e16 <strstr+0xa6>
     dae:	31 d2                	xor    %edx,%edx
     db0:	83 c2 01             	add    $0x1,%edx
     db3:	80 3c 17 00          	cmpb   $0x0,(%edi,%edx,1)
     db7:	75 f7                	jne    db0 <strstr+0x40>
     db9:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     dbc:	84 c0                	test   %al,%al
     dbe:	89 5d ec             	mov    %ebx,-0x14(%ebp)
     dc1:	74 4d                	je     e10 <strstr+0xa0>
     dc3:	90                   	nop
     dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     dc8:	38 45 f3             	cmp    %al,-0xd(%ebp)
     dcb:	75 34                	jne    e01 <strstr+0x91>
     dcd:	8b 5d e8             	mov    -0x18(%ebp),%ebx
     dd0:	83 eb 01             	sub    $0x1,%ebx
     dd3:	74 4b                	je     e20 <strstr+0xb0>
     dd5:	8b 55 0c             	mov    0xc(%ebp),%edx
     dd8:	89 f8                	mov    %edi,%eax
     dda:	eb 10                	jmp    dec <strstr+0x7c>
     ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     de0:	3a 4a 01             	cmp    0x1(%edx),%cl
     de3:	75 1c                	jne    e01 <strstr+0x91>
     de5:	83 eb 01             	sub    $0x1,%ebx
     de8:	89 f2                	mov    %esi,%edx
     dea:	74 34                	je     e20 <strstr+0xb0>
    p++, q++;
     dec:	83 c0 01             	add    $0x1,%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     def:	0f b6 08             	movzbl (%eax),%ecx
    p++, q++;
     df2:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     df5:	84 c9                	test   %cl,%cl
     df7:	75 e7                	jne    de0 <strstr+0x70>
     df9:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
     dfd:	84 c0                	test   %al,%al
     dff:	74 1f                	je     e20 <strstr+0xb0>
    {
      return src + needle_size;
    }
    src++;
     e01:	83 c7 01             	add    $0x1,%edi
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
     e04:	3b 7d ec             	cmp    -0x14(%ebp),%edi
     e07:	74 0d                	je     e16 <strstr+0xa6>
     e09:	0f b6 07             	movzbl (%edi),%eax
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
     e0c:	84 c0                	test   %al,%al
     e0e:	75 b8                	jne    dc8 <strstr+0x58>
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     e10:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
     e14:	eb e7                	jmp    dfd <strstr+0x8d>
      return src + needle_size;
    }
    src++;
  }
  return 0;
}
     e16:	83 c4 10             	add    $0x10,%esp
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
     e19:	31 c0                	xor    %eax,%eax
}
     e1b:	5b                   	pop    %ebx
     e1c:	5e                   	pop    %esi
     e1d:	5f                   	pop    %edi
     e1e:	5d                   	pop    %ebp
     e1f:	c3                   	ret    

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
     e20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    src++;
  }
  return 0;
}
     e23:	83 c4 10             	add    $0x10,%esp
     e26:	5b                   	pop    %ebx
     e27:	5e                   	pop    %esi

  for(i = 0; i < src_len; i++)
  {
    if(0 == strncmp(src, needle, needle_size))
    {
      return src + needle_size;
     e28:	01 f8                	add    %edi,%eax
    }
    src++;
  }
  return 0;
}
     e2a:	5f                   	pop    %edi
     e2b:	5d                   	pop    %ebp
     e2c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     e2d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     e34:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     e3b:	e9 67 ff ff ff       	jmp    da7 <strstr+0x37>

00000e40 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e40:	b8 01 00 00 00       	mov    $0x1,%eax
     e45:	cd 40                	int    $0x40
     e47:	c3                   	ret    

00000e48 <exit>:
SYSCALL(exit)
     e48:	b8 02 00 00 00       	mov    $0x2,%eax
     e4d:	cd 40                	int    $0x40
     e4f:	c3                   	ret    

00000e50 <wait>:
SYSCALL(wait)
     e50:	b8 03 00 00 00       	mov    $0x3,%eax
     e55:	cd 40                	int    $0x40
     e57:	c3                   	ret    

00000e58 <pipe>:
SYSCALL(pipe)
     e58:	b8 04 00 00 00       	mov    $0x4,%eax
     e5d:	cd 40                	int    $0x40
     e5f:	c3                   	ret    

00000e60 <read>:
SYSCALL(read)
     e60:	b8 05 00 00 00       	mov    $0x5,%eax
     e65:	cd 40                	int    $0x40
     e67:	c3                   	ret    

00000e68 <write>:
SYSCALL(write)
     e68:	b8 10 00 00 00       	mov    $0x10,%eax
     e6d:	cd 40                	int    $0x40
     e6f:	c3                   	ret    

00000e70 <close>:
SYSCALL(close)
     e70:	b8 15 00 00 00       	mov    $0x15,%eax
     e75:	cd 40                	int    $0x40
     e77:	c3                   	ret    

00000e78 <kill>:
SYSCALL(kill)
     e78:	b8 06 00 00 00       	mov    $0x6,%eax
     e7d:	cd 40                	int    $0x40
     e7f:	c3                   	ret    

00000e80 <exec>:
SYSCALL(exec)
     e80:	b8 07 00 00 00       	mov    $0x7,%eax
     e85:	cd 40                	int    $0x40
     e87:	c3                   	ret    

00000e88 <open>:
SYSCALL(open)
     e88:	b8 0f 00 00 00       	mov    $0xf,%eax
     e8d:	cd 40                	int    $0x40
     e8f:	c3                   	ret    

00000e90 <mknod>:
SYSCALL(mknod)
     e90:	b8 11 00 00 00       	mov    $0x11,%eax
     e95:	cd 40                	int    $0x40
     e97:	c3                   	ret    

00000e98 <unlink>:
SYSCALL(unlink)
     e98:	b8 12 00 00 00       	mov    $0x12,%eax
     e9d:	cd 40                	int    $0x40
     e9f:	c3                   	ret    

00000ea0 <fstat>:
SYSCALL(fstat)
     ea0:	b8 08 00 00 00       	mov    $0x8,%eax
     ea5:	cd 40                	int    $0x40
     ea7:	c3                   	ret    

00000ea8 <link>:
SYSCALL(link)
     ea8:	b8 13 00 00 00       	mov    $0x13,%eax
     ead:	cd 40                	int    $0x40
     eaf:	c3                   	ret    

00000eb0 <mkdir>:
SYSCALL(mkdir)
     eb0:	b8 14 00 00 00       	mov    $0x14,%eax
     eb5:	cd 40                	int    $0x40
     eb7:	c3                   	ret    

00000eb8 <chdir>:
SYSCALL(chdir)
     eb8:	b8 09 00 00 00       	mov    $0x9,%eax
     ebd:	cd 40                	int    $0x40
     ebf:	c3                   	ret    

00000ec0 <dup>:
SYSCALL(dup)
     ec0:	b8 0a 00 00 00       	mov    $0xa,%eax
     ec5:	cd 40                	int    $0x40
     ec7:	c3                   	ret    

00000ec8 <getpid>:
SYSCALL(getpid)
     ec8:	b8 0b 00 00 00       	mov    $0xb,%eax
     ecd:	cd 40                	int    $0x40
     ecf:	c3                   	ret    

00000ed0 <sbrk>:
SYSCALL(sbrk)
     ed0:	b8 0c 00 00 00       	mov    $0xc,%eax
     ed5:	cd 40                	int    $0x40
     ed7:	c3                   	ret    

00000ed8 <sleep>:
SYSCALL(sleep)
     ed8:	b8 0d 00 00 00       	mov    $0xd,%eax
     edd:	cd 40                	int    $0x40
     edf:	c3                   	ret    

00000ee0 <uptime>:
SYSCALL(uptime)
     ee0:	b8 0e 00 00 00       	mov    $0xe,%eax
     ee5:	cd 40                	int    $0x40
     ee7:	c3                   	ret    

00000ee8 <mount>:
SYSCALL(mount)
     ee8:	b8 16 00 00 00       	mov    $0x16,%eax
     eed:	cd 40                	int    $0x40
     eef:	c3                   	ret    

00000ef0 <umount>:
SYSCALL(umount)
     ef0:	b8 17 00 00 00       	mov    $0x17,%eax
     ef5:	cd 40                	int    $0x40
     ef7:	c3                   	ret    

00000ef8 <printmounts>:
SYSCALL(printmounts)
     ef8:	b8 18 00 00 00       	mov    $0x18,%eax
     efd:	cd 40                	int    $0x40
     eff:	c3                   	ret    

00000f00 <printdevices>:
SYSCALL(printdevices)
     f00:	b8 19 00 00 00       	mov    $0x19,%eax
     f05:	cd 40                	int    $0x40
     f07:	c3                   	ret    

00000f08 <unshare>:
SYSCALL(unshare)
     f08:	b8 1a 00 00 00       	mov    $0x1a,%eax
     f0d:	cd 40                	int    $0x40
     f0f:	c3                   	ret    

00000f10 <usleep>:
SYSCALL(usleep)
     f10:	b8 1b 00 00 00       	mov    $0x1b,%eax
     f15:	cd 40                	int    $0x40
     f17:	c3                   	ret    

00000f18 <ioctl>:
SYSCALL(ioctl)
     f18:	b8 1c 00 00 00       	mov    $0x1c,%eax
     f1d:	cd 40                	int    $0x40
     f1f:	c3                   	ret    

00000f20 <getppid>:
SYSCALL(getppid)
     f20:	b8 1d 00 00 00       	mov    $0x1d,%eax
     f25:	cd 40                	int    $0x40
     f27:	c3                   	ret    

00000f28 <getcpu>:
SYSCALL(getcpu)
     f28:	b8 1e 00 00 00       	mov    $0x1e,%eax
     f2d:	cd 40                	int    $0x40
     f2f:	c3                   	ret    

00000f30 <getmem>:
SYSCALL(getmem)
     f30:	b8 1f 00 00 00       	mov    $0x1f,%eax
     f35:	cd 40                	int    $0x40
     f37:	c3                   	ret    

00000f38 <kmemtest>:
SYSCALL(kmemtest)
     f38:	b8 20 00 00 00       	mov    $0x20,%eax
     f3d:	cd 40                	int    $0x40
     f3f:	c3                   	ret    

00000f40 <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
     f40:	55                   	push   %ebp
     f41:	89 e5                	mov    %esp,%ebp
     f43:	57                   	push   %edi
     f44:	56                   	push   %esi
     f45:	53                   	push   %ebx
     f46:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
     f4c:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     f4f:	85 db                	test   %ebx,%ebx
     f51:	0f 84 91 00 00 00    	je     fe8 <printint+0xa8>
     f57:	89 d0                	mov    %edx,%eax
     f59:	c1 e8 1f             	shr    $0x1f,%eax
     f5c:	84 c0                	test   %al,%al
     f5e:	0f 84 84 00 00 00    	je     fe8 <printint+0xa8>
    neg = 1;
    x = -xx;
     f64:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     f66:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     f6d:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
     f6f:	31 ff                	xor    %edi,%edi
     f71:	8d 75 c7             	lea    -0x39(%ebp),%esi
     f74:	eb 0c                	jmp    f82 <printint+0x42>
     f76:	8d 76 00             	lea    0x0(%esi),%esi
     f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{
    buf[i++] = digits[x % base];
     f80:	89 df                	mov    %ebx,%edi
     f82:	31 d2                	xor    %edx,%edx
     f84:	8d 5f 01             	lea    0x1(%edi),%ebx
     f87:	f7 f1                	div    %ecx
     f89:	0f b6 92 5c 17 00 00 	movzbl 0x175c(%edx),%edx
  }while((x /= base) != 0);
     f90:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     f92:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     f95:	75 e9                	jne    f80 <printint+0x40>
  if(neg)
     f97:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     f9a:	85 c0                	test   %eax,%eax
     f9c:	74 08                	je     fa6 <printint+0x66>
    buf[i++] = '-';
     f9e:	c6 44 1d c8 2d       	movb   $0x2d,-0x38(%ebp,%ebx,1)
     fa3:	8d 5f 02             	lea    0x2(%edi),%ebx
     fa6:	8d 7d d8             	lea    -0x28(%ebp),%edi
     fa9:	8d 44 1d c7          	lea    -0x39(%ebp,%ebx,1),%eax
     fad:	89 fa                	mov    %edi,%edx
     faf:	90                   	nop

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
     fb0:	0f b6 08             	movzbl (%eax),%ecx
     fb3:	83 e8 01             	sub    $0x1,%eax
     fb6:	83 c2 01             	add    $0x1,%edx
     fb9:	88 4a ff             	mov    %cl,-0x1(%edx)
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
     fbc:	39 f0                	cmp    %esi,%eax
     fbe:	75 f0                	jne    fb0 <printint+0x70>
      str[j++] = buf[i];
  }
  str[j] = '\0';
  
  return write(fd, str, strlen(str));
     fc0:	83 ec 0c             	sub    $0xc,%esp
  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
  }
  str[j] = '\0';
     fc3:	c6 44 1d d8 00       	movb   $0x0,-0x28(%ebp,%ebx,1)
  
  return write(fd, str, strlen(str));
     fc8:	57                   	push   %edi
     fc9:	e8 f2 fa ff ff       	call   ac0 <strlen>
     fce:	83 c4 0c             	add    $0xc,%esp
     fd1:	50                   	push   %eax
     fd2:	57                   	push   %edi
     fd3:	ff 75 c0             	pushl  -0x40(%ebp)
     fd6:	e8 8d fe ff ff       	call   e68 <write>
}
     fdb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fde:	5b                   	pop    %ebx
     fdf:	5e                   	pop    %esi
     fe0:	5f                   	pop    %edi
     fe1:	5d                   	pop    %ebp
     fe2:	c3                   	ret    
     fe3:	90                   	nop
     fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     fe8:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     fea:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     ff1:	e9 79 ff ff ff       	jmp    f6f <printint+0x2f>
     ff6:	8d 76 00             	lea    0x0(%esi),%esi
     ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001000 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	57                   	push   %edi
    1004:	56                   	push   %esi
    1005:	53                   	push   %ebx
    1006:	83 ec 2c             	sub    $0x2c,%esp
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1009:	8b 75 0c             	mov    0xc(%ebp),%esi
    100c:	0f b6 06             	movzbl (%esi),%eax
    100f:	84 c0                	test   %al,%al
    1011:	0f 84 90 01 00 00    	je     11a7 <printf+0x1a7>
    1017:	8d 5d 10             	lea    0x10(%ebp),%ebx
    101a:	31 ff                	xor    %edi,%edi
    101c:	31 d2                	xor    %edx,%edx
    101e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1021:	31 db                	xor    %ebx,%ebx
    1023:	eb 39                	jmp    105e <printf+0x5e>
    1025:	8d 76 00             	lea    0x0(%esi),%esi
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1028:	83 f9 25             	cmp    $0x25,%ecx
    102b:	0f 84 af 00 00 00    	je     10e0 <printf+0xe0>
    1031:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1034:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1037:	83 ec 04             	sub    $0x4,%esp
    103a:	6a 01                	push   $0x1
    103c:	50                   	push   %eax
    103d:	ff 75 08             	pushl  0x8(%ebp)
    1040:	e8 23 fe ff ff       	call   e68 <write>
    1045:	83 c4 10             	add    $0x10,%esp
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
    1048:	85 c0                	test   %eax,%eax
    104a:	78 35                	js     1081 <printf+0x81>
    104c:	8b 75 0c             	mov    0xc(%ebp),%esi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    104f:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    1052:	01 c7                	add    %eax,%edi
    1054:	31 d2                	xor    %edx,%edx
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1056:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    105a:	84 c0                	test   %al,%al
    105c:	74 21                	je     107f <printf+0x7f>
    num_chars = 0;
    c = fmt[i] & 0xff;
    105e:	0f be c8             	movsbl %al,%ecx
    if(state == 0){
    1061:	85 d2                	test   %edx,%edx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    1063:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    1066:	0f b6 c8             	movzbl %al,%ecx
    if(state == 0){
    1069:	74 bd                	je     1028 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
    106b:	83 fa 25             	cmp    $0x25,%edx
    106e:	74 20                	je     1090 <printf+0x90>
    1070:	31 c0                	xor    %eax,%eax
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1072:	83 c3 01             	add    $0x1,%ebx
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    1075:	01 c7                	add    %eax,%edi
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1077:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    107b:	84 c0                	test   %al,%al
    107d:	75 df                	jne    105e <printf+0x5e>
      state = 0;
    }
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
    107f:	89 f8                	mov    %edi,%eax
  }
  return retval;
}
    1081:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1084:	5b                   	pop    %ebx
    1085:	5e                   	pop    %esi
    1086:	5f                   	pop    %edi
    1087:	5d                   	pop    %ebp
    1088:	c3                   	ret    
    1089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        state = '%';
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
    1090:	83 f9 64             	cmp    $0x64,%ecx
    1093:	0f 84 7f 00 00 00    	je     1118 <printf+0x118>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1099:	0f be d0             	movsbl %al,%edx
    109c:	81 e2 f7 00 00 00    	and    $0xf7,%edx
    10a2:	83 fa 70             	cmp    $0x70,%edx
    10a5:	74 49                	je     10f0 <printf+0xf0>
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    10a7:	83 f9 73             	cmp    $0x73,%ecx
    10aa:	0f 84 98 00 00 00    	je     1148 <printf+0x148>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
    10b0:	83 f9 63             	cmp    $0x63,%ecx
    10b3:	0f 84 c7 00 00 00    	je     1180 <printf+0x180>
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    10b9:	83 f9 25             	cmp    $0x25,%ecx
    10bc:	74 6a                	je     1128 <printf+0x128>
static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    str[1] = c;
    10be:	88 45 e7             	mov    %al,-0x19(%ebp)
 
    return write(fd, str, 2);
    10c1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    10c4:	83 ec 04             	sub    $0x4,%esp
    10c7:	6a 02                	push   $0x2

static int
printunknown(int fd, char c)
{
    char str[2];
    str[0] = '%';
    10c9:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    str[1] = c;
 
    return write(fd, str, 2);
    10cd:	50                   	push   %eax
    10ce:	ff 75 08             	pushl  0x8(%ebp)
    10d1:	e8 92 fd ff ff       	call   e68 <write>
    10d6:	83 c4 10             	add    $0x10,%esp
    10d9:	e9 6a ff ff ff       	jmp    1048 <printf+0x48>
    10de:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    10e0:	ba 25 00 00 00       	mov    $0x25,%edx
    10e5:	31 c0                	xor    %eax,%eax
    10e7:	eb 89                	jmp    1072 <printf+0x72>
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    10f0:	83 ec 0c             	sub    $0xc,%esp
    10f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    10f8:	6a 00                	push   $0x0
    10fa:	8b 75 d0             	mov    -0x30(%ebp),%esi
    10fd:	8b 45 08             	mov    0x8(%ebp),%eax
    1100:	8b 16                	mov    (%esi),%edx
        ap++;
    1102:	83 c6 04             	add    $0x4,%esi
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
    1105:	e8 36 fe ff ff       	call   f40 <printint>
        ap++;
    110a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    110d:	83 c4 10             	add    $0x10,%esp
    1110:	e9 33 ff ff ff       	jmp    1048 <printf+0x48>
    1115:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        num_chars = putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
    1118:	83 ec 0c             	sub    $0xc,%esp
    111b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1120:	6a 01                	push   $0x1
    1122:	eb d6                	jmp    10fa <printf+0xfa>
    1124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1128:	88 45 e5             	mov    %al,-0x1b(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    112b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    112e:	83 ec 04             	sub    $0x4,%esp
    1131:	6a 01                	push   $0x1
    1133:	50                   	push   %eax
    1134:	ff 75 08             	pushl  0x8(%ebp)
    1137:	e8 2c fd ff ff       	call   e68 <write>
    113c:	83 c4 10             	add    $0x10,%esp
    113f:	e9 04 ff ff ff       	jmp    1048 <printf+0x48>
    1144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    1148:	8b 45 d0             	mov    -0x30(%ebp),%eax
    114b:	8b 30                	mov    (%eax),%esi
        ap++;
    114d:	83 c0 04             	add    $0x4,%eax
    1150:	89 45 d0             	mov    %eax,-0x30(%ebp)
static int
printstr(int fd, char *str)
{

  if (str == 0)
    str = "(null)";
    1153:	b8 54 17 00 00       	mov    $0x1754,%eax
    1158:	85 f6                	test   %esi,%esi
    115a:	0f 44 f0             	cmove  %eax,%esi

  return write(fd , str, strlen(str));
    115d:	83 ec 0c             	sub    $0xc,%esp
    1160:	56                   	push   %esi
    1161:	e8 5a f9 ff ff       	call   ac0 <strlen>
    1166:	83 c4 0c             	add    $0xc,%esp
    1169:	50                   	push   %eax
    116a:	56                   	push   %esi
    116b:	ff 75 08             	pushl  0x8(%ebp)
    116e:	e8 f5 fc ff ff       	call   e68 <write>
    1173:	83 c4 10             	add    $0x10,%esp
    1176:	e9 cd fe ff ff       	jmp    1048 <printf+0x48>
    117b:	90                   	nop
    117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1180:	8b 75 d0             	mov    -0x30(%ebp),%esi
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1183:	83 ec 04             	sub    $0x4,%esp
    1186:	8b 06                	mov    (%esi),%eax
    1188:	6a 01                	push   $0x1
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    118a:	83 c6 04             	add    $0x4,%esi
    118d:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static int
putc(int fd, char c)
{
  return write(fd, &c, 1);
    1190:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1193:	50                   	push   %eax
    1194:	ff 75 08             	pushl  0x8(%ebp)
    1197:	e8 cc fc ff ff       	call   e68 <write>
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
    119c:	89 75 d0             	mov    %esi,-0x30(%ebp)
    119f:	83 c4 10             	add    $0x10,%esp
    11a2:	e9 a1 fe ff ff       	jmp    1048 <printf+0x48>
{
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
    11a7:	31 c0                	xor    %eax,%eax
    11a9:	e9 d3 fe ff ff       	jmp    1081 <printf+0x81>
    11ae:	66 90                	xchg   %ax,%ax

000011b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    11b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11b1:	a1 08 30 00 00       	mov    0x3008,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    11b6:	89 e5                	mov    %esp,%ebp
    11b8:	57                   	push   %edi
    11b9:	56                   	push   %esi
    11ba:	53                   	push   %ebx
    11bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11be:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    11c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11c3:	39 c8                	cmp    %ecx,%eax
    11c5:	73 19                	jae    11e0 <free+0x30>
    11c7:	89 f6                	mov    %esi,%esi
    11c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    11d0:	39 d1                	cmp    %edx,%ecx
    11d2:	72 1c                	jb     11f0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11d4:	39 d0                	cmp    %edx,%eax
    11d6:	73 18                	jae    11f0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    11d8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11da:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11dc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11de:	72 f0                	jb     11d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11e0:	39 d0                	cmp    %edx,%eax
    11e2:	72 f4                	jb     11d8 <free+0x28>
    11e4:	39 d1                	cmp    %edx,%ecx
    11e6:	73 f0                	jae    11d8 <free+0x28>
    11e8:	90                   	nop
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    11f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    11f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    11f6:	39 d7                	cmp    %edx,%edi
    11f8:	74 19                	je     1213 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    11fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    11fd:	8b 50 04             	mov    0x4(%eax),%edx
    1200:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1203:	39 f1                	cmp    %esi,%ecx
    1205:	74 23                	je     122a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1207:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1209:	a3 08 30 00 00       	mov    %eax,0x3008
}
    120e:	5b                   	pop    %ebx
    120f:	5e                   	pop    %esi
    1210:	5f                   	pop    %edi
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1213:	03 72 04             	add    0x4(%edx),%esi
    1216:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1219:	8b 10                	mov    (%eax),%edx
    121b:	8b 12                	mov    (%edx),%edx
    121d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1220:	8b 50 04             	mov    0x4(%eax),%edx
    1223:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1226:	39 f1                	cmp    %esi,%ecx
    1228:	75 dd                	jne    1207 <free+0x57>
    p->s.size += bp->s.size;
    122a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    122d:	a3 08 30 00 00       	mov    %eax,0x3008
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1232:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1235:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1238:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    123a:	5b                   	pop    %ebx
    123b:	5e                   	pop    %esi
    123c:	5f                   	pop    %edi
    123d:	5d                   	pop    %ebp
    123e:	c3                   	ret    
    123f:	90                   	nop

00001240 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	56                   	push   %esi
    1245:	53                   	push   %ebx
    1246:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1249:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    124c:	8b 15 08 30 00 00    	mov    0x3008,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1252:	8d 78 07             	lea    0x7(%eax),%edi
    1255:	c1 ef 03             	shr    $0x3,%edi
    1258:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    125b:	85 d2                	test   %edx,%edx
    125d:	0f 84 a3 00 00 00    	je     1306 <malloc+0xc6>
    1263:	8b 02                	mov    (%edx),%eax
    1265:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1268:	39 cf                	cmp    %ecx,%edi
    126a:	76 74                	jbe    12e0 <malloc+0xa0>
    126c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1272:	be 00 10 00 00       	mov    $0x1000,%esi
    1277:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    127e:	0f 43 f7             	cmovae %edi,%esi
    1281:	ba 00 80 00 00       	mov    $0x8000,%edx
    1286:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    128c:	0f 46 da             	cmovbe %edx,%ebx
    128f:	eb 10                	jmp    12a1 <malloc+0x61>
    1291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1298:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    129a:	8b 48 04             	mov    0x4(%eax),%ecx
    129d:	39 cf                	cmp    %ecx,%edi
    129f:	76 3f                	jbe    12e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12a1:	39 05 08 30 00 00    	cmp    %eax,0x3008
    12a7:	89 c2                	mov    %eax,%edx
    12a9:	75 ed                	jne    1298 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    12ab:	83 ec 0c             	sub    $0xc,%esp
    12ae:	53                   	push   %ebx
    12af:	e8 1c fc ff ff       	call   ed0 <sbrk>
  if(p == (char*)-1)
    12b4:	83 c4 10             	add    $0x10,%esp
    12b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    12ba:	74 1c                	je     12d8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    12bc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    12bf:	83 ec 0c             	sub    $0xc,%esp
    12c2:	83 c0 08             	add    $0x8,%eax
    12c5:	50                   	push   %eax
    12c6:	e8 e5 fe ff ff       	call   11b0 <free>
  return freep;
    12cb:	8b 15 08 30 00 00    	mov    0x3008,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    12d1:	83 c4 10             	add    $0x10,%esp
    12d4:	85 d2                	test   %edx,%edx
    12d6:	75 c0                	jne    1298 <malloc+0x58>
        return 0;
    12d8:	31 c0                	xor    %eax,%eax
    12da:	eb 1c                	jmp    12f8 <malloc+0xb8>
    12dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    12e0:	39 cf                	cmp    %ecx,%edi
    12e2:	74 1c                	je     1300 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    12e4:	29 f9                	sub    %edi,%ecx
    12e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    12e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    12ec:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    12ef:	89 15 08 30 00 00    	mov    %edx,0x3008
      return (void*)(p + 1);
    12f5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    12f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12fb:	5b                   	pop    %ebx
    12fc:	5e                   	pop    %esi
    12fd:	5f                   	pop    %edi
    12fe:	5d                   	pop    %ebp
    12ff:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1300:	8b 08                	mov    (%eax),%ecx
    1302:	89 0a                	mov    %ecx,(%edx)
    1304:	eb e9                	jmp    12ef <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1306:	c7 05 08 30 00 00 0c 	movl   $0x300c,0x3008
    130d:	30 00 00 
    1310:	c7 05 0c 30 00 00 0c 	movl   $0x300c,0x300c
    1317:	30 00 00 
    base.s.size = 0;
    131a:	b8 0c 30 00 00       	mov    $0x300c,%eax
    131f:	c7 05 10 30 00 00 00 	movl   $0x0,0x3010
    1326:	00 00 00 
    1329:	e9 3e ff ff ff       	jmp    126c <malloc+0x2c>
    132e:	66 90                	xchg   %ax,%ax

00001330 <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    1336:	6a 10                	push   $0x10
    1338:	6a 02                	push   $0x2
    133a:	ff 75 08             	pushl  0x8(%ebp)
    133d:	e8 d6 fb ff ff       	call   f18 <ioctl>
}
    1342:	c9                   	leave  
    1343:	c3                   	ret    
    1344:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    134a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001350 <is_connected_tty>:

int
is_connected_tty(int tty_fd){
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
    1356:	68 00 10 00 00       	push   $0x1000
    135b:	6a 02                	push   $0x2
    135d:	ff 75 08             	pushl  0x8(%ebp)
    1360:	e8 b3 fb ff ff       	call   f18 <ioctl>
}
    1365:	c9                   	leave  
    1366:	c3                   	ret    
    1367:	89 f6                	mov    %esi,%esi
    1369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001370 <attach_tty>:

int
attach_tty(int tty_fd)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	53                   	push   %ebx
    1374:	83 ec 08             	sub    $0x8,%esp
    1377:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
    137a:	6a 10                	push   $0x10
    137c:	6a 01                	push   $0x1
    137e:	53                   	push   %ebx
    137f:	e8 94 fb ff ff       	call   f18 <ioctl>
    1384:	83 c4 10             	add    $0x10,%esp
    1387:	85 c0                	test   %eax,%eax
    1389:	78 55                	js     13e0 <attach_tty+0x70>
     return -1;

    close(0);
    138b:	83 ec 0c             	sub    $0xc,%esp
    138e:	6a 00                	push   $0x0
    1390:	e8 db fa ff ff       	call   e70 <close>
    close(1);
    1395:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    139c:	e8 cf fa ff ff       	call   e70 <close>
    close(2);
    13a1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    13a8:	e8 c3 fa ff ff       	call   e70 <close>
    if(dup(tty_fd) < 0)
    13ad:	89 1c 24             	mov    %ebx,(%esp)
    13b0:	e8 0b fb ff ff       	call   ec0 <dup>
    13b5:	83 c4 10             	add    $0x10,%esp
    13b8:	85 c0                	test   %eax,%eax
    13ba:	78 24                	js     13e0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    13bc:	83 ec 0c             	sub    $0xc,%esp
    13bf:	53                   	push   %ebx
    13c0:	e8 fb fa ff ff       	call   ec0 <dup>
    13c5:	83 c4 10             	add    $0x10,%esp
    13c8:	85 c0                	test   %eax,%eax
    13ca:	78 14                	js     13e0 <attach_tty+0x70>
      return -1;

    if(dup(tty_fd) < 0)
    13cc:	83 ec 0c             	sub    $0xc,%esp
    13cf:	53                   	push   %ebx
    13d0:	e8 eb fa ff ff       	call   ec0 <dup>
    13d5:	83 c4 10             	add    $0x10,%esp
    13d8:	c1 f8 1f             	sar    $0x1f,%eax
      return -1;

     return 0;
}
    13db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13de:	c9                   	leave  
    13df:	c3                   	ret    

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
    13e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
}
    13e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13e8:	c9                   	leave  
    13e9:	c3                   	ret    
    13ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013f0 <detach_tty>:

int
detach_tty(int tty_fd)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
    13f6:	6a 20                	push   $0x20
    13f8:	6a 01                	push   $0x1
    13fa:	ff 75 08             	pushl  0x8(%ebp)
    13fd:	e8 16 fb ff ff       	call   f18 <ioctl>
    return 0;
}
    1402:	31 c0                	xor    %eax,%eax
    1404:	c9                   	leave  
    1405:	c3                   	ret    
    1406:	8d 76 00             	lea    0x0(%esi),%esi
    1409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001410 <connect_tty>:


int
connect_tty(int tty_fd)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	53                   	push   %ebx
    1414:	83 ec 08             	sub    $0x8,%esp
    1417:	8b 5d 08             	mov    0x8(%ebp),%ebx
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    141a:	6a 10                	push   $0x10
    141c:	6a 02                	push   $0x2
    141e:	53                   	push   %ebx
    141f:	e8 f4 fa ff ff       	call   f18 <ioctl>


int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
    1424:	83 c4 10             	add    $0x10,%esp
    1427:	85 c0                	test   %eax,%eax
    1429:	74 1d                	je     1448 <connect_tty+0x38>
      close(tty_fd);
       return -1;
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
    142b:	83 ec 04             	sub    $0x4,%esp
    142e:	68 00 10 00 00       	push   $0x1000
    1433:	6a 01                	push   $0x1
    1435:	53                   	push   %ebx
    1436:	e8 dd fa ff ff       	call   f18 <ioctl>
     return tty_fd;
    143b:	83 c4 10             	add    $0x10,%esp
    143e:	89 d8                	mov    %ebx,%eax
}
    1440:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1443:	c9                   	leave  
    1444:	c3                   	ret    
    1445:	8d 76 00             	lea    0x0(%esi),%esi

int
connect_tty(int tty_fd)
{
    if(!is_attached_tty(tty_fd)){
      close(tty_fd);
    1448:	83 ec 0c             	sub    $0xc,%esp
    144b:	53                   	push   %ebx
    144c:	e8 1f fa ff ff       	call   e70 <close>
       return -1;
    1451:	83 c4 10             	add    $0x10,%esp
    1454:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1459:	eb e5                	jmp    1440 <connect_tty+0x30>
    145b:	90                   	nop
    145c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001460 <disconnect_tty>:
     return tty_fd;
}

int
disconnect_tty(int tty_fd)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
    1466:	68 00 20 00 00       	push   $0x2000
    146b:	6a 01                	push   $0x1
    146d:	ff 75 08             	pushl  0x8(%ebp)
    1470:	e8 a3 fa ff ff       	call   f18 <ioctl>
}
    1475:	c9                   	leave  
    1476:	c3                   	ret    
