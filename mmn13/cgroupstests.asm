
_cgroupstests:     file format elf32-i386


Disassembly of section .text:

00000000 <empty_string>:
  suppress = _suppress;
}

// Set the given string length to empty.
static void empty_string(char* string, int length)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 0c             	sub    $0xc,%esp
     memset(string, 0, length);
       6:	52                   	push   %edx
       7:	6a 00                	push   $0x0
       9:	50                   	push   %eax
       a:	e8 0e b7 00 00       	call   b71d <memset>
}
       f:	83 c4 10             	add    $0x10,%esp
      12:	c9                   	leave  
      13:	c3                   	ret    

00000014 <print_error>:
#include "user.h"

#define REMOVE_2_ADDITIONAL_CHARS 2

void print_error(const char* name, unsigned long int x, unsigned long int y,
                 const char* file, int line) {
      14:	55                   	push   %ebp
      15:	89 e5                	mov    %esp,%ebp
      17:	57                   	push   %edi
      18:	56                   	push   %esi
      19:	53                   	push   %ebx
      1a:	83 ec 0c             	sub    $0xc,%esp
      1d:	8b 75 08             	mov    0x8(%ebp),%esi
    for (int i = 0; i < strlen(name) + strlen("[RUNNING] ") + REMOVE_2_ADDITIONAL_CHARS; i++)
      20:	bb 00 00 00 00       	mov    $0x0,%ebx
      25:	eb 15                	jmp    3c <print_error+0x28>
        printf(1, "\b");
      27:	83 ec 08             	sub    $0x8,%esp
      2a:	68 3c bf 00 00       	push   $0xbf3c
      2f:	6a 01                	push   $0x1
      31:	e8 31 bb 00 00       	call   bb67 <printf>

#define REMOVE_2_ADDITIONAL_CHARS 2

void print_error(const char* name, unsigned long int x, unsigned long int y,
                 const char* file, int line) {
    for (int i = 0; i < strlen(name) + strlen("[RUNNING] ") + REMOVE_2_ADDITIONAL_CHARS; i++)
      36:	83 c3 01             	add    $0x1,%ebx
      39:	83 c4 10             	add    $0x10,%esp
      3c:	83 ec 0c             	sub    $0xc,%esp
      3f:	56                   	push   %esi
      40:	e8 be b6 00 00       	call   b703 <strlen>
      45:	89 c7                	mov    %eax,%edi
      47:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
      4e:	e8 b0 b6 00 00       	call   b703 <strlen>
      53:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
      57:	83 c4 10             	add    $0x10,%esp
      5a:	39 d8                	cmp    %ebx,%eax
      5c:	77 c9                	ja     27 <print_error+0x13>
        printf(1, "\b");
    printf(1, "[FAILED] %s - expected %d but got %d (%s:%d)\n",
      5e:	83 ec 04             	sub    $0x4,%esp
      61:	ff 75 18             	pushl  0x18(%ebp)
      64:	ff 75 14             	pushl  0x14(%ebp)
      67:	ff 75 10             	pushl  0x10(%ebp)
      6a:	ff 75 0c             	pushl  0xc(%ebp)
      6d:	56                   	push   %esi
      6e:	68 38 ca 00 00       	push   $0xca38
      73:	6a 01                	push   $0x1
      75:	e8 ed ba 00 00       	call   bb67 <printf>
           name, x, y, file, line);
}
      7a:	83 c4 20             	add    $0x20,%esp
      7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      80:	5b                   	pop    %ebx
      81:	5e                   	pop    %esi
      82:	5f                   	pop    %edi
      83:	5d                   	pop    %ebp
      84:	c3                   	ret    

00000085 <get_kernel_total_memory>:

//######################################## Helper functions#######################

//Parse memory.stat info and fetch "kernel" value
int get_kernel_total_memory(char * mem_stat_info)
{
      85:	55                   	push   %ebp
      86:	89 e5                	mov    %esp,%ebp
      88:	83 ec 10             	sub    $0x10,%esp
  char * kernel_value = 0;

  kernel_value = strstr(mem_stat_info, (char *)"kernel - ");
      8b:	68 49 bf 00 00       	push   $0xbf49
      90:	ff 75 08             	pushl  0x8(%ebp)
      93:	e8 7d b8 00 00       	call   b915 <strstr>

  return atoi(kernel_value);
      98:	89 04 24             	mov    %eax,(%esp)
      9b:	e8 54 b7 00 00       	call   b7f4 <atoi>
}
      a0:	c9                   	leave  
      a1:	c3                   	ret    

000000a2 <is_valid_controller_type>:

// Return if controller type is valid.
int is_valid_controller_type(int controller_type) {
      a2:	55                   	push   %ebp
      a3:	89 e5                	mov    %esp,%ebp
  return controller_type >= CPU_CNT &&
      a5:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
      a9:	0f 96 c0             	setbe  %al
      ac:	0f b6 c0             	movzbl %al,%eax
    controller_type <= CPU_CNT + CONTROLLER_COUNT - 1;
}
      af:	5d                   	pop    %ebp
      b0:	c3                   	ret    

000000b1 <get_controller_name>:

// Return controller name.
char* get_controller_name(int controller_type) {
      b1:	55                   	push   %ebp
      b2:	89 e5                	mov    %esp,%ebp
      b4:	53                   	push   %ebx
      b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (!is_valid_controller_type(controller_type)) {
      b8:	53                   	push   %ebx
      b9:	e8 e4 ff ff ff       	call   a2 <is_valid_controller_type>
      be:	83 c4 04             	add    $0x4,%esp
      c1:	85 c0                	test   %eax,%eax
      c3:	74 0b                	je     d0 <get_controller_name+0x1f>
    return 0;
  }

  return controller_names[controller_type];
      c5:	c1 e3 04             	shl    $0x4,%ebx
      c8:	8d 83 00 40 01 00    	lea    0x14000(%ebx),%eax
      ce:	eb 05                	jmp    d5 <get_controller_name+0x24>
}

// Return controller name.
char* get_controller_name(int controller_type) {
  if (!is_valid_controller_type(controller_type)) {
    return 0;
      d0:	b8 00 00 00 00       	mov    $0x0,%eax
  }

  return controller_names[controller_type];
}
      d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      d8:	c9                   	leave  
      d9:	c3                   	ret    

000000da <set_suppress>:

// Turn on debug messeges or turn them off.
void set_suppress(char _suppress) {
      da:	55                   	push   %ebp
      db:	89 e5                	mov    %esp,%ebp
  suppress = _suppress;
      dd:	8b 45 08             	mov    0x8(%ebp),%eax
      e0:	a2 44 42 01 00       	mov    %al,0x14244
}
      e5:	5d                   	pop    %ebp
      e6:	c3                   	ret    

000000e7 <open_file>:
     memset(string, 0, length);
}

// Open given file.
int open_file(const char* file)
{
      e7:	55                   	push   %ebp
      e8:	89 e5                	mov    %esp,%ebp
      ea:	53                   	push   %ebx
      eb:	83 ec 0c             	sub    $0xc,%esp
      ee:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int fd;

  if ((fd = open(file, O_RDWR)) < 1) {
      f1:	6a 02                	push   $0x2
      f3:	53                   	push   %ebx
      f4:	e8 bd b8 00 00       	call   b9b6 <open>
      f9:	83 c4 10             	add    $0x10,%esp
      fc:	85 c0                	test   %eax,%eax
      fe:	7f 28                	jg     128 <open_file+0x41>
    if (suppress == 0)
     100:	80 3d 44 42 01 00 00 	cmpb   $0x0,0x14244
     107:	75 1a                	jne    123 <open_file+0x3c>
      printf(1, "\nFailed to open file: %s\n", file);
     109:	83 ec 04             	sub    $0x4,%esp
     10c:	53                   	push   %ebx
     10d:	68 53 bf 00 00       	push   $0xbf53
     112:	6a 01                	push   $0x1
     114:	e8 4e ba 00 00       	call   bb67 <printf>
     119:	83 c4 10             	add    $0x10,%esp
    return 0;
     11c:	b8 00 00 00 00       	mov    $0x0,%eax
     121:	eb 05                	jmp    128 <open_file+0x41>
     123:	b8 00 00 00 00       	mov    $0x0,%eax
  }

  return fd;
}
     128:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     12b:	c9                   	leave  
     12c:	c3                   	ret    

0000012d <close_file>:

// Close given file.
int close_file(int fd)
{
     12d:	55                   	push   %ebp
     12e:	89 e5                	mov    %esp,%ebp
     130:	83 ec 14             	sub    $0x14,%esp
  if (close(fd) != 0) {
     133:	ff 75 08             	pushl  0x8(%ebp)
     136:	e8 63 b8 00 00       	call   b99e <close>
     13b:	83 c4 10             	add    $0x10,%esp
     13e:	85 c0                	test   %eax,%eax
     140:	74 22                	je     164 <close_file+0x37>
    if (suppress == 0)
     142:	80 3d 44 42 01 00 00 	cmpb   $0x0,0x14244
     149:	75 20                	jne    16b <close_file+0x3e>
      printf(1, "\nFailed to close file\n");
     14b:	83 ec 08             	sub    $0x8,%esp
     14e:	68 6d bf 00 00       	push   $0xbf6d
     153:	6a 01                	push   $0x1
     155:	e8 0d ba 00 00       	call   bb67 <printf>
     15a:	83 c4 10             	add    $0x10,%esp
    return 0;
     15d:	b8 00 00 00 00       	mov    $0x0,%eax
     162:	eb 0c                	jmp    170 <close_file+0x43>
  }

  return 1;
     164:	b8 01 00 00 00       	mov    $0x1,%eax
     169:	eb 05                	jmp    170 <close_file+0x43>
int close_file(int fd)
{
  if (close(fd) != 0) {
    if (suppress == 0)
      printf(1, "\nFailed to close file\n");
    return 0;
     16b:	b8 00 00 00 00       	mov    $0x0,%eax
  }

  return 1;
}
     170:	c9                   	leave  
     171:	c3                   	ret    

00000172 <open_close_file>:

// Open and close given file.
int open_close_file(const char* file) {
     172:	55                   	push   %ebp
     173:	89 e5                	mov    %esp,%ebp
     175:	83 ec 14             	sub    $0x14,%esp
  int fd = open_file(file);
     178:	ff 75 08             	pushl  0x8(%ebp)
     17b:	e8 67 ff ff ff       	call   e7 <open_file>
  if (!fd) {
     180:	83 c4 10             	add    $0x10,%esp
     183:	85 c0                	test   %eax,%eax
     185:	74 0e                	je     195 <open_close_file+0x23>
    return 0;
  }
  return close_file(fd);
     187:	83 ec 0c             	sub    $0xc,%esp
     18a:	50                   	push   %eax
     18b:	e8 9d ff ff ff       	call   12d <close_file>
     190:	83 c4 10             	add    $0x10,%esp
     193:	eb 05                	jmp    19a <open_close_file+0x28>

// Open and close given file.
int open_close_file(const char* file) {
  int fd = open_file(file);
  if (!fd) {
    return 0;
     195:	b8 00 00 00 00       	mov    $0x0,%eax
  }
  return close_file(fd);
}
     19a:	c9                   	leave  
     19b:	c3                   	ret    

0000019c <read_file>:

// Read from a given file. if fails, return 0. Upon success returns the contents of the file.
// If print is set to 1, also prints the returned string.
char* read_file(const char* file, int print)
{
     19c:	55                   	push   %ebp
     19d:	89 e5                	mov    %esp,%ebp
     19f:	56                   	push   %esi
     1a0:	53                   	push   %ebx
     1a1:	8b 75 08             	mov    0x8(%ebp),%esi
  static char buf[256];
  empty_string(buf, 256);
     1a4:	ba 00 01 00 00       	mov    $0x100,%edx
     1a9:	b8 60 42 01 00       	mov    $0x14260,%eax
     1ae:	e8 4d fe ff ff       	call   0 <empty_string>

  int fd = open_file(file);
     1b3:	83 ec 0c             	sub    $0xc,%esp
     1b6:	56                   	push   %esi
     1b7:	e8 2b ff ff ff       	call   e7 <open_file>
  if (!fd) {
     1bc:	83 c4 10             	add    $0x10,%esp
     1bf:	85 c0                	test   %eax,%eax
     1c1:	74 78                	je     23b <read_file+0x9f>
     1c3:	89 c3                	mov    %eax,%ebx
    return 0;
  }
  if (read(fd, buf, 256) < 0) {
     1c5:	83 ec 04             	sub    $0x4,%esp
     1c8:	68 00 01 00 00       	push   $0x100
     1cd:	68 60 42 01 00       	push   $0x14260
     1d2:	50                   	push   %eax
     1d3:	e8 b6 b7 00 00       	call   b98e <read>
     1d8:	83 c4 10             	add    $0x10,%esp
     1db:	85 c0                	test   %eax,%eax
     1dd:	79 2f                	jns    20e <read_file+0x72>
    if (suppress == 0)
     1df:	80 3d 44 42 01 00 00 	cmpb   $0x0,0x14244
     1e6:	75 13                	jne    1fb <read_file+0x5f>
      printf(1, "\nFailed to read file: %s\n", file);
     1e8:	83 ec 04             	sub    $0x4,%esp
     1eb:	56                   	push   %esi
     1ec:	68 84 bf 00 00       	push   $0xbf84
     1f1:	6a 01                	push   $0x1
     1f3:	e8 6f b9 00 00       	call   bb67 <printf>
     1f8:	83 c4 10             	add    $0x10,%esp
    close_file(fd);
     1fb:	83 ec 0c             	sub    $0xc,%esp
     1fe:	53                   	push   %ebx
     1ff:	e8 29 ff ff ff       	call   12d <close_file>
    return 0;
     204:	83 c4 10             	add    $0x10,%esp
     207:	b8 00 00 00 00       	mov    $0x0,%eax
     20c:	eb 39                	jmp    247 <read_file+0xab>
  }

  if (print) {
     20e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     212:	74 15                	je     229 <read_file+0x8d>
    printf(1, "Contents of %s: \n%s\n", file, buf);
     214:	68 60 42 01 00       	push   $0x14260
     219:	56                   	push   %esi
     21a:	68 9e bf 00 00       	push   $0xbf9e
     21f:	6a 01                	push   $0x1
     221:	e8 41 b9 00 00       	call   bb67 <printf>
     226:	83 c4 10             	add    $0x10,%esp
  }

  if (!close_file(fd)) {
     229:	83 ec 0c             	sub    $0xc,%esp
     22c:	53                   	push   %ebx
     22d:	e8 fb fe ff ff       	call   12d <close_file>
     232:	83 c4 10             	add    $0x10,%esp
     235:	85 c0                	test   %eax,%eax
     237:	75 09                	jne    242 <read_file+0xa6>
     239:	eb 0c                	jmp    247 <read_file+0xab>
  static char buf[256];
  empty_string(buf, 256);

  int fd = open_file(file);
  if (!fd) {
    return 0;
     23b:	b8 00 00 00 00       	mov    $0x0,%eax
     240:	eb 05                	jmp    247 <read_file+0xab>

  if (!close_file(fd)) {
    return 0;
  }

  return buf;
     242:	b8 60 42 01 00       	mov    $0x14260,%eax
}
     247:	8d 65 f8             	lea    -0x8(%ebp),%esp
     24a:	5b                   	pop    %ebx
     24b:	5e                   	pop    %esi
     24c:	5d                   	pop    %ebp
     24d:	c3                   	ret    

0000024e <write_file>:

// Write into a file. If succesful returns 1, otherwise 0.
int write_file(const char* file, char* text) {
     24e:	55                   	push   %ebp
     24f:	89 e5                	mov    %esp,%ebp
     251:	57                   	push   %edi
     252:	56                   	push   %esi
     253:	53                   	push   %ebx
     254:	81 ec 18 01 00 00    	sub    $0x118,%esp
     25a:	8b 75 08             	mov    0x8(%ebp),%esi
  char buf[256];
  int fd = open_file(file);
     25d:	56                   	push   %esi
     25e:	e8 84 fe ff ff       	call   e7 <open_file>

  if(!fd)
     263:	83 c4 10             	add    $0x10,%esp
     266:	85 c0                	test   %eax,%eax
     268:	74 73                	je     2dd <write_file+0x8f>
     26a:	89 c3                	mov    %eax,%ebx
    return 0;
  empty_string(buf, 256);
     26c:	8d bd e8 fe ff ff    	lea    -0x118(%ebp),%edi
     272:	ba 00 01 00 00       	mov    $0x100,%edx
     277:	89 f8                	mov    %edi,%eax
     279:	e8 82 fd ff ff       	call   0 <empty_string>
  strcpy(buf, text);
     27e:	83 ec 08             	sub    $0x8,%esp
     281:	ff 75 0c             	pushl  0xc(%ebp)
     284:	57                   	push   %edi
     285:	e8 05 b4 00 00       	call   b68f <strcpy>
  if (write(fd, buf, sizeof(buf)) < 0) {
     28a:	83 c4 0c             	add    $0xc,%esp
     28d:	68 00 01 00 00       	push   $0x100
     292:	57                   	push   %edi
     293:	53                   	push   %ebx
     294:	e8 fd b6 00 00       	call   b996 <write>
     299:	83 c4 10             	add    $0x10,%esp
     29c:	85 c0                	test   %eax,%eax
     29e:	79 2f                	jns    2cf <write_file+0x81>
    if (suppress == 0)
     2a0:	80 3d 44 42 01 00 00 	cmpb   $0x0,0x14244
     2a7:	75 13                	jne    2bc <write_file+0x6e>
      printf(1, "\nFailed to write into file %s\n", file);
     2a9:	83 ec 04             	sub    $0x4,%esp
     2ac:	56                   	push   %esi
     2ad:	68 68 ca 00 00       	push   $0xca68
     2b2:	6a 01                	push   $0x1
     2b4:	e8 ae b8 00 00       	call   bb67 <printf>
     2b9:	83 c4 10             	add    $0x10,%esp
    close_file(fd);
     2bc:	83 ec 0c             	sub    $0xc,%esp
     2bf:	53                   	push   %ebx
     2c0:	e8 68 fe ff ff       	call   12d <close_file>
    return 0;
     2c5:	83 c4 10             	add    $0x10,%esp
     2c8:	b8 00 00 00 00       	mov    $0x0,%eax
     2cd:	eb 13                	jmp    2e2 <write_file+0x94>
  }

  return close_file(fd);
     2cf:	83 ec 0c             	sub    $0xc,%esp
     2d2:	53                   	push   %ebx
     2d3:	e8 55 fe ff ff       	call   12d <close_file>
     2d8:	83 c4 10             	add    $0x10,%esp
     2db:	eb 05                	jmp    2e2 <write_file+0x94>
int write_file(const char* file, char* text) {
  char buf[256];
  int fd = open_file(file);

  if(!fd)
    return 0;
     2dd:	b8 00 00 00 00       	mov    $0x0,%eax
    close_file(fd);
    return 0;
  }

  return close_file(fd);
}
     2e2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2e5:	5b                   	pop    %ebx
     2e6:	5e                   	pop    %esi
     2e7:	5f                   	pop    %edi
     2e8:	5d                   	pop    %ebp
     2e9:	c3                   	ret    

000002ea <write_new_file>:

int write_new_file(const char* file, char* text) {
     2ea:	55                   	push   %ebp
     2eb:	89 e5                	mov    %esp,%ebp
     2ed:	56                   	push   %esi
     2ee:	53                   	push   %ebx
     2ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
   int fd;
   if ((fd = open(file, O_CREATE | O_RDWR)) < 1) {
     2f2:	83 ec 08             	sub    $0x8,%esp
     2f5:	68 02 02 00 00       	push   $0x202
     2fa:	53                   	push   %ebx
     2fb:	e8 b6 b6 00 00       	call   b9b6 <open>
     300:	83 c4 10             	add    $0x10,%esp
     303:	85 c0                	test   %eax,%eax
     305:	7f 22                	jg     329 <write_new_file+0x3f>
     if (suppress == 0)
     307:	80 3d 44 42 01 00 00 	cmpb   $0x0,0x14244
     30e:	75 3e                	jne    34e <write_new_file+0x64>
        printf(1, "\nFailed to open a new file \n");
     310:	83 ec 08             	sub    $0x8,%esp
     313:	68 b3 bf 00 00       	push   $0xbfb3
     318:	6a 01                	push   $0x1
     31a:	e8 48 b8 00 00       	call   bb67 <printf>
     31f:	83 c4 10             	add    $0x10,%esp
     return 0;
     322:	bb 00 00 00 00       	mov    $0x0,%ebx
     327:	eb 2e                	jmp    357 <write_new_file+0x6d>
     329:	89 c6                	mov    %eax,%esi
   }

   if (!write_file(file, text)) {
     32b:	83 ec 08             	sub    $0x8,%esp
     32e:	ff 75 0c             	pushl  0xc(%ebp)
     331:	53                   	push   %ebx
     332:	e8 17 ff ff ff       	call   24e <write_file>
     337:	89 c3                	mov    %eax,%ebx
     339:	83 c4 10             	add    $0x10,%esp
     33c:	85 c0                	test   %eax,%eax
     33e:	75 15                	jne    355 <write_new_file+0x6b>
     close_file(fd);
     340:	83 ec 0c             	sub    $0xc,%esp
     343:	56                   	push   %esi
     344:	e8 e4 fd ff ff       	call   12d <close_file>
     return 0;
     349:	83 c4 10             	add    $0x10,%esp
     34c:	eb 09                	jmp    357 <write_new_file+0x6d>
int write_new_file(const char* file, char* text) {
   int fd;
   if ((fd = open(file, O_CREATE | O_RDWR)) < 1) {
     if (suppress == 0)
        printf(1, "\nFailed to open a new file \n");
     return 0;
     34e:	bb 00 00 00 00       	mov    $0x0,%ebx
     353:	eb 02                	jmp    357 <write_new_file+0x6d>
   if (!write_file(file, text)) {
     close_file(fd);
     return 0;
   }

  return fd;
     355:	89 f3                	mov    %esi,%ebx
}
     357:	89 d8                	mov    %ebx,%eax
     359:	8d 65 f8             	lea    -0x8(%ebp),%esp
     35c:	5b                   	pop    %ebx
     35d:	5e                   	pop    %esi
     35e:	5d                   	pop    %ebp
     35f:	c3                   	ret    

00000360 <enable_controller>:

// Test enabling controller according to given type.
int enable_controller(int type) {
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 14             	sub    $0x14,%esp
     367:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[5] = { '+', 0 };
     36a:	c7 45 f3 00 00 00 00 	movl   $0x0,-0xd(%ebp)
     371:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
     375:	c6 45 f3 2b          	movb   $0x2b,-0xd(%ebp)
  if (!is_valid_controller_type(type)) {
     379:	53                   	push   %ebx
     37a:	e8 23 fd ff ff       	call   a2 <is_valid_controller_type>
     37f:	83 c4 04             	add    $0x4,%esp
     382:	85 c0                	test   %eax,%eax
     384:	74 2a                	je     3b0 <enable_controller+0x50>
    return 0;
  }

  strcpy(buf + 1, controller_names[type]);
     386:	c1 e3 04             	shl    $0x4,%ebx
     389:	81 c3 00 40 01 00    	add    $0x14000,%ebx
     38f:	83 ec 08             	sub    $0x8,%esp
     392:	53                   	push   %ebx
     393:	8d 5d f3             	lea    -0xd(%ebp),%ebx
     396:	8d 45 f4             	lea    -0xc(%ebp),%eax
     399:	50                   	push   %eax
     39a:	e8 f0 b2 00 00       	call   b68f <strcpy>

  return write_file(TEST_1_CGROUP_SUBTREE_CONTROL, buf);
     39f:	83 c4 08             	add    $0x8,%esp
     3a2:	53                   	push   %ebx
     3a3:	68 88 ca 00 00       	push   $0xca88
     3a8:	e8 a1 fe ff ff       	call   24e <write_file>
     3ad:	83 c4 10             	add    $0x10,%esp
}
     3b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b3:	c9                   	leave  
     3b4:	c3                   	ret    

000003b5 <disable_controller>:

// Test disabling controller according to given type.
int disable_controller(int type) {
     3b5:	55                   	push   %ebp
     3b6:	89 e5                	mov    %esp,%ebp
     3b8:	53                   	push   %ebx
     3b9:	83 ec 14             	sub    $0x14,%esp
     3bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[5] = { '-', 0 };
     3bf:	c7 45 f3 00 00 00 00 	movl   $0x0,-0xd(%ebp)
     3c6:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
     3ca:	c6 45 f3 2d          	movb   $0x2d,-0xd(%ebp)
  if (!is_valid_controller_type(type)) {
     3ce:	53                   	push   %ebx
     3cf:	e8 ce fc ff ff       	call   a2 <is_valid_controller_type>
     3d4:	83 c4 04             	add    $0x4,%esp
     3d7:	85 c0                	test   %eax,%eax
     3d9:	74 2a                	je     405 <disable_controller+0x50>
    return 0;
  }

  strcpy(buf + 1, controller_names[type]);
     3db:	c1 e3 04             	shl    $0x4,%ebx
     3de:	81 c3 00 40 01 00    	add    $0x14000,%ebx
     3e4:	83 ec 08             	sub    $0x8,%esp
     3e7:	53                   	push   %ebx
     3e8:	8d 5d f3             	lea    -0xd(%ebp),%ebx
     3eb:	8d 45 f4             	lea    -0xc(%ebp),%eax
     3ee:	50                   	push   %eax
     3ef:	e8 9b b2 00 00       	call   b68f <strcpy>

  return write_file(TEST_1_CGROUP_SUBTREE_CONTROL, buf);
     3f4:	83 c4 08             	add    $0x8,%esp
     3f7:	53                   	push   %ebx
     3f8:	68 88 ca 00 00       	push   $0xca88
     3fd:	e8 4c fe ff ff       	call   24e <write_file>
     402:	83 c4 10             	add    $0x10,%esp
}
     405:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     408:	c9                   	leave  
     409:	c3                   	ret    

0000040a <verify_controller_enabled>:

// Test verrifying a controller is active according to given type.
int verify_controller_enabled(int type) {
     40a:	55                   	push   %ebp
     40b:	89 e5                	mov    %esp,%ebp
     40d:	53                   	push   %ebx
     40e:	83 ec 14             	sub    $0x14,%esp
     411:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[4] = { 0 };
     414:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if (!is_valid_controller_type(type)) {
     41b:	53                   	push   %ebx
     41c:	e8 81 fc ff ff       	call   a2 <is_valid_controller_type>
     421:	83 c4 04             	add    $0x4,%esp
     424:	85 c0                	test   %eax,%eax
     426:	74 6d                	je     495 <verify_controller_enabled+0x8b>
    return 0;
  }

  strcpy(buf, controller_names[type]);
     428:	c1 e3 04             	shl    $0x4,%ebx
     42b:	81 c3 00 40 01 00    	add    $0x14000,%ebx
     431:	83 ec 08             	sub    $0x8,%esp
     434:	53                   	push   %ebx
     435:	8d 45 f4             	lea    -0xc(%ebp),%eax
     438:	50                   	push   %eax
     439:	e8 51 b2 00 00       	call   b68f <strcpy>

  char* contents = read_file(TEST_1_CGROUP_SUBTREE_CONTROL, 0);
     43e:	83 c4 08             	add    $0x8,%esp
     441:	6a 00                	push   $0x0
     443:	68 88 ca 00 00       	push   $0xca88
     448:	e8 4f fd ff ff       	call   19c <read_file>

  int i;
  for (i = 0; contents[i] != 0 && i < sizeof(contents) - 2; i++) {
     44d:	83 c4 10             	add    $0x10,%esp
     450:	ba 00 00 00 00       	mov    $0x0,%edx
     455:	eb 1c                	jmp    473 <verify_controller_enabled+0x69>
    if (contents[i] == buf[0] && contents[i + 1] == buf[1] && contents[i + 2] == buf[2]) {
     457:	3a 4d f4             	cmp    -0xc(%ebp),%cl
     45a:	75 14                	jne    470 <verify_controller_enabled+0x66>
     45c:	0f b6 4d f5          	movzbl -0xb(%ebp),%ecx
     460:	38 4c 18 01          	cmp    %cl,0x1(%eax,%ebx,1)
     464:	75 0a                	jne    470 <verify_controller_enabled+0x66>
     466:	0f b6 4d f6          	movzbl -0xa(%ebp),%ecx
     46a:	38 4c 18 02          	cmp    %cl,0x2(%eax,%ebx,1)
     46e:	74 19                	je     489 <verify_controller_enabled+0x7f>
  strcpy(buf, controller_names[type]);

  char* contents = read_file(TEST_1_CGROUP_SUBTREE_CONTROL, 0);

  int i;
  for (i = 0; contents[i] != 0 && i < sizeof(contents) - 2; i++) {
     470:	83 c2 01             	add    $0x1,%edx
     473:	89 d3                	mov    %edx,%ebx
     475:	0f b6 0c 10          	movzbl (%eax,%edx,1),%ecx
     479:	84 c9                	test   %cl,%cl
     47b:	74 13                	je     490 <verify_controller_enabled+0x86>
     47d:	83 fa 01             	cmp    $0x1,%edx
     480:	76 d5                	jbe    457 <verify_controller_enabled+0x4d>
    if (contents[i] == buf[0] && contents[i + 1] == buf[1] && contents[i + 2] == buf[2]) {
      return 1;
    }
  }

  return 0;
     482:	b8 00 00 00 00       	mov    $0x0,%eax
     487:	eb 0c                	jmp    495 <verify_controller_enabled+0x8b>
  char* contents = read_file(TEST_1_CGROUP_SUBTREE_CONTROL, 0);

  int i;
  for (i = 0; contents[i] != 0 && i < sizeof(contents) - 2; i++) {
    if (contents[i] == buf[0] && contents[i + 1] == buf[1] && contents[i + 2] == buf[2]) {
      return 1;
     489:	b8 01 00 00 00       	mov    $0x1,%eax
     48e:	eb 05                	jmp    495 <verify_controller_enabled+0x8b>
    }
  }

  return 0;
     490:	b8 00 00 00 00       	mov    $0x0,%eax
}
     495:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     498:	c9                   	leave  
     499:	c3                   	ret    

0000049a <verify_controller_disabled>:

// Test verifying a controller is disabled according to given type.
int verify_controller_disabled(int type) {
     49a:	55                   	push   %ebp
     49b:	89 e5                	mov    %esp,%ebp
     49d:	56                   	push   %esi
     49e:	53                   	push   %ebx
     49f:	83 ec 10             	sub    $0x10,%esp
     4a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[4] = { 0 };
     4a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if (!is_valid_controller_type(type)) {
     4ac:	53                   	push   %ebx
     4ad:	e8 f0 fb ff ff       	call   a2 <is_valid_controller_type>
     4b2:	83 c4 04             	add    $0x4,%esp
     4b5:	85 c0                	test   %eax,%eax
     4b7:	74 77                	je     530 <verify_controller_disabled+0x96>
    return 0;
  }

  strcpy(buf, controller_names[type]);
     4b9:	c1 e3 04             	shl    $0x4,%ebx
     4bc:	81 c3 00 40 01 00    	add    $0x14000,%ebx
     4c2:	83 ec 08             	sub    $0x8,%esp
     4c5:	53                   	push   %ebx
     4c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
     4c9:	50                   	push   %eax
     4ca:	e8 c0 b1 00 00       	call   b68f <strcpy>

  char* contents = read_file(TEST_1_CGROUP_SUBTREE_CONTROL, 0);
     4cf:	83 c4 08             	add    $0x8,%esp
     4d2:	6a 00                	push   $0x0
     4d4:	68 88 ca 00 00       	push   $0xca88
     4d9:	e8 be fc ff ff       	call   19c <read_file>
  int i;

  for (i = 0; contents[i + 2] != 0; i++) {
     4de:	83 c4 10             	add    $0x10,%esp
     4e1:	ba 00 00 00 00       	mov    $0x0,%edx
     4e6:	eb 38                	jmp    520 <verify_controller_disabled+0x86>
    if (contents[i] == buf[0] && contents[i + 1] == buf[1] && contents[i + 2] == buf[2]) {
     4e8:	0f b6 5d f4          	movzbl -0xc(%ebp),%ebx
     4ec:	38 1c 10             	cmp    %bl,(%eax,%edx,1)
     4ef:	75 2c                	jne    51d <verify_controller_disabled+0x83>
     4f1:	0f b6 5d f5          	movzbl -0xb(%ebp),%ebx
     4f5:	38 5c 30 01          	cmp    %bl,0x1(%eax,%esi,1)
     4f9:	75 22                	jne    51d <verify_controller_disabled+0x83>
     4fb:	3a 4d f6             	cmp    -0xa(%ebp),%cl
     4fe:	75 1d                	jne    51d <verify_controller_disabled+0x83>
      printf(1, "\nController %s is still enabled\n", buf);
     500:	83 ec 04             	sub    $0x4,%esp
     503:	8d 45 f4             	lea    -0xc(%ebp),%eax
     506:	50                   	push   %eax
     507:	68 b0 ca 00 00       	push   $0xcab0
     50c:	6a 01                	push   $0x1
     50e:	e8 54 b6 00 00       	call   bb67 <printf>
      return 0;
     513:	83 c4 10             	add    $0x10,%esp
     516:	b8 00 00 00 00       	mov    $0x0,%eax
     51b:	eb 13                	jmp    530 <verify_controller_disabled+0x96>
  strcpy(buf, controller_names[type]);

  char* contents = read_file(TEST_1_CGROUP_SUBTREE_CONTROL, 0);
  int i;

  for (i = 0; contents[i + 2] != 0; i++) {
     51d:	83 c2 01             	add    $0x1,%edx
     520:	89 d6                	mov    %edx,%esi
     522:	0f b6 4c 10 02       	movzbl 0x2(%eax,%edx,1),%ecx
     527:	84 c9                	test   %cl,%cl
     529:	75 bd                	jne    4e8 <verify_controller_disabled+0x4e>
      printf(1, "\nController %s is still enabled\n", buf);
      return 0;
    }
  }

  return 1;
     52b:	b8 01 00 00 00       	mov    $0x1,%eax
}
     530:	8d 65 f8             	lea    -0x8(%ebp),%esp
     533:	5b                   	pop    %ebx
     534:	5e                   	pop    %esi
     535:	5d                   	pop    %ebp
     536:	c3                   	ret    

00000537 <move_proc>:

// Test moving a process to given cgroup.
int move_proc(const char* file, int pid) {
     537:	55                   	push   %ebp
     538:	89 e5                	mov    %esp,%ebp
     53a:	53                   	push   %ebx
     53b:	83 ec 14             	sub    $0x14,%esp
  char pid_buf[3];
  empty_string(pid_buf, 3);
     53e:	8d 5d f5             	lea    -0xb(%ebp),%ebx
     541:	ba 03 00 00 00       	mov    $0x3,%edx
     546:	89 d8                	mov    %ebx,%eax
     548:	e8 b3 fa ff ff       	call   0 <empty_string>
  itoa(pid_buf, pid);
     54d:	83 ec 08             	sub    $0x8,%esp
     550:	ff 75 0c             	pushl  0xc(%ebp)
     553:	53                   	push   %ebx
     554:	e8 f1 b2 00 00       	call   b84a <itoa>
  return write_file(file, pid_buf);
     559:	83 c4 08             	add    $0x8,%esp
     55c:	53                   	push   %ebx
     55d:	ff 75 08             	pushl  0x8(%ebp)
     560:	e8 e9 fc ff ff       	call   24e <write_file>
}
     565:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     568:	c9                   	leave  
     569:	c3                   	ret    

0000056a <is_pid_in_group>:

// Test a given pid in string format belongs to a given cgroup.
int is_pid_in_group(const char* file, int pid) {
     56a:	55                   	push   %ebp
     56b:	89 e5                	mov    %esp,%ebp
     56d:	57                   	push   %edi
     56e:	56                   	push   %esi
     56f:	53                   	push   %ebx
     570:	83 ec 24             	sub    $0x24,%esp
     573:	8b 75 08             	mov    0x8(%ebp),%esi
  char* contents = read_file(file, 0);
     576:	6a 00                	push   $0x0
     578:	56                   	push   %esi
     579:	e8 1e fc ff ff       	call   19c <read_file>
     57e:	89 c3                	mov    %eax,%ebx
  char pid_buf[3];

  empty_string(pid_buf, 3);
     580:	8d 7d e5             	lea    -0x1b(%ebp),%edi
     583:	ba 03 00 00 00       	mov    $0x3,%edx
     588:	89 f8                	mov    %edi,%eax
     58a:	e8 71 fa ff ff       	call   0 <empty_string>
  itoa(pid_buf, pid);
     58f:	83 c4 08             	add    $0x8,%esp
     592:	ff 75 0c             	pushl  0xc(%ebp)
     595:	57                   	push   %edi
     596:	e8 af b2 00 00       	call   b84a <itoa>

  if (pid_buf[1] == 0)
     59b:	83 c4 10             	add    $0x10,%esp
     59e:	80 7d e6 00          	cmpb   $0x0,-0x1a(%ebp)
     5a2:	75 04                	jne    5a8 <is_pid_in_group+0x3e>
    pid_buf[1] = '\n';
     5a4:	c6 45 e6 0a          	movb   $0xa,-0x1a(%ebp)

  int i;
  for (i = 0; contents[i + 1] != 0; i++) {
     5a8:	b8 00 00 00 00       	mov    $0x0,%eax
     5ad:	eb 11                	jmp    5c0 <is_pid_in_group+0x56>
    if (pid_buf[0] == contents[i] && pid_buf[1] == contents[i + 1]) {
     5af:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
     5b3:	38 4d e5             	cmp    %cl,-0x1b(%ebp)
     5b6:	75 05                	jne    5bd <is_pid_in_group+0x53>
     5b8:	3a 55 e6             	cmp    -0x1a(%ebp),%dl
     5bb:	74 39                	je     5f6 <is_pid_in_group+0x8c>

  if (pid_buf[1] == 0)
    pid_buf[1] = '\n';

  int i;
  for (i = 0; contents[i + 1] != 0; i++) {
     5bd:	83 c0 01             	add    $0x1,%eax
     5c0:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
     5c5:	84 d2                	test   %dl,%dl
     5c7:	75 e6                	jne    5af <is_pid_in_group+0x45>
    if (pid_buf[0] == contents[i] && pid_buf[1] == contents[i + 1]) {
      return 1;
    }
  }

  if (suppress == 0) {
     5c9:	80 3d 44 42 01 00 00 	cmpb   $0x0,0x14244
     5d0:	75 2b                	jne    5fd <is_pid_in_group+0x93>
    printf(1, "Failed to find pid %d in group %s\n", atoi(pid_buf), file);
     5d2:	83 ec 0c             	sub    $0xc,%esp
     5d5:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     5d8:	50                   	push   %eax
     5d9:	e8 16 b2 00 00       	call   b7f4 <atoi>
     5de:	56                   	push   %esi
     5df:	50                   	push   %eax
     5e0:	68 d4 ca 00 00       	push   $0xcad4
     5e5:	6a 01                	push   $0x1
     5e7:	e8 7b b5 00 00       	call   bb67 <printf>
     5ec:	83 c4 20             	add    $0x20,%esp
  }

  return 0;
     5ef:	b8 00 00 00 00       	mov    $0x0,%eax
     5f4:	eb 0c                	jmp    602 <is_pid_in_group+0x98>
    pid_buf[1] = '\n';

  int i;
  for (i = 0; contents[i + 1] != 0; i++) {
    if (pid_buf[0] == contents[i] && pid_buf[1] == contents[i + 1]) {
      return 1;
     5f6:	b8 01 00 00 00       	mov    $0x1,%eax
     5fb:	eb 05                	jmp    602 <is_pid_in_group+0x98>

  if (suppress == 0) {
    printf(1, "Failed to find pid %d in group %s\n", atoi(pid_buf), file);
  }

  return 0;
     5fd:	b8 00 00 00 00       	mov    $0x0,%eax
}
     602:	8d 65 f4             	lea    -0xc(%ebp),%esp
     605:	5b                   	pop    %ebx
     606:	5e                   	pop    %esi
     607:	5f                   	pop    %edi
     608:	5d                   	pop    %ebp
     609:	c3                   	ret    

0000060a <temp_write>:

// Write an integer into a temporary file. Notice only one such file currently supported.
int temp_write(int num) {
     60a:	55                   	push   %ebp
     60b:	89 e5                	mov    %esp,%ebp
     60d:	56                   	push   %esi
     60e:	53                   	push   %ebx
     60f:	81 ec 08 01 00 00    	sub    $0x108,%esp
  int fd;
  if ((fd = open(TEMP_FILE, O_CREATE | O_RDWR)) < 1) {
     615:	68 02 02 00 00       	push   $0x202
     61a:	68 d0 bf 00 00       	push   $0xbfd0
     61f:	e8 92 b3 00 00       	call   b9b6 <open>
     624:	83 c4 10             	add    $0x10,%esp
     627:	85 c0                	test   %eax,%eax
     629:	7f 22                	jg     64d <temp_write+0x43>
    if (suppress == 0)
     62b:	80 3d 44 42 01 00 00 	cmpb   $0x0,0x14244
     632:	75 62                	jne    696 <temp_write+0x8c>
      printf(1, "\nFailed to open a temporary file\n");
     634:	83 ec 08             	sub    $0x8,%esp
     637:	68 f8 ca 00 00       	push   $0xcaf8
     63c:	6a 01                	push   $0x1
     63e:	e8 24 b5 00 00       	call   bb67 <printf>
     643:	83 c4 10             	add    $0x10,%esp
    return 0;
     646:	bb 00 00 00 00       	mov    $0x0,%ebx
     64b:	eb 4e                	jmp    69b <temp_write+0x91>
     64d:	89 c6                	mov    %eax,%esi
  }

  char buf[256];
  itoa(buf, num);
     64f:	83 ec 08             	sub    $0x8,%esp
     652:	ff 75 08             	pushl  0x8(%ebp)
     655:	8d 9d f8 fe ff ff    	lea    -0x108(%ebp),%ebx
     65b:	53                   	push   %ebx
     65c:	e8 e9 b1 00 00       	call   b84a <itoa>

  if (!write_file(TEMP_FILE, buf)) {
     661:	83 c4 08             	add    $0x8,%esp
     664:	53                   	push   %ebx
     665:	68 d0 bf 00 00       	push   $0xbfd0
     66a:	e8 df fb ff ff       	call   24e <write_file>
     66f:	89 c3                	mov    %eax,%ebx
     671:	83 c4 10             	add    $0x10,%esp
     674:	85 c0                	test   %eax,%eax
     676:	75 0e                	jne    686 <temp_write+0x7c>
    close_file(fd);
     678:	83 ec 0c             	sub    $0xc,%esp
     67b:	56                   	push   %esi
     67c:	e8 ac fa ff ff       	call   12d <close_file>
    return 0;
     681:	83 c4 10             	add    $0x10,%esp
     684:	eb 15                	jmp    69b <temp_write+0x91>
  }

  return close_file(fd);
     686:	83 ec 0c             	sub    $0xc,%esp
     689:	56                   	push   %esi
     68a:	e8 9e fa ff ff       	call   12d <close_file>
     68f:	89 c3                	mov    %eax,%ebx
     691:	83 c4 10             	add    $0x10,%esp
     694:	eb 05                	jmp    69b <temp_write+0x91>
int temp_write(int num) {
  int fd;
  if ((fd = open(TEMP_FILE, O_CREATE | O_RDWR)) < 1) {
    if (suppress == 0)
      printf(1, "\nFailed to open a temporary file\n");
    return 0;
     696:	bb 00 00 00 00       	mov    $0x0,%ebx
    close_file(fd);
    return 0;
  }

  return close_file(fd);
}
     69b:	89 d8                	mov    %ebx,%eax
     69d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     6a0:	5b                   	pop    %ebx
     6a1:	5e                   	pop    %esi
     6a2:	5d                   	pop    %ebp
     6a3:	c3                   	ret    

000006a4 <temp_read>:

// Read an integer from the temporary file.
int temp_read(int print) {
     6a4:	55                   	push   %ebp
     6a5:	89 e5                	mov    %esp,%ebp
     6a7:	83 ec 10             	sub    $0x10,%esp
  return atoi(read_file(TEMP_FILE, print));
     6aa:	ff 75 08             	pushl  0x8(%ebp)
     6ad:	68 d0 bf 00 00       	push   $0xbfd0
     6b2:	e8 e5 fa ff ff       	call   19c <read_file>
     6b7:	89 04 24             	mov    %eax,(%esp)
     6ba:	e8 35 b1 00 00       	call   b7f4 <atoi>
}
     6bf:	c9                   	leave  
     6c0:	c3                   	ret    

000006c1 <temp_delete>:

// Delete the temporary file.
int temp_delete() {
     6c1:	55                   	push   %ebp
     6c2:	89 e5                	mov    %esp,%ebp
     6c4:	83 ec 14             	sub    $0x14,%esp
  if (unlink(TEMP_FILE)) {
     6c7:	68 d0 bf 00 00       	push   $0xbfd0
     6cc:	e8 f5 b2 00 00       	call   b9c6 <unlink>
     6d1:	83 c4 10             	add    $0x10,%esp
     6d4:	85 c0                	test   %eax,%eax
     6d6:	74 19                	je     6f1 <temp_delete+0x30>
    printf(1, "Failed to delete temporary file\n");
     6d8:	83 ec 08             	sub    $0x8,%esp
     6db:	68 1c cb 00 00       	push   $0xcb1c
     6e0:	6a 01                	push   $0x1
     6e2:	e8 80 b4 00 00       	call   bb67 <printf>
    return 0;
     6e7:	83 c4 10             	add    $0x10,%esp
     6ea:	b8 00 00 00 00       	mov    $0x0,%eax
     6ef:	eb 05                	jmp    6f6 <temp_delete+0x35>
  }

  return 1;
     6f1:	b8 01 00 00 00       	mov    $0x1,%eax
}
     6f6:	c9                   	leave  
     6f7:	c3                   	ret    

000006f8 <get_val>:

//return the value for a given entry from the bufer
//entry must contain all characters before the value include white-space
int get_val(char *buf, char *entry){
     6f8:	55                   	push   %ebp
     6f9:	89 e5                	mov    %esp,%ebp
     6fb:	56                   	push   %esi
     6fc:	53                   	push   %ebx
     6fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
     700:	8b 75 0c             	mov    0xc(%ebp),%esi
     703:	eb 02                	jmp    707 <get_val+0xf>
     if(strncmp(buf, entry, strlen(entry))==0){
       buf+=strlen(entry);
       return atoi(buf);
       }
     else
       while (*buf++!='\n')//go to next line
     705:	89 c3                	mov    %eax,%ebx
//return the value for a given entry from the bufer
//entry must contain all characters before the value include white-space
int get_val(char *buf, char *entry){

  do{
     if(strncmp(buf, entry, strlen(entry))==0){
     707:	83 ec 0c             	sub    $0xc,%esp
     70a:	56                   	push   %esi
     70b:	e8 f3 af 00 00       	call   b703 <strlen>
     710:	83 c4 0c             	add    $0xc,%esp
     713:	50                   	push   %eax
     714:	56                   	push   %esi
     715:	53                   	push   %ebx
     716:	e8 b8 af 00 00       	call   b6d3 <strncmp>
     71b:	83 c4 10             	add    $0x10,%esp
     71e:	85 c0                	test   %eax,%eax
     720:	75 1a                	jne    73c <get_val+0x44>
       buf+=strlen(entry);
     722:	83 ec 0c             	sub    $0xc,%esp
     725:	56                   	push   %esi
     726:	e8 d8 af 00 00       	call   b703 <strlen>
     72b:	01 c3                	add    %eax,%ebx
       return atoi(buf);
     72d:	89 1c 24             	mov    %ebx,(%esp)
     730:	e8 bf b0 00 00       	call   b7f4 <atoi>
     735:	83 c4 10             	add    $0x10,%esp
     738:	eb 15                	jmp    74f <get_val+0x57>
       }
     else
       while (*buf++!='\n')//go to next line
     73a:	89 c3                	mov    %eax,%ebx
     73c:	8d 43 01             	lea    0x1(%ebx),%eax
     73f:	80 3b 0a             	cmpb   $0xa,(%ebx)
     742:	75 f6                	jne    73a <get_val+0x42>
            ;
      }while(*buf!='\0');
     744:	80 7b 01 00          	cmpb   $0x0,0x1(%ebx)
     748:	75 bb                	jne    705 <get_val+0xd>
  return -1;//Assuming all values are supposed to be non-negative
     74a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     74f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     752:	5b                   	pop    %ebx
     753:	5e                   	pop    %esi
     754:	5d                   	pop    %ebp
     755:	c3                   	ret    

00000756 <build_activate_disable_activate>:

// Write into buffer the sequence of activating, disabling then activating a given controller.
// Returns the buffer written.
char* build_activate_disable_activate(int controller_type)
{
     756:	55                   	push   %ebp
     757:	89 e5                	mov    %esp,%ebp
     759:	56                   	push   %esi
     75a:	53                   	push   %ebx
     75b:	8b 75 08             	mov    0x8(%ebp),%esi
  if (!is_valid_controller_type(controller_type)) {
     75e:	56                   	push   %esi
     75f:	e8 3e f9 ff ff       	call   a2 <is_valid_controller_type>
     764:	83 c4 04             	add    $0x4,%esp
     767:	85 c0                	test   %eax,%eax
     769:	0f 84 8e 00 00 00    	je     7fd <build_activate_disable_activate+0xa7>
    return 0;
  }

  int max_size = (MAX_CONTROLLER_NAME_LENGTH + 2) * 3;
  char* buf = malloc(max_size);
     76f:	83 ec 0c             	sub    $0xc,%esp
     772:	6a 36                	push   $0x36
     774:	e8 05 b6 00 00       	call   bd7e <malloc>
     779:	89 c3                	mov    %eax,%ebx
  memset(buf, 0, max_size);
     77b:	83 c4 0c             	add    $0xc,%esp
     77e:	6a 36                	push   $0x36
     780:	6a 00                	push   $0x0
     782:	50                   	push   %eax
     783:	e8 95 af 00 00       	call   b71d <memset>

  // "+controller "
  strcat(buf, "+");
     788:	83 c4 08             	add    $0x8,%esp
     78b:	68 da bf 00 00       	push   $0xbfda
     790:	53                   	push   %ebx
     791:	e8 40 b1 00 00       	call   b8d6 <strcat>
  strcat(buf, get_controller_name(controller_type));
     796:	89 34 24             	mov    %esi,(%esp)
     799:	e8 13 f9 ff ff       	call   b1 <get_controller_name>
     79e:	83 c4 08             	add    $0x8,%esp
     7a1:	89 c6                	mov    %eax,%esi
     7a3:	50                   	push   %eax
     7a4:	53                   	push   %ebx
     7a5:	e8 2c b1 00 00       	call   b8d6 <strcat>
  strcat(buf, " ");
     7aa:	83 c4 08             	add    $0x8,%esp
     7ad:	68 b0 c6 00 00       	push   $0xc6b0
     7b2:	53                   	push   %ebx
     7b3:	e8 1e b1 00 00       	call   b8d6 <strcat>

  // "-controller "
  strcat(buf, "-");
     7b8:	83 c4 08             	add    $0x8,%esp
     7bb:	68 dc bf 00 00       	push   $0xbfdc
     7c0:	53                   	push   %ebx
     7c1:	e8 10 b1 00 00       	call   b8d6 <strcat>
  strcat(buf, get_controller_name(controller_type));
     7c6:	83 c4 08             	add    $0x8,%esp
     7c9:	56                   	push   %esi
     7ca:	53                   	push   %ebx
     7cb:	e8 06 b1 00 00       	call   b8d6 <strcat>
  strcat(buf, " ");
     7d0:	83 c4 08             	add    $0x8,%esp
     7d3:	68 b0 c6 00 00       	push   $0xc6b0
     7d8:	53                   	push   %ebx
     7d9:	e8 f8 b0 00 00       	call   b8d6 <strcat>

  // "+controller"
  strcat(buf, "+");
     7de:	83 c4 08             	add    $0x8,%esp
     7e1:	68 da bf 00 00       	push   $0xbfda
     7e6:	53                   	push   %ebx
     7e7:	e8 ea b0 00 00       	call   b8d6 <strcat>
  strcat(buf, get_controller_name(controller_type));
     7ec:	83 c4 08             	add    $0x8,%esp
     7ef:	56                   	push   %esi
     7f0:	53                   	push   %ebx
     7f1:	e8 e0 b0 00 00       	call   b8d6 <strcat>

  return buf;
     7f6:	83 c4 10             	add    $0x10,%esp
     7f9:	89 d8                	mov    %ebx,%eax
     7fb:	eb 05                	jmp    802 <build_activate_disable_activate+0xac>
// Write into buffer the sequence of activating, disabling then activating a given controller.
// Returns the buffer written.
char* build_activate_disable_activate(int controller_type)
{
  if (!is_valid_controller_type(controller_type)) {
    return 0;
     7fd:	b8 00 00 00 00       	mov    $0x0,%eax
  // "+controller"
  strcat(buf, "+");
  strcat(buf, get_controller_name(controller_type));

  return buf;
}
     802:	8d 65 f8             	lea    -0x8(%ebp),%esp
     805:	5b                   	pop    %ebx
     806:	5e                   	pop    %esi
     807:	5d                   	pop    %ebp
     808:	c3                   	ret    

00000809 <build_activate_disable>:

// Write into buffer the sequence of activating then disabling a given controller.
// Returns the buffer written.
char* build_activate_disable(int controller_type)
{
     809:	55                   	push   %ebp
     80a:	89 e5                	mov    %esp,%ebp
     80c:	56                   	push   %esi
     80d:	53                   	push   %ebx
     80e:	8b 75 08             	mov    0x8(%ebp),%esi
  if (!is_valid_controller_type(controller_type)) {
     811:	56                   	push   %esi
     812:	e8 8b f8 ff ff       	call   a2 <is_valid_controller_type>
     817:	83 c4 04             	add    $0x4,%esp
     81a:	85 c0                	test   %eax,%eax
     81c:	74 68                	je     886 <build_activate_disable+0x7d>
    return 0;
  }

  int max_size = (MAX_CONTROLLER_NAME_LENGTH + 2) * 2;
  char* buf = malloc(max_size);
     81e:	83 ec 0c             	sub    $0xc,%esp
     821:	6a 24                	push   $0x24
     823:	e8 56 b5 00 00       	call   bd7e <malloc>
     828:	89 c3                	mov    %eax,%ebx
  memset(buf, 0, max_size);
     82a:	83 c4 0c             	add    $0xc,%esp
     82d:	6a 24                	push   $0x24
     82f:	6a 00                	push   $0x0
     831:	50                   	push   %eax
     832:	e8 e6 ae 00 00       	call   b71d <memset>

  // "+controller "
  strcat(buf, "+");
     837:	83 c4 08             	add    $0x8,%esp
     83a:	68 da bf 00 00       	push   $0xbfda
     83f:	53                   	push   %ebx
     840:	e8 91 b0 00 00       	call   b8d6 <strcat>
  strcat(buf, get_controller_name(controller_type));
     845:	89 34 24             	mov    %esi,(%esp)
     848:	e8 64 f8 ff ff       	call   b1 <get_controller_name>
     84d:	83 c4 08             	add    $0x8,%esp
     850:	89 c6                	mov    %eax,%esi
     852:	50                   	push   %eax
     853:	53                   	push   %ebx
     854:	e8 7d b0 00 00       	call   b8d6 <strcat>
  strcat(buf, " ");
     859:	83 c4 08             	add    $0x8,%esp
     85c:	68 b0 c6 00 00       	push   $0xc6b0
     861:	53                   	push   %ebx
     862:	e8 6f b0 00 00       	call   b8d6 <strcat>

  // "-controller"
  strcat(buf, "-");
     867:	83 c4 08             	add    $0x8,%esp
     86a:	68 dc bf 00 00       	push   $0xbfdc
     86f:	53                   	push   %ebx
     870:	e8 61 b0 00 00       	call   b8d6 <strcat>
  strcat(buf, get_controller_name(controller_type));
     875:	83 c4 08             	add    $0x8,%esp
     878:	56                   	push   %esi
     879:	53                   	push   %ebx
     87a:	e8 57 b0 00 00       	call   b8d6 <strcat>

  return buf;
     87f:	83 c4 10             	add    $0x10,%esp
     882:	89 d8                	mov    %ebx,%eax
     884:	eb 05                	jmp    88b <build_activate_disable+0x82>
// Write into buffer the sequence of activating then disabling a given controller.
// Returns the buffer written.
char* build_activate_disable(int controller_type)
{
  if (!is_valid_controller_type(controller_type)) {
    return 0;
     886:	b8 00 00 00 00       	mov    $0x0,%eax
  // "-controller"
  strcat(buf, "-");
  strcat(buf, get_controller_name(controller_type));

  return buf;
}
     88b:	8d 65 f8             	lea    -0x8(%ebp),%esp
     88e:	5b                   	pop    %ebx
     88f:	5e                   	pop    %esi
     890:	5d                   	pop    %ebp
     891:	c3                   	ret    

00000892 <test_mount_cgroup_fs>:

TEST(test_mount_cgroup_fs)
{
     892:	55                   	push   %ebp
     893:	89 e5                	mov    %esp,%ebp
     895:	56                   	push   %esi
     896:	53                   	push   %ebx
    ASSERT_FALSE(mkdir(ROOT_CGROUP));
     897:	83 ec 0c             	sub    $0xc,%esp
     89a:	68 de bf 00 00       	push   $0xbfde
     89f:	e8 3a b1 00 00       	call   b9de <mkdir>
     8a4:	83 c4 10             	add    $0x10,%esp
     8a7:	85 c0                	test   %eax,%eax
     8a9:	75 19                	jne    8c4 <test_mount_cgroup_fs+0x32>
     8ab:	eb 70                	jmp    91d <test_mount_cgroup_fs+0x8b>
     8ad:	83 ec 08             	sub    $0x8,%esp
     8b0:	68 3c bf 00 00       	push   $0xbf3c
     8b5:	6a 01                	push   $0x1
     8b7:	e8 ab b2 00 00       	call   bb67 <printf>
     8bc:	83 c3 01             	add    $0x1,%ebx
     8bf:	83 c4 10             	add    $0x10,%esp
     8c2:	eb 05                	jmp    8c9 <test_mount_cgroup_fs+0x37>
     8c4:	bb 00 00 00 00       	mov    $0x0,%ebx
     8c9:	83 ec 0c             	sub    $0xc,%esp
     8cc:	68 e6 bf 00 00       	push   $0xbfe6
     8d1:	e8 2d ae 00 00       	call   b703 <strlen>
     8d6:	89 c6                	mov    %eax,%esi
     8d8:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     8df:	e8 1f ae 00 00       	call   b703 <strlen>
     8e4:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     8e8:	83 c4 10             	add    $0x10,%esp
     8eb:	39 d8                	cmp    %ebx,%eax
     8ed:	77 be                	ja     8ad <test_mount_cgroup_fs+0x1b>
     8ef:	83 ec 0c             	sub    $0xc,%esp
     8f2:	68 6a 01 00 00       	push   $0x16a
     8f7:	68 f9 bf 00 00       	push   $0xbff9
     8fc:	ff 75 08             	pushl  0x8(%ebp)
     8ff:	68 40 cb 00 00       	push   $0xcb40
     904:	6a 01                	push   $0x1
     906:	e8 5c b2 00 00       	call   bb67 <printf>
     90b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     912:	00 00 00 
     915:	83 c4 20             	add    $0x20,%esp
     918:	e9 88 00 00 00       	jmp    9a5 <test_mount_cgroup_fs+0x113>
    ASSERT_FALSE(mount(0, ROOT_CGROUP, CGROUP));
     91d:	83 ec 04             	sub    $0x4,%esp
     920:	68 df bf 00 00       	push   $0xbfdf
     925:	68 de bf 00 00       	push   $0xbfde
     92a:	6a 00                	push   $0x0
     92c:	e8 e5 b0 00 00       	call   ba16 <mount>
     931:	83 c4 10             	add    $0x10,%esp
     934:	85 c0                	test   %eax,%eax
     936:	75 19                	jne    951 <test_mount_cgroup_fs+0xbf>
     938:	eb 6b                	jmp    9a5 <test_mount_cgroup_fs+0x113>
     93a:	83 ec 08             	sub    $0x8,%esp
     93d:	68 3c bf 00 00       	push   $0xbf3c
     942:	6a 01                	push   $0x1
     944:	e8 1e b2 00 00       	call   bb67 <printf>
     949:	83 c3 01             	add    $0x1,%ebx
     94c:	83 c4 10             	add    $0x10,%esp
     94f:	eb 05                	jmp    956 <test_mount_cgroup_fs+0xc4>
     951:	bb 00 00 00 00       	mov    $0x0,%ebx
     956:	83 ec 0c             	sub    $0xc,%esp
     959:	68 08 c0 00 00       	push   $0xc008
     95e:	e8 a0 ad 00 00       	call   b703 <strlen>
     963:	89 c6                	mov    %eax,%esi
     965:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     96c:	e8 92 ad 00 00       	call   b703 <strlen>
     971:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     975:	83 c4 10             	add    $0x10,%esp
     978:	39 d8                	cmp    %ebx,%eax
     97a:	77 be                	ja     93a <test_mount_cgroup_fs+0xa8>
     97c:	83 ec 0c             	sub    $0xc,%esp
     97f:	68 6b 01 00 00       	push   $0x16b
     984:	68 f9 bf 00 00       	push   $0xbff9
     989:	ff 75 08             	pushl  0x8(%ebp)
     98c:	68 7c cb 00 00       	push   $0xcb7c
     991:	6a 01                	push   $0x1
     993:	e8 cf b1 00 00       	call   bb67 <printf>
     998:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     99f:	00 00 00 
     9a2:	83 c4 20             	add    $0x20,%esp
}
     9a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
     9a8:	5b                   	pop    %ebx
     9a9:	5e                   	pop    %esi
     9aa:	5d                   	pop    %ebp
     9ab:	c3                   	ret    

000009ac <test_umount_cgroup_fs>:

TEST(test_umount_cgroup_fs)
{
     9ac:	55                   	push   %ebp
     9ad:	89 e5                	mov    %esp,%ebp
     9af:	56                   	push   %esi
     9b0:	53                   	push   %ebx
    ASSERT_FALSE(umount(ROOT_CGROUP));
     9b1:	83 ec 0c             	sub    $0xc,%esp
     9b4:	68 de bf 00 00       	push   $0xbfde
     9b9:	e8 60 b0 00 00       	call   ba1e <umount>
     9be:	83 c4 10             	add    $0x10,%esp
     9c1:	85 c0                	test   %eax,%eax
     9c3:	75 19                	jne    9de <test_umount_cgroup_fs+0x32>
     9c5:	eb 70                	jmp    a37 <test_umount_cgroup_fs+0x8b>
     9c7:	83 ec 08             	sub    $0x8,%esp
     9ca:	68 3c bf 00 00       	push   $0xbf3c
     9cf:	6a 01                	push   $0x1
     9d1:	e8 91 b1 00 00       	call   bb67 <printf>
     9d6:	83 c3 01             	add    $0x1,%ebx
     9d9:	83 c4 10             	add    $0x10,%esp
     9dc:	eb 05                	jmp    9e3 <test_umount_cgroup_fs+0x37>
     9de:	bb 00 00 00 00       	mov    $0x0,%ebx
     9e3:	83 ec 0c             	sub    $0xc,%esp
     9e6:	68 26 c0 00 00       	push   $0xc026
     9eb:	e8 13 ad 00 00       	call   b703 <strlen>
     9f0:	89 c6                	mov    %eax,%esi
     9f2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     9f9:	e8 05 ad 00 00       	call   b703 <strlen>
     9fe:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     a02:	83 c4 10             	add    $0x10,%esp
     a05:	39 d8                	cmp    %ebx,%eax
     a07:	77 be                	ja     9c7 <test_umount_cgroup_fs+0x1b>
     a09:	83 ec 0c             	sub    $0xc,%esp
     a0c:	68 70 01 00 00       	push   $0x170
     a11:	68 f9 bf 00 00       	push   $0xbff9
     a16:	ff 75 08             	pushl  0x8(%ebp)
     a19:	68 c4 cb 00 00       	push   $0xcbc4
     a1e:	6a 01                	push   $0x1
     a20:	e8 42 b1 00 00       	call   bb67 <printf>
     a25:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     a2c:	00 00 00 
     a2f:	83 c4 20             	add    $0x20,%esp
     a32:	e9 81 00 00 00       	jmp    ab8 <test_umount_cgroup_fs+0x10c>
    ASSERT_FALSE(unlink(ROOT_CGROUP));
     a37:	83 ec 0c             	sub    $0xc,%esp
     a3a:	68 de bf 00 00       	push   $0xbfde
     a3f:	e8 82 af 00 00       	call   b9c6 <unlink>
     a44:	83 c4 10             	add    $0x10,%esp
     a47:	85 c0                	test   %eax,%eax
     a49:	75 19                	jne    a64 <test_umount_cgroup_fs+0xb8>
     a4b:	eb 6b                	jmp    ab8 <test_umount_cgroup_fs+0x10c>
     a4d:	83 ec 08             	sub    $0x8,%esp
     a50:	68 3c bf 00 00       	push   $0xbf3c
     a55:	6a 01                	push   $0x1
     a57:	e8 0b b1 00 00       	call   bb67 <printf>
     a5c:	83 c3 01             	add    $0x1,%ebx
     a5f:	83 c4 10             	add    $0x10,%esp
     a62:	eb 05                	jmp    a69 <test_umount_cgroup_fs+0xbd>
     a64:	bb 00 00 00 00       	mov    $0x0,%ebx
     a69:	83 ec 0c             	sub    $0xc,%esp
     a6c:	68 3a c0 00 00       	push   $0xc03a
     a71:	e8 8d ac 00 00       	call   b703 <strlen>
     a76:	89 c6                	mov    %eax,%esi
     a78:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     a7f:	e8 7f ac 00 00       	call   b703 <strlen>
     a84:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     a88:	83 c4 10             	add    $0x10,%esp
     a8b:	39 d8                	cmp    %ebx,%eax
     a8d:	77 be                	ja     a4d <test_umount_cgroup_fs+0xa1>
     a8f:	83 ec 0c             	sub    $0xc,%esp
     a92:	68 71 01 00 00       	push   $0x171
     a97:	68 f9 bf 00 00       	push   $0xbff9
     a9c:	ff 75 08             	pushl  0x8(%ebp)
     a9f:	68 04 cc 00 00       	push   $0xcc04
     aa4:	6a 01                	push   $0x1
     aa6:	e8 bc b0 00 00       	call   bb67 <printf>
     aab:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     ab2:	00 00 00 
     ab5:	83 c4 20             	add    $0x20,%esp
}
     ab8:	8d 65 f8             	lea    -0x8(%ebp),%esp
     abb:	5b                   	pop    %ebx
     abc:	5e                   	pop    %esi
     abd:	5d                   	pop    %ebp
     abe:	c3                   	ret    

00000abf <test_creating_cgroups>:

TEST(test_creating_cgroups)
{
     abf:	55                   	push   %ebp
     ac0:	89 e5                	mov    %esp,%ebp
     ac2:	56                   	push   %esi
     ac3:	53                   	push   %ebx
    ASSERT_FALSE(mkdir(TEST_1));
     ac4:	83 ec 0c             	sub    $0xc,%esp
     ac7:	68 4e c0 00 00       	push   $0xc04e
     acc:	e8 0d af 00 00       	call   b9de <mkdir>
     ad1:	83 c4 10             	add    $0x10,%esp
     ad4:	85 c0                	test   %eax,%eax
     ad6:	75 19                	jne    af1 <test_creating_cgroups+0x32>
     ad8:	eb 70                	jmp    b4a <test_creating_cgroups+0x8b>
     ada:	83 ec 08             	sub    $0x8,%esp
     add:	68 3c bf 00 00       	push   $0xbf3c
     ae2:	6a 01                	push   $0x1
     ae4:	e8 7e b0 00 00       	call   bb67 <printf>
     ae9:	83 c3 01             	add    $0x1,%ebx
     aec:	83 c4 10             	add    $0x10,%esp
     aef:	eb 05                	jmp    af6 <test_creating_cgroups+0x37>
     af1:	bb 00 00 00 00       	mov    $0x0,%ebx
     af6:	83 ec 0c             	sub    $0xc,%esp
     af9:	68 5c c0 00 00       	push   $0xc05c
     afe:	e8 00 ac 00 00       	call   b703 <strlen>
     b03:	89 c6                	mov    %eax,%esi
     b05:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     b0c:	e8 f2 ab 00 00       	call   b703 <strlen>
     b11:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     b15:	83 c4 10             	add    $0x10,%esp
     b18:	39 d8                	cmp    %ebx,%eax
     b1a:	77 be                	ja     ada <test_creating_cgroups+0x1b>
     b1c:	83 ec 0c             	sub    $0xc,%esp
     b1f:	68 76 01 00 00       	push   $0x176
     b24:	68 f9 bf 00 00       	push   $0xbff9
     b29:	ff 75 08             	pushl  0x8(%ebp)
     b2c:	68 44 cc 00 00       	push   $0xcc44
     b31:	6a 01                	push   $0x1
     b33:	e8 2f b0 00 00       	call   bb67 <printf>
     b38:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     b3f:	00 00 00 
     b42:	83 c4 20             	add    $0x20,%esp
     b45:	e9 8d 01 00 00       	jmp    cd7 <test_creating_cgroups+0x218>
    ASSERT_FALSE(mkdir(TEST_2));
     b4a:	83 ec 0c             	sub    $0xc,%esp
     b4d:	68 6a c0 00 00       	push   $0xc06a
     b52:	e8 87 ae 00 00       	call   b9de <mkdir>
     b57:	83 c4 10             	add    $0x10,%esp
     b5a:	85 c0                	test   %eax,%eax
     b5c:	75 19                	jne    b77 <test_creating_cgroups+0xb8>
     b5e:	eb 70                	jmp    bd0 <test_creating_cgroups+0x111>
     b60:	83 ec 08             	sub    $0x8,%esp
     b63:	68 3c bf 00 00       	push   $0xbf3c
     b68:	6a 01                	push   $0x1
     b6a:	e8 f8 af 00 00       	call   bb67 <printf>
     b6f:	83 c3 01             	add    $0x1,%ebx
     b72:	83 c4 10             	add    $0x10,%esp
     b75:	eb 05                	jmp    b7c <test_creating_cgroups+0xbd>
     b77:	bb 00 00 00 00       	mov    $0x0,%ebx
     b7c:	83 ec 0c             	sub    $0xc,%esp
     b7f:	68 78 c0 00 00       	push   $0xc078
     b84:	e8 7a ab 00 00       	call   b703 <strlen>
     b89:	89 c6                	mov    %eax,%esi
     b8b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     b92:	e8 6c ab 00 00       	call   b703 <strlen>
     b97:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     b9b:	83 c4 10             	add    $0x10,%esp
     b9e:	39 d8                	cmp    %ebx,%eax
     ba0:	77 be                	ja     b60 <test_creating_cgroups+0xa1>
     ba2:	83 ec 0c             	sub    $0xc,%esp
     ba5:	68 77 01 00 00       	push   $0x177
     baa:	68 f9 bf 00 00       	push   $0xbff9
     baf:	ff 75 08             	pushl  0x8(%ebp)
     bb2:	68 7c cc 00 00       	push   $0xcc7c
     bb7:	6a 01                	push   $0x1
     bb9:	e8 a9 af 00 00       	call   bb67 <printf>
     bbe:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     bc5:	00 00 00 
     bc8:	83 c4 20             	add    $0x20,%esp
     bcb:	e9 07 01 00 00       	jmp    cd7 <test_creating_cgroups+0x218>
    ASSERT_FALSE(mkdir(TEST_1_1));
     bd0:	83 ec 0c             	sub    $0xc,%esp
     bd3:	68 86 c0 00 00       	push   $0xc086
     bd8:	e8 01 ae 00 00       	call   b9de <mkdir>
     bdd:	83 c4 10             	add    $0x10,%esp
     be0:	85 c0                	test   %eax,%eax
     be2:	75 19                	jne    bfd <test_creating_cgroups+0x13e>
     be4:	eb 70                	jmp    c56 <test_creating_cgroups+0x197>
     be6:	83 ec 08             	sub    $0x8,%esp
     be9:	68 3c bf 00 00       	push   $0xbf3c
     bee:	6a 01                	push   $0x1
     bf0:	e8 72 af 00 00       	call   bb67 <printf>
     bf5:	83 c3 01             	add    $0x1,%ebx
     bf8:	83 c4 10             	add    $0x10,%esp
     bfb:	eb 05                	jmp    c02 <test_creating_cgroups+0x143>
     bfd:	bb 00 00 00 00       	mov    $0x0,%ebx
     c02:	83 ec 0c             	sub    $0xc,%esp
     c05:	68 96 c0 00 00       	push   $0xc096
     c0a:	e8 f4 aa 00 00       	call   b703 <strlen>
     c0f:	89 c6                	mov    %eax,%esi
     c11:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     c18:	e8 e6 aa 00 00       	call   b703 <strlen>
     c1d:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     c21:	83 c4 10             	add    $0x10,%esp
     c24:	39 d8                	cmp    %ebx,%eax
     c26:	77 be                	ja     be6 <test_creating_cgroups+0x127>
     c28:	83 ec 0c             	sub    $0xc,%esp
     c2b:	68 78 01 00 00       	push   $0x178
     c30:	68 f9 bf 00 00       	push   $0xbff9
     c35:	ff 75 08             	pushl  0x8(%ebp)
     c38:	68 b4 cc 00 00       	push   $0xccb4
     c3d:	6a 01                	push   $0x1
     c3f:	e8 23 af 00 00       	call   bb67 <printf>
     c44:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     c4b:	00 00 00 
     c4e:	83 c4 20             	add    $0x20,%esp
     c51:	e9 81 00 00 00       	jmp    cd7 <test_creating_cgroups+0x218>
    ASSERT_FALSE(mkdir(TEST_1_2));
     c56:	83 ec 0c             	sub    $0xc,%esp
     c59:	68 a6 c0 00 00       	push   $0xc0a6
     c5e:	e8 7b ad 00 00       	call   b9de <mkdir>
     c63:	83 c4 10             	add    $0x10,%esp
     c66:	85 c0                	test   %eax,%eax
     c68:	75 19                	jne    c83 <test_creating_cgroups+0x1c4>
     c6a:	eb 6b                	jmp    cd7 <test_creating_cgroups+0x218>
     c6c:	83 ec 08             	sub    $0x8,%esp
     c6f:	68 3c bf 00 00       	push   $0xbf3c
     c74:	6a 01                	push   $0x1
     c76:	e8 ec ae 00 00       	call   bb67 <printf>
     c7b:	83 c3 01             	add    $0x1,%ebx
     c7e:	83 c4 10             	add    $0x10,%esp
     c81:	eb 05                	jmp    c88 <test_creating_cgroups+0x1c9>
     c83:	bb 00 00 00 00       	mov    $0x0,%ebx
     c88:	83 ec 0c             	sub    $0xc,%esp
     c8b:	68 b6 c0 00 00       	push   $0xc0b6
     c90:	e8 6e aa 00 00       	call   b703 <strlen>
     c95:	89 c6                	mov    %eax,%esi
     c97:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     c9e:	e8 60 aa 00 00       	call   b703 <strlen>
     ca3:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     ca7:	83 c4 10             	add    $0x10,%esp
     caa:	39 d8                	cmp    %ebx,%eax
     cac:	77 be                	ja     c6c <test_creating_cgroups+0x1ad>
     cae:	83 ec 0c             	sub    $0xc,%esp
     cb1:	68 79 01 00 00       	push   $0x179
     cb6:	68 f9 bf 00 00       	push   $0xbff9
     cbb:	ff 75 08             	pushl  0x8(%ebp)
     cbe:	68 f0 cc 00 00       	push   $0xccf0
     cc3:	6a 01                	push   $0x1
     cc5:	e8 9d ae 00 00       	call   bb67 <printf>
     cca:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     cd1:	00 00 00 
     cd4:	83 c4 20             	add    $0x20,%esp
}
     cd7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cda:	5b                   	pop    %ebx
     cdb:	5e                   	pop    %esi
     cdc:	5d                   	pop    %ebp
     cdd:	c3                   	ret    

00000cde <test_deleting_cgroups>:

TEST(test_deleting_cgroups)
{
     cde:	55                   	push   %ebp
     cdf:	89 e5                	mov    %esp,%ebp
     ce1:	56                   	push   %esi
     ce2:	53                   	push   %ebx
    ASSERT_FALSE(unlink(TEST_1_2));
     ce3:	83 ec 0c             	sub    $0xc,%esp
     ce6:	68 a6 c0 00 00       	push   $0xc0a6
     ceb:	e8 d6 ac 00 00       	call   b9c6 <unlink>
     cf0:	83 c4 10             	add    $0x10,%esp
     cf3:	85 c0                	test   %eax,%eax
     cf5:	75 19                	jne    d10 <test_deleting_cgroups+0x32>
     cf7:	eb 70                	jmp    d69 <test_deleting_cgroups+0x8b>
     cf9:	83 ec 08             	sub    $0x8,%esp
     cfc:	68 3c bf 00 00       	push   $0xbf3c
     d01:	6a 01                	push   $0x1
     d03:	e8 5f ae 00 00       	call   bb67 <printf>
     d08:	83 c3 01             	add    $0x1,%ebx
     d0b:	83 c4 10             	add    $0x10,%esp
     d0e:	eb 05                	jmp    d15 <test_deleting_cgroups+0x37>
     d10:	bb 00 00 00 00       	mov    $0x0,%ebx
     d15:	83 ec 0c             	sub    $0xc,%esp
     d18:	68 c6 c0 00 00       	push   $0xc0c6
     d1d:	e8 e1 a9 00 00       	call   b703 <strlen>
     d22:	89 c6                	mov    %eax,%esi
     d24:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     d2b:	e8 d3 a9 00 00       	call   b703 <strlen>
     d30:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     d34:	83 c4 10             	add    $0x10,%esp
     d37:	39 d8                	cmp    %ebx,%eax
     d39:	77 be                	ja     cf9 <test_deleting_cgroups+0x1b>
     d3b:	83 ec 0c             	sub    $0xc,%esp
     d3e:	68 7e 01 00 00       	push   $0x17e
     d43:	68 f9 bf 00 00       	push   $0xbff9
     d48:	ff 75 08             	pushl  0x8(%ebp)
     d4b:	68 2c cd 00 00       	push   $0xcd2c
     d50:	6a 01                	push   $0x1
     d52:	e8 10 ae 00 00       	call   bb67 <printf>
     d57:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     d5e:	00 00 00 
     d61:	83 c4 20             	add    $0x20,%esp
     d64:	e9 8d 01 00 00       	jmp    ef6 <test_deleting_cgroups+0x218>
    ASSERT_FALSE(unlink(TEST_1_1));
     d69:	83 ec 0c             	sub    $0xc,%esp
     d6c:	68 86 c0 00 00       	push   $0xc086
     d71:	e8 50 ac 00 00       	call   b9c6 <unlink>
     d76:	83 c4 10             	add    $0x10,%esp
     d79:	85 c0                	test   %eax,%eax
     d7b:	75 19                	jne    d96 <test_deleting_cgroups+0xb8>
     d7d:	eb 70                	jmp    def <test_deleting_cgroups+0x111>
     d7f:	83 ec 08             	sub    $0x8,%esp
     d82:	68 3c bf 00 00       	push   $0xbf3c
     d87:	6a 01                	push   $0x1
     d89:	e8 d9 ad 00 00       	call   bb67 <printf>
     d8e:	83 c3 01             	add    $0x1,%ebx
     d91:	83 c4 10             	add    $0x10,%esp
     d94:	eb 05                	jmp    d9b <test_deleting_cgroups+0xbd>
     d96:	bb 00 00 00 00       	mov    $0x0,%ebx
     d9b:	83 ec 0c             	sub    $0xc,%esp
     d9e:	68 d7 c0 00 00       	push   $0xc0d7
     da3:	e8 5b a9 00 00       	call   b703 <strlen>
     da8:	89 c6                	mov    %eax,%esi
     daa:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     db1:	e8 4d a9 00 00       	call   b703 <strlen>
     db6:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     dba:	83 c4 10             	add    $0x10,%esp
     dbd:	39 d8                	cmp    %ebx,%eax
     dbf:	77 be                	ja     d7f <test_deleting_cgroups+0xa1>
     dc1:	83 ec 0c             	sub    $0xc,%esp
     dc4:	68 7f 01 00 00       	push   $0x17f
     dc9:	68 f9 bf 00 00       	push   $0xbff9
     dce:	ff 75 08             	pushl  0x8(%ebp)
     dd1:	68 68 cd 00 00       	push   $0xcd68
     dd6:	6a 01                	push   $0x1
     dd8:	e8 8a ad 00 00       	call   bb67 <printf>
     ddd:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     de4:	00 00 00 
     de7:	83 c4 20             	add    $0x20,%esp
     dea:	e9 07 01 00 00       	jmp    ef6 <test_deleting_cgroups+0x218>
    ASSERT_FALSE(unlink(TEST_2));
     def:	83 ec 0c             	sub    $0xc,%esp
     df2:	68 6a c0 00 00       	push   $0xc06a
     df7:	e8 ca ab 00 00       	call   b9c6 <unlink>
     dfc:	83 c4 10             	add    $0x10,%esp
     dff:	85 c0                	test   %eax,%eax
     e01:	75 19                	jne    e1c <test_deleting_cgroups+0x13e>
     e03:	eb 70                	jmp    e75 <test_deleting_cgroups+0x197>
     e05:	83 ec 08             	sub    $0x8,%esp
     e08:	68 3c bf 00 00       	push   $0xbf3c
     e0d:	6a 01                	push   $0x1
     e0f:	e8 53 ad 00 00       	call   bb67 <printf>
     e14:	83 c3 01             	add    $0x1,%ebx
     e17:	83 c4 10             	add    $0x10,%esp
     e1a:	eb 05                	jmp    e21 <test_deleting_cgroups+0x143>
     e1c:	bb 00 00 00 00       	mov    $0x0,%ebx
     e21:	83 ec 0c             	sub    $0xc,%esp
     e24:	68 e8 c0 00 00       	push   $0xc0e8
     e29:	e8 d5 a8 00 00       	call   b703 <strlen>
     e2e:	89 c6                	mov    %eax,%esi
     e30:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     e37:	e8 c7 a8 00 00       	call   b703 <strlen>
     e3c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     e40:	83 c4 10             	add    $0x10,%esp
     e43:	39 d8                	cmp    %ebx,%eax
     e45:	77 be                	ja     e05 <test_deleting_cgroups+0x127>
     e47:	83 ec 0c             	sub    $0xc,%esp
     e4a:	68 80 01 00 00       	push   $0x180
     e4f:	68 f9 bf 00 00       	push   $0xbff9
     e54:	ff 75 08             	pushl  0x8(%ebp)
     e57:	68 a4 cd 00 00       	push   $0xcda4
     e5c:	6a 01                	push   $0x1
     e5e:	e8 04 ad 00 00       	call   bb67 <printf>
     e63:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     e6a:	00 00 00 
     e6d:	83 c4 20             	add    $0x20,%esp
     e70:	e9 81 00 00 00       	jmp    ef6 <test_deleting_cgroups+0x218>
    ASSERT_FALSE(unlink(TEST_1));
     e75:	83 ec 0c             	sub    $0xc,%esp
     e78:	68 4e c0 00 00       	push   $0xc04e
     e7d:	e8 44 ab 00 00       	call   b9c6 <unlink>
     e82:	83 c4 10             	add    $0x10,%esp
     e85:	85 c0                	test   %eax,%eax
     e87:	75 19                	jne    ea2 <test_deleting_cgroups+0x1c4>
     e89:	eb 6b                	jmp    ef6 <test_deleting_cgroups+0x218>
     e8b:	83 ec 08             	sub    $0x8,%esp
     e8e:	68 3c bf 00 00       	push   $0xbf3c
     e93:	6a 01                	push   $0x1
     e95:	e8 cd ac 00 00       	call   bb67 <printf>
     e9a:	83 c3 01             	add    $0x1,%ebx
     e9d:	83 c4 10             	add    $0x10,%esp
     ea0:	eb 05                	jmp    ea7 <test_deleting_cgroups+0x1c9>
     ea2:	bb 00 00 00 00       	mov    $0x0,%ebx
     ea7:	83 ec 0c             	sub    $0xc,%esp
     eaa:	68 f7 c0 00 00       	push   $0xc0f7
     eaf:	e8 4f a8 00 00       	call   b703 <strlen>
     eb4:	89 c6                	mov    %eax,%esi
     eb6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     ebd:	e8 41 a8 00 00       	call   b703 <strlen>
     ec2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
     ec6:	83 c4 10             	add    $0x10,%esp
     ec9:	39 d8                	cmp    %ebx,%eax
     ecb:	77 be                	ja     e8b <test_deleting_cgroups+0x1ad>
     ecd:	83 ec 0c             	sub    $0xc,%esp
     ed0:	68 81 01 00 00       	push   $0x181
     ed5:	68 f9 bf 00 00       	push   $0xbff9
     eda:	ff 75 08             	pushl  0x8(%ebp)
     edd:	68 dc cd 00 00       	push   $0xcddc
     ee2:	6a 01                	push   $0x1
     ee4:	e8 7e ac 00 00       	call   bb67 <printf>
     ee9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     ef0:	00 00 00 
     ef3:	83 c4 20             	add    $0x20,%esp
}
     ef6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ef9:	5b                   	pop    %ebx
     efa:	5e                   	pop    %esi
     efb:	5d                   	pop    %ebp
     efc:	c3                   	ret    

00000efd <test_opening_and_closing_cgroup_files>:

TEST(test_opening_and_closing_cgroup_files)
{
     efd:	55                   	push   %ebp
     efe:	89 e5                	mov    %esp,%ebp
     f00:	57                   	push   %edi
     f01:	56                   	push   %esi
     f02:	53                   	push   %ebx
     f03:	83 ec 18             	sub    $0x18,%esp
     f06:	8b 75 08             	mov    0x8(%ebp),%esi
    ASSERT_TRUE(open_close_file(TEST_1_CGROUP_PROCS));
     f09:	68 06 c1 00 00       	push   $0xc106
     f0e:	e8 5f f2 ff ff       	call   172 <open_close_file>
     f13:	83 c4 10             	add    $0x10,%esp
     f16:	85 c0                	test   %eax,%eax
     f18:	74 19                	je     f33 <test_opening_and_closing_cgroup_files+0x36>
     f1a:	eb 6e                	jmp    f8a <test_opening_and_closing_cgroup_files+0x8d>
     f1c:	83 ec 08             	sub    $0x8,%esp
     f1f:	68 3c bf 00 00       	push   $0xbf3c
     f24:	6a 01                	push   $0x1
     f26:	e8 3c ac 00 00       	call   bb67 <printf>
     f2b:	83 c3 01             	add    $0x1,%ebx
     f2e:	83 c4 10             	add    $0x10,%esp
     f31:	eb 05                	jmp    f38 <test_opening_and_closing_cgroup_files+0x3b>
     f33:	bb 00 00 00 00       	mov    $0x0,%ebx
     f38:	83 ec 0c             	sub    $0xc,%esp
     f3b:	68 14 ce 00 00       	push   $0xce14
     f40:	e8 be a7 00 00       	call   b703 <strlen>
     f45:	89 c7                	mov    %eax,%edi
     f47:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     f4e:	e8 b0 a7 00 00       	call   b703 <strlen>
     f53:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
     f57:	83 c4 10             	add    $0x10,%esp
     f5a:	39 d8                	cmp    %ebx,%eax
     f5c:	77 be                	ja     f1c <test_opening_and_closing_cgroup_files+0x1f>
     f5e:	83 ec 0c             	sub    $0xc,%esp
     f61:	68 86 01 00 00       	push   $0x186
     f66:	68 f9 bf 00 00       	push   $0xbff9
     f6b:	56                   	push   %esi
     f6c:	68 3c ce 00 00       	push   $0xce3c
     f71:	6a 01                	push   $0x1
     f73:	e8 ef ab 00 00       	call   bb67 <printf>
     f78:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
     f7f:	00 00 00 
     f82:	83 c4 20             	add    $0x20,%esp
     f85:	e9 bc 08 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CGROUP_CONTROLLERS));
     f8a:	83 ec 0c             	sub    $0xc,%esp
     f8d:	68 8c ce 00 00       	push   $0xce8c
     f92:	e8 db f1 ff ff       	call   172 <open_close_file>
     f97:	83 c4 10             	add    $0x10,%esp
     f9a:	85 c0                	test   %eax,%eax
     f9c:	74 19                	je     fb7 <test_opening_and_closing_cgroup_files+0xba>
     f9e:	eb 6e                	jmp    100e <test_opening_and_closing_cgroup_files+0x111>
     fa0:	83 ec 08             	sub    $0x8,%esp
     fa3:	68 3c bf 00 00       	push   $0xbf3c
     fa8:	6a 01                	push   $0x1
     faa:	e8 b8 ab 00 00       	call   bb67 <printf>
     faf:	83 c3 01             	add    $0x1,%ebx
     fb2:	83 c4 10             	add    $0x10,%esp
     fb5:	eb 05                	jmp    fbc <test_opening_and_closing_cgroup_files+0xbf>
     fb7:	bb 00 00 00 00       	mov    $0x0,%ebx
     fbc:	83 ec 0c             	sub    $0xc,%esp
     fbf:	68 b0 ce 00 00       	push   $0xceb0
     fc4:	e8 3a a7 00 00       	call   b703 <strlen>
     fc9:	89 c7                	mov    %eax,%edi
     fcb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
     fd2:	e8 2c a7 00 00       	call   b703 <strlen>
     fd7:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
     fdb:	83 c4 10             	add    $0x10,%esp
     fde:	39 d8                	cmp    %ebx,%eax
     fe0:	77 be                	ja     fa0 <test_opening_and_closing_cgroup_files+0xa3>
     fe2:	83 ec 0c             	sub    $0xc,%esp
     fe5:	68 87 01 00 00       	push   $0x187
     fea:	68 f9 bf 00 00       	push   $0xbff9
     fef:	56                   	push   %esi
     ff0:	68 dc ce 00 00       	push   $0xcedc
     ff5:	6a 01                	push   $0x1
     ff7:	e8 6b ab 00 00       	call   bb67 <printf>
     ffc:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1003:	00 00 00 
    1006:	83 c4 20             	add    $0x20,%esp
    1009:	e9 38 08 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CGROUP_SUBTREE_CONTROL));
    100e:	83 ec 0c             	sub    $0xc,%esp
    1011:	68 88 ca 00 00       	push   $0xca88
    1016:	e8 57 f1 ff ff       	call   172 <open_close_file>
    101b:	83 c4 10             	add    $0x10,%esp
    101e:	85 c0                	test   %eax,%eax
    1020:	74 19                	je     103b <test_opening_and_closing_cgroup_files+0x13e>
    1022:	eb 6e                	jmp    1092 <test_opening_and_closing_cgroup_files+0x195>
    1024:	83 ec 08             	sub    $0x8,%esp
    1027:	68 3c bf 00 00       	push   $0xbf3c
    102c:	6a 01                	push   $0x1
    102e:	e8 34 ab 00 00       	call   bb67 <printf>
    1033:	83 c3 01             	add    $0x1,%ebx
    1036:	83 c4 10             	add    $0x10,%esp
    1039:	eb 05                	jmp    1040 <test_opening_and_closing_cgroup_files+0x143>
    103b:	bb 00 00 00 00       	mov    $0x0,%ebx
    1040:	83 ec 0c             	sub    $0xc,%esp
    1043:	68 30 cf 00 00       	push   $0xcf30
    1048:	e8 b6 a6 00 00       	call   b703 <strlen>
    104d:	89 c7                	mov    %eax,%edi
    104f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1056:	e8 a8 a6 00 00       	call   b703 <strlen>
    105b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	39 d8                	cmp    %ebx,%eax
    1064:	77 be                	ja     1024 <test_opening_and_closing_cgroup_files+0x127>
    1066:	83 ec 0c             	sub    $0xc,%esp
    1069:	68 88 01 00 00       	push   $0x188
    106e:	68 f9 bf 00 00       	push   $0xbff9
    1073:	56                   	push   %esi
    1074:	68 60 cf 00 00       	push   $0xcf60
    1079:	6a 01                	push   $0x1
    107b:	e8 e7 aa 00 00       	call   bb67 <printf>
    1080:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1087:	00 00 00 
    108a:	83 c4 20             	add    $0x20,%esp
    108d:	e9 b4 07 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CGROUP_EVENTS));
    1092:	83 ec 0c             	sub    $0xc,%esp
    1095:	68 21 c1 00 00       	push   $0xc121
    109a:	e8 d3 f0 ff ff       	call   172 <open_close_file>
    109f:	83 c4 10             	add    $0x10,%esp
    10a2:	85 c0                	test   %eax,%eax
    10a4:	74 19                	je     10bf <test_opening_and_closing_cgroup_files+0x1c2>
    10a6:	eb 6e                	jmp    1116 <test_opening_and_closing_cgroup_files+0x219>
    10a8:	83 ec 08             	sub    $0x8,%esp
    10ab:	68 3c bf 00 00       	push   $0xbf3c
    10b0:	6a 01                	push   $0x1
    10b2:	e8 b0 aa 00 00       	call   bb67 <printf>
    10b7:	83 c3 01             	add    $0x1,%ebx
    10ba:	83 c4 10             	add    $0x10,%esp
    10bd:	eb 05                	jmp    10c4 <test_opening_and_closing_cgroup_files+0x1c7>
    10bf:	bb 00 00 00 00       	mov    $0x0,%ebx
    10c4:	83 ec 0c             	sub    $0xc,%esp
    10c7:	68 b8 cf 00 00       	push   $0xcfb8
    10cc:	e8 32 a6 00 00       	call   b703 <strlen>
    10d1:	89 c7                	mov    %eax,%edi
    10d3:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    10da:	e8 24 a6 00 00       	call   b703 <strlen>
    10df:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    10e3:	83 c4 10             	add    $0x10,%esp
    10e6:	39 d8                	cmp    %ebx,%eax
    10e8:	77 be                	ja     10a8 <test_opening_and_closing_cgroup_files+0x1ab>
    10ea:	83 ec 0c             	sub    $0xc,%esp
    10ed:	68 89 01 00 00       	push   $0x189
    10f2:	68 f9 bf 00 00       	push   $0xbff9
    10f7:	56                   	push   %esi
    10f8:	68 e0 cf 00 00       	push   $0xcfe0
    10fd:	6a 01                	push   $0x1
    10ff:	e8 63 aa 00 00       	call   bb67 <printf>
    1104:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    110b:	00 00 00 
    110e:	83 c4 20             	add    $0x20,%esp
    1111:	e9 30 07 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CGROUP_DESCENDANTS));
    1116:	83 ec 0c             	sub    $0xc,%esp
    1119:	68 30 d0 00 00       	push   $0xd030
    111e:	e8 4f f0 ff ff       	call   172 <open_close_file>
    1123:	83 c4 10             	add    $0x10,%esp
    1126:	85 c0                	test   %eax,%eax
    1128:	74 19                	je     1143 <test_opening_and_closing_cgroup_files+0x246>
    112a:	eb 6e                	jmp    119a <test_opening_and_closing_cgroup_files+0x29d>
    112c:	83 ec 08             	sub    $0x8,%esp
    112f:	68 3c bf 00 00       	push   $0xbf3c
    1134:	6a 01                	push   $0x1
    1136:	e8 2c aa 00 00       	call   bb67 <printf>
    113b:	83 c3 01             	add    $0x1,%ebx
    113e:	83 c4 10             	add    $0x10,%esp
    1141:	eb 05                	jmp    1148 <test_opening_and_closing_cgroup_files+0x24b>
    1143:	bb 00 00 00 00       	mov    $0x0,%ebx
    1148:	83 ec 0c             	sub    $0xc,%esp
    114b:	68 58 d0 00 00       	push   $0xd058
    1150:	e8 ae a5 00 00       	call   b703 <strlen>
    1155:	89 c7                	mov    %eax,%edi
    1157:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    115e:	e8 a0 a5 00 00       	call   b703 <strlen>
    1163:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    1167:	83 c4 10             	add    $0x10,%esp
    116a:	39 d8                	cmp    %ebx,%eax
    116c:	77 be                	ja     112c <test_opening_and_closing_cgroup_files+0x22f>
    116e:	83 ec 0c             	sub    $0xc,%esp
    1171:	68 8a 01 00 00       	push   $0x18a
    1176:	68 f9 bf 00 00       	push   $0xbff9
    117b:	56                   	push   %esi
    117c:	68 84 d0 00 00       	push   $0xd084
    1181:	6a 01                	push   $0x1
    1183:	e8 df a9 00 00       	call   bb67 <printf>
    1188:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    118f:	00 00 00 
    1192:	83 c4 20             	add    $0x20,%esp
    1195:	e9 ac 06 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CGROUP_MAX_DEPTH));
    119a:	83 ec 0c             	sub    $0xc,%esp
    119d:	68 d8 d0 00 00       	push   $0xd0d8
    11a2:	e8 cb ef ff ff       	call   172 <open_close_file>
    11a7:	83 c4 10             	add    $0x10,%esp
    11aa:	85 c0                	test   %eax,%eax
    11ac:	74 19                	je     11c7 <test_opening_and_closing_cgroup_files+0x2ca>
    11ae:	eb 6e                	jmp    121e <test_opening_and_closing_cgroup_files+0x321>
    11b0:	83 ec 08             	sub    $0x8,%esp
    11b3:	68 3c bf 00 00       	push   $0xbf3c
    11b8:	6a 01                	push   $0x1
    11ba:	e8 a8 a9 00 00       	call   bb67 <printf>
    11bf:	83 c3 01             	add    $0x1,%ebx
    11c2:	83 c4 10             	add    $0x10,%esp
    11c5:	eb 05                	jmp    11cc <test_opening_and_closing_cgroup_files+0x2cf>
    11c7:	bb 00 00 00 00       	mov    $0x0,%ebx
    11cc:	83 ec 0c             	sub    $0xc,%esp
    11cf:	68 f8 d0 00 00       	push   $0xd0f8
    11d4:	e8 2a a5 00 00       	call   b703 <strlen>
    11d9:	89 c7                	mov    %eax,%edi
    11db:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    11e2:	e8 1c a5 00 00       	call   b703 <strlen>
    11e7:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    11eb:	83 c4 10             	add    $0x10,%esp
    11ee:	39 d8                	cmp    %ebx,%eax
    11f0:	77 be                	ja     11b0 <test_opening_and_closing_cgroup_files+0x2b3>
    11f2:	83 ec 0c             	sub    $0xc,%esp
    11f5:	68 8b 01 00 00       	push   $0x18b
    11fa:	68 f9 bf 00 00       	push   $0xbff9
    11ff:	56                   	push   %esi
    1200:	68 24 d1 00 00       	push   $0xd124
    1205:	6a 01                	push   $0x1
    1207:	e8 5b a9 00 00       	call   bb67 <printf>
    120c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1213:	00 00 00 
    1216:	83 c4 20             	add    $0x20,%esp
    1219:	e9 28 06 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CGROUP_STAT));
    121e:	83 ec 0c             	sub    $0xc,%esp
    1221:	68 3d c1 00 00       	push   $0xc13d
    1226:	e8 47 ef ff ff       	call   172 <open_close_file>
    122b:	83 c4 10             	add    $0x10,%esp
    122e:	85 c0                	test   %eax,%eax
    1230:	74 19                	je     124b <test_opening_and_closing_cgroup_files+0x34e>
    1232:	eb 6e                	jmp    12a2 <test_opening_and_closing_cgroup_files+0x3a5>
    1234:	83 ec 08             	sub    $0x8,%esp
    1237:	68 3c bf 00 00       	push   $0xbf3c
    123c:	6a 01                	push   $0x1
    123e:	e8 24 a9 00 00       	call   bb67 <printf>
    1243:	83 c3 01             	add    $0x1,%ebx
    1246:	83 c4 10             	add    $0x10,%esp
    1249:	eb 05                	jmp    1250 <test_opening_and_closing_cgroup_files+0x353>
    124b:	bb 00 00 00 00       	mov    $0x0,%ebx
    1250:	83 ec 0c             	sub    $0xc,%esp
    1253:	68 78 d1 00 00       	push   $0xd178
    1258:	e8 a6 a4 00 00       	call   b703 <strlen>
    125d:	89 c7                	mov    %eax,%edi
    125f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1266:	e8 98 a4 00 00       	call   b703 <strlen>
    126b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    126f:	83 c4 10             	add    $0x10,%esp
    1272:	39 d8                	cmp    %ebx,%eax
    1274:	77 be                	ja     1234 <test_opening_and_closing_cgroup_files+0x337>
    1276:	83 ec 0c             	sub    $0xc,%esp
    1279:	68 8c 01 00 00       	push   $0x18c
    127e:	68 f9 bf 00 00       	push   $0xbff9
    1283:	56                   	push   %esi
    1284:	68 9c d1 00 00       	push   $0xd19c
    1289:	6a 01                	push   $0x1
    128b:	e8 d7 a8 00 00       	call   bb67 <printf>
    1290:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1297:	00 00 00 
    129a:	83 c4 20             	add    $0x20,%esp
    129d:	e9 a4 05 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CPU_MAX));
    12a2:	83 ec 0c             	sub    $0xc,%esp
    12a5:	68 57 c1 00 00       	push   $0xc157
    12aa:	e8 c3 ee ff ff       	call   172 <open_close_file>
    12af:	83 c4 10             	add    $0x10,%esp
    12b2:	85 c0                	test   %eax,%eax
    12b4:	74 19                	je     12cf <test_opening_and_closing_cgroup_files+0x3d2>
    12b6:	eb 6e                	jmp    1326 <test_opening_and_closing_cgroup_files+0x429>
    12b8:	83 ec 08             	sub    $0x8,%esp
    12bb:	68 3c bf 00 00       	push   $0xbf3c
    12c0:	6a 01                	push   $0x1
    12c2:	e8 a0 a8 00 00       	call   bb67 <printf>
    12c7:	83 c3 01             	add    $0x1,%ebx
    12ca:	83 c4 10             	add    $0x10,%esp
    12cd:	eb 05                	jmp    12d4 <test_opening_and_closing_cgroup_files+0x3d7>
    12cf:	bb 00 00 00 00       	mov    $0x0,%ebx
    12d4:	83 ec 0c             	sub    $0xc,%esp
    12d7:	68 ec d1 00 00       	push   $0xd1ec
    12dc:	e8 22 a4 00 00       	call   b703 <strlen>
    12e1:	89 c7                	mov    %eax,%edi
    12e3:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    12ea:	e8 14 a4 00 00       	call   b703 <strlen>
    12ef:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    12f3:	83 c4 10             	add    $0x10,%esp
    12f6:	39 d8                	cmp    %ebx,%eax
    12f8:	77 be                	ja     12b8 <test_opening_and_closing_cgroup_files+0x3bb>
    12fa:	83 ec 0c             	sub    $0xc,%esp
    12fd:	68 8d 01 00 00       	push   $0x18d
    1302:	68 f9 bf 00 00       	push   $0xbff9
    1307:	56                   	push   %esi
    1308:	68 0c d2 00 00       	push   $0xd20c
    130d:	6a 01                	push   $0x1
    130f:	e8 53 a8 00 00       	call   bb67 <printf>
    1314:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    131b:	00 00 00 
    131e:	83 c4 20             	add    $0x20,%esp
    1321:	e9 20 05 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CPU_WEIGHT));
    1326:	83 ec 0c             	sub    $0xc,%esp
    1329:	68 6d c1 00 00       	push   $0xc16d
    132e:	e8 3f ee ff ff       	call   172 <open_close_file>
    1333:	83 c4 10             	add    $0x10,%esp
    1336:	85 c0                	test   %eax,%eax
    1338:	74 19                	je     1353 <test_opening_and_closing_cgroup_files+0x456>
    133a:	eb 6e                	jmp    13aa <test_opening_and_closing_cgroup_files+0x4ad>
    133c:	83 ec 08             	sub    $0x8,%esp
    133f:	68 3c bf 00 00       	push   $0xbf3c
    1344:	6a 01                	push   $0x1
    1346:	e8 1c a8 00 00       	call   bb67 <printf>
    134b:	83 c3 01             	add    $0x1,%ebx
    134e:	83 c4 10             	add    $0x10,%esp
    1351:	eb 05                	jmp    1358 <test_opening_and_closing_cgroup_files+0x45b>
    1353:	bb 00 00 00 00       	mov    $0x0,%ebx
    1358:	83 ec 0c             	sub    $0xc,%esp
    135b:	68 58 d2 00 00       	push   $0xd258
    1360:	e8 9e a3 00 00       	call   b703 <strlen>
    1365:	89 c7                	mov    %eax,%edi
    1367:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    136e:	e8 90 a3 00 00       	call   b703 <strlen>
    1373:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    1377:	83 c4 10             	add    $0x10,%esp
    137a:	39 d8                	cmp    %ebx,%eax
    137c:	77 be                	ja     133c <test_opening_and_closing_cgroup_files+0x43f>
    137e:	83 ec 0c             	sub    $0xc,%esp
    1381:	68 8e 01 00 00       	push   $0x18e
    1386:	68 f9 bf 00 00       	push   $0xbff9
    138b:	56                   	push   %esi
    138c:	68 7c d2 00 00       	push   $0xd27c
    1391:	6a 01                	push   $0x1
    1393:	e8 cf a7 00 00       	call   bb67 <printf>
    1398:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    139f:	00 00 00 
    13a2:	83 c4 20             	add    $0x20,%esp
    13a5:	e9 9c 04 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_CPU_STAT));
    13aa:	83 ec 0c             	sub    $0xc,%esp
    13ad:	68 86 c1 00 00       	push   $0xc186
    13b2:	e8 bb ed ff ff       	call   172 <open_close_file>
    13b7:	83 c4 10             	add    $0x10,%esp
    13ba:	85 c0                	test   %eax,%eax
    13bc:	74 19                	je     13d7 <test_opening_and_closing_cgroup_files+0x4da>
    13be:	eb 6e                	jmp    142e <test_opening_and_closing_cgroup_files+0x531>
    13c0:	83 ec 08             	sub    $0x8,%esp
    13c3:	68 3c bf 00 00       	push   $0xbf3c
    13c8:	6a 01                	push   $0x1
    13ca:	e8 98 a7 00 00       	call   bb67 <printf>
    13cf:	83 c3 01             	add    $0x1,%ebx
    13d2:	83 c4 10             	add    $0x10,%esp
    13d5:	eb 05                	jmp    13dc <test_opening_and_closing_cgroup_files+0x4df>
    13d7:	bb 00 00 00 00       	mov    $0x0,%ebx
    13dc:	83 ec 0c             	sub    $0xc,%esp
    13df:	68 c8 d2 00 00       	push   $0xd2c8
    13e4:	e8 1a a3 00 00       	call   b703 <strlen>
    13e9:	89 c7                	mov    %eax,%edi
    13eb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    13f2:	e8 0c a3 00 00       	call   b703 <strlen>
    13f7:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    13fb:	83 c4 10             	add    $0x10,%esp
    13fe:	39 d8                	cmp    %ebx,%eax
    1400:	77 be                	ja     13c0 <test_opening_and_closing_cgroup_files+0x4c3>
    1402:	83 ec 0c             	sub    $0xc,%esp
    1405:	68 8f 01 00 00       	push   $0x18f
    140a:	68 f9 bf 00 00       	push   $0xbff9
    140f:	56                   	push   %esi
    1410:	68 ec d2 00 00       	push   $0xd2ec
    1415:	6a 01                	push   $0x1
    1417:	e8 4b a7 00 00       	call   bb67 <printf>
    141c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1423:	00 00 00 
    1426:	83 c4 20             	add    $0x20,%esp
    1429:	e9 18 04 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_PID_MAX));
    142e:	83 ec 0c             	sub    $0xc,%esp
    1431:	68 9d c1 00 00       	push   $0xc19d
    1436:	e8 37 ed ff ff       	call   172 <open_close_file>
    143b:	83 c4 10             	add    $0x10,%esp
    143e:	85 c0                	test   %eax,%eax
    1440:	74 19                	je     145b <test_opening_and_closing_cgroup_files+0x55e>
    1442:	eb 6e                	jmp    14b2 <test_opening_and_closing_cgroup_files+0x5b5>
    1444:	83 ec 08             	sub    $0x8,%esp
    1447:	68 3c bf 00 00       	push   $0xbf3c
    144c:	6a 01                	push   $0x1
    144e:	e8 14 a7 00 00       	call   bb67 <printf>
    1453:	83 c3 01             	add    $0x1,%ebx
    1456:	83 c4 10             	add    $0x10,%esp
    1459:	eb 05                	jmp    1460 <test_opening_and_closing_cgroup_files+0x563>
    145b:	bb 00 00 00 00       	mov    $0x0,%ebx
    1460:	83 ec 0c             	sub    $0xc,%esp
    1463:	68 38 d3 00 00       	push   $0xd338
    1468:	e8 96 a2 00 00       	call   b703 <strlen>
    146d:	89 c7                	mov    %eax,%edi
    146f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1476:	e8 88 a2 00 00       	call   b703 <strlen>
    147b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    147f:	83 c4 10             	add    $0x10,%esp
    1482:	39 d8                	cmp    %ebx,%eax
    1484:	77 be                	ja     1444 <test_opening_and_closing_cgroup_files+0x547>
    1486:	83 ec 0c             	sub    $0xc,%esp
    1489:	68 90 01 00 00       	push   $0x190
    148e:	68 f9 bf 00 00       	push   $0xbff9
    1493:	56                   	push   %esi
    1494:	68 58 d3 00 00       	push   $0xd358
    1499:	6a 01                	push   $0x1
    149b:	e8 c7 a6 00 00       	call   bb67 <printf>
    14a0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    14a7:	00 00 00 
    14aa:	83 c4 20             	add    $0x20,%esp
    14ad:	e9 94 03 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_PID_CURRENT));
    14b2:	83 ec 0c             	sub    $0xc,%esp
    14b5:	68 b3 c1 00 00       	push   $0xc1b3
    14ba:	e8 b3 ec ff ff       	call   172 <open_close_file>
    14bf:	83 c4 10             	add    $0x10,%esp
    14c2:	85 c0                	test   %eax,%eax
    14c4:	74 19                	je     14df <test_opening_and_closing_cgroup_files+0x5e2>
    14c6:	eb 6e                	jmp    1536 <test_opening_and_closing_cgroup_files+0x639>
    14c8:	83 ec 08             	sub    $0x8,%esp
    14cb:	68 3c bf 00 00       	push   $0xbf3c
    14d0:	6a 01                	push   $0x1
    14d2:	e8 90 a6 00 00       	call   bb67 <printf>
    14d7:	83 c3 01             	add    $0x1,%ebx
    14da:	83 c4 10             	add    $0x10,%esp
    14dd:	eb 05                	jmp    14e4 <test_opening_and_closing_cgroup_files+0x5e7>
    14df:	bb 00 00 00 00       	mov    $0x0,%ebx
    14e4:	83 ec 0c             	sub    $0xc,%esp
    14e7:	68 a4 d3 00 00       	push   $0xd3a4
    14ec:	e8 12 a2 00 00       	call   b703 <strlen>
    14f1:	89 c7                	mov    %eax,%edi
    14f3:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    14fa:	e8 04 a2 00 00       	call   b703 <strlen>
    14ff:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    1503:	83 c4 10             	add    $0x10,%esp
    1506:	39 d8                	cmp    %ebx,%eax
    1508:	77 be                	ja     14c8 <test_opening_and_closing_cgroup_files+0x5cb>
    150a:	83 ec 0c             	sub    $0xc,%esp
    150d:	68 91 01 00 00       	push   $0x191
    1512:	68 f9 bf 00 00       	push   $0xbff9
    1517:	56                   	push   %esi
    1518:	68 c8 d3 00 00       	push   $0xd3c8
    151d:	6a 01                	push   $0x1
    151f:	e8 43 a6 00 00       	call   bb67 <printf>
    1524:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    152b:	00 00 00 
    152e:	83 c4 20             	add    $0x20,%esp
    1531:	e9 10 03 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_SET_CPU));
    1536:	83 ec 0c             	sub    $0xc,%esp
    1539:	68 cd c1 00 00       	push   $0xc1cd
    153e:	e8 2f ec ff ff       	call   172 <open_close_file>
    1543:	83 c4 10             	add    $0x10,%esp
    1546:	85 c0                	test   %eax,%eax
    1548:	74 19                	je     1563 <test_opening_and_closing_cgroup_files+0x666>
    154a:	eb 6e                	jmp    15ba <test_opening_and_closing_cgroup_files+0x6bd>
    154c:	83 ec 08             	sub    $0x8,%esp
    154f:	68 3c bf 00 00       	push   $0xbf3c
    1554:	6a 01                	push   $0x1
    1556:	e8 0c a6 00 00       	call   bb67 <printf>
    155b:	83 c3 01             	add    $0x1,%ebx
    155e:	83 c4 10             	add    $0x10,%esp
    1561:	eb 05                	jmp    1568 <test_opening_and_closing_cgroup_files+0x66b>
    1563:	bb 00 00 00 00       	mov    $0x0,%ebx
    1568:	83 ec 0c             	sub    $0xc,%esp
    156b:	68 18 d4 00 00       	push   $0xd418
    1570:	e8 8e a1 00 00       	call   b703 <strlen>
    1575:	89 c7                	mov    %eax,%edi
    1577:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    157e:	e8 80 a1 00 00       	call   b703 <strlen>
    1583:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    1587:	83 c4 10             	add    $0x10,%esp
    158a:	39 d8                	cmp    %ebx,%eax
    158c:	77 be                	ja     154c <test_opening_and_closing_cgroup_files+0x64f>
    158e:	83 ec 0c             	sub    $0xc,%esp
    1591:	68 92 01 00 00       	push   $0x192
    1596:	68 f9 bf 00 00       	push   $0xbff9
    159b:	56                   	push   %esi
    159c:	68 38 d4 00 00       	push   $0xd438
    15a1:	6a 01                	push   $0x1
    15a3:	e8 bf a5 00 00       	call   bb67 <printf>
    15a8:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    15af:	00 00 00 
    15b2:	83 c4 20             	add    $0x20,%esp
    15b5:	e9 8c 02 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_SET_FRZ));
    15ba:	83 ec 0c             	sub    $0xc,%esp
    15bd:	68 e7 c1 00 00       	push   $0xc1e7
    15c2:	e8 ab eb ff ff       	call   172 <open_close_file>
    15c7:	83 c4 10             	add    $0x10,%esp
    15ca:	85 c0                	test   %eax,%eax
    15cc:	74 19                	je     15e7 <test_opening_and_closing_cgroup_files+0x6ea>
    15ce:	eb 6e                	jmp    163e <test_opening_and_closing_cgroup_files+0x741>
    15d0:	83 ec 08             	sub    $0x8,%esp
    15d3:	68 3c bf 00 00       	push   $0xbf3c
    15d8:	6a 01                	push   $0x1
    15da:	e8 88 a5 00 00       	call   bb67 <printf>
    15df:	83 c3 01             	add    $0x1,%ebx
    15e2:	83 c4 10             	add    $0x10,%esp
    15e5:	eb 05                	jmp    15ec <test_opening_and_closing_cgroup_files+0x6ef>
    15e7:	bb 00 00 00 00       	mov    $0x0,%ebx
    15ec:	83 ec 0c             	sub    $0xc,%esp
    15ef:	68 84 d4 00 00       	push   $0xd484
    15f4:	e8 0a a1 00 00       	call   b703 <strlen>
    15f9:	89 c7                	mov    %eax,%edi
    15fb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1602:	e8 fc a0 00 00       	call   b703 <strlen>
    1607:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    160b:	83 c4 10             	add    $0x10,%esp
    160e:	39 d8                	cmp    %ebx,%eax
    1610:	77 be                	ja     15d0 <test_opening_and_closing_cgroup_files+0x6d3>
    1612:	83 ec 0c             	sub    $0xc,%esp
    1615:	68 93 01 00 00       	push   $0x193
    161a:	68 f9 bf 00 00       	push   $0xbff9
    161f:	56                   	push   %esi
    1620:	68 a4 d4 00 00       	push   $0xd4a4
    1625:	6a 01                	push   $0x1
    1627:	e8 3b a5 00 00       	call   bb67 <printf>
    162c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1633:	00 00 00 
    1636:	83 c4 20             	add    $0x20,%esp
    1639:	e9 08 02 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_MEM_CURRENT));
    163e:	83 ec 0c             	sub    $0xc,%esp
    1641:	68 03 c2 00 00       	push   $0xc203
    1646:	e8 27 eb ff ff       	call   172 <open_close_file>
    164b:	83 c4 10             	add    $0x10,%esp
    164e:	85 c0                	test   %eax,%eax
    1650:	74 19                	je     166b <test_opening_and_closing_cgroup_files+0x76e>
    1652:	eb 6e                	jmp    16c2 <test_opening_and_closing_cgroup_files+0x7c5>
    1654:	83 ec 08             	sub    $0x8,%esp
    1657:	68 3c bf 00 00       	push   $0xbf3c
    165c:	6a 01                	push   $0x1
    165e:	e8 04 a5 00 00       	call   bb67 <printf>
    1663:	83 c3 01             	add    $0x1,%ebx
    1666:	83 c4 10             	add    $0x10,%esp
    1669:	eb 05                	jmp    1670 <test_opening_and_closing_cgroup_files+0x773>
    166b:	bb 00 00 00 00       	mov    $0x0,%ebx
    1670:	83 ec 0c             	sub    $0xc,%esp
    1673:	68 f0 d4 00 00       	push   $0xd4f0
    1678:	e8 86 a0 00 00       	call   b703 <strlen>
    167d:	89 c7                	mov    %eax,%edi
    167f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1686:	e8 78 a0 00 00       	call   b703 <strlen>
    168b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    168f:	83 c4 10             	add    $0x10,%esp
    1692:	39 d8                	cmp    %ebx,%eax
    1694:	77 be                	ja     1654 <test_opening_and_closing_cgroup_files+0x757>
    1696:	83 ec 0c             	sub    $0xc,%esp
    1699:	68 94 01 00 00       	push   $0x194
    169e:	68 f9 bf 00 00       	push   $0xbff9
    16a3:	56                   	push   %esi
    16a4:	68 14 d5 00 00       	push   $0xd514
    16a9:	6a 01                	push   $0x1
    16ab:	e8 b7 a4 00 00       	call   bb67 <printf>
    16b0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    16b7:	00 00 00 
    16ba:	83 c4 20             	add    $0x20,%esp
    16bd:	e9 84 01 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_MEM_MAX));
    16c2:	83 ec 0c             	sub    $0xc,%esp
    16c5:	68 20 c2 00 00       	push   $0xc220
    16ca:	e8 a3 ea ff ff       	call   172 <open_close_file>
    16cf:	83 c4 10             	add    $0x10,%esp
    16d2:	85 c0                	test   %eax,%eax
    16d4:	74 19                	je     16ef <test_opening_and_closing_cgroup_files+0x7f2>
    16d6:	eb 6e                	jmp    1746 <test_opening_and_closing_cgroup_files+0x849>
    16d8:	83 ec 08             	sub    $0x8,%esp
    16db:	68 3c bf 00 00       	push   $0xbf3c
    16e0:	6a 01                	push   $0x1
    16e2:	e8 80 a4 00 00       	call   bb67 <printf>
    16e7:	83 c3 01             	add    $0x1,%ebx
    16ea:	83 c4 10             	add    $0x10,%esp
    16ed:	eb 05                	jmp    16f4 <test_opening_and_closing_cgroup_files+0x7f7>
    16ef:	bb 00 00 00 00       	mov    $0x0,%ebx
    16f4:	83 ec 0c             	sub    $0xc,%esp
    16f7:	68 64 d5 00 00       	push   $0xd564
    16fc:	e8 02 a0 00 00       	call   b703 <strlen>
    1701:	89 c7                	mov    %eax,%edi
    1703:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    170a:	e8 f4 9f 00 00       	call   b703 <strlen>
    170f:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    1713:	83 c4 10             	add    $0x10,%esp
    1716:	39 d8                	cmp    %ebx,%eax
    1718:	77 be                	ja     16d8 <test_opening_and_closing_cgroup_files+0x7db>
    171a:	83 ec 0c             	sub    $0xc,%esp
    171d:	68 95 01 00 00       	push   $0x195
    1722:	68 f9 bf 00 00       	push   $0xbff9
    1727:	56                   	push   %esi
    1728:	68 84 d5 00 00       	push   $0xd584
    172d:	6a 01                	push   $0x1
    172f:	e8 33 a4 00 00       	call   bb67 <printf>
    1734:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    173b:	00 00 00 
    173e:	83 c4 20             	add    $0x20,%esp
    1741:	e9 00 01 00 00       	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_MEM_MIN));
    1746:	83 ec 0c             	sub    $0xc,%esp
    1749:	68 39 c2 00 00       	push   $0xc239
    174e:	e8 1f ea ff ff       	call   172 <open_close_file>
    1753:	83 c4 10             	add    $0x10,%esp
    1756:	85 c0                	test   %eax,%eax
    1758:	74 19                	je     1773 <test_opening_and_closing_cgroup_files+0x876>
    175a:	eb 6b                	jmp    17c7 <test_opening_and_closing_cgroup_files+0x8ca>
    175c:	83 ec 08             	sub    $0x8,%esp
    175f:	68 3c bf 00 00       	push   $0xbf3c
    1764:	6a 01                	push   $0x1
    1766:	e8 fc a3 00 00       	call   bb67 <printf>
    176b:	83 c3 01             	add    $0x1,%ebx
    176e:	83 c4 10             	add    $0x10,%esp
    1771:	eb 05                	jmp    1778 <test_opening_and_closing_cgroup_files+0x87b>
    1773:	bb 00 00 00 00       	mov    $0x0,%ebx
    1778:	83 ec 0c             	sub    $0xc,%esp
    177b:	68 d0 d5 00 00       	push   $0xd5d0
    1780:	e8 7e 9f 00 00       	call   b703 <strlen>
    1785:	89 c7                	mov    %eax,%edi
    1787:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    178e:	e8 70 9f 00 00       	call   b703 <strlen>
    1793:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    1797:	83 c4 10             	add    $0x10,%esp
    179a:	39 d8                	cmp    %ebx,%eax
    179c:	77 be                	ja     175c <test_opening_and_closing_cgroup_files+0x85f>
    179e:	83 ec 0c             	sub    $0xc,%esp
    17a1:	68 96 01 00 00       	push   $0x196
    17a6:	68 f9 bf 00 00       	push   $0xbff9
    17ab:	56                   	push   %esi
    17ac:	68 f0 d5 00 00       	push   $0xd5f0
    17b1:	6a 01                	push   $0x1
    17b3:	e8 af a3 00 00       	call   bb67 <printf>
    17b8:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    17bf:	00 00 00 
    17c2:	83 c4 20             	add    $0x20,%esp
    17c5:	eb 7f                	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    ASSERT_TRUE(open_close_file(TEST_1_MEM_STAT));
    17c7:	83 ec 0c             	sub    $0xc,%esp
    17ca:	68 52 c2 00 00       	push   $0xc252
    17cf:	e8 9e e9 ff ff       	call   172 <open_close_file>
    17d4:	83 c4 10             	add    $0x10,%esp
    17d7:	85 c0                	test   %eax,%eax
    17d9:	74 19                	je     17f4 <test_opening_and_closing_cgroup_files+0x8f7>
    17db:	eb 69                	jmp    1846 <test_opening_and_closing_cgroup_files+0x949>
    17dd:	83 ec 08             	sub    $0x8,%esp
    17e0:	68 3c bf 00 00       	push   $0xbf3c
    17e5:	6a 01                	push   $0x1
    17e7:	e8 7b a3 00 00       	call   bb67 <printf>
    17ec:	83 c3 01             	add    $0x1,%ebx
    17ef:	83 c4 10             	add    $0x10,%esp
    17f2:	eb 05                	jmp    17f9 <test_opening_and_closing_cgroup_files+0x8fc>
    17f4:	bb 00 00 00 00       	mov    $0x0,%ebx
    17f9:	83 ec 0c             	sub    $0xc,%esp
    17fc:	68 3c d6 00 00       	push   $0xd63c
    1801:	e8 fd 9e 00 00       	call   b703 <strlen>
    1806:	89 c7                	mov    %eax,%edi
    1808:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    180f:	e8 ef 9e 00 00       	call   b703 <strlen>
    1814:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    1818:	83 c4 10             	add    $0x10,%esp
    181b:	39 d8                	cmp    %ebx,%eax
    181d:	77 be                	ja     17dd <test_opening_and_closing_cgroup_files+0x8e0>
    181f:	83 ec 0c             	sub    $0xc,%esp
    1822:	68 97 01 00 00       	push   $0x197
    1827:	68 f9 bf 00 00       	push   $0xbff9
    182c:	56                   	push   %esi
    182d:	68 60 d6 00 00       	push   $0xd660
    1832:	6a 01                	push   $0x1
    1834:	e8 2e a3 00 00       	call   bb67 <printf>
    1839:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1840:	00 00 00 
    1843:	83 c4 20             	add    $0x20,%esp
}
    1846:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1849:	5b                   	pop    %ebx
    184a:	5e                   	pop    %esi
    184b:	5f                   	pop    %edi
    184c:	5d                   	pop    %ebp
    184d:	c3                   	ret    

0000184e <test_reading_cgroup_files>:

TEST(test_reading_cgroup_files)
{
    184e:	55                   	push   %ebp
    184f:	89 e5                	mov    %esp,%ebp
    1851:	56                   	push   %esi
    1852:	53                   	push   %ebx
    ASSERT_TRUE(read_file(TEST_1_CGROUP_PROCS, 1));
    1853:	83 ec 08             	sub    $0x8,%esp
    1856:	6a 01                	push   $0x1
    1858:	68 06 c1 00 00       	push   $0xc106
    185d:	e8 3a e9 ff ff       	call   19c <read_file>
    1862:	83 c4 10             	add    $0x10,%esp
    1865:	85 c0                	test   %eax,%eax
    1867:	75 72                	jne    18db <test_reading_cgroup_files+0x8d>
    1869:	eb 17                	jmp    1882 <test_reading_cgroup_files+0x34>
    186b:	83 ec 08             	sub    $0x8,%esp
    186e:	68 3c bf 00 00       	push   $0xbf3c
    1873:	6a 01                	push   $0x1
    1875:	e8 ed a2 00 00       	call   bb67 <printf>
    187a:	83 c3 01             	add    $0x1,%ebx
    187d:	83 c4 10             	add    $0x10,%esp
    1880:	eb 05                	jmp    1887 <test_reading_cgroup_files+0x39>
    1882:	bb 00 00 00 00       	mov    $0x0,%ebx
    1887:	83 ec 0c             	sub    $0xc,%esp
    188a:	68 ac d6 00 00       	push   $0xd6ac
    188f:	e8 6f 9e 00 00       	call   b703 <strlen>
    1894:	89 c6                	mov    %eax,%esi
    1896:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    189d:	e8 61 9e 00 00       	call   b703 <strlen>
    18a2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    18a6:	83 c4 10             	add    $0x10,%esp
    18a9:	39 d8                	cmp    %ebx,%eax
    18ab:	77 be                	ja     186b <test_reading_cgroup_files+0x1d>
    18ad:	83 ec 0c             	sub    $0xc,%esp
    18b0:	68 9c 01 00 00       	push   $0x19c
    18b5:	68 f9 bf 00 00       	push   $0xbff9
    18ba:	ff 75 08             	pushl  0x8(%ebp)
    18bd:	68 d0 d6 00 00       	push   $0xd6d0
    18c2:	6a 01                	push   $0x1
    18c4:	e8 9e a2 00 00       	call   bb67 <printf>
    18c9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    18d0:	00 00 00 
    18d3:	83 c4 20             	add    $0x20,%esp
    18d6:	e9 03 09 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CGROUP_CONTROLLERS, 1));
    18db:	83 ec 08             	sub    $0x8,%esp
    18de:	6a 01                	push   $0x1
    18e0:	68 8c ce 00 00       	push   $0xce8c
    18e5:	e8 b2 e8 ff ff       	call   19c <read_file>
    18ea:	83 c4 10             	add    $0x10,%esp
    18ed:	85 c0                	test   %eax,%eax
    18ef:	75 72                	jne    1963 <test_reading_cgroup_files+0x115>
    18f1:	eb 17                	jmp    190a <test_reading_cgroup_files+0xbc>
    18f3:	83 ec 08             	sub    $0x8,%esp
    18f6:	68 3c bf 00 00       	push   $0xbf3c
    18fb:	6a 01                	push   $0x1
    18fd:	e8 65 a2 00 00       	call   bb67 <printf>
    1902:	83 c3 01             	add    $0x1,%ebx
    1905:	83 c4 10             	add    $0x10,%esp
    1908:	eb 05                	jmp    190f <test_reading_cgroup_files+0xc1>
    190a:	bb 00 00 00 00       	mov    $0x0,%ebx
    190f:	83 ec 0c             	sub    $0xc,%esp
    1912:	68 1c d7 00 00       	push   $0xd71c
    1917:	e8 e7 9d 00 00       	call   b703 <strlen>
    191c:	89 c6                	mov    %eax,%esi
    191e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1925:	e8 d9 9d 00 00       	call   b703 <strlen>
    192a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    192e:	83 c4 10             	add    $0x10,%esp
    1931:	39 d8                	cmp    %ebx,%eax
    1933:	77 be                	ja     18f3 <test_reading_cgroup_files+0xa5>
    1935:	83 ec 0c             	sub    $0xc,%esp
    1938:	68 9d 01 00 00       	push   $0x19d
    193d:	68 f9 bf 00 00       	push   $0xbff9
    1942:	ff 75 08             	pushl  0x8(%ebp)
    1945:	68 44 d7 00 00       	push   $0xd744
    194a:	6a 01                	push   $0x1
    194c:	e8 16 a2 00 00       	call   bb67 <printf>
    1951:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1958:	00 00 00 
    195b:	83 c4 20             	add    $0x20,%esp
    195e:	e9 7b 08 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CGROUP_SUBTREE_CONTROL, 1));
    1963:	83 ec 08             	sub    $0x8,%esp
    1966:	6a 01                	push   $0x1
    1968:	68 88 ca 00 00       	push   $0xca88
    196d:	e8 2a e8 ff ff       	call   19c <read_file>
    1972:	83 c4 10             	add    $0x10,%esp
    1975:	85 c0                	test   %eax,%eax
    1977:	75 72                	jne    19eb <test_reading_cgroup_files+0x19d>
    1979:	eb 17                	jmp    1992 <test_reading_cgroup_files+0x144>
    197b:	83 ec 08             	sub    $0x8,%esp
    197e:	68 3c bf 00 00       	push   $0xbf3c
    1983:	6a 01                	push   $0x1
    1985:	e8 dd a1 00 00       	call   bb67 <printf>
    198a:	83 c3 01             	add    $0x1,%ebx
    198d:	83 c4 10             	add    $0x10,%esp
    1990:	eb 05                	jmp    1997 <test_reading_cgroup_files+0x149>
    1992:	bb 00 00 00 00       	mov    $0x0,%ebx
    1997:	83 ec 0c             	sub    $0xc,%esp
    199a:	68 98 d7 00 00       	push   $0xd798
    199f:	e8 5f 9d 00 00       	call   b703 <strlen>
    19a4:	89 c6                	mov    %eax,%esi
    19a6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    19ad:	e8 51 9d 00 00       	call   b703 <strlen>
    19b2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    19b6:	83 c4 10             	add    $0x10,%esp
    19b9:	39 d8                	cmp    %ebx,%eax
    19bb:	77 be                	ja     197b <test_reading_cgroup_files+0x12d>
    19bd:	83 ec 0c             	sub    $0xc,%esp
    19c0:	68 9e 01 00 00       	push   $0x19e
    19c5:	68 f9 bf 00 00       	push   $0xbff9
    19ca:	ff 75 08             	pushl  0x8(%ebp)
    19cd:	68 c4 d7 00 00       	push   $0xd7c4
    19d2:	6a 01                	push   $0x1
    19d4:	e8 8e a1 00 00       	call   bb67 <printf>
    19d9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    19e0:	00 00 00 
    19e3:	83 c4 20             	add    $0x20,%esp
    19e6:	e9 f3 07 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CGROUP_EVENTS, 1));
    19eb:	83 ec 08             	sub    $0x8,%esp
    19ee:	6a 01                	push   $0x1
    19f0:	68 21 c1 00 00       	push   $0xc121
    19f5:	e8 a2 e7 ff ff       	call   19c <read_file>
    19fa:	83 c4 10             	add    $0x10,%esp
    19fd:	85 c0                	test   %eax,%eax
    19ff:	75 72                	jne    1a73 <test_reading_cgroup_files+0x225>
    1a01:	eb 17                	jmp    1a1a <test_reading_cgroup_files+0x1cc>
    1a03:	83 ec 08             	sub    $0x8,%esp
    1a06:	68 3c bf 00 00       	push   $0xbf3c
    1a0b:	6a 01                	push   $0x1
    1a0d:	e8 55 a1 00 00       	call   bb67 <printf>
    1a12:	83 c3 01             	add    $0x1,%ebx
    1a15:	83 c4 10             	add    $0x10,%esp
    1a18:	eb 05                	jmp    1a1f <test_reading_cgroup_files+0x1d1>
    1a1a:	bb 00 00 00 00       	mov    $0x0,%ebx
    1a1f:	83 ec 0c             	sub    $0xc,%esp
    1a22:	68 1c d8 00 00       	push   $0xd81c
    1a27:	e8 d7 9c 00 00       	call   b703 <strlen>
    1a2c:	89 c6                	mov    %eax,%esi
    1a2e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1a35:	e8 c9 9c 00 00       	call   b703 <strlen>
    1a3a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1a3e:	83 c4 10             	add    $0x10,%esp
    1a41:	39 d8                	cmp    %ebx,%eax
    1a43:	77 be                	ja     1a03 <test_reading_cgroup_files+0x1b5>
    1a45:	83 ec 0c             	sub    $0xc,%esp
    1a48:	68 9f 01 00 00       	push   $0x19f
    1a4d:	68 f9 bf 00 00       	push   $0xbff9
    1a52:	ff 75 08             	pushl  0x8(%ebp)
    1a55:	68 40 d8 00 00       	push   $0xd840
    1a5a:	6a 01                	push   $0x1
    1a5c:	e8 06 a1 00 00       	call   bb67 <printf>
    1a61:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1a68:	00 00 00 
    1a6b:	83 c4 20             	add    $0x20,%esp
    1a6e:	e9 6b 07 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CGROUP_DESCENDANTS, 1));
    1a73:	83 ec 08             	sub    $0x8,%esp
    1a76:	6a 01                	push   $0x1
    1a78:	68 30 d0 00 00       	push   $0xd030
    1a7d:	e8 1a e7 ff ff       	call   19c <read_file>
    1a82:	83 c4 10             	add    $0x10,%esp
    1a85:	85 c0                	test   %eax,%eax
    1a87:	75 72                	jne    1afb <test_reading_cgroup_files+0x2ad>
    1a89:	eb 17                	jmp    1aa2 <test_reading_cgroup_files+0x254>
    1a8b:	83 ec 08             	sub    $0x8,%esp
    1a8e:	68 3c bf 00 00       	push   $0xbf3c
    1a93:	6a 01                	push   $0x1
    1a95:	e8 cd a0 00 00       	call   bb67 <printf>
    1a9a:	83 c3 01             	add    $0x1,%ebx
    1a9d:	83 c4 10             	add    $0x10,%esp
    1aa0:	eb 05                	jmp    1aa7 <test_reading_cgroup_files+0x259>
    1aa2:	bb 00 00 00 00       	mov    $0x0,%ebx
    1aa7:	83 ec 0c             	sub    $0xc,%esp
    1aaa:	68 8c d8 00 00       	push   $0xd88c
    1aaf:	e8 4f 9c 00 00       	call   b703 <strlen>
    1ab4:	89 c6                	mov    %eax,%esi
    1ab6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1abd:	e8 41 9c 00 00       	call   b703 <strlen>
    1ac2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1ac6:	83 c4 10             	add    $0x10,%esp
    1ac9:	39 d8                	cmp    %ebx,%eax
    1acb:	77 be                	ja     1a8b <test_reading_cgroup_files+0x23d>
    1acd:	83 ec 0c             	sub    $0xc,%esp
    1ad0:	68 a0 01 00 00       	push   $0x1a0
    1ad5:	68 f9 bf 00 00       	push   $0xbff9
    1ada:	ff 75 08             	pushl  0x8(%ebp)
    1add:	68 b4 d8 00 00       	push   $0xd8b4
    1ae2:	6a 01                	push   $0x1
    1ae4:	e8 7e a0 00 00       	call   bb67 <printf>
    1ae9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1af0:	00 00 00 
    1af3:	83 c4 20             	add    $0x20,%esp
    1af6:	e9 e3 06 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CGROUP_MAX_DEPTH, 1));
    1afb:	83 ec 08             	sub    $0x8,%esp
    1afe:	6a 01                	push   $0x1
    1b00:	68 d8 d0 00 00       	push   $0xd0d8
    1b05:	e8 92 e6 ff ff       	call   19c <read_file>
    1b0a:	83 c4 10             	add    $0x10,%esp
    1b0d:	85 c0                	test   %eax,%eax
    1b0f:	75 72                	jne    1b83 <test_reading_cgroup_files+0x335>
    1b11:	eb 17                	jmp    1b2a <test_reading_cgroup_files+0x2dc>
    1b13:	83 ec 08             	sub    $0x8,%esp
    1b16:	68 3c bf 00 00       	push   $0xbf3c
    1b1b:	6a 01                	push   $0x1
    1b1d:	e8 45 a0 00 00       	call   bb67 <printf>
    1b22:	83 c3 01             	add    $0x1,%ebx
    1b25:	83 c4 10             	add    $0x10,%esp
    1b28:	eb 05                	jmp    1b2f <test_reading_cgroup_files+0x2e1>
    1b2a:	bb 00 00 00 00       	mov    $0x0,%ebx
    1b2f:	83 ec 0c             	sub    $0xc,%esp
    1b32:	68 08 d9 00 00       	push   $0xd908
    1b37:	e8 c7 9b 00 00       	call   b703 <strlen>
    1b3c:	89 c6                	mov    %eax,%esi
    1b3e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1b45:	e8 b9 9b 00 00       	call   b703 <strlen>
    1b4a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1b4e:	83 c4 10             	add    $0x10,%esp
    1b51:	39 d8                	cmp    %ebx,%eax
    1b53:	77 be                	ja     1b13 <test_reading_cgroup_files+0x2c5>
    1b55:	83 ec 0c             	sub    $0xc,%esp
    1b58:	68 a1 01 00 00       	push   $0x1a1
    1b5d:	68 f9 bf 00 00       	push   $0xbff9
    1b62:	ff 75 08             	pushl  0x8(%ebp)
    1b65:	68 30 d9 00 00       	push   $0xd930
    1b6a:	6a 01                	push   $0x1
    1b6c:	e8 f6 9f 00 00       	call   bb67 <printf>
    1b71:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1b78:	00 00 00 
    1b7b:	83 c4 20             	add    $0x20,%esp
    1b7e:	e9 5b 06 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CGROUP_STAT, 1));
    1b83:	83 ec 08             	sub    $0x8,%esp
    1b86:	6a 01                	push   $0x1
    1b88:	68 3d c1 00 00       	push   $0xc13d
    1b8d:	e8 0a e6 ff ff       	call   19c <read_file>
    1b92:	83 c4 10             	add    $0x10,%esp
    1b95:	85 c0                	test   %eax,%eax
    1b97:	75 72                	jne    1c0b <test_reading_cgroup_files+0x3bd>
    1b99:	eb 17                	jmp    1bb2 <test_reading_cgroup_files+0x364>
    1b9b:	83 ec 08             	sub    $0x8,%esp
    1b9e:	68 3c bf 00 00       	push   $0xbf3c
    1ba3:	6a 01                	push   $0x1
    1ba5:	e8 bd 9f 00 00       	call   bb67 <printf>
    1baa:	83 c3 01             	add    $0x1,%ebx
    1bad:	83 c4 10             	add    $0x10,%esp
    1bb0:	eb 05                	jmp    1bb7 <test_reading_cgroup_files+0x369>
    1bb2:	bb 00 00 00 00       	mov    $0x0,%ebx
    1bb7:	83 ec 0c             	sub    $0xc,%esp
    1bba:	68 80 d9 00 00       	push   $0xd980
    1bbf:	e8 3f 9b 00 00       	call   b703 <strlen>
    1bc4:	89 c6                	mov    %eax,%esi
    1bc6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1bcd:	e8 31 9b 00 00       	call   b703 <strlen>
    1bd2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1bd6:	83 c4 10             	add    $0x10,%esp
    1bd9:	39 d8                	cmp    %ebx,%eax
    1bdb:	77 be                	ja     1b9b <test_reading_cgroup_files+0x34d>
    1bdd:	83 ec 0c             	sub    $0xc,%esp
    1be0:	68 a2 01 00 00       	push   $0x1a2
    1be5:	68 f9 bf 00 00       	push   $0xbff9
    1bea:	ff 75 08             	pushl  0x8(%ebp)
    1bed:	68 a4 d9 00 00       	push   $0xd9a4
    1bf2:	6a 01                	push   $0x1
    1bf4:	e8 6e 9f 00 00       	call   bb67 <printf>
    1bf9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1c00:	00 00 00 
    1c03:	83 c4 20             	add    $0x20,%esp
    1c06:	e9 d3 05 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CPU_MAX, 1));
    1c0b:	83 ec 08             	sub    $0x8,%esp
    1c0e:	6a 01                	push   $0x1
    1c10:	68 57 c1 00 00       	push   $0xc157
    1c15:	e8 82 e5 ff ff       	call   19c <read_file>
    1c1a:	83 c4 10             	add    $0x10,%esp
    1c1d:	85 c0                	test   %eax,%eax
    1c1f:	75 72                	jne    1c93 <test_reading_cgroup_files+0x445>
    1c21:	eb 17                	jmp    1c3a <test_reading_cgroup_files+0x3ec>
    1c23:	83 ec 08             	sub    $0x8,%esp
    1c26:	68 3c bf 00 00       	push   $0xbf3c
    1c2b:	6a 01                	push   $0x1
    1c2d:	e8 35 9f 00 00       	call   bb67 <printf>
    1c32:	83 c3 01             	add    $0x1,%ebx
    1c35:	83 c4 10             	add    $0x10,%esp
    1c38:	eb 05                	jmp    1c3f <test_reading_cgroup_files+0x3f1>
    1c3a:	bb 00 00 00 00       	mov    $0x0,%ebx
    1c3f:	83 ec 0c             	sub    $0xc,%esp
    1c42:	68 6c c2 00 00       	push   $0xc26c
    1c47:	e8 b7 9a 00 00       	call   b703 <strlen>
    1c4c:	89 c6                	mov    %eax,%esi
    1c4e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1c55:	e8 a9 9a 00 00       	call   b703 <strlen>
    1c5a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1c5e:	83 c4 10             	add    $0x10,%esp
    1c61:	39 d8                	cmp    %ebx,%eax
    1c63:	77 be                	ja     1c23 <test_reading_cgroup_files+0x3d5>
    1c65:	83 ec 0c             	sub    $0xc,%esp
    1c68:	68 a3 01 00 00       	push   $0x1a3
    1c6d:	68 f9 bf 00 00       	push   $0xbff9
    1c72:	ff 75 08             	pushl  0x8(%ebp)
    1c75:	68 f0 d9 00 00       	push   $0xd9f0
    1c7a:	6a 01                	push   $0x1
    1c7c:	e8 e6 9e 00 00       	call   bb67 <printf>
    1c81:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1c88:	00 00 00 
    1c8b:	83 c4 20             	add    $0x20,%esp
    1c8e:	e9 4b 05 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CPU_WEIGHT, 1));
    1c93:	83 ec 08             	sub    $0x8,%esp
    1c96:	6a 01                	push   $0x1
    1c98:	68 6d c1 00 00       	push   $0xc16d
    1c9d:	e8 fa e4 ff ff       	call   19c <read_file>
    1ca2:	83 c4 10             	add    $0x10,%esp
    1ca5:	85 c0                	test   %eax,%eax
    1ca7:	75 72                	jne    1d1b <test_reading_cgroup_files+0x4cd>
    1ca9:	eb 17                	jmp    1cc2 <test_reading_cgroup_files+0x474>
    1cab:	83 ec 08             	sub    $0x8,%esp
    1cae:	68 3c bf 00 00       	push   $0xbf3c
    1cb3:	6a 01                	push   $0x1
    1cb5:	e8 ad 9e 00 00       	call   bb67 <printf>
    1cba:	83 c3 01             	add    $0x1,%ebx
    1cbd:	83 c4 10             	add    $0x10,%esp
    1cc0:	eb 05                	jmp    1cc7 <test_reading_cgroup_files+0x479>
    1cc2:	bb 00 00 00 00       	mov    $0x0,%ebx
    1cc7:	83 ec 0c             	sub    $0xc,%esp
    1cca:	68 38 da 00 00       	push   $0xda38
    1ccf:	e8 2f 9a 00 00       	call   b703 <strlen>
    1cd4:	89 c6                	mov    %eax,%esi
    1cd6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1cdd:	e8 21 9a 00 00       	call   b703 <strlen>
    1ce2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1ce6:	83 c4 10             	add    $0x10,%esp
    1ce9:	39 d8                	cmp    %ebx,%eax
    1ceb:	77 be                	ja     1cab <test_reading_cgroup_files+0x45d>
    1ced:	83 ec 0c             	sub    $0xc,%esp
    1cf0:	68 a4 01 00 00       	push   $0x1a4
    1cf5:	68 f9 bf 00 00       	push   $0xbff9
    1cfa:	ff 75 08             	pushl  0x8(%ebp)
    1cfd:	68 58 da 00 00       	push   $0xda58
    1d02:	6a 01                	push   $0x1
    1d04:	e8 5e 9e 00 00       	call   bb67 <printf>
    1d09:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1d10:	00 00 00 
    1d13:	83 c4 20             	add    $0x20,%esp
    1d16:	e9 c3 04 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_CPU_STAT, 1));
    1d1b:	83 ec 08             	sub    $0x8,%esp
    1d1e:	6a 01                	push   $0x1
    1d20:	68 86 c1 00 00       	push   $0xc186
    1d25:	e8 72 e4 ff ff       	call   19c <read_file>
    1d2a:	83 c4 10             	add    $0x10,%esp
    1d2d:	85 c0                	test   %eax,%eax
    1d2f:	75 72                	jne    1da3 <test_reading_cgroup_files+0x555>
    1d31:	eb 17                	jmp    1d4a <test_reading_cgroup_files+0x4fc>
    1d33:	83 ec 08             	sub    $0x8,%esp
    1d36:	68 3c bf 00 00       	push   $0xbf3c
    1d3b:	6a 01                	push   $0x1
    1d3d:	e8 25 9e 00 00       	call   bb67 <printf>
    1d42:	83 c3 01             	add    $0x1,%ebx
    1d45:	83 c4 10             	add    $0x10,%esp
    1d48:	eb 05                	jmp    1d4f <test_reading_cgroup_files+0x501>
    1d4a:	bb 00 00 00 00       	mov    $0x0,%ebx
    1d4f:	83 ec 0c             	sub    $0xc,%esp
    1d52:	68 89 c2 00 00       	push   $0xc289
    1d57:	e8 a7 99 00 00       	call   b703 <strlen>
    1d5c:	89 c6                	mov    %eax,%esi
    1d5e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1d65:	e8 99 99 00 00       	call   b703 <strlen>
    1d6a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1d6e:	83 c4 10             	add    $0x10,%esp
    1d71:	39 d8                	cmp    %ebx,%eax
    1d73:	77 be                	ja     1d33 <test_reading_cgroup_files+0x4e5>
    1d75:	83 ec 0c             	sub    $0xc,%esp
    1d78:	68 a5 01 00 00       	push   $0x1a5
    1d7d:	68 f9 bf 00 00       	push   $0xbff9
    1d82:	ff 75 08             	pushl  0x8(%ebp)
    1d85:	68 a4 da 00 00       	push   $0xdaa4
    1d8a:	6a 01                	push   $0x1
    1d8c:	e8 d6 9d 00 00       	call   bb67 <printf>
    1d91:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1d98:	00 00 00 
    1d9b:	83 c4 20             	add    $0x20,%esp
    1d9e:	e9 3b 04 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_PID_MAX, 1));
    1da3:	83 ec 08             	sub    $0x8,%esp
    1da6:	6a 01                	push   $0x1
    1da8:	68 9d c1 00 00       	push   $0xc19d
    1dad:	e8 ea e3 ff ff       	call   19c <read_file>
    1db2:	83 c4 10             	add    $0x10,%esp
    1db5:	85 c0                	test   %eax,%eax
    1db7:	75 72                	jne    1e2b <test_reading_cgroup_files+0x5dd>
    1db9:	eb 17                	jmp    1dd2 <test_reading_cgroup_files+0x584>
    1dbb:	83 ec 08             	sub    $0x8,%esp
    1dbe:	68 3c bf 00 00       	push   $0xbf3c
    1dc3:	6a 01                	push   $0x1
    1dc5:	e8 9d 9d 00 00       	call   bb67 <printf>
    1dca:	83 c3 01             	add    $0x1,%ebx
    1dcd:	83 c4 10             	add    $0x10,%esp
    1dd0:	eb 05                	jmp    1dd7 <test_reading_cgroup_files+0x589>
    1dd2:	bb 00 00 00 00       	mov    $0x0,%ebx
    1dd7:	83 ec 0c             	sub    $0xc,%esp
    1dda:	68 a7 c2 00 00       	push   $0xc2a7
    1ddf:	e8 1f 99 00 00       	call   b703 <strlen>
    1de4:	89 c6                	mov    %eax,%esi
    1de6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1ded:	e8 11 99 00 00       	call   b703 <strlen>
    1df2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1df6:	83 c4 10             	add    $0x10,%esp
    1df9:	39 d8                	cmp    %ebx,%eax
    1dfb:	77 be                	ja     1dbb <test_reading_cgroup_files+0x56d>
    1dfd:	83 ec 0c             	sub    $0xc,%esp
    1e00:	68 a6 01 00 00       	push   $0x1a6
    1e05:	68 f9 bf 00 00       	push   $0xbff9
    1e0a:	ff 75 08             	pushl  0x8(%ebp)
    1e0d:	68 ec da 00 00       	push   $0xdaec
    1e12:	6a 01                	push   $0x1
    1e14:	e8 4e 9d 00 00       	call   bb67 <printf>
    1e19:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1e20:	00 00 00 
    1e23:	83 c4 20             	add    $0x20,%esp
    1e26:	e9 b3 03 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_PID_CURRENT, 1));
    1e2b:	83 ec 08             	sub    $0x8,%esp
    1e2e:	6a 01                	push   $0x1
    1e30:	68 b3 c1 00 00       	push   $0xc1b3
    1e35:	e8 62 e3 ff ff       	call   19c <read_file>
    1e3a:	83 c4 10             	add    $0x10,%esp
    1e3d:	85 c0                	test   %eax,%eax
    1e3f:	75 72                	jne    1eb3 <test_reading_cgroup_files+0x665>
    1e41:	eb 17                	jmp    1e5a <test_reading_cgroup_files+0x60c>
    1e43:	83 ec 08             	sub    $0x8,%esp
    1e46:	68 3c bf 00 00       	push   $0xbf3c
    1e4b:	6a 01                	push   $0x1
    1e4d:	e8 15 9d 00 00       	call   bb67 <printf>
    1e52:	83 c3 01             	add    $0x1,%ebx
    1e55:	83 c4 10             	add    $0x10,%esp
    1e58:	eb 05                	jmp    1e5f <test_reading_cgroup_files+0x611>
    1e5a:	bb 00 00 00 00       	mov    $0x0,%ebx
    1e5f:	83 ec 0c             	sub    $0xc,%esp
    1e62:	68 34 db 00 00       	push   $0xdb34
    1e67:	e8 97 98 00 00       	call   b703 <strlen>
    1e6c:	89 c6                	mov    %eax,%esi
    1e6e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1e75:	e8 89 98 00 00       	call   b703 <strlen>
    1e7a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1e7e:	83 c4 10             	add    $0x10,%esp
    1e81:	39 d8                	cmp    %ebx,%eax
    1e83:	77 be                	ja     1e43 <test_reading_cgroup_files+0x5f5>
    1e85:	83 ec 0c             	sub    $0xc,%esp
    1e88:	68 a7 01 00 00       	push   $0x1a7
    1e8d:	68 f9 bf 00 00       	push   $0xbff9
    1e92:	ff 75 08             	pushl  0x8(%ebp)
    1e95:	68 58 db 00 00       	push   $0xdb58
    1e9a:	6a 01                	push   $0x1
    1e9c:	e8 c6 9c 00 00       	call   bb67 <printf>
    1ea1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1ea8:	00 00 00 
    1eab:	83 c4 20             	add    $0x20,%esp
    1eae:	e9 2b 03 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_SET_CPU, 1));
    1eb3:	83 ec 08             	sub    $0x8,%esp
    1eb6:	6a 01                	push   $0x1
    1eb8:	68 cd c1 00 00       	push   $0xc1cd
    1ebd:	e8 da e2 ff ff       	call   19c <read_file>
    1ec2:	83 c4 10             	add    $0x10,%esp
    1ec5:	85 c0                	test   %eax,%eax
    1ec7:	75 72                	jne    1f3b <test_reading_cgroup_files+0x6ed>
    1ec9:	eb 17                	jmp    1ee2 <test_reading_cgroup_files+0x694>
    1ecb:	83 ec 08             	sub    $0x8,%esp
    1ece:	68 3c bf 00 00       	push   $0xbf3c
    1ed3:	6a 01                	push   $0x1
    1ed5:	e8 8d 9c 00 00       	call   bb67 <printf>
    1eda:	83 c3 01             	add    $0x1,%ebx
    1edd:	83 c4 10             	add    $0x10,%esp
    1ee0:	eb 05                	jmp    1ee7 <test_reading_cgroup_files+0x699>
    1ee2:	bb 00 00 00 00       	mov    $0x0,%ebx
    1ee7:	83 ec 0c             	sub    $0xc,%esp
    1eea:	68 c4 c2 00 00       	push   $0xc2c4
    1eef:	e8 0f 98 00 00       	call   b703 <strlen>
    1ef4:	89 c6                	mov    %eax,%esi
    1ef6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1efd:	e8 01 98 00 00       	call   b703 <strlen>
    1f02:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1f06:	83 c4 10             	add    $0x10,%esp
    1f09:	39 d8                	cmp    %ebx,%eax
    1f0b:	77 be                	ja     1ecb <test_reading_cgroup_files+0x67d>
    1f0d:	83 ec 0c             	sub    $0xc,%esp
    1f10:	68 a8 01 00 00       	push   $0x1a8
    1f15:	68 f9 bf 00 00       	push   $0xbff9
    1f1a:	ff 75 08             	pushl  0x8(%ebp)
    1f1d:	68 a4 db 00 00       	push   $0xdba4
    1f22:	6a 01                	push   $0x1
    1f24:	e8 3e 9c 00 00       	call   bb67 <printf>
    1f29:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1f30:	00 00 00 
    1f33:	83 c4 20             	add    $0x20,%esp
    1f36:	e9 a3 02 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_SET_FRZ, 1));
    1f3b:	83 ec 08             	sub    $0x8,%esp
    1f3e:	6a 01                	push   $0x1
    1f40:	68 e7 c1 00 00       	push   $0xc1e7
    1f45:	e8 52 e2 ff ff       	call   19c <read_file>
    1f4a:	83 c4 10             	add    $0x10,%esp
    1f4d:	85 c0                	test   %eax,%eax
    1f4f:	75 72                	jne    1fc3 <test_reading_cgroup_files+0x775>
    1f51:	eb 17                	jmp    1f6a <test_reading_cgroup_files+0x71c>
    1f53:	83 ec 08             	sub    $0x8,%esp
    1f56:	68 3c bf 00 00       	push   $0xbf3c
    1f5b:	6a 01                	push   $0x1
    1f5d:	e8 05 9c 00 00       	call   bb67 <printf>
    1f62:	83 c3 01             	add    $0x1,%ebx
    1f65:	83 c4 10             	add    $0x10,%esp
    1f68:	eb 05                	jmp    1f6f <test_reading_cgroup_files+0x721>
    1f6a:	bb 00 00 00 00       	mov    $0x0,%ebx
    1f6f:	83 ec 0c             	sub    $0xc,%esp
    1f72:	68 e1 c2 00 00       	push   $0xc2e1
    1f77:	e8 87 97 00 00       	call   b703 <strlen>
    1f7c:	89 c6                	mov    %eax,%esi
    1f7e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    1f85:	e8 79 97 00 00       	call   b703 <strlen>
    1f8a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    1f8e:	83 c4 10             	add    $0x10,%esp
    1f91:	39 d8                	cmp    %ebx,%eax
    1f93:	77 be                	ja     1f53 <test_reading_cgroup_files+0x705>
    1f95:	83 ec 0c             	sub    $0xc,%esp
    1f98:	68 a9 01 00 00       	push   $0x1a9
    1f9d:	68 f9 bf 00 00       	push   $0xbff9
    1fa2:	ff 75 08             	pushl  0x8(%ebp)
    1fa5:	68 ec db 00 00       	push   $0xdbec
    1faa:	6a 01                	push   $0x1
    1fac:	e8 b6 9b 00 00       	call   bb67 <printf>
    1fb1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    1fb8:	00 00 00 
    1fbb:	83 c4 20             	add    $0x20,%esp
    1fbe:	e9 1b 02 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_MEM_CURRENT, 1));
    1fc3:	83 ec 08             	sub    $0x8,%esp
    1fc6:	6a 01                	push   $0x1
    1fc8:	68 03 c2 00 00       	push   $0xc203
    1fcd:	e8 ca e1 ff ff       	call   19c <read_file>
    1fd2:	83 c4 10             	add    $0x10,%esp
    1fd5:	85 c0                	test   %eax,%eax
    1fd7:	75 72                	jne    204b <test_reading_cgroup_files+0x7fd>
    1fd9:	eb 17                	jmp    1ff2 <test_reading_cgroup_files+0x7a4>
    1fdb:	83 ec 08             	sub    $0x8,%esp
    1fde:	68 3c bf 00 00       	push   $0xbf3c
    1fe3:	6a 01                	push   $0x1
    1fe5:	e8 7d 9b 00 00       	call   bb67 <printf>
    1fea:	83 c3 01             	add    $0x1,%ebx
    1fed:	83 c4 10             	add    $0x10,%esp
    1ff0:	eb 05                	jmp    1ff7 <test_reading_cgroup_files+0x7a9>
    1ff2:	bb 00 00 00 00       	mov    $0x0,%ebx
    1ff7:	83 ec 0c             	sub    $0xc,%esp
    1ffa:	68 34 dc 00 00       	push   $0xdc34
    1fff:	e8 ff 96 00 00       	call   b703 <strlen>
    2004:	89 c6                	mov    %eax,%esi
    2006:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    200d:	e8 f1 96 00 00       	call   b703 <strlen>
    2012:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2016:	83 c4 10             	add    $0x10,%esp
    2019:	39 d8                	cmp    %ebx,%eax
    201b:	77 be                	ja     1fdb <test_reading_cgroup_files+0x78d>
    201d:	83 ec 0c             	sub    $0xc,%esp
    2020:	68 aa 01 00 00       	push   $0x1aa
    2025:	68 f9 bf 00 00       	push   $0xbff9
    202a:	ff 75 08             	pushl  0x8(%ebp)
    202d:	68 58 dc 00 00       	push   $0xdc58
    2032:	6a 01                	push   $0x1
    2034:	e8 2e 9b 00 00       	call   bb67 <printf>
    2039:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2040:	00 00 00 
    2043:	83 c4 20             	add    $0x20,%esp
    2046:	e9 93 01 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_MEM_MAX, 1));
    204b:	83 ec 08             	sub    $0x8,%esp
    204e:	6a 01                	push   $0x1
    2050:	68 20 c2 00 00       	push   $0xc220
    2055:	e8 42 e1 ff ff       	call   19c <read_file>
    205a:	83 c4 10             	add    $0x10,%esp
    205d:	85 c0                	test   %eax,%eax
    205f:	75 72                	jne    20d3 <test_reading_cgroup_files+0x885>
    2061:	eb 17                	jmp    207a <test_reading_cgroup_files+0x82c>
    2063:	83 ec 08             	sub    $0x8,%esp
    2066:	68 3c bf 00 00       	push   $0xbf3c
    206b:	6a 01                	push   $0x1
    206d:	e8 f5 9a 00 00       	call   bb67 <printf>
    2072:	83 c3 01             	add    $0x1,%ebx
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	eb 05                	jmp    207f <test_reading_cgroup_files+0x831>
    207a:	bb 00 00 00 00       	mov    $0x0,%ebx
    207f:	83 ec 0c             	sub    $0xc,%esp
    2082:	68 fe c2 00 00       	push   $0xc2fe
    2087:	e8 77 96 00 00       	call   b703 <strlen>
    208c:	89 c6                	mov    %eax,%esi
    208e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2095:	e8 69 96 00 00       	call   b703 <strlen>
    209a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    209e:	83 c4 10             	add    $0x10,%esp
    20a1:	39 d8                	cmp    %ebx,%eax
    20a3:	77 be                	ja     2063 <test_reading_cgroup_files+0x815>
    20a5:	83 ec 0c             	sub    $0xc,%esp
    20a8:	68 ab 01 00 00       	push   $0x1ab
    20ad:	68 f9 bf 00 00       	push   $0xbff9
    20b2:	ff 75 08             	pushl  0x8(%ebp)
    20b5:	68 a4 dc 00 00       	push   $0xdca4
    20ba:	6a 01                	push   $0x1
    20bc:	e8 a6 9a 00 00       	call   bb67 <printf>
    20c1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    20c8:	00 00 00 
    20cb:	83 c4 20             	add    $0x20,%esp
    20ce:	e9 0b 01 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_MEM_MIN, 1));
    20d3:	83 ec 08             	sub    $0x8,%esp
    20d6:	6a 01                	push   $0x1
    20d8:	68 39 c2 00 00       	push   $0xc239
    20dd:	e8 ba e0 ff ff       	call   19c <read_file>
    20e2:	83 c4 10             	add    $0x10,%esp
    20e5:	85 c0                	test   %eax,%eax
    20e7:	75 72                	jne    215b <test_reading_cgroup_files+0x90d>
    20e9:	eb 17                	jmp    2102 <test_reading_cgroup_files+0x8b4>
    20eb:	83 ec 08             	sub    $0x8,%esp
    20ee:	68 3c bf 00 00       	push   $0xbf3c
    20f3:	6a 01                	push   $0x1
    20f5:	e8 6d 9a 00 00       	call   bb67 <printf>
    20fa:	83 c3 01             	add    $0x1,%ebx
    20fd:	83 c4 10             	add    $0x10,%esp
    2100:	eb 05                	jmp    2107 <test_reading_cgroup_files+0x8b9>
    2102:	bb 00 00 00 00       	mov    $0x0,%ebx
    2107:	83 ec 0c             	sub    $0xc,%esp
    210a:	68 1b c3 00 00       	push   $0xc31b
    210f:	e8 ef 95 00 00       	call   b703 <strlen>
    2114:	89 c6                	mov    %eax,%esi
    2116:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    211d:	e8 e1 95 00 00       	call   b703 <strlen>
    2122:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2126:	83 c4 10             	add    $0x10,%esp
    2129:	39 d8                	cmp    %ebx,%eax
    212b:	77 be                	ja     20eb <test_reading_cgroup_files+0x89d>
    212d:	83 ec 0c             	sub    $0xc,%esp
    2130:	68 ac 01 00 00       	push   $0x1ac
    2135:	68 f9 bf 00 00       	push   $0xbff9
    213a:	ff 75 08             	pushl  0x8(%ebp)
    213d:	68 ec dc 00 00       	push   $0xdcec
    2142:	6a 01                	push   $0x1
    2144:	e8 1e 9a 00 00       	call   bb67 <printf>
    2149:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2150:	00 00 00 
    2153:	83 c4 20             	add    $0x20,%esp
    2156:	e9 83 00 00 00       	jmp    21de <test_reading_cgroup_files+0x990>
    ASSERT_TRUE(read_file(TEST_1_MEM_STAT, 1));
    215b:	83 ec 08             	sub    $0x8,%esp
    215e:	6a 01                	push   $0x1
    2160:	68 52 c2 00 00       	push   $0xc252
    2165:	e8 32 e0 ff ff       	call   19c <read_file>
    216a:	83 c4 10             	add    $0x10,%esp
    216d:	85 c0                	test   %eax,%eax
    216f:	75 6d                	jne    21de <test_reading_cgroup_files+0x990>
    2171:	eb 17                	jmp    218a <test_reading_cgroup_files+0x93c>
    2173:	83 ec 08             	sub    $0x8,%esp
    2176:	68 3c bf 00 00       	push   $0xbf3c
    217b:	6a 01                	push   $0x1
    217d:	e8 e5 99 00 00       	call   bb67 <printf>
    2182:	83 c3 01             	add    $0x1,%ebx
    2185:	83 c4 10             	add    $0x10,%esp
    2188:	eb 05                	jmp    218f <test_reading_cgroup_files+0x941>
    218a:	bb 00 00 00 00       	mov    $0x0,%ebx
    218f:	83 ec 0c             	sub    $0xc,%esp
    2192:	68 38 c3 00 00       	push   $0xc338
    2197:	e8 67 95 00 00       	call   b703 <strlen>
    219c:	89 c6                	mov    %eax,%esi
    219e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    21a5:	e8 59 95 00 00       	call   b703 <strlen>
    21aa:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    21ae:	83 c4 10             	add    $0x10,%esp
    21b1:	39 d8                	cmp    %ebx,%eax
    21b3:	77 be                	ja     2173 <test_reading_cgroup_files+0x925>
    21b5:	83 ec 0c             	sub    $0xc,%esp
    21b8:	68 ad 01 00 00       	push   $0x1ad
    21bd:	68 f9 bf 00 00       	push   $0xbff9
    21c2:	ff 75 08             	pushl  0x8(%ebp)
    21c5:	68 34 dd 00 00       	push   $0xdd34
    21ca:	6a 01                	push   $0x1
    21cc:	e8 96 99 00 00       	call   bb67 <printf>
    21d1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    21d8:	00 00 00 
    21db:	83 c4 20             	add    $0x20,%esp
}
    21de:	8d 65 f8             	lea    -0x8(%ebp),%esp
    21e1:	5b                   	pop    %ebx
    21e2:	5e                   	pop    %esi
    21e3:	5d                   	pop    %ebp
    21e4:	c3                   	ret    

000021e5 <test_enable_and_disable_controller>:

int test_enable_and_disable_controller(int controller_type)
{
    21e5:	55                   	push   %ebp
    21e6:	89 e5                	mov    %esp,%ebp
    21e8:	57                   	push   %edi
    21e9:	56                   	push   %esi
    21ea:	53                   	push   %ebx
    21eb:	83 ec 18             	sub    $0x18,%esp
    21ee:	8b 5d 08             	mov    0x8(%ebp),%ebx
    char *buf;
    int result = 1;

    // Enable given controller.
    buf = build_activate_disable_activate(controller_type);
    21f1:	53                   	push   %ebx
    21f2:	e8 5f e5 ff ff       	call   756 <build_activate_disable_activate>
    if (!buf) {
    21f7:	83 c4 10             	add    $0x10,%esp
    21fa:	85 c0                	test   %eax,%eax
    21fc:	74 5f                	je     225d <test_enable_and_disable_controller+0x78>
    21fe:	89 c6                	mov    %eax,%esi
        return 0;
    }
    result &= write_file(TEST_1_CGROUP_SUBTREE_CONTROL, buf);
    2200:	83 ec 08             	sub    $0x8,%esp
    2203:	50                   	push   %eax
    2204:	68 88 ca 00 00       	push   $0xca88
    2209:	e8 40 e0 ff ff       	call   24e <write_file>
    220e:	83 e0 01             	and    $0x1,%eax
    2211:	89 c7                	mov    %eax,%edi
    free(buf);
    2213:	89 34 24             	mov    %esi,(%esp)
    2216:	e8 a3 9a 00 00       	call   bcbe <free>


    // Check that the given controller is really enabled.
    result &= verify_controller_enabled(controller_type);
    221b:	89 1c 24             	mov    %ebx,(%esp)
    221e:	e8 e7 e1 ff ff       	call   40a <verify_controller_enabled>
    2223:	21 c7                	and    %eax,%edi

    // Disable the given controller.
    buf = build_activate_disable(controller_type);
    2225:	89 1c 24             	mov    %ebx,(%esp)
    2228:	e8 dc e5 ff ff       	call   809 <build_activate_disable>
    222d:	89 c6                	mov    %eax,%esi
    if (!buf) {
    222f:	83 c4 10             	add    $0x10,%esp
    2232:	85 c0                	test   %eax,%eax
    2234:	74 2e                	je     2264 <test_enable_and_disable_controller+0x7f>
        return 0;
    }
    result &= write_file(TEST_1_CGROUP_SUBTREE_CONTROL, buf);
    2236:	83 ec 08             	sub    $0x8,%esp
    2239:	50                   	push   %eax
    223a:	68 88 ca 00 00       	push   $0xca88
    223f:	e8 0a e0 ff ff       	call   24e <write_file>
    2244:	21 c7                	and    %eax,%edi
    free(buf);
    2246:	89 34 24             	mov    %esi,(%esp)
    2249:	e8 70 9a 00 00       	call   bcbe <free>

    // Check that the given controller is really disabled.
    result &= verify_controller_disabled(controller_type);
    224e:	89 1c 24             	mov    %ebx,(%esp)
    2251:	e8 44 e2 ff ff       	call   49a <verify_controller_disabled>

    return result;
    2256:	83 c4 10             	add    $0x10,%esp
    2259:	21 f8                	and    %edi,%eax
    225b:	eb 0c                	jmp    2269 <test_enable_and_disable_controller+0x84>
    int result = 1;

    // Enable given controller.
    buf = build_activate_disable_activate(controller_type);
    if (!buf) {
        return 0;
    225d:	b8 00 00 00 00       	mov    $0x0,%eax
    2262:	eb 05                	jmp    2269 <test_enable_and_disable_controller+0x84>
    result &= verify_controller_enabled(controller_type);

    // Disable the given controller.
    buf = build_activate_disable(controller_type);
    if (!buf) {
        return 0;
    2264:	b8 00 00 00 00       	mov    $0x0,%eax

    // Check that the given controller is really disabled.
    result &= verify_controller_disabled(controller_type);

    return result;
}
    2269:	8d 65 f4             	lea    -0xc(%ebp),%esp
    226c:	5b                   	pop    %ebx
    226d:	5e                   	pop    %esi
    226e:	5f                   	pop    %edi
    226f:	5d                   	pop    %ebp
    2270:	c3                   	ret    

00002271 <test_enable_and_disable_all_controllers>:

TEST(test_enable_and_disable_all_controllers)
{
    2271:	55                   	push   %ebp
    2272:	89 e5                	mov    %esp,%ebp
    2274:	56                   	push   %esi
    2275:	53                   	push   %ebx
    for (int i = CPU_CNT; i < CPU_CNT + CONTROLLER_COUNT; i++) {
    2276:	bb 00 00 00 00       	mov    $0x0,%ebx
    227b:	e9 82 00 00 00       	jmp    2302 <test_enable_and_disable_all_controllers+0x91>
        ASSERT_TRUE(test_enable_and_disable_controller(i));
    2280:	83 ec 0c             	sub    $0xc,%esp
    2283:	53                   	push   %ebx
    2284:	e8 5c ff ff ff       	call   21e5 <test_enable_and_disable_controller>
    2289:	83 c4 10             	add    $0x10,%esp
    228c:	85 c0                	test   %eax,%eax
    228e:	75 6f                	jne    22ff <test_enable_and_disable_all_controllers+0x8e>
    2290:	eb 17                	jmp    22a9 <test_enable_and_disable_all_controllers+0x38>
    2292:	83 ec 08             	sub    $0x8,%esp
    2295:	68 3c bf 00 00       	push   $0xbf3c
    229a:	6a 01                	push   $0x1
    229c:	e8 c6 98 00 00       	call   bb67 <printf>
    22a1:	83 c3 01             	add    $0x1,%ebx
    22a4:	83 c4 10             	add    $0x10,%esp
    22a7:	eb 05                	jmp    22ae <test_enable_and_disable_all_controllers+0x3d>
    22a9:	bb 00 00 00 00       	mov    $0x0,%ebx
    22ae:	83 ec 0c             	sub    $0xc,%esp
    22b1:	68 7c dd 00 00       	push   $0xdd7c
    22b6:	e8 48 94 00 00       	call   b703 <strlen>
    22bb:	89 c6                	mov    %eax,%esi
    22bd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    22c4:	e8 3a 94 00 00       	call   b703 <strlen>
    22c9:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    22cd:	83 c4 10             	add    $0x10,%esp
    22d0:	39 d8                	cmp    %ebx,%eax
    22d2:	77 be                	ja     2292 <test_enable_and_disable_all_controllers+0x21>
    22d4:	83 ec 0c             	sub    $0xc,%esp
    22d7:	68 d2 01 00 00       	push   $0x1d2
    22dc:	68 f9 bf 00 00       	push   $0xbff9
    22e1:	ff 75 08             	pushl  0x8(%ebp)
    22e4:	68 a4 dd 00 00       	push   $0xdda4
    22e9:	6a 01                	push   $0x1
    22eb:	e8 77 98 00 00       	call   bb67 <printf>
    22f0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    22f7:	00 00 00 
    22fa:	83 c4 20             	add    $0x20,%esp
    22fd:	eb 0c                	jmp    230b <test_enable_and_disable_all_controllers+0x9a>
    return result;
}

TEST(test_enable_and_disable_all_controllers)
{
    for (int i = CPU_CNT; i < CPU_CNT + CONTROLLER_COUNT; i++) {
    22ff:	83 c3 01             	add    $0x1,%ebx
    2302:	83 fb 03             	cmp    $0x3,%ebx
    2305:	0f 8e 75 ff ff ff    	jle    2280 <test_enable_and_disable_all_controllers+0xf>
        ASSERT_TRUE(test_enable_and_disable_controller(i));
    }
}
    230b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    230e:	5b                   	pop    %ebx
    230f:	5e                   	pop    %esi
    2310:	5d                   	pop    %ebp
    2311:	c3                   	ret    

00002312 <test_limiting_cpu_max_and_period>:

TEST(test_limiting_cpu_max_and_period)
{
    2312:	55                   	push   %ebp
    2313:	89 e5                	mov    %esp,%ebp
    2315:	57                   	push   %edi
    2316:	56                   	push   %esi
    2317:	53                   	push   %ebx
    2318:	83 ec 18             	sub    $0x18,%esp
    231b:	8b 7d 08             	mov    0x8(%ebp),%edi
    // Enable cpu controller
    ASSERT_TRUE(enable_controller(CPU_CNT));
    231e:	6a 00                	push   $0x0
    2320:	e8 3b e0 ff ff       	call   360 <enable_controller>
    2325:	83 c4 10             	add    $0x10,%esp
    2328:	85 c0                	test   %eax,%eax
    232a:	74 19                	je     2345 <test_limiting_cpu_max_and_period+0x33>
    232c:	eb 6e                	jmp    239c <test_limiting_cpu_max_and_period+0x8a>
    232e:	83 ec 08             	sub    $0x8,%esp
    2331:	68 3c bf 00 00       	push   $0xbf3c
    2336:	6a 01                	push   $0x1
    2338:	e8 2a 98 00 00       	call   bb67 <printf>
    233d:	83 c3 01             	add    $0x1,%ebx
    2340:	83 c4 10             	add    $0x10,%esp
    2343:	eb 05                	jmp    234a <test_limiting_cpu_max_and_period+0x38>
    2345:	bb 00 00 00 00       	mov    $0x0,%ebx
    234a:	83 ec 0c             	sub    $0xc,%esp
    234d:	68 56 c3 00 00       	push   $0xc356
    2352:	e8 ac 93 00 00       	call   b703 <strlen>
    2357:	89 c6                	mov    %eax,%esi
    2359:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2360:	e8 9e 93 00 00       	call   b703 <strlen>
    2365:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2369:	83 c4 10             	add    $0x10,%esp
    236c:	39 d8                	cmp    %ebx,%eax
    236e:	77 be                	ja     232e <test_limiting_cpu_max_and_period+0x1c>
    2370:	83 ec 0c             	sub    $0xc,%esp
    2373:	68 d9 01 00 00       	push   $0x1d9
    2378:	68 f9 bf 00 00       	push   $0xbff9
    237d:	57                   	push   %edi
    237e:	68 f4 dd 00 00       	push   $0xddf4
    2383:	6a 01                	push   $0x1
    2385:	e8 dd 97 00 00       	call   bb67 <printf>
    238a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2391:	00 00 00 
    2394:	83 c4 20             	add    $0x20,%esp
    2397:	e9 b3 02 00 00       	jmp    264f <test_limiting_cpu_max_and_period+0x33d>

    // Update only max
    ASSERT_TRUE(write_file(TEST_1_CPU_MAX, "5000"));
    239c:	83 ec 08             	sub    $0x8,%esp
    239f:	68 71 c3 00 00       	push   $0xc371
    23a4:	68 57 c1 00 00       	push   $0xc157
    23a9:	e8 a0 de ff ff       	call   24e <write_file>
    23ae:	83 c4 10             	add    $0x10,%esp
    23b1:	85 c0                	test   %eax,%eax
    23b3:	74 19                	je     23ce <test_limiting_cpu_max_and_period+0xbc>
    23b5:	eb 6e                	jmp    2425 <test_limiting_cpu_max_and_period+0x113>
    23b7:	83 ec 08             	sub    $0x8,%esp
    23ba:	68 3c bf 00 00       	push   $0xbf3c
    23bf:	6a 01                	push   $0x1
    23c1:	e8 a1 97 00 00       	call   bb67 <printf>
    23c6:	83 c3 01             	add    $0x1,%ebx
    23c9:	83 c4 10             	add    $0x10,%esp
    23cc:	eb 05                	jmp    23d3 <test_limiting_cpu_max_and_period+0xc1>
    23ce:	bb 00 00 00 00       	mov    $0x0,%ebx
    23d3:	83 ec 0c             	sub    $0xc,%esp
    23d6:	68 38 de 00 00       	push   $0xde38
    23db:	e8 23 93 00 00       	call   b703 <strlen>
    23e0:	89 c6                	mov    %eax,%esi
    23e2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    23e9:	e8 15 93 00 00       	call   b703 <strlen>
    23ee:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    23f2:	83 c4 10             	add    $0x10,%esp
    23f5:	39 d8                	cmp    %ebx,%eax
    23f7:	77 be                	ja     23b7 <test_limiting_cpu_max_and_period+0xa5>
    23f9:	83 ec 0c             	sub    $0xc,%esp
    23fc:	68 dc 01 00 00       	push   $0x1dc
    2401:	68 f9 bf 00 00       	push   $0xbff9
    2406:	57                   	push   %edi
    2407:	68 5c de 00 00       	push   $0xde5c
    240c:	6a 01                	push   $0x1
    240e:	e8 54 97 00 00       	call   bb67 <printf>
    2413:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    241a:	00 00 00 
    241d:	83 c4 20             	add    $0x20,%esp
    2420:	e9 2a 02 00 00       	jmp    264f <test_limiting_cpu_max_and_period+0x33d>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_CPU_MAX, 0), "max - 5000\nperiod - 100000\n"));
    2425:	83 ec 08             	sub    $0x8,%esp
    2428:	6a 00                	push   $0x0
    242a:	68 57 c1 00 00       	push   $0xc157
    242f:	e8 68 dd ff ff       	call   19c <read_file>
    2434:	83 c4 08             	add    $0x8,%esp
    2437:	68 76 c3 00 00       	push   $0xc376
    243c:	50                   	push   %eax
    243d:	e8 6b 92 00 00       	call   b6ad <strcmp>
    2442:	83 c4 10             	add    $0x10,%esp
    2445:	85 c0                	test   %eax,%eax
    2447:	75 19                	jne    2462 <test_limiting_cpu_max_and_period+0x150>
    2449:	eb 6e                	jmp    24b9 <test_limiting_cpu_max_and_period+0x1a7>
    244b:	83 ec 08             	sub    $0x8,%esp
    244e:	68 3c bf 00 00       	push   $0xbf3c
    2453:	6a 01                	push   $0x1
    2455:	e8 0d 97 00 00       	call   bb67 <printf>
    245a:	83 c3 01             	add    $0x1,%ebx
    245d:	83 c4 10             	add    $0x10,%esp
    2460:	eb 05                	jmp    2467 <test_limiting_cpu_max_and_period+0x155>
    2462:	bb 00 00 00 00       	mov    $0x0,%ebx
    2467:	83 ec 0c             	sub    $0xc,%esp
    246a:	68 a8 de 00 00       	push   $0xdea8
    246f:	e8 8f 92 00 00       	call   b703 <strlen>
    2474:	89 c6                	mov    %eax,%esi
    2476:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    247d:	e8 81 92 00 00       	call   b703 <strlen>
    2482:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2486:	83 c4 10             	add    $0x10,%esp
    2489:	39 d8                	cmp    %ebx,%eax
    248b:	77 be                	ja     244b <test_limiting_cpu_max_and_period+0x139>
    248d:	83 ec 0c             	sub    $0xc,%esp
    2490:	68 df 01 00 00       	push   $0x1df
    2495:	68 f9 bf 00 00       	push   $0xbff9
    249a:	57                   	push   %edi
    249b:	68 f0 de 00 00       	push   $0xdef0
    24a0:	6a 01                	push   $0x1
    24a2:	e8 c0 96 00 00       	call   bb67 <printf>
    24a7:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    24ae:	00 00 00 
    24b1:	83 c4 20             	add    $0x20,%esp
    24b4:	e9 96 01 00 00       	jmp    264f <test_limiting_cpu_max_and_period+0x33d>

    // Update max & period
    ASSERT_TRUE(write_file(TEST_1_CPU_MAX, "1000,20000"));
    24b9:	83 ec 08             	sub    $0x8,%esp
    24bc:	68 92 c3 00 00       	push   $0xc392
    24c1:	68 57 c1 00 00       	push   $0xc157
    24c6:	e8 83 dd ff ff       	call   24e <write_file>
    24cb:	83 c4 10             	add    $0x10,%esp
    24ce:	85 c0                	test   %eax,%eax
    24d0:	74 19                	je     24eb <test_limiting_cpu_max_and_period+0x1d9>
    24d2:	eb 6e                	jmp    2542 <test_limiting_cpu_max_and_period+0x230>
    24d4:	83 ec 08             	sub    $0x8,%esp
    24d7:	68 3c bf 00 00       	push   $0xbf3c
    24dc:	6a 01                	push   $0x1
    24de:	e8 84 96 00 00       	call   bb67 <printf>
    24e3:	83 c3 01             	add    $0x1,%ebx
    24e6:	83 c4 10             	add    $0x10,%esp
    24e9:	eb 05                	jmp    24f0 <test_limiting_cpu_max_and_period+0x1de>
    24eb:	bb 00 00 00 00       	mov    $0x0,%ebx
    24f0:	83 ec 0c             	sub    $0xc,%esp
    24f3:	68 60 df 00 00       	push   $0xdf60
    24f8:	e8 06 92 00 00       	call   b703 <strlen>
    24fd:	89 c6                	mov    %eax,%esi
    24ff:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2506:	e8 f8 91 00 00       	call   b703 <strlen>
    250b:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    250f:	83 c4 10             	add    $0x10,%esp
    2512:	39 d8                	cmp    %ebx,%eax
    2514:	77 be                	ja     24d4 <test_limiting_cpu_max_and_period+0x1c2>
    2516:	83 ec 0c             	sub    $0xc,%esp
    2519:	68 e2 01 00 00       	push   $0x1e2
    251e:	68 f9 bf 00 00       	push   $0xbff9
    2523:	57                   	push   %edi
    2524:	68 8c df 00 00       	push   $0xdf8c
    2529:	6a 01                	push   $0x1
    252b:	e8 37 96 00 00       	call   bb67 <printf>
    2530:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2537:	00 00 00 
    253a:	83 c4 20             	add    $0x20,%esp
    253d:	e9 0d 01 00 00       	jmp    264f <test_limiting_cpu_max_and_period+0x33d>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_CPU_MAX, 0), "max - 1000\nperiod - 20000\n"));
    2542:	83 ec 08             	sub    $0x8,%esp
    2545:	6a 00                	push   $0x0
    2547:	68 57 c1 00 00       	push   $0xc157
    254c:	e8 4b dc ff ff       	call   19c <read_file>
    2551:	83 c4 08             	add    $0x8,%esp
    2554:	68 9d c3 00 00       	push   $0xc39d
    2559:	50                   	push   %eax
    255a:	e8 4e 91 00 00       	call   b6ad <strcmp>
    255f:	83 c4 10             	add    $0x10,%esp
    2562:	85 c0                	test   %eax,%eax
    2564:	75 19                	jne    257f <test_limiting_cpu_max_and_period+0x26d>
    2566:	eb 6b                	jmp    25d3 <test_limiting_cpu_max_and_period+0x2c1>
    2568:	83 ec 08             	sub    $0x8,%esp
    256b:	68 3c bf 00 00       	push   $0xbf3c
    2570:	6a 01                	push   $0x1
    2572:	e8 f0 95 00 00       	call   bb67 <printf>
    2577:	83 c3 01             	add    $0x1,%ebx
    257a:	83 c4 10             	add    $0x10,%esp
    257d:	eb 05                	jmp    2584 <test_limiting_cpu_max_and_period+0x272>
    257f:	bb 00 00 00 00       	mov    $0x0,%ebx
    2584:	83 ec 0c             	sub    $0xc,%esp
    2587:	68 e0 df 00 00       	push   $0xdfe0
    258c:	e8 72 91 00 00       	call   b703 <strlen>
    2591:	89 c6                	mov    %eax,%esi
    2593:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    259a:	e8 64 91 00 00       	call   b703 <strlen>
    259f:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    25a3:	83 c4 10             	add    $0x10,%esp
    25a6:	39 d8                	cmp    %ebx,%eax
    25a8:	77 be                	ja     2568 <test_limiting_cpu_max_and_period+0x256>
    25aa:	83 ec 0c             	sub    $0xc,%esp
    25ad:	68 e5 01 00 00       	push   $0x1e5
    25b2:	68 f9 bf 00 00       	push   $0xbff9
    25b7:	57                   	push   %edi
    25b8:	68 28 e0 00 00       	push   $0xe028
    25bd:	6a 01                	push   $0x1
    25bf:	e8 a3 95 00 00       	call   bb67 <printf>
    25c4:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    25cb:	00 00 00 
    25ce:	83 c4 20             	add    $0x20,%esp
    25d1:	eb 7c                	jmp    264f <test_limiting_cpu_max_and_period+0x33d>

    // Disable cpu controller
    ASSERT_TRUE(disable_controller(CPU_CNT));
    25d3:	83 ec 0c             	sub    $0xc,%esp
    25d6:	6a 00                	push   $0x0
    25d8:	e8 d8 dd ff ff       	call   3b5 <disable_controller>
    25dd:	83 c4 10             	add    $0x10,%esp
    25e0:	85 c0                	test   %eax,%eax
    25e2:	74 19                	je     25fd <test_limiting_cpu_max_and_period+0x2eb>
    25e4:	eb 69                	jmp    264f <test_limiting_cpu_max_and_period+0x33d>
    25e6:	83 ec 08             	sub    $0x8,%esp
    25e9:	68 3c bf 00 00       	push   $0xbf3c
    25ee:	6a 01                	push   $0x1
    25f0:	e8 72 95 00 00       	call   bb67 <printf>
    25f5:	83 c3 01             	add    $0x1,%ebx
    25f8:	83 c4 10             	add    $0x10,%esp
    25fb:	eb 05                	jmp    2602 <test_limiting_cpu_max_and_period+0x2f0>
    25fd:	bb 00 00 00 00       	mov    $0x0,%ebx
    2602:	83 ec 0c             	sub    $0xc,%esp
    2605:	68 b8 c3 00 00       	push   $0xc3b8
    260a:	e8 f4 90 00 00       	call   b703 <strlen>
    260f:	89 c6                	mov    %eax,%esi
    2611:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2618:	e8 e6 90 00 00       	call   b703 <strlen>
    261d:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2621:	83 c4 10             	add    $0x10,%esp
    2624:	39 d8                	cmp    %ebx,%eax
    2626:	77 be                	ja     25e6 <test_limiting_cpu_max_and_period+0x2d4>
    2628:	83 ec 0c             	sub    $0xc,%esp
    262b:	68 e8 01 00 00       	push   $0x1e8
    2630:	68 f9 bf 00 00       	push   $0xbff9
    2635:	57                   	push   %edi
    2636:	68 98 e0 00 00       	push   $0xe098
    263b:	6a 01                	push   $0x1
    263d:	e8 25 95 00 00       	call   bb67 <printf>
    2642:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2649:	00 00 00 
    264c:	83 c4 20             	add    $0x20,%esp
}
    264f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2652:	5b                   	pop    %ebx
    2653:	5e                   	pop    %esi
    2654:	5f                   	pop    %edi
    2655:	5d                   	pop    %ebp
    2656:	c3                   	ret    

00002657 <test_limiting_pids>:

TEST(test_limiting_pids)
{
    2657:	55                   	push   %ebp
    2658:	89 e5                	mov    %esp,%ebp
    265a:	56                   	push   %esi
    265b:	53                   	push   %ebx
    // Enable pid controller
    ASSERT_TRUE(enable_controller(PID_CNT));
    265c:	83 ec 0c             	sub    $0xc,%esp
    265f:	6a 01                	push   $0x1
    2661:	e8 fa dc ff ff       	call   360 <enable_controller>
    2666:	83 c4 10             	add    $0x10,%esp
    2669:	85 c0                	test   %eax,%eax
    266b:	74 19                	je     2686 <test_limiting_pids+0x2f>
    266d:	eb 70                	jmp    26df <test_limiting_pids+0x88>
    266f:	83 ec 08             	sub    $0x8,%esp
    2672:	68 3c bf 00 00       	push   $0xbf3c
    2677:	6a 01                	push   $0x1
    2679:	e8 e9 94 00 00       	call   bb67 <printf>
    267e:	83 c3 01             	add    $0x1,%ebx
    2681:	83 c4 10             	add    $0x10,%esp
    2684:	eb 05                	jmp    268b <test_limiting_pids+0x34>
    2686:	bb 00 00 00 00       	mov    $0x0,%ebx
    268b:	83 ec 0c             	sub    $0xc,%esp
    268e:	68 d4 c3 00 00       	push   $0xc3d4
    2693:	e8 6b 90 00 00       	call   b703 <strlen>
    2698:	89 c6                	mov    %eax,%esi
    269a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    26a1:	e8 5d 90 00 00       	call   b703 <strlen>
    26a6:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    26aa:	83 c4 10             	add    $0x10,%esp
    26ad:	39 d8                	cmp    %ebx,%eax
    26af:	77 be                	ja     266f <test_limiting_pids+0x18>
    26b1:	83 ec 0c             	sub    $0xc,%esp
    26b4:	68 ee 01 00 00       	push   $0x1ee
    26b9:	68 f9 bf 00 00       	push   $0xbff9
    26be:	ff 75 08             	pushl  0x8(%ebp)
    26c1:	68 e0 e0 00 00       	push   $0xe0e0
    26c6:	6a 01                	push   $0x1
    26c8:	e8 9a 94 00 00       	call   bb67 <printf>
    26cd:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    26d4:	00 00 00 
    26d7:	83 c4 20             	add    $0x20,%esp
    26da:	e9 3d 02 00 00       	jmp    291c <test_limiting_pids+0x2c5>

    // Update pid limit
    ASSERT_TRUE(write_file(TEST_1_PID_MAX, "10"));
    26df:	83 ec 08             	sub    $0x8,%esp
    26e2:	68 ef c3 00 00       	push   $0xc3ef
    26e7:	68 9d c1 00 00       	push   $0xc19d
    26ec:	e8 5d db ff ff       	call   24e <write_file>
    26f1:	83 c4 10             	add    $0x10,%esp
    26f4:	85 c0                	test   %eax,%eax
    26f6:	74 19                	je     2711 <test_limiting_pids+0xba>
    26f8:	eb 70                	jmp    276a <test_limiting_pids+0x113>
    26fa:	83 ec 08             	sub    $0x8,%esp
    26fd:	68 3c bf 00 00       	push   $0xbf3c
    2702:	6a 01                	push   $0x1
    2704:	e8 5e 94 00 00       	call   bb67 <printf>
    2709:	83 c3 01             	add    $0x1,%ebx
    270c:	83 c4 10             	add    $0x10,%esp
    270f:	eb 05                	jmp    2716 <test_limiting_pids+0xbf>
    2711:	bb 00 00 00 00       	mov    $0x0,%ebx
    2716:	83 ec 0c             	sub    $0xc,%esp
    2719:	68 24 e1 00 00       	push   $0xe124
    271e:	e8 e0 8f 00 00       	call   b703 <strlen>
    2723:	89 c6                	mov    %eax,%esi
    2725:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    272c:	e8 d2 8f 00 00       	call   b703 <strlen>
    2731:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2735:	83 c4 10             	add    $0x10,%esp
    2738:	39 d8                	cmp    %ebx,%eax
    273a:	77 be                	ja     26fa <test_limiting_pids+0xa3>
    273c:	83 ec 0c             	sub    $0xc,%esp
    273f:	68 f1 01 00 00       	push   $0x1f1
    2744:	68 f9 bf 00 00       	push   $0xbff9
    2749:	ff 75 08             	pushl  0x8(%ebp)
    274c:	68 48 e1 00 00       	push   $0xe148
    2751:	6a 01                	push   $0x1
    2753:	e8 0f 94 00 00       	call   bb67 <printf>
    2758:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    275f:	00 00 00 
    2762:	83 c4 20             	add    $0x20,%esp
    2765:	e9 b2 01 00 00       	jmp    291c <test_limiting_pids+0x2c5>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_PID_MAX, 0), "max - 10\n"));
    276a:	83 ec 08             	sub    $0x8,%esp
    276d:	6a 00                	push   $0x0
    276f:	68 9d c1 00 00       	push   $0xc19d
    2774:	e8 23 da ff ff       	call   19c <read_file>
    2779:	83 c4 08             	add    $0x8,%esp
    277c:	68 f2 c3 00 00       	push   $0xc3f2
    2781:	50                   	push   %eax
    2782:	e8 26 8f 00 00       	call   b6ad <strcmp>
    2787:	83 c4 10             	add    $0x10,%esp
    278a:	85 c0                	test   %eax,%eax
    278c:	75 19                	jne    27a7 <test_limiting_pids+0x150>
    278e:	eb 70                	jmp    2800 <test_limiting_pids+0x1a9>
    2790:	83 ec 08             	sub    $0x8,%esp
    2793:	68 3c bf 00 00       	push   $0xbf3c
    2798:	6a 01                	push   $0x1
    279a:	e8 c8 93 00 00       	call   bb67 <printf>
    279f:	83 c3 01             	add    $0x1,%ebx
    27a2:	83 c4 10             	add    $0x10,%esp
    27a5:	eb 05                	jmp    27ac <test_limiting_pids+0x155>
    27a7:	bb 00 00 00 00       	mov    $0x0,%ebx
    27ac:	83 ec 0c             	sub    $0xc,%esp
    27af:	68 94 e1 00 00       	push   $0xe194
    27b4:	e8 4a 8f 00 00       	call   b703 <strlen>
    27b9:	89 c6                	mov    %eax,%esi
    27bb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    27c2:	e8 3c 8f 00 00       	call   b703 <strlen>
    27c7:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    27cb:	83 c4 10             	add    $0x10,%esp
    27ce:	39 d8                	cmp    %ebx,%eax
    27d0:	77 be                	ja     2790 <test_limiting_pids+0x139>
    27d2:	83 ec 0c             	sub    $0xc,%esp
    27d5:	68 f4 01 00 00       	push   $0x1f4
    27da:	68 f9 bf 00 00       	push   $0xbff9
    27df:	ff 75 08             	pushl  0x8(%ebp)
    27e2:	68 c8 e1 00 00       	push   $0xe1c8
    27e7:	6a 01                	push   $0x1
    27e9:	e8 79 93 00 00       	call   bb67 <printf>
    27ee:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    27f5:	00 00 00 
    27f8:	83 c4 20             	add    $0x20,%esp
    27fb:	e9 1c 01 00 00       	jmp    291c <test_limiting_pids+0x2c5>

    // Restore to 64
    ASSERT_TRUE(write_file(TEST_1_PID_MAX, "64"));
    2800:	83 ec 08             	sub    $0x8,%esp
    2803:	68 fc c3 00 00       	push   $0xc3fc
    2808:	68 9d c1 00 00       	push   $0xc19d
    280d:	e8 3c da ff ff       	call   24e <write_file>
    2812:	83 c4 10             	add    $0x10,%esp
    2815:	85 c0                	test   %eax,%eax
    2817:	74 19                	je     2832 <test_limiting_pids+0x1db>
    2819:	eb 70                	jmp    288b <test_limiting_pids+0x234>
    281b:	83 ec 08             	sub    $0x8,%esp
    281e:	68 3c bf 00 00       	push   $0xbf3c
    2823:	6a 01                	push   $0x1
    2825:	e8 3d 93 00 00       	call   bb67 <printf>
    282a:	83 c3 01             	add    $0x1,%ebx
    282d:	83 c4 10             	add    $0x10,%esp
    2830:	eb 05                	jmp    2837 <test_limiting_pids+0x1e0>
    2832:	bb 00 00 00 00       	mov    $0x0,%ebx
    2837:	83 ec 0c             	sub    $0xc,%esp
    283a:	68 24 e2 00 00       	push   $0xe224
    283f:	e8 bf 8e 00 00       	call   b703 <strlen>
    2844:	89 c6                	mov    %eax,%esi
    2846:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    284d:	e8 b1 8e 00 00       	call   b703 <strlen>
    2852:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2856:	83 c4 10             	add    $0x10,%esp
    2859:	39 d8                	cmp    %ebx,%eax
    285b:	77 be                	ja     281b <test_limiting_pids+0x1c4>
    285d:	83 ec 0c             	sub    $0xc,%esp
    2860:	68 f7 01 00 00       	push   $0x1f7
    2865:	68 f9 bf 00 00       	push   $0xbff9
    286a:	ff 75 08             	pushl  0x8(%ebp)
    286d:	68 48 e2 00 00       	push   $0xe248
    2872:	6a 01                	push   $0x1
    2874:	e8 ee 92 00 00       	call   bb67 <printf>
    2879:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2880:	00 00 00 
    2883:	83 c4 20             	add    $0x20,%esp
    2886:	e9 91 00 00 00       	jmp    291c <test_limiting_pids+0x2c5>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_PID_MAX, 0), "max - 64\n"));
    288b:	83 ec 08             	sub    $0x8,%esp
    288e:	6a 00                	push   $0x0
    2890:	68 9d c1 00 00       	push   $0xc19d
    2895:	e8 02 d9 ff ff       	call   19c <read_file>
    289a:	83 c4 08             	add    $0x8,%esp
    289d:	68 ff c3 00 00       	push   $0xc3ff
    28a2:	50                   	push   %eax
    28a3:	e8 05 8e 00 00       	call   b6ad <strcmp>
    28a8:	83 c4 10             	add    $0x10,%esp
    28ab:	85 c0                	test   %eax,%eax
    28ad:	75 19                	jne    28c8 <test_limiting_pids+0x271>
    28af:	eb 6b                	jmp    291c <test_limiting_pids+0x2c5>
    28b1:	83 ec 08             	sub    $0x8,%esp
    28b4:	68 3c bf 00 00       	push   $0xbf3c
    28b9:	6a 01                	push   $0x1
    28bb:	e8 a7 92 00 00       	call   bb67 <printf>
    28c0:	83 c3 01             	add    $0x1,%ebx
    28c3:	83 c4 10             	add    $0x10,%esp
    28c6:	eb 05                	jmp    28cd <test_limiting_pids+0x276>
    28c8:	bb 00 00 00 00       	mov    $0x0,%ebx
    28cd:	83 ec 0c             	sub    $0xc,%esp
    28d0:	68 94 e2 00 00       	push   $0xe294
    28d5:	e8 29 8e 00 00       	call   b703 <strlen>
    28da:	89 c6                	mov    %eax,%esi
    28dc:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    28e3:	e8 1b 8e 00 00       	call   b703 <strlen>
    28e8:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    28ec:	83 c4 10             	add    $0x10,%esp
    28ef:	39 d8                	cmp    %ebx,%eax
    28f1:	77 be                	ja     28b1 <test_limiting_pids+0x25a>
    28f3:	83 ec 0c             	sub    $0xc,%esp
    28f6:	68 fa 01 00 00       	push   $0x1fa
    28fb:	68 f9 bf 00 00       	push   $0xbff9
    2900:	ff 75 08             	pushl  0x8(%ebp)
    2903:	68 c8 e2 00 00       	push   $0xe2c8
    2908:	6a 01                	push   $0x1
    290a:	e8 58 92 00 00       	call   bb67 <printf>
    290f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2916:	00 00 00 
    2919:	83 c4 20             	add    $0x20,%esp
}
    291c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    291f:	5b                   	pop    %ebx
    2920:	5e                   	pop    %esi
    2921:	5d                   	pop    %ebp
    2922:	c3                   	ret    

00002923 <test_move_failure>:

TEST(test_move_failure)
{
    2923:	55                   	push   %ebp
    2924:	89 e5                	mov    %esp,%ebp
    2926:	57                   	push   %edi
    2927:	56                   	push   %esi
    2928:	53                   	push   %ebx
    2929:	83 ec 18             	sub    $0x18,%esp
    292c:	8b 7d 08             	mov    0x8(%ebp),%edi
    // Enable pid controller
    ASSERT_TRUE(enable_controller(PID_CNT));
    292f:	6a 01                	push   $0x1
    2931:	e8 2a da ff ff       	call   360 <enable_controller>
    2936:	83 c4 10             	add    $0x10,%esp
    2939:	85 c0                	test   %eax,%eax
    293b:	74 19                	je     2956 <test_move_failure+0x33>
    293d:	eb 6e                	jmp    29ad <test_move_failure+0x8a>
    293f:	83 ec 08             	sub    $0x8,%esp
    2942:	68 3c bf 00 00       	push   $0xbf3c
    2947:	6a 01                	push   $0x1
    2949:	e8 19 92 00 00       	call   bb67 <printf>
    294e:	83 c3 01             	add    $0x1,%ebx
    2951:	83 c4 10             	add    $0x10,%esp
    2954:	eb 05                	jmp    295b <test_move_failure+0x38>
    2956:	bb 00 00 00 00       	mov    $0x0,%ebx
    295b:	83 ec 0c             	sub    $0xc,%esp
    295e:	68 d4 c3 00 00       	push   $0xc3d4
    2963:	e8 9b 8d 00 00       	call   b703 <strlen>
    2968:	89 c6                	mov    %eax,%esi
    296a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2971:	e8 8d 8d 00 00       	call   b703 <strlen>
    2976:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    297a:	83 c4 10             	add    $0x10,%esp
    297d:	39 d8                	cmp    %ebx,%eax
    297f:	77 be                	ja     293f <test_move_failure+0x1c>
    2981:	83 ec 0c             	sub    $0xc,%esp
    2984:	68 00 02 00 00       	push   $0x200
    2989:	68 f9 bf 00 00       	push   $0xbff9
    298e:	57                   	push   %edi
    298f:	68 e0 e0 00 00       	push   $0xe0e0
    2994:	6a 01                	push   $0x1
    2996:	e8 cc 91 00 00       	call   bb67 <printf>
    299b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    29a2:	00 00 00 
    29a5:	83 c4 20             	add    $0x20,%esp
    29a8:	e9 a0 02 00 00       	jmp    2c4d <test_move_failure+0x32a>

    // Update pid limit
    ASSERT_TRUE(write_file(TEST_1_PID_MAX, "0"));
    29ad:	83 ec 08             	sub    $0x8,%esp
    29b0:	68 9b c3 00 00       	push   $0xc39b
    29b5:	68 9d c1 00 00       	push   $0xc19d
    29ba:	e8 8f d8 ff ff       	call   24e <write_file>
    29bf:	83 c4 10             	add    $0x10,%esp
    29c2:	85 c0                	test   %eax,%eax
    29c4:	74 19                	je     29df <test_move_failure+0xbc>
    29c6:	eb 6e                	jmp    2a36 <test_move_failure+0x113>
    29c8:	83 ec 08             	sub    $0x8,%esp
    29cb:	68 3c bf 00 00       	push   $0xbf3c
    29d0:	6a 01                	push   $0x1
    29d2:	e8 90 91 00 00       	call   bb67 <printf>
    29d7:	83 c3 01             	add    $0x1,%ebx
    29da:	83 c4 10             	add    $0x10,%esp
    29dd:	eb 05                	jmp    29e4 <test_move_failure+0xc1>
    29df:	bb 00 00 00 00       	mov    $0x0,%ebx
    29e4:	83 ec 0c             	sub    $0xc,%esp
    29e7:	68 24 e3 00 00       	push   $0xe324
    29ec:	e8 12 8d 00 00       	call   b703 <strlen>
    29f1:	89 c6                	mov    %eax,%esi
    29f3:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    29fa:	e8 04 8d 00 00       	call   b703 <strlen>
    29ff:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2a03:	83 c4 10             	add    $0x10,%esp
    2a06:	39 d8                	cmp    %ebx,%eax
    2a08:	77 be                	ja     29c8 <test_move_failure+0xa5>
    2a0a:	83 ec 0c             	sub    $0xc,%esp
    2a0d:	68 03 02 00 00       	push   $0x203
    2a12:	68 f9 bf 00 00       	push   $0xbff9
    2a17:	57                   	push   %edi
    2a18:	68 44 e3 00 00       	push   $0xe344
    2a1d:	6a 01                	push   $0x1
    2a1f:	e8 43 91 00 00       	call   bb67 <printf>
    2a24:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2a2b:	00 00 00 
    2a2e:	83 c4 20             	add    $0x20,%esp
    2a31:	e9 17 02 00 00       	jmp    2c4d <test_move_failure+0x32a>

    // Attempt to move the current process to "/cgroup/test1" cgroup.
    // Notice write here should fail, and so we suppress error outputs from this point.
    ASSERT_FALSE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    2a36:	e8 bb 8f 00 00       	call   b9f6 <getpid>
    2a3b:	83 ec 08             	sub    $0x8,%esp
    2a3e:	50                   	push   %eax
    2a3f:	68 06 c1 00 00       	push   $0xc106
    2a44:	e8 ee da ff ff       	call   537 <move_proc>
    2a49:	83 c4 10             	add    $0x10,%esp
    2a4c:	85 c0                	test   %eax,%eax
    2a4e:	75 19                	jne    2a69 <test_move_failure+0x146>
    2a50:	eb 6e                	jmp    2ac0 <test_move_failure+0x19d>
    2a52:	83 ec 08             	sub    $0x8,%esp
    2a55:	68 3c bf 00 00       	push   $0xbf3c
    2a5a:	6a 01                	push   $0x1
    2a5c:	e8 06 91 00 00       	call   bb67 <printf>
    2a61:	83 c3 01             	add    $0x1,%ebx
    2a64:	83 c4 10             	add    $0x10,%esp
    2a67:	eb 05                	jmp    2a6e <test_move_failure+0x14b>
    2a69:	bb 00 00 00 00       	mov    $0x0,%ebx
    2a6e:	83 ec 0c             	sub    $0xc,%esp
    2a71:	68 90 e3 00 00       	push   $0xe390
    2a76:	e8 88 8c 00 00       	call   b703 <strlen>
    2a7b:	89 c6                	mov    %eax,%esi
    2a7d:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2a84:	e8 7a 8c 00 00       	call   b703 <strlen>
    2a89:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2a8d:	83 c4 10             	add    $0x10,%esp
    2a90:	39 d8                	cmp    %ebx,%eax
    2a92:	77 be                	ja     2a52 <test_move_failure+0x12f>
    2a94:	83 ec 0c             	sub    $0xc,%esp
    2a97:	68 07 02 00 00       	push   $0x207
    2a9c:	68 f9 bf 00 00       	push   $0xbff9
    2aa1:	57                   	push   %edi
    2aa2:	68 bc e3 00 00       	push   $0xe3bc
    2aa7:	6a 01                	push   $0x1
    2aa9:	e8 b9 90 00 00       	call   bb67 <printf>
    2aae:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2ab5:	00 00 00 
    2ab8:	83 c4 20             	add    $0x20,%esp
    2abb:	e9 8d 01 00 00       	jmp    2c4d <test_move_failure+0x32a>

    // Check that the process we moved is not in "/cgroup/test1" cgroup.
    // Notice this should fail.
    ASSERT_FALSE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    2ac0:	e8 31 8f 00 00       	call   b9f6 <getpid>
    2ac5:	83 ec 08             	sub    $0x8,%esp
    2ac8:	50                   	push   %eax
    2ac9:	68 06 c1 00 00       	push   $0xc106
    2ace:	e8 97 da ff ff       	call   56a <is_pid_in_group>
    2ad3:	83 c4 10             	add    $0x10,%esp
    2ad6:	85 c0                	test   %eax,%eax
    2ad8:	75 19                	jne    2af3 <test_move_failure+0x1d0>
    2ada:	eb 6e                	jmp    2b4a <test_move_failure+0x227>
    2adc:	83 ec 08             	sub    $0x8,%esp
    2adf:	68 3c bf 00 00       	push   $0xbf3c
    2ae4:	6a 01                	push   $0x1
    2ae6:	e8 7c 90 00 00       	call   bb67 <printf>
    2aeb:	83 c3 01             	add    $0x1,%ebx
    2aee:	83 c4 10             	add    $0x10,%esp
    2af1:	eb 05                	jmp    2af8 <test_move_failure+0x1d5>
    2af3:	bb 00 00 00 00       	mov    $0x0,%ebx
    2af8:	83 ec 0c             	sub    $0xc,%esp
    2afb:	68 10 e4 00 00       	push   $0xe410
    2b00:	e8 fe 8b 00 00       	call   b703 <strlen>
    2b05:	89 c6                	mov    %eax,%esi
    2b07:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2b0e:	e8 f0 8b 00 00       	call   b703 <strlen>
    2b13:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2b17:	83 c4 10             	add    $0x10,%esp
    2b1a:	39 d8                	cmp    %ebx,%eax
    2b1c:	77 be                	ja     2adc <test_move_failure+0x1b9>
    2b1e:	83 ec 0c             	sub    $0xc,%esp
    2b21:	68 0b 02 00 00       	push   $0x20b
    2b26:	68 f9 bf 00 00       	push   $0xbff9
    2b2b:	57                   	push   %edi
    2b2c:	68 40 e4 00 00       	push   $0xe440
    2b31:	6a 01                	push   $0x1
    2b33:	e8 2f 90 00 00       	call   bb67 <printf>
    2b38:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2b3f:	00 00 00 
    2b42:	83 c4 20             	add    $0x20,%esp
    2b45:	e9 03 01 00 00       	jmp    2c4d <test_move_failure+0x32a>

    // Check that the process is still in root cgroup.
    ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    2b4a:	e8 a7 8e 00 00       	call   b9f6 <getpid>
    2b4f:	83 ec 08             	sub    $0x8,%esp
    2b52:	50                   	push   %eax
    2b53:	68 09 c4 00 00       	push   $0xc409
    2b58:	e8 0d da ff ff       	call   56a <is_pid_in_group>
    2b5d:	83 c4 10             	add    $0x10,%esp
    2b60:	85 c0                	test   %eax,%eax
    2b62:	74 19                	je     2b7d <test_move_failure+0x25a>
    2b64:	eb 6b                	jmp    2bd1 <test_move_failure+0x2ae>
    2b66:	83 ec 08             	sub    $0x8,%esp
    2b69:	68 3c bf 00 00       	push   $0xbf3c
    2b6e:	6a 01                	push   $0x1
    2b70:	e8 f2 8f 00 00       	call   bb67 <printf>
    2b75:	83 c3 01             	add    $0x1,%ebx
    2b78:	83 c4 10             	add    $0x10,%esp
    2b7b:	eb 05                	jmp    2b82 <test_move_failure+0x25f>
    2b7d:	bb 00 00 00 00       	mov    $0x0,%ebx
    2b82:	83 ec 0c             	sub    $0xc,%esp
    2b85:	68 98 e4 00 00       	push   $0xe498
    2b8a:	e8 74 8b 00 00       	call   b703 <strlen>
    2b8f:	89 c6                	mov    %eax,%esi
    2b91:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2b98:	e8 66 8b 00 00       	call   b703 <strlen>
    2b9d:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2ba1:	83 c4 10             	add    $0x10,%esp
    2ba4:	39 d8                	cmp    %ebx,%eax
    2ba6:	77 be                	ja     2b66 <test_move_failure+0x243>
    2ba8:	83 ec 0c             	sub    $0xc,%esp
    2bab:	68 0e 02 00 00       	push   $0x20e
    2bb0:	68 f9 bf 00 00       	push   $0xbff9
    2bb5:	57                   	push   %edi
    2bb6:	68 c8 e4 00 00       	push   $0xe4c8
    2bbb:	6a 01                	push   $0x1
    2bbd:	e8 a5 8f 00 00       	call   bb67 <printf>
    2bc2:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2bc9:	00 00 00 
    2bcc:	83 c4 20             	add    $0x20,%esp
    2bcf:	eb 7c                	jmp    2c4d <test_move_failure+0x32a>

    // Disable PID controller
    ASSERT_TRUE(disable_controller(PID_CNT));
    2bd1:	83 ec 0c             	sub    $0xc,%esp
    2bd4:	6a 01                	push   $0x1
    2bd6:	e8 da d7 ff ff       	call   3b5 <disable_controller>
    2bdb:	83 c4 10             	add    $0x10,%esp
    2bde:	85 c0                	test   %eax,%eax
    2be0:	74 19                	je     2bfb <test_move_failure+0x2d8>
    2be2:	eb 69                	jmp    2c4d <test_move_failure+0x32a>
    2be4:	83 ec 08             	sub    $0x8,%esp
    2be7:	68 3c bf 00 00       	push   $0xbf3c
    2bec:	6a 01                	push   $0x1
    2bee:	e8 74 8f 00 00       	call   bb67 <printf>
    2bf3:	83 c3 01             	add    $0x1,%ebx
    2bf6:	83 c4 10             	add    $0x10,%esp
    2bf9:	eb 05                	jmp    2c00 <test_move_failure+0x2dd>
    2bfb:	bb 00 00 00 00       	mov    $0x0,%ebx
    2c00:	83 ec 0c             	sub    $0xc,%esp
    2c03:	68 1e c4 00 00       	push   $0xc41e
    2c08:	e8 f6 8a 00 00       	call   b703 <strlen>
    2c0d:	89 c6                	mov    %eax,%esi
    2c0f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2c16:	e8 e8 8a 00 00       	call   b703 <strlen>
    2c1b:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    2c1f:	83 c4 10             	add    $0x10,%esp
    2c22:	39 d8                	cmp    %ebx,%eax
    2c24:	77 be                	ja     2be4 <test_move_failure+0x2c1>
    2c26:	83 ec 0c             	sub    $0xc,%esp
    2c29:	68 11 02 00 00       	push   $0x211
    2c2e:	68 f9 bf 00 00       	push   $0xbff9
    2c33:	57                   	push   %edi
    2c34:	68 20 e5 00 00       	push   $0xe520
    2c39:	6a 01                	push   $0x1
    2c3b:	e8 27 8f 00 00       	call   bb67 <printf>
    2c40:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2c47:	00 00 00 
    2c4a:	83 c4 20             	add    $0x20,%esp
}
    2c4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2c50:	5b                   	pop    %ebx
    2c51:	5e                   	pop    %esi
    2c52:	5f                   	pop    %edi
    2c53:	5d                   	pop    %ebp
    2c54:	c3                   	ret    

00002c55 <test_fork_failure>:

TEST(test_fork_failure)
{
    2c55:	55                   	push   %ebp
    2c56:	89 e5                	mov    %esp,%ebp
    2c58:	57                   	push   %edi
    2c59:	56                   	push   %esi
    2c5a:	53                   	push   %ebx
    2c5b:	83 ec 18             	sub    $0x18,%esp
    2c5e:	8b 75 08             	mov    0x8(%ebp),%esi
    // Enable pid controller
    ASSERT_TRUE(enable_controller(PID_CNT));
    2c61:	6a 01                	push   $0x1
    2c63:	e8 f8 d6 ff ff       	call   360 <enable_controller>
    2c68:	83 c4 10             	add    $0x10,%esp
    2c6b:	85 c0                	test   %eax,%eax
    2c6d:	74 19                	je     2c88 <test_fork_failure+0x33>
    2c6f:	eb 6e                	jmp    2cdf <test_fork_failure+0x8a>
    2c71:	83 ec 08             	sub    $0x8,%esp
    2c74:	68 3c bf 00 00       	push   $0xbf3c
    2c79:	6a 01                	push   $0x1
    2c7b:	e8 e7 8e 00 00       	call   bb67 <printf>
    2c80:	83 c3 01             	add    $0x1,%ebx
    2c83:	83 c4 10             	add    $0x10,%esp
    2c86:	eb 05                	jmp    2c8d <test_fork_failure+0x38>
    2c88:	bb 00 00 00 00       	mov    $0x0,%ebx
    2c8d:	83 ec 0c             	sub    $0xc,%esp
    2c90:	68 d4 c3 00 00       	push   $0xc3d4
    2c95:	e8 69 8a 00 00       	call   b703 <strlen>
    2c9a:	89 c7                	mov    %eax,%edi
    2c9c:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2ca3:	e8 5b 8a 00 00       	call   b703 <strlen>
    2ca8:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    2cac:	83 c4 10             	add    $0x10,%esp
    2caf:	39 d8                	cmp    %ebx,%eax
    2cb1:	77 be                	ja     2c71 <test_fork_failure+0x1c>
    2cb3:	83 ec 0c             	sub    $0xc,%esp
    2cb6:	68 17 02 00 00       	push   $0x217
    2cbb:	68 f9 bf 00 00       	push   $0xbff9
    2cc0:	56                   	push   %esi
    2cc1:	68 e0 e0 00 00       	push   $0xe0e0
    2cc6:	6a 01                	push   $0x1
    2cc8:	e8 9a 8e 00 00       	call   bb67 <printf>
    2ccd:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2cd4:	00 00 00 
    2cd7:	83 c4 20             	add    $0x20,%esp
    2cda:	e9 61 03 00 00       	jmp    3040 <test_fork_failure+0x3eb>

    // Update pid limit
    ASSERT_TRUE(write_file(TEST_1_PID_MAX, "1"));
    2cdf:	83 ec 08             	sub    $0x8,%esp
    2ce2:	68 37 c6 00 00       	push   $0xc637
    2ce7:	68 9d c1 00 00       	push   $0xc19d
    2cec:	e8 5d d5 ff ff       	call   24e <write_file>
    2cf1:	83 c4 10             	add    $0x10,%esp
    2cf4:	85 c0                	test   %eax,%eax
    2cf6:	74 19                	je     2d11 <test_fork_failure+0xbc>
    2cf8:	eb 6e                	jmp    2d68 <test_fork_failure+0x113>
    2cfa:	83 ec 08             	sub    $0x8,%esp
    2cfd:	68 3c bf 00 00       	push   $0xbf3c
    2d02:	6a 01                	push   $0x1
    2d04:	e8 5e 8e 00 00       	call   bb67 <printf>
    2d09:	83 c3 01             	add    $0x1,%ebx
    2d0c:	83 c4 10             	add    $0x10,%esp
    2d0f:	eb 05                	jmp    2d16 <test_fork_failure+0xc1>
    2d11:	bb 00 00 00 00       	mov    $0x0,%ebx
    2d16:	83 ec 0c             	sub    $0xc,%esp
    2d19:	68 68 e5 00 00       	push   $0xe568
    2d1e:	e8 e0 89 00 00       	call   b703 <strlen>
    2d23:	89 c7                	mov    %eax,%edi
    2d25:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2d2c:	e8 d2 89 00 00       	call   b703 <strlen>
    2d31:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    2d35:	83 c4 10             	add    $0x10,%esp
    2d38:	39 d8                	cmp    %ebx,%eax
    2d3a:	77 be                	ja     2cfa <test_fork_failure+0xa5>
    2d3c:	83 ec 0c             	sub    $0xc,%esp
    2d3f:	68 1a 02 00 00       	push   $0x21a
    2d44:	68 f9 bf 00 00       	push   $0xbff9
    2d49:	56                   	push   %esi
    2d4a:	68 88 e5 00 00       	push   $0xe588
    2d4f:	6a 01                	push   $0x1
    2d51:	e8 11 8e 00 00       	call   bb67 <printf>
    2d56:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2d5d:	00 00 00 
    2d60:	83 c4 20             	add    $0x20,%esp
    2d63:	e9 d8 02 00 00       	jmp    3040 <test_fork_failure+0x3eb>

    // Move the current process to "/cgroup/test1" cgroup.
    ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    2d68:	e8 89 8c 00 00       	call   b9f6 <getpid>
    2d6d:	83 ec 08             	sub    $0x8,%esp
    2d70:	50                   	push   %eax
    2d71:	68 06 c1 00 00       	push   $0xc106
    2d76:	e8 bc d7 ff ff       	call   537 <move_proc>
    2d7b:	83 c4 10             	add    $0x10,%esp
    2d7e:	85 c0                	test   %eax,%eax
    2d80:	74 19                	je     2d9b <test_fork_failure+0x146>
    2d82:	eb 6e                	jmp    2df2 <test_fork_failure+0x19d>
    2d84:	83 ec 08             	sub    $0x8,%esp
    2d87:	68 3c bf 00 00       	push   $0xbf3c
    2d8c:	6a 01                	push   $0x1
    2d8e:	e8 d4 8d 00 00       	call   bb67 <printf>
    2d93:	83 c3 01             	add    $0x1,%ebx
    2d96:	83 c4 10             	add    $0x10,%esp
    2d99:	eb 05                	jmp    2da0 <test_fork_failure+0x14b>
    2d9b:	bb 00 00 00 00       	mov    $0x0,%ebx
    2da0:	83 ec 0c             	sub    $0xc,%esp
    2da3:	68 90 e3 00 00       	push   $0xe390
    2da8:	e8 56 89 00 00       	call   b703 <strlen>
    2dad:	89 c7                	mov    %eax,%edi
    2daf:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2db6:	e8 48 89 00 00       	call   b703 <strlen>
    2dbb:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    2dbf:	83 c4 10             	add    $0x10,%esp
    2dc2:	39 d8                	cmp    %ebx,%eax
    2dc4:	77 be                	ja     2d84 <test_fork_failure+0x12f>
    2dc6:	83 ec 0c             	sub    $0xc,%esp
    2dc9:	68 1d 02 00 00       	push   $0x21d
    2dce:	68 f9 bf 00 00       	push   $0xbff9
    2dd3:	56                   	push   %esi
    2dd4:	68 d4 e5 00 00       	push   $0xe5d4
    2dd9:	6a 01                	push   $0x1
    2ddb:	e8 87 8d 00 00       	call   bb67 <printf>
    2de0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2de7:	00 00 00 
    2dea:	83 c4 20             	add    $0x20,%esp
    2ded:	e9 4e 02 00 00       	jmp    3040 <test_fork_failure+0x3eb>

    // Check that the process we moved is really in "/cgroup/test1" cgroup.
    ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    2df2:	e8 ff 8b 00 00       	call   b9f6 <getpid>
    2df7:	83 ec 08             	sub    $0x8,%esp
    2dfa:	50                   	push   %eax
    2dfb:	68 06 c1 00 00       	push   $0xc106
    2e00:	e8 65 d7 ff ff       	call   56a <is_pid_in_group>
    2e05:	83 c4 10             	add    $0x10,%esp
    2e08:	85 c0                	test   %eax,%eax
    2e0a:	74 19                	je     2e25 <test_fork_failure+0x1d0>
    2e0c:	eb 6e                	jmp    2e7c <test_fork_failure+0x227>
    2e0e:	83 ec 08             	sub    $0x8,%esp
    2e11:	68 3c bf 00 00       	push   $0xbf3c
    2e16:	6a 01                	push   $0x1
    2e18:	e8 4a 8d 00 00       	call   bb67 <printf>
    2e1d:	83 c3 01             	add    $0x1,%ebx
    2e20:	83 c4 10             	add    $0x10,%esp
    2e23:	eb 05                	jmp    2e2a <test_fork_failure+0x1d5>
    2e25:	bb 00 00 00 00       	mov    $0x0,%ebx
    2e2a:	83 ec 0c             	sub    $0xc,%esp
    2e2d:	68 10 e4 00 00       	push   $0xe410
    2e32:	e8 cc 88 00 00       	call   b703 <strlen>
    2e37:	89 c7                	mov    %eax,%edi
    2e39:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2e40:	e8 be 88 00 00       	call   b703 <strlen>
    2e45:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    2e49:	83 c4 10             	add    $0x10,%esp
    2e4c:	39 d8                	cmp    %ebx,%eax
    2e4e:	77 be                	ja     2e0e <test_fork_failure+0x1b9>
    2e50:	83 ec 0c             	sub    $0xc,%esp
    2e53:	68 20 02 00 00       	push   $0x220
    2e58:	68 f9 bf 00 00       	push   $0xbff9
    2e5d:	56                   	push   %esi
    2e5e:	68 28 e6 00 00       	push   $0xe628
    2e63:	6a 01                	push   $0x1
    2e65:	e8 fd 8c 00 00       	call   bb67 <printf>
    2e6a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2e71:	00 00 00 
    2e74:	83 c4 20             	add    $0x20,%esp
    2e77:	e9 c4 01 00 00       	jmp    3040 <test_fork_failure+0x3eb>

    // Attempt to fork, notice this operation should fail and return -1.
    ASSERT_UINT_EQ(fork(), -1);
    2e7c:	e8 ed 8a 00 00       	call   b96e <fork>
    2e81:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e84:	74 2d                	je     2eb3 <test_fork_failure+0x25e>
    2e86:	e8 e3 8a 00 00       	call   b96e <fork>
    2e8b:	83 ec 0c             	sub    $0xc,%esp
    2e8e:	68 23 02 00 00       	push   $0x223
    2e93:	68 f9 bf 00 00       	push   $0xbff9
    2e98:	6a ff                	push   $0xffffffff
    2e9a:	50                   	push   %eax
    2e9b:	56                   	push   %esi
    2e9c:	e8 73 d1 ff ff       	call   14 <print_error>
    2ea1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2ea8:	00 00 00 
    2eab:	83 c4 20             	add    $0x20,%esp
    2eae:	e9 8d 01 00 00       	jmp    3040 <test_fork_failure+0x3eb>

    // Return the process to root cgroup.
    ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    2eb3:	e8 3e 8b 00 00       	call   b9f6 <getpid>
    2eb8:	83 ec 08             	sub    $0x8,%esp
    2ebb:	50                   	push   %eax
    2ebc:	68 09 c4 00 00       	push   $0xc409
    2ec1:	e8 71 d6 ff ff       	call   537 <move_proc>
    2ec6:	83 c4 10             	add    $0x10,%esp
    2ec9:	85 c0                	test   %eax,%eax
    2ecb:	74 19                	je     2ee6 <test_fork_failure+0x291>
    2ecd:	eb 6e                	jmp    2f3d <test_fork_failure+0x2e8>
    2ecf:	83 ec 08             	sub    $0x8,%esp
    2ed2:	68 3c bf 00 00       	push   $0xbf3c
    2ed7:	6a 01                	push   $0x1
    2ed9:	e8 89 8c 00 00       	call   bb67 <printf>
    2ede:	83 c3 01             	add    $0x1,%ebx
    2ee1:	83 c4 10             	add    $0x10,%esp
    2ee4:	eb 05                	jmp    2eeb <test_fork_failure+0x296>
    2ee6:	bb 00 00 00 00       	mov    $0x0,%ebx
    2eeb:	83 ec 0c             	sub    $0xc,%esp
    2eee:	68 80 e6 00 00       	push   $0xe680
    2ef3:	e8 0b 88 00 00       	call   b703 <strlen>
    2ef8:	89 c7                	mov    %eax,%edi
    2efa:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2f01:	e8 fd 87 00 00       	call   b703 <strlen>
    2f06:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    2f0a:	83 c4 10             	add    $0x10,%esp
    2f0d:	39 d8                	cmp    %ebx,%eax
    2f0f:	77 be                	ja     2ecf <test_fork_failure+0x27a>
    2f11:	83 ec 0c             	sub    $0xc,%esp
    2f14:	68 26 02 00 00       	push   $0x226
    2f19:	68 f9 bf 00 00       	push   $0xbff9
    2f1e:	56                   	push   %esi
    2f1f:	68 a8 e6 00 00       	push   $0xe6a8
    2f24:	6a 01                	push   $0x1
    2f26:	e8 3c 8c 00 00       	call   bb67 <printf>
    2f2b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2f32:	00 00 00 
    2f35:	83 c4 20             	add    $0x20,%esp
    2f38:	e9 03 01 00 00       	jmp    3040 <test_fork_failure+0x3eb>

    // Check that the process we returned is really in root cgroup.
    ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    2f3d:	e8 b4 8a 00 00       	call   b9f6 <getpid>
    2f42:	83 ec 08             	sub    $0x8,%esp
    2f45:	50                   	push   %eax
    2f46:	68 09 c4 00 00       	push   $0xc409
    2f4b:	e8 1a d6 ff ff       	call   56a <is_pid_in_group>
    2f50:	83 c4 10             	add    $0x10,%esp
    2f53:	85 c0                	test   %eax,%eax
    2f55:	74 19                	je     2f70 <test_fork_failure+0x31b>
    2f57:	eb 6b                	jmp    2fc4 <test_fork_failure+0x36f>
    2f59:	83 ec 08             	sub    $0x8,%esp
    2f5c:	68 3c bf 00 00       	push   $0xbf3c
    2f61:	6a 01                	push   $0x1
    2f63:	e8 ff 8b 00 00       	call   bb67 <printf>
    2f68:	83 c3 01             	add    $0x1,%ebx
    2f6b:	83 c4 10             	add    $0x10,%esp
    2f6e:	eb 05                	jmp    2f75 <test_fork_failure+0x320>
    2f70:	bb 00 00 00 00       	mov    $0x0,%ebx
    2f75:	83 ec 0c             	sub    $0xc,%esp
    2f78:	68 98 e4 00 00       	push   $0xe498
    2f7d:	e8 81 87 00 00       	call   b703 <strlen>
    2f82:	89 c7                	mov    %eax,%edi
    2f84:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    2f8b:	e8 73 87 00 00       	call   b703 <strlen>
    2f90:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    2f94:	83 c4 10             	add    $0x10,%esp
    2f97:	39 d8                	cmp    %ebx,%eax
    2f99:	77 be                	ja     2f59 <test_fork_failure+0x304>
    2f9b:	83 ec 0c             	sub    $0xc,%esp
    2f9e:	68 29 02 00 00       	push   $0x229
    2fa3:	68 f9 bf 00 00       	push   $0xbff9
    2fa8:	56                   	push   %esi
    2fa9:	68 c8 e4 00 00       	push   $0xe4c8
    2fae:	6a 01                	push   $0x1
    2fb0:	e8 b2 8b 00 00       	call   bb67 <printf>
    2fb5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    2fbc:	00 00 00 
    2fbf:	83 c4 20             	add    $0x20,%esp
    2fc2:	eb 7c                	jmp    3040 <test_fork_failure+0x3eb>

    // Disable PID controller
    ASSERT_TRUE(disable_controller(PID_CNT));
    2fc4:	83 ec 0c             	sub    $0xc,%esp
    2fc7:	6a 01                	push   $0x1
    2fc9:	e8 e7 d3 ff ff       	call   3b5 <disable_controller>
    2fce:	83 c4 10             	add    $0x10,%esp
    2fd1:	85 c0                	test   %eax,%eax
    2fd3:	74 19                	je     2fee <test_fork_failure+0x399>
    2fd5:	eb 69                	jmp    3040 <test_fork_failure+0x3eb>
    2fd7:	83 ec 08             	sub    $0x8,%esp
    2fda:	68 3c bf 00 00       	push   $0xbf3c
    2fdf:	6a 01                	push   $0x1
    2fe1:	e8 81 8b 00 00       	call   bb67 <printf>
    2fe6:	83 c3 01             	add    $0x1,%ebx
    2fe9:	83 c4 10             	add    $0x10,%esp
    2fec:	eb 05                	jmp    2ff3 <test_fork_failure+0x39e>
    2fee:	bb 00 00 00 00       	mov    $0x0,%ebx
    2ff3:	83 ec 0c             	sub    $0xc,%esp
    2ff6:	68 1e c4 00 00       	push   $0xc41e
    2ffb:	e8 03 87 00 00       	call   b703 <strlen>
    3000:	89 c7                	mov    %eax,%edi
    3002:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3009:	e8 f5 86 00 00       	call   b703 <strlen>
    300e:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    3012:	83 c4 10             	add    $0x10,%esp
    3015:	39 d8                	cmp    %ebx,%eax
    3017:	77 be                	ja     2fd7 <test_fork_failure+0x382>
    3019:	83 ec 0c             	sub    $0xc,%esp
    301c:	68 2c 02 00 00       	push   $0x22c
    3021:	68 f9 bf 00 00       	push   $0xbff9
    3026:	56                   	push   %esi
    3027:	68 20 e5 00 00       	push   $0xe520
    302c:	6a 01                	push   $0x1
    302e:	e8 34 8b 00 00       	call   bb67 <printf>
    3033:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    303a:	00 00 00 
    303d:	83 c4 20             	add    $0x20,%esp
}
    3040:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3043:	5b                   	pop    %ebx
    3044:	5e                   	pop    %esi
    3045:	5f                   	pop    %edi
    3046:	5d                   	pop    %ebp
    3047:	c3                   	ret    

00003048 <test_pid_current>:

TEST(test_pid_current)
{
    3048:	55                   	push   %ebp
    3049:	89 e5                	mov    %esp,%ebp
    304b:	56                   	push   %esi
    304c:	53                   	push   %ebx
    // Move the current process to "/cgroup/test1" cgroup.
    ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    304d:	e8 a4 89 00 00       	call   b9f6 <getpid>
    3052:	83 ec 08             	sub    $0x8,%esp
    3055:	50                   	push   %eax
    3056:	68 06 c1 00 00       	push   $0xc106
    305b:	e8 d7 d4 ff ff       	call   537 <move_proc>
    3060:	83 c4 10             	add    $0x10,%esp
    3063:	85 c0                	test   %eax,%eax
    3065:	74 19                	je     3080 <test_pid_current+0x38>
    3067:	eb 70                	jmp    30d9 <test_pid_current+0x91>
    3069:	83 ec 08             	sub    $0x8,%esp
    306c:	68 3c bf 00 00       	push   $0xbf3c
    3071:	6a 01                	push   $0x1
    3073:	e8 ef 8a 00 00       	call   bb67 <printf>
    3078:	83 c3 01             	add    $0x1,%ebx
    307b:	83 c4 10             	add    $0x10,%esp
    307e:	eb 05                	jmp    3085 <test_pid_current+0x3d>
    3080:	bb 00 00 00 00       	mov    $0x0,%ebx
    3085:	83 ec 0c             	sub    $0xc,%esp
    3088:	68 90 e3 00 00       	push   $0xe390
    308d:	e8 71 86 00 00       	call   b703 <strlen>
    3092:	89 c6                	mov    %eax,%esi
    3094:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    309b:	e8 63 86 00 00       	call   b703 <strlen>
    30a0:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    30a4:	83 c4 10             	add    $0x10,%esp
    30a7:	39 d8                	cmp    %ebx,%eax
    30a9:	77 be                	ja     3069 <test_pid_current+0x21>
    30ab:	83 ec 0c             	sub    $0xc,%esp
    30ae:	68 32 02 00 00       	push   $0x232
    30b3:	68 f9 bf 00 00       	push   $0xbff9
    30b8:	ff 75 08             	pushl  0x8(%ebp)
    30bb:	68 d4 e5 00 00       	push   $0xe5d4
    30c0:	6a 01                	push   $0x1
    30c2:	e8 a0 8a 00 00       	call   bb67 <printf>
    30c7:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    30ce:	00 00 00 
    30d1:	83 c4 20             	add    $0x20,%esp
    30d4:	e9 35 02 00 00       	jmp    330e <test_pid_current+0x2c6>

    // Check that the process we moved is really in "/cgroup/test1" cgroup.
    ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    30d9:	e8 18 89 00 00       	call   b9f6 <getpid>
    30de:	83 ec 08             	sub    $0x8,%esp
    30e1:	50                   	push   %eax
    30e2:	68 06 c1 00 00       	push   $0xc106
    30e7:	e8 7e d4 ff ff       	call   56a <is_pid_in_group>
    30ec:	83 c4 10             	add    $0x10,%esp
    30ef:	85 c0                	test   %eax,%eax
    30f1:	74 19                	je     310c <test_pid_current+0xc4>
    30f3:	eb 70                	jmp    3165 <test_pid_current+0x11d>
    30f5:	83 ec 08             	sub    $0x8,%esp
    30f8:	68 3c bf 00 00       	push   $0xbf3c
    30fd:	6a 01                	push   $0x1
    30ff:	e8 63 8a 00 00       	call   bb67 <printf>
    3104:	83 c3 01             	add    $0x1,%ebx
    3107:	83 c4 10             	add    $0x10,%esp
    310a:	eb 05                	jmp    3111 <test_pid_current+0xc9>
    310c:	bb 00 00 00 00       	mov    $0x0,%ebx
    3111:	83 ec 0c             	sub    $0xc,%esp
    3114:	68 10 e4 00 00       	push   $0xe410
    3119:	e8 e5 85 00 00       	call   b703 <strlen>
    311e:	89 c6                	mov    %eax,%esi
    3120:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3127:	e8 d7 85 00 00       	call   b703 <strlen>
    312c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3130:	83 c4 10             	add    $0x10,%esp
    3133:	39 d8                	cmp    %ebx,%eax
    3135:	77 be                	ja     30f5 <test_pid_current+0xad>
    3137:	83 ec 0c             	sub    $0xc,%esp
    313a:	68 35 02 00 00       	push   $0x235
    313f:	68 f9 bf 00 00       	push   $0xbff9
    3144:	ff 75 08             	pushl  0x8(%ebp)
    3147:	68 28 e6 00 00       	push   $0xe628
    314c:	6a 01                	push   $0x1
    314e:	e8 14 8a 00 00       	call   bb67 <printf>
    3153:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    315a:	00 00 00 
    315d:	83 c4 20             	add    $0x20,%esp
    3160:	e9 a9 01 00 00       	jmp    330e <test_pid_current+0x2c6>

    // Check pid.current changed to display 1
    ASSERT_FALSE(strcmp(read_file(TEST_1_PID_CURRENT, 0), "num_of_procs - 1\n"));
    3165:	83 ec 08             	sub    $0x8,%esp
    3168:	6a 00                	push   $0x0
    316a:	68 b3 c1 00 00       	push   $0xc1b3
    316f:	e8 28 d0 ff ff       	call   19c <read_file>
    3174:	83 c4 08             	add    $0x8,%esp
    3177:	68 3a c4 00 00       	push   $0xc43a
    317c:	50                   	push   %eax
    317d:	e8 2b 85 00 00       	call   b6ad <strcmp>
    3182:	83 c4 10             	add    $0x10,%esp
    3185:	85 c0                	test   %eax,%eax
    3187:	75 19                	jne    31a2 <test_pid_current+0x15a>
    3189:	eb 70                	jmp    31fb <test_pid_current+0x1b3>
    318b:	83 ec 08             	sub    $0x8,%esp
    318e:	68 3c bf 00 00       	push   $0xbf3c
    3193:	6a 01                	push   $0x1
    3195:	e8 cd 89 00 00       	call   bb67 <printf>
    319a:	83 c3 01             	add    $0x1,%ebx
    319d:	83 c4 10             	add    $0x10,%esp
    31a0:	eb 05                	jmp    31a7 <test_pid_current+0x15f>
    31a2:	bb 00 00 00 00       	mov    $0x0,%ebx
    31a7:	83 ec 0c             	sub    $0xc,%esp
    31aa:	68 f8 e6 00 00       	push   $0xe6f8
    31af:	e8 4f 85 00 00       	call   b703 <strlen>
    31b4:	89 c6                	mov    %eax,%esi
    31b6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    31bd:	e8 41 85 00 00       	call   b703 <strlen>
    31c2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    31c6:	83 c4 10             	add    $0x10,%esp
    31c9:	39 d8                	cmp    %ebx,%eax
    31cb:	77 be                	ja     318b <test_pid_current+0x143>
    31cd:	83 ec 0c             	sub    $0xc,%esp
    31d0:	68 38 02 00 00       	push   $0x238
    31d5:	68 f9 bf 00 00       	push   $0xbff9
    31da:	ff 75 08             	pushl  0x8(%ebp)
    31dd:	68 38 e7 00 00       	push   $0xe738
    31e2:	6a 01                	push   $0x1
    31e4:	e8 7e 89 00 00       	call   bb67 <printf>
    31e9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    31f0:	00 00 00 
    31f3:	83 c4 20             	add    $0x20,%esp
    31f6:	e9 13 01 00 00       	jmp    330e <test_pid_current+0x2c6>

    // Return the process to root cgroup.
    ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    31fb:	e8 f6 87 00 00       	call   b9f6 <getpid>
    3200:	83 ec 08             	sub    $0x8,%esp
    3203:	50                   	push   %eax
    3204:	68 09 c4 00 00       	push   $0xc409
    3209:	e8 29 d3 ff ff       	call   537 <move_proc>
    320e:	83 c4 10             	add    $0x10,%esp
    3211:	85 c0                	test   %eax,%eax
    3213:	74 19                	je     322e <test_pid_current+0x1e6>
    3215:	eb 70                	jmp    3287 <test_pid_current+0x23f>
    3217:	83 ec 08             	sub    $0x8,%esp
    321a:	68 3c bf 00 00       	push   $0xbf3c
    321f:	6a 01                	push   $0x1
    3221:	e8 41 89 00 00       	call   bb67 <printf>
    3226:	83 c3 01             	add    $0x1,%ebx
    3229:	83 c4 10             	add    $0x10,%esp
    322c:	eb 05                	jmp    3233 <test_pid_current+0x1eb>
    322e:	bb 00 00 00 00       	mov    $0x0,%ebx
    3233:	83 ec 0c             	sub    $0xc,%esp
    3236:	68 80 e6 00 00       	push   $0xe680
    323b:	e8 c3 84 00 00       	call   b703 <strlen>
    3240:	89 c6                	mov    %eax,%esi
    3242:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3249:	e8 b5 84 00 00       	call   b703 <strlen>
    324e:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3252:	83 c4 10             	add    $0x10,%esp
    3255:	39 d8                	cmp    %ebx,%eax
    3257:	77 be                	ja     3217 <test_pid_current+0x1cf>
    3259:	83 ec 0c             	sub    $0xc,%esp
    325c:	68 3b 02 00 00       	push   $0x23b
    3261:	68 f9 bf 00 00       	push   $0xbff9
    3266:	ff 75 08             	pushl  0x8(%ebp)
    3269:	68 a8 e6 00 00       	push   $0xe6a8
    326e:	6a 01                	push   $0x1
    3270:	e8 f2 88 00 00       	call   bb67 <printf>
    3275:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    327c:	00 00 00 
    327f:	83 c4 20             	add    $0x20,%esp
    3282:	e9 87 00 00 00       	jmp    330e <test_pid_current+0x2c6>

    // Check that the process we returned is really in root cgroup.
    ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    3287:	e8 6a 87 00 00       	call   b9f6 <getpid>
    328c:	83 ec 08             	sub    $0x8,%esp
    328f:	50                   	push   %eax
    3290:	68 09 c4 00 00       	push   $0xc409
    3295:	e8 d0 d2 ff ff       	call   56a <is_pid_in_group>
    329a:	83 c4 10             	add    $0x10,%esp
    329d:	85 c0                	test   %eax,%eax
    329f:	74 19                	je     32ba <test_pid_current+0x272>
    32a1:	eb 6b                	jmp    330e <test_pid_current+0x2c6>
    32a3:	83 ec 08             	sub    $0x8,%esp
    32a6:	68 3c bf 00 00       	push   $0xbf3c
    32ab:	6a 01                	push   $0x1
    32ad:	e8 b5 88 00 00       	call   bb67 <printf>
    32b2:	83 c3 01             	add    $0x1,%ebx
    32b5:	83 c4 10             	add    $0x10,%esp
    32b8:	eb 05                	jmp    32bf <test_pid_current+0x277>
    32ba:	bb 00 00 00 00       	mov    $0x0,%ebx
    32bf:	83 ec 0c             	sub    $0xc,%esp
    32c2:	68 98 e4 00 00       	push   $0xe498
    32c7:	e8 37 84 00 00       	call   b703 <strlen>
    32cc:	89 c6                	mov    %eax,%esi
    32ce:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    32d5:	e8 29 84 00 00       	call   b703 <strlen>
    32da:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    32de:	83 c4 10             	add    $0x10,%esp
    32e1:	39 d8                	cmp    %ebx,%eax
    32e3:	77 be                	ja     32a3 <test_pid_current+0x25b>
    32e5:	83 ec 0c             	sub    $0xc,%esp
    32e8:	68 3e 02 00 00       	push   $0x23e
    32ed:	68 f9 bf 00 00       	push   $0xbff9
    32f2:	ff 75 08             	pushl  0x8(%ebp)
    32f5:	68 c8 e4 00 00       	push   $0xe4c8
    32fa:	6a 01                	push   $0x1
    32fc:	e8 66 88 00 00       	call   bb67 <printf>
    3301:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3308:	00 00 00 
    330b:	83 c4 20             	add    $0x20,%esp
}
    330e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3311:	5b                   	pop    %ebx
    3312:	5e                   	pop    %esi
    3313:	5d                   	pop    %ebp
    3314:	c3                   	ret    

00003315 <test_moving_process>:

TEST(test_moving_process)
{
    3315:	55                   	push   %ebp
    3316:	89 e5                	mov    %esp,%ebp
    3318:	56                   	push   %esi
    3319:	53                   	push   %ebx
    // Move the current process to "/cgroup/test1" cgroup.
    ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    331a:	e8 d7 86 00 00       	call   b9f6 <getpid>
    331f:	83 ec 08             	sub    $0x8,%esp
    3322:	50                   	push   %eax
    3323:	68 06 c1 00 00       	push   $0xc106
    3328:	e8 0a d2 ff ff       	call   537 <move_proc>
    332d:	83 c4 10             	add    $0x10,%esp
    3330:	85 c0                	test   %eax,%eax
    3332:	74 19                	je     334d <test_moving_process+0x38>
    3334:	eb 70                	jmp    33a6 <test_moving_process+0x91>
    3336:	83 ec 08             	sub    $0x8,%esp
    3339:	68 3c bf 00 00       	push   $0xbf3c
    333e:	6a 01                	push   $0x1
    3340:	e8 22 88 00 00       	call   bb67 <printf>
    3345:	83 c3 01             	add    $0x1,%ebx
    3348:	83 c4 10             	add    $0x10,%esp
    334b:	eb 05                	jmp    3352 <test_moving_process+0x3d>
    334d:	bb 00 00 00 00       	mov    $0x0,%ebx
    3352:	83 ec 0c             	sub    $0xc,%esp
    3355:	68 90 e3 00 00       	push   $0xe390
    335a:	e8 a4 83 00 00       	call   b703 <strlen>
    335f:	89 c6                	mov    %eax,%esi
    3361:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3368:	e8 96 83 00 00       	call   b703 <strlen>
    336d:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3371:	83 c4 10             	add    $0x10,%esp
    3374:	39 d8                	cmp    %ebx,%eax
    3376:	77 be                	ja     3336 <test_moving_process+0x21>
    3378:	83 ec 0c             	sub    $0xc,%esp
    337b:	68 44 02 00 00       	push   $0x244
    3380:	68 f9 bf 00 00       	push   $0xbff9
    3385:	ff 75 08             	pushl  0x8(%ebp)
    3388:	68 d4 e5 00 00       	push   $0xe5d4
    338d:	6a 01                	push   $0x1
    338f:	e8 d3 87 00 00       	call   bb67 <printf>
    3394:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    339b:	00 00 00 
    339e:	83 c4 20             	add    $0x20,%esp
    33a1:	e9 35 02 00 00       	jmp    35db <test_moving_process+0x2c6>

    // Check that the process we moved is really in "/cgroup/test1" cgroup.
    ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    33a6:	e8 4b 86 00 00       	call   b9f6 <getpid>
    33ab:	83 ec 08             	sub    $0x8,%esp
    33ae:	50                   	push   %eax
    33af:	68 06 c1 00 00       	push   $0xc106
    33b4:	e8 b1 d1 ff ff       	call   56a <is_pid_in_group>
    33b9:	83 c4 10             	add    $0x10,%esp
    33bc:	85 c0                	test   %eax,%eax
    33be:	74 19                	je     33d9 <test_moving_process+0xc4>
    33c0:	eb 70                	jmp    3432 <test_moving_process+0x11d>
    33c2:	83 ec 08             	sub    $0x8,%esp
    33c5:	68 3c bf 00 00       	push   $0xbf3c
    33ca:	6a 01                	push   $0x1
    33cc:	e8 96 87 00 00       	call   bb67 <printf>
    33d1:	83 c3 01             	add    $0x1,%ebx
    33d4:	83 c4 10             	add    $0x10,%esp
    33d7:	eb 05                	jmp    33de <test_moving_process+0xc9>
    33d9:	bb 00 00 00 00       	mov    $0x0,%ebx
    33de:	83 ec 0c             	sub    $0xc,%esp
    33e1:	68 10 e4 00 00       	push   $0xe410
    33e6:	e8 18 83 00 00       	call   b703 <strlen>
    33eb:	89 c6                	mov    %eax,%esi
    33ed:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    33f4:	e8 0a 83 00 00       	call   b703 <strlen>
    33f9:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    33fd:	83 c4 10             	add    $0x10,%esp
    3400:	39 d8                	cmp    %ebx,%eax
    3402:	77 be                	ja     33c2 <test_moving_process+0xad>
    3404:	83 ec 0c             	sub    $0xc,%esp
    3407:	68 47 02 00 00       	push   $0x247
    340c:	68 f9 bf 00 00       	push   $0xbff9
    3411:	ff 75 08             	pushl  0x8(%ebp)
    3414:	68 28 e6 00 00       	push   $0xe628
    3419:	6a 01                	push   $0x1
    341b:	e8 47 87 00 00       	call   bb67 <printf>
    3420:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3427:	00 00 00 
    342a:	83 c4 20             	add    $0x20,%esp
    342d:	e9 a9 01 00 00       	jmp    35db <test_moving_process+0x2c6>

    // Check that events recorded it correctly.
    ASSERT_FALSE(strcmp(read_file(TEST_1_CGROUP_EVENTS, 0), "populated - 1\nfrozen - 0\n"));
    3432:	83 ec 08             	sub    $0x8,%esp
    3435:	6a 00                	push   $0x0
    3437:	68 21 c1 00 00       	push   $0xc121
    343c:	e8 5b cd ff ff       	call   19c <read_file>
    3441:	83 c4 08             	add    $0x8,%esp
    3444:	68 4c c4 00 00       	push   $0xc44c
    3449:	50                   	push   %eax
    344a:	e8 5e 82 00 00       	call   b6ad <strcmp>
    344f:	83 c4 10             	add    $0x10,%esp
    3452:	85 c0                	test   %eax,%eax
    3454:	75 19                	jne    346f <test_moving_process+0x15a>
    3456:	eb 70                	jmp    34c8 <test_moving_process+0x1b3>
    3458:	83 ec 08             	sub    $0x8,%esp
    345b:	68 3c bf 00 00       	push   $0xbf3c
    3460:	6a 01                	push   $0x1
    3462:	e8 00 87 00 00       	call   bb67 <printf>
    3467:	83 c3 01             	add    $0x1,%ebx
    346a:	83 c4 10             	add    $0x10,%esp
    346d:	eb 05                	jmp    3474 <test_moving_process+0x15f>
    346f:	bb 00 00 00 00       	mov    $0x0,%ebx
    3474:	83 ec 0c             	sub    $0xc,%esp
    3477:	68 a0 e7 00 00       	push   $0xe7a0
    347c:	e8 82 82 00 00       	call   b703 <strlen>
    3481:	89 c6                	mov    %eax,%esi
    3483:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    348a:	e8 74 82 00 00       	call   b703 <strlen>
    348f:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3493:	83 c4 10             	add    $0x10,%esp
    3496:	39 d8                	cmp    %ebx,%eax
    3498:	77 be                	ja     3458 <test_moving_process+0x143>
    349a:	83 ec 0c             	sub    $0xc,%esp
    349d:	68 4a 02 00 00       	push   $0x24a
    34a2:	68 f9 bf 00 00       	push   $0xbff9
    34a7:	ff 75 08             	pushl  0x8(%ebp)
    34aa:	68 ec e7 00 00       	push   $0xe7ec
    34af:	6a 01                	push   $0x1
    34b1:	e8 b1 86 00 00       	call   bb67 <printf>
    34b6:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    34bd:	00 00 00 
    34c0:	83 c4 20             	add    $0x20,%esp
    34c3:	e9 13 01 00 00       	jmp    35db <test_moving_process+0x2c6>

    // Return the process to root cgroup.
    ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    34c8:	e8 29 85 00 00       	call   b9f6 <getpid>
    34cd:	83 ec 08             	sub    $0x8,%esp
    34d0:	50                   	push   %eax
    34d1:	68 09 c4 00 00       	push   $0xc409
    34d6:	e8 5c d0 ff ff       	call   537 <move_proc>
    34db:	83 c4 10             	add    $0x10,%esp
    34de:	85 c0                	test   %eax,%eax
    34e0:	74 19                	je     34fb <test_moving_process+0x1e6>
    34e2:	eb 70                	jmp    3554 <test_moving_process+0x23f>
    34e4:	83 ec 08             	sub    $0x8,%esp
    34e7:	68 3c bf 00 00       	push   $0xbf3c
    34ec:	6a 01                	push   $0x1
    34ee:	e8 74 86 00 00       	call   bb67 <printf>
    34f3:	83 c3 01             	add    $0x1,%ebx
    34f6:	83 c4 10             	add    $0x10,%esp
    34f9:	eb 05                	jmp    3500 <test_moving_process+0x1eb>
    34fb:	bb 00 00 00 00       	mov    $0x0,%ebx
    3500:	83 ec 0c             	sub    $0xc,%esp
    3503:	68 80 e6 00 00       	push   $0xe680
    3508:	e8 f6 81 00 00       	call   b703 <strlen>
    350d:	89 c6                	mov    %eax,%esi
    350f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3516:	e8 e8 81 00 00       	call   b703 <strlen>
    351b:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    351f:	83 c4 10             	add    $0x10,%esp
    3522:	39 d8                	cmp    %ebx,%eax
    3524:	77 be                	ja     34e4 <test_moving_process+0x1cf>
    3526:	83 ec 0c             	sub    $0xc,%esp
    3529:	68 4d 02 00 00       	push   $0x24d
    352e:	68 f9 bf 00 00       	push   $0xbff9
    3533:	ff 75 08             	pushl  0x8(%ebp)
    3536:	68 a8 e6 00 00       	push   $0xe6a8
    353b:	6a 01                	push   $0x1
    353d:	e8 25 86 00 00       	call   bb67 <printf>
    3542:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3549:	00 00 00 
    354c:	83 c4 20             	add    $0x20,%esp
    354f:	e9 87 00 00 00       	jmp    35db <test_moving_process+0x2c6>

    // Check that the process we returned is really in root cgroup.
    ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    3554:	e8 9d 84 00 00       	call   b9f6 <getpid>
    3559:	83 ec 08             	sub    $0x8,%esp
    355c:	50                   	push   %eax
    355d:	68 09 c4 00 00       	push   $0xc409
    3562:	e8 03 d0 ff ff       	call   56a <is_pid_in_group>
    3567:	83 c4 10             	add    $0x10,%esp
    356a:	85 c0                	test   %eax,%eax
    356c:	74 19                	je     3587 <test_moving_process+0x272>
    356e:	eb 6b                	jmp    35db <test_moving_process+0x2c6>
    3570:	83 ec 08             	sub    $0x8,%esp
    3573:	68 3c bf 00 00       	push   $0xbf3c
    3578:	6a 01                	push   $0x1
    357a:	e8 e8 85 00 00       	call   bb67 <printf>
    357f:	83 c3 01             	add    $0x1,%ebx
    3582:	83 c4 10             	add    $0x10,%esp
    3585:	eb 05                	jmp    358c <test_moving_process+0x277>
    3587:	bb 00 00 00 00       	mov    $0x0,%ebx
    358c:	83 ec 0c             	sub    $0xc,%esp
    358f:	68 98 e4 00 00       	push   $0xe498
    3594:	e8 6a 81 00 00       	call   b703 <strlen>
    3599:	89 c6                	mov    %eax,%esi
    359b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    35a2:	e8 5c 81 00 00       	call   b703 <strlen>
    35a7:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    35ab:	83 c4 10             	add    $0x10,%esp
    35ae:	39 d8                	cmp    %ebx,%eax
    35b0:	77 be                	ja     3570 <test_moving_process+0x25b>
    35b2:	83 ec 0c             	sub    $0xc,%esp
    35b5:	68 50 02 00 00       	push   $0x250
    35ba:	68 f9 bf 00 00       	push   $0xbff9
    35bf:	ff 75 08             	pushl  0x8(%ebp)
    35c2:	68 c8 e4 00 00       	push   $0xe4c8
    35c7:	6a 01                	push   $0x1
    35c9:	e8 99 85 00 00       	call   bb67 <printf>
    35ce:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    35d5:	00 00 00 
    35d8:	83 c4 20             	add    $0x20,%esp
}
    35db:	8d 65 f8             	lea    -0x8(%ebp),%esp
    35de:	5b                   	pop    %ebx
    35df:	5e                   	pop    %esi
    35e0:	5d                   	pop    %ebp
    35e1:	c3                   	ret    

000035e2 <test_setting_max_descendants_and_max_depth>:

TEST(test_setting_max_descendants_and_max_depth)
{
    35e2:	55                   	push   %ebp
    35e3:	89 e5                	mov    %esp,%ebp
    35e5:	56                   	push   %esi
    35e6:	53                   	push   %ebx
    // Set new values for max descendants allowed and max depth allowed
    ASSERT_TRUE(write_file(TEST_1_CGROUP_DESCENDANTS, "30"));
    35e7:	83 ec 08             	sub    $0x8,%esp
    35ea:	68 66 c4 00 00       	push   $0xc466
    35ef:	68 30 d0 00 00       	push   $0xd030
    35f4:	e8 55 cc ff ff       	call   24e <write_file>
    35f9:	83 c4 10             	add    $0x10,%esp
    35fc:	85 c0                	test   %eax,%eax
    35fe:	74 19                	je     3619 <test_setting_max_descendants_and_max_depth+0x37>
    3600:	eb 70                	jmp    3672 <test_setting_max_descendants_and_max_depth+0x90>
    3602:	83 ec 08             	sub    $0x8,%esp
    3605:	68 3c bf 00 00       	push   $0xbf3c
    360a:	6a 01                	push   $0x1
    360c:	e8 56 85 00 00       	call   bb67 <printf>
    3611:	83 c3 01             	add    $0x1,%ebx
    3614:	83 c4 10             	add    $0x10,%esp
    3617:	eb 05                	jmp    361e <test_setting_max_descendants_and_max_depth+0x3c>
    3619:	bb 00 00 00 00       	mov    $0x0,%ebx
    361e:	83 ec 0c             	sub    $0xc,%esp
    3621:	68 60 e8 00 00       	push   $0xe860
    3626:	e8 d8 80 00 00       	call   b703 <strlen>
    362b:	89 c6                	mov    %eax,%esi
    362d:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3634:	e8 ca 80 00 00       	call   b703 <strlen>
    3639:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    363d:	83 c4 10             	add    $0x10,%esp
    3640:	39 d8                	cmp    %ebx,%eax
    3642:	77 be                	ja     3602 <test_setting_max_descendants_and_max_depth+0x20>
    3644:	83 ec 0c             	sub    $0xc,%esp
    3647:	68 56 02 00 00       	push   $0x256
    364c:	68 f9 bf 00 00       	push   $0xbff9
    3651:	ff 75 08             	pushl  0x8(%ebp)
    3654:	68 8c e8 00 00       	push   $0xe88c
    3659:	6a 01                	push   $0x1
    365b:	e8 07 85 00 00       	call   bb67 <printf>
    3660:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3667:	00 00 00 
    366a:	83 c4 20             	add    $0x20,%esp
    366d:	e9 b2 01 00 00       	jmp    3824 <test_setting_max_descendants_and_max_depth+0x242>
    ASSERT_TRUE(write_file(TEST_1_CGROUP_MAX_DEPTH, "20"));
    3672:	83 ec 08             	sub    $0x8,%esp
    3675:	68 69 c4 00 00       	push   $0xc469
    367a:	68 d8 d0 00 00       	push   $0xd0d8
    367f:	e8 ca cb ff ff       	call   24e <write_file>
    3684:	83 c4 10             	add    $0x10,%esp
    3687:	85 c0                	test   %eax,%eax
    3689:	74 19                	je     36a4 <test_setting_max_descendants_and_max_depth+0xc2>
    368b:	eb 70                	jmp    36fd <test_setting_max_descendants_and_max_depth+0x11b>
    368d:	83 ec 08             	sub    $0x8,%esp
    3690:	68 3c bf 00 00       	push   $0xbf3c
    3695:	6a 01                	push   $0x1
    3697:	e8 cb 84 00 00       	call   bb67 <printf>
    369c:	83 c3 01             	add    $0x1,%ebx
    369f:	83 c4 10             	add    $0x10,%esp
    36a2:	eb 05                	jmp    36a9 <test_setting_max_descendants_and_max_depth+0xc7>
    36a4:	bb 00 00 00 00       	mov    $0x0,%ebx
    36a9:	83 ec 0c             	sub    $0xc,%esp
    36ac:	68 e4 e8 00 00       	push   $0xe8e4
    36b1:	e8 4d 80 00 00       	call   b703 <strlen>
    36b6:	89 c6                	mov    %eax,%esi
    36b8:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    36bf:	e8 3f 80 00 00       	call   b703 <strlen>
    36c4:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    36c8:	83 c4 10             	add    $0x10,%esp
    36cb:	39 d8                	cmp    %ebx,%eax
    36cd:	77 be                	ja     368d <test_setting_max_descendants_and_max_depth+0xab>
    36cf:	83 ec 0c             	sub    $0xc,%esp
    36d2:	68 57 02 00 00       	push   $0x257
    36d7:	68 f9 bf 00 00       	push   $0xbff9
    36dc:	ff 75 08             	pushl  0x8(%ebp)
    36df:	68 10 e9 00 00       	push   $0xe910
    36e4:	6a 01                	push   $0x1
    36e6:	e8 7c 84 00 00       	call   bb67 <printf>
    36eb:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    36f2:	00 00 00 
    36f5:	83 c4 20             	add    $0x20,%esp
    36f8:	e9 27 01 00 00       	jmp    3824 <test_setting_max_descendants_and_max_depth+0x242>

    // Check that the values have really been set
    ASSERT_FALSE(strcmp(read_file(TEST_1_CGROUP_DESCENDANTS, 0), "30\n"));
    36fd:	83 ec 08             	sub    $0x8,%esp
    3700:	6a 00                	push   $0x0
    3702:	68 30 d0 00 00       	push   $0xd030
    3707:	e8 90 ca ff ff       	call   19c <read_file>
    370c:	83 c4 08             	add    $0x8,%esp
    370f:	68 6c c4 00 00       	push   $0xc46c
    3714:	50                   	push   %eax
    3715:	e8 93 7f 00 00       	call   b6ad <strcmp>
    371a:	83 c4 10             	add    $0x10,%esp
    371d:	85 c0                	test   %eax,%eax
    371f:	75 19                	jne    373a <test_setting_max_descendants_and_max_depth+0x158>
    3721:	eb 70                	jmp    3793 <test_setting_max_descendants_and_max_depth+0x1b1>
    3723:	83 ec 08             	sub    $0x8,%esp
    3726:	68 3c bf 00 00       	push   $0xbf3c
    372b:	6a 01                	push   $0x1
    372d:	e8 35 84 00 00       	call   bb67 <printf>
    3732:	83 c3 01             	add    $0x1,%ebx
    3735:	83 c4 10             	add    $0x10,%esp
    3738:	eb 05                	jmp    373f <test_setting_max_descendants_and_max_depth+0x15d>
    373a:	bb 00 00 00 00       	mov    $0x0,%ebx
    373f:	83 ec 0c             	sub    $0xc,%esp
    3742:	68 64 e9 00 00       	push   $0xe964
    3747:	e8 b7 7f 00 00       	call   b703 <strlen>
    374c:	89 c6                	mov    %eax,%esi
    374e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3755:	e8 a9 7f 00 00       	call   b703 <strlen>
    375a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    375e:	83 c4 10             	add    $0x10,%esp
    3761:	39 d8                	cmp    %ebx,%eax
    3763:	77 be                	ja     3723 <test_setting_max_descendants_and_max_depth+0x141>
    3765:	83 ec 0c             	sub    $0xc,%esp
    3768:	68 5a 02 00 00       	push   $0x25a
    376d:	68 f9 bf 00 00       	push   $0xbff9
    3772:	ff 75 08             	pushl  0x8(%ebp)
    3775:	68 9c e9 00 00       	push   $0xe99c
    377a:	6a 01                	push   $0x1
    377c:	e8 e6 83 00 00       	call   bb67 <printf>
    3781:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3788:	00 00 00 
    378b:	83 c4 20             	add    $0x20,%esp
    378e:	e9 91 00 00 00       	jmp    3824 <test_setting_max_descendants_and_max_depth+0x242>
    ASSERT_FALSE(strcmp(read_file(TEST_1_CGROUP_MAX_DEPTH, 0), "20\n"));
    3793:	83 ec 08             	sub    $0x8,%esp
    3796:	6a 00                	push   $0x0
    3798:	68 d8 d0 00 00       	push   $0xd0d8
    379d:	e8 fa c9 ff ff       	call   19c <read_file>
    37a2:	83 c4 08             	add    $0x8,%esp
    37a5:	68 70 c4 00 00       	push   $0xc470
    37aa:	50                   	push   %eax
    37ab:	e8 fd 7e 00 00       	call   b6ad <strcmp>
    37b0:	83 c4 10             	add    $0x10,%esp
    37b3:	85 c0                	test   %eax,%eax
    37b5:	75 19                	jne    37d0 <test_setting_max_descendants_and_max_depth+0x1ee>
    37b7:	eb 6b                	jmp    3824 <test_setting_max_descendants_and_max_depth+0x242>
    37b9:	83 ec 08             	sub    $0x8,%esp
    37bc:	68 3c bf 00 00       	push   $0xbf3c
    37c1:	6a 01                	push   $0x1
    37c3:	e8 9f 83 00 00       	call   bb67 <printf>
    37c8:	83 c3 01             	add    $0x1,%ebx
    37cb:	83 c4 10             	add    $0x10,%esp
    37ce:	eb 05                	jmp    37d5 <test_setting_max_descendants_and_max_depth+0x1f3>
    37d0:	bb 00 00 00 00       	mov    $0x0,%ebx
    37d5:	83 ec 0c             	sub    $0xc,%esp
    37d8:	68 00 ea 00 00       	push   $0xea00
    37dd:	e8 21 7f 00 00       	call   b703 <strlen>
    37e2:	89 c6                	mov    %eax,%esi
    37e4:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    37eb:	e8 13 7f 00 00       	call   b703 <strlen>
    37f0:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    37f4:	83 c4 10             	add    $0x10,%esp
    37f7:	39 d8                	cmp    %ebx,%eax
    37f9:	77 be                	ja     37b9 <test_setting_max_descendants_and_max_depth+0x1d7>
    37fb:	83 ec 0c             	sub    $0xc,%esp
    37fe:	68 5b 02 00 00       	push   $0x25b
    3803:	68 f9 bf 00 00       	push   $0xbff9
    3808:	ff 75 08             	pushl  0x8(%ebp)
    380b:	68 38 ea 00 00       	push   $0xea38
    3810:	6a 01                	push   $0x1
    3812:	e8 50 83 00 00       	call   bb67 <printf>
    3817:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    381e:	00 00 00 
    3821:	83 c4 20             	add    $0x20,%esp
}
    3824:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3827:	5b                   	pop    %ebx
    3828:	5e                   	pop    %esi
    3829:	5d                   	pop    %ebp
    382a:	c3                   	ret    

0000382b <test_enable_and_disable_set_controller>:


TEST(test_enable_and_disable_set_controller)
{
    382b:	55                   	push   %ebp
    382c:	89 e5                	mov    %esp,%ebp
    382e:	56                   	push   %esi
    382f:	53                   	push   %ebx
    // Enable cpu set controller.
    ASSERT_TRUE(enable_controller(SET_CNT));
    3830:	83 ec 0c             	sub    $0xc,%esp
    3833:	6a 02                	push   $0x2
    3835:	e8 26 cb ff ff       	call   360 <enable_controller>
    383a:	83 c4 10             	add    $0x10,%esp
    383d:	85 c0                	test   %eax,%eax
    383f:	74 19                	je     385a <test_enable_and_disable_set_controller+0x2f>
    3841:	eb 70                	jmp    38b3 <test_enable_and_disable_set_controller+0x88>
    3843:	83 ec 08             	sub    $0x8,%esp
    3846:	68 3c bf 00 00       	push   $0xbf3c
    384b:	6a 01                	push   $0x1
    384d:	e8 15 83 00 00       	call   bb67 <printf>
    3852:	83 c3 01             	add    $0x1,%ebx
    3855:	83 c4 10             	add    $0x10,%esp
    3858:	eb 05                	jmp    385f <test_enable_and_disable_set_controller+0x34>
    385a:	bb 00 00 00 00       	mov    $0x0,%ebx
    385f:	83 ec 0c             	sub    $0xc,%esp
    3862:	68 74 c4 00 00       	push   $0xc474
    3867:	e8 97 7e 00 00       	call   b703 <strlen>
    386c:	89 c6                	mov    %eax,%esi
    386e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3875:	e8 89 7e 00 00       	call   b703 <strlen>
    387a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    387e:	83 c4 10             	add    $0x10,%esp
    3881:	39 d8                	cmp    %ebx,%eax
    3883:	77 be                	ja     3843 <test_enable_and_disable_set_controller+0x18>
    3885:	83 ec 0c             	sub    $0xc,%esp
    3888:	68 62 02 00 00       	push   $0x262
    388d:	68 f9 bf 00 00       	push   $0xbff9
    3892:	ff 75 08             	pushl  0x8(%ebp)
    3895:	68 98 ea 00 00       	push   $0xea98
    389a:	6a 01                	push   $0x1
    389c:	e8 c6 82 00 00       	call   bb67 <printf>
    38a1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    38a8:	00 00 00 
    38ab:	83 c4 20             	add    $0x20,%esp
    38ae:	e9 81 01 00 00       	jmp    3a34 <test_enable_and_disable_set_controller+0x209>

    // Check that cpu set controller is really enabled.
    ASSERT_TRUE(verify_controller_enabled(SET_CNT));
    38b3:	83 ec 0c             	sub    $0xc,%esp
    38b6:	6a 02                	push   $0x2
    38b8:	e8 4d cb ff ff       	call   40a <verify_controller_enabled>
    38bd:	83 c4 10             	add    $0x10,%esp
    38c0:	85 c0                	test   %eax,%eax
    38c2:	74 19                	je     38dd <test_enable_and_disable_set_controller+0xb2>
    38c4:	eb 70                	jmp    3936 <test_enable_and_disable_set_controller+0x10b>
    38c6:	83 ec 08             	sub    $0x8,%esp
    38c9:	68 3c bf 00 00       	push   $0xbf3c
    38ce:	6a 01                	push   $0x1
    38d0:	e8 92 82 00 00       	call   bb67 <printf>
    38d5:	83 c3 01             	add    $0x1,%ebx
    38d8:	83 c4 10             	add    $0x10,%esp
    38db:	eb 05                	jmp    38e2 <test_enable_and_disable_set_controller+0xb7>
    38dd:	bb 00 00 00 00       	mov    $0x0,%ebx
    38e2:	83 ec 0c             	sub    $0xc,%esp
    38e5:	68 dc ea 00 00       	push   $0xeadc
    38ea:	e8 14 7e 00 00       	call   b703 <strlen>
    38ef:	89 c6                	mov    %eax,%esi
    38f1:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    38f8:	e8 06 7e 00 00       	call   b703 <strlen>
    38fd:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3901:	83 c4 10             	add    $0x10,%esp
    3904:	39 d8                	cmp    %ebx,%eax
    3906:	77 be                	ja     38c6 <test_enable_and_disable_set_controller+0x9b>
    3908:	83 ec 0c             	sub    $0xc,%esp
    390b:	68 65 02 00 00       	push   $0x265
    3910:	68 f9 bf 00 00       	push   $0xbff9
    3915:	ff 75 08             	pushl  0x8(%ebp)
    3918:	68 00 eb 00 00       	push   $0xeb00
    391d:	6a 01                	push   $0x1
    391f:	e8 43 82 00 00       	call   bb67 <printf>
    3924:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    392b:	00 00 00 
    392e:	83 c4 20             	add    $0x20,%esp
    3931:	e9 fe 00 00 00       	jmp    3a34 <test_enable_and_disable_set_controller+0x209>

    // Disable cpu set controller.
    ASSERT_TRUE(disable_controller(SET_CNT));
    3936:	83 ec 0c             	sub    $0xc,%esp
    3939:	6a 02                	push   $0x2
    393b:	e8 75 ca ff ff       	call   3b5 <disable_controller>
    3940:	83 c4 10             	add    $0x10,%esp
    3943:	85 c0                	test   %eax,%eax
    3945:	74 19                	je     3960 <test_enable_and_disable_set_controller+0x135>
    3947:	eb 6d                	jmp    39b6 <test_enable_and_disable_set_controller+0x18b>
    3949:	83 ec 08             	sub    $0x8,%esp
    394c:	68 3c bf 00 00       	push   $0xbf3c
    3951:	6a 01                	push   $0x1
    3953:	e8 0f 82 00 00       	call   bb67 <printf>
    3958:	83 c3 01             	add    $0x1,%ebx
    395b:	83 c4 10             	add    $0x10,%esp
    395e:	eb 05                	jmp    3965 <test_enable_and_disable_set_controller+0x13a>
    3960:	bb 00 00 00 00       	mov    $0x0,%ebx
    3965:	83 ec 0c             	sub    $0xc,%esp
    3968:	68 8f c4 00 00       	push   $0xc48f
    396d:	e8 91 7d 00 00       	call   b703 <strlen>
    3972:	89 c6                	mov    %eax,%esi
    3974:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    397b:	e8 83 7d 00 00       	call   b703 <strlen>
    3980:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3984:	83 c4 10             	add    $0x10,%esp
    3987:	39 d8                	cmp    %ebx,%eax
    3989:	77 be                	ja     3949 <test_enable_and_disable_set_controller+0x11e>
    398b:	83 ec 0c             	sub    $0xc,%esp
    398e:	68 68 02 00 00       	push   $0x268
    3993:	68 f9 bf 00 00       	push   $0xbff9
    3998:	ff 75 08             	pushl  0x8(%ebp)
    399b:	68 4c eb 00 00       	push   $0xeb4c
    39a0:	6a 01                	push   $0x1
    39a2:	e8 c0 81 00 00       	call   bb67 <printf>
    39a7:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    39ae:	00 00 00 
    39b1:	83 c4 20             	add    $0x20,%esp
    39b4:	eb 7e                	jmp    3a34 <test_enable_and_disable_set_controller+0x209>

    // Check that cpu set controller is really disabled.
    ASSERT_TRUE(verify_controller_disabled(SET_CNT));
    39b6:	83 ec 0c             	sub    $0xc,%esp
    39b9:	6a 02                	push   $0x2
    39bb:	e8 da ca ff ff       	call   49a <verify_controller_disabled>
    39c0:	83 c4 10             	add    $0x10,%esp
    39c3:	85 c0                	test   %eax,%eax
    39c5:	74 19                	je     39e0 <test_enable_and_disable_set_controller+0x1b5>
    39c7:	eb 6b                	jmp    3a34 <test_enable_and_disable_set_controller+0x209>
    39c9:	83 ec 08             	sub    $0x8,%esp
    39cc:	68 3c bf 00 00       	push   $0xbf3c
    39d1:	6a 01                	push   $0x1
    39d3:	e8 8f 81 00 00       	call   bb67 <printf>
    39d8:	83 c3 01             	add    $0x1,%ebx
    39db:	83 c4 10             	add    $0x10,%esp
    39de:	eb 05                	jmp    39e5 <test_enable_and_disable_set_controller+0x1ba>
    39e0:	bb 00 00 00 00       	mov    $0x0,%ebx
    39e5:	83 ec 0c             	sub    $0xc,%esp
    39e8:	68 94 eb 00 00       	push   $0xeb94
    39ed:	e8 11 7d 00 00       	call   b703 <strlen>
    39f2:	89 c6                	mov    %eax,%esi
    39f4:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    39fb:	e8 03 7d 00 00       	call   b703 <strlen>
    3a00:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3a04:	83 c4 10             	add    $0x10,%esp
    3a07:	39 d8                	cmp    %ebx,%eax
    3a09:	77 be                	ja     39c9 <test_enable_and_disable_set_controller+0x19e>
    3a0b:	83 ec 0c             	sub    $0xc,%esp
    3a0e:	68 6b 02 00 00       	push   $0x26b
    3a13:	68 f9 bf 00 00       	push   $0xbff9
    3a18:	ff 75 08             	pushl  0x8(%ebp)
    3a1b:	68 b8 eb 00 00       	push   $0xebb8
    3a20:	6a 01                	push   $0x1
    3a22:	e8 40 81 00 00       	call   bb67 <printf>
    3a27:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3a2e:	00 00 00 
    3a31:	83 c4 20             	add    $0x20,%esp
}
    3a34:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3a37:	5b                   	pop    %ebx
    3a38:	5e                   	pop    %esi
    3a39:	5d                   	pop    %ebp
    3a3a:	c3                   	ret    

00003a3b <test_setting_cpu_id>:

TEST(test_setting_cpu_id)
{
    3a3b:	55                   	push   %ebp
    3a3c:	89 e5                	mov    %esp,%ebp
    3a3e:	57                   	push   %edi
    3a3f:	56                   	push   %esi
    3a40:	53                   	push   %ebx
    3a41:	83 ec 18             	sub    $0x18,%esp
    3a44:	8b 7d 08             	mov    0x8(%ebp),%edi
    // Enable cpu set controller.
    ASSERT_TRUE(enable_controller(SET_CNT));
    3a47:	6a 02                	push   $0x2
    3a49:	e8 12 c9 ff ff       	call   360 <enable_controller>
    3a4e:	83 c4 10             	add    $0x10,%esp
    3a51:	85 c0                	test   %eax,%eax
    3a53:	74 19                	je     3a6e <test_setting_cpu_id+0x33>
    3a55:	eb 6e                	jmp    3ac5 <test_setting_cpu_id+0x8a>
    3a57:	83 ec 08             	sub    $0x8,%esp
    3a5a:	68 3c bf 00 00       	push   $0xbf3c
    3a5f:	6a 01                	push   $0x1
    3a61:	e8 01 81 00 00       	call   bb67 <printf>
    3a66:	83 c3 01             	add    $0x1,%ebx
    3a69:	83 c4 10             	add    $0x10,%esp
    3a6c:	eb 05                	jmp    3a73 <test_setting_cpu_id+0x38>
    3a6e:	bb 00 00 00 00       	mov    $0x0,%ebx
    3a73:	83 ec 0c             	sub    $0xc,%esp
    3a76:	68 74 c4 00 00       	push   $0xc474
    3a7b:	e8 83 7c 00 00       	call   b703 <strlen>
    3a80:	89 c6                	mov    %eax,%esi
    3a82:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3a89:	e8 75 7c 00 00       	call   b703 <strlen>
    3a8e:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3a92:	83 c4 10             	add    $0x10,%esp
    3a95:	39 d8                	cmp    %ebx,%eax
    3a97:	77 be                	ja     3a57 <test_setting_cpu_id+0x1c>
    3a99:	83 ec 0c             	sub    $0xc,%esp
    3a9c:	68 71 02 00 00       	push   $0x271
    3aa1:	68 f9 bf 00 00       	push   $0xbff9
    3aa6:	57                   	push   %edi
    3aa7:	68 98 ea 00 00       	push   $0xea98
    3aac:	6a 01                	push   $0x1
    3aae:	e8 b4 80 00 00       	call   bb67 <printf>
    3ab3:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3aba:	00 00 00 
    3abd:	83 c4 20             	add    $0x20,%esp
    3ac0:	e9 b3 02 00 00       	jmp    3d78 <test_setting_cpu_id+0x33d>

    // Update cpu id.
    ASSERT_TRUE(write_file(TEST_1_SET_CPU, "1"));
    3ac5:	83 ec 08             	sub    $0x8,%esp
    3ac8:	68 37 c6 00 00       	push   $0xc637
    3acd:	68 cd c1 00 00       	push   $0xc1cd
    3ad2:	e8 77 c7 ff ff       	call   24e <write_file>
    3ad7:	83 c4 10             	add    $0x10,%esp
    3ada:	85 c0                	test   %eax,%eax
    3adc:	74 19                	je     3af7 <test_setting_cpu_id+0xbc>
    3ade:	eb 6e                	jmp    3b4e <test_setting_cpu_id+0x113>
    3ae0:	83 ec 08             	sub    $0x8,%esp
    3ae3:	68 3c bf 00 00       	push   $0xbf3c
    3ae8:	6a 01                	push   $0x1
    3aea:	e8 78 80 00 00       	call   bb67 <printf>
    3aef:	83 c3 01             	add    $0x1,%ebx
    3af2:	83 c4 10             	add    $0x10,%esp
    3af5:	eb 05                	jmp    3afc <test_setting_cpu_id+0xc1>
    3af7:	bb 00 00 00 00       	mov    $0x0,%ebx
    3afc:	83 ec 0c             	sub    $0xc,%esp
    3aff:	68 08 ec 00 00       	push   $0xec08
    3b04:	e8 fa 7b 00 00       	call   b703 <strlen>
    3b09:	89 c6                	mov    %eax,%esi
    3b0b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3b12:	e8 ec 7b 00 00       	call   b703 <strlen>
    3b17:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3b1b:	83 c4 10             	add    $0x10,%esp
    3b1e:	39 d8                	cmp    %ebx,%eax
    3b20:	77 be                	ja     3ae0 <test_setting_cpu_id+0xa5>
    3b22:	83 ec 0c             	sub    $0xc,%esp
    3b25:	68 74 02 00 00       	push   $0x274
    3b2a:	68 f9 bf 00 00       	push   $0xbff9
    3b2f:	57                   	push   %edi
    3b30:	68 28 ec 00 00       	push   $0xec28
    3b35:	6a 01                	push   $0x1
    3b37:	e8 2b 80 00 00       	call   bb67 <printf>
    3b3c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3b43:	00 00 00 
    3b46:	83 c4 20             	add    $0x20,%esp
    3b49:	e9 2a 02 00 00       	jmp    3d78 <test_setting_cpu_id+0x33d>

    // Check changes.
    ASSERT_FALSE(strcmp(read_file(TEST_1_SET_CPU, 0), "use_cpu - 1\n"));
    3b4e:	83 ec 08             	sub    $0x8,%esp
    3b51:	6a 00                	push   $0x0
    3b53:	68 cd c1 00 00       	push   $0xc1cd
    3b58:	e8 3f c6 ff ff       	call   19c <read_file>
    3b5d:	83 c4 08             	add    $0x8,%esp
    3b60:	68 ab c4 00 00       	push   $0xc4ab
    3b65:	50                   	push   %eax
    3b66:	e8 42 7b 00 00       	call   b6ad <strcmp>
    3b6b:	83 c4 10             	add    $0x10,%esp
    3b6e:	85 c0                	test   %eax,%eax
    3b70:	75 19                	jne    3b8b <test_setting_cpu_id+0x150>
    3b72:	eb 6e                	jmp    3be2 <test_setting_cpu_id+0x1a7>
    3b74:	83 ec 08             	sub    $0x8,%esp
    3b77:	68 3c bf 00 00       	push   $0xbf3c
    3b7c:	6a 01                	push   $0x1
    3b7e:	e8 e4 7f 00 00       	call   bb67 <printf>
    3b83:	83 c3 01             	add    $0x1,%ebx
    3b86:	83 c4 10             	add    $0x10,%esp
    3b89:	eb 05                	jmp    3b90 <test_setting_cpu_id+0x155>
    3b8b:	bb 00 00 00 00       	mov    $0x0,%ebx
    3b90:	83 ec 0c             	sub    $0xc,%esp
    3b93:	68 74 ec 00 00       	push   $0xec74
    3b98:	e8 66 7b 00 00       	call   b703 <strlen>
    3b9d:	89 c6                	mov    %eax,%esi
    3b9f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3ba6:	e8 58 7b 00 00       	call   b703 <strlen>
    3bab:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3baf:	83 c4 10             	add    $0x10,%esp
    3bb2:	39 d8                	cmp    %ebx,%eax
    3bb4:	77 be                	ja     3b74 <test_setting_cpu_id+0x139>
    3bb6:	83 ec 0c             	sub    $0xc,%esp
    3bb9:	68 77 02 00 00       	push   $0x277
    3bbe:	68 f9 bf 00 00       	push   $0xbff9
    3bc3:	57                   	push   %edi
    3bc4:	68 ac ec 00 00       	push   $0xecac
    3bc9:	6a 01                	push   $0x1
    3bcb:	e8 97 7f 00 00       	call   bb67 <printf>
    3bd0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3bd7:	00 00 00 
    3bda:	83 c4 20             	add    $0x20,%esp
    3bdd:	e9 96 01 00 00       	jmp    3d78 <test_setting_cpu_id+0x33d>

    // Restore default cpu id.
    ASSERT_TRUE(write_file(TEST_1_SET_CPU, "0"));
    3be2:	83 ec 08             	sub    $0x8,%esp
    3be5:	68 9b c3 00 00       	push   $0xc39b
    3bea:	68 cd c1 00 00       	push   $0xc1cd
    3bef:	e8 5a c6 ff ff       	call   24e <write_file>
    3bf4:	83 c4 10             	add    $0x10,%esp
    3bf7:	85 c0                	test   %eax,%eax
    3bf9:	74 19                	je     3c14 <test_setting_cpu_id+0x1d9>
    3bfb:	eb 6e                	jmp    3c6b <test_setting_cpu_id+0x230>
    3bfd:	83 ec 08             	sub    $0x8,%esp
    3c00:	68 3c bf 00 00       	push   $0xbf3c
    3c05:	6a 01                	push   $0x1
    3c07:	e8 5b 7f 00 00       	call   bb67 <printf>
    3c0c:	83 c3 01             	add    $0x1,%ebx
    3c0f:	83 c4 10             	add    $0x10,%esp
    3c12:	eb 05                	jmp    3c19 <test_setting_cpu_id+0x1de>
    3c14:	bb 00 00 00 00       	mov    $0x0,%ebx
    3c19:	83 ec 0c             	sub    $0xc,%esp
    3c1c:	68 0c ed 00 00       	push   $0xed0c
    3c21:	e8 dd 7a 00 00       	call   b703 <strlen>
    3c26:	89 c6                	mov    %eax,%esi
    3c28:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3c2f:	e8 cf 7a 00 00       	call   b703 <strlen>
    3c34:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3c38:	83 c4 10             	add    $0x10,%esp
    3c3b:	39 d8                	cmp    %ebx,%eax
    3c3d:	77 be                	ja     3bfd <test_setting_cpu_id+0x1c2>
    3c3f:	83 ec 0c             	sub    $0xc,%esp
    3c42:	68 7a 02 00 00       	push   $0x27a
    3c47:	68 f9 bf 00 00       	push   $0xbff9
    3c4c:	57                   	push   %edi
    3c4d:	68 2c ed 00 00       	push   $0xed2c
    3c52:	6a 01                	push   $0x1
    3c54:	e8 0e 7f 00 00       	call   bb67 <printf>
    3c59:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3c60:	00 00 00 
    3c63:	83 c4 20             	add    $0x20,%esp
    3c66:	e9 0d 01 00 00       	jmp    3d78 <test_setting_cpu_id+0x33d>

    // Check changes.
    ASSERT_FALSE(strcmp(read_file(TEST_1_SET_CPU, 0), "use_cpu - 0\n"));
    3c6b:	83 ec 08             	sub    $0x8,%esp
    3c6e:	6a 00                	push   $0x0
    3c70:	68 cd c1 00 00       	push   $0xc1cd
    3c75:	e8 22 c5 ff ff       	call   19c <read_file>
    3c7a:	83 c4 08             	add    $0x8,%esp
    3c7d:	68 b8 c4 00 00       	push   $0xc4b8
    3c82:	50                   	push   %eax
    3c83:	e8 25 7a 00 00       	call   b6ad <strcmp>
    3c88:	83 c4 10             	add    $0x10,%esp
    3c8b:	85 c0                	test   %eax,%eax
    3c8d:	75 19                	jne    3ca8 <test_setting_cpu_id+0x26d>
    3c8f:	eb 6b                	jmp    3cfc <test_setting_cpu_id+0x2c1>
    3c91:	83 ec 08             	sub    $0x8,%esp
    3c94:	68 3c bf 00 00       	push   $0xbf3c
    3c99:	6a 01                	push   $0x1
    3c9b:	e8 c7 7e 00 00       	call   bb67 <printf>
    3ca0:	83 c3 01             	add    $0x1,%ebx
    3ca3:	83 c4 10             	add    $0x10,%esp
    3ca6:	eb 05                	jmp    3cad <test_setting_cpu_id+0x272>
    3ca8:	bb 00 00 00 00       	mov    $0x0,%ebx
    3cad:	83 ec 0c             	sub    $0xc,%esp
    3cb0:	68 78 ed 00 00       	push   $0xed78
    3cb5:	e8 49 7a 00 00       	call   b703 <strlen>
    3cba:	89 c6                	mov    %eax,%esi
    3cbc:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3cc3:	e8 3b 7a 00 00       	call   b703 <strlen>
    3cc8:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3ccc:	83 c4 10             	add    $0x10,%esp
    3ccf:	39 d8                	cmp    %ebx,%eax
    3cd1:	77 be                	ja     3c91 <test_setting_cpu_id+0x256>
    3cd3:	83 ec 0c             	sub    $0xc,%esp
    3cd6:	68 7d 02 00 00       	push   $0x27d
    3cdb:	68 f9 bf 00 00       	push   $0xbff9
    3ce0:	57                   	push   %edi
    3ce1:	68 b0 ed 00 00       	push   $0xedb0
    3ce6:	6a 01                	push   $0x1
    3ce8:	e8 7a 7e 00 00       	call   bb67 <printf>
    3ced:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3cf4:	00 00 00 
    3cf7:	83 c4 20             	add    $0x20,%esp
    3cfa:	eb 7c                	jmp    3d78 <test_setting_cpu_id+0x33d>

    // Disable cpu set controller.
    ASSERT_TRUE(disable_controller(SET_CNT));
    3cfc:	83 ec 0c             	sub    $0xc,%esp
    3cff:	6a 02                	push   $0x2
    3d01:	e8 af c6 ff ff       	call   3b5 <disable_controller>
    3d06:	83 c4 10             	add    $0x10,%esp
    3d09:	85 c0                	test   %eax,%eax
    3d0b:	74 19                	je     3d26 <test_setting_cpu_id+0x2eb>
    3d0d:	eb 69                	jmp    3d78 <test_setting_cpu_id+0x33d>
    3d0f:	83 ec 08             	sub    $0x8,%esp
    3d12:	68 3c bf 00 00       	push   $0xbf3c
    3d17:	6a 01                	push   $0x1
    3d19:	e8 49 7e 00 00       	call   bb67 <printf>
    3d1e:	83 c3 01             	add    $0x1,%ebx
    3d21:	83 c4 10             	add    $0x10,%esp
    3d24:	eb 05                	jmp    3d2b <test_setting_cpu_id+0x2f0>
    3d26:	bb 00 00 00 00       	mov    $0x0,%ebx
    3d2b:	83 ec 0c             	sub    $0xc,%esp
    3d2e:	68 8f c4 00 00       	push   $0xc48f
    3d33:	e8 cb 79 00 00       	call   b703 <strlen>
    3d38:	89 c6                	mov    %eax,%esi
    3d3a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3d41:	e8 bd 79 00 00       	call   b703 <strlen>
    3d46:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    3d4a:	83 c4 10             	add    $0x10,%esp
    3d4d:	39 d8                	cmp    %ebx,%eax
    3d4f:	77 be                	ja     3d0f <test_setting_cpu_id+0x2d4>
    3d51:	83 ec 0c             	sub    $0xc,%esp
    3d54:	68 80 02 00 00       	push   $0x280
    3d59:	68 f9 bf 00 00       	push   $0xbff9
    3d5e:	57                   	push   %edi
    3d5f:	68 4c eb 00 00       	push   $0xeb4c
    3d64:	6a 01                	push   $0x1
    3d66:	e8 fc 7d 00 00       	call   bb67 <printf>
    3d6b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3d72:	00 00 00 
    3d75:	83 c4 20             	add    $0x20,%esp
}
    3d78:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3d7b:	5b                   	pop    %ebx
    3d7c:	5e                   	pop    %esi
    3d7d:	5f                   	pop    %edi
    3d7e:	5d                   	pop    %ebp
    3d7f:	c3                   	ret    

00003d80 <test_correct_cpu_running>:

TEST(test_correct_cpu_running)
{
    3d80:	55                   	push   %ebp
    3d81:	89 e5                	mov    %esp,%ebp
    3d83:	57                   	push   %edi
    3d84:	56                   	push   %esi
    3d85:	53                   	push   %ebx
    3d86:	83 ec 18             	sub    $0x18,%esp
    3d89:	8b 75 08             	mov    0x8(%ebp),%esi
    // Enable cpu set controller.
    ASSERT_TRUE(enable_controller(SET_CNT));
    3d8c:	6a 02                	push   $0x2
    3d8e:	e8 cd c5 ff ff       	call   360 <enable_controller>
    3d93:	83 c4 10             	add    $0x10,%esp
    3d96:	85 c0                	test   %eax,%eax
    3d98:	74 19                	je     3db3 <test_correct_cpu_running+0x33>
    3d9a:	eb 6e                	jmp    3e0a <test_correct_cpu_running+0x8a>
    3d9c:	83 ec 08             	sub    $0x8,%esp
    3d9f:	68 3c bf 00 00       	push   $0xbf3c
    3da4:	6a 01                	push   $0x1
    3da6:	e8 bc 7d 00 00       	call   bb67 <printf>
    3dab:	83 c3 01             	add    $0x1,%ebx
    3dae:	83 c4 10             	add    $0x10,%esp
    3db1:	eb 05                	jmp    3db8 <test_correct_cpu_running+0x38>
    3db3:	bb 00 00 00 00       	mov    $0x0,%ebx
    3db8:	83 ec 0c             	sub    $0xc,%esp
    3dbb:	68 74 c4 00 00       	push   $0xc474
    3dc0:	e8 3e 79 00 00       	call   b703 <strlen>
    3dc5:	89 c7                	mov    %eax,%edi
    3dc7:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3dce:	e8 30 79 00 00       	call   b703 <strlen>
    3dd3:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    3dd7:	83 c4 10             	add    $0x10,%esp
    3dda:	39 d8                	cmp    %ebx,%eax
    3ddc:	77 be                	ja     3d9c <test_correct_cpu_running+0x1c>
    3dde:	83 ec 0c             	sub    $0xc,%esp
    3de1:	68 86 02 00 00       	push   $0x286
    3de6:	68 f9 bf 00 00       	push   $0xbff9
    3deb:	56                   	push   %esi
    3dec:	68 98 ea 00 00       	push   $0xea98
    3df1:	6a 01                	push   $0x1
    3df3:	e8 6f 7d 00 00       	call   bb67 <printf>
    3df8:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3dff:	00 00 00 
    3e02:	83 c4 20             	add    $0x20,%esp
    3e05:	e9 01 04 00 00       	jmp    420b <test_correct_cpu_running+0x48b>

    // Check changes.
  //  ASSERT_FALSE(strcmp(read_file(TEST_1_SET_CPU, 0), "use_cpu - 1\n"));

    // Move the current process to "/cgroup/test1" cgroup.
    ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    3e0a:	e8 e7 7b 00 00       	call   b9f6 <getpid>
    3e0f:	83 ec 08             	sub    $0x8,%esp
    3e12:	50                   	push   %eax
    3e13:	68 06 c1 00 00       	push   $0xc106
    3e18:	e8 1a c7 ff ff       	call   537 <move_proc>
    3e1d:	83 c4 10             	add    $0x10,%esp
    3e20:	85 c0                	test   %eax,%eax
    3e22:	74 19                	je     3e3d <test_correct_cpu_running+0xbd>
    3e24:	eb 6e                	jmp    3e94 <test_correct_cpu_running+0x114>
    3e26:	83 ec 08             	sub    $0x8,%esp
    3e29:	68 3c bf 00 00       	push   $0xbf3c
    3e2e:	6a 01                	push   $0x1
    3e30:	e8 32 7d 00 00       	call   bb67 <printf>
    3e35:	83 c3 01             	add    $0x1,%ebx
    3e38:	83 c4 10             	add    $0x10,%esp
    3e3b:	eb 05                	jmp    3e42 <test_correct_cpu_running+0xc2>
    3e3d:	bb 00 00 00 00       	mov    $0x0,%ebx
    3e42:	83 ec 0c             	sub    $0xc,%esp
    3e45:	68 90 e3 00 00       	push   $0xe390
    3e4a:	e8 b4 78 00 00       	call   b703 <strlen>
    3e4f:	89 c7                	mov    %eax,%edi
    3e51:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3e58:	e8 a6 78 00 00       	call   b703 <strlen>
    3e5d:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    3e61:	83 c4 10             	add    $0x10,%esp
    3e64:	39 d8                	cmp    %ebx,%eax
    3e66:	77 be                	ja     3e26 <test_correct_cpu_running+0xa6>
    3e68:	83 ec 0c             	sub    $0xc,%esp
    3e6b:	68 8f 02 00 00       	push   $0x28f
    3e70:	68 f9 bf 00 00       	push   $0xbff9
    3e75:	56                   	push   %esi
    3e76:	68 d4 e5 00 00       	push   $0xe5d4
    3e7b:	6a 01                	push   $0x1
    3e7d:	e8 e5 7c 00 00       	call   bb67 <printf>
    3e82:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3e89:	00 00 00 
    3e8c:	83 c4 20             	add    $0x20,%esp
    3e8f:	e9 77 03 00 00       	jmp    420b <test_correct_cpu_running+0x48b>

    // Check that the process we moved is really in "/cgroup/test1" cgroup.
    ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    3e94:	e8 5d 7b 00 00       	call   b9f6 <getpid>
    3e99:	83 ec 08             	sub    $0x8,%esp
    3e9c:	50                   	push   %eax
    3e9d:	68 06 c1 00 00       	push   $0xc106
    3ea2:	e8 c3 c6 ff ff       	call   56a <is_pid_in_group>
    3ea7:	83 c4 10             	add    $0x10,%esp
    3eaa:	85 c0                	test   %eax,%eax
    3eac:	74 19                	je     3ec7 <test_correct_cpu_running+0x147>
    3eae:	eb 6e                	jmp    3f1e <test_correct_cpu_running+0x19e>
    3eb0:	83 ec 08             	sub    $0x8,%esp
    3eb3:	68 3c bf 00 00       	push   $0xbf3c
    3eb8:	6a 01                	push   $0x1
    3eba:	e8 a8 7c 00 00       	call   bb67 <printf>
    3ebf:	83 c3 01             	add    $0x1,%ebx
    3ec2:	83 c4 10             	add    $0x10,%esp
    3ec5:	eb 05                	jmp    3ecc <test_correct_cpu_running+0x14c>
    3ec7:	bb 00 00 00 00       	mov    $0x0,%ebx
    3ecc:	83 ec 0c             	sub    $0xc,%esp
    3ecf:	68 10 e4 00 00       	push   $0xe410
    3ed4:	e8 2a 78 00 00       	call   b703 <strlen>
    3ed9:	89 c7                	mov    %eax,%edi
    3edb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3ee2:	e8 1c 78 00 00       	call   b703 <strlen>
    3ee7:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    3eeb:	83 c4 10             	add    $0x10,%esp
    3eee:	39 d8                	cmp    %ebx,%eax
    3ef0:	77 be                	ja     3eb0 <test_correct_cpu_running+0x130>
    3ef2:	83 ec 0c             	sub    $0xc,%esp
    3ef5:	68 92 02 00 00       	push   $0x292
    3efa:	68 f9 bf 00 00       	push   $0xbff9
    3eff:	56                   	push   %esi
    3f00:	68 28 e6 00 00       	push   $0xe628
    3f05:	6a 01                	push   $0x1
    3f07:	e8 5b 7c 00 00       	call   bb67 <printf>
    3f0c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3f13:	00 00 00 
    3f16:	83 c4 20             	add    $0x20,%esp
    3f19:	e9 ed 02 00 00       	jmp    420b <test_correct_cpu_running+0x48b>

    // Go to sleep in order to make the process is rescheduled.
    sleep(5);
    3f1e:	83 ec 0c             	sub    $0xc,%esp
    3f21:	6a 05                	push   $0x5
    3f23:	e8 de 7a 00 00       	call   ba06 <sleep>

    // Verify that the process is scheduled on the set cpu.
  //  ASSERT_UINT_EQ(getcpu(), 1);
      ASSERT_UINT_EQ(getcpu(), 0);
    3f28:	e8 29 7b 00 00       	call   ba56 <getcpu>
    3f2d:	83 c4 10             	add    $0x10,%esp
    3f30:	85 c0                	test   %eax,%eax
    3f32:	74 2d                	je     3f61 <test_correct_cpu_running+0x1e1>
    3f34:	e8 1d 7b 00 00       	call   ba56 <getcpu>
    3f39:	83 ec 0c             	sub    $0xc,%esp
    3f3c:	68 99 02 00 00       	push   $0x299
    3f41:	68 f9 bf 00 00       	push   $0xbff9
    3f46:	6a 00                	push   $0x0
    3f48:	50                   	push   %eax
    3f49:	56                   	push   %esi
    3f4a:	e8 c5 c0 ff ff       	call   14 <print_error>
    3f4f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3f56:	00 00 00 
    3f59:	83 c4 20             	add    $0x20,%esp
    3f5c:	e9 aa 02 00 00       	jmp    420b <test_correct_cpu_running+0x48b>
    // Return the process to root cgroup.
    ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    3f61:	e8 90 7a 00 00       	call   b9f6 <getpid>
    3f66:	83 ec 08             	sub    $0x8,%esp
    3f69:	50                   	push   %eax
    3f6a:	68 09 c4 00 00       	push   $0xc409
    3f6f:	e8 c3 c5 ff ff       	call   537 <move_proc>
    3f74:	83 c4 10             	add    $0x10,%esp
    3f77:	85 c0                	test   %eax,%eax
    3f79:	74 19                	je     3f94 <test_correct_cpu_running+0x214>
    3f7b:	eb 6e                	jmp    3feb <test_correct_cpu_running+0x26b>
    3f7d:	83 ec 08             	sub    $0x8,%esp
    3f80:	68 3c bf 00 00       	push   $0xbf3c
    3f85:	6a 01                	push   $0x1
    3f87:	e8 db 7b 00 00       	call   bb67 <printf>
    3f8c:	83 c3 01             	add    $0x1,%ebx
    3f8f:	83 c4 10             	add    $0x10,%esp
    3f92:	eb 05                	jmp    3f99 <test_correct_cpu_running+0x219>
    3f94:	bb 00 00 00 00       	mov    $0x0,%ebx
    3f99:	83 ec 0c             	sub    $0xc,%esp
    3f9c:	68 80 e6 00 00       	push   $0xe680
    3fa1:	e8 5d 77 00 00       	call   b703 <strlen>
    3fa6:	89 c7                	mov    %eax,%edi
    3fa8:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    3faf:	e8 4f 77 00 00       	call   b703 <strlen>
    3fb4:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    3fb8:	83 c4 10             	add    $0x10,%esp
    3fbb:	39 d8                	cmp    %ebx,%eax
    3fbd:	77 be                	ja     3f7d <test_correct_cpu_running+0x1fd>
    3fbf:	83 ec 0c             	sub    $0xc,%esp
    3fc2:	68 9b 02 00 00       	push   $0x29b
    3fc7:	68 f9 bf 00 00       	push   $0xbff9
    3fcc:	56                   	push   %esi
    3fcd:	68 a8 e6 00 00       	push   $0xe6a8
    3fd2:	6a 01                	push   $0x1
    3fd4:	e8 8e 7b 00 00       	call   bb67 <printf>
    3fd9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    3fe0:	00 00 00 
    3fe3:	83 c4 20             	add    $0x20,%esp
    3fe6:	e9 20 02 00 00       	jmp    420b <test_correct_cpu_running+0x48b>

    // Check that the process we returned is really in root cgroup.
    ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    3feb:	e8 06 7a 00 00       	call   b9f6 <getpid>
    3ff0:	83 ec 08             	sub    $0x8,%esp
    3ff3:	50                   	push   %eax
    3ff4:	68 09 c4 00 00       	push   $0xc409
    3ff9:	e8 6c c5 ff ff       	call   56a <is_pid_in_group>
    3ffe:	83 c4 10             	add    $0x10,%esp
    4001:	85 c0                	test   %eax,%eax
    4003:	74 19                	je     401e <test_correct_cpu_running+0x29e>
    4005:	eb 6e                	jmp    4075 <test_correct_cpu_running+0x2f5>
    4007:	83 ec 08             	sub    $0x8,%esp
    400a:	68 3c bf 00 00       	push   $0xbf3c
    400f:	6a 01                	push   $0x1
    4011:	e8 51 7b 00 00       	call   bb67 <printf>
    4016:	83 c3 01             	add    $0x1,%ebx
    4019:	83 c4 10             	add    $0x10,%esp
    401c:	eb 05                	jmp    4023 <test_correct_cpu_running+0x2a3>
    401e:	bb 00 00 00 00       	mov    $0x0,%ebx
    4023:	83 ec 0c             	sub    $0xc,%esp
    4026:	68 98 e4 00 00       	push   $0xe498
    402b:	e8 d3 76 00 00       	call   b703 <strlen>
    4030:	89 c7                	mov    %eax,%edi
    4032:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4039:	e8 c5 76 00 00       	call   b703 <strlen>
    403e:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4042:	83 c4 10             	add    $0x10,%esp
    4045:	39 d8                	cmp    %ebx,%eax
    4047:	77 be                	ja     4007 <test_correct_cpu_running+0x287>
    4049:	83 ec 0c             	sub    $0xc,%esp
    404c:	68 9e 02 00 00       	push   $0x29e
    4051:	68 f9 bf 00 00       	push   $0xbff9
    4056:	56                   	push   %esi
    4057:	68 c8 e4 00 00       	push   $0xe4c8
    405c:	6a 01                	push   $0x1
    405e:	e8 04 7b 00 00       	call   bb67 <printf>
    4063:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    406a:	00 00 00 
    406d:	83 c4 20             	add    $0x20,%esp
    4070:	e9 96 01 00 00       	jmp    420b <test_correct_cpu_running+0x48b>

    // Restore default cpu id.
    ASSERT_TRUE(write_file(TEST_1_SET_CPU, "0"));
    4075:	83 ec 08             	sub    $0x8,%esp
    4078:	68 9b c3 00 00       	push   $0xc39b
    407d:	68 cd c1 00 00       	push   $0xc1cd
    4082:	e8 c7 c1 ff ff       	call   24e <write_file>
    4087:	83 c4 10             	add    $0x10,%esp
    408a:	85 c0                	test   %eax,%eax
    408c:	74 19                	je     40a7 <test_correct_cpu_running+0x327>
    408e:	eb 6e                	jmp    40fe <test_correct_cpu_running+0x37e>
    4090:	83 ec 08             	sub    $0x8,%esp
    4093:	68 3c bf 00 00       	push   $0xbf3c
    4098:	6a 01                	push   $0x1
    409a:	e8 c8 7a 00 00       	call   bb67 <printf>
    409f:	83 c3 01             	add    $0x1,%ebx
    40a2:	83 c4 10             	add    $0x10,%esp
    40a5:	eb 05                	jmp    40ac <test_correct_cpu_running+0x32c>
    40a7:	bb 00 00 00 00       	mov    $0x0,%ebx
    40ac:	83 ec 0c             	sub    $0xc,%esp
    40af:	68 0c ed 00 00       	push   $0xed0c
    40b4:	e8 4a 76 00 00       	call   b703 <strlen>
    40b9:	89 c7                	mov    %eax,%edi
    40bb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    40c2:	e8 3c 76 00 00       	call   b703 <strlen>
    40c7:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    40cb:	83 c4 10             	add    $0x10,%esp
    40ce:	39 d8                	cmp    %ebx,%eax
    40d0:	77 be                	ja     4090 <test_correct_cpu_running+0x310>
    40d2:	83 ec 0c             	sub    $0xc,%esp
    40d5:	68 a1 02 00 00       	push   $0x2a1
    40da:	68 f9 bf 00 00       	push   $0xbff9
    40df:	56                   	push   %esi
    40e0:	68 2c ed 00 00       	push   $0xed2c
    40e5:	6a 01                	push   $0x1
    40e7:	e8 7b 7a 00 00       	call   bb67 <printf>
    40ec:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    40f3:	00 00 00 
    40f6:	83 c4 20             	add    $0x20,%esp
    40f9:	e9 0d 01 00 00       	jmp    420b <test_correct_cpu_running+0x48b>

    // Check changes.
    ASSERT_FALSE(strcmp(read_file(TEST_1_SET_CPU, 0), "use_cpu - 0\n"));
    40fe:	83 ec 08             	sub    $0x8,%esp
    4101:	6a 00                	push   $0x0
    4103:	68 cd c1 00 00       	push   $0xc1cd
    4108:	e8 8f c0 ff ff       	call   19c <read_file>
    410d:	83 c4 08             	add    $0x8,%esp
    4110:	68 b8 c4 00 00       	push   $0xc4b8
    4115:	50                   	push   %eax
    4116:	e8 92 75 00 00       	call   b6ad <strcmp>
    411b:	83 c4 10             	add    $0x10,%esp
    411e:	85 c0                	test   %eax,%eax
    4120:	75 19                	jne    413b <test_correct_cpu_running+0x3bb>
    4122:	eb 6b                	jmp    418f <test_correct_cpu_running+0x40f>
    4124:	83 ec 08             	sub    $0x8,%esp
    4127:	68 3c bf 00 00       	push   $0xbf3c
    412c:	6a 01                	push   $0x1
    412e:	e8 34 7a 00 00       	call   bb67 <printf>
    4133:	83 c3 01             	add    $0x1,%ebx
    4136:	83 c4 10             	add    $0x10,%esp
    4139:	eb 05                	jmp    4140 <test_correct_cpu_running+0x3c0>
    413b:	bb 00 00 00 00       	mov    $0x0,%ebx
    4140:	83 ec 0c             	sub    $0xc,%esp
    4143:	68 78 ed 00 00       	push   $0xed78
    4148:	e8 b6 75 00 00       	call   b703 <strlen>
    414d:	89 c7                	mov    %eax,%edi
    414f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4156:	e8 a8 75 00 00       	call   b703 <strlen>
    415b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    415f:	83 c4 10             	add    $0x10,%esp
    4162:	39 d8                	cmp    %ebx,%eax
    4164:	77 be                	ja     4124 <test_correct_cpu_running+0x3a4>
    4166:	83 ec 0c             	sub    $0xc,%esp
    4169:	68 a4 02 00 00       	push   $0x2a4
    416e:	68 f9 bf 00 00       	push   $0xbff9
    4173:	56                   	push   %esi
    4174:	68 b0 ed 00 00       	push   $0xedb0
    4179:	6a 01                	push   $0x1
    417b:	e8 e7 79 00 00       	call   bb67 <printf>
    4180:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4187:	00 00 00 
    418a:	83 c4 20             	add    $0x20,%esp
    418d:	eb 7c                	jmp    420b <test_correct_cpu_running+0x48b>

    // Disable cpu set controller.
    ASSERT_TRUE(disable_controller(SET_CNT));
    418f:	83 ec 0c             	sub    $0xc,%esp
    4192:	6a 02                	push   $0x2
    4194:	e8 1c c2 ff ff       	call   3b5 <disable_controller>
    4199:	83 c4 10             	add    $0x10,%esp
    419c:	85 c0                	test   %eax,%eax
    419e:	74 19                	je     41b9 <test_correct_cpu_running+0x439>
    41a0:	eb 69                	jmp    420b <test_correct_cpu_running+0x48b>
    41a2:	83 ec 08             	sub    $0x8,%esp
    41a5:	68 3c bf 00 00       	push   $0xbf3c
    41aa:	6a 01                	push   $0x1
    41ac:	e8 b6 79 00 00       	call   bb67 <printf>
    41b1:	83 c3 01             	add    $0x1,%ebx
    41b4:	83 c4 10             	add    $0x10,%esp
    41b7:	eb 05                	jmp    41be <test_correct_cpu_running+0x43e>
    41b9:	bb 00 00 00 00       	mov    $0x0,%ebx
    41be:	83 ec 0c             	sub    $0xc,%esp
    41c1:	68 8f c4 00 00       	push   $0xc48f
    41c6:	e8 38 75 00 00       	call   b703 <strlen>
    41cb:	89 c7                	mov    %eax,%edi
    41cd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    41d4:	e8 2a 75 00 00       	call   b703 <strlen>
    41d9:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    41dd:	83 c4 10             	add    $0x10,%esp
    41e0:	39 d8                	cmp    %ebx,%eax
    41e2:	77 be                	ja     41a2 <test_correct_cpu_running+0x422>
    41e4:	83 ec 0c             	sub    $0xc,%esp
    41e7:	68 a7 02 00 00       	push   $0x2a7
    41ec:	68 f9 bf 00 00       	push   $0xbff9
    41f1:	56                   	push   %esi
    41f2:	68 4c eb 00 00       	push   $0xeb4c
    41f7:	6a 01                	push   $0x1
    41f9:	e8 69 79 00 00       	call   bb67 <printf>
    41fe:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4205:	00 00 00 
    4208:	83 c4 20             	add    $0x20,%esp
}
    420b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    420e:	5b                   	pop    %ebx
    420f:	5e                   	pop    %esi
    4210:	5f                   	pop    %edi
    4211:	5d                   	pop    %ebp
    4212:	c3                   	ret    

00004213 <test_no_run>:

TEST(test_no_run)
{
    4213:	55                   	push   %ebp
    4214:	89 e5                	mov    %esp,%ebp
    4216:	57                   	push   %edi
    4217:	56                   	push   %esi
    4218:	53                   	push   %ebx
    4219:	83 ec 28             	sub    $0x28,%esp
    421c:	8b 75 08             	mov    0x8(%ebp),%esi
    // Enable cpu set controller.
    ASSERT_TRUE(enable_controller(SET_CNT));
    421f:	6a 02                	push   $0x2
    4221:	e8 3a c1 ff ff       	call   360 <enable_controller>
    4226:	83 c4 10             	add    $0x10,%esp
    4229:	85 c0                	test   %eax,%eax
    422b:	74 19                	je     4246 <test_no_run+0x33>
    422d:	eb 6e                	jmp    429d <test_no_run+0x8a>
    422f:	83 ec 08             	sub    $0x8,%esp
    4232:	68 3c bf 00 00       	push   $0xbf3c
    4237:	6a 01                	push   $0x1
    4239:	e8 29 79 00 00       	call   bb67 <printf>
    423e:	83 c3 01             	add    $0x1,%ebx
    4241:	83 c4 10             	add    $0x10,%esp
    4244:	eb 05                	jmp    424b <test_no_run+0x38>
    4246:	bb 00 00 00 00       	mov    $0x0,%ebx
    424b:	83 ec 0c             	sub    $0xc,%esp
    424e:	68 74 c4 00 00       	push   $0xc474
    4253:	e8 ab 74 00 00       	call   b703 <strlen>
    4258:	89 c7                	mov    %eax,%edi
    425a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4261:	e8 9d 74 00 00       	call   b703 <strlen>
    4266:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    426a:	83 c4 10             	add    $0x10,%esp
    426d:	39 d8                	cmp    %ebx,%eax
    426f:	77 be                	ja     422f <test_no_run+0x1c>
    4271:	83 ec 0c             	sub    $0xc,%esp
    4274:	68 ad 02 00 00       	push   $0x2ad
    4279:	68 f9 bf 00 00       	push   $0xbff9
    427e:	56                   	push   %esi
    427f:	68 98 ea 00 00       	push   $0xea98
    4284:	6a 01                	push   $0x1
    4286:	e8 dc 78 00 00       	call   bb67 <printf>
    428b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4292:	00 00 00 
    4295:	83 c4 20             	add    $0x20,%esp
    4298:	e9 80 05 00 00       	jmp    481d <test_no_run+0x60a>

    // Update cpu id.
    ASSERT_TRUE(write_file(TEST_1_SET_CPU, "2"));
    429d:	83 ec 08             	sub    $0x8,%esp
    42a0:	68 b4 c0 00 00       	push   $0xc0b4
    42a5:	68 cd c1 00 00       	push   $0xc1cd
    42aa:	e8 9f bf ff ff       	call   24e <write_file>
    42af:	83 c4 10             	add    $0x10,%esp
    42b2:	85 c0                	test   %eax,%eax
    42b4:	74 19                	je     42cf <test_no_run+0xbc>
    42b6:	eb 6e                	jmp    4326 <test_no_run+0x113>
    42b8:	83 ec 08             	sub    $0x8,%esp
    42bb:	68 3c bf 00 00       	push   $0xbf3c
    42c0:	6a 01                	push   $0x1
    42c2:	e8 a0 78 00 00       	call   bb67 <printf>
    42c7:	83 c3 01             	add    $0x1,%ebx
    42ca:	83 c4 10             	add    $0x10,%esp
    42cd:	eb 05                	jmp    42d4 <test_no_run+0xc1>
    42cf:	bb 00 00 00 00       	mov    $0x0,%ebx
    42d4:	83 ec 0c             	sub    $0xc,%esp
    42d7:	68 10 ee 00 00       	push   $0xee10
    42dc:	e8 22 74 00 00       	call   b703 <strlen>
    42e1:	89 c7                	mov    %eax,%edi
    42e3:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    42ea:	e8 14 74 00 00       	call   b703 <strlen>
    42ef:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    42f3:	83 c4 10             	add    $0x10,%esp
    42f6:	39 d8                	cmp    %ebx,%eax
    42f8:	77 be                	ja     42b8 <test_no_run+0xa5>
    42fa:	83 ec 0c             	sub    $0xc,%esp
    42fd:	68 b0 02 00 00       	push   $0x2b0
    4302:	68 f9 bf 00 00       	push   $0xbff9
    4307:	56                   	push   %esi
    4308:	68 30 ee 00 00       	push   $0xee30
    430d:	6a 01                	push   $0x1
    430f:	e8 53 78 00 00       	call   bb67 <printf>
    4314:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    431b:	00 00 00 
    431e:	83 c4 20             	add    $0x20,%esp
    4321:	e9 f7 04 00 00       	jmp    481d <test_no_run+0x60a>

    // Fork here since the process should not be running after we move it inside the cgroup.
    int pid = fork();
    4326:	e8 43 76 00 00       	call   b96e <fork>
    int pidToMove = 0;
    int sum = 0;
    int wstatus;

    // Child
    if (pid == 0) {
    432b:	85 c0                	test   %eax,%eax
    432d:	75 49                	jne    4378 <test_no_run+0x165>
        pidToMove = getpid();
    432f:	e8 c2 76 00 00       	call   b9f6 <getpid>

        // Save the pid of child in temp file.
        temp_write(pidToMove);
    4334:	83 ec 0c             	sub    $0xc,%esp
    4337:	50                   	push   %eax
    4338:	e8 cd c2 ff ff       	call   60a <temp_write>

        // Go to sleep for long period of time.
        sleep(20);
    433d:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
    4344:	e8 bd 76 00 00       	call   ba06 <sleep>

        // At this point, the child process should already be inside the cgroup.
        // Therefore, the following operations should not be executed right away.
        for (int i = 0; i < 10; i++) {
    4349:	83 c4 10             	add    $0x10,%esp
    434c:	ba 00 00 00 00       	mov    $0x0,%edx
    ASSERT_TRUE(write_file(TEST_1_SET_CPU, "2"));

    // Fork here since the process should not be running after we move it inside the cgroup.
    int pid = fork();
    int pidToMove = 0;
    int sum = 0;
    4351:	b8 00 00 00 00       	mov    $0x0,%eax
        // Go to sleep for long period of time.
        sleep(20);

        // At this point, the child process should already be inside the cgroup.
        // Therefore, the following operations should not be executed right away.
        for (int i = 0; i < 10; i++) {
    4356:	eb 06                	jmp    435e <test_no_run+0x14b>
            sum += 1;
    4358:	83 c0 01             	add    $0x1,%eax
        // Go to sleep for long period of time.
        sleep(20);

        // At this point, the child process should already be inside the cgroup.
        // Therefore, the following operations should not be executed right away.
        for (int i = 0; i < 10; i++) {
    435b:	83 c2 01             	add    $0x1,%edx
    435e:	83 fa 09             	cmp    $0x9,%edx
    4361:	7e f5                	jle    4358 <test_no_run+0x145>
            sum += 1;
        }

        // Save sum into temp file.
        temp_write(sum);
    4363:	83 ec 0c             	sub    $0xc,%esp
    4366:	50                   	push   %eax
    4367:	e8 9e c2 ff ff       	call   60a <temp_write>
        exit(0);
    436c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4373:	e8 fe 75 00 00       	call   b976 <exit>
    }
    // Father
    else {
        sleep(5);
    4378:	83 ec 0c             	sub    $0xc,%esp
    437b:	6a 05                	push   $0x5
    437d:	e8 84 76 00 00       	call   ba06 <sleep>
        // Read the child pid from temp file.
        pidToMove = temp_read(0);
    4382:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4389:	e8 16 c3 ff ff       	call   6a4 <temp_read>
    438e:	89 c3                	mov    %eax,%ebx
        // Update the temp file for further reading, since next sum will be read from it.
        ASSERT_TRUE(temp_write(0));
    4390:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4397:	e8 6e c2 ff ff       	call   60a <temp_write>
    439c:	83 c4 10             	add    $0x10,%esp
    439f:	85 c0                	test   %eax,%eax
    43a1:	74 19                	je     43bc <test_no_run+0x1a9>
    43a3:	eb 6e                	jmp    4413 <test_no_run+0x200>
    43a5:	83 ec 08             	sub    $0x8,%esp
    43a8:	68 3c bf 00 00       	push   $0xbf3c
    43ad:	6a 01                	push   $0x1
    43af:	e8 b3 77 00 00       	call   bb67 <printf>
    43b4:	83 c3 01             	add    $0x1,%ebx
    43b7:	83 c4 10             	add    $0x10,%esp
    43ba:	eb 05                	jmp    43c1 <test_no_run+0x1ae>
    43bc:	bb 00 00 00 00       	mov    $0x0,%ebx
    43c1:	83 ec 0c             	sub    $0xc,%esp
    43c4:	68 c5 c4 00 00       	push   $0xc4c5
    43c9:	e8 35 73 00 00       	call   b703 <strlen>
    43ce:	89 c7                	mov    %eax,%edi
    43d0:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    43d7:	e8 27 73 00 00       	call   b703 <strlen>
    43dc:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    43e0:	83 c4 10             	add    $0x10,%esp
    43e3:	39 d8                	cmp    %ebx,%eax
    43e5:	77 be                	ja     43a5 <test_no_run+0x192>
    43e7:	83 ec 0c             	sub    $0xc,%esp
    43ea:	68 d2 02 00 00       	push   $0x2d2
    43ef:	68 f9 bf 00 00       	push   $0xbff9
    43f4:	56                   	push   %esi
    43f5:	68 7c ee 00 00       	push   $0xee7c
    43fa:	6a 01                	push   $0x1
    43fc:	e8 66 77 00 00       	call   bb67 <printf>
    4401:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4408:	00 00 00 
    440b:	83 c4 20             	add    $0x20,%esp
    440e:	e9 0a 04 00 00       	jmp    481d <test_no_run+0x60a>

        // Move the child process to "/cgroup/test1" cgroup.
        ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, pidToMove));
    4413:	83 ec 08             	sub    $0x8,%esp
    4416:	53                   	push   %ebx
    4417:	68 06 c1 00 00       	push   $0xc106
    441c:	e8 16 c1 ff ff       	call   537 <move_proc>
    4421:	83 c4 10             	add    $0x10,%esp
    4424:	85 c0                	test   %eax,%eax
    4426:	74 19                	je     4441 <test_no_run+0x22e>
    4428:	eb 6e                	jmp    4498 <test_no_run+0x285>
    442a:	83 ec 08             	sub    $0x8,%esp
    442d:	68 3c bf 00 00       	push   $0xbf3c
    4432:	6a 01                	push   $0x1
    4434:	e8 2e 77 00 00       	call   bb67 <printf>
    4439:	83 c3 01             	add    $0x1,%ebx
    443c:	83 c4 10             	add    $0x10,%esp
    443f:	eb 05                	jmp    4446 <test_no_run+0x233>
    4441:	bb 00 00 00 00       	mov    $0x0,%ebx
    4446:	83 ec 0c             	sub    $0xc,%esp
    4449:	68 b4 ee 00 00       	push   $0xeeb4
    444e:	e8 b0 72 00 00       	call   b703 <strlen>
    4453:	89 c7                	mov    %eax,%edi
    4455:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    445c:	e8 a2 72 00 00       	call   b703 <strlen>
    4461:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4465:	83 c4 10             	add    $0x10,%esp
    4468:	39 d8                	cmp    %ebx,%eax
    446a:	77 be                	ja     442a <test_no_run+0x217>
    446c:	83 ec 0c             	sub    $0xc,%esp
    446f:	68 d5 02 00 00       	push   $0x2d5
    4474:	68 f9 bf 00 00       	push   $0xbff9
    4479:	56                   	push   %esi
    447a:	68 e0 ee 00 00       	push   $0xeee0
    447f:	6a 01                	push   $0x1
    4481:	e8 e1 76 00 00       	call   bb67 <printf>
    4486:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    448d:	00 00 00 
    4490:	83 c4 20             	add    $0x20,%esp
    4493:	e9 85 03 00 00       	jmp    481d <test_no_run+0x60a>

        // Check that the process we moved is really in "/cgroup/test1" cgroup.
        ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, pidToMove));
    4498:	83 ec 08             	sub    $0x8,%esp
    449b:	53                   	push   %ebx
    449c:	68 06 c1 00 00       	push   $0xc106
    44a1:	e8 c4 c0 ff ff       	call   56a <is_pid_in_group>
    44a6:	83 c4 10             	add    $0x10,%esp
    44a9:	85 c0                	test   %eax,%eax
    44ab:	74 19                	je     44c6 <test_no_run+0x2b3>
    44ad:	eb 6e                	jmp    451d <test_no_run+0x30a>
    44af:	83 ec 08             	sub    $0x8,%esp
    44b2:	68 3c bf 00 00       	push   $0xbf3c
    44b7:	6a 01                	push   $0x1
    44b9:	e8 a9 76 00 00       	call   bb67 <printf>
    44be:	83 c3 01             	add    $0x1,%ebx
    44c1:	83 c4 10             	add    $0x10,%esp
    44c4:	eb 05                	jmp    44cb <test_no_run+0x2b8>
    44c6:	bb 00 00 00 00       	mov    $0x0,%ebx
    44cb:	83 ec 0c             	sub    $0xc,%esp
    44ce:	68 34 ef 00 00       	push   $0xef34
    44d3:	e8 2b 72 00 00       	call   b703 <strlen>
    44d8:	89 c7                	mov    %eax,%edi
    44da:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    44e1:	e8 1d 72 00 00       	call   b703 <strlen>
    44e6:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    44ea:	83 c4 10             	add    $0x10,%esp
    44ed:	39 d8                	cmp    %ebx,%eax
    44ef:	77 be                	ja     44af <test_no_run+0x29c>
    44f1:	83 ec 0c             	sub    $0xc,%esp
    44f4:	68 d8 02 00 00       	push   $0x2d8
    44f9:	68 f9 bf 00 00       	push   $0xbff9
    44fe:	56                   	push   %esi
    44ff:	68 64 ef 00 00       	push   $0xef64
    4504:	6a 01                	push   $0x1
    4506:	e8 5c 76 00 00       	call   bb67 <printf>
    450b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4512:	00 00 00 
    4515:	83 c4 20             	add    $0x20,%esp
    4518:	e9 00 03 00 00       	jmp    481d <test_no_run+0x60a>

        // Go to sleep to ensure the child process had a chance to be scheduled.
        sleep(10);
    451d:	83 ec 0c             	sub    $0xc,%esp
    4520:	6a 0a                	push   $0xa
    4522:	e8 df 74 00 00       	call   ba06 <sleep>

        // Verify that the child process have not ran
        sum = temp_read(0);
    4527:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    452e:	e8 71 c1 ff ff       	call   6a4 <temp_read>
        ASSERT_UINT_EQ(sum, 0);
    4533:	83 c4 10             	add    $0x10,%esp
    4536:	85 c0                	test   %eax,%eax
    4538:	74 28                	je     4562 <test_no_run+0x34f>
    453a:	83 ec 0c             	sub    $0xc,%esp
    453d:	68 df 02 00 00       	push   $0x2df
    4542:	68 f9 bf 00 00       	push   $0xbff9
    4547:	6a 00                	push   $0x0
    4549:	50                   	push   %eax
    454a:	56                   	push   %esi
    454b:	e8 c4 ba ff ff       	call   14 <print_error>
    4550:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4557:	00 00 00 
    455a:	83 c4 20             	add    $0x20,%esp
    455d:	e9 bb 02 00 00       	jmp    481d <test_no_run+0x60a>

        // Return the child to root cgroup.
        ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, pidToMove));
    4562:	83 ec 08             	sub    $0x8,%esp
    4565:	53                   	push   %ebx
    4566:	68 09 c4 00 00       	push   $0xc409
    456b:	e8 c7 bf ff ff       	call   537 <move_proc>
    4570:	83 c4 10             	add    $0x10,%esp
    4573:	85 c0                	test   %eax,%eax
    4575:	74 19                	je     4590 <test_no_run+0x37d>
    4577:	eb 6e                	jmp    45e7 <test_no_run+0x3d4>
    4579:	83 ec 08             	sub    $0x8,%esp
    457c:	68 3c bf 00 00       	push   $0xbf3c
    4581:	6a 01                	push   $0x1
    4583:	e8 df 75 00 00       	call   bb67 <printf>
    4588:	83 c3 01             	add    $0x1,%ebx
    458b:	83 c4 10             	add    $0x10,%esp
    458e:	eb 05                	jmp    4595 <test_no_run+0x382>
    4590:	bb 00 00 00 00       	mov    $0x0,%ebx
    4595:	83 ec 0c             	sub    $0xc,%esp
    4598:	68 c0 ef 00 00       	push   $0xefc0
    459d:	e8 61 71 00 00       	call   b703 <strlen>
    45a2:	89 c7                	mov    %eax,%edi
    45a4:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    45ab:	e8 53 71 00 00       	call   b703 <strlen>
    45b0:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    45b4:	83 c4 10             	add    $0x10,%esp
    45b7:	39 d8                	cmp    %ebx,%eax
    45b9:	77 be                	ja     4579 <test_no_run+0x366>
    45bb:	83 ec 0c             	sub    $0xc,%esp
    45be:	68 e2 02 00 00       	push   $0x2e2
    45c3:	68 f9 bf 00 00       	push   $0xbff9
    45c8:	56                   	push   %esi
    45c9:	68 e8 ef 00 00       	push   $0xefe8
    45ce:	6a 01                	push   $0x1
    45d0:	e8 92 75 00 00       	call   bb67 <printf>
    45d5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    45dc:	00 00 00 
    45df:	83 c4 20             	add    $0x20,%esp
    45e2:	e9 36 02 00 00       	jmp    481d <test_no_run+0x60a>

        // Check that the child we returned is really in root cgroup.
        ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, pidToMove));
    45e7:	83 ec 08             	sub    $0x8,%esp
    45ea:	53                   	push   %ebx
    45eb:	68 09 c4 00 00       	push   $0xc409
    45f0:	e8 75 bf ff ff       	call   56a <is_pid_in_group>
    45f5:	83 c4 10             	add    $0x10,%esp
    45f8:	85 c0                	test   %eax,%eax
    45fa:	74 19                	je     4615 <test_no_run+0x402>
    45fc:	eb 6e                	jmp    466c <test_no_run+0x459>
    45fe:	83 ec 08             	sub    $0x8,%esp
    4601:	68 3c bf 00 00       	push   $0xbf3c
    4606:	6a 01                	push   $0x1
    4608:	e8 5a 75 00 00       	call   bb67 <printf>
    460d:	83 c3 01             	add    $0x1,%ebx
    4610:	83 c4 10             	add    $0x10,%esp
    4613:	eb 05                	jmp    461a <test_no_run+0x407>
    4615:	bb 00 00 00 00       	mov    $0x0,%ebx
    461a:	83 ec 0c             	sub    $0xc,%esp
    461d:	68 3c f0 00 00       	push   $0xf03c
    4622:	e8 dc 70 00 00       	call   b703 <strlen>
    4627:	89 c7                	mov    %eax,%edi
    4629:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4630:	e8 ce 70 00 00       	call   b703 <strlen>
    4635:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4639:	83 c4 10             	add    $0x10,%esp
    463c:	39 d8                	cmp    %ebx,%eax
    463e:	77 be                	ja     45fe <test_no_run+0x3eb>
    4640:	83 ec 0c             	sub    $0xc,%esp
    4643:	68 e5 02 00 00       	push   $0x2e5
    4648:	68 f9 bf 00 00       	push   $0xbff9
    464d:	56                   	push   %esi
    464e:	68 6c f0 00 00       	push   $0xf06c
    4653:	6a 01                	push   $0x1
    4655:	e8 0d 75 00 00       	call   bb67 <printf>
    465a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4661:	00 00 00 
    4664:	83 c4 20             	add    $0x20,%esp
    4667:	e9 b1 01 00 00       	jmp    481d <test_no_run+0x60a>

        // Wait for child to exit.
        wait(&wstatus);
    466c:	83 ec 0c             	sub    $0xc,%esp
    466f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4672:	50                   	push   %eax
    4673:	e8 06 73 00 00       	call   b97e <wait>
        ASSERT_TRUE(wstatus);
    4678:	83 c4 10             	add    $0x10,%esp
    467b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    467f:	74 19                	je     469a <test_no_run+0x487>
    4681:	eb 6e                	jmp    46f1 <test_no_run+0x4de>
    4683:	83 ec 08             	sub    $0x8,%esp
    4686:	68 3c bf 00 00       	push   $0xbf3c
    468b:	6a 01                	push   $0x1
    468d:	e8 d5 74 00 00       	call   bb67 <printf>
    4692:	83 c3 01             	add    $0x1,%ebx
    4695:	83 c4 10             	add    $0x10,%esp
    4698:	eb 05                	jmp    469f <test_no_run+0x48c>
    469a:	bb 00 00 00 00       	mov    $0x0,%ebx
    469f:	83 ec 0c             	sub    $0xc,%esp
    46a2:	68 d3 c4 00 00       	push   $0xc4d3
    46a7:	e8 57 70 00 00       	call   b703 <strlen>
    46ac:	89 c7                	mov    %eax,%edi
    46ae:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    46b5:	e8 49 70 00 00       	call   b703 <strlen>
    46ba:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    46be:	83 c4 10             	add    $0x10,%esp
    46c1:	39 d8                	cmp    %ebx,%eax
    46c3:	77 be                	ja     4683 <test_no_run+0x470>
    46c5:	83 ec 0c             	sub    $0xc,%esp
    46c8:	68 e9 02 00 00       	push   $0x2e9
    46cd:	68 f9 bf 00 00       	push   $0xbff9
    46d2:	56                   	push   %esi
    46d3:	68 c4 f0 00 00       	push   $0xf0c4
    46d8:	6a 01                	push   $0x1
    46da:	e8 88 74 00 00       	call   bb67 <printf>
    46df:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    46e6:	00 00 00 
    46e9:	83 c4 20             	add    $0x20,%esp
    46ec:	e9 2c 01 00 00       	jmp    481d <test_no_run+0x60a>

        // Verify that child did execute the procudure.
        sum = temp_read(0);
    46f1:	83 ec 0c             	sub    $0xc,%esp
    46f4:	6a 00                	push   $0x0
    46f6:	e8 a9 bf ff ff       	call   6a4 <temp_read>
        ASSERT_UINT_EQ(sum, 10);
    46fb:	83 c4 10             	add    $0x10,%esp
    46fe:	83 f8 0a             	cmp    $0xa,%eax
    4701:	74 28                	je     472b <test_no_run+0x518>
    4703:	83 ec 0c             	sub    $0xc,%esp
    4706:	68 ed 02 00 00       	push   $0x2ed
    470b:	68 f9 bf 00 00       	push   $0xbff9
    4710:	6a 0a                	push   $0xa
    4712:	50                   	push   %eax
    4713:	56                   	push   %esi
    4714:	e8 fb b8 ff ff       	call   14 <print_error>
    4719:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4720:	00 00 00 
    4723:	83 c4 20             	add    $0x20,%esp
    4726:	e9 f2 00 00 00       	jmp    481d <test_no_run+0x60a>

        // Remove the temp file.
        ASSERT_TRUE(temp_delete());
    472b:	e8 91 bf ff ff       	call   6c1 <temp_delete>
    4730:	85 c0                	test   %eax,%eax
    4732:	74 19                	je     474d <test_no_run+0x53a>
    4734:	eb 6b                	jmp    47a1 <test_no_run+0x58e>
    4736:	83 ec 08             	sub    $0x8,%esp
    4739:	68 3c bf 00 00       	push   $0xbf3c
    473e:	6a 01                	push   $0x1
    4740:	e8 22 74 00 00       	call   bb67 <printf>
    4745:	83 c3 01             	add    $0x1,%ebx
    4748:	83 c4 10             	add    $0x10,%esp
    474b:	eb 05                	jmp    4752 <test_no_run+0x53f>
    474d:	bb 00 00 00 00       	mov    $0x0,%ebx
    4752:	83 ec 0c             	sub    $0xc,%esp
    4755:	68 db c4 00 00       	push   $0xc4db
    475a:	e8 a4 6f 00 00       	call   b703 <strlen>
    475f:	89 c7                	mov    %eax,%edi
    4761:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4768:	e8 96 6f 00 00       	call   b703 <strlen>
    476d:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4771:	83 c4 10             	add    $0x10,%esp
    4774:	39 d8                	cmp    %ebx,%eax
    4776:	77 be                	ja     4736 <test_no_run+0x523>
    4778:	83 ec 0c             	sub    $0xc,%esp
    477b:	68 f0 02 00 00       	push   $0x2f0
    4780:	68 f9 bf 00 00       	push   $0xbff9
    4785:	56                   	push   %esi
    4786:	68 f8 f0 00 00       	push   $0xf0f8
    478b:	6a 01                	push   $0x1
    478d:	e8 d5 73 00 00       	call   bb67 <printf>
    4792:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4799:	00 00 00 
    479c:	83 c4 20             	add    $0x20,%esp
    479f:	eb 7c                	jmp    481d <test_no_run+0x60a>

        // Disable cpu set controller.
        ASSERT_TRUE(disable_controller(SET_CNT));
    47a1:	83 ec 0c             	sub    $0xc,%esp
    47a4:	6a 02                	push   $0x2
    47a6:	e8 0a bc ff ff       	call   3b5 <disable_controller>
    47ab:	83 c4 10             	add    $0x10,%esp
    47ae:	85 c0                	test   %eax,%eax
    47b0:	74 19                	je     47cb <test_no_run+0x5b8>
    47b2:	eb 69                	jmp    481d <test_no_run+0x60a>
    47b4:	83 ec 08             	sub    $0x8,%esp
    47b7:	68 3c bf 00 00       	push   $0xbf3c
    47bc:	6a 01                	push   $0x1
    47be:	e8 a4 73 00 00       	call   bb67 <printf>
    47c3:	83 c3 01             	add    $0x1,%ebx
    47c6:	83 c4 10             	add    $0x10,%esp
    47c9:	eb 05                	jmp    47d0 <test_no_run+0x5bd>
    47cb:	bb 00 00 00 00       	mov    $0x0,%ebx
    47d0:	83 ec 0c             	sub    $0xc,%esp
    47d3:	68 8f c4 00 00       	push   $0xc48f
    47d8:	e8 26 6f 00 00       	call   b703 <strlen>
    47dd:	89 c7                	mov    %eax,%edi
    47df:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    47e6:	e8 18 6f 00 00       	call   b703 <strlen>
    47eb:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    47ef:	83 c4 10             	add    $0x10,%esp
    47f2:	39 d8                	cmp    %ebx,%eax
    47f4:	77 be                	ja     47b4 <test_no_run+0x5a1>
    47f6:	83 ec 0c             	sub    $0xc,%esp
    47f9:	68 f3 02 00 00       	push   $0x2f3
    47fe:	68 f9 bf 00 00       	push   $0xbff9
    4803:	56                   	push   %esi
    4804:	68 4c eb 00 00       	push   $0xeb4c
    4809:	6a 01                	push   $0x1
    480b:	e8 57 73 00 00       	call   bb67 <printf>
    4810:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4817:	00 00 00 
    481a:	83 c4 20             	add    $0x20,%esp
    }
}
    481d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4820:	5b                   	pop    %ebx
    4821:	5e                   	pop    %esi
    4822:	5f                   	pop    %edi
    4823:	5d                   	pop    %ebp
    4824:	c3                   	ret    

00004825 <test_setting_freeze>:

TEST(test_setting_freeze)
{
    4825:	55                   	push   %ebp
    4826:	89 e5                	mov    %esp,%ebp
    4828:	57                   	push   %edi
    4829:	56                   	push   %esi
    482a:	53                   	push   %ebx
    482b:	83 ec 14             	sub    $0x14,%esp
    482e:	8b 75 08             	mov    0x8(%ebp),%esi
    // Verify frozen start as 0.
    ASSERT_FALSE(strcmp(read_file(TEST_1_CGROUP_EVENTS, 0), "populated - 0\nfrozen - 0\n"));
    4831:	6a 00                	push   $0x0
    4833:	68 21 c1 00 00       	push   $0xc121
    4838:	e8 5f b9 ff ff       	call   19c <read_file>
    483d:	83 c4 08             	add    $0x8,%esp
    4840:	68 e9 c4 00 00       	push   $0xc4e9
    4845:	50                   	push   %eax
    4846:	e8 62 6e 00 00       	call   b6ad <strcmp>
    484b:	83 c4 10             	add    $0x10,%esp
    484e:	85 c0                	test   %eax,%eax
    4850:	75 19                	jne    486b <test_setting_freeze+0x46>
    4852:	eb 6e                	jmp    48c2 <test_setting_freeze+0x9d>
    4854:	83 ec 08             	sub    $0x8,%esp
    4857:	68 3c bf 00 00       	push   $0xbf3c
    485c:	6a 01                	push   $0x1
    485e:	e8 04 73 00 00       	call   bb67 <printf>
    4863:	83 c3 01             	add    $0x1,%ebx
    4866:	83 c4 10             	add    $0x10,%esp
    4869:	eb 05                	jmp    4870 <test_setting_freeze+0x4b>
    486b:	bb 00 00 00 00       	mov    $0x0,%ebx
    4870:	83 ec 0c             	sub    $0xc,%esp
    4873:	68 30 f1 00 00       	push   $0xf130
    4878:	e8 86 6e 00 00       	call   b703 <strlen>
    487d:	89 c7                	mov    %eax,%edi
    487f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4886:	e8 78 6e 00 00       	call   b703 <strlen>
    488b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    488f:	83 c4 10             	add    $0x10,%esp
    4892:	39 d8                	cmp    %ebx,%eax
    4894:	77 be                	ja     4854 <test_setting_freeze+0x2f>
    4896:	83 ec 0c             	sub    $0xc,%esp
    4899:	68 fa 02 00 00       	push   $0x2fa
    489e:	68 f9 bf 00 00       	push   $0xbff9
    48a3:	56                   	push   %esi
    48a4:	68 7c f1 00 00       	push   $0xf17c
    48a9:	6a 01                	push   $0x1
    48ab:	e8 b7 72 00 00       	call   bb67 <printf>
    48b0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    48b7:	00 00 00 
    48ba:	83 c4 20             	add    $0x20,%esp
    48bd:	e9 5d 03 00 00       	jmp    4c1f <test_setting_freeze+0x3fa>

    // Update frozen.
    ASSERT_TRUE(write_file(TEST_1_SET_FRZ, "1"));
    48c2:	83 ec 08             	sub    $0x8,%esp
    48c5:	68 37 c6 00 00       	push   $0xc637
    48ca:	68 e7 c1 00 00       	push   $0xc1e7
    48cf:	e8 7a b9 ff ff       	call   24e <write_file>
    48d4:	83 c4 10             	add    $0x10,%esp
    48d7:	85 c0                	test   %eax,%eax
    48d9:	74 19                	je     48f4 <test_setting_freeze+0xcf>
    48db:	eb 6e                	jmp    494b <test_setting_freeze+0x126>
    48dd:	83 ec 08             	sub    $0x8,%esp
    48e0:	68 3c bf 00 00       	push   $0xbf3c
    48e5:	6a 01                	push   $0x1
    48e7:	e8 7b 72 00 00       	call   bb67 <printf>
    48ec:	83 c3 01             	add    $0x1,%ebx
    48ef:	83 c4 10             	add    $0x10,%esp
    48f2:	eb 05                	jmp    48f9 <test_setting_freeze+0xd4>
    48f4:	bb 00 00 00 00       	mov    $0x0,%ebx
    48f9:	83 ec 0c             	sub    $0xc,%esp
    48fc:	68 f0 f1 00 00       	push   $0xf1f0
    4901:	e8 fd 6d 00 00       	call   b703 <strlen>
    4906:	89 c7                	mov    %eax,%edi
    4908:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    490f:	e8 ef 6d 00 00       	call   b703 <strlen>
    4914:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4918:	83 c4 10             	add    $0x10,%esp
    491b:	39 d8                	cmp    %ebx,%eax
    491d:	77 be                	ja     48dd <test_setting_freeze+0xb8>
    491f:	83 ec 0c             	sub    $0xc,%esp
    4922:	68 fd 02 00 00       	push   $0x2fd
    4927:	68 f9 bf 00 00       	push   $0xbff9
    492c:	56                   	push   %esi
    492d:	68 10 f2 00 00       	push   $0xf210
    4932:	6a 01                	push   $0x1
    4934:	e8 2e 72 00 00       	call   bb67 <printf>
    4939:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4940:	00 00 00 
    4943:	83 c4 20             	add    $0x20,%esp
    4946:	e9 d4 02 00 00       	jmp    4c1f <test_setting_freeze+0x3fa>

    // Check changes.
    ASSERT_FALSE(strcmp(read_file(TEST_1_SET_FRZ, 0), "1\n"));
    494b:	83 ec 08             	sub    $0x8,%esp
    494e:	6a 00                	push   $0x0
    4950:	68 e7 c1 00 00       	push   $0xc1e7
    4955:	e8 42 b8 ff ff       	call   19c <read_file>
    495a:	83 c4 08             	add    $0x8,%esp
    495d:	68 1a c5 00 00       	push   $0xc51a
    4962:	50                   	push   %eax
    4963:	e8 45 6d 00 00       	call   b6ad <strcmp>
    4968:	83 c4 10             	add    $0x10,%esp
    496b:	85 c0                	test   %eax,%eax
    496d:	75 19                	jne    4988 <test_setting_freeze+0x163>
    496f:	eb 6e                	jmp    49df <test_setting_freeze+0x1ba>
    4971:	83 ec 08             	sub    $0x8,%esp
    4974:	68 3c bf 00 00       	push   $0xbf3c
    4979:	6a 01                	push   $0x1
    497b:	e8 e7 71 00 00       	call   bb67 <printf>
    4980:	83 c3 01             	add    $0x1,%ebx
    4983:	83 c4 10             	add    $0x10,%esp
    4986:	eb 05                	jmp    498d <test_setting_freeze+0x168>
    4988:	bb 00 00 00 00       	mov    $0x0,%ebx
    498d:	83 ec 0c             	sub    $0xc,%esp
    4990:	68 5c f2 00 00       	push   $0xf25c
    4995:	e8 69 6d 00 00       	call   b703 <strlen>
    499a:	89 c7                	mov    %eax,%edi
    499c:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    49a3:	e8 5b 6d 00 00       	call   b703 <strlen>
    49a8:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    49ac:	83 c4 10             	add    $0x10,%esp
    49af:	39 d8                	cmp    %ebx,%eax
    49b1:	77 be                	ja     4971 <test_setting_freeze+0x14c>
    49b3:	83 ec 0c             	sub    $0xc,%esp
    49b6:	68 00 03 00 00       	push   $0x300
    49bb:	68 f9 bf 00 00       	push   $0xbff9
    49c0:	56                   	push   %esi
    49c1:	68 88 f2 00 00       	push   $0xf288
    49c6:	6a 01                	push   $0x1
    49c8:	e8 9a 71 00 00       	call   bb67 <printf>
    49cd:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    49d4:	00 00 00 
    49d7:	83 c4 20             	add    $0x20,%esp
    49da:	e9 40 02 00 00       	jmp    4c1f <test_setting_freeze+0x3fa>

    // Check Evenets correctly recorded.
    ASSERT_FALSE(strcmp(read_file(TEST_1_CGROUP_EVENTS, 0), "populated - 0\nfrozen - 1\n"));
    49df:	83 ec 08             	sub    $0x8,%esp
    49e2:	6a 00                	push   $0x0
    49e4:	68 21 c1 00 00       	push   $0xc121
    49e9:	e8 ae b7 ff ff       	call   19c <read_file>
    49ee:	83 c4 08             	add    $0x8,%esp
    49f1:	68 03 c5 00 00       	push   $0xc503
    49f6:	50                   	push   %eax
    49f7:	e8 b1 6c 00 00       	call   b6ad <strcmp>
    49fc:	83 c4 10             	add    $0x10,%esp
    49ff:	85 c0                	test   %eax,%eax
    4a01:	75 19                	jne    4a1c <test_setting_freeze+0x1f7>
    4a03:	eb 6e                	jmp    4a73 <test_setting_freeze+0x24e>
    4a05:	83 ec 08             	sub    $0x8,%esp
    4a08:	68 3c bf 00 00       	push   $0xbf3c
    4a0d:	6a 01                	push   $0x1
    4a0f:	e8 53 71 00 00       	call   bb67 <printf>
    4a14:	83 c3 01             	add    $0x1,%ebx
    4a17:	83 c4 10             	add    $0x10,%esp
    4a1a:	eb 05                	jmp    4a21 <test_setting_freeze+0x1fc>
    4a1c:	bb 00 00 00 00       	mov    $0x0,%ebx
    4a21:	83 ec 0c             	sub    $0xc,%esp
    4a24:	68 e0 f2 00 00       	push   $0xf2e0
    4a29:	e8 d5 6c 00 00       	call   b703 <strlen>
    4a2e:	89 c7                	mov    %eax,%edi
    4a30:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4a37:	e8 c7 6c 00 00       	call   b703 <strlen>
    4a3c:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4a40:	83 c4 10             	add    $0x10,%esp
    4a43:	39 d8                	cmp    %ebx,%eax
    4a45:	77 be                	ja     4a05 <test_setting_freeze+0x1e0>
    4a47:	83 ec 0c             	sub    $0xc,%esp
    4a4a:	68 03 03 00 00       	push   $0x303
    4a4f:	68 f9 bf 00 00       	push   $0xbff9
    4a54:	56                   	push   %esi
    4a55:	68 2c f3 00 00       	push   $0xf32c
    4a5a:	6a 01                	push   $0x1
    4a5c:	e8 06 71 00 00       	call   bb67 <printf>
    4a61:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4a68:	00 00 00 
    4a6b:	83 c4 20             	add    $0x20,%esp
    4a6e:	e9 ac 01 00 00       	jmp    4c1f <test_setting_freeze+0x3fa>

    // Restore frozen.
    ASSERT_TRUE(write_file(TEST_1_SET_FRZ, "0"));
    4a73:	83 ec 08             	sub    $0x8,%esp
    4a76:	68 9b c3 00 00       	push   $0xc39b
    4a7b:	68 e7 c1 00 00       	push   $0xc1e7
    4a80:	e8 c9 b7 ff ff       	call   24e <write_file>
    4a85:	83 c4 10             	add    $0x10,%esp
    4a88:	85 c0                	test   %eax,%eax
    4a8a:	74 19                	je     4aa5 <test_setting_freeze+0x280>
    4a8c:	eb 6e                	jmp    4afc <test_setting_freeze+0x2d7>
    4a8e:	83 ec 08             	sub    $0x8,%esp
    4a91:	68 3c bf 00 00       	push   $0xbf3c
    4a96:	6a 01                	push   $0x1
    4a98:	e8 ca 70 00 00       	call   bb67 <printf>
    4a9d:	83 c3 01             	add    $0x1,%ebx
    4aa0:	83 c4 10             	add    $0x10,%esp
    4aa3:	eb 05                	jmp    4aaa <test_setting_freeze+0x285>
    4aa5:	bb 00 00 00 00       	mov    $0x0,%ebx
    4aaa:	83 ec 0c             	sub    $0xc,%esp
    4aad:	68 a0 f3 00 00       	push   $0xf3a0
    4ab2:	e8 4c 6c 00 00       	call   b703 <strlen>
    4ab7:	89 c7                	mov    %eax,%edi
    4ab9:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4ac0:	e8 3e 6c 00 00       	call   b703 <strlen>
    4ac5:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4ac9:	83 c4 10             	add    $0x10,%esp
    4acc:	39 d8                	cmp    %ebx,%eax
    4ace:	77 be                	ja     4a8e <test_setting_freeze+0x269>
    4ad0:	83 ec 0c             	sub    $0xc,%esp
    4ad3:	68 06 03 00 00       	push   $0x306
    4ad8:	68 f9 bf 00 00       	push   $0xbff9
    4add:	56                   	push   %esi
    4ade:	68 c0 f3 00 00       	push   $0xf3c0
    4ae3:	6a 01                	push   $0x1
    4ae5:	e8 7d 70 00 00       	call   bb67 <printf>
    4aea:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4af1:	00 00 00 
    4af4:	83 c4 20             	add    $0x20,%esp
    4af7:	e9 23 01 00 00       	jmp    4c1f <test_setting_freeze+0x3fa>

    // Verify frozen is 0 again.
    ASSERT_FALSE(strcmp(read_file(TEST_1_CGROUP_EVENTS, 0), "populated - 0\nfrozen - 0\n"));
    4afc:	83 ec 08             	sub    $0x8,%esp
    4aff:	6a 00                	push   $0x0
    4b01:	68 21 c1 00 00       	push   $0xc121
    4b06:	e8 91 b6 ff ff       	call   19c <read_file>
    4b0b:	83 c4 08             	add    $0x8,%esp
    4b0e:	68 e9 c4 00 00       	push   $0xc4e9
    4b13:	50                   	push   %eax
    4b14:	e8 94 6b 00 00       	call   b6ad <strcmp>
    4b19:	83 c4 10             	add    $0x10,%esp
    4b1c:	85 c0                	test   %eax,%eax
    4b1e:	75 19                	jne    4b39 <test_setting_freeze+0x314>
    4b20:	eb 6e                	jmp    4b90 <test_setting_freeze+0x36b>
    4b22:	83 ec 08             	sub    $0x8,%esp
    4b25:	68 3c bf 00 00       	push   $0xbf3c
    4b2a:	6a 01                	push   $0x1
    4b2c:	e8 36 70 00 00       	call   bb67 <printf>
    4b31:	83 c3 01             	add    $0x1,%ebx
    4b34:	83 c4 10             	add    $0x10,%esp
    4b37:	eb 05                	jmp    4b3e <test_setting_freeze+0x319>
    4b39:	bb 00 00 00 00       	mov    $0x0,%ebx
    4b3e:	83 ec 0c             	sub    $0xc,%esp
    4b41:	68 30 f1 00 00       	push   $0xf130
    4b46:	e8 b8 6b 00 00       	call   b703 <strlen>
    4b4b:	89 c7                	mov    %eax,%edi
    4b4d:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4b54:	e8 aa 6b 00 00       	call   b703 <strlen>
    4b59:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4b5d:	83 c4 10             	add    $0x10,%esp
    4b60:	39 d8                	cmp    %ebx,%eax
    4b62:	77 be                	ja     4b22 <test_setting_freeze+0x2fd>
    4b64:	83 ec 0c             	sub    $0xc,%esp
    4b67:	68 09 03 00 00       	push   $0x309
    4b6c:	68 f9 bf 00 00       	push   $0xbff9
    4b71:	56                   	push   %esi
    4b72:	68 7c f1 00 00       	push   $0xf17c
    4b77:	6a 01                	push   $0x1
    4b79:	e8 e9 6f 00 00       	call   bb67 <printf>
    4b7e:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4b85:	00 00 00 
    4b88:	83 c4 20             	add    $0x20,%esp
    4b8b:	e9 8f 00 00 00       	jmp    4c1f <test_setting_freeze+0x3fa>

    // Check changes.
    ASSERT_FALSE(strcmp(read_file(TEST_1_SET_FRZ, 0), "0\n"));
    4b90:	83 ec 08             	sub    $0x8,%esp
    4b93:	6a 00                	push   $0x0
    4b95:	68 e7 c1 00 00       	push   $0xc1e7
    4b9a:	e8 fd b5 ff ff       	call   19c <read_file>
    4b9f:	83 c4 08             	add    $0x8,%esp
    4ba2:	68 00 c5 00 00       	push   $0xc500
    4ba7:	50                   	push   %eax
    4ba8:	e8 00 6b 00 00       	call   b6ad <strcmp>
    4bad:	83 c4 10             	add    $0x10,%esp
    4bb0:	85 c0                	test   %eax,%eax
    4bb2:	75 19                	jne    4bcd <test_setting_freeze+0x3a8>
    4bb4:	eb 69                	jmp    4c1f <test_setting_freeze+0x3fa>
    4bb6:	83 ec 08             	sub    $0x8,%esp
    4bb9:	68 3c bf 00 00       	push   $0xbf3c
    4bbe:	6a 01                	push   $0x1
    4bc0:	e8 a2 6f 00 00       	call   bb67 <printf>
    4bc5:	83 c3 01             	add    $0x1,%ebx
    4bc8:	83 c4 10             	add    $0x10,%esp
    4bcb:	eb 05                	jmp    4bd2 <test_setting_freeze+0x3ad>
    4bcd:	bb 00 00 00 00       	mov    $0x0,%ebx
    4bd2:	83 ec 0c             	sub    $0xc,%esp
    4bd5:	68 0c f4 00 00       	push   $0xf40c
    4bda:	e8 24 6b 00 00       	call   b703 <strlen>
    4bdf:	89 c7                	mov    %eax,%edi
    4be1:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4be8:	e8 16 6b 00 00       	call   b703 <strlen>
    4bed:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4bf1:	83 c4 10             	add    $0x10,%esp
    4bf4:	39 d8                	cmp    %ebx,%eax
    4bf6:	77 be                	ja     4bb6 <test_setting_freeze+0x391>
    4bf8:	83 ec 0c             	sub    $0xc,%esp
    4bfb:	68 0c 03 00 00       	push   $0x30c
    4c00:	68 f9 bf 00 00       	push   $0xbff9
    4c05:	56                   	push   %esi
    4c06:	68 38 f4 00 00       	push   $0xf438
    4c0b:	6a 01                	push   $0x1
    4c0d:	e8 55 6f 00 00       	call   bb67 <printf>
    4c12:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4c19:	00 00 00 
    4c1c:	83 c4 20             	add    $0x20,%esp
}
    4c1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4c22:	5b                   	pop    %ebx
    4c23:	5e                   	pop    %esi
    4c24:	5f                   	pop    %edi
    4c25:	5d                   	pop    %ebp
    4c26:	c3                   	ret    

00004c27 <test_frozen_not_running>:

TEST(test_frozen_not_running)
{
    4c27:	55                   	push   %ebp
    4c28:	89 e5                	mov    %esp,%ebp
    4c2a:	57                   	push   %edi
    4c2b:	56                   	push   %esi
    4c2c:	53                   	push   %ebx
    4c2d:	83 ec 24             	sub    $0x24,%esp
    4c30:	8b 75 08             	mov    0x8(%ebp),%esi
    // Update frozen.
    ASSERT_TRUE(write_file(TEST_1_SET_FRZ, "1"));
    4c33:	68 37 c6 00 00       	push   $0xc637
    4c38:	68 e7 c1 00 00       	push   $0xc1e7
    4c3d:	e8 0c b6 ff ff       	call   24e <write_file>
    4c42:	83 c4 10             	add    $0x10,%esp
    4c45:	85 c0                	test   %eax,%eax
    4c47:	74 19                	je     4c62 <test_frozen_not_running+0x3b>
    4c49:	eb 6e                	jmp    4cb9 <test_frozen_not_running+0x92>
    4c4b:	83 ec 08             	sub    $0x8,%esp
    4c4e:	68 3c bf 00 00       	push   $0xbf3c
    4c53:	6a 01                	push   $0x1
    4c55:	e8 0d 6f 00 00       	call   bb67 <printf>
    4c5a:	83 c3 01             	add    $0x1,%ebx
    4c5d:	83 c4 10             	add    $0x10,%esp
    4c60:	eb 05                	jmp    4c67 <test_frozen_not_running+0x40>
    4c62:	bb 00 00 00 00       	mov    $0x0,%ebx
    4c67:	83 ec 0c             	sub    $0xc,%esp
    4c6a:	68 f0 f1 00 00       	push   $0xf1f0
    4c6f:	e8 8f 6a 00 00       	call   b703 <strlen>
    4c74:	89 c7                	mov    %eax,%edi
    4c76:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4c7d:	e8 81 6a 00 00       	call   b703 <strlen>
    4c82:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4c86:	83 c4 10             	add    $0x10,%esp
    4c89:	39 d8                	cmp    %ebx,%eax
    4c8b:	77 be                	ja     4c4b <test_frozen_not_running+0x24>
    4c8d:	83 ec 0c             	sub    $0xc,%esp
    4c90:	68 12 03 00 00       	push   $0x312
    4c95:	68 f9 bf 00 00       	push   $0xbff9
    4c9a:	56                   	push   %esi
    4c9b:	68 10 f2 00 00       	push   $0xf210
    4ca0:	6a 01                	push   $0x1
    4ca2:	e8 c0 6e 00 00       	call   bb67 <printf>
    4ca7:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4cae:	00 00 00 
    4cb1:	83 c4 20             	add    $0x20,%esp
    4cb4:	e9 f0 05 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

    // Fork here since the process should not be running after we move it inside the cgroup.
    int pid = fork();
    4cb9:	e8 b0 6c 00 00       	call   b96e <fork>
    int pidToMove = 0;
    int sum = 0;
    int wstatus;

    // Child
    if (pid == 0) {
    4cbe:	85 c0                	test   %eax,%eax
    4cc0:	0f 85 33 01 00 00    	jne    4df9 <test_frozen_not_running+0x1d2>
        pidToMove = getpid();
    4cc6:	e8 2b 6d 00 00       	call   b9f6 <getpid>
        // Save the pid of child in temp file.
        ASSERT_TRUE(temp_write(pidToMove));
    4ccb:	83 ec 0c             	sub    $0xc,%esp
    4cce:	50                   	push   %eax
    4ccf:	e8 36 b9 ff ff       	call   60a <temp_write>
    4cd4:	83 c4 10             	add    $0x10,%esp
    4cd7:	85 c0                	test   %eax,%eax
    4cd9:	74 19                	je     4cf4 <test_frozen_not_running+0xcd>
    4cdb:	eb 6e                	jmp    4d4b <test_frozen_not_running+0x124>
    4cdd:	83 ec 08             	sub    $0x8,%esp
    4ce0:	68 3c bf 00 00       	push   $0xbf3c
    4ce5:	6a 01                	push   $0x1
    4ce7:	e8 7b 6e 00 00       	call   bb67 <printf>
    4cec:	83 c3 01             	add    $0x1,%ebx
    4cef:	83 c4 10             	add    $0x10,%esp
    4cf2:	eb 05                	jmp    4cf9 <test_frozen_not_running+0xd2>
    4cf4:	bb 00 00 00 00       	mov    $0x0,%ebx
    4cf9:	83 ec 0c             	sub    $0xc,%esp
    4cfc:	68 1d c5 00 00       	push   $0xc51d
    4d01:	e8 fd 69 00 00       	call   b703 <strlen>
    4d06:	89 c7                	mov    %eax,%edi
    4d08:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4d0f:	e8 ef 69 00 00       	call   b703 <strlen>
    4d14:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4d18:	83 c4 10             	add    $0x10,%esp
    4d1b:	39 d8                	cmp    %ebx,%eax
    4d1d:	77 be                	ja     4cdd <test_frozen_not_running+0xb6>
    4d1f:	83 ec 0c             	sub    $0xc,%esp
    4d22:	68 1e 03 00 00       	push   $0x31e
    4d27:	68 f9 bf 00 00       	push   $0xbff9
    4d2c:	56                   	push   %esi
    4d2d:	68 90 f4 00 00       	push   $0xf490
    4d32:	6a 01                	push   $0x1
    4d34:	e8 2e 6e 00 00       	call   bb67 <printf>
    4d39:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4d40:	00 00 00 
    4d43:	83 c4 20             	add    $0x20,%esp
    4d46:	e9 5e 05 00 00       	jmp    52a9 <test_frozen_not_running+0x682>
        // Go to sleep for long period of time.
        sleep(20);
    4d4b:	83 ec 0c             	sub    $0xc,%esp
    4d4e:	6a 14                	push   $0x14
    4d50:	e8 b1 6c 00 00       	call   ba06 <sleep>
        // At this point, the child process should already be inside the cgroup, therefore, the following operations
        // should not be executed.
        for (int i = 0; i < 10; i++) {
    4d55:	83 c4 10             	add    $0x10,%esp
    4d58:	b8 00 00 00 00       	mov    $0x0,%eax
    ASSERT_TRUE(write_file(TEST_1_SET_FRZ, "1"));

    // Fork here since the process should not be running after we move it inside the cgroup.
    int pid = fork();
    int pidToMove = 0;
    int sum = 0;
    4d5d:	ba 00 00 00 00       	mov    $0x0,%edx
        ASSERT_TRUE(temp_write(pidToMove));
        // Go to sleep for long period of time.
        sleep(20);
        // At this point, the child process should already be inside the cgroup, therefore, the following operations
        // should not be executed.
        for (int i = 0; i < 10; i++) {
    4d62:	eb 06                	jmp    4d6a <test_frozen_not_running+0x143>
            sum += 1;
    4d64:	83 c2 01             	add    $0x1,%edx
        ASSERT_TRUE(temp_write(pidToMove));
        // Go to sleep for long period of time.
        sleep(20);
        // At this point, the child process should already be inside the cgroup, therefore, the following operations
        // should not be executed.
        for (int i = 0; i < 10; i++) {
    4d67:	83 c0 01             	add    $0x1,%eax
    4d6a:	83 f8 09             	cmp    $0x9,%eax
    4d6d:	7e f5                	jle    4d64 <test_frozen_not_running+0x13d>
            sum += 1;
        }
        // Save sum into temp file.
        ASSERT_TRUE(temp_write(sum));
    4d6f:	83 ec 0c             	sub    $0xc,%esp
    4d72:	52                   	push   %edx
    4d73:	e8 92 b8 ff ff       	call   60a <temp_write>
    4d78:	83 c4 10             	add    $0x10,%esp
    4d7b:	85 c0                	test   %eax,%eax
    4d7d:	74 19                	je     4d98 <test_frozen_not_running+0x171>
    4d7f:	eb 6e                	jmp    4def <test_frozen_not_running+0x1c8>
    4d81:	83 ec 08             	sub    $0x8,%esp
    4d84:	68 3c bf 00 00       	push   $0xbf3c
    4d89:	6a 01                	push   $0x1
    4d8b:	e8 d7 6d 00 00       	call   bb67 <printf>
    4d90:	83 c3 01             	add    $0x1,%ebx
    4d93:	83 c4 10             	add    $0x10,%esp
    4d96:	eb 05                	jmp    4d9d <test_frozen_not_running+0x176>
    4d98:	bb 00 00 00 00       	mov    $0x0,%ebx
    4d9d:	83 ec 0c             	sub    $0xc,%esp
    4da0:	68 33 c5 00 00       	push   $0xc533
    4da5:	e8 59 69 00 00       	call   b703 <strlen>
    4daa:	89 c7                	mov    %eax,%edi
    4dac:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4db3:	e8 4b 69 00 00       	call   b703 <strlen>
    4db8:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4dbc:	83 c4 10             	add    $0x10,%esp
    4dbf:	39 d8                	cmp    %ebx,%eax
    4dc1:	77 be                	ja     4d81 <test_frozen_not_running+0x15a>
    4dc3:	83 ec 0c             	sub    $0xc,%esp
    4dc6:	68 27 03 00 00       	push   $0x327
    4dcb:	68 f9 bf 00 00       	push   $0xbff9
    4dd0:	56                   	push   %esi
    4dd1:	68 d0 f4 00 00       	push   $0xf4d0
    4dd6:	6a 01                	push   $0x1
    4dd8:	e8 8a 6d 00 00       	call   bb67 <printf>
    4ddd:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4de4:	00 00 00 
    4de7:	83 c4 20             	add    $0x20,%esp
    4dea:	e9 ba 04 00 00       	jmp    52a9 <test_frozen_not_running+0x682>
        exit(0);
    4def:	83 ec 0c             	sub    $0xc,%esp
    4df2:	6a 00                	push   $0x0
    4df4:	e8 7d 6b 00 00       	call   b976 <exit>
    }
    // Father
    else {
        sleep(5);
    4df9:	83 ec 0c             	sub    $0xc,%esp
    4dfc:	6a 05                	push   $0x5
    4dfe:	e8 03 6c 00 00       	call   ba06 <sleep>
        // Read the child pid from temp file.
        pidToMove = temp_read(0);
    4e03:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e0a:	e8 95 b8 ff ff       	call   6a4 <temp_read>
    4e0f:	89 c3                	mov    %eax,%ebx
        // Update the temp file for further reading, since next sum will be read from it.
        ASSERT_TRUE(temp_write(0));
    4e11:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e18:	e8 ed b7 ff ff       	call   60a <temp_write>
    4e1d:	83 c4 10             	add    $0x10,%esp
    4e20:	85 c0                	test   %eax,%eax
    4e22:	74 19                	je     4e3d <test_frozen_not_running+0x216>
    4e24:	eb 6e                	jmp    4e94 <test_frozen_not_running+0x26d>
    4e26:	83 ec 08             	sub    $0x8,%esp
    4e29:	68 3c bf 00 00       	push   $0xbf3c
    4e2e:	6a 01                	push   $0x1
    4e30:	e8 32 6d 00 00       	call   bb67 <printf>
    4e35:	83 c3 01             	add    $0x1,%ebx
    4e38:	83 c4 10             	add    $0x10,%esp
    4e3b:	eb 05                	jmp    4e42 <test_frozen_not_running+0x21b>
    4e3d:	bb 00 00 00 00       	mov    $0x0,%ebx
    4e42:	83 ec 0c             	sub    $0xc,%esp
    4e45:	68 c5 c4 00 00       	push   $0xc4c5
    4e4a:	e8 b4 68 00 00       	call   b703 <strlen>
    4e4f:	89 c7                	mov    %eax,%edi
    4e51:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4e58:	e8 a6 68 00 00       	call   b703 <strlen>
    4e5d:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4e61:	83 c4 10             	add    $0x10,%esp
    4e64:	39 d8                	cmp    %ebx,%eax
    4e66:	77 be                	ja     4e26 <test_frozen_not_running+0x1ff>
    4e68:	83 ec 0c             	sub    $0xc,%esp
    4e6b:	68 30 03 00 00       	push   $0x330
    4e70:	68 f9 bf 00 00       	push   $0xbff9
    4e75:	56                   	push   %esi
    4e76:	68 7c ee 00 00       	push   $0xee7c
    4e7b:	6a 01                	push   $0x1
    4e7d:	e8 e5 6c 00 00       	call   bb67 <printf>
    4e82:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4e89:	00 00 00 
    4e8c:	83 c4 20             	add    $0x20,%esp
    4e8f:	e9 15 04 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Move the child process to "/cgroup/test1" cgroup.
        ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, pidToMove));
    4e94:	83 ec 08             	sub    $0x8,%esp
    4e97:	53                   	push   %ebx
    4e98:	68 06 c1 00 00       	push   $0xc106
    4e9d:	e8 95 b6 ff ff       	call   537 <move_proc>
    4ea2:	83 c4 10             	add    $0x10,%esp
    4ea5:	85 c0                	test   %eax,%eax
    4ea7:	74 19                	je     4ec2 <test_frozen_not_running+0x29b>
    4ea9:	eb 6e                	jmp    4f19 <test_frozen_not_running+0x2f2>
    4eab:	83 ec 08             	sub    $0x8,%esp
    4eae:	68 3c bf 00 00       	push   $0xbf3c
    4eb3:	6a 01                	push   $0x1
    4eb5:	e8 ad 6c 00 00       	call   bb67 <printf>
    4eba:	83 c3 01             	add    $0x1,%ebx
    4ebd:	83 c4 10             	add    $0x10,%esp
    4ec0:	eb 05                	jmp    4ec7 <test_frozen_not_running+0x2a0>
    4ec2:	bb 00 00 00 00       	mov    $0x0,%ebx
    4ec7:	83 ec 0c             	sub    $0xc,%esp
    4eca:	68 b4 ee 00 00       	push   $0xeeb4
    4ecf:	e8 2f 68 00 00       	call   b703 <strlen>
    4ed4:	89 c7                	mov    %eax,%edi
    4ed6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4edd:	e8 21 68 00 00       	call   b703 <strlen>
    4ee2:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4ee6:	83 c4 10             	add    $0x10,%esp
    4ee9:	39 d8                	cmp    %ebx,%eax
    4eeb:	77 be                	ja     4eab <test_frozen_not_running+0x284>
    4eed:	83 ec 0c             	sub    $0xc,%esp
    4ef0:	68 33 03 00 00       	push   $0x333
    4ef5:	68 f9 bf 00 00       	push   $0xbff9
    4efa:	56                   	push   %esi
    4efb:	68 e0 ee 00 00       	push   $0xeee0
    4f00:	6a 01                	push   $0x1
    4f02:	e8 60 6c 00 00       	call   bb67 <printf>
    4f07:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4f0e:	00 00 00 
    4f11:	83 c4 20             	add    $0x20,%esp
    4f14:	e9 90 03 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Check that the process we moved is really in "/cgroup/test1" cgroup.
        ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, pidToMove));
    4f19:	83 ec 08             	sub    $0x8,%esp
    4f1c:	53                   	push   %ebx
    4f1d:	68 06 c1 00 00       	push   $0xc106
    4f22:	e8 43 b6 ff ff       	call   56a <is_pid_in_group>
    4f27:	83 c4 10             	add    $0x10,%esp
    4f2a:	85 c0                	test   %eax,%eax
    4f2c:	74 19                	je     4f47 <test_frozen_not_running+0x320>
    4f2e:	eb 6e                	jmp    4f9e <test_frozen_not_running+0x377>
    4f30:	83 ec 08             	sub    $0x8,%esp
    4f33:	68 3c bf 00 00       	push   $0xbf3c
    4f38:	6a 01                	push   $0x1
    4f3a:	e8 28 6c 00 00       	call   bb67 <printf>
    4f3f:	83 c3 01             	add    $0x1,%ebx
    4f42:	83 c4 10             	add    $0x10,%esp
    4f45:	eb 05                	jmp    4f4c <test_frozen_not_running+0x325>
    4f47:	bb 00 00 00 00       	mov    $0x0,%ebx
    4f4c:	83 ec 0c             	sub    $0xc,%esp
    4f4f:	68 34 ef 00 00       	push   $0xef34
    4f54:	e8 aa 67 00 00       	call   b703 <strlen>
    4f59:	89 c7                	mov    %eax,%edi
    4f5b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    4f62:	e8 9c 67 00 00       	call   b703 <strlen>
    4f67:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    4f6b:	83 c4 10             	add    $0x10,%esp
    4f6e:	39 d8                	cmp    %ebx,%eax
    4f70:	77 be                	ja     4f30 <test_frozen_not_running+0x309>
    4f72:	83 ec 0c             	sub    $0xc,%esp
    4f75:	68 36 03 00 00       	push   $0x336
    4f7a:	68 f9 bf 00 00       	push   $0xbff9
    4f7f:	56                   	push   %esi
    4f80:	68 64 ef 00 00       	push   $0xef64
    4f85:	6a 01                	push   $0x1
    4f87:	e8 db 6b 00 00       	call   bb67 <printf>
    4f8c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4f93:	00 00 00 
    4f96:	83 c4 20             	add    $0x20,%esp
    4f99:	e9 0b 03 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Go to sleep to ensure the child process had a chance to be scheduled.
        sleep(10);
    4f9e:	83 ec 0c             	sub    $0xc,%esp
    4fa1:	6a 0a                	push   $0xa
    4fa3:	e8 5e 6a 00 00       	call   ba06 <sleep>

        // Verify that the child process have not ran
        sum = temp_read(0);
    4fa8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4faf:	e8 f0 b6 ff ff       	call   6a4 <temp_read>
        ASSERT_UINT_EQ(sum, 0);
    4fb4:	83 c4 10             	add    $0x10,%esp
    4fb7:	85 c0                	test   %eax,%eax
    4fb9:	74 28                	je     4fe3 <test_frozen_not_running+0x3bc>
    4fbb:	83 ec 0c             	sub    $0xc,%esp
    4fbe:	68 3d 03 00 00       	push   $0x33d
    4fc3:	68 f9 bf 00 00       	push   $0xbff9
    4fc8:	6a 00                	push   $0x0
    4fca:	50                   	push   %eax
    4fcb:	56                   	push   %esi
    4fcc:	e8 43 b0 ff ff       	call   14 <print_error>
    4fd1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    4fd8:	00 00 00 
    4fdb:	83 c4 20             	add    $0x20,%esp
    4fde:	e9 c6 02 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Return the child to root cgroup.
        ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, pidToMove));
    4fe3:	83 ec 08             	sub    $0x8,%esp
    4fe6:	53                   	push   %ebx
    4fe7:	68 09 c4 00 00       	push   $0xc409
    4fec:	e8 46 b5 ff ff       	call   537 <move_proc>
    4ff1:	83 c4 10             	add    $0x10,%esp
    4ff4:	85 c0                	test   %eax,%eax
    4ff6:	74 19                	je     5011 <test_frozen_not_running+0x3ea>
    4ff8:	eb 6e                	jmp    5068 <test_frozen_not_running+0x441>
    4ffa:	83 ec 08             	sub    $0x8,%esp
    4ffd:	68 3c bf 00 00       	push   $0xbf3c
    5002:	6a 01                	push   $0x1
    5004:	e8 5e 6b 00 00       	call   bb67 <printf>
    5009:	83 c3 01             	add    $0x1,%ebx
    500c:	83 c4 10             	add    $0x10,%esp
    500f:	eb 05                	jmp    5016 <test_frozen_not_running+0x3ef>
    5011:	bb 00 00 00 00       	mov    $0x0,%ebx
    5016:	83 ec 0c             	sub    $0xc,%esp
    5019:	68 c0 ef 00 00       	push   $0xefc0
    501e:	e8 e0 66 00 00       	call   b703 <strlen>
    5023:	89 c7                	mov    %eax,%edi
    5025:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    502c:	e8 d2 66 00 00       	call   b703 <strlen>
    5031:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5035:	83 c4 10             	add    $0x10,%esp
    5038:	39 d8                	cmp    %ebx,%eax
    503a:	77 be                	ja     4ffa <test_frozen_not_running+0x3d3>
    503c:	83 ec 0c             	sub    $0xc,%esp
    503f:	68 40 03 00 00       	push   $0x340
    5044:	68 f9 bf 00 00       	push   $0xbff9
    5049:	56                   	push   %esi
    504a:	68 e8 ef 00 00       	push   $0xefe8
    504f:	6a 01                	push   $0x1
    5051:	e8 11 6b 00 00       	call   bb67 <printf>
    5056:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    505d:	00 00 00 
    5060:	83 c4 20             	add    $0x20,%esp
    5063:	e9 41 02 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Check that the child we returned is really in root cgroup.
        ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, pidToMove));
    5068:	83 ec 08             	sub    $0x8,%esp
    506b:	53                   	push   %ebx
    506c:	68 09 c4 00 00       	push   $0xc409
    5071:	e8 f4 b4 ff ff       	call   56a <is_pid_in_group>
    5076:	83 c4 10             	add    $0x10,%esp
    5079:	85 c0                	test   %eax,%eax
    507b:	74 19                	je     5096 <test_frozen_not_running+0x46f>
    507d:	eb 6e                	jmp    50ed <test_frozen_not_running+0x4c6>
    507f:	83 ec 08             	sub    $0x8,%esp
    5082:	68 3c bf 00 00       	push   $0xbf3c
    5087:	6a 01                	push   $0x1
    5089:	e8 d9 6a 00 00       	call   bb67 <printf>
    508e:	83 c3 01             	add    $0x1,%ebx
    5091:	83 c4 10             	add    $0x10,%esp
    5094:	eb 05                	jmp    509b <test_frozen_not_running+0x474>
    5096:	bb 00 00 00 00       	mov    $0x0,%ebx
    509b:	83 ec 0c             	sub    $0xc,%esp
    509e:	68 3c f0 00 00       	push   $0xf03c
    50a3:	e8 5b 66 00 00       	call   b703 <strlen>
    50a8:	89 c7                	mov    %eax,%edi
    50aa:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    50b1:	e8 4d 66 00 00       	call   b703 <strlen>
    50b6:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    50ba:	83 c4 10             	add    $0x10,%esp
    50bd:	39 d8                	cmp    %ebx,%eax
    50bf:	77 be                	ja     507f <test_frozen_not_running+0x458>
    50c1:	83 ec 0c             	sub    $0xc,%esp
    50c4:	68 43 03 00 00       	push   $0x343
    50c9:	68 f9 bf 00 00       	push   $0xbff9
    50ce:	56                   	push   %esi
    50cf:	68 6c f0 00 00       	push   $0xf06c
    50d4:	6a 01                	push   $0x1
    50d6:	e8 8c 6a 00 00       	call   bb67 <printf>
    50db:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    50e2:	00 00 00 
    50e5:	83 c4 20             	add    $0x20,%esp
    50e8:	e9 bc 01 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Wait for child to exit.
        wait(&wstatus);
    50ed:	83 ec 0c             	sub    $0xc,%esp
    50f0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    50f3:	50                   	push   %eax
    50f4:	e8 85 68 00 00       	call   b97e <wait>
        ASSERT_TRUE(wstatus);
    50f9:	83 c4 10             	add    $0x10,%esp
    50fc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    5100:	74 19                	je     511b <test_frozen_not_running+0x4f4>
    5102:	eb 6e                	jmp    5172 <test_frozen_not_running+0x54b>
    5104:	83 ec 08             	sub    $0x8,%esp
    5107:	68 3c bf 00 00       	push   $0xbf3c
    510c:	6a 01                	push   $0x1
    510e:	e8 54 6a 00 00       	call   bb67 <printf>
    5113:	83 c3 01             	add    $0x1,%ebx
    5116:	83 c4 10             	add    $0x10,%esp
    5119:	eb 05                	jmp    5120 <test_frozen_not_running+0x4f9>
    511b:	bb 00 00 00 00       	mov    $0x0,%ebx
    5120:	83 ec 0c             	sub    $0xc,%esp
    5123:	68 d3 c4 00 00       	push   $0xc4d3
    5128:	e8 d6 65 00 00       	call   b703 <strlen>
    512d:	89 c7                	mov    %eax,%edi
    512f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5136:	e8 c8 65 00 00       	call   b703 <strlen>
    513b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    513f:	83 c4 10             	add    $0x10,%esp
    5142:	39 d8                	cmp    %ebx,%eax
    5144:	77 be                	ja     5104 <test_frozen_not_running+0x4dd>
    5146:	83 ec 0c             	sub    $0xc,%esp
    5149:	68 47 03 00 00       	push   $0x347
    514e:	68 f9 bf 00 00       	push   $0xbff9
    5153:	56                   	push   %esi
    5154:	68 c4 f0 00 00       	push   $0xf0c4
    5159:	6a 01                	push   $0x1
    515b:	e8 07 6a 00 00       	call   bb67 <printf>
    5160:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5167:	00 00 00 
    516a:	83 c4 20             	add    $0x20,%esp
    516d:	e9 37 01 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Verify that child did execute the procudure.
        sum = temp_read(0);
    5172:	83 ec 0c             	sub    $0xc,%esp
    5175:	6a 00                	push   $0x0
    5177:	e8 28 b5 ff ff       	call   6a4 <temp_read>
        ASSERT_UINT_EQ(sum, 10);
    517c:	83 c4 10             	add    $0x10,%esp
    517f:	83 f8 0a             	cmp    $0xa,%eax
    5182:	74 28                	je     51ac <test_frozen_not_running+0x585>
    5184:	83 ec 0c             	sub    $0xc,%esp
    5187:	68 4b 03 00 00       	push   $0x34b
    518c:	68 f9 bf 00 00       	push   $0xbff9
    5191:	6a 0a                	push   $0xa
    5193:	50                   	push   %eax
    5194:	56                   	push   %esi
    5195:	e8 7a ae ff ff       	call   14 <print_error>
    519a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    51a1:	00 00 00 
    51a4:	83 c4 20             	add    $0x20,%esp
    51a7:	e9 fd 00 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Remove the temp file.
        ASSERT_TRUE(temp_delete());
    51ac:	e8 10 b5 ff ff       	call   6c1 <temp_delete>
    51b1:	85 c0                	test   %eax,%eax
    51b3:	74 19                	je     51ce <test_frozen_not_running+0x5a7>
    51b5:	eb 6e                	jmp    5225 <test_frozen_not_running+0x5fe>
    51b7:	83 ec 08             	sub    $0x8,%esp
    51ba:	68 3c bf 00 00       	push   $0xbf3c
    51bf:	6a 01                	push   $0x1
    51c1:	e8 a1 69 00 00       	call   bb67 <printf>
    51c6:	83 c3 01             	add    $0x1,%ebx
    51c9:	83 c4 10             	add    $0x10,%esp
    51cc:	eb 05                	jmp    51d3 <test_frozen_not_running+0x5ac>
    51ce:	bb 00 00 00 00       	mov    $0x0,%ebx
    51d3:	83 ec 0c             	sub    $0xc,%esp
    51d6:	68 db c4 00 00       	push   $0xc4db
    51db:	e8 23 65 00 00       	call   b703 <strlen>
    51e0:	89 c7                	mov    %eax,%edi
    51e2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    51e9:	e8 15 65 00 00       	call   b703 <strlen>
    51ee:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    51f2:	83 c4 10             	add    $0x10,%esp
    51f5:	39 d8                	cmp    %ebx,%eax
    51f7:	77 be                	ja     51b7 <test_frozen_not_running+0x590>
    51f9:	83 ec 0c             	sub    $0xc,%esp
    51fc:	68 4e 03 00 00       	push   $0x34e
    5201:	68 f9 bf 00 00       	push   $0xbff9
    5206:	56                   	push   %esi
    5207:	68 f8 f0 00 00       	push   $0xf0f8
    520c:	6a 01                	push   $0x1
    520e:	e8 54 69 00 00       	call   bb67 <printf>
    5213:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    521a:	00 00 00 
    521d:	83 c4 20             	add    $0x20,%esp
    5220:	e9 84 00 00 00       	jmp    52a9 <test_frozen_not_running+0x682>

        // Update frozen.
        ASSERT_TRUE(write_file(TEST_1_SET_FRZ, "0"));
    5225:	83 ec 08             	sub    $0x8,%esp
    5228:	68 9b c3 00 00       	push   $0xc39b
    522d:	68 e7 c1 00 00       	push   $0xc1e7
    5232:	e8 17 b0 ff ff       	call   24e <write_file>
    5237:	83 c4 10             	add    $0x10,%esp
    523a:	85 c0                	test   %eax,%eax
    523c:	74 19                	je     5257 <test_frozen_not_running+0x630>
    523e:	eb 69                	jmp    52a9 <test_frozen_not_running+0x682>
    5240:	83 ec 08             	sub    $0x8,%esp
    5243:	68 3c bf 00 00       	push   $0xbf3c
    5248:	6a 01                	push   $0x1
    524a:	e8 18 69 00 00       	call   bb67 <printf>
    524f:	83 c3 01             	add    $0x1,%ebx
    5252:	83 c4 10             	add    $0x10,%esp
    5255:	eb 05                	jmp    525c <test_frozen_not_running+0x635>
    5257:	bb 00 00 00 00       	mov    $0x0,%ebx
    525c:	83 ec 0c             	sub    $0xc,%esp
    525f:	68 a0 f3 00 00       	push   $0xf3a0
    5264:	e8 9a 64 00 00       	call   b703 <strlen>
    5269:	89 c7                	mov    %eax,%edi
    526b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5272:	e8 8c 64 00 00       	call   b703 <strlen>
    5277:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    527b:	83 c4 10             	add    $0x10,%esp
    527e:	39 d8                	cmp    %ebx,%eax
    5280:	77 be                	ja     5240 <test_frozen_not_running+0x619>
    5282:	83 ec 0c             	sub    $0xc,%esp
    5285:	68 51 03 00 00       	push   $0x351
    528a:	68 f9 bf 00 00       	push   $0xbff9
    528f:	56                   	push   %esi
    5290:	68 c0 f3 00 00       	push   $0xf3c0
    5295:	6a 01                	push   $0x1
    5297:	e8 cb 68 00 00       	call   bb67 <printf>
    529c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    52a3:	00 00 00 
    52a6:	83 c4 20             	add    $0x20,%esp
    }
}
    52a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    52ac:	5b                   	pop    %ebx
    52ad:	5e                   	pop    %esi
    52ae:	5f                   	pop    %edi
    52af:	5d                   	pop    %ebp
    52b0:	c3                   	ret    

000052b1 <test_mem_current>:

//In this following memory accounting tests we move only single process to "/cgroup/test1" in order to simplify the testing.
TEST(test_mem_current) {
    52b1:	55                   	push   %ebp
    52b2:	89 e5                	mov    %esp,%ebp
    52b4:	56                   	push   %esi
    52b5:	53                   	push   %ebx
    52b6:	83 ec 20             	sub    $0x20,%esp
  // Save current process memory size.
  char proc_mem[10];
  itoa(proc_mem, getmem());
    52b9:	e8 a0 67 00 00       	call   ba5e <getmem>
    52be:	83 ec 08             	sub    $0x8,%esp
    52c1:	50                   	push   %eax
    52c2:	8d 5d ee             	lea    -0x12(%ebp),%ebx
    52c5:	53                   	push   %ebx
    52c6:	e8 7f 65 00 00       	call   b84a <itoa>
  strcat(proc_mem, "\n");
    52cb:	83 c4 08             	add    $0x8,%esp
    52ce:	68 05 c8 00 00       	push   $0xc805
    52d3:	53                   	push   %ebx
    52d4:	e8 fd 65 00 00       	call   b8d6 <strcat>
  // Buffer to read contents from memory file.
  char saved_mem[10];

  // Move the current process to "/cgroup/test1" cgroup.
  ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    52d9:	e8 18 67 00 00       	call   b9f6 <getpid>
    52de:	83 c4 08             	add    $0x8,%esp
    52e1:	50                   	push   %eax
    52e2:	68 06 c1 00 00       	push   $0xc106
    52e7:	e8 4b b2 ff ff       	call   537 <move_proc>
    52ec:	83 c4 10             	add    $0x10,%esp
    52ef:	85 c0                	test   %eax,%eax
    52f1:	74 19                	je     530c <test_mem_current+0x5b>
    52f3:	eb 70                	jmp    5365 <test_mem_current+0xb4>
    52f5:	83 ec 08             	sub    $0x8,%esp
    52f8:	68 3c bf 00 00       	push   $0xbf3c
    52fd:	6a 01                	push   $0x1
    52ff:	e8 63 68 00 00       	call   bb67 <printf>
    5304:	83 c3 01             	add    $0x1,%ebx
    5307:	83 c4 10             	add    $0x10,%esp
    530a:	eb 05                	jmp    5311 <test_mem_current+0x60>
    530c:	bb 00 00 00 00       	mov    $0x0,%ebx
    5311:	83 ec 0c             	sub    $0xc,%esp
    5314:	68 90 e3 00 00       	push   $0xe390
    5319:	e8 e5 63 00 00       	call   b703 <strlen>
    531e:	89 c6                	mov    %eax,%esi
    5320:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5327:	e8 d7 63 00 00       	call   b703 <strlen>
    532c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    5330:	83 c4 10             	add    $0x10,%esp
    5333:	39 d8                	cmp    %ebx,%eax
    5335:	77 be                	ja     52f5 <test_mem_current+0x44>
    5337:	83 ec 0c             	sub    $0xc,%esp
    533a:	68 5f 03 00 00       	push   $0x35f
    533f:	68 f9 bf 00 00       	push   $0xbff9
    5344:	ff 75 08             	pushl  0x8(%ebp)
    5347:	68 d4 e5 00 00       	push   $0xe5d4
    534c:	6a 01                	push   $0x1
    534e:	e8 14 68 00 00       	call   bb67 <printf>
    5353:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    535a:	00 00 00 
    535d:	83 c4 20             	add    $0x20,%esp
    5360:	e9 41 02 00 00       	jmp    55a6 <test_mem_current+0x2f5>

  // Check that the process we moved is really in "/cgroup/test1" cgroup.
  ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    5365:	e8 8c 66 00 00       	call   b9f6 <getpid>
    536a:	83 ec 08             	sub    $0x8,%esp
    536d:	50                   	push   %eax
    536e:	68 06 c1 00 00       	push   $0xc106
    5373:	e8 f2 b1 ff ff       	call   56a <is_pid_in_group>
    5378:	83 c4 10             	add    $0x10,%esp
    537b:	85 c0                	test   %eax,%eax
    537d:	74 19                	je     5398 <test_mem_current+0xe7>
    537f:	eb 70                	jmp    53f1 <test_mem_current+0x140>
    5381:	83 ec 08             	sub    $0x8,%esp
    5384:	68 3c bf 00 00       	push   $0xbf3c
    5389:	6a 01                	push   $0x1
    538b:	e8 d7 67 00 00       	call   bb67 <printf>
    5390:	83 c3 01             	add    $0x1,%ebx
    5393:	83 c4 10             	add    $0x10,%esp
    5396:	eb 05                	jmp    539d <test_mem_current+0xec>
    5398:	bb 00 00 00 00       	mov    $0x0,%ebx
    539d:	83 ec 0c             	sub    $0xc,%esp
    53a0:	68 10 e4 00 00       	push   $0xe410
    53a5:	e8 59 63 00 00       	call   b703 <strlen>
    53aa:	89 c6                	mov    %eax,%esi
    53ac:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    53b3:	e8 4b 63 00 00       	call   b703 <strlen>
    53b8:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    53bc:	83 c4 10             	add    $0x10,%esp
    53bf:	39 d8                	cmp    %ebx,%eax
    53c1:	77 be                	ja     5381 <test_mem_current+0xd0>
    53c3:	83 ec 0c             	sub    $0xc,%esp
    53c6:	68 62 03 00 00       	push   $0x362
    53cb:	68 f9 bf 00 00       	push   $0xbff9
    53d0:	ff 75 08             	pushl  0x8(%ebp)
    53d3:	68 28 e6 00 00       	push   $0xe628
    53d8:	6a 01                	push   $0x1
    53da:	e8 88 67 00 00       	call   bb67 <printf>
    53df:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    53e6:	00 00 00 
    53e9:	83 c4 20             	add    $0x20,%esp
    53ec:	e9 b5 01 00 00       	jmp    55a6 <test_mem_current+0x2f5>

  // Read the contents of current memory file and convert it for comparison.
  strcpy(saved_mem, read_file(TEST_1_MEM_CURRENT, 0));
    53f1:	83 ec 08             	sub    $0x8,%esp
    53f4:	6a 00                	push   $0x0
    53f6:	68 03 c2 00 00       	push   $0xc203
    53fb:	e8 9c ad ff ff       	call   19c <read_file>
    5400:	83 c4 08             	add    $0x8,%esp
    5403:	50                   	push   %eax
    5404:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
    5407:	53                   	push   %ebx
    5408:	e8 82 62 00 00       	call   b68f <strcpy>

  // Check memory usaged updated correctly.
  ASSERT_FALSE(strcmp(saved_mem, proc_mem));
    540d:	83 c4 08             	add    $0x8,%esp
    5410:	8d 45 ee             	lea    -0x12(%ebp),%eax
    5413:	50                   	push   %eax
    5414:	53                   	push   %ebx
    5415:	e8 93 62 00 00       	call   b6ad <strcmp>
    541a:	83 c4 10             	add    $0x10,%esp
    541d:	85 c0                	test   %eax,%eax
    541f:	75 19                	jne    543a <test_mem_current+0x189>
    5421:	eb 70                	jmp    5493 <test_mem_current+0x1e2>
    5423:	83 ec 08             	sub    $0x8,%esp
    5426:	68 3c bf 00 00       	push   $0xbf3c
    542b:	6a 01                	push   $0x1
    542d:	e8 35 67 00 00       	call   bb67 <printf>
    5432:	83 c3 01             	add    $0x1,%ebx
    5435:	83 c4 10             	add    $0x10,%esp
    5438:	eb 05                	jmp    543f <test_mem_current+0x18e>
    543a:	bb 00 00 00 00       	mov    $0x0,%ebx
    543f:	83 ec 0c             	sub    $0xc,%esp
    5442:	68 43 c5 00 00       	push   $0xc543
    5447:	e8 b7 62 00 00       	call   b703 <strlen>
    544c:	89 c6                	mov    %eax,%esi
    544e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5455:	e8 a9 62 00 00       	call   b703 <strlen>
    545a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    545e:	83 c4 10             	add    $0x10,%esp
    5461:	39 d8                	cmp    %ebx,%eax
    5463:	77 be                	ja     5423 <test_mem_current+0x172>
    5465:	83 ec 0c             	sub    $0xc,%esp
    5468:	68 68 03 00 00       	push   $0x368
    546d:	68 f9 bf 00 00       	push   $0xbff9
    5472:	ff 75 08             	pushl  0x8(%ebp)
    5475:	68 0c f5 00 00       	push   $0xf50c
    547a:	6a 01                	push   $0x1
    547c:	e8 e6 66 00 00       	call   bb67 <printf>
    5481:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5488:	00 00 00 
    548b:	83 c4 20             	add    $0x20,%esp
    548e:	e9 13 01 00 00       	jmp    55a6 <test_mem_current+0x2f5>

  // Return the process to root cgroup.
  ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    5493:	e8 5e 65 00 00       	call   b9f6 <getpid>
    5498:	83 ec 08             	sub    $0x8,%esp
    549b:	50                   	push   %eax
    549c:	68 09 c4 00 00       	push   $0xc409
    54a1:	e8 91 b0 ff ff       	call   537 <move_proc>
    54a6:	83 c4 10             	add    $0x10,%esp
    54a9:	85 c0                	test   %eax,%eax
    54ab:	74 19                	je     54c6 <test_mem_current+0x215>
    54ad:	eb 70                	jmp    551f <test_mem_current+0x26e>
    54af:	83 ec 08             	sub    $0x8,%esp
    54b2:	68 3c bf 00 00       	push   $0xbf3c
    54b7:	6a 01                	push   $0x1
    54b9:	e8 a9 66 00 00       	call   bb67 <printf>
    54be:	83 c3 01             	add    $0x1,%ebx
    54c1:	83 c4 10             	add    $0x10,%esp
    54c4:	eb 05                	jmp    54cb <test_mem_current+0x21a>
    54c6:	bb 00 00 00 00       	mov    $0x0,%ebx
    54cb:	83 ec 0c             	sub    $0xc,%esp
    54ce:	68 80 e6 00 00       	push   $0xe680
    54d3:	e8 2b 62 00 00       	call   b703 <strlen>
    54d8:	89 c6                	mov    %eax,%esi
    54da:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    54e1:	e8 1d 62 00 00       	call   b703 <strlen>
    54e6:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    54ea:	83 c4 10             	add    $0x10,%esp
    54ed:	39 d8                	cmp    %ebx,%eax
    54ef:	77 be                	ja     54af <test_mem_current+0x1fe>
    54f1:	83 ec 0c             	sub    $0xc,%esp
    54f4:	68 6b 03 00 00       	push   $0x36b
    54f9:	68 f9 bf 00 00       	push   $0xbff9
    54fe:	ff 75 08             	pushl  0x8(%ebp)
    5501:	68 a8 e6 00 00       	push   $0xe6a8
    5506:	6a 01                	push   $0x1
    5508:	e8 5a 66 00 00       	call   bb67 <printf>
    550d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5514:	00 00 00 
    5517:	83 c4 20             	add    $0x20,%esp
    551a:	e9 87 00 00 00       	jmp    55a6 <test_mem_current+0x2f5>

  // Check that the process we returned is really in root cgroup.
  ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    551f:	e8 d2 64 00 00       	call   b9f6 <getpid>
    5524:	83 ec 08             	sub    $0x8,%esp
    5527:	50                   	push   %eax
    5528:	68 09 c4 00 00       	push   $0xc409
    552d:	e8 38 b0 ff ff       	call   56a <is_pid_in_group>
    5532:	83 c4 10             	add    $0x10,%esp
    5535:	85 c0                	test   %eax,%eax
    5537:	74 19                	je     5552 <test_mem_current+0x2a1>
    5539:	eb 6b                	jmp    55a6 <test_mem_current+0x2f5>
    553b:	83 ec 08             	sub    $0x8,%esp
    553e:	68 3c bf 00 00       	push   $0xbf3c
    5543:	6a 01                	push   $0x1
    5545:	e8 1d 66 00 00       	call   bb67 <printf>
    554a:	83 c3 01             	add    $0x1,%ebx
    554d:	83 c4 10             	add    $0x10,%esp
    5550:	eb 05                	jmp    5557 <test_mem_current+0x2a6>
    5552:	bb 00 00 00 00       	mov    $0x0,%ebx
    5557:	83 ec 0c             	sub    $0xc,%esp
    555a:	68 98 e4 00 00       	push   $0xe498
    555f:	e8 9f 61 00 00       	call   b703 <strlen>
    5564:	89 c6                	mov    %eax,%esi
    5566:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    556d:	e8 91 61 00 00       	call   b703 <strlen>
    5572:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    5576:	83 c4 10             	add    $0x10,%esp
    5579:	39 d8                	cmp    %ebx,%eax
    557b:	77 be                	ja     553b <test_mem_current+0x28a>
    557d:	83 ec 0c             	sub    $0xc,%esp
    5580:	68 6e 03 00 00       	push   $0x36e
    5585:	68 f9 bf 00 00       	push   $0xbff9
    558a:	ff 75 08             	pushl  0x8(%ebp)
    558d:	68 c8 e4 00 00       	push   $0xe4c8
    5592:	6a 01                	push   $0x1
    5594:	e8 ce 65 00 00       	call   bb67 <printf>
    5599:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    55a0:	00 00 00 
    55a3:	83 c4 20             	add    $0x20,%esp
}
    55a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    55a9:	5b                   	pop    %ebx
    55aa:	5e                   	pop    %esi
    55ab:	5d                   	pop    %ebp
    55ac:	c3                   	ret    

000055ad <test_correct_mem_account_of_growth_and_shrink>:

TEST(test_correct_mem_account_of_growth_and_shrink) {
    55ad:	55                   	push   %ebp
    55ae:	89 e5                	mov    %esp,%ebp
    55b0:	57                   	push   %edi
    55b1:	56                   	push   %esi
    55b2:	53                   	push   %ebx
    55b3:	83 ec 2c             	sub    $0x2c,%esp
    55b6:	8b 7d 08             	mov    0x8(%ebp),%edi
  char proc_mem[10];
  // Buffer to read contents from memory file.
  char saved_mem[10];

  // Move the current process to "/cgroup/test1" cgroup.
  ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    55b9:	e8 38 64 00 00       	call   b9f6 <getpid>
    55be:	83 ec 08             	sub    $0x8,%esp
    55c1:	50                   	push   %eax
    55c2:	68 06 c1 00 00       	push   $0xc106
    55c7:	e8 6b af ff ff       	call   537 <move_proc>
    55cc:	83 c4 10             	add    $0x10,%esp
    55cf:	85 c0                	test   %eax,%eax
    55d1:	74 19                	je     55ec <test_correct_mem_account_of_growth_and_shrink+0x3f>
    55d3:	eb 6e                	jmp    5643 <test_correct_mem_account_of_growth_and_shrink+0x96>
    55d5:	83 ec 08             	sub    $0x8,%esp
    55d8:	68 3c bf 00 00       	push   $0xbf3c
    55dd:	6a 01                	push   $0x1
    55df:	e8 83 65 00 00       	call   bb67 <printf>
    55e4:	83 c3 01             	add    $0x1,%ebx
    55e7:	83 c4 10             	add    $0x10,%esp
    55ea:	eb 05                	jmp    55f1 <test_correct_mem_account_of_growth_and_shrink+0x44>
    55ec:	bb 00 00 00 00       	mov    $0x0,%ebx
    55f1:	83 ec 0c             	sub    $0xc,%esp
    55f4:	68 90 e3 00 00       	push   $0xe390
    55f9:	e8 05 61 00 00       	call   b703 <strlen>
    55fe:	89 c6                	mov    %eax,%esi
    5600:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5607:	e8 f7 60 00 00       	call   b703 <strlen>
    560c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    5610:	83 c4 10             	add    $0x10,%esp
    5613:	39 d8                	cmp    %ebx,%eax
    5615:	77 be                	ja     55d5 <test_correct_mem_account_of_growth_and_shrink+0x28>
    5617:	83 ec 0c             	sub    $0xc,%esp
    561a:	68 78 03 00 00       	push   $0x378
    561f:	68 f9 bf 00 00       	push   $0xbff9
    5624:	57                   	push   %edi
    5625:	68 d4 e5 00 00       	push   $0xe5d4
    562a:	6a 01                	push   $0x1
    562c:	e8 36 65 00 00       	call   bb67 <printf>
    5631:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5638:	00 00 00 
    563b:	83 c4 20             	add    $0x20,%esp
    563e:	e9 59 03 00 00       	jmp    599c <test_correct_mem_account_of_growth_and_shrink+0x3ef>

  // Check that the process we moved is really in "/cgroup/test1" cgroup.
  ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    5643:	e8 ae 63 00 00       	call   b9f6 <getpid>
    5648:	83 ec 08             	sub    $0x8,%esp
    564b:	50                   	push   %eax
    564c:	68 06 c1 00 00       	push   $0xc106
    5651:	e8 14 af ff ff       	call   56a <is_pid_in_group>
    5656:	83 c4 10             	add    $0x10,%esp
    5659:	85 c0                	test   %eax,%eax
    565b:	74 19                	je     5676 <test_correct_mem_account_of_growth_and_shrink+0xc9>
    565d:	eb 6e                	jmp    56cd <test_correct_mem_account_of_growth_and_shrink+0x120>
    565f:	83 ec 08             	sub    $0x8,%esp
    5662:	68 3c bf 00 00       	push   $0xbf3c
    5667:	6a 01                	push   $0x1
    5669:	e8 f9 64 00 00       	call   bb67 <printf>
    566e:	83 c3 01             	add    $0x1,%ebx
    5671:	83 c4 10             	add    $0x10,%esp
    5674:	eb 05                	jmp    567b <test_correct_mem_account_of_growth_and_shrink+0xce>
    5676:	bb 00 00 00 00       	mov    $0x0,%ebx
    567b:	83 ec 0c             	sub    $0xc,%esp
    567e:	68 10 e4 00 00       	push   $0xe410
    5683:	e8 7b 60 00 00       	call   b703 <strlen>
    5688:	89 c6                	mov    %eax,%esi
    568a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5691:	e8 6d 60 00 00       	call   b703 <strlen>
    5696:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    569a:	83 c4 10             	add    $0x10,%esp
    569d:	39 d8                	cmp    %ebx,%eax
    569f:	77 be                	ja     565f <test_correct_mem_account_of_growth_and_shrink+0xb2>
    56a1:	83 ec 0c             	sub    $0xc,%esp
    56a4:	68 7b 03 00 00       	push   $0x37b
    56a9:	68 f9 bf 00 00       	push   $0xbff9
    56ae:	57                   	push   %edi
    56af:	68 28 e6 00 00       	push   $0xe628
    56b4:	6a 01                	push   $0x1
    56b6:	e8 ac 64 00 00       	call   bb67 <printf>
    56bb:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    56c2:	00 00 00 
    56c5:	83 c4 20             	add    $0x20,%esp
    56c8:	e9 cf 02 00 00       	jmp    599c <test_correct_mem_account_of_growth_and_shrink+0x3ef>

  // Grow the current process by 100 bytes.
  sbrk(100);
    56cd:	83 ec 0c             	sub    $0xc,%esp
    56d0:	6a 64                	push   $0x64
    56d2:	e8 27 63 00 00       	call   b9fe <sbrk>

  // Read the contents of current memory file and convert it for comparison.
  strcpy(saved_mem, read_file(TEST_1_MEM_CURRENT, 0));
    56d7:	83 c4 08             	add    $0x8,%esp
    56da:	6a 00                	push   $0x0
    56dc:	68 03 c2 00 00       	push   $0xc203
    56e1:	e8 b6 aa ff ff       	call   19c <read_file>
    56e6:	83 c4 08             	add    $0x8,%esp
    56e9:	50                   	push   %eax
    56ea:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
    56ed:	53                   	push   %ebx
    56ee:	e8 9c 5f 00 00       	call   b68f <strcpy>

  // Convert process memory to a string.
  itoa(proc_mem, getmem());
    56f3:	e8 66 63 00 00       	call   ba5e <getmem>
    56f8:	83 c4 08             	add    $0x8,%esp
    56fb:	50                   	push   %eax
    56fc:	8d 75 de             	lea    -0x22(%ebp),%esi
    56ff:	56                   	push   %esi
    5700:	e8 45 61 00 00       	call   b84a <itoa>
  strcat(proc_mem, "\n");
    5705:	83 c4 08             	add    $0x8,%esp
    5708:	68 05 c8 00 00       	push   $0xc805
    570d:	56                   	push   %esi
    570e:	e8 c3 61 00 00       	call   b8d6 <strcat>

  // Read the contents of current memory file and convert it for comparison.
  strcpy(saved_mem, read_file(TEST_1_MEM_CURRENT, 0));
    5713:	83 c4 08             	add    $0x8,%esp
    5716:	6a 00                	push   $0x0
    5718:	68 03 c2 00 00       	push   $0xc203
    571d:	e8 7a aa ff ff       	call   19c <read_file>
    5722:	83 c4 08             	add    $0x8,%esp
    5725:	50                   	push   %eax
    5726:	53                   	push   %ebx
    5727:	e8 63 5f 00 00       	call   b68f <strcpy>

  // Check that the memory accounting correctly updated after memory growth.
  ASSERT_FALSE(strcmp(saved_mem, proc_mem));
    572c:	83 c4 08             	add    $0x8,%esp
    572f:	56                   	push   %esi
    5730:	53                   	push   %ebx
    5731:	e8 77 5f 00 00       	call   b6ad <strcmp>
    5736:	83 c4 10             	add    $0x10,%esp
    5739:	85 c0                	test   %eax,%eax
    573b:	75 19                	jne    5756 <test_correct_mem_account_of_growth_and_shrink+0x1a9>
    573d:	eb 6e                	jmp    57ad <test_correct_mem_account_of_growth_and_shrink+0x200>
    573f:	83 ec 08             	sub    $0x8,%esp
    5742:	68 3c bf 00 00       	push   $0xbf3c
    5747:	6a 01                	push   $0x1
    5749:	e8 19 64 00 00       	call   bb67 <printf>
    574e:	83 c3 01             	add    $0x1,%ebx
    5751:	83 c4 10             	add    $0x10,%esp
    5754:	eb 05                	jmp    575b <test_correct_mem_account_of_growth_and_shrink+0x1ae>
    5756:	bb 00 00 00 00       	mov    $0x0,%ebx
    575b:	83 ec 0c             	sub    $0xc,%esp
    575e:	68 43 c5 00 00       	push   $0xc543
    5763:	e8 9b 5f 00 00       	call   b703 <strlen>
    5768:	89 c6                	mov    %eax,%esi
    576a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5771:	e8 8d 5f 00 00       	call   b703 <strlen>
    5776:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    577a:	83 c4 10             	add    $0x10,%esp
    577d:	39 d8                	cmp    %ebx,%eax
    577f:	77 be                	ja     573f <test_correct_mem_account_of_growth_and_shrink+0x192>
    5781:	83 ec 0c             	sub    $0xc,%esp
    5784:	68 8b 03 00 00       	push   $0x38b
    5789:	68 f9 bf 00 00       	push   $0xbff9
    578e:	57                   	push   %edi
    578f:	68 0c f5 00 00       	push   $0xf50c
    5794:	6a 01                	push   $0x1
    5796:	e8 cc 63 00 00       	call   bb67 <printf>
    579b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    57a2:	00 00 00 
    57a5:	83 c4 20             	add    $0x20,%esp
    57a8:	e9 ef 01 00 00       	jmp    599c <test_correct_mem_account_of_growth_and_shrink+0x3ef>

  // Decrease current proc by 100 bytes.
  sbrk(-100);
    57ad:	83 ec 0c             	sub    $0xc,%esp
    57b0:	6a 9c                	push   $0xffffff9c
    57b2:	e8 47 62 00 00       	call   b9fe <sbrk>

  // Read the contents of current memory file and convert it for comparison.
  strcpy(saved_mem, read_file(TEST_1_MEM_CURRENT, 0));
    57b7:	83 c4 08             	add    $0x8,%esp
    57ba:	6a 00                	push   $0x0
    57bc:	68 03 c2 00 00       	push   $0xc203
    57c1:	e8 d6 a9 ff ff       	call   19c <read_file>
    57c6:	83 c4 08             	add    $0x8,%esp
    57c9:	50                   	push   %eax
    57ca:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
    57cd:	53                   	push   %ebx
    57ce:	e8 bc 5e 00 00       	call   b68f <strcpy>

  // Convert process memory to a string.
  itoa(proc_mem, getmem());
    57d3:	e8 86 62 00 00       	call   ba5e <getmem>
    57d8:	83 c4 08             	add    $0x8,%esp
    57db:	50                   	push   %eax
    57dc:	8d 75 de             	lea    -0x22(%ebp),%esi
    57df:	56                   	push   %esi
    57e0:	e8 65 60 00 00       	call   b84a <itoa>
  strcat(proc_mem, "\n");
    57e5:	83 c4 08             	add    $0x8,%esp
    57e8:	68 05 c8 00 00       	push   $0xc805
    57ed:	56                   	push   %esi
    57ee:	e8 e3 60 00 00       	call   b8d6 <strcat>

  // Read the contents of current memory file and convert it for comparison.
  strcpy(saved_mem, read_file(TEST_1_MEM_CURRENT, 0));
    57f3:	83 c4 08             	add    $0x8,%esp
    57f6:	6a 00                	push   $0x0
    57f8:	68 03 c2 00 00       	push   $0xc203
    57fd:	e8 9a a9 ff ff       	call   19c <read_file>
    5802:	83 c4 08             	add    $0x8,%esp
    5805:	50                   	push   %eax
    5806:	53                   	push   %ebx
    5807:	e8 83 5e 00 00       	call   b68f <strcpy>

  // Check that the memory accounting correctly updated after memory growth.
  ASSERT_FALSE(strcmp(saved_mem, proc_mem));
    580c:	83 c4 08             	add    $0x8,%esp
    580f:	56                   	push   %esi
    5810:	53                   	push   %ebx
    5811:	e8 97 5e 00 00       	call   b6ad <strcmp>
    5816:	83 c4 10             	add    $0x10,%esp
    5819:	85 c0                	test   %eax,%eax
    581b:	75 19                	jne    5836 <test_correct_mem_account_of_growth_and_shrink+0x289>
    581d:	eb 6e                	jmp    588d <test_correct_mem_account_of_growth_and_shrink+0x2e0>
    581f:	83 ec 08             	sub    $0x8,%esp
    5822:	68 3c bf 00 00       	push   $0xbf3c
    5827:	6a 01                	push   $0x1
    5829:	e8 39 63 00 00       	call   bb67 <printf>
    582e:	83 c3 01             	add    $0x1,%ebx
    5831:	83 c4 10             	add    $0x10,%esp
    5834:	eb 05                	jmp    583b <test_correct_mem_account_of_growth_and_shrink+0x28e>
    5836:	bb 00 00 00 00       	mov    $0x0,%ebx
    583b:	83 ec 0c             	sub    $0xc,%esp
    583e:	68 43 c5 00 00       	push   $0xc543
    5843:	e8 bb 5e 00 00       	call   b703 <strlen>
    5848:	89 c6                	mov    %eax,%esi
    584a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5851:	e8 ad 5e 00 00       	call   b703 <strlen>
    5856:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    585a:	83 c4 10             	add    $0x10,%esp
    585d:	39 d8                	cmp    %ebx,%eax
    585f:	77 be                	ja     581f <test_correct_mem_account_of_growth_and_shrink+0x272>
    5861:	83 ec 0c             	sub    $0xc,%esp
    5864:	68 9b 03 00 00       	push   $0x39b
    5869:	68 f9 bf 00 00       	push   $0xbff9
    586e:	57                   	push   %edi
    586f:	68 0c f5 00 00       	push   $0xf50c
    5874:	6a 01                	push   $0x1
    5876:	e8 ec 62 00 00       	call   bb67 <printf>
    587b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5882:	00 00 00 
    5885:	83 c4 20             	add    $0x20,%esp
    5888:	e9 0f 01 00 00       	jmp    599c <test_correct_mem_account_of_growth_and_shrink+0x3ef>

  // Return the process to root cgroup.
  ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    588d:	e8 64 61 00 00       	call   b9f6 <getpid>
    5892:	83 ec 08             	sub    $0x8,%esp
    5895:	50                   	push   %eax
    5896:	68 09 c4 00 00       	push   $0xc409
    589b:	e8 97 ac ff ff       	call   537 <move_proc>
    58a0:	83 c4 10             	add    $0x10,%esp
    58a3:	85 c0                	test   %eax,%eax
    58a5:	74 19                	je     58c0 <test_correct_mem_account_of_growth_and_shrink+0x313>
    58a7:	eb 6e                	jmp    5917 <test_correct_mem_account_of_growth_and_shrink+0x36a>
    58a9:	83 ec 08             	sub    $0x8,%esp
    58ac:	68 3c bf 00 00       	push   $0xbf3c
    58b1:	6a 01                	push   $0x1
    58b3:	e8 af 62 00 00       	call   bb67 <printf>
    58b8:	83 c3 01             	add    $0x1,%ebx
    58bb:	83 c4 10             	add    $0x10,%esp
    58be:	eb 05                	jmp    58c5 <test_correct_mem_account_of_growth_and_shrink+0x318>
    58c0:	bb 00 00 00 00       	mov    $0x0,%ebx
    58c5:	83 ec 0c             	sub    $0xc,%esp
    58c8:	68 80 e6 00 00       	push   $0xe680
    58cd:	e8 31 5e 00 00       	call   b703 <strlen>
    58d2:	89 c6                	mov    %eax,%esi
    58d4:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    58db:	e8 23 5e 00 00       	call   b703 <strlen>
    58e0:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    58e4:	83 c4 10             	add    $0x10,%esp
    58e7:	39 d8                	cmp    %ebx,%eax
    58e9:	77 be                	ja     58a9 <test_correct_mem_account_of_growth_and_shrink+0x2fc>
    58eb:	83 ec 0c             	sub    $0xc,%esp
    58ee:	68 9e 03 00 00       	push   $0x39e
    58f3:	68 f9 bf 00 00       	push   $0xbff9
    58f8:	57                   	push   %edi
    58f9:	68 a8 e6 00 00       	push   $0xe6a8
    58fe:	6a 01                	push   $0x1
    5900:	e8 62 62 00 00       	call   bb67 <printf>
    5905:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    590c:	00 00 00 
    590f:	83 c4 20             	add    $0x20,%esp
    5912:	e9 85 00 00 00       	jmp    599c <test_correct_mem_account_of_growth_and_shrink+0x3ef>

  // Check that the process we returned is really in root cgroup.
  ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    5917:	e8 da 60 00 00       	call   b9f6 <getpid>
    591c:	83 ec 08             	sub    $0x8,%esp
    591f:	50                   	push   %eax
    5920:	68 09 c4 00 00       	push   $0xc409
    5925:	e8 40 ac ff ff       	call   56a <is_pid_in_group>
    592a:	83 c4 10             	add    $0x10,%esp
    592d:	85 c0                	test   %eax,%eax
    592f:	74 19                	je     594a <test_correct_mem_account_of_growth_and_shrink+0x39d>
    5931:	eb 69                	jmp    599c <test_correct_mem_account_of_growth_and_shrink+0x3ef>
    5933:	83 ec 08             	sub    $0x8,%esp
    5936:	68 3c bf 00 00       	push   $0xbf3c
    593b:	6a 01                	push   $0x1
    593d:	e8 25 62 00 00       	call   bb67 <printf>
    5942:	83 c3 01             	add    $0x1,%ebx
    5945:	83 c4 10             	add    $0x10,%esp
    5948:	eb 05                	jmp    594f <test_correct_mem_account_of_growth_and_shrink+0x3a2>
    594a:	bb 00 00 00 00       	mov    $0x0,%ebx
    594f:	83 ec 0c             	sub    $0xc,%esp
    5952:	68 98 e4 00 00       	push   $0xe498
    5957:	e8 a7 5d 00 00       	call   b703 <strlen>
    595c:	89 c6                	mov    %eax,%esi
    595e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5965:	e8 99 5d 00 00       	call   b703 <strlen>
    596a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    596e:	83 c4 10             	add    $0x10,%esp
    5971:	39 d8                	cmp    %ebx,%eax
    5973:	77 be                	ja     5933 <test_correct_mem_account_of_growth_and_shrink+0x386>
    5975:	83 ec 0c             	sub    $0xc,%esp
    5978:	68 a1 03 00 00       	push   $0x3a1
    597d:	68 f9 bf 00 00       	push   $0xbff9
    5982:	57                   	push   %edi
    5983:	68 c8 e4 00 00       	push   $0xe4c8
    5988:	6a 01                	push   $0x1
    598a:	e8 d8 61 00 00       	call   bb67 <printf>
    598f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5996:	00 00 00 
    5999:	83 c4 20             	add    $0x20,%esp
}
    599c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    599f:	5b                   	pop    %ebx
    59a0:	5e                   	pop    %esi
    59a1:	5f                   	pop    %edi
    59a2:	5d                   	pop    %ebp
    59a3:	c3                   	ret    

000059a4 <test_limiting_mem>:

TEST(test_limiting_mem)
{
    59a4:	55                   	push   %ebp
    59a5:	89 e5                	mov    %esp,%ebp
    59a7:	57                   	push   %edi
    59a8:	56                   	push   %esi
    59a9:	53                   	push   %ebx
    59aa:	83 ec 38             	sub    $0x38,%esp
    59ad:	8b 75 08             	mov    0x8(%ebp),%esi
  // Buffer for saving current memory written in limit
  char default_max[12];
  char default_min[12];

  // Enable memory controller
  ASSERT_TRUE(enable_controller(MEM_CNT));
    59b0:	6a 03                	push   $0x3
    59b2:	e8 a9 a9 ff ff       	call   360 <enable_controller>
    59b7:	83 c4 10             	add    $0x10,%esp
    59ba:	85 c0                	test   %eax,%eax
    59bc:	74 19                	je     59d7 <test_limiting_mem+0x33>
    59be:	eb 6e                	jmp    5a2e <test_limiting_mem+0x8a>
    59c0:	83 ec 08             	sub    $0x8,%esp
    59c3:	68 3c bf 00 00       	push   $0xbf3c
    59c8:	6a 01                	push   $0x1
    59ca:	e8 98 61 00 00       	call   bb67 <printf>
    59cf:	83 c3 01             	add    $0x1,%ebx
    59d2:	83 c4 10             	add    $0x10,%esp
    59d5:	eb 05                	jmp    59dc <test_limiting_mem+0x38>
    59d7:	bb 00 00 00 00       	mov    $0x0,%ebx
    59dc:	83 ec 0c             	sub    $0xc,%esp
    59df:	68 5f c5 00 00       	push   $0xc55f
    59e4:	e8 1a 5d 00 00       	call   b703 <strlen>
    59e9:	89 c7                	mov    %eax,%edi
    59eb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    59f2:	e8 0c 5d 00 00       	call   b703 <strlen>
    59f7:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    59fb:	83 c4 10             	add    $0x10,%esp
    59fe:	39 d8                	cmp    %ebx,%eax
    5a00:	77 be                	ja     59c0 <test_limiting_mem+0x1c>
    5a02:	83 ec 0c             	sub    $0xc,%esp
    5a05:	68 ad 03 00 00       	push   $0x3ad
    5a0a:	68 f9 bf 00 00       	push   $0xbff9
    5a0f:	56                   	push   %esi
    5a10:	68 54 f5 00 00       	push   $0xf554
    5a15:	6a 01                	push   $0x1
    5a17:	e8 4b 61 00 00       	call   bb67 <printf>
    5a1c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5a23:	00 00 00 
    5a26:	83 c4 20             	add    $0x20,%esp
    5a29:	e9 3b 06 00 00       	jmp    6069 <test_limiting_mem+0x6c5>

  // read MEM_MAX and MEM_MIN values
  strcpy(default_max, read_file(TEST_1_MEM_MAX, 0));
    5a2e:	83 ec 08             	sub    $0x8,%esp
    5a31:	6a 00                	push   $0x0
    5a33:	68 20 c2 00 00       	push   $0xc220
    5a38:	e8 5f a7 ff ff       	call   19c <read_file>
    5a3d:	83 c4 08             	add    $0x8,%esp
    5a40:	50                   	push   %eax
    5a41:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    5a44:	53                   	push   %ebx
    5a45:	e8 45 5c 00 00       	call   b68f <strcpy>
  strcpy(default_min, read_file(TEST_1_MEM_MIN, 0));
    5a4a:	83 c4 08             	add    $0x8,%esp
    5a4d:	6a 00                	push   $0x0
    5a4f:	68 39 c2 00 00       	push   $0xc239
    5a54:	e8 43 a7 ff ff       	call   19c <read_file>
    5a59:	83 c4 08             	add    $0x8,%esp
    5a5c:	50                   	push   %eax
    5a5d:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5a60:	50                   	push   %eax
    5a61:	e8 29 5c 00 00       	call   b68f <strcpy>

  // Check default limit is correct
  ASSERT_FALSE(strncmp(default_max, KERNBASE, strlen(KERNBASE)));
    5a66:	c7 04 24 7a c5 00 00 	movl   $0xc57a,(%esp)
    5a6d:	e8 91 5c 00 00       	call   b703 <strlen>
    5a72:	83 c4 0c             	add    $0xc,%esp
    5a75:	50                   	push   %eax
    5a76:	68 7a c5 00 00       	push   $0xc57a
    5a7b:	53                   	push   %ebx
    5a7c:	e8 52 5c 00 00       	call   b6d3 <strncmp>
    5a81:	83 c4 10             	add    $0x10,%esp
    5a84:	85 c0                	test   %eax,%eax
    5a86:	75 19                	jne    5aa1 <test_limiting_mem+0xfd>
    5a88:	eb 6e                	jmp    5af8 <test_limiting_mem+0x154>
    5a8a:	83 ec 08             	sub    $0x8,%esp
    5a8d:	68 3c bf 00 00       	push   $0xbf3c
    5a92:	6a 01                	push   $0x1
    5a94:	e8 ce 60 00 00       	call   bb67 <printf>
    5a99:	83 c3 01             	add    $0x1,%ebx
    5a9c:	83 c4 10             	add    $0x10,%esp
    5a9f:	eb 05                	jmp    5aa6 <test_limiting_mem+0x102>
    5aa1:	bb 00 00 00 00       	mov    $0x0,%ebx
    5aa6:	83 ec 0c             	sub    $0xc,%esp
    5aa9:	68 98 f5 00 00       	push   $0xf598
    5aae:	e8 50 5c 00 00       	call   b703 <strlen>
    5ab3:	89 c7                	mov    %eax,%edi
    5ab5:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5abc:	e8 42 5c 00 00       	call   b703 <strlen>
    5ac1:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5ac5:	83 c4 10             	add    $0x10,%esp
    5ac8:	39 d8                	cmp    %ebx,%eax
    5aca:	77 be                	ja     5a8a <test_limiting_mem+0xe6>
    5acc:	83 ec 0c             	sub    $0xc,%esp
    5acf:	68 b4 03 00 00       	push   $0x3b4
    5ad4:	68 f9 bf 00 00       	push   $0xbff9
    5ad9:	56                   	push   %esi
    5ada:	68 cc f5 00 00       	push   $0xf5cc
    5adf:	6a 01                	push   $0x1
    5ae1:	e8 81 60 00 00       	call   bb67 <printf>
    5ae6:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5aed:	00 00 00 
    5af0:	83 c4 20             	add    $0x20,%esp
    5af3:	e9 71 05 00 00       	jmp    6069 <test_limiting_mem+0x6c5>
  ASSERT_FALSE(strncmp(default_min, "0", strlen("0")));
    5af8:	83 ec 0c             	sub    $0xc,%esp
    5afb:	68 9b c3 00 00       	push   $0xc39b
    5b00:	e8 fe 5b 00 00       	call   b703 <strlen>
    5b05:	83 c4 0c             	add    $0xc,%esp
    5b08:	50                   	push   %eax
    5b09:	68 9b c3 00 00       	push   $0xc39b
    5b0e:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5b11:	50                   	push   %eax
    5b12:	e8 bc 5b 00 00       	call   b6d3 <strncmp>
    5b17:	83 c4 10             	add    $0x10,%esp
    5b1a:	85 c0                	test   %eax,%eax
    5b1c:	75 19                	jne    5b37 <test_limiting_mem+0x193>
    5b1e:	eb 6e                	jmp    5b8e <test_limiting_mem+0x1ea>
    5b20:	83 ec 08             	sub    $0x8,%esp
    5b23:	68 3c bf 00 00       	push   $0xbf3c
    5b28:	6a 01                	push   $0x1
    5b2a:	e8 38 60 00 00       	call   bb67 <printf>
    5b2f:	83 c3 01             	add    $0x1,%ebx
    5b32:	83 c4 10             	add    $0x10,%esp
    5b35:	eb 05                	jmp    5b3c <test_limiting_mem+0x198>
    5b37:	bb 00 00 00 00       	mov    $0x0,%ebx
    5b3c:	83 ec 0c             	sub    $0xc,%esp
    5b3f:	68 28 f6 00 00       	push   $0xf628
    5b44:	e8 ba 5b 00 00       	call   b703 <strlen>
    5b49:	89 c7                	mov    %eax,%edi
    5b4b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5b52:	e8 ac 5b 00 00       	call   b703 <strlen>
    5b57:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5b5b:	83 c4 10             	add    $0x10,%esp
    5b5e:	39 d8                	cmp    %ebx,%eax
    5b60:	77 be                	ja     5b20 <test_limiting_mem+0x17c>
    5b62:	83 ec 0c             	sub    $0xc,%esp
    5b65:	68 b5 03 00 00       	push   $0x3b5
    5b6a:	68 f9 bf 00 00       	push   $0xbff9
    5b6f:	56                   	push   %esi
    5b70:	68 50 f6 00 00       	push   $0xf650
    5b75:	6a 01                	push   $0x1
    5b77:	e8 eb 5f 00 00       	call   bb67 <printf>
    5b7c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5b83:	00 00 00 
    5b86:	83 c4 20             	add    $0x20,%esp
    5b89:	e9 db 04 00 00       	jmp    6069 <test_limiting_mem+0x6c5>

  // Update memory limit
  ASSERT_TRUE(write_file(TEST_1_MEM_MAX, "100"));
    5b8e:	83 ec 08             	sub    $0x8,%esp
    5b91:	68 58 c6 00 00       	push   $0xc658
    5b96:	68 20 c2 00 00       	push   $0xc220
    5b9b:	e8 ae a6 ff ff       	call   24e <write_file>
    5ba0:	83 c4 10             	add    $0x10,%esp
    5ba3:	85 c0                	test   %eax,%eax
    5ba5:	74 19                	je     5bc0 <test_limiting_mem+0x21c>
    5ba7:	eb 6e                	jmp    5c17 <test_limiting_mem+0x273>
    5ba9:	83 ec 08             	sub    $0x8,%esp
    5bac:	68 3c bf 00 00       	push   $0xbf3c
    5bb1:	6a 01                	push   $0x1
    5bb3:	e8 af 5f 00 00       	call   bb67 <printf>
    5bb8:	83 c3 01             	add    $0x1,%ebx
    5bbb:	83 c4 10             	add    $0x10,%esp
    5bbe:	eb 05                	jmp    5bc5 <test_limiting_mem+0x221>
    5bc0:	bb 00 00 00 00       	mov    $0x0,%ebx
    5bc5:	83 ec 0c             	sub    $0xc,%esp
    5bc8:	68 a0 f6 00 00       	push   $0xf6a0
    5bcd:	e8 31 5b 00 00       	call   b703 <strlen>
    5bd2:	89 c7                	mov    %eax,%edi
    5bd4:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5bdb:	e8 23 5b 00 00       	call   b703 <strlen>
    5be0:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5be4:	83 c4 10             	add    $0x10,%esp
    5be7:	39 d8                	cmp    %ebx,%eax
    5be9:	77 be                	ja     5ba9 <test_limiting_mem+0x205>
    5beb:	83 ec 0c             	sub    $0xc,%esp
    5bee:	68 b8 03 00 00       	push   $0x3b8
    5bf3:	68 f9 bf 00 00       	push   $0xbff9
    5bf8:	56                   	push   %esi
    5bf9:	68 c4 f6 00 00       	push   $0xf6c4
    5bfe:	6a 01                	push   $0x1
    5c00:	e8 62 5f 00 00       	call   bb67 <printf>
    5c05:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5c0c:	00 00 00 
    5c0f:	83 c4 20             	add    $0x20,%esp
    5c12:	e9 52 04 00 00       	jmp    6069 <test_limiting_mem+0x6c5>
  ASSERT_TRUE(write_file(TEST_1_MEM_MIN, "90"));
    5c17:	83 ec 08             	sub    $0x8,%esp
    5c1a:	68 85 c5 00 00       	push   $0xc585
    5c1f:	68 39 c2 00 00       	push   $0xc239
    5c24:	e8 25 a6 ff ff       	call   24e <write_file>
    5c29:	83 c4 10             	add    $0x10,%esp
    5c2c:	85 c0                	test   %eax,%eax
    5c2e:	74 19                	je     5c49 <test_limiting_mem+0x2a5>
    5c30:	eb 6e                	jmp    5ca0 <test_limiting_mem+0x2fc>
    5c32:	83 ec 08             	sub    $0x8,%esp
    5c35:	68 3c bf 00 00       	push   $0xbf3c
    5c3a:	6a 01                	push   $0x1
    5c3c:	e8 26 5f 00 00       	call   bb67 <printf>
    5c41:	83 c3 01             	add    $0x1,%ebx
    5c44:	83 c4 10             	add    $0x10,%esp
    5c47:	eb 05                	jmp    5c4e <test_limiting_mem+0x2aa>
    5c49:	bb 00 00 00 00       	mov    $0x0,%ebx
    5c4e:	83 ec 0c             	sub    $0xc,%esp
    5c51:	68 10 f7 00 00       	push   $0xf710
    5c56:	e8 a8 5a 00 00       	call   b703 <strlen>
    5c5b:	89 c7                	mov    %eax,%edi
    5c5d:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5c64:	e8 9a 5a 00 00       	call   b703 <strlen>
    5c69:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5c6d:	83 c4 10             	add    $0x10,%esp
    5c70:	39 d8                	cmp    %ebx,%eax
    5c72:	77 be                	ja     5c32 <test_limiting_mem+0x28e>
    5c74:	83 ec 0c             	sub    $0xc,%esp
    5c77:	68 b9 03 00 00       	push   $0x3b9
    5c7c:	68 f9 bf 00 00       	push   $0xbff9
    5c81:	56                   	push   %esi
    5c82:	68 34 f7 00 00       	push   $0xf734
    5c87:	6a 01                	push   $0x1
    5c89:	e8 d9 5e 00 00       	call   bb67 <printf>
    5c8e:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5c95:	00 00 00 
    5c98:	83 c4 20             	add    $0x20,%esp
    5c9b:	e9 c9 03 00 00       	jmp    6069 <test_limiting_mem+0x6c5>

  // Check changes
  ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MAX, 0), "100\n"));
    5ca0:	83 ec 08             	sub    $0x8,%esp
    5ca3:	6a 00                	push   $0x0
    5ca5:	68 20 c2 00 00       	push   $0xc220
    5caa:	e8 ed a4 ff ff       	call   19c <read_file>
    5caf:	83 c4 08             	add    $0x8,%esp
    5cb2:	68 88 c5 00 00       	push   $0xc588
    5cb7:	50                   	push   %eax
    5cb8:	e8 f0 59 00 00       	call   b6ad <strcmp>
    5cbd:	83 c4 10             	add    $0x10,%esp
    5cc0:	85 c0                	test   %eax,%eax
    5cc2:	75 19                	jne    5cdd <test_limiting_mem+0x339>
    5cc4:	eb 6e                	jmp    5d34 <test_limiting_mem+0x390>
    5cc6:	83 ec 08             	sub    $0x8,%esp
    5cc9:	68 3c bf 00 00       	push   $0xbf3c
    5cce:	6a 01                	push   $0x1
    5cd0:	e8 92 5e 00 00       	call   bb67 <printf>
    5cd5:	83 c3 01             	add    $0x1,%ebx
    5cd8:	83 c4 10             	add    $0x10,%esp
    5cdb:	eb 05                	jmp    5ce2 <test_limiting_mem+0x33e>
    5cdd:	bb 00 00 00 00       	mov    $0x0,%ebx
    5ce2:	83 ec 0c             	sub    $0xc,%esp
    5ce5:	68 80 f7 00 00       	push   $0xf780
    5cea:	e8 14 5a 00 00       	call   b703 <strlen>
    5cef:	89 c7                	mov    %eax,%edi
    5cf1:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5cf8:	e8 06 5a 00 00       	call   b703 <strlen>
    5cfd:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5d01:	83 c4 10             	add    $0x10,%esp
    5d04:	39 d8                	cmp    %ebx,%eax
    5d06:	77 be                	ja     5cc6 <test_limiting_mem+0x322>
    5d08:	83 ec 0c             	sub    $0xc,%esp
    5d0b:	68 bc 03 00 00       	push   $0x3bc
    5d10:	68 f9 bf 00 00       	push   $0xbff9
    5d15:	56                   	push   %esi
    5d16:	68 b0 f7 00 00       	push   $0xf7b0
    5d1b:	6a 01                	push   $0x1
    5d1d:	e8 45 5e 00 00       	call   bb67 <printf>
    5d22:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5d29:	00 00 00 
    5d2c:	83 c4 20             	add    $0x20,%esp
    5d2f:	e9 35 03 00 00       	jmp    6069 <test_limiting_mem+0x6c5>
  ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MIN, 0), "90\n"));
    5d34:	83 ec 08             	sub    $0x8,%esp
    5d37:	6a 00                	push   $0x0
    5d39:	68 39 c2 00 00       	push   $0xc239
    5d3e:	e8 59 a4 ff ff       	call   19c <read_file>
    5d43:	83 c4 08             	add    $0x8,%esp
    5d46:	68 8d c5 00 00       	push   $0xc58d
    5d4b:	50                   	push   %eax
    5d4c:	e8 5c 59 00 00       	call   b6ad <strcmp>
    5d51:	83 c4 10             	add    $0x10,%esp
    5d54:	85 c0                	test   %eax,%eax
    5d56:	75 19                	jne    5d71 <test_limiting_mem+0x3cd>
    5d58:	eb 6e                	jmp    5dc8 <test_limiting_mem+0x424>
    5d5a:	83 ec 08             	sub    $0x8,%esp
    5d5d:	68 3c bf 00 00       	push   $0xbf3c
    5d62:	6a 01                	push   $0x1
    5d64:	e8 fe 5d 00 00       	call   bb67 <printf>
    5d69:	83 c3 01             	add    $0x1,%ebx
    5d6c:	83 c4 10             	add    $0x10,%esp
    5d6f:	eb 05                	jmp    5d76 <test_limiting_mem+0x3d2>
    5d71:	bb 00 00 00 00       	mov    $0x0,%ebx
    5d76:	83 ec 0c             	sub    $0xc,%esp
    5d79:	68 08 f8 00 00       	push   $0xf808
    5d7e:	e8 80 59 00 00       	call   b703 <strlen>
    5d83:	89 c7                	mov    %eax,%edi
    5d85:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5d8c:	e8 72 59 00 00       	call   b703 <strlen>
    5d91:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5d95:	83 c4 10             	add    $0x10,%esp
    5d98:	39 d8                	cmp    %ebx,%eax
    5d9a:	77 be                	ja     5d5a <test_limiting_mem+0x3b6>
    5d9c:	83 ec 0c             	sub    $0xc,%esp
    5d9f:	68 bd 03 00 00       	push   $0x3bd
    5da4:	68 f9 bf 00 00       	push   $0xbff9
    5da9:	56                   	push   %esi
    5daa:	68 38 f8 00 00       	push   $0xf838
    5daf:	6a 01                	push   $0x1
    5db1:	e8 b1 5d 00 00       	call   bb67 <printf>
    5db6:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5dbd:	00 00 00 
    5dc0:	83 c4 20             	add    $0x20,%esp
    5dc3:	e9 a1 02 00 00       	jmp    6069 <test_limiting_mem+0x6c5>

  // Disable memory controller
  ASSERT_TRUE(disable_controller(MEM_CNT));
    5dc8:	83 ec 0c             	sub    $0xc,%esp
    5dcb:	6a 03                	push   $0x3
    5dcd:	e8 e3 a5 ff ff       	call   3b5 <disable_controller>
    5dd2:	83 c4 10             	add    $0x10,%esp
    5dd5:	85 c0                	test   %eax,%eax
    5dd7:	74 19                	je     5df2 <test_limiting_mem+0x44e>
    5dd9:	eb 6e                	jmp    5e49 <test_limiting_mem+0x4a5>
    5ddb:	83 ec 08             	sub    $0x8,%esp
    5dde:	68 3c bf 00 00       	push   $0xbf3c
    5de3:	6a 01                	push   $0x1
    5de5:	e8 7d 5d 00 00       	call   bb67 <printf>
    5dea:	83 c3 01             	add    $0x1,%ebx
    5ded:	83 c4 10             	add    $0x10,%esp
    5df0:	eb 05                	jmp    5df7 <test_limiting_mem+0x453>
    5df2:	bb 00 00 00 00       	mov    $0x0,%ebx
    5df7:	83 ec 0c             	sub    $0xc,%esp
    5dfa:	68 91 c5 00 00       	push   $0xc591
    5dff:	e8 ff 58 00 00       	call   b703 <strlen>
    5e04:	89 c7                	mov    %eax,%edi
    5e06:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5e0d:	e8 f1 58 00 00       	call   b703 <strlen>
    5e12:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5e16:	83 c4 10             	add    $0x10,%esp
    5e19:	39 d8                	cmp    %ebx,%eax
    5e1b:	77 be                	ja     5ddb <test_limiting_mem+0x437>
    5e1d:	83 ec 0c             	sub    $0xc,%esp
    5e20:	68 c0 03 00 00       	push   $0x3c0
    5e25:	68 f9 bf 00 00       	push   $0xbff9
    5e2a:	56                   	push   %esi
    5e2b:	68 90 f8 00 00       	push   $0xf890
    5e30:	6a 01                	push   $0x1
    5e32:	e8 30 5d 00 00       	call   bb67 <printf>
    5e37:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5e3e:	00 00 00 
    5e41:	83 c4 20             	add    $0x20,%esp
    5e44:	e9 20 02 00 00       	jmp    6069 <test_limiting_mem+0x6c5>
  // Enable memory controller
  ASSERT_TRUE(enable_controller(MEM_CNT));
    5e49:	83 ec 0c             	sub    $0xc,%esp
    5e4c:	6a 03                	push   $0x3
    5e4e:	e8 0d a5 ff ff       	call   360 <enable_controller>
    5e53:	83 c4 10             	add    $0x10,%esp
    5e56:	85 c0                	test   %eax,%eax
    5e58:	74 19                	je     5e73 <test_limiting_mem+0x4cf>
    5e5a:	eb 6e                	jmp    5eca <test_limiting_mem+0x526>
    5e5c:	83 ec 08             	sub    $0x8,%esp
    5e5f:	68 3c bf 00 00       	push   $0xbf3c
    5e64:	6a 01                	push   $0x1
    5e66:	e8 fc 5c 00 00       	call   bb67 <printf>
    5e6b:	83 c3 01             	add    $0x1,%ebx
    5e6e:	83 c4 10             	add    $0x10,%esp
    5e71:	eb 05                	jmp    5e78 <test_limiting_mem+0x4d4>
    5e73:	bb 00 00 00 00       	mov    $0x0,%ebx
    5e78:	83 ec 0c             	sub    $0xc,%esp
    5e7b:	68 5f c5 00 00       	push   $0xc55f
    5e80:	e8 7e 58 00 00       	call   b703 <strlen>
    5e85:	89 c7                	mov    %eax,%edi
    5e87:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5e8e:	e8 70 58 00 00       	call   b703 <strlen>
    5e93:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5e97:	83 c4 10             	add    $0x10,%esp
    5e9a:	39 d8                	cmp    %ebx,%eax
    5e9c:	77 be                	ja     5e5c <test_limiting_mem+0x4b8>
    5e9e:	83 ec 0c             	sub    $0xc,%esp
    5ea1:	68 c2 03 00 00       	push   $0x3c2
    5ea6:	68 f9 bf 00 00       	push   $0xbff9
    5eab:	56                   	push   %esi
    5eac:	68 54 f5 00 00       	push   $0xf554
    5eb1:	6a 01                	push   $0x1
    5eb3:	e8 af 5c 00 00       	call   bb67 <printf>
    5eb8:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5ebf:	00 00 00 
    5ec2:	83 c4 20             	add    $0x20,%esp
    5ec5:	e9 9f 01 00 00       	jmp    6069 <test_limiting_mem+0x6c5>

  // Verify limit return to default
  ASSERT_FALSE(strcmp(default_max, read_file(TEST_1_MEM_MAX, 0)));
    5eca:	83 ec 08             	sub    $0x8,%esp
    5ecd:	6a 00                	push   $0x0
    5ecf:	68 20 c2 00 00       	push   $0xc220
    5ed4:	e8 c3 a2 ff ff       	call   19c <read_file>
    5ed9:	83 c4 08             	add    $0x8,%esp
    5edc:	50                   	push   %eax
    5edd:	8d 45 dc             	lea    -0x24(%ebp),%eax
    5ee0:	50                   	push   %eax
    5ee1:	e8 c7 57 00 00       	call   b6ad <strcmp>
    5ee6:	83 c4 10             	add    $0x10,%esp
    5ee9:	85 c0                	test   %eax,%eax
    5eeb:	75 19                	jne    5f06 <test_limiting_mem+0x562>
    5eed:	eb 6e                	jmp    5f5d <test_limiting_mem+0x5b9>
    5eef:	83 ec 08             	sub    $0x8,%esp
    5ef2:	68 3c bf 00 00       	push   $0xbf3c
    5ef7:	6a 01                	push   $0x1
    5ef9:	e8 69 5c 00 00       	call   bb67 <printf>
    5efe:	83 c3 01             	add    $0x1,%ebx
    5f01:	83 c4 10             	add    $0x10,%esp
    5f04:	eb 05                	jmp    5f0b <test_limiting_mem+0x567>
    5f06:	bb 00 00 00 00       	mov    $0x0,%ebx
    5f0b:	83 ec 0c             	sub    $0xc,%esp
    5f0e:	68 d8 f8 00 00       	push   $0xf8d8
    5f13:	e8 eb 57 00 00       	call   b703 <strlen>
    5f18:	89 c7                	mov    %eax,%edi
    5f1a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5f21:	e8 dd 57 00 00       	call   b703 <strlen>
    5f26:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5f2a:	83 c4 10             	add    $0x10,%esp
    5f2d:	39 d8                	cmp    %ebx,%eax
    5f2f:	77 be                	ja     5eef <test_limiting_mem+0x54b>
    5f31:	83 ec 0c             	sub    $0xc,%esp
    5f34:	68 c5 03 00 00       	push   $0x3c5
    5f39:	68 f9 bf 00 00       	push   $0xbff9
    5f3e:	56                   	push   %esi
    5f3f:	68 0c f9 00 00       	push   $0xf90c
    5f44:	6a 01                	push   $0x1
    5f46:	e8 1c 5c 00 00       	call   bb67 <printf>
    5f4b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5f52:	00 00 00 
    5f55:	83 c4 20             	add    $0x20,%esp
    5f58:	e9 0c 01 00 00       	jmp    6069 <test_limiting_mem+0x6c5>
  ASSERT_FALSE(strcmp(default_min, read_file(TEST_1_MEM_MIN, 0)));
    5f5d:	83 ec 08             	sub    $0x8,%esp
    5f60:	6a 00                	push   $0x0
    5f62:	68 39 c2 00 00       	push   $0xc239
    5f67:	e8 30 a2 ff ff       	call   19c <read_file>
    5f6c:	83 c4 08             	add    $0x8,%esp
    5f6f:	50                   	push   %eax
    5f70:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5f73:	50                   	push   %eax
    5f74:	e8 34 57 00 00       	call   b6ad <strcmp>
    5f79:	83 c4 10             	add    $0x10,%esp
    5f7c:	85 c0                	test   %eax,%eax
    5f7e:	75 19                	jne    5f99 <test_limiting_mem+0x5f5>
    5f80:	eb 6b                	jmp    5fed <test_limiting_mem+0x649>
    5f82:	83 ec 08             	sub    $0x8,%esp
    5f85:	68 3c bf 00 00       	push   $0xbf3c
    5f8a:	6a 01                	push   $0x1
    5f8c:	e8 d6 5b 00 00       	call   bb67 <printf>
    5f91:	83 c3 01             	add    $0x1,%ebx
    5f94:	83 c4 10             	add    $0x10,%esp
    5f97:	eb 05                	jmp    5f9e <test_limiting_mem+0x5fa>
    5f99:	bb 00 00 00 00       	mov    $0x0,%ebx
    5f9e:	83 ec 0c             	sub    $0xc,%esp
    5fa1:	68 68 f9 00 00       	push   $0xf968
    5fa6:	e8 58 57 00 00       	call   b703 <strlen>
    5fab:	89 c7                	mov    %eax,%edi
    5fad:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    5fb4:	e8 4a 57 00 00       	call   b703 <strlen>
    5fb9:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    5fbd:	83 c4 10             	add    $0x10,%esp
    5fc0:	39 d8                	cmp    %ebx,%eax
    5fc2:	77 be                	ja     5f82 <test_limiting_mem+0x5de>
    5fc4:	83 ec 0c             	sub    $0xc,%esp
    5fc7:	68 c6 03 00 00       	push   $0x3c6
    5fcc:	68 f9 bf 00 00       	push   $0xbff9
    5fd1:	56                   	push   %esi
    5fd2:	68 9c f9 00 00       	push   $0xf99c
    5fd7:	6a 01                	push   $0x1
    5fd9:	e8 89 5b 00 00       	call   bb67 <printf>
    5fde:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    5fe5:	00 00 00 
    5fe8:	83 c4 20             	add    $0x20,%esp
    5feb:	eb 7c                	jmp    6069 <test_limiting_mem+0x6c5>

  // Disable memory controller
  ASSERT_TRUE(disable_controller(MEM_CNT));
    5fed:	83 ec 0c             	sub    $0xc,%esp
    5ff0:	6a 03                	push   $0x3
    5ff2:	e8 be a3 ff ff       	call   3b5 <disable_controller>
    5ff7:	83 c4 10             	add    $0x10,%esp
    5ffa:	85 c0                	test   %eax,%eax
    5ffc:	74 19                	je     6017 <test_limiting_mem+0x673>
    5ffe:	eb 69                	jmp    6069 <test_limiting_mem+0x6c5>
    6000:	83 ec 08             	sub    $0x8,%esp
    6003:	68 3c bf 00 00       	push   $0xbf3c
    6008:	6a 01                	push   $0x1
    600a:	e8 58 5b 00 00       	call   bb67 <printf>
    600f:	83 c3 01             	add    $0x1,%ebx
    6012:	83 c4 10             	add    $0x10,%esp
    6015:	eb 05                	jmp    601c <test_limiting_mem+0x678>
    6017:	bb 00 00 00 00       	mov    $0x0,%ebx
    601c:	83 ec 0c             	sub    $0xc,%esp
    601f:	68 91 c5 00 00       	push   $0xc591
    6024:	e8 da 56 00 00       	call   b703 <strlen>
    6029:	89 c7                	mov    %eax,%edi
    602b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6032:	e8 cc 56 00 00       	call   b703 <strlen>
    6037:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    603b:	83 c4 10             	add    $0x10,%esp
    603e:	39 d8                	cmp    %ebx,%eax
    6040:	77 be                	ja     6000 <test_limiting_mem+0x65c>
    6042:	83 ec 0c             	sub    $0xc,%esp
    6045:	68 c9 03 00 00       	push   $0x3c9
    604a:	68 f9 bf 00 00       	push   $0xbff9
    604f:	56                   	push   %esi
    6050:	68 90 f8 00 00       	push   $0xf890
    6055:	6a 01                	push   $0x1
    6057:	e8 0b 5b 00 00       	call   bb67 <printf>
    605c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6063:	00 00 00 
    6066:	83 c4 20             	add    $0x20,%esp
}
    6069:	8d 65 f4             	lea    -0xc(%ebp),%esp
    606c:	5b                   	pop    %ebx
    606d:	5e                   	pop    %esi
    606e:	5f                   	pop    %edi
    606f:	5d                   	pop    %ebp
    6070:	c3                   	ret    

00006071 <test_ensure_mem_min_is_less_then_mem_max>:

TEST(test_ensure_mem_min_is_less_then_mem_max)
{
    6071:	55                   	push   %ebp
    6072:	89 e5                	mov    %esp,%ebp
    6074:	57                   	push   %edi
    6075:	56                   	push   %esi
    6076:	53                   	push   %ebx
    6077:	83 ec 18             	sub    $0x18,%esp
    607a:	8b 75 08             	mov    0x8(%ebp),%esi
  // Mem_max mast to be grater then mem_min

    // Enable memory controller
    ASSERT_TRUE(enable_controller(MEM_CNT));
    607d:	6a 03                	push   $0x3
    607f:	e8 dc a2 ff ff       	call   360 <enable_controller>
    6084:	83 c4 10             	add    $0x10,%esp
    6087:	85 c0                	test   %eax,%eax
    6089:	74 19                	je     60a4 <test_ensure_mem_min_is_less_then_mem_max+0x33>
    608b:	eb 6e                	jmp    60fb <test_ensure_mem_min_is_less_then_mem_max+0x8a>
    608d:	83 ec 08             	sub    $0x8,%esp
    6090:	68 3c bf 00 00       	push   $0xbf3c
    6095:	6a 01                	push   $0x1
    6097:	e8 cb 5a 00 00       	call   bb67 <printf>
    609c:	83 c3 01             	add    $0x1,%ebx
    609f:	83 c4 10             	add    $0x10,%esp
    60a2:	eb 05                	jmp    60a9 <test_ensure_mem_min_is_less_then_mem_max+0x38>
    60a4:	bb 00 00 00 00       	mov    $0x0,%ebx
    60a9:	83 ec 0c             	sub    $0xc,%esp
    60ac:	68 5f c5 00 00       	push   $0xc55f
    60b1:	e8 4d 56 00 00       	call   b703 <strlen>
    60b6:	89 c7                	mov    %eax,%edi
    60b8:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    60bf:	e8 3f 56 00 00       	call   b703 <strlen>
    60c4:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    60c8:	83 c4 10             	add    $0x10,%esp
    60cb:	39 d8                	cmp    %ebx,%eax
    60cd:	77 be                	ja     608d <test_ensure_mem_min_is_less_then_mem_max+0x1c>
    60cf:	83 ec 0c             	sub    $0xc,%esp
    60d2:	68 d1 03 00 00       	push   $0x3d1
    60d7:	68 f9 bf 00 00       	push   $0xbff9
    60dc:	56                   	push   %esi
    60dd:	68 54 f5 00 00       	push   $0xf554
    60e2:	6a 01                	push   $0x1
    60e4:	e8 7e 5a 00 00       	call   bb67 <printf>
    60e9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    60f0:	00 00 00 
    60f3:	83 c4 20             	add    $0x20,%esp
    60f6:	e9 c5 03 00 00       	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>

    // Update memory max
    ASSERT_TRUE(write_file(TEST_1_MEM_MAX, "100"));
    60fb:	83 ec 08             	sub    $0x8,%esp
    60fe:	68 58 c6 00 00       	push   $0xc658
    6103:	68 20 c2 00 00       	push   $0xc220
    6108:	e8 41 a1 ff ff       	call   24e <write_file>
    610d:	83 c4 10             	add    $0x10,%esp
    6110:	85 c0                	test   %eax,%eax
    6112:	74 19                	je     612d <test_ensure_mem_min_is_less_then_mem_max+0xbc>
    6114:	eb 6e                	jmp    6184 <test_ensure_mem_min_is_less_then_mem_max+0x113>
    6116:	83 ec 08             	sub    $0x8,%esp
    6119:	68 3c bf 00 00       	push   $0xbf3c
    611e:	6a 01                	push   $0x1
    6120:	e8 42 5a 00 00       	call   bb67 <printf>
    6125:	83 c3 01             	add    $0x1,%ebx
    6128:	83 c4 10             	add    $0x10,%esp
    612b:	eb 05                	jmp    6132 <test_ensure_mem_min_is_less_then_mem_max+0xc1>
    612d:	bb 00 00 00 00       	mov    $0x0,%ebx
    6132:	83 ec 0c             	sub    $0xc,%esp
    6135:	68 a0 f6 00 00       	push   $0xf6a0
    613a:	e8 c4 55 00 00       	call   b703 <strlen>
    613f:	89 c7                	mov    %eax,%edi
    6141:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6148:	e8 b6 55 00 00       	call   b703 <strlen>
    614d:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6151:	83 c4 10             	add    $0x10,%esp
    6154:	39 d8                	cmp    %ebx,%eax
    6156:	77 be                	ja     6116 <test_ensure_mem_min_is_less_then_mem_max+0xa5>
    6158:	83 ec 0c             	sub    $0xc,%esp
    615b:	68 d4 03 00 00       	push   $0x3d4
    6160:	68 f9 bf 00 00       	push   $0xbff9
    6165:	56                   	push   %esi
    6166:	68 c4 f6 00 00       	push   $0xf6c4
    616b:	6a 01                	push   $0x1
    616d:	e8 f5 59 00 00       	call   bb67 <printf>
    6172:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6179:	00 00 00 
    617c:	83 c4 20             	add    $0x20,%esp
    617f:	e9 3c 03 00 00       	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MAX, 0), "100\n"));
    6184:	83 ec 08             	sub    $0x8,%esp
    6187:	6a 00                	push   $0x0
    6189:	68 20 c2 00 00       	push   $0xc220
    618e:	e8 09 a0 ff ff       	call   19c <read_file>
    6193:	83 c4 08             	add    $0x8,%esp
    6196:	68 88 c5 00 00       	push   $0xc588
    619b:	50                   	push   %eax
    619c:	e8 0c 55 00 00       	call   b6ad <strcmp>
    61a1:	83 c4 10             	add    $0x10,%esp
    61a4:	85 c0                	test   %eax,%eax
    61a6:	75 19                	jne    61c1 <test_ensure_mem_min_is_less_then_mem_max+0x150>
    61a8:	eb 6e                	jmp    6218 <test_ensure_mem_min_is_less_then_mem_max+0x1a7>
    61aa:	83 ec 08             	sub    $0x8,%esp
    61ad:	68 3c bf 00 00       	push   $0xbf3c
    61b2:	6a 01                	push   $0x1
    61b4:	e8 ae 59 00 00       	call   bb67 <printf>
    61b9:	83 c3 01             	add    $0x1,%ebx
    61bc:	83 c4 10             	add    $0x10,%esp
    61bf:	eb 05                	jmp    61c6 <test_ensure_mem_min_is_less_then_mem_max+0x155>
    61c1:	bb 00 00 00 00       	mov    $0x0,%ebx
    61c6:	83 ec 0c             	sub    $0xc,%esp
    61c9:	68 80 f7 00 00       	push   $0xf780
    61ce:	e8 30 55 00 00       	call   b703 <strlen>
    61d3:	89 c7                	mov    %eax,%edi
    61d5:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    61dc:	e8 22 55 00 00       	call   b703 <strlen>
    61e1:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    61e5:	83 c4 10             	add    $0x10,%esp
    61e8:	39 d8                	cmp    %ebx,%eax
    61ea:	77 be                	ja     61aa <test_ensure_mem_min_is_less_then_mem_max+0x139>
    61ec:	83 ec 0c             	sub    $0xc,%esp
    61ef:	68 d7 03 00 00       	push   $0x3d7
    61f4:	68 f9 bf 00 00       	push   $0xbff9
    61f9:	56                   	push   %esi
    61fa:	68 b0 f7 00 00       	push   $0xf7b0
    61ff:	6a 01                	push   $0x1
    6201:	e8 61 59 00 00       	call   bb67 <printf>
    6206:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    620d:	00 00 00 
    6210:	83 c4 20             	add    $0x20,%esp
    6213:	e9 a8 02 00 00       	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>

    // Try to update memory min over max this have to fail
    ASSERT_FALSE(write_file(TEST_1_MEM_MIN, "101"));
    6218:	83 ec 08             	sub    $0x8,%esp
    621b:	68 ad c5 00 00       	push   $0xc5ad
    6220:	68 39 c2 00 00       	push   $0xc239
    6225:	e8 24 a0 ff ff       	call   24e <write_file>
    622a:	83 c4 10             	add    $0x10,%esp
    622d:	85 c0                	test   %eax,%eax
    622f:	75 19                	jne    624a <test_ensure_mem_min_is_less_then_mem_max+0x1d9>
    6231:	eb 6e                	jmp    62a1 <test_ensure_mem_min_is_less_then_mem_max+0x230>
    6233:	83 ec 08             	sub    $0x8,%esp
    6236:	68 3c bf 00 00       	push   $0xbf3c
    623b:	6a 01                	push   $0x1
    623d:	e8 25 59 00 00       	call   bb67 <printf>
    6242:	83 c3 01             	add    $0x1,%ebx
    6245:	83 c4 10             	add    $0x10,%esp
    6248:	eb 05                	jmp    624f <test_ensure_mem_min_is_less_then_mem_max+0x1de>
    624a:	bb 00 00 00 00       	mov    $0x0,%ebx
    624f:	83 ec 0c             	sub    $0xc,%esp
    6252:	68 f8 f9 00 00       	push   $0xf9f8
    6257:	e8 a7 54 00 00       	call   b703 <strlen>
    625c:	89 c7                	mov    %eax,%edi
    625e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6265:	e8 99 54 00 00       	call   b703 <strlen>
    626a:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    626e:	83 c4 10             	add    $0x10,%esp
    6271:	39 d8                	cmp    %ebx,%eax
    6273:	77 be                	ja     6233 <test_ensure_mem_min_is_less_then_mem_max+0x1c2>
    6275:	83 ec 0c             	sub    $0xc,%esp
    6278:	68 da 03 00 00       	push   $0x3da
    627d:	68 f9 bf 00 00       	push   $0xbff9
    6282:	56                   	push   %esi
    6283:	68 1c fa 00 00       	push   $0xfa1c
    6288:	6a 01                	push   $0x1
    628a:	e8 d8 58 00 00       	call   bb67 <printf>
    628f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6296:	00 00 00 
    6299:	83 c4 20             	add    $0x20,%esp
    629c:	e9 1f 02 00 00       	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>

    // Update memory min
    ASSERT_TRUE(write_file(TEST_1_MEM_MIN, "100"));
    62a1:	83 ec 08             	sub    $0x8,%esp
    62a4:	68 58 c6 00 00       	push   $0xc658
    62a9:	68 39 c2 00 00       	push   $0xc239
    62ae:	e8 9b 9f ff ff       	call   24e <write_file>
    62b3:	83 c4 10             	add    $0x10,%esp
    62b6:	85 c0                	test   %eax,%eax
    62b8:	74 19                	je     62d3 <test_ensure_mem_min_is_less_then_mem_max+0x262>
    62ba:	eb 6e                	jmp    632a <test_ensure_mem_min_is_less_then_mem_max+0x2b9>
    62bc:	83 ec 08             	sub    $0x8,%esp
    62bf:	68 3c bf 00 00       	push   $0xbf3c
    62c4:	6a 01                	push   $0x1
    62c6:	e8 9c 58 00 00       	call   bb67 <printf>
    62cb:	83 c3 01             	add    $0x1,%ebx
    62ce:	83 c4 10             	add    $0x10,%esp
    62d1:	eb 05                	jmp    62d8 <test_ensure_mem_min_is_less_then_mem_max+0x267>
    62d3:	bb 00 00 00 00       	mov    $0x0,%ebx
    62d8:	83 ec 0c             	sub    $0xc,%esp
    62db:	68 68 fa 00 00       	push   $0xfa68
    62e0:	e8 1e 54 00 00       	call   b703 <strlen>
    62e5:	89 c7                	mov    %eax,%edi
    62e7:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    62ee:	e8 10 54 00 00       	call   b703 <strlen>
    62f3:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    62f7:	83 c4 10             	add    $0x10,%esp
    62fa:	39 d8                	cmp    %ebx,%eax
    62fc:	77 be                	ja     62bc <test_ensure_mem_min_is_less_then_mem_max+0x24b>
    62fe:	83 ec 0c             	sub    $0xc,%esp
    6301:	68 dd 03 00 00       	push   $0x3dd
    6306:	68 f9 bf 00 00       	push   $0xbff9
    630b:	56                   	push   %esi
    630c:	68 8c fa 00 00       	push   $0xfa8c
    6311:	6a 01                	push   $0x1
    6313:	e8 4f 58 00 00       	call   bb67 <printf>
    6318:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    631f:	00 00 00 
    6322:	83 c4 20             	add    $0x20,%esp
    6325:	e9 96 01 00 00       	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MIN, 0), "100\n"));
    632a:	83 ec 08             	sub    $0x8,%esp
    632d:	6a 00                	push   $0x0
    632f:	68 39 c2 00 00       	push   $0xc239
    6334:	e8 63 9e ff ff       	call   19c <read_file>
    6339:	83 c4 08             	add    $0x8,%esp
    633c:	68 88 c5 00 00       	push   $0xc588
    6341:	50                   	push   %eax
    6342:	e8 66 53 00 00       	call   b6ad <strcmp>
    6347:	83 c4 10             	add    $0x10,%esp
    634a:	85 c0                	test   %eax,%eax
    634c:	75 19                	jne    6367 <test_ensure_mem_min_is_less_then_mem_max+0x2f6>
    634e:	eb 6e                	jmp    63be <test_ensure_mem_min_is_less_then_mem_max+0x34d>
    6350:	83 ec 08             	sub    $0x8,%esp
    6353:	68 3c bf 00 00       	push   $0xbf3c
    6358:	6a 01                	push   $0x1
    635a:	e8 08 58 00 00       	call   bb67 <printf>
    635f:	83 c3 01             	add    $0x1,%ebx
    6362:	83 c4 10             	add    $0x10,%esp
    6365:	eb 05                	jmp    636c <test_ensure_mem_min_is_less_then_mem_max+0x2fb>
    6367:	bb 00 00 00 00       	mov    $0x0,%ebx
    636c:	83 ec 0c             	sub    $0xc,%esp
    636f:	68 d8 fa 00 00       	push   $0xfad8
    6374:	e8 8a 53 00 00       	call   b703 <strlen>
    6379:	89 c7                	mov    %eax,%edi
    637b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6382:	e8 7c 53 00 00       	call   b703 <strlen>
    6387:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    638b:	83 c4 10             	add    $0x10,%esp
    638e:	39 d8                	cmp    %ebx,%eax
    6390:	77 be                	ja     6350 <test_ensure_mem_min_is_less_then_mem_max+0x2df>
    6392:	83 ec 0c             	sub    $0xc,%esp
    6395:	68 e0 03 00 00       	push   $0x3e0
    639a:	68 f9 bf 00 00       	push   $0xbff9
    639f:	56                   	push   %esi
    63a0:	68 08 fb 00 00       	push   $0xfb08
    63a5:	6a 01                	push   $0x1
    63a7:	e8 bb 57 00 00       	call   bb67 <printf>
    63ac:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    63b3:	00 00 00 
    63b6:	83 c4 20             	add    $0x20,%esp
    63b9:	e9 02 01 00 00       	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>

    // Try to update memory max smaller then min this have to fail
    ASSERT_FALSE(write_file(TEST_1_MEM_MAX, "99"));
    63be:	83 ec 08             	sub    $0x8,%esp
    63c1:	68 b1 c5 00 00       	push   $0xc5b1
    63c6:	68 20 c2 00 00       	push   $0xc220
    63cb:	e8 7e 9e ff ff       	call   24e <write_file>
    63d0:	83 c4 10             	add    $0x10,%esp
    63d3:	85 c0                	test   %eax,%eax
    63d5:	75 19                	jne    63f0 <test_ensure_mem_min_is_less_then_mem_max+0x37f>
    63d7:	eb 6b                	jmp    6444 <test_ensure_mem_min_is_less_then_mem_max+0x3d3>
    63d9:	83 ec 08             	sub    $0x8,%esp
    63dc:	68 3c bf 00 00       	push   $0xbf3c
    63e1:	6a 01                	push   $0x1
    63e3:	e8 7f 57 00 00       	call   bb67 <printf>
    63e8:	83 c3 01             	add    $0x1,%ebx
    63eb:	83 c4 10             	add    $0x10,%esp
    63ee:	eb 05                	jmp    63f5 <test_ensure_mem_min_is_less_then_mem_max+0x384>
    63f0:	bb 00 00 00 00       	mov    $0x0,%ebx
    63f5:	83 ec 0c             	sub    $0xc,%esp
    63f8:	68 60 fb 00 00       	push   $0xfb60
    63fd:	e8 01 53 00 00       	call   b703 <strlen>
    6402:	89 c7                	mov    %eax,%edi
    6404:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    640b:	e8 f3 52 00 00       	call   b703 <strlen>
    6410:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6414:	83 c4 10             	add    $0x10,%esp
    6417:	39 d8                	cmp    %ebx,%eax
    6419:	77 be                	ja     63d9 <test_ensure_mem_min_is_less_then_mem_max+0x368>
    641b:	83 ec 0c             	sub    $0xc,%esp
    641e:	68 e3 03 00 00       	push   $0x3e3
    6423:	68 f9 bf 00 00       	push   $0xbff9
    6428:	56                   	push   %esi
    6429:	68 84 fb 00 00       	push   $0xfb84
    642e:	6a 01                	push   $0x1
    6430:	e8 32 57 00 00       	call   bb67 <printf>
    6435:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    643c:	00 00 00 
    643f:	83 c4 20             	add    $0x20,%esp
    6442:	eb 7c                	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>

    // Disable memory controller
    ASSERT_TRUE(disable_controller(MEM_CNT));
    6444:	83 ec 0c             	sub    $0xc,%esp
    6447:	6a 03                	push   $0x3
    6449:	e8 67 9f ff ff       	call   3b5 <disable_controller>
    644e:	83 c4 10             	add    $0x10,%esp
    6451:	85 c0                	test   %eax,%eax
    6453:	74 19                	je     646e <test_ensure_mem_min_is_less_then_mem_max+0x3fd>
    6455:	eb 69                	jmp    64c0 <test_ensure_mem_min_is_less_then_mem_max+0x44f>
    6457:	83 ec 08             	sub    $0x8,%esp
    645a:	68 3c bf 00 00       	push   $0xbf3c
    645f:	6a 01                	push   $0x1
    6461:	e8 01 57 00 00       	call   bb67 <printf>
    6466:	83 c3 01             	add    $0x1,%ebx
    6469:	83 c4 10             	add    $0x10,%esp
    646c:	eb 05                	jmp    6473 <test_ensure_mem_min_is_less_then_mem_max+0x402>
    646e:	bb 00 00 00 00       	mov    $0x0,%ebx
    6473:	83 ec 0c             	sub    $0xc,%esp
    6476:	68 91 c5 00 00       	push   $0xc591
    647b:	e8 83 52 00 00       	call   b703 <strlen>
    6480:	89 c7                	mov    %eax,%edi
    6482:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6489:	e8 75 52 00 00       	call   b703 <strlen>
    648e:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6492:	83 c4 10             	add    $0x10,%esp
    6495:	39 d8                	cmp    %ebx,%eax
    6497:	77 be                	ja     6457 <test_ensure_mem_min_is_less_then_mem_max+0x3e6>
    6499:	83 ec 0c             	sub    $0xc,%esp
    649c:	68 e6 03 00 00       	push   $0x3e6
    64a1:	68 f9 bf 00 00       	push   $0xbff9
    64a6:	56                   	push   %esi
    64a7:	68 90 f8 00 00       	push   $0xf890
    64ac:	6a 01                	push   $0x1
    64ae:	e8 b4 56 00 00       	call   bb67 <printf>
    64b3:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    64ba:	00 00 00 
    64bd:	83 c4 20             	add    $0x20,%esp
}
    64c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    64c3:	5b                   	pop    %ebx
    64c4:	5e                   	pop    %esi
    64c5:	5f                   	pop    %edi
    64c6:	5d                   	pop    %ebp
    64c7:	c3                   	ret    

000064c8 <test_cant_use_protected_memory>:

TEST(test_cant_use_protected_memory)
{
    64c8:	55                   	push   %ebp
    64c9:	89 e5                	mov    %esp,%ebp
    64cb:	57                   	push   %edi
    64cc:	56                   	push   %esi
    64cd:	53                   	push   %ebx
    64ce:	83 ec 28             	sub    $0x28,%esp
    64d1:	8b 75 08             	mov    0x8(%ebp),%esi
    // Try to set mem min for cgroup2 or grows procses sizw
    // These should fail since we protect all memory mem for cgroup1

    // Enable memory controllers
    ASSERT_TRUE(enable_controller(MEM_CNT));
    64d4:	6a 03                	push   $0x3
    64d6:	e8 85 9e ff ff       	call   360 <enable_controller>
    64db:	83 c4 10             	add    $0x10,%esp
    64de:	85 c0                	test   %eax,%eax
    64e0:	74 19                	je     64fb <test_cant_use_protected_memory+0x33>
    64e2:	eb 6e                	jmp    6552 <test_cant_use_protected_memory+0x8a>
    64e4:	83 ec 08             	sub    $0x8,%esp
    64e7:	68 3c bf 00 00       	push   $0xbf3c
    64ec:	6a 01                	push   $0x1
    64ee:	e8 74 56 00 00       	call   bb67 <printf>
    64f3:	83 c3 01             	add    $0x1,%ebx
    64f6:	83 c4 10             	add    $0x10,%esp
    64f9:	eb 05                	jmp    6500 <test_cant_use_protected_memory+0x38>
    64fb:	bb 00 00 00 00       	mov    $0x0,%ebx
    6500:	83 ec 0c             	sub    $0xc,%esp
    6503:	68 5f c5 00 00       	push   $0xc55f
    6508:	e8 f6 51 00 00       	call   b703 <strlen>
    650d:	89 c7                	mov    %eax,%edi
    650f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6516:	e8 e8 51 00 00       	call   b703 <strlen>
    651b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    651f:	83 c4 10             	add    $0x10,%esp
    6522:	39 d8                	cmp    %ebx,%eax
    6524:	77 be                	ja     64e4 <test_cant_use_protected_memory+0x1c>
    6526:	83 ec 0c             	sub    $0xc,%esp
    6529:	68 ef 03 00 00       	push   $0x3ef
    652e:	68 f9 bf 00 00       	push   $0xbff9
    6533:	56                   	push   %esi
    6534:	68 54 f5 00 00       	push   $0xf554
    6539:	6a 01                	push   $0x1
    653b:	e8 27 56 00 00       	call   bb67 <printf>
    6540:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6547:	00 00 00 
    654a:	83 c4 20             	add    $0x20,%esp
    654d:	e9 74 07 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>
    ASSERT_TRUE(write_file(TEST_2_CGROUP_SUBTREE_CONTROL, "+mem"));
    6552:	83 ec 08             	sub    $0x8,%esp
    6555:	68 b4 c5 00 00       	push   $0xc5b4
    655a:	68 d0 fb 00 00       	push   $0xfbd0
    655f:	e8 ea 9c ff ff       	call   24e <write_file>
    6564:	83 c4 10             	add    $0x10,%esp
    6567:	85 c0                	test   %eax,%eax
    6569:	74 19                	je     6584 <test_cant_use_protected_memory+0xbc>
    656b:	eb 6e                	jmp    65db <test_cant_use_protected_memory+0x113>
    656d:	83 ec 08             	sub    $0x8,%esp
    6570:	68 3c bf 00 00       	push   $0xbf3c
    6575:	6a 01                	push   $0x1
    6577:	e8 eb 55 00 00       	call   bb67 <printf>
    657c:	83 c3 01             	add    $0x1,%ebx
    657f:	83 c4 10             	add    $0x10,%esp
    6582:	eb 05                	jmp    6589 <test_cant_use_protected_memory+0xc1>
    6584:	bb 00 00 00 00       	mov    $0x0,%ebx
    6589:	83 ec 0c             	sub    $0xc,%esp
    658c:	68 f8 fb 00 00       	push   $0xfbf8
    6591:	e8 6d 51 00 00       	call   b703 <strlen>
    6596:	89 c7                	mov    %eax,%edi
    6598:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    659f:	e8 5f 51 00 00       	call   b703 <strlen>
    65a4:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    65a8:	83 c4 10             	add    $0x10,%esp
    65ab:	39 d8                	cmp    %ebx,%eax
    65ad:	77 be                	ja     656d <test_cant_use_protected_memory+0xa5>
    65af:	83 ec 0c             	sub    $0xc,%esp
    65b2:	68 f0 03 00 00       	push   $0x3f0
    65b7:	68 f9 bf 00 00       	push   $0xbff9
    65bc:	56                   	push   %esi
    65bd:	68 2c fc 00 00       	push   $0xfc2c
    65c2:	6a 01                	push   $0x1
    65c4:	e8 9e 55 00 00       	call   bb67 <printf>
    65c9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    65d0:	00 00 00 
    65d3:	83 c4 20             	add    $0x20,%esp
    65d6:	e9 eb 06 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    char buf [12];
    itoa(buf, MEM_SIZE);
    65db:	83 ec 08             	sub    $0x8,%esp
    65de:	68 00 00 c0 0d       	push   $0xdc00000
    65e3:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    65e6:	53                   	push   %ebx
    65e7:	e8 5e 52 00 00       	call   b84a <itoa>

    // Protect all memory for cgroup1
    ASSERT_TRUE(write_file(TEST_1_MEM_MIN, buf));
    65ec:	83 c4 08             	add    $0x8,%esp
    65ef:	53                   	push   %ebx
    65f0:	68 39 c2 00 00       	push   $0xc239
    65f5:	e8 54 9c ff ff       	call   24e <write_file>
    65fa:	83 c4 10             	add    $0x10,%esp
    65fd:	85 c0                	test   %eax,%eax
    65ff:	74 19                	je     661a <test_cant_use_protected_memory+0x152>
    6601:	eb 6e                	jmp    6671 <test_cant_use_protected_memory+0x1a9>
    6603:	83 ec 08             	sub    $0x8,%esp
    6606:	68 3c bf 00 00       	push   $0xbf3c
    660b:	6a 01                	push   $0x1
    660d:	e8 55 55 00 00       	call   bb67 <printf>
    6612:	83 c3 01             	add    $0x1,%ebx
    6615:	83 c4 10             	add    $0x10,%esp
    6618:	eb 05                	jmp    661f <test_cant_use_protected_memory+0x157>
    661a:	bb 00 00 00 00       	mov    $0x0,%ebx
    661f:	83 ec 0c             	sub    $0xc,%esp
    6622:	68 88 fc 00 00       	push   $0xfc88
    6627:	e8 d7 50 00 00       	call   b703 <strlen>
    662c:	89 c7                	mov    %eax,%edi
    662e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6635:	e8 c9 50 00 00       	call   b703 <strlen>
    663a:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    663e:	83 c4 10             	add    $0x10,%esp
    6641:	39 d8                	cmp    %ebx,%eax
    6643:	77 be                	ja     6603 <test_cant_use_protected_memory+0x13b>
    6645:	83 ec 0c             	sub    $0xc,%esp
    6648:	68 f6 03 00 00       	push   $0x3f6
    664d:	68 f9 bf 00 00       	push   $0xbff9
    6652:	56                   	push   %esi
    6653:	68 a8 fc 00 00       	push   $0xfca8
    6658:	6a 01                	push   $0x1
    665a:	e8 08 55 00 00       	call   bb67 <printf>
    665f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6666:	00 00 00 
    6669:	83 c4 20             	add    $0x20,%esp
    666c:	e9 55 06 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Check changes
    ASSERT_FALSE(strncmp(read_file(TEST_1_MEM_MIN, 0), buf, strlen(buf)));
    6671:	83 ec 0c             	sub    $0xc,%esp
    6674:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    6677:	53                   	push   %ebx
    6678:	e8 86 50 00 00       	call   b703 <strlen>
    667d:	89 c7                	mov    %eax,%edi
    667f:	83 c4 08             	add    $0x8,%esp
    6682:	6a 00                	push   $0x0
    6684:	68 39 c2 00 00       	push   $0xc239
    6689:	e8 0e 9b ff ff       	call   19c <read_file>
    668e:	83 c4 0c             	add    $0xc,%esp
    6691:	57                   	push   %edi
    6692:	53                   	push   %ebx
    6693:	50                   	push   %eax
    6694:	e8 3a 50 00 00       	call   b6d3 <strncmp>
    6699:	83 c4 10             	add    $0x10,%esp
    669c:	85 c0                	test   %eax,%eax
    669e:	75 19                	jne    66b9 <test_cant_use_protected_memory+0x1f1>
    66a0:	eb 6e                	jmp    6710 <test_cant_use_protected_memory+0x248>
    66a2:	83 ec 08             	sub    $0x8,%esp
    66a5:	68 3c bf 00 00       	push   $0xbf3c
    66aa:	6a 01                	push   $0x1
    66ac:	e8 b6 54 00 00       	call   bb67 <printf>
    66b1:	83 c3 01             	add    $0x1,%ebx
    66b4:	83 c4 10             	add    $0x10,%esp
    66b7:	eb 05                	jmp    66be <test_cant_use_protected_memory+0x1f6>
    66b9:	bb 00 00 00 00       	mov    $0x0,%ebx
    66be:	83 ec 0c             	sub    $0xc,%esp
    66c1:	68 f4 fc 00 00       	push   $0xfcf4
    66c6:	e8 38 50 00 00       	call   b703 <strlen>
    66cb:	89 c7                	mov    %eax,%edi
    66cd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    66d4:	e8 2a 50 00 00       	call   b703 <strlen>
    66d9:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    66dd:	83 c4 10             	add    $0x10,%esp
    66e0:	39 d8                	cmp    %ebx,%eax
    66e2:	77 be                	ja     66a2 <test_cant_use_protected_memory+0x1da>
    66e4:	83 ec 0c             	sub    $0xc,%esp
    66e7:	68 f9 03 00 00       	push   $0x3f9
    66ec:	68 f9 bf 00 00       	push   $0xbff9
    66f1:	56                   	push   %esi
    66f2:	68 2c fd 00 00       	push   $0xfd2c
    66f7:	6a 01                	push   $0x1
    66f9:	e8 69 54 00 00       	call   bb67 <printf>
    66fe:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6705:	00 00 00 
    6708:	83 c4 20             	add    $0x20,%esp
    670b:	e9 b6 05 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Try to protect memory for cgroup2 this need to fail
    ASSERT_FALSE(write_file(TEST_2_MEM_MIN, buf));
    6710:	83 ec 08             	sub    $0x8,%esp
    6713:	8d 45 dc             	lea    -0x24(%ebp),%eax
    6716:	50                   	push   %eax
    6717:	68 b9 c5 00 00       	push   $0xc5b9
    671c:	e8 2d 9b ff ff       	call   24e <write_file>
    6721:	83 c4 10             	add    $0x10,%esp
    6724:	85 c0                	test   %eax,%eax
    6726:	75 19                	jne    6741 <test_cant_use_protected_memory+0x279>
    6728:	eb 6e                	jmp    6798 <test_cant_use_protected_memory+0x2d0>
    672a:	83 ec 08             	sub    $0x8,%esp
    672d:	68 3c bf 00 00       	push   $0xbf3c
    6732:	6a 01                	push   $0x1
    6734:	e8 2e 54 00 00       	call   bb67 <printf>
    6739:	83 c3 01             	add    $0x1,%ebx
    673c:	83 c4 10             	add    $0x10,%esp
    673f:	eb 05                	jmp    6746 <test_cant_use_protected_memory+0x27e>
    6741:	bb 00 00 00 00       	mov    $0x0,%ebx
    6746:	83 ec 0c             	sub    $0xc,%esp
    6749:	68 90 fd 00 00       	push   $0xfd90
    674e:	e8 b0 4f 00 00       	call   b703 <strlen>
    6753:	89 c7                	mov    %eax,%edi
    6755:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    675c:	e8 a2 4f 00 00       	call   b703 <strlen>
    6761:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6765:	83 c4 10             	add    $0x10,%esp
    6768:	39 d8                	cmp    %ebx,%eax
    676a:	77 be                	ja     672a <test_cant_use_protected_memory+0x262>
    676c:	83 ec 0c             	sub    $0xc,%esp
    676f:	68 fc 03 00 00       	push   $0x3fc
    6774:	68 f9 bf 00 00       	push   $0xbff9
    6779:	56                   	push   %esi
    677a:	68 b0 fd 00 00       	push   $0xfdb0
    677f:	6a 01                	push   $0x1
    6781:	e8 e1 53 00 00       	call   bb67 <printf>
    6786:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    678d:	00 00 00 
    6790:	83 c4 20             	add    $0x20,%esp
    6793:	e9 2e 05 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Attempt to grow process memory, notice this operation should fail and return -1.
    ASSERT_UINT_EQ((int)sbrk(MEM_SIZE), -1);
    6798:	83 ec 0c             	sub    $0xc,%esp
    679b:	68 00 00 c0 0d       	push   $0xdc00000
    67a0:	e8 59 52 00 00       	call   b9fe <sbrk>
    67a5:	83 c4 10             	add    $0x10,%esp
    67a8:	83 f8 ff             	cmp    $0xffffffff,%eax
    67ab:	74 34                	je     67e1 <test_cant_use_protected_memory+0x319>
    67ad:	83 ec 0c             	sub    $0xc,%esp
    67b0:	68 00 00 c0 0d       	push   $0xdc00000
    67b5:	e8 44 52 00 00       	call   b9fe <sbrk>
    67ba:	c7 04 24 ff 03 00 00 	movl   $0x3ff,(%esp)
    67c1:	68 f9 bf 00 00       	push   $0xbff9
    67c6:	6a ff                	push   $0xffffffff
    67c8:	50                   	push   %eax
    67c9:	56                   	push   %esi
    67ca:	e8 45 98 ff ff       	call   14 <print_error>
    67cf:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    67d6:	00 00 00 
    67d9:	83 c4 20             	add    $0x20,%esp
    67dc:	e9 e5 04 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Decreas memory min for cgroup1
    ASSERT_TRUE(write_file(TEST_1_MEM_MIN, "100"));
    67e1:	83 ec 08             	sub    $0x8,%esp
    67e4:	68 58 c6 00 00       	push   $0xc658
    67e9:	68 39 c2 00 00       	push   $0xc239
    67ee:	e8 5b 9a ff ff       	call   24e <write_file>
    67f3:	83 c4 10             	add    $0x10,%esp
    67f6:	85 c0                	test   %eax,%eax
    67f8:	74 19                	je     6813 <test_cant_use_protected_memory+0x34b>
    67fa:	eb 6e                	jmp    686a <test_cant_use_protected_memory+0x3a2>
    67fc:	83 ec 08             	sub    $0x8,%esp
    67ff:	68 3c bf 00 00       	push   $0xbf3c
    6804:	6a 01                	push   $0x1
    6806:	e8 5c 53 00 00       	call   bb67 <printf>
    680b:	83 c3 01             	add    $0x1,%ebx
    680e:	83 c4 10             	add    $0x10,%esp
    6811:	eb 05                	jmp    6818 <test_cant_use_protected_memory+0x350>
    6813:	bb 00 00 00 00       	mov    $0x0,%ebx
    6818:	83 ec 0c             	sub    $0xc,%esp
    681b:	68 68 fa 00 00       	push   $0xfa68
    6820:	e8 de 4e 00 00       	call   b703 <strlen>
    6825:	89 c7                	mov    %eax,%edi
    6827:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    682e:	e8 d0 4e 00 00       	call   b703 <strlen>
    6833:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6837:	83 c4 10             	add    $0x10,%esp
    683a:	39 d8                	cmp    %ebx,%eax
    683c:	77 be                	ja     67fc <test_cant_use_protected_memory+0x334>
    683e:	83 ec 0c             	sub    $0xc,%esp
    6841:	68 02 04 00 00       	push   $0x402
    6846:	68 f9 bf 00 00       	push   $0xbff9
    684b:	56                   	push   %esi
    684c:	68 8c fa 00 00       	push   $0xfa8c
    6851:	6a 01                	push   $0x1
    6853:	e8 0f 53 00 00       	call   bb67 <printf>
    6858:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    685f:	00 00 00 
    6862:	83 c4 20             	add    $0x20,%esp
    6865:	e9 5c 04 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Update memory min for cgroup2
    ASSERT_TRUE(write_file(TEST_2_MEM_MIN, "100"));
    686a:	83 ec 08             	sub    $0x8,%esp
    686d:	68 58 c6 00 00       	push   $0xc658
    6872:	68 b9 c5 00 00       	push   $0xc5b9
    6877:	e8 d2 99 ff ff       	call   24e <write_file>
    687c:	83 c4 10             	add    $0x10,%esp
    687f:	85 c0                	test   %eax,%eax
    6881:	74 19                	je     689c <test_cant_use_protected_memory+0x3d4>
    6883:	eb 6e                	jmp    68f3 <test_cant_use_protected_memory+0x42b>
    6885:	83 ec 08             	sub    $0x8,%esp
    6888:	68 3c bf 00 00       	push   $0xbf3c
    688d:	6a 01                	push   $0x1
    688f:	e8 d3 52 00 00       	call   bb67 <printf>
    6894:	83 c3 01             	add    $0x1,%ebx
    6897:	83 c4 10             	add    $0x10,%esp
    689a:	eb 05                	jmp    68a1 <test_cant_use_protected_memory+0x3d9>
    689c:	bb 00 00 00 00       	mov    $0x0,%ebx
    68a1:	83 ec 0c             	sub    $0xc,%esp
    68a4:	68 fc fd 00 00       	push   $0xfdfc
    68a9:	e8 55 4e 00 00       	call   b703 <strlen>
    68ae:	89 c7                	mov    %eax,%edi
    68b0:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    68b7:	e8 47 4e 00 00       	call   b703 <strlen>
    68bc:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    68c0:	83 c4 10             	add    $0x10,%esp
    68c3:	39 d8                	cmp    %ebx,%eax
    68c5:	77 be                	ja     6885 <test_cant_use_protected_memory+0x3bd>
    68c7:	83 ec 0c             	sub    $0xc,%esp
    68ca:	68 05 04 00 00       	push   $0x405
    68cf:	68 f9 bf 00 00       	push   $0xbff9
    68d4:	56                   	push   %esi
    68d5:	68 20 fe 00 00       	push   $0xfe20
    68da:	6a 01                	push   $0x1
    68dc:	e8 86 52 00 00       	call   bb67 <printf>
    68e1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    68e8:	00 00 00 
    68eb:	83 c4 20             	add    $0x20,%esp
    68ee:	e9 d3 03 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_2_MEM_MIN, 0), "100\n"));
    68f3:	83 ec 08             	sub    $0x8,%esp
    68f6:	6a 00                	push   $0x0
    68f8:	68 b9 c5 00 00       	push   $0xc5b9
    68fd:	e8 9a 98 ff ff       	call   19c <read_file>
    6902:	83 c4 08             	add    $0x8,%esp
    6905:	68 88 c5 00 00       	push   $0xc588
    690a:	50                   	push   %eax
    690b:	e8 9d 4d 00 00       	call   b6ad <strcmp>
    6910:	83 c4 10             	add    $0x10,%esp
    6913:	85 c0                	test   %eax,%eax
    6915:	75 19                	jne    6930 <test_cant_use_protected_memory+0x468>
    6917:	eb 6e                	jmp    6987 <test_cant_use_protected_memory+0x4bf>
    6919:	83 ec 08             	sub    $0x8,%esp
    691c:	68 3c bf 00 00       	push   $0xbf3c
    6921:	6a 01                	push   $0x1
    6923:	e8 3f 52 00 00       	call   bb67 <printf>
    6928:	83 c3 01             	add    $0x1,%ebx
    692b:	83 c4 10             	add    $0x10,%esp
    692e:	eb 05                	jmp    6935 <test_cant_use_protected_memory+0x46d>
    6930:	bb 00 00 00 00       	mov    $0x0,%ebx
    6935:	83 ec 0c             	sub    $0xc,%esp
    6938:	68 6c fe 00 00       	push   $0xfe6c
    693d:	e8 c1 4d 00 00       	call   b703 <strlen>
    6942:	89 c7                	mov    %eax,%edi
    6944:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    694b:	e8 b3 4d 00 00       	call   b703 <strlen>
    6950:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6954:	83 c4 10             	add    $0x10,%esp
    6957:	39 d8                	cmp    %ebx,%eax
    6959:	77 be                	ja     6919 <test_cant_use_protected_memory+0x451>
    695b:	83 ec 0c             	sub    $0xc,%esp
    695e:	68 08 04 00 00       	push   $0x408
    6963:	68 f9 bf 00 00       	push   $0xbff9
    6968:	56                   	push   %esi
    6969:	68 9c fe 00 00       	push   $0xfe9c
    696e:	6a 01                	push   $0x1
    6970:	e8 f2 51 00 00       	call   bb67 <printf>
    6975:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    697c:	00 00 00 
    697f:	83 c4 20             	add    $0x20,%esp
    6982:	e9 3f 03 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Restore memory limit to original
    ASSERT_TRUE(write_file(TEST_1_MEM_MIN, "0"));
    6987:	83 ec 08             	sub    $0x8,%esp
    698a:	68 9b c3 00 00       	push   $0xc39b
    698f:	68 39 c2 00 00       	push   $0xc239
    6994:	e8 b5 98 ff ff       	call   24e <write_file>
    6999:	83 c4 10             	add    $0x10,%esp
    699c:	85 c0                	test   %eax,%eax
    699e:	74 19                	je     69b9 <test_cant_use_protected_memory+0x4f1>
    69a0:	eb 6e                	jmp    6a10 <test_cant_use_protected_memory+0x548>
    69a2:	83 ec 08             	sub    $0x8,%esp
    69a5:	68 3c bf 00 00       	push   $0xbf3c
    69aa:	6a 01                	push   $0x1
    69ac:	e8 b6 51 00 00       	call   bb67 <printf>
    69b1:	83 c3 01             	add    $0x1,%ebx
    69b4:	83 c4 10             	add    $0x10,%esp
    69b7:	eb 05                	jmp    69be <test_cant_use_protected_memory+0x4f6>
    69b9:	bb 00 00 00 00       	mov    $0x0,%ebx
    69be:	83 ec 0c             	sub    $0xc,%esp
    69c1:	68 f4 fe 00 00       	push   $0xfef4
    69c6:	e8 38 4d 00 00       	call   b703 <strlen>
    69cb:	89 c7                	mov    %eax,%edi
    69cd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    69d4:	e8 2a 4d 00 00       	call   b703 <strlen>
    69d9:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    69dd:	83 c4 10             	add    $0x10,%esp
    69e0:	39 d8                	cmp    %ebx,%eax
    69e2:	77 be                	ja     69a2 <test_cant_use_protected_memory+0x4da>
    69e4:	83 ec 0c             	sub    $0xc,%esp
    69e7:	68 0b 04 00 00       	push   $0x40b
    69ec:	68 f9 bf 00 00       	push   $0xbff9
    69f1:	56                   	push   %esi
    69f2:	68 14 ff 00 00       	push   $0xff14
    69f7:	6a 01                	push   $0x1
    69f9:	e8 69 51 00 00       	call   bb67 <printf>
    69fe:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6a05:	00 00 00 
    6a08:	83 c4 20             	add    $0x20,%esp
    6a0b:	e9 b6 02 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>
    ASSERT_TRUE(write_file(TEST_2_MEM_MIN, "0"));
    6a10:	83 ec 08             	sub    $0x8,%esp
    6a13:	68 9b c3 00 00       	push   $0xc39b
    6a18:	68 b9 c5 00 00       	push   $0xc5b9
    6a1d:	e8 2c 98 ff ff       	call   24e <write_file>
    6a22:	83 c4 10             	add    $0x10,%esp
    6a25:	85 c0                	test   %eax,%eax
    6a27:	74 19                	je     6a42 <test_cant_use_protected_memory+0x57a>
    6a29:	eb 6e                	jmp    6a99 <test_cant_use_protected_memory+0x5d1>
    6a2b:	83 ec 08             	sub    $0x8,%esp
    6a2e:	68 3c bf 00 00       	push   $0xbf3c
    6a33:	6a 01                	push   $0x1
    6a35:	e8 2d 51 00 00       	call   bb67 <printf>
    6a3a:	83 c3 01             	add    $0x1,%ebx
    6a3d:	83 c4 10             	add    $0x10,%esp
    6a40:	eb 05                	jmp    6a47 <test_cant_use_protected_memory+0x57f>
    6a42:	bb 00 00 00 00       	mov    $0x0,%ebx
    6a47:	83 ec 0c             	sub    $0xc,%esp
    6a4a:	68 60 ff 00 00       	push   $0xff60
    6a4f:	e8 af 4c 00 00       	call   b703 <strlen>
    6a54:	89 c7                	mov    %eax,%edi
    6a56:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6a5d:	e8 a1 4c 00 00       	call   b703 <strlen>
    6a62:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6a66:	83 c4 10             	add    $0x10,%esp
    6a69:	39 d8                	cmp    %ebx,%eax
    6a6b:	77 be                	ja     6a2b <test_cant_use_protected_memory+0x563>
    6a6d:	83 ec 0c             	sub    $0xc,%esp
    6a70:	68 0c 04 00 00       	push   $0x40c
    6a75:	68 f9 bf 00 00       	push   $0xbff9
    6a7a:	56                   	push   %esi
    6a7b:	68 80 ff 00 00       	push   $0xff80
    6a80:	6a 01                	push   $0x1
    6a82:	e8 e0 50 00 00       	call   bb67 <printf>
    6a87:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6a8e:	00 00 00 
    6a91:	83 c4 20             	add    $0x20,%esp
    6a94:	e9 2d 02 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MIN, 0), "0\n"));
    6a99:	83 ec 08             	sub    $0x8,%esp
    6a9c:	6a 00                	push   $0x0
    6a9e:	68 39 c2 00 00       	push   $0xc239
    6aa3:	e8 f4 96 ff ff       	call   19c <read_file>
    6aa8:	83 c4 08             	add    $0x8,%esp
    6aab:	68 00 c5 00 00       	push   $0xc500
    6ab0:	50                   	push   %eax
    6ab1:	e8 f7 4b 00 00       	call   b6ad <strcmp>
    6ab6:	83 c4 10             	add    $0x10,%esp
    6ab9:	85 c0                	test   %eax,%eax
    6abb:	75 19                	jne    6ad6 <test_cant_use_protected_memory+0x60e>
    6abd:	eb 6e                	jmp    6b2d <test_cant_use_protected_memory+0x665>
    6abf:	83 ec 08             	sub    $0x8,%esp
    6ac2:	68 3c bf 00 00       	push   $0xbf3c
    6ac7:	6a 01                	push   $0x1
    6ac9:	e8 99 50 00 00       	call   bb67 <printf>
    6ace:	83 c3 01             	add    $0x1,%ebx
    6ad1:	83 c4 10             	add    $0x10,%esp
    6ad4:	eb 05                	jmp    6adb <test_cant_use_protected_memory+0x613>
    6ad6:	bb 00 00 00 00       	mov    $0x0,%ebx
    6adb:	83 ec 0c             	sub    $0xc,%esp
    6ade:	68 cc ff 00 00       	push   $0xffcc
    6ae3:	e8 1b 4c 00 00       	call   b703 <strlen>
    6ae8:	89 c7                	mov    %eax,%edi
    6aea:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6af1:	e8 0d 4c 00 00       	call   b703 <strlen>
    6af6:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6afa:	83 c4 10             	add    $0x10,%esp
    6afd:	39 d8                	cmp    %ebx,%eax
    6aff:	77 be                	ja     6abf <test_cant_use_protected_memory+0x5f7>
    6b01:	83 ec 0c             	sub    $0xc,%esp
    6b04:	68 0f 04 00 00       	push   $0x40f
    6b09:	68 f9 bf 00 00       	push   $0xbff9
    6b0e:	56                   	push   %esi
    6b0f:	68 f8 ff 00 00       	push   $0xfff8
    6b14:	6a 01                	push   $0x1
    6b16:	e8 4c 50 00 00       	call   bb67 <printf>
    6b1b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6b22:	00 00 00 
    6b25:	83 c4 20             	add    $0x20,%esp
    6b28:	e9 99 01 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>
    ASSERT_FALSE(strcmp(read_file(TEST_2_MEM_MIN, 0), "0\n"));
    6b2d:	83 ec 08             	sub    $0x8,%esp
    6b30:	6a 00                	push   $0x0
    6b32:	68 b9 c5 00 00       	push   $0xc5b9
    6b37:	e8 60 96 ff ff       	call   19c <read_file>
    6b3c:	83 c4 08             	add    $0x8,%esp
    6b3f:	68 00 c5 00 00       	push   $0xc500
    6b44:	50                   	push   %eax
    6b45:	e8 63 4b 00 00       	call   b6ad <strcmp>
    6b4a:	83 c4 10             	add    $0x10,%esp
    6b4d:	85 c0                	test   %eax,%eax
    6b4f:	75 19                	jne    6b6a <test_cant_use_protected_memory+0x6a2>
    6b51:	eb 6e                	jmp    6bc1 <test_cant_use_protected_memory+0x6f9>
    6b53:	83 ec 08             	sub    $0x8,%esp
    6b56:	68 3c bf 00 00       	push   $0xbf3c
    6b5b:	6a 01                	push   $0x1
    6b5d:	e8 05 50 00 00       	call   bb67 <printf>
    6b62:	83 c3 01             	add    $0x1,%ebx
    6b65:	83 c4 10             	add    $0x10,%esp
    6b68:	eb 05                	jmp    6b6f <test_cant_use_protected_memory+0x6a7>
    6b6a:	bb 00 00 00 00       	mov    $0x0,%ebx
    6b6f:	83 ec 0c             	sub    $0xc,%esp
    6b72:	68 50 00 01 00       	push   $0x10050
    6b77:	e8 87 4b 00 00       	call   b703 <strlen>
    6b7c:	89 c7                	mov    %eax,%edi
    6b7e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6b85:	e8 79 4b 00 00       	call   b703 <strlen>
    6b8a:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6b8e:	83 c4 10             	add    $0x10,%esp
    6b91:	39 d8                	cmp    %ebx,%eax
    6b93:	77 be                	ja     6b53 <test_cant_use_protected_memory+0x68b>
    6b95:	83 ec 0c             	sub    $0xc,%esp
    6b98:	68 10 04 00 00       	push   $0x410
    6b9d:	68 f9 bf 00 00       	push   $0xbff9
    6ba2:	56                   	push   %esi
    6ba3:	68 7c 00 01 00       	push   $0x1007c
    6ba8:	6a 01                	push   $0x1
    6baa:	e8 b8 4f 00 00       	call   bb67 <printf>
    6baf:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6bb6:	00 00 00 
    6bb9:	83 c4 20             	add    $0x20,%esp
    6bbc:	e9 05 01 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>

    // Disable memory controllers
    ASSERT_TRUE(disable_controller(MEM_CNT));
    6bc1:	83 ec 0c             	sub    $0xc,%esp
    6bc4:	6a 03                	push   $0x3
    6bc6:	e8 ea 97 ff ff       	call   3b5 <disable_controller>
    6bcb:	83 c4 10             	add    $0x10,%esp
    6bce:	85 c0                	test   %eax,%eax
    6bd0:	74 19                	je     6beb <test_cant_use_protected_memory+0x723>
    6bd2:	eb 6e                	jmp    6c42 <test_cant_use_protected_memory+0x77a>
    6bd4:	83 ec 08             	sub    $0x8,%esp
    6bd7:	68 3c bf 00 00       	push   $0xbf3c
    6bdc:	6a 01                	push   $0x1
    6bde:	e8 84 4f 00 00       	call   bb67 <printf>
    6be3:	83 c3 01             	add    $0x1,%ebx
    6be6:	83 c4 10             	add    $0x10,%esp
    6be9:	eb 05                	jmp    6bf0 <test_cant_use_protected_memory+0x728>
    6beb:	bb 00 00 00 00       	mov    $0x0,%ebx
    6bf0:	83 ec 0c             	sub    $0xc,%esp
    6bf3:	68 91 c5 00 00       	push   $0xc591
    6bf8:	e8 06 4b 00 00       	call   b703 <strlen>
    6bfd:	89 c7                	mov    %eax,%edi
    6bff:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6c06:	e8 f8 4a 00 00       	call   b703 <strlen>
    6c0b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6c0f:	83 c4 10             	add    $0x10,%esp
    6c12:	39 d8                	cmp    %ebx,%eax
    6c14:	77 be                	ja     6bd4 <test_cant_use_protected_memory+0x70c>
    6c16:	83 ec 0c             	sub    $0xc,%esp
    6c19:	68 13 04 00 00       	push   $0x413
    6c1e:	68 f9 bf 00 00       	push   $0xbff9
    6c23:	56                   	push   %esi
    6c24:	68 90 f8 00 00       	push   $0xf890
    6c29:	6a 01                	push   $0x1
    6c2b:	e8 37 4f 00 00       	call   bb67 <printf>
    6c30:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6c37:	00 00 00 
    6c3a:	83 c4 20             	add    $0x20,%esp
    6c3d:	e9 84 00 00 00       	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>
    ASSERT_TRUE(write_file(TEST_2_CGROUP_SUBTREE_CONTROL, "-mem"));
    6c42:	83 ec 08             	sub    $0x8,%esp
    6c45:	68 d2 c5 00 00       	push   $0xc5d2
    6c4a:	68 d0 fb 00 00       	push   $0xfbd0
    6c4f:	e8 fa 95 ff ff       	call   24e <write_file>
    6c54:	83 c4 10             	add    $0x10,%esp
    6c57:	85 c0                	test   %eax,%eax
    6c59:	74 19                	je     6c74 <test_cant_use_protected_memory+0x7ac>
    6c5b:	eb 69                	jmp    6cc6 <test_cant_use_protected_memory+0x7fe>
    6c5d:	83 ec 08             	sub    $0x8,%esp
    6c60:	68 3c bf 00 00       	push   $0xbf3c
    6c65:	6a 01                	push   $0x1
    6c67:	e8 fb 4e 00 00       	call   bb67 <printf>
    6c6c:	83 c3 01             	add    $0x1,%ebx
    6c6f:	83 c4 10             	add    $0x10,%esp
    6c72:	eb 05                	jmp    6c79 <test_cant_use_protected_memory+0x7b1>
    6c74:	bb 00 00 00 00       	mov    $0x0,%ebx
    6c79:	83 ec 0c             	sub    $0xc,%esp
    6c7c:	68 d4 00 01 00       	push   $0x100d4
    6c81:	e8 7d 4a 00 00       	call   b703 <strlen>
    6c86:	89 c7                	mov    %eax,%edi
    6c88:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6c8f:	e8 6f 4a 00 00       	call   b703 <strlen>
    6c94:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    6c98:	83 c4 10             	add    $0x10,%esp
    6c9b:	39 d8                	cmp    %ebx,%eax
    6c9d:	77 be                	ja     6c5d <test_cant_use_protected_memory+0x795>
    6c9f:	83 ec 0c             	sub    $0xc,%esp
    6ca2:	68 14 04 00 00       	push   $0x414
    6ca7:	68 f9 bf 00 00       	push   $0xbff9
    6cac:	56                   	push   %esi
    6cad:	68 08 01 01 00       	push   $0x10108
    6cb2:	6a 01                	push   $0x1
    6cb4:	e8 ae 4e 00 00       	call   bb67 <printf>
    6cb9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6cc0:	00 00 00 
    6cc3:	83 c4 20             	add    $0x20,%esp
}
    6cc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    6cc9:	5b                   	pop    %ebx
    6cca:	5e                   	pop    %esi
    6ccb:	5f                   	pop    %edi
    6ccc:	5d                   	pop    %ebp
    6ccd:	c3                   	ret    

00006cce <test_release_protected_memory_after_delete_cgroup>:

TEST(test_release_protected_memory_after_delete_cgroup)
{
    6cce:	55                   	push   %ebp
    6ccf:	89 e5                	mov    %esp,%ebp
    6cd1:	57                   	push   %edi
    6cd2:	56                   	push   %esi
    6cd3:	53                   	push   %ebx
    6cd4:	83 ec 5c             	sub    $0x5c,%esp
    int i = 0;
    char buf [12] = {0};
    6cd7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6cde:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6ce5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    char * mem_str_buf = 0;
    uint kernel_total_mem = 0;
    //We want to reserve different amounts of memory (by precantage)
    float memory_reservations[] = {1.0, 0.75, 0.5, 0.25, 0.1, 0.05, 0.01};
    6cec:	c7 45 c0 00 00 80 3f 	movl   $0x3f800000,-0x40(%ebp)
    6cf3:	c7 45 c4 00 00 40 3f 	movl   $0x3f400000,-0x3c(%ebp)
    6cfa:	c7 45 c8 00 00 00 3f 	movl   $0x3f000000,-0x38(%ebp)
    6d01:	c7 45 cc 00 00 80 3e 	movl   $0x3e800000,-0x34(%ebp)
    6d08:	c7 45 d0 cd cc cc 3d 	movl   $0x3dcccccd,-0x30(%ebp)
    6d0f:	c7 45 d4 cd cc 4c 3d 	movl   $0x3d4ccccd,-0x2c(%ebp)
    6d16:	c7 45 d8 0a d7 23 3c 	movl   $0x3c23d70a,-0x28(%ebp)

    // Create temp cgroup and enable memory controllers
    for(i = 0; i < sizeof(memory_reservations) / sizeof(float); i++)
    6d1d:	bb 00 00 00 00       	mov    $0x0,%ebx
    6d22:	e9 7e 05 00 00       	jmp    72a5 <test_release_protected_memory_after_delete_cgroup+0x5d7>
    {
      ASSERT_FALSE(mkdir(TEST_TMP));
    6d27:	83 ec 0c             	sub    $0xc,%esp
    6d2a:	68 d7 c5 00 00       	push   $0xc5d7
    6d2f:	e8 aa 4c 00 00       	call   b9de <mkdir>
    6d34:	83 c4 10             	add    $0x10,%esp
    6d37:	85 c0                	test   %eax,%eax
    6d39:	74 72                	je     6dad <test_release_protected_memory_after_delete_cgroup+0xdf>
    6d3b:	eb 17                	jmp    6d54 <test_release_protected_memory_after_delete_cgroup+0x86>
    6d3d:	83 ec 08             	sub    $0x8,%esp
    6d40:	68 3c bf 00 00       	push   $0xbf3c
    6d45:	6a 01                	push   $0x1
    6d47:	e8 1b 4e 00 00       	call   bb67 <printf>
    6d4c:	83 c3 01             	add    $0x1,%ebx
    6d4f:	83 c4 10             	add    $0x10,%esp
    6d52:	eb 05                	jmp    6d59 <test_release_protected_memory_after_delete_cgroup+0x8b>
    6d54:	bb 00 00 00 00       	mov    $0x0,%ebx
    6d59:	83 ec 0c             	sub    $0xc,%esp
    6d5c:	68 e7 c5 00 00       	push   $0xc5e7
    6d61:	e8 9d 49 00 00       	call   b703 <strlen>
    6d66:	89 c6                	mov    %eax,%esi
    6d68:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6d6f:	e8 8f 49 00 00       	call   b703 <strlen>
    6d74:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    6d78:	83 c4 10             	add    $0x10,%esp
    6d7b:	39 d8                	cmp    %ebx,%eax
    6d7d:	77 be                	ja     6d3d <test_release_protected_memory_after_delete_cgroup+0x6f>
    6d7f:	83 ec 0c             	sub    $0xc,%esp
    6d82:	68 23 04 00 00       	push   $0x423
    6d87:	68 f9 bf 00 00       	push   $0xbff9
    6d8c:	ff 75 08             	pushl  0x8(%ebp)
    6d8f:	68 64 01 01 00       	push   $0x10164
    6d94:	6a 01                	push   $0x1
    6d96:	e8 cc 4d 00 00       	call   bb67 <printf>
    6d9b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6da2:	00 00 00 
    6da5:	83 c4 20             	add    $0x20,%esp
    6da8:	e9 01 05 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>
      ASSERT_TRUE(enable_controller(MEM_CNT));
    6dad:	83 ec 0c             	sub    $0xc,%esp
    6db0:	6a 03                	push   $0x3
    6db2:	e8 a9 95 ff ff       	call   360 <enable_controller>
    6db7:	83 c4 10             	add    $0x10,%esp
    6dba:	85 c0                	test   %eax,%eax
    6dbc:	75 72                	jne    6e30 <test_release_protected_memory_after_delete_cgroup+0x162>
    6dbe:	eb 17                	jmp    6dd7 <test_release_protected_memory_after_delete_cgroup+0x109>
    6dc0:	83 ec 08             	sub    $0x8,%esp
    6dc3:	68 3c bf 00 00       	push   $0xbf3c
    6dc8:	6a 01                	push   $0x1
    6dca:	e8 98 4d 00 00       	call   bb67 <printf>
    6dcf:	83 c3 01             	add    $0x1,%ebx
    6dd2:	83 c4 10             	add    $0x10,%esp
    6dd5:	eb 05                	jmp    6ddc <test_release_protected_memory_after_delete_cgroup+0x10e>
    6dd7:	bb 00 00 00 00       	mov    $0x0,%ebx
    6ddc:	83 ec 0c             	sub    $0xc,%esp
    6ddf:	68 5f c5 00 00       	push   $0xc55f
    6de4:	e8 1a 49 00 00       	call   b703 <strlen>
    6de9:	89 c6                	mov    %eax,%esi
    6deb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6df2:	e8 0c 49 00 00       	call   b703 <strlen>
    6df7:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    6dfb:	83 c4 10             	add    $0x10,%esp
    6dfe:	39 d8                	cmp    %ebx,%eax
    6e00:	77 be                	ja     6dc0 <test_release_protected_memory_after_delete_cgroup+0xf2>
    6e02:	83 ec 0c             	sub    $0xc,%esp
    6e05:	68 24 04 00 00       	push   $0x424
    6e0a:	68 f9 bf 00 00       	push   $0xbff9
    6e0f:	ff 75 08             	pushl  0x8(%ebp)
    6e12:	68 54 f5 00 00       	push   $0xf554
    6e17:	6a 01                	push   $0x1
    6e19:	e8 49 4d 00 00       	call   bb67 <printf>
    6e1e:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6e25:	00 00 00 
    6e28:	83 c4 20             	add    $0x20,%esp
    6e2b:	e9 7e 04 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>
      ASSERT_TRUE(write_file(TEST_TMP_CGROUP_SUBTREE_CONTROL, "+mem"));
    6e30:	83 ec 08             	sub    $0x8,%esp
    6e33:	68 b4 c5 00 00       	push   $0xc5b4
    6e38:	68 a0 01 01 00       	push   $0x101a0
    6e3d:	e8 0c 94 ff ff       	call   24e <write_file>
    6e42:	83 c4 10             	add    $0x10,%esp
    6e45:	85 c0                	test   %eax,%eax
    6e47:	75 72                	jne    6ebb <test_release_protected_memory_after_delete_cgroup+0x1ed>
    6e49:	eb 17                	jmp    6e62 <test_release_protected_memory_after_delete_cgroup+0x194>
    6e4b:	83 ec 08             	sub    $0x8,%esp
    6e4e:	68 3c bf 00 00       	push   $0xbf3c
    6e53:	6a 01                	push   $0x1
    6e55:	e8 0d 4d 00 00       	call   bb67 <printf>
    6e5a:	83 c3 01             	add    $0x1,%ebx
    6e5d:	83 c4 10             	add    $0x10,%esp
    6e60:	eb 05                	jmp    6e67 <test_release_protected_memory_after_delete_cgroup+0x199>
    6e62:	bb 00 00 00 00       	mov    $0x0,%ebx
    6e67:	83 ec 0c             	sub    $0xc,%esp
    6e6a:	68 c8 01 01 00       	push   $0x101c8
    6e6f:	e8 8f 48 00 00       	call   b703 <strlen>
    6e74:	89 c6                	mov    %eax,%esi
    6e76:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6e7d:	e8 81 48 00 00       	call   b703 <strlen>
    6e82:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    6e86:	83 c4 10             	add    $0x10,%esp
    6e89:	39 d8                	cmp    %ebx,%eax
    6e8b:	77 be                	ja     6e4b <test_release_protected_memory_after_delete_cgroup+0x17d>
    6e8d:	83 ec 0c             	sub    $0xc,%esp
    6e90:	68 25 04 00 00       	push   $0x425
    6e95:	68 f9 bf 00 00       	push   $0xbff9
    6e9a:	ff 75 08             	pushl  0x8(%ebp)
    6e9d:	68 fc 01 01 00       	push   $0x101fc
    6ea2:	6a 01                	push   $0x1
    6ea4:	e8 be 4c 00 00       	call   bb67 <printf>
    6ea9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6eb0:	00 00 00 
    6eb3:	83 c4 20             	add    $0x20,%esp
    6eb6:	e9 f3 03 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>

      // get total amount of memory from memory controller core file (memory.stat) 
      mem_str_buf = read_file(TEST_1_MEM_STAT, 0);
    6ebb:	83 ec 08             	sub    $0x8,%esp
    6ebe:	6a 00                	push   $0x0
    6ec0:	68 52 c2 00 00       	push   $0xc252
    6ec5:	e8 d2 92 ff ff       	call   19c <read_file>
      kernel_total_mem = get_kernel_total_memory(mem_str_buf);
    6eca:	89 04 24             	mov    %eax,(%esp)
    6ecd:	e8 b3 91 ff ff       	call   85 <get_kernel_total_memory>
    6ed2:	89 c7                	mov    %eax,%edi

      memset(buf, 12, 0);
    6ed4:	83 c4 0c             	add    $0xc,%esp
    6ed7:	6a 00                	push   $0x0
    6ed9:	6a 0c                	push   $0xc
    6edb:	8d 75 dc             	lea    -0x24(%ebp),%esi
    6ede:	56                   	push   %esi
    6edf:	e8 39 48 00 00       	call   b71d <memset>
      itoa(buf,  kernel_total_mem * memory_reservations[i]);
    6ee4:	89 7d a0             	mov    %edi,-0x60(%ebp)
    6ee7:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    6eee:	df 6d a0             	fildll -0x60(%ebp)
    6ef1:	d9 55 a0             	fsts   -0x60(%ebp)
    6ef4:	d8 4c 9d c0          	fmuls  -0x40(%ebp,%ebx,4)
    6ef8:	d9 55 a8             	fsts   -0x58(%ebp)
    6efb:	83 c4 08             	add    $0x8,%esp
    6efe:	d9 7d b2             	fnstcw -0x4e(%ebp)
    6f01:	0f b7 45 b2          	movzwl -0x4e(%ebp),%eax
    6f05:	b4 0c                	mov    $0xc,%ah
    6f07:	66 89 45 b0          	mov    %ax,-0x50(%ebp)
    6f0b:	d9 6d b0             	fldcw  -0x50(%ebp)
    6f0e:	db 5d ac             	fistpl -0x54(%ebp)
    6f11:	d9 6d b2             	fldcw  -0x4e(%ebp)
    6f14:	8b 45 ac             	mov    -0x54(%ebp),%eax
    6f17:	50                   	push   %eax
    6f18:	56                   	push   %esi
    6f19:	e8 2c 49 00 00       	call   b84a <itoa>

      // Protect portion of memory for tmpcgroup
      ASSERT_TRUE(write_file(TEST_TMP_MEM_MIN, buf));
    6f1e:	83 c4 08             	add    $0x8,%esp
    6f21:	56                   	push   %esi
    6f22:	68 f7 c5 00 00       	push   $0xc5f7
    6f27:	e8 22 93 ff ff       	call   24e <write_file>
    6f2c:	83 c4 10             	add    $0x10,%esp
    6f2f:	85 c0                	test   %eax,%eax
    6f31:	75 72                	jne    6fa5 <test_release_protected_memory_after_delete_cgroup+0x2d7>
    6f33:	eb 17                	jmp    6f4c <test_release_protected_memory_after_delete_cgroup+0x27e>
    6f35:	83 ec 08             	sub    $0x8,%esp
    6f38:	68 3c bf 00 00       	push   $0xbf3c
    6f3d:	6a 01                	push   $0x1
    6f3f:	e8 23 4c 00 00       	call   bb67 <printf>
    6f44:	83 c3 01             	add    $0x1,%ebx
    6f47:	83 c4 10             	add    $0x10,%esp
    6f4a:	eb 05                	jmp    6f51 <test_release_protected_memory_after_delete_cgroup+0x283>
    6f4c:	bb 00 00 00 00       	mov    $0x0,%ebx
    6f51:	83 ec 0c             	sub    $0xc,%esp
    6f54:	68 5c 02 01 00       	push   $0x1025c
    6f59:	e8 a5 47 00 00       	call   b703 <strlen>
    6f5e:	89 c6                	mov    %eax,%esi
    6f60:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    6f67:	e8 97 47 00 00       	call   b703 <strlen>
    6f6c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    6f70:	83 c4 10             	add    $0x10,%esp
    6f73:	39 d8                	cmp    %ebx,%eax
    6f75:	77 be                	ja     6f35 <test_release_protected_memory_after_delete_cgroup+0x267>
    6f77:	83 ec 0c             	sub    $0xc,%esp
    6f7a:	68 2f 04 00 00       	push   $0x42f
    6f7f:	68 f9 bf 00 00       	push   $0xbff9
    6f84:	ff 75 08             	pushl  0x8(%ebp)
    6f87:	68 80 02 01 00       	push   $0x10280
    6f8c:	6a 01                	push   $0x1
    6f8e:	e8 d4 4b 00 00       	call   bb67 <printf>
    6f93:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    6f9a:	00 00 00 
    6f9d:	83 c4 20             	add    $0x20,%esp
    6fa0:	e9 09 03 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>
      
      // Check changes
      ASSERT_FALSE(strncmp(read_file(TEST_TMP_MEM_MIN, 0), buf, strlen(buf)));
    6fa5:	83 ec 0c             	sub    $0xc,%esp
    6fa8:	8d 75 dc             	lea    -0x24(%ebp),%esi
    6fab:	56                   	push   %esi
    6fac:	e8 52 47 00 00       	call   b703 <strlen>
    6fb1:	89 c7                	mov    %eax,%edi
    6fb3:	83 c4 08             	add    $0x8,%esp
    6fb6:	6a 00                	push   $0x0
    6fb8:	68 f7 c5 00 00       	push   $0xc5f7
    6fbd:	e8 da 91 ff ff       	call   19c <read_file>
    6fc2:	83 c4 0c             	add    $0xc,%esp
    6fc5:	57                   	push   %edi
    6fc6:	56                   	push   %esi
    6fc7:	50                   	push   %eax
    6fc8:	e8 06 47 00 00       	call   b6d3 <strncmp>
    6fcd:	83 c4 10             	add    $0x10,%esp
    6fd0:	85 c0                	test   %eax,%eax
    6fd2:	74 72                	je     7046 <test_release_protected_memory_after_delete_cgroup+0x378>
    6fd4:	eb 17                	jmp    6fed <test_release_protected_memory_after_delete_cgroup+0x31f>
    6fd6:	83 ec 08             	sub    $0x8,%esp
    6fd9:	68 3c bf 00 00       	push   $0xbf3c
    6fde:	6a 01                	push   $0x1
    6fe0:	e8 82 4b 00 00       	call   bb67 <printf>
    6fe5:	83 c3 01             	add    $0x1,%ebx
    6fe8:	83 c4 10             	add    $0x10,%esp
    6feb:	eb 05                	jmp    6ff2 <test_release_protected_memory_after_delete_cgroup+0x324>
    6fed:	bb 00 00 00 00       	mov    $0x0,%ebx
    6ff2:	83 ec 0c             	sub    $0xc,%esp
    6ff5:	68 cc 02 01 00       	push   $0x102cc
    6ffa:	e8 04 47 00 00       	call   b703 <strlen>
    6fff:	89 c6                	mov    %eax,%esi
    7001:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7008:	e8 f6 46 00 00       	call   b703 <strlen>
    700d:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    7011:	83 c4 10             	add    $0x10,%esp
    7014:	39 d8                	cmp    %ebx,%eax
    7016:	77 be                	ja     6fd6 <test_release_protected_memory_after_delete_cgroup+0x308>
    7018:	83 ec 0c             	sub    $0xc,%esp
    701b:	68 32 04 00 00       	push   $0x432
    7020:	68 f9 bf 00 00       	push   $0xbff9
    7025:	ff 75 08             	pushl  0x8(%ebp)
    7028:	68 08 03 01 00       	push   $0x10308
    702d:	6a 01                	push   $0x1
    702f:	e8 33 4b 00 00       	call   bb67 <printf>
    7034:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    703b:	00 00 00 
    703e:	83 c4 20             	add    $0x20,%esp
    7041:	e9 68 02 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>
      /* Here we change the value we want to reserve to be total kernel's memory -  X + page_size + 1.
        - Where X is the amount we reserved 
        - page_size is the kernel pagesize we use to exceed the amount of available space
        - +1 is used in case X is a round value (of 4k page size) so addinf PGSIZE won't exceed
          the available memory space.This is a special case where +1 will overflow it for sure.*/
      memset(buf, 12, 0);
    7046:	83 ec 04             	sub    $0x4,%esp
    7049:	6a 00                	push   $0x0
    704b:	6a 0c                	push   $0xc
    704d:	8d 75 dc             	lea    -0x24(%ebp),%esi
    7050:	56                   	push   %esi
    7051:	e8 c7 46 00 00       	call   b71d <memset>
      itoa(buf,  kernel_total_mem - 
    7056:	d9 45 a0             	flds   -0x60(%ebp)
    7059:	d8 65 a8             	fsubs  -0x58(%ebp)
              (kernel_total_mem * memory_reservations[i]) + PGSIZE + 1);
    705c:	d8 05 d0 10 01 00    	fadds  0x110d0
    7062:	d8 05 cc 10 01 00    	fadds  0x110cc
        - Where X is the amount we reserved 
        - page_size is the kernel pagesize we use to exceed the amount of available space
        - +1 is used in case X is a round value (of 4k page size) so addinf PGSIZE won't exceed
          the available memory space.This is a special case where +1 will overflow it for sure.*/
      memset(buf, 12, 0);
      itoa(buf,  kernel_total_mem - 
    7068:	83 c4 08             	add    $0x8,%esp
    706b:	d9 7d b2             	fnstcw -0x4e(%ebp)
    706e:	0f b7 45 b2          	movzwl -0x4e(%ebp),%eax
    7072:	b4 0c                	mov    $0xc,%ah
    7074:	66 89 45 b0          	mov    %ax,-0x50(%ebp)
    7078:	d9 6d b0             	fldcw  -0x50(%ebp)
    707b:	db 5d ac             	fistpl -0x54(%ebp)
    707e:	d9 6d b2             	fldcw  -0x4e(%ebp)
    7081:	8b 45 ac             	mov    -0x54(%ebp),%eax
    7084:	50                   	push   %eax
    7085:	56                   	push   %esi
    7086:	e8 bf 47 00 00       	call   b84a <itoa>
              (kernel_total_mem * memory_reservations[i]) + PGSIZE + 1);
      
      // Try to protect memory for cgroup1 this need to fail
      ASSERT_FALSE(write_file(TEST_1_MEM_MIN, buf));
    708b:	83 c4 08             	add    $0x8,%esp
    708e:	56                   	push   %esi
    708f:	68 39 c2 00 00       	push   $0xc239
    7094:	e8 b5 91 ff ff       	call   24e <write_file>
    7099:	83 c4 10             	add    $0x10,%esp
    709c:	85 c0                	test   %eax,%eax
    709e:	74 72                	je     7112 <test_release_protected_memory_after_delete_cgroup+0x444>
    70a0:	eb 17                	jmp    70b9 <test_release_protected_memory_after_delete_cgroup+0x3eb>
    70a2:	83 ec 08             	sub    $0x8,%esp
    70a5:	68 3c bf 00 00       	push   $0xbf3c
    70aa:	6a 01                	push   $0x1
    70ac:	e8 b6 4a 00 00       	call   bb67 <printf>
    70b1:	83 c3 01             	add    $0x1,%ebx
    70b4:	83 c4 10             	add    $0x10,%esp
    70b7:	eb 05                	jmp    70be <test_release_protected_memory_after_delete_cgroup+0x3f0>
    70b9:	bb 00 00 00 00       	mov    $0x0,%ebx
    70be:	83 ec 0c             	sub    $0xc,%esp
    70c1:	68 88 fc 00 00       	push   $0xfc88
    70c6:	e8 38 46 00 00       	call   b703 <strlen>
    70cb:	89 c6                	mov    %eax,%esi
    70cd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    70d4:	e8 2a 46 00 00       	call   b703 <strlen>
    70d9:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    70dd:	83 c4 10             	add    $0x10,%esp
    70e0:	39 d8                	cmp    %ebx,%eax
    70e2:	77 be                	ja     70a2 <test_release_protected_memory_after_delete_cgroup+0x3d4>
    70e4:	83 ec 0c             	sub    $0xc,%esp
    70e7:	68 3e 04 00 00       	push   $0x43e
    70ec:	68 f9 bf 00 00       	push   $0xbff9
    70f1:	ff 75 08             	pushl  0x8(%ebp)
    70f4:	68 6c 03 01 00       	push   $0x1036c
    70f9:	6a 01                	push   $0x1
    70fb:	e8 67 4a 00 00       	call   bb67 <printf>
    7100:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7107:	00 00 00 
    710a:	83 c4 20             	add    $0x20,%esp
    710d:	e9 9c 01 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>

      ASSERT_FALSE(unlink(TEST_TMP));
    7112:	83 ec 0c             	sub    $0xc,%esp
    7115:	68 d7 c5 00 00       	push   $0xc5d7
    711a:	e8 a7 48 00 00       	call   b9c6 <unlink>
    711f:	83 c4 10             	add    $0x10,%esp
    7122:	85 c0                	test   %eax,%eax
    7124:	74 72                	je     7198 <test_release_protected_memory_after_delete_cgroup+0x4ca>
    7126:	eb 17                	jmp    713f <test_release_protected_memory_after_delete_cgroup+0x471>
    7128:	83 ec 08             	sub    $0x8,%esp
    712b:	68 3c bf 00 00       	push   $0xbf3c
    7130:	6a 01                	push   $0x1
    7132:	e8 30 4a 00 00       	call   bb67 <printf>
    7137:	83 c3 01             	add    $0x1,%ebx
    713a:	83 c4 10             	add    $0x10,%esp
    713d:	eb 05                	jmp    7144 <test_release_protected_memory_after_delete_cgroup+0x476>
    713f:	bb 00 00 00 00       	mov    $0x0,%ebx
    7144:	83 ec 0c             	sub    $0xc,%esp
    7147:	68 12 c6 00 00       	push   $0xc612
    714c:	e8 b2 45 00 00       	call   b703 <strlen>
    7151:	89 c6                	mov    %eax,%esi
    7153:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    715a:	e8 a4 45 00 00       	call   b703 <strlen>
    715f:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    7163:	83 c4 10             	add    $0x10,%esp
    7166:	39 d8                	cmp    %ebx,%eax
    7168:	77 be                	ja     7128 <test_release_protected_memory_after_delete_cgroup+0x45a>
    716a:	83 ec 0c             	sub    $0xc,%esp
    716d:	68 40 04 00 00       	push   $0x440
    7172:	68 f9 bf 00 00       	push   $0xbff9
    7177:	ff 75 08             	pushl  0x8(%ebp)
    717a:	68 b8 03 01 00       	push   $0x103b8
    717f:	6a 01                	push   $0x1
    7181:	e8 e1 49 00 00       	call   bb67 <printf>
    7186:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    718d:	00 00 00 
    7190:	83 c4 20             	add    $0x20,%esp
    7193:	e9 16 01 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>
      // Try to protect memory for cgroup1
      ASSERT_TRUE(write_file(TEST_1_MEM_MIN, buf));
    7198:	83 ec 08             	sub    $0x8,%esp
    719b:	8d 45 dc             	lea    -0x24(%ebp),%eax
    719e:	50                   	push   %eax
    719f:	68 39 c2 00 00       	push   $0xc239
    71a4:	e8 a5 90 ff ff       	call   24e <write_file>
    71a9:	83 c4 10             	add    $0x10,%esp
    71ac:	85 c0                	test   %eax,%eax
    71ae:	75 72                	jne    7222 <test_release_protected_memory_after_delete_cgroup+0x554>
    71b0:	eb 17                	jmp    71c9 <test_release_protected_memory_after_delete_cgroup+0x4fb>
    71b2:	83 ec 08             	sub    $0x8,%esp
    71b5:	68 3c bf 00 00       	push   $0xbf3c
    71ba:	6a 01                	push   $0x1
    71bc:	e8 a6 49 00 00       	call   bb67 <printf>
    71c1:	83 c3 01             	add    $0x1,%ebx
    71c4:	83 c4 10             	add    $0x10,%esp
    71c7:	eb 05                	jmp    71ce <test_release_protected_memory_after_delete_cgroup+0x500>
    71c9:	bb 00 00 00 00       	mov    $0x0,%ebx
    71ce:	83 ec 0c             	sub    $0xc,%esp
    71d1:	68 88 fc 00 00       	push   $0xfc88
    71d6:	e8 28 45 00 00       	call   b703 <strlen>
    71db:	89 c6                	mov    %eax,%esi
    71dd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    71e4:	e8 1a 45 00 00       	call   b703 <strlen>
    71e9:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    71ed:	83 c4 10             	add    $0x10,%esp
    71f0:	39 d8                	cmp    %ebx,%eax
    71f2:	77 be                	ja     71b2 <test_release_protected_memory_after_delete_cgroup+0x4e4>
    71f4:	83 ec 0c             	sub    $0xc,%esp
    71f7:	68 42 04 00 00       	push   $0x442
    71fc:	68 f9 bf 00 00       	push   $0xbff9
    7201:	ff 75 08             	pushl  0x8(%ebp)
    7204:	68 a8 fc 00 00       	push   $0xfca8
    7209:	6a 01                	push   $0x1
    720b:	e8 57 49 00 00       	call   bb67 <printf>
    7210:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7217:	00 00 00 
    721a:	83 c4 20             	add    $0x20,%esp
    721d:	e9 8c 00 00 00       	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>

      // Disable memory controllers
      ASSERT_TRUE(disable_controller(MEM_CNT));
    7222:	83 ec 0c             	sub    $0xc,%esp
    7225:	6a 03                	push   $0x3
    7227:	e8 89 91 ff ff       	call   3b5 <disable_controller>
    722c:	83 c4 10             	add    $0x10,%esp
    722f:	85 c0                	test   %eax,%eax
    7231:	75 6f                	jne    72a2 <test_release_protected_memory_after_delete_cgroup+0x5d4>
    7233:	eb 17                	jmp    724c <test_release_protected_memory_after_delete_cgroup+0x57e>
    7235:	83 ec 08             	sub    $0x8,%esp
    7238:	68 3c bf 00 00       	push   $0xbf3c
    723d:	6a 01                	push   $0x1
    723f:	e8 23 49 00 00       	call   bb67 <printf>
    7244:	83 c3 01             	add    $0x1,%ebx
    7247:	83 c4 10             	add    $0x10,%esp
    724a:	eb 05                	jmp    7251 <test_release_protected_memory_after_delete_cgroup+0x583>
    724c:	bb 00 00 00 00       	mov    $0x0,%ebx
    7251:	83 ec 0c             	sub    $0xc,%esp
    7254:	68 91 c5 00 00       	push   $0xc591
    7259:	e8 a5 44 00 00       	call   b703 <strlen>
    725e:	89 c6                	mov    %eax,%esi
    7260:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7267:	e8 97 44 00 00       	call   b703 <strlen>
    726c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    7270:	83 c4 10             	add    $0x10,%esp
    7273:	39 d8                	cmp    %ebx,%eax
    7275:	77 be                	ja     7235 <test_release_protected_memory_after_delete_cgroup+0x567>
    7277:	83 ec 0c             	sub    $0xc,%esp
    727a:	68 45 04 00 00       	push   $0x445
    727f:	68 f9 bf 00 00       	push   $0xbff9
    7284:	ff 75 08             	pushl  0x8(%ebp)
    7287:	68 90 f8 00 00       	push   $0xf890
    728c:	6a 01                	push   $0x1
    728e:	e8 d4 48 00 00       	call   bb67 <printf>
    7293:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    729a:	00 00 00 
    729d:	83 c4 20             	add    $0x20,%esp
    72a0:	eb 0c                	jmp    72ae <test_release_protected_memory_after_delete_cgroup+0x5e0>
    uint kernel_total_mem = 0;
    //We want to reserve different amounts of memory (by precantage)
    float memory_reservations[] = {1.0, 0.75, 0.5, 0.25, 0.1, 0.05, 0.01};

    // Create temp cgroup and enable memory controllers
    for(i = 0; i < sizeof(memory_reservations) / sizeof(float); i++)
    72a2:	83 c3 01             	add    $0x1,%ebx
    72a5:	83 fb 06             	cmp    $0x6,%ebx
    72a8:	0f 86 79 fa ff ff    	jbe    6d27 <test_release_protected_memory_after_delete_cgroup+0x59>

      // Disable memory controllers
      ASSERT_TRUE(disable_controller(MEM_CNT));
    }

}
    72ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
    72b1:	5b                   	pop    %ebx
    72b2:	5e                   	pop    %esi
    72b3:	5f                   	pop    %edi
    72b4:	5d                   	pop    %ebp
    72b5:	c3                   	ret    

000072b6 <test_cant_move_under_mem_limit>:

TEST(test_cant_move_under_mem_limit)
{
    72b6:	55                   	push   %ebp
    72b7:	89 e5                	mov    %esp,%ebp
    72b9:	57                   	push   %edi
    72ba:	56                   	push   %esi
    72bb:	53                   	push   %ebx
    72bc:	83 ec 24             	sub    $0x24,%esp
    72bf:	8b 75 08             	mov    0x8(%ebp),%esi
    // Attempt to transfer a process that has allocated MEM_SIZE bytes from one cgroup to another.
    // The attempt should fail since there is no enough memory to protect for the source cgroup.
    char buf [12];
    itoa(buf, MEM_SIZE);
    72c2:	68 00 00 c0 0d       	push   $0xdc00000
    72c7:	8d 45 dc             	lea    -0x24(%ebp),%eax
    72ca:	50                   	push   %eax
    72cb:	e8 7a 45 00 00       	call   b84a <itoa>

    // Enable memory controllers
    ASSERT_TRUE(enable_controller(MEM_CNT));
    72d0:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    72d7:	e8 84 90 ff ff       	call   360 <enable_controller>
    72dc:	83 c4 10             	add    $0x10,%esp
    72df:	85 c0                	test   %eax,%eax
    72e1:	74 19                	je     72fc <test_cant_move_under_mem_limit+0x46>
    72e3:	eb 6e                	jmp    7353 <test_cant_move_under_mem_limit+0x9d>
    72e5:	83 ec 08             	sub    $0x8,%esp
    72e8:	68 3c bf 00 00       	push   $0xbf3c
    72ed:	6a 01                	push   $0x1
    72ef:	e8 73 48 00 00       	call   bb67 <printf>
    72f4:	83 c3 01             	add    $0x1,%ebx
    72f7:	83 c4 10             	add    $0x10,%esp
    72fa:	eb 05                	jmp    7301 <test_cant_move_under_mem_limit+0x4b>
    72fc:	bb 00 00 00 00       	mov    $0x0,%ebx
    7301:	83 ec 0c             	sub    $0xc,%esp
    7304:	68 5f c5 00 00       	push   $0xc55f
    7309:	e8 f5 43 00 00       	call   b703 <strlen>
    730e:	89 c7                	mov    %eax,%edi
    7310:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7317:	e8 e7 43 00 00       	call   b703 <strlen>
    731c:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7320:	83 c4 10             	add    $0x10,%esp
    7323:	39 d8                	cmp    %ebx,%eax
    7325:	77 be                	ja     72e5 <test_cant_move_under_mem_limit+0x2f>
    7327:	83 ec 0c             	sub    $0xc,%esp
    732a:	68 52 04 00 00       	push   $0x452
    732f:	68 f9 bf 00 00       	push   $0xbff9
    7334:	56                   	push   %esi
    7335:	68 54 f5 00 00       	push   $0xf554
    733a:	6a 01                	push   $0x1
    733c:	e8 26 48 00 00       	call   bb67 <printf>
    7341:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7348:	00 00 00 
    734b:	83 c4 20             	add    $0x20,%esp
    734e:	e9 4e 04 00 00       	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>

    // Protect all memory for cgroup1
    ASSERT_TRUE(write_file(TEST_1_MEM_MIN, buf));
    7353:	83 ec 08             	sub    $0x8,%esp
    7356:	8d 45 dc             	lea    -0x24(%ebp),%eax
    7359:	50                   	push   %eax
    735a:	68 39 c2 00 00       	push   $0xc239
    735f:	e8 ea 8e ff ff       	call   24e <write_file>
    7364:	83 c4 10             	add    $0x10,%esp
    7367:	85 c0                	test   %eax,%eax
    7369:	74 19                	je     7384 <test_cant_move_under_mem_limit+0xce>
    736b:	eb 6e                	jmp    73db <test_cant_move_under_mem_limit+0x125>
    736d:	83 ec 08             	sub    $0x8,%esp
    7370:	68 3c bf 00 00       	push   $0xbf3c
    7375:	6a 01                	push   $0x1
    7377:	e8 eb 47 00 00       	call   bb67 <printf>
    737c:	83 c3 01             	add    $0x1,%ebx
    737f:	83 c4 10             	add    $0x10,%esp
    7382:	eb 05                	jmp    7389 <test_cant_move_under_mem_limit+0xd3>
    7384:	bb 00 00 00 00       	mov    $0x0,%ebx
    7389:	83 ec 0c             	sub    $0xc,%esp
    738c:	68 88 fc 00 00       	push   $0xfc88
    7391:	e8 6d 43 00 00       	call   b703 <strlen>
    7396:	89 c7                	mov    %eax,%edi
    7398:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    739f:	e8 5f 43 00 00       	call   b703 <strlen>
    73a4:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    73a8:	83 c4 10             	add    $0x10,%esp
    73ab:	39 d8                	cmp    %ebx,%eax
    73ad:	77 be                	ja     736d <test_cant_move_under_mem_limit+0xb7>
    73af:	83 ec 0c             	sub    $0xc,%esp
    73b2:	68 55 04 00 00       	push   $0x455
    73b7:	68 f9 bf 00 00       	push   $0xbff9
    73bc:	56                   	push   %esi
    73bd:	68 a8 fc 00 00       	push   $0xfca8
    73c2:	6a 01                	push   $0x1
    73c4:	e8 9e 47 00 00       	call   bb67 <printf>
    73c9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    73d0:	00 00 00 
    73d3:	83 c4 20             	add    $0x20,%esp
    73d6:	e9 c6 03 00 00       	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>

    // Check changes
    ASSERT_FALSE(strncmp(read_file(TEST_1_MEM_MIN, 0), buf, strlen(buf)));
    73db:	83 ec 0c             	sub    $0xc,%esp
    73de:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    73e1:	53                   	push   %ebx
    73e2:	e8 1c 43 00 00       	call   b703 <strlen>
    73e7:	89 c7                	mov    %eax,%edi
    73e9:	83 c4 08             	add    $0x8,%esp
    73ec:	6a 00                	push   $0x0
    73ee:	68 39 c2 00 00       	push   $0xc239
    73f3:	e8 a4 8d ff ff       	call   19c <read_file>
    73f8:	83 c4 0c             	add    $0xc,%esp
    73fb:	57                   	push   %edi
    73fc:	53                   	push   %ebx
    73fd:	50                   	push   %eax
    73fe:	e8 d0 42 00 00       	call   b6d3 <strncmp>
    7403:	83 c4 10             	add    $0x10,%esp
    7406:	85 c0                	test   %eax,%eax
    7408:	75 19                	jne    7423 <test_cant_move_under_mem_limit+0x16d>
    740a:	eb 6e                	jmp    747a <test_cant_move_under_mem_limit+0x1c4>
    740c:	83 ec 08             	sub    $0x8,%esp
    740f:	68 3c bf 00 00       	push   $0xbf3c
    7414:	6a 01                	push   $0x1
    7416:	e8 4c 47 00 00       	call   bb67 <printf>
    741b:	83 c3 01             	add    $0x1,%ebx
    741e:	83 c4 10             	add    $0x10,%esp
    7421:	eb 05                	jmp    7428 <test_cant_move_under_mem_limit+0x172>
    7423:	bb 00 00 00 00       	mov    $0x0,%ebx
    7428:	83 ec 0c             	sub    $0xc,%esp
    742b:	68 f4 fc 00 00       	push   $0xfcf4
    7430:	e8 ce 42 00 00       	call   b703 <strlen>
    7435:	89 c7                	mov    %eax,%edi
    7437:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    743e:	e8 c0 42 00 00       	call   b703 <strlen>
    7443:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7447:	83 c4 10             	add    $0x10,%esp
    744a:	39 d8                	cmp    %ebx,%eax
    744c:	77 be                	ja     740c <test_cant_move_under_mem_limit+0x156>
    744e:	83 ec 0c             	sub    $0xc,%esp
    7451:	68 58 04 00 00       	push   $0x458
    7456:	68 f9 bf 00 00       	push   $0xbff9
    745b:	56                   	push   %esi
    745c:	68 2c fd 00 00       	push   $0xfd2c
    7461:	6a 01                	push   $0x1
    7463:	e8 ff 46 00 00       	call   bb67 <printf>
    7468:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    746f:	00 00 00 
    7472:	83 c4 20             	add    $0x20,%esp
    7475:	e9 27 03 00 00       	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>

    ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    747a:	e8 77 45 00 00       	call   b9f6 <getpid>
    747f:	83 ec 08             	sub    $0x8,%esp
    7482:	50                   	push   %eax
    7483:	68 06 c1 00 00       	push   $0xc106
    7488:	e8 aa 90 ff ff       	call   537 <move_proc>
    748d:	83 c4 10             	add    $0x10,%esp
    7490:	85 c0                	test   %eax,%eax
    7492:	74 19                	je     74ad <test_cant_move_under_mem_limit+0x1f7>
    7494:	eb 6e                	jmp    7504 <test_cant_move_under_mem_limit+0x24e>
    7496:	83 ec 08             	sub    $0x8,%esp
    7499:	68 3c bf 00 00       	push   $0xbf3c
    749e:	6a 01                	push   $0x1
    74a0:	e8 c2 46 00 00       	call   bb67 <printf>
    74a5:	83 c3 01             	add    $0x1,%ebx
    74a8:	83 c4 10             	add    $0x10,%esp
    74ab:	eb 05                	jmp    74b2 <test_cant_move_under_mem_limit+0x1fc>
    74ad:	bb 00 00 00 00       	mov    $0x0,%ebx
    74b2:	83 ec 0c             	sub    $0xc,%esp
    74b5:	68 90 e3 00 00       	push   $0xe390
    74ba:	e8 44 42 00 00       	call   b703 <strlen>
    74bf:	89 c7                	mov    %eax,%edi
    74c1:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    74c8:	e8 36 42 00 00       	call   b703 <strlen>
    74cd:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    74d1:	83 c4 10             	add    $0x10,%esp
    74d4:	39 d8                	cmp    %ebx,%eax
    74d6:	77 be                	ja     7496 <test_cant_move_under_mem_limit+0x1e0>
    74d8:	83 ec 0c             	sub    $0xc,%esp
    74db:	68 5a 04 00 00       	push   $0x45a
    74e0:	68 f9 bf 00 00       	push   $0xbff9
    74e5:	56                   	push   %esi
    74e6:	68 d4 e5 00 00       	push   $0xe5d4
    74eb:	6a 01                	push   $0x1
    74ed:	e8 75 46 00 00       	call   bb67 <printf>
    74f2:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    74f9:	00 00 00 
    74fc:	83 c4 20             	add    $0x20,%esp
    74ff:	e9 9d 02 00 00       	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>

    // Save current process memory size.
    int proc_mem = getmem();
    7504:	e8 55 45 00 00       	call   ba5e <getmem>
    int grow = MEM_SIZE - proc_mem;
    7509:	bb 00 00 c0 0d       	mov    $0xdc00000,%ebx
    750e:	29 c3                	sub    %eax,%ebx

    ASSERT_FALSE((int)sbrk(grow) == -1);
    7510:	83 ec 0c             	sub    $0xc,%esp
    7513:	53                   	push   %ebx
    7514:	e8 e5 44 00 00       	call   b9fe <sbrk>
    7519:	83 c4 10             	add    $0x10,%esp
    751c:	83 f8 ff             	cmp    $0xffffffff,%eax
    751f:	75 70                	jne    7591 <test_cant_move_under_mem_limit+0x2db>
    7521:	eb 17                	jmp    753a <test_cant_move_under_mem_limit+0x284>
    7523:	83 ec 08             	sub    $0x8,%esp
    7526:	68 3c bf 00 00       	push   $0xbf3c
    752b:	6a 01                	push   $0x1
    752d:	e8 35 46 00 00       	call   bb67 <printf>
    7532:	83 c3 01             	add    $0x1,%ebx
    7535:	83 c4 10             	add    $0x10,%esp
    7538:	eb 05                	jmp    753f <test_cant_move_under_mem_limit+0x289>
    753a:	bb 00 00 00 00       	mov    $0x0,%ebx
    753f:	83 ec 0c             	sub    $0xc,%esp
    7542:	68 23 c6 00 00       	push   $0xc623
    7547:	e8 b7 41 00 00       	call   b703 <strlen>
    754c:	89 c7                	mov    %eax,%edi
    754e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7555:	e8 a9 41 00 00       	call   b703 <strlen>
    755a:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    755e:	83 c4 10             	add    $0x10,%esp
    7561:	39 d8                	cmp    %ebx,%eax
    7563:	77 be                	ja     7523 <test_cant_move_under_mem_limit+0x26d>
    7565:	83 ec 0c             	sub    $0xc,%esp
    7568:	68 60 04 00 00       	push   $0x460
    756d:	68 f9 bf 00 00       	push   $0xbff9
    7572:	56                   	push   %esi
    7573:	68 f4 03 01 00       	push   $0x103f4
    7578:	6a 01                	push   $0x1
    757a:	e8 e8 45 00 00       	call   bb67 <printf>
    757f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7586:	00 00 00 
    7589:	83 c4 20             	add    $0x20,%esp
    758c:	e9 10 02 00 00       	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>

    // Try return the process to root cgroup this heve to faile
    ASSERT_FALSE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    7591:	e8 60 44 00 00       	call   b9f6 <getpid>
    7596:	83 ec 08             	sub    $0x8,%esp
    7599:	50                   	push   %eax
    759a:	68 09 c4 00 00       	push   $0xc409
    759f:	e8 93 8f ff ff       	call   537 <move_proc>
    75a4:	83 c4 10             	add    $0x10,%esp
    75a7:	85 c0                	test   %eax,%eax
    75a9:	75 19                	jne    75c4 <test_cant_move_under_mem_limit+0x30e>
    75ab:	eb 6e                	jmp    761b <test_cant_move_under_mem_limit+0x365>
    75ad:	83 ec 08             	sub    $0x8,%esp
    75b0:	68 3c bf 00 00       	push   $0xbf3c
    75b5:	6a 01                	push   $0x1
    75b7:	e8 ab 45 00 00       	call   bb67 <printf>
    75bc:	83 c3 01             	add    $0x1,%ebx
    75bf:	83 c4 10             	add    $0x10,%esp
    75c2:	eb 05                	jmp    75c9 <test_cant_move_under_mem_limit+0x313>
    75c4:	bb 00 00 00 00       	mov    $0x0,%ebx
    75c9:	83 ec 0c             	sub    $0xc,%esp
    75cc:	68 80 e6 00 00       	push   $0xe680
    75d1:	e8 2d 41 00 00       	call   b703 <strlen>
    75d6:	89 c7                	mov    %eax,%edi
    75d8:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    75df:	e8 1f 41 00 00       	call   b703 <strlen>
    75e4:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    75e8:	83 c4 10             	add    $0x10,%esp
    75eb:	39 d8                	cmp    %ebx,%eax
    75ed:	77 be                	ja     75ad <test_cant_move_under_mem_limit+0x2f7>
    75ef:	83 ec 0c             	sub    $0xc,%esp
    75f2:	68 63 04 00 00       	push   $0x463
    75f7:	68 f9 bf 00 00       	push   $0xbff9
    75fc:	56                   	push   %esi
    75fd:	68 34 04 01 00       	push   $0x10434
    7602:	6a 01                	push   $0x1
    7604:	e8 5e 45 00 00       	call   bb67 <printf>
    7609:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7610:	00 00 00 
    7613:	83 c4 20             	add    $0x20,%esp
    7616:	e9 86 01 00 00       	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>

    ASSERT_FALSE((int)sbrk(-grow) == -1);
    761b:	83 ec 0c             	sub    $0xc,%esp
    761e:	f7 db                	neg    %ebx
    7620:	53                   	push   %ebx
    7621:	e8 d8 43 00 00       	call   b9fe <sbrk>
    7626:	83 c4 10             	add    $0x10,%esp
    7629:	83 f8 ff             	cmp    $0xffffffff,%eax
    762c:	75 70                	jne    769e <test_cant_move_under_mem_limit+0x3e8>
    762e:	eb 17                	jmp    7647 <test_cant_move_under_mem_limit+0x391>
    7630:	83 ec 08             	sub    $0x8,%esp
    7633:	68 3c bf 00 00       	push   $0xbf3c
    7638:	6a 01                	push   $0x1
    763a:	e8 28 45 00 00       	call   bb67 <printf>
    763f:	83 c3 01             	add    $0x1,%ebx
    7642:	83 c4 10             	add    $0x10,%esp
    7645:	eb 05                	jmp    764c <test_cant_move_under_mem_limit+0x396>
    7647:	bb 00 00 00 00       	mov    $0x0,%ebx
    764c:	83 ec 0c             	sub    $0xc,%esp
    764f:	68 39 c6 00 00       	push   $0xc639
    7654:	e8 aa 40 00 00       	call   b703 <strlen>
    7659:	89 c7                	mov    %eax,%edi
    765b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7662:	e8 9c 40 00 00       	call   b703 <strlen>
    7667:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    766b:	83 c4 10             	add    $0x10,%esp
    766e:	39 d8                	cmp    %ebx,%eax
    7670:	77 be                	ja     7630 <test_cant_move_under_mem_limit+0x37a>
    7672:	83 ec 0c             	sub    $0xc,%esp
    7675:	68 65 04 00 00       	push   $0x465
    767a:	68 f9 bf 00 00       	push   $0xbff9
    767f:	56                   	push   %esi
    7680:	68 84 04 01 00       	push   $0x10484
    7685:	6a 01                	push   $0x1
    7687:	e8 db 44 00 00       	call   bb67 <printf>
    768c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7693:	00 00 00 
    7696:	83 c4 20             	add    $0x20,%esp
    7699:	e9 03 01 00 00       	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>
    ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    769e:	e8 53 43 00 00       	call   b9f6 <getpid>
    76a3:	83 ec 08             	sub    $0x8,%esp
    76a6:	50                   	push   %eax
    76a7:	68 09 c4 00 00       	push   $0xc409
    76ac:	e8 86 8e ff ff       	call   537 <move_proc>
    76b1:	83 c4 10             	add    $0x10,%esp
    76b4:	85 c0                	test   %eax,%eax
    76b6:	74 19                	je     76d1 <test_cant_move_under_mem_limit+0x41b>
    76b8:	eb 6b                	jmp    7725 <test_cant_move_under_mem_limit+0x46f>
    76ba:	83 ec 08             	sub    $0x8,%esp
    76bd:	68 3c bf 00 00       	push   $0xbf3c
    76c2:	6a 01                	push   $0x1
    76c4:	e8 9e 44 00 00       	call   bb67 <printf>
    76c9:	83 c3 01             	add    $0x1,%ebx
    76cc:	83 c4 10             	add    $0x10,%esp
    76cf:	eb 05                	jmp    76d6 <test_cant_move_under_mem_limit+0x420>
    76d1:	bb 00 00 00 00       	mov    $0x0,%ebx
    76d6:	83 ec 0c             	sub    $0xc,%esp
    76d9:	68 80 e6 00 00       	push   $0xe680
    76de:	e8 20 40 00 00       	call   b703 <strlen>
    76e3:	89 c7                	mov    %eax,%edi
    76e5:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    76ec:	e8 12 40 00 00       	call   b703 <strlen>
    76f1:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    76f5:	83 c4 10             	add    $0x10,%esp
    76f8:	39 d8                	cmp    %ebx,%eax
    76fa:	77 be                	ja     76ba <test_cant_move_under_mem_limit+0x404>
    76fc:	83 ec 0c             	sub    $0xc,%esp
    76ff:	68 66 04 00 00       	push   $0x466
    7704:	68 f9 bf 00 00       	push   $0xbff9
    7709:	56                   	push   %esi
    770a:	68 a8 e6 00 00       	push   $0xe6a8
    770f:	6a 01                	push   $0x1
    7711:	e8 51 44 00 00       	call   bb67 <printf>
    7716:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    771d:	00 00 00 
    7720:	83 c4 20             	add    $0x20,%esp
    7723:	eb 7c                	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>

    // Disable memory controllers
    ASSERT_TRUE(disable_controller(MEM_CNT));
    7725:	83 ec 0c             	sub    $0xc,%esp
    7728:	6a 03                	push   $0x3
    772a:	e8 86 8c ff ff       	call   3b5 <disable_controller>
    772f:	83 c4 10             	add    $0x10,%esp
    7732:	85 c0                	test   %eax,%eax
    7734:	74 19                	je     774f <test_cant_move_under_mem_limit+0x499>
    7736:	eb 69                	jmp    77a1 <test_cant_move_under_mem_limit+0x4eb>
    7738:	83 ec 08             	sub    $0x8,%esp
    773b:	68 3c bf 00 00       	push   $0xbf3c
    7740:	6a 01                	push   $0x1
    7742:	e8 20 44 00 00       	call   bb67 <printf>
    7747:	83 c3 01             	add    $0x1,%ebx
    774a:	83 c4 10             	add    $0x10,%esp
    774d:	eb 05                	jmp    7754 <test_cant_move_under_mem_limit+0x49e>
    774f:	bb 00 00 00 00       	mov    $0x0,%ebx
    7754:	83 ec 0c             	sub    $0xc,%esp
    7757:	68 91 c5 00 00       	push   $0xc591
    775c:	e8 a2 3f 00 00       	call   b703 <strlen>
    7761:	89 c7                	mov    %eax,%edi
    7763:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    776a:	e8 94 3f 00 00       	call   b703 <strlen>
    776f:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7773:	83 c4 10             	add    $0x10,%esp
    7776:	39 d8                	cmp    %ebx,%eax
    7778:	77 be                	ja     7738 <test_cant_move_under_mem_limit+0x482>
    777a:	83 ec 0c             	sub    $0xc,%esp
    777d:	68 69 04 00 00       	push   $0x469
    7782:	68 f9 bf 00 00       	push   $0xbff9
    7787:	56                   	push   %esi
    7788:	68 90 f8 00 00       	push   $0xf890
    778d:	6a 01                	push   $0x1
    778f:	e8 d3 43 00 00       	call   bb67 <printf>
    7794:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    779b:	00 00 00 
    779e:	83 c4 20             	add    $0x20,%esp
}
    77a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    77a4:	5b                   	pop    %ebx
    77a5:	5e                   	pop    %esi
    77a6:	5f                   	pop    %edi
    77a7:	5d                   	pop    %ebp
    77a8:	c3                   	ret    

000077a9 <test_mem_limit_negative_and_over_kernelbase>:

TEST(test_mem_limit_negative_and_over_kernelbase)
{
    77a9:	55                   	push   %ebp
    77aa:	89 e5                	mov    %esp,%ebp
    77ac:	57                   	push   %edi
    77ad:	56                   	push   %esi
    77ae:	53                   	push   %ebx
    77af:	83 ec 28             	sub    $0x28,%esp
    77b2:	8b 75 08             	mov    0x8(%ebp),%esi
    // Buffer for saving current memory written in limit
    char saved_mem[12];

    // Enable memory controller
    ASSERT_TRUE(enable_controller(MEM_CNT));
    77b5:	6a 03                	push   $0x3
    77b7:	e8 a4 8b ff ff       	call   360 <enable_controller>
    77bc:	83 c4 10             	add    $0x10,%esp
    77bf:	85 c0                	test   %eax,%eax
    77c1:	74 19                	je     77dc <test_mem_limit_negative_and_over_kernelbase+0x33>
    77c3:	eb 6e                	jmp    7833 <test_mem_limit_negative_and_over_kernelbase+0x8a>
    77c5:	83 ec 08             	sub    $0x8,%esp
    77c8:	68 3c bf 00 00       	push   $0xbf3c
    77cd:	6a 01                	push   $0x1
    77cf:	e8 93 43 00 00       	call   bb67 <printf>
    77d4:	83 c3 01             	add    $0x1,%ebx
    77d7:	83 c4 10             	add    $0x10,%esp
    77da:	eb 05                	jmp    77e1 <test_mem_limit_negative_and_over_kernelbase+0x38>
    77dc:	bb 00 00 00 00       	mov    $0x0,%ebx
    77e1:	83 ec 0c             	sub    $0xc,%esp
    77e4:	68 5f c5 00 00       	push   $0xc55f
    77e9:	e8 15 3f 00 00       	call   b703 <strlen>
    77ee:	89 c7                	mov    %eax,%edi
    77f0:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    77f7:	e8 07 3f 00 00       	call   b703 <strlen>
    77fc:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7800:	83 c4 10             	add    $0x10,%esp
    7803:	39 d8                	cmp    %ebx,%eax
    7805:	77 be                	ja     77c5 <test_mem_limit_negative_and_over_kernelbase+0x1c>
    7807:	83 ec 0c             	sub    $0xc,%esp
    780a:	68 72 04 00 00       	push   $0x472
    780f:	68 f9 bf 00 00       	push   $0xbff9
    7814:	56                   	push   %esi
    7815:	68 54 f5 00 00       	push   $0xf554
    781a:	6a 01                	push   $0x1
    781c:	e8 46 43 00 00       	call   bb67 <printf>
    7821:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7828:	00 00 00 
    782b:	83 c4 20             	add    $0x20,%esp
    782e:	e9 50 07 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>

    // Copy the current saved memory-max and remove newline at the end
    strcpy(saved_mem, read_file(TEST_1_MEM_MAX, 0));
    7833:	83 ec 08             	sub    $0x8,%esp
    7836:	6a 00                	push   $0x0
    7838:	68 20 c2 00 00       	push   $0xc220
    783d:	e8 5a 89 ff ff       	call   19c <read_file>
    7842:	83 c4 08             	add    $0x8,%esp
    7845:	50                   	push   %eax
    7846:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    7849:	53                   	push   %ebx
    784a:	e8 40 3e 00 00       	call   b68f <strcpy>
    saved_mem[strlen(saved_mem) - 1] = '\0';
    784f:	89 1c 24             	mov    %ebx,(%esp)
    7852:	e8 ac 3e 00 00       	call   b703 <strlen>
    7857:	c6 44 05 db 00       	movb   $0x0,-0x25(%ebp,%eax,1)

    // Update memory limit
    ASSERT_TRUE(write_file(TEST_1_MEM_MAX, "100"));
    785c:	83 c4 08             	add    $0x8,%esp
    785f:	68 58 c6 00 00       	push   $0xc658
    7864:	68 20 c2 00 00       	push   $0xc220
    7869:	e8 e0 89 ff ff       	call   24e <write_file>
    786e:	83 c4 10             	add    $0x10,%esp
    7871:	85 c0                	test   %eax,%eax
    7873:	74 19                	je     788e <test_mem_limit_negative_and_over_kernelbase+0xe5>
    7875:	eb 6e                	jmp    78e5 <test_mem_limit_negative_and_over_kernelbase+0x13c>
    7877:	83 ec 08             	sub    $0x8,%esp
    787a:	68 3c bf 00 00       	push   $0xbf3c
    787f:	6a 01                	push   $0x1
    7881:	e8 e1 42 00 00       	call   bb67 <printf>
    7886:	83 c3 01             	add    $0x1,%ebx
    7889:	83 c4 10             	add    $0x10,%esp
    788c:	eb 05                	jmp    7893 <test_mem_limit_negative_and_over_kernelbase+0xea>
    788e:	bb 00 00 00 00       	mov    $0x0,%ebx
    7893:	83 ec 0c             	sub    $0xc,%esp
    7896:	68 a0 f6 00 00       	push   $0xf6a0
    789b:	e8 63 3e 00 00       	call   b703 <strlen>
    78a0:	89 c7                	mov    %eax,%edi
    78a2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    78a9:	e8 55 3e 00 00       	call   b703 <strlen>
    78ae:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    78b2:	83 c4 10             	add    $0x10,%esp
    78b5:	39 d8                	cmp    %ebx,%eax
    78b7:	77 be                	ja     7877 <test_mem_limit_negative_and_over_kernelbase+0xce>
    78b9:	83 ec 0c             	sub    $0xc,%esp
    78bc:	68 79 04 00 00       	push   $0x479
    78c1:	68 f9 bf 00 00       	push   $0xbff9
    78c6:	56                   	push   %esi
    78c7:	68 c4 f6 00 00       	push   $0xf6c4
    78cc:	6a 01                	push   $0x1
    78ce:	e8 94 42 00 00       	call   bb67 <printf>
    78d3:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    78da:	00 00 00 
    78dd:	83 c4 20             	add    $0x20,%esp
    78e0:	e9 9e 06 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>
    ASSERT_TRUE(write_file(TEST_1_MEM_MIN, "50"));
    78e5:	83 ec 08             	sub    $0x8,%esp
    78e8:	68 50 c6 00 00       	push   $0xc650
    78ed:	68 39 c2 00 00       	push   $0xc239
    78f2:	e8 57 89 ff ff       	call   24e <write_file>
    78f7:	83 c4 10             	add    $0x10,%esp
    78fa:	85 c0                	test   %eax,%eax
    78fc:	74 19                	je     7917 <test_mem_limit_negative_and_over_kernelbase+0x16e>
    78fe:	eb 6e                	jmp    796e <test_mem_limit_negative_and_over_kernelbase+0x1c5>
    7900:	83 ec 08             	sub    $0x8,%esp
    7903:	68 3c bf 00 00       	push   $0xbf3c
    7908:	6a 01                	push   $0x1
    790a:	e8 58 42 00 00       	call   bb67 <printf>
    790f:	83 c3 01             	add    $0x1,%ebx
    7912:	83 c4 10             	add    $0x10,%esp
    7915:	eb 05                	jmp    791c <test_mem_limit_negative_and_over_kernelbase+0x173>
    7917:	bb 00 00 00 00       	mov    $0x0,%ebx
    791c:	83 ec 0c             	sub    $0xc,%esp
    791f:	68 c4 04 01 00       	push   $0x104c4
    7924:	e8 da 3d 00 00       	call   b703 <strlen>
    7929:	89 c7                	mov    %eax,%edi
    792b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7932:	e8 cc 3d 00 00       	call   b703 <strlen>
    7937:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    793b:	83 c4 10             	add    $0x10,%esp
    793e:	39 d8                	cmp    %ebx,%eax
    7940:	77 be                	ja     7900 <test_mem_limit_negative_and_over_kernelbase+0x157>
    7942:	83 ec 0c             	sub    $0xc,%esp
    7945:	68 7a 04 00 00       	push   $0x47a
    794a:	68 f9 bf 00 00       	push   $0xbff9
    794f:	56                   	push   %esi
    7950:	68 e8 04 01 00       	push   $0x104e8
    7955:	6a 01                	push   $0x1
    7957:	e8 0b 42 00 00       	call   bb67 <printf>
    795c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7963:	00 00 00 
    7966:	83 c4 20             	add    $0x20,%esp
    7969:	e9 15 06 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>

    // Check changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MAX, 0), "100\n"));
    796e:	83 ec 08             	sub    $0x8,%esp
    7971:	6a 00                	push   $0x0
    7973:	68 20 c2 00 00       	push   $0xc220
    7978:	e8 1f 88 ff ff       	call   19c <read_file>
    797d:	83 c4 08             	add    $0x8,%esp
    7980:	68 88 c5 00 00       	push   $0xc588
    7985:	50                   	push   %eax
    7986:	e8 22 3d 00 00       	call   b6ad <strcmp>
    798b:	83 c4 10             	add    $0x10,%esp
    798e:	85 c0                	test   %eax,%eax
    7990:	75 19                	jne    79ab <test_mem_limit_negative_and_over_kernelbase+0x202>
    7992:	eb 6e                	jmp    7a02 <test_mem_limit_negative_and_over_kernelbase+0x259>
    7994:	83 ec 08             	sub    $0x8,%esp
    7997:	68 3c bf 00 00       	push   $0xbf3c
    799c:	6a 01                	push   $0x1
    799e:	e8 c4 41 00 00       	call   bb67 <printf>
    79a3:	83 c3 01             	add    $0x1,%ebx
    79a6:	83 c4 10             	add    $0x10,%esp
    79a9:	eb 05                	jmp    79b0 <test_mem_limit_negative_and_over_kernelbase+0x207>
    79ab:	bb 00 00 00 00       	mov    $0x0,%ebx
    79b0:	83 ec 0c             	sub    $0xc,%esp
    79b3:	68 80 f7 00 00       	push   $0xf780
    79b8:	e8 46 3d 00 00       	call   b703 <strlen>
    79bd:	89 c7                	mov    %eax,%edi
    79bf:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    79c6:	e8 38 3d 00 00       	call   b703 <strlen>
    79cb:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    79cf:	83 c4 10             	add    $0x10,%esp
    79d2:	39 d8                	cmp    %ebx,%eax
    79d4:	77 be                	ja     7994 <test_mem_limit_negative_and_over_kernelbase+0x1eb>
    79d6:	83 ec 0c             	sub    $0xc,%esp
    79d9:	68 7d 04 00 00       	push   $0x47d
    79de:	68 f9 bf 00 00       	push   $0xbff9
    79e3:	56                   	push   %esi
    79e4:	68 b0 f7 00 00       	push   $0xf7b0
    79e9:	6a 01                	push   $0x1
    79eb:	e8 77 41 00 00       	call   bb67 <printf>
    79f0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    79f7:	00 00 00 
    79fa:	83 c4 20             	add    $0x20,%esp
    79fd:	e9 81 05 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MIN, 0), "50\n"));
    7a02:	83 ec 08             	sub    $0x8,%esp
    7a05:	6a 00                	push   $0x0
    7a07:	68 39 c2 00 00       	push   $0xc239
    7a0c:	e8 8b 87 ff ff       	call   19c <read_file>
    7a11:	83 c4 08             	add    $0x8,%esp
    7a14:	68 53 c6 00 00       	push   $0xc653
    7a19:	50                   	push   %eax
    7a1a:	e8 8e 3c 00 00       	call   b6ad <strcmp>
    7a1f:	83 c4 10             	add    $0x10,%esp
    7a22:	85 c0                	test   %eax,%eax
    7a24:	75 19                	jne    7a3f <test_mem_limit_negative_and_over_kernelbase+0x296>
    7a26:	eb 6e                	jmp    7a96 <test_mem_limit_negative_and_over_kernelbase+0x2ed>
    7a28:	83 ec 08             	sub    $0x8,%esp
    7a2b:	68 3c bf 00 00       	push   $0xbf3c
    7a30:	6a 01                	push   $0x1
    7a32:	e8 30 41 00 00       	call   bb67 <printf>
    7a37:	83 c3 01             	add    $0x1,%ebx
    7a3a:	83 c4 10             	add    $0x10,%esp
    7a3d:	eb 05                	jmp    7a44 <test_mem_limit_negative_and_over_kernelbase+0x29b>
    7a3f:	bb 00 00 00 00       	mov    $0x0,%ebx
    7a44:	83 ec 0c             	sub    $0xc,%esp
    7a47:	68 34 05 01 00       	push   $0x10534
    7a4c:	e8 b2 3c 00 00       	call   b703 <strlen>
    7a51:	89 c7                	mov    %eax,%edi
    7a53:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7a5a:	e8 a4 3c 00 00       	call   b703 <strlen>
    7a5f:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7a63:	83 c4 10             	add    $0x10,%esp
    7a66:	39 d8                	cmp    %ebx,%eax
    7a68:	77 be                	ja     7a28 <test_mem_limit_negative_and_over_kernelbase+0x27f>
    7a6a:	83 ec 0c             	sub    $0xc,%esp
    7a6d:	68 7e 04 00 00       	push   $0x47e
    7a72:	68 f9 bf 00 00       	push   $0xbff9
    7a77:	56                   	push   %esi
    7a78:	68 64 05 01 00       	push   $0x10564
    7a7d:	6a 01                	push   $0x1
    7a7f:	e8 e3 40 00 00       	call   bb67 <printf>
    7a84:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7a8b:	00 00 00 
    7a8e:	83 c4 20             	add    $0x20,%esp
    7a91:	e9 ed 04 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>

    // Limit memory by minus
    ASSERT_FALSE(write_file(TEST_1_MEM_MAX, "-100"));
    7a96:	83 ec 08             	sub    $0x8,%esp
    7a99:	68 57 c6 00 00       	push   $0xc657
    7a9e:	68 20 c2 00 00       	push   $0xc220
    7aa3:	e8 a6 87 ff ff       	call   24e <write_file>
    7aa8:	83 c4 10             	add    $0x10,%esp
    7aab:	85 c0                	test   %eax,%eax
    7aad:	75 19                	jne    7ac8 <test_mem_limit_negative_and_over_kernelbase+0x31f>
    7aaf:	eb 6e                	jmp    7b1f <test_mem_limit_negative_and_over_kernelbase+0x376>
    7ab1:	83 ec 08             	sub    $0x8,%esp
    7ab4:	68 3c bf 00 00       	push   $0xbf3c
    7ab9:	6a 01                	push   $0x1
    7abb:	e8 a7 40 00 00       	call   bb67 <printf>
    7ac0:	83 c3 01             	add    $0x1,%ebx
    7ac3:	83 c4 10             	add    $0x10,%esp
    7ac6:	eb 05                	jmp    7acd <test_mem_limit_negative_and_over_kernelbase+0x324>
    7ac8:	bb 00 00 00 00       	mov    $0x0,%ebx
    7acd:	83 ec 0c             	sub    $0xc,%esp
    7ad0:	68 bc 05 01 00       	push   $0x105bc
    7ad5:	e8 29 3c 00 00       	call   b703 <strlen>
    7ada:	89 c7                	mov    %eax,%edi
    7adc:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7ae3:	e8 1b 3c 00 00       	call   b703 <strlen>
    7ae8:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7aec:	83 c4 10             	add    $0x10,%esp
    7aef:	39 d8                	cmp    %ebx,%eax
    7af1:	77 be                	ja     7ab1 <test_mem_limit_negative_and_over_kernelbase+0x308>
    7af3:	83 ec 0c             	sub    $0xc,%esp
    7af6:	68 81 04 00 00       	push   $0x481
    7afb:	68 f9 bf 00 00       	push   $0xbff9
    7b00:	56                   	push   %esi
    7b01:	68 e0 05 01 00       	push   $0x105e0
    7b06:	6a 01                	push   $0x1
    7b08:	e8 5a 40 00 00       	call   bb67 <printf>
    7b0d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7b14:	00 00 00 
    7b17:	83 c4 20             	add    $0x20,%esp
    7b1a:	e9 64 04 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>
    ASSERT_FALSE(write_file(TEST_1_MEM_MIN, "-100"));
    7b1f:	83 ec 08             	sub    $0x8,%esp
    7b22:	68 57 c6 00 00       	push   $0xc657
    7b27:	68 39 c2 00 00       	push   $0xc239
    7b2c:	e8 1d 87 ff ff       	call   24e <write_file>
    7b31:	83 c4 10             	add    $0x10,%esp
    7b34:	85 c0                	test   %eax,%eax
    7b36:	75 19                	jne    7b51 <test_mem_limit_negative_and_over_kernelbase+0x3a8>
    7b38:	eb 6e                	jmp    7ba8 <test_mem_limit_negative_and_over_kernelbase+0x3ff>
    7b3a:	83 ec 08             	sub    $0x8,%esp
    7b3d:	68 3c bf 00 00       	push   $0xbf3c
    7b42:	6a 01                	push   $0x1
    7b44:	e8 1e 40 00 00       	call   bb67 <printf>
    7b49:	83 c3 01             	add    $0x1,%ebx
    7b4c:	83 c4 10             	add    $0x10,%esp
    7b4f:	eb 05                	jmp    7b56 <test_mem_limit_negative_and_over_kernelbase+0x3ad>
    7b51:	bb 00 00 00 00       	mov    $0x0,%ebx
    7b56:	83 ec 0c             	sub    $0xc,%esp
    7b59:	68 2c 06 01 00       	push   $0x1062c
    7b5e:	e8 a0 3b 00 00       	call   b703 <strlen>
    7b63:	89 c7                	mov    %eax,%edi
    7b65:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7b6c:	e8 92 3b 00 00       	call   b703 <strlen>
    7b71:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7b75:	83 c4 10             	add    $0x10,%esp
    7b78:	39 d8                	cmp    %ebx,%eax
    7b7a:	77 be                	ja     7b3a <test_mem_limit_negative_and_over_kernelbase+0x391>
    7b7c:	83 ec 0c             	sub    $0xc,%esp
    7b7f:	68 82 04 00 00       	push   $0x482
    7b84:	68 f9 bf 00 00       	push   $0xbff9
    7b89:	56                   	push   %esi
    7b8a:	68 50 06 01 00       	push   $0x10650
    7b8f:	6a 01                	push   $0x1
    7b91:	e8 d1 3f 00 00       	call   bb67 <printf>
    7b96:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7b9d:	00 00 00 
    7ba0:	83 c4 20             	add    $0x20,%esp
    7ba3:	e9 db 03 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>

    // Check for no changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MAX, 0), "100\n"));
    7ba8:	83 ec 08             	sub    $0x8,%esp
    7bab:	6a 00                	push   $0x0
    7bad:	68 20 c2 00 00       	push   $0xc220
    7bb2:	e8 e5 85 ff ff       	call   19c <read_file>
    7bb7:	83 c4 08             	add    $0x8,%esp
    7bba:	68 88 c5 00 00       	push   $0xc588
    7bbf:	50                   	push   %eax
    7bc0:	e8 e8 3a 00 00       	call   b6ad <strcmp>
    7bc5:	83 c4 10             	add    $0x10,%esp
    7bc8:	85 c0                	test   %eax,%eax
    7bca:	75 19                	jne    7be5 <test_mem_limit_negative_and_over_kernelbase+0x43c>
    7bcc:	eb 6e                	jmp    7c3c <test_mem_limit_negative_and_over_kernelbase+0x493>
    7bce:	83 ec 08             	sub    $0x8,%esp
    7bd1:	68 3c bf 00 00       	push   $0xbf3c
    7bd6:	6a 01                	push   $0x1
    7bd8:	e8 8a 3f 00 00       	call   bb67 <printf>
    7bdd:	83 c3 01             	add    $0x1,%ebx
    7be0:	83 c4 10             	add    $0x10,%esp
    7be3:	eb 05                	jmp    7bea <test_mem_limit_negative_and_over_kernelbase+0x441>
    7be5:	bb 00 00 00 00       	mov    $0x0,%ebx
    7bea:	83 ec 0c             	sub    $0xc,%esp
    7bed:	68 80 f7 00 00       	push   $0xf780
    7bf2:	e8 0c 3b 00 00       	call   b703 <strlen>
    7bf7:	89 c7                	mov    %eax,%edi
    7bf9:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7c00:	e8 fe 3a 00 00       	call   b703 <strlen>
    7c05:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7c09:	83 c4 10             	add    $0x10,%esp
    7c0c:	39 d8                	cmp    %ebx,%eax
    7c0e:	77 be                	ja     7bce <test_mem_limit_negative_and_over_kernelbase+0x425>
    7c10:	83 ec 0c             	sub    $0xc,%esp
    7c13:	68 85 04 00 00       	push   $0x485
    7c18:	68 f9 bf 00 00       	push   $0xbff9
    7c1d:	56                   	push   %esi
    7c1e:	68 b0 f7 00 00       	push   $0xf7b0
    7c23:	6a 01                	push   $0x1
    7c25:	e8 3d 3f 00 00       	call   bb67 <printf>
    7c2a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7c31:	00 00 00 
    7c34:	83 c4 20             	add    $0x20,%esp
    7c37:	e9 47 03 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MIN, 0), "50\n"));
    7c3c:	83 ec 08             	sub    $0x8,%esp
    7c3f:	6a 00                	push   $0x0
    7c41:	68 39 c2 00 00       	push   $0xc239
    7c46:	e8 51 85 ff ff       	call   19c <read_file>
    7c4b:	83 c4 08             	add    $0x8,%esp
    7c4e:	68 53 c6 00 00       	push   $0xc653
    7c53:	50                   	push   %eax
    7c54:	e8 54 3a 00 00       	call   b6ad <strcmp>
    7c59:	83 c4 10             	add    $0x10,%esp
    7c5c:	85 c0                	test   %eax,%eax
    7c5e:	75 19                	jne    7c79 <test_mem_limit_negative_and_over_kernelbase+0x4d0>
    7c60:	eb 6e                	jmp    7cd0 <test_mem_limit_negative_and_over_kernelbase+0x527>
    7c62:	83 ec 08             	sub    $0x8,%esp
    7c65:	68 3c bf 00 00       	push   $0xbf3c
    7c6a:	6a 01                	push   $0x1
    7c6c:	e8 f6 3e 00 00       	call   bb67 <printf>
    7c71:	83 c3 01             	add    $0x1,%ebx
    7c74:	83 c4 10             	add    $0x10,%esp
    7c77:	eb 05                	jmp    7c7e <test_mem_limit_negative_and_over_kernelbase+0x4d5>
    7c79:	bb 00 00 00 00       	mov    $0x0,%ebx
    7c7e:	83 ec 0c             	sub    $0xc,%esp
    7c81:	68 34 05 01 00       	push   $0x10534
    7c86:	e8 78 3a 00 00       	call   b703 <strlen>
    7c8b:	89 c7                	mov    %eax,%edi
    7c8d:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7c94:	e8 6a 3a 00 00       	call   b703 <strlen>
    7c99:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7c9d:	83 c4 10             	add    $0x10,%esp
    7ca0:	39 d8                	cmp    %ebx,%eax
    7ca2:	77 be                	ja     7c62 <test_mem_limit_negative_and_over_kernelbase+0x4b9>
    7ca4:	83 ec 0c             	sub    $0xc,%esp
    7ca7:	68 86 04 00 00       	push   $0x486
    7cac:	68 f9 bf 00 00       	push   $0xbff9
    7cb1:	56                   	push   %esi
    7cb2:	68 64 05 01 00       	push   $0x10564
    7cb7:	6a 01                	push   $0x1
    7cb9:	e8 a9 3e 00 00       	call   bb67 <printf>
    7cbe:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7cc5:	00 00 00 
    7cc8:	83 c4 20             	add    $0x20,%esp
    7ccb:	e9 b3 02 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>


    // Limit memory by over kernel base
    ASSERT_FALSE(write_file(TEST_1_MEM_MAX, MORE_THEN_KERNBASE));
    7cd0:	83 ec 08             	sub    $0x8,%esp
    7cd3:	68 5c c6 00 00       	push   $0xc65c
    7cd8:	68 20 c2 00 00       	push   $0xc220
    7cdd:	e8 6c 85 ff ff       	call   24e <write_file>
    7ce2:	83 c4 10             	add    $0x10,%esp
    7ce5:	85 c0                	test   %eax,%eax
    7ce7:	75 19                	jne    7d02 <test_mem_limit_negative_and_over_kernelbase+0x559>
    7ce9:	eb 6e                	jmp    7d59 <test_mem_limit_negative_and_over_kernelbase+0x5b0>
    7ceb:	83 ec 08             	sub    $0x8,%esp
    7cee:	68 3c bf 00 00       	push   $0xbf3c
    7cf3:	6a 01                	push   $0x1
    7cf5:	e8 6d 3e 00 00       	call   bb67 <printf>
    7cfa:	83 c3 01             	add    $0x1,%ebx
    7cfd:	83 c4 10             	add    $0x10,%esp
    7d00:	eb 05                	jmp    7d07 <test_mem_limit_negative_and_over_kernelbase+0x55e>
    7d02:	bb 00 00 00 00       	mov    $0x0,%ebx
    7d07:	83 ec 0c             	sub    $0xc,%esp
    7d0a:	68 9c 06 01 00       	push   $0x1069c
    7d0f:	e8 ef 39 00 00       	call   b703 <strlen>
    7d14:	89 c7                	mov    %eax,%edi
    7d16:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7d1d:	e8 e1 39 00 00       	call   b703 <strlen>
    7d22:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7d26:	83 c4 10             	add    $0x10,%esp
    7d29:	39 d8                	cmp    %ebx,%eax
    7d2b:	77 be                	ja     7ceb <test_mem_limit_negative_and_over_kernelbase+0x542>
    7d2d:	83 ec 0c             	sub    $0xc,%esp
    7d30:	68 8a 04 00 00       	push   $0x48a
    7d35:	68 f9 bf 00 00       	push   $0xbff9
    7d3a:	56                   	push   %esi
    7d3b:	68 cc 06 01 00       	push   $0x106cc
    7d40:	6a 01                	push   $0x1
    7d42:	e8 20 3e 00 00       	call   bb67 <printf>
    7d47:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7d4e:	00 00 00 
    7d51:	83 c4 20             	add    $0x20,%esp
    7d54:	e9 2a 02 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>
    ASSERT_FALSE(write_file(TEST_1_MEM_MIN, MORE_THEN_KERNBASE));
    7d59:	83 ec 08             	sub    $0x8,%esp
    7d5c:	68 5c c6 00 00       	push   $0xc65c
    7d61:	68 39 c2 00 00       	push   $0xc239
    7d66:	e8 e3 84 ff ff       	call   24e <write_file>
    7d6b:	83 c4 10             	add    $0x10,%esp
    7d6e:	85 c0                	test   %eax,%eax
    7d70:	75 19                	jne    7d8b <test_mem_limit_negative_and_over_kernelbase+0x5e2>
    7d72:	eb 6e                	jmp    7de2 <test_mem_limit_negative_and_over_kernelbase+0x639>
    7d74:	83 ec 08             	sub    $0x8,%esp
    7d77:	68 3c bf 00 00       	push   $0xbf3c
    7d7c:	6a 01                	push   $0x1
    7d7e:	e8 e4 3d 00 00       	call   bb67 <printf>
    7d83:	83 c3 01             	add    $0x1,%ebx
    7d86:	83 c4 10             	add    $0x10,%esp
    7d89:	eb 05                	jmp    7d90 <test_mem_limit_negative_and_over_kernelbase+0x5e7>
    7d8b:	bb 00 00 00 00       	mov    $0x0,%ebx
    7d90:	83 ec 0c             	sub    $0xc,%esp
    7d93:	68 24 07 01 00       	push   $0x10724
    7d98:	e8 66 39 00 00       	call   b703 <strlen>
    7d9d:	89 c7                	mov    %eax,%edi
    7d9f:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7da6:	e8 58 39 00 00       	call   b703 <strlen>
    7dab:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7daf:	83 c4 10             	add    $0x10,%esp
    7db2:	39 d8                	cmp    %ebx,%eax
    7db4:	77 be                	ja     7d74 <test_mem_limit_negative_and_over_kernelbase+0x5cb>
    7db6:	83 ec 0c             	sub    $0xc,%esp
    7db9:	68 8b 04 00 00       	push   $0x48b
    7dbe:	68 f9 bf 00 00       	push   $0xbff9
    7dc3:	56                   	push   %esi
    7dc4:	68 54 07 01 00       	push   $0x10754
    7dc9:	6a 01                	push   $0x1
    7dcb:	e8 97 3d 00 00       	call   bb67 <printf>
    7dd0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7dd7:	00 00 00 
    7dda:	83 c4 20             	add    $0x20,%esp
    7ddd:	e9 a1 01 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>

    // Check for no changes
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MAX, 0), "100\n"));
    7de2:	83 ec 08             	sub    $0x8,%esp
    7de5:	6a 00                	push   $0x0
    7de7:	68 20 c2 00 00       	push   $0xc220
    7dec:	e8 ab 83 ff ff       	call   19c <read_file>
    7df1:	83 c4 08             	add    $0x8,%esp
    7df4:	68 88 c5 00 00       	push   $0xc588
    7df9:	50                   	push   %eax
    7dfa:	e8 ae 38 00 00       	call   b6ad <strcmp>
    7dff:	83 c4 10             	add    $0x10,%esp
    7e02:	85 c0                	test   %eax,%eax
    7e04:	75 19                	jne    7e1f <test_mem_limit_negative_and_over_kernelbase+0x676>
    7e06:	eb 6e                	jmp    7e76 <test_mem_limit_negative_and_over_kernelbase+0x6cd>
    7e08:	83 ec 08             	sub    $0x8,%esp
    7e0b:	68 3c bf 00 00       	push   $0xbf3c
    7e10:	6a 01                	push   $0x1
    7e12:	e8 50 3d 00 00       	call   bb67 <printf>
    7e17:	83 c3 01             	add    $0x1,%ebx
    7e1a:	83 c4 10             	add    $0x10,%esp
    7e1d:	eb 05                	jmp    7e24 <test_mem_limit_negative_and_over_kernelbase+0x67b>
    7e1f:	bb 00 00 00 00       	mov    $0x0,%ebx
    7e24:	83 ec 0c             	sub    $0xc,%esp
    7e27:	68 80 f7 00 00       	push   $0xf780
    7e2c:	e8 d2 38 00 00       	call   b703 <strlen>
    7e31:	89 c7                	mov    %eax,%edi
    7e33:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7e3a:	e8 c4 38 00 00       	call   b703 <strlen>
    7e3f:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7e43:	83 c4 10             	add    $0x10,%esp
    7e46:	39 d8                	cmp    %ebx,%eax
    7e48:	77 be                	ja     7e08 <test_mem_limit_negative_and_over_kernelbase+0x65f>
    7e4a:	83 ec 0c             	sub    $0xc,%esp
    7e4d:	68 8e 04 00 00       	push   $0x48e
    7e52:	68 f9 bf 00 00       	push   $0xbff9
    7e57:	56                   	push   %esi
    7e58:	68 b0 f7 00 00       	push   $0xf7b0
    7e5d:	6a 01                	push   $0x1
    7e5f:	e8 03 3d 00 00       	call   bb67 <printf>
    7e64:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7e6b:	00 00 00 
    7e6e:	83 c4 20             	add    $0x20,%esp
    7e71:	e9 0d 01 00 00       	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>
    ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MIN, 0), "50\n"));
    7e76:	83 ec 08             	sub    $0x8,%esp
    7e79:	6a 00                	push   $0x0
    7e7b:	68 39 c2 00 00       	push   $0xc239
    7e80:	e8 17 83 ff ff       	call   19c <read_file>
    7e85:	83 c4 08             	add    $0x8,%esp
    7e88:	68 53 c6 00 00       	push   $0xc653
    7e8d:	50                   	push   %eax
    7e8e:	e8 1a 38 00 00       	call   b6ad <strcmp>
    7e93:	83 c4 10             	add    $0x10,%esp
    7e96:	85 c0                	test   %eax,%eax
    7e98:	75 19                	jne    7eb3 <test_mem_limit_negative_and_over_kernelbase+0x70a>
    7e9a:	eb 6b                	jmp    7f07 <test_mem_limit_negative_and_over_kernelbase+0x75e>
    7e9c:	83 ec 08             	sub    $0x8,%esp
    7e9f:	68 3c bf 00 00       	push   $0xbf3c
    7ea4:	6a 01                	push   $0x1
    7ea6:	e8 bc 3c 00 00       	call   bb67 <printf>
    7eab:	83 c3 01             	add    $0x1,%ebx
    7eae:	83 c4 10             	add    $0x10,%esp
    7eb1:	eb 05                	jmp    7eb8 <test_mem_limit_negative_and_over_kernelbase+0x70f>
    7eb3:	bb 00 00 00 00       	mov    $0x0,%ebx
    7eb8:	83 ec 0c             	sub    $0xc,%esp
    7ebb:	68 34 05 01 00       	push   $0x10534
    7ec0:	e8 3e 38 00 00       	call   b703 <strlen>
    7ec5:	89 c7                	mov    %eax,%edi
    7ec7:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7ece:	e8 30 38 00 00       	call   b703 <strlen>
    7ed3:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7ed7:	83 c4 10             	add    $0x10,%esp
    7eda:	39 d8                	cmp    %ebx,%eax
    7edc:	77 be                	ja     7e9c <test_mem_limit_negative_and_over_kernelbase+0x6f3>
    7ede:	83 ec 0c             	sub    $0xc,%esp
    7ee1:	68 8f 04 00 00       	push   $0x48f
    7ee6:	68 f9 bf 00 00       	push   $0xbff9
    7eeb:	56                   	push   %esi
    7eec:	68 64 05 01 00       	push   $0x10564
    7ef1:	6a 01                	push   $0x1
    7ef3:	e8 6f 3c 00 00       	call   bb67 <printf>
    7ef8:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7eff:	00 00 00 
    7f02:	83 c4 20             	add    $0x20,%esp
    7f05:	eb 7c                	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>

    // Disable memory controller
    ASSERT_TRUE(disable_controller(MEM_CNT));
    7f07:	83 ec 0c             	sub    $0xc,%esp
    7f0a:	6a 03                	push   $0x3
    7f0c:	e8 a4 84 ff ff       	call   3b5 <disable_controller>
    7f11:	83 c4 10             	add    $0x10,%esp
    7f14:	85 c0                	test   %eax,%eax
    7f16:	74 19                	je     7f31 <test_mem_limit_negative_and_over_kernelbase+0x788>
    7f18:	eb 69                	jmp    7f83 <test_mem_limit_negative_and_over_kernelbase+0x7da>
    7f1a:	83 ec 08             	sub    $0x8,%esp
    7f1d:	68 3c bf 00 00       	push   $0xbf3c
    7f22:	6a 01                	push   $0x1
    7f24:	e8 3e 3c 00 00       	call   bb67 <printf>
    7f29:	83 c3 01             	add    $0x1,%ebx
    7f2c:	83 c4 10             	add    $0x10,%esp
    7f2f:	eb 05                	jmp    7f36 <test_mem_limit_negative_and_over_kernelbase+0x78d>
    7f31:	bb 00 00 00 00       	mov    $0x0,%ebx
    7f36:	83 ec 0c             	sub    $0xc,%esp
    7f39:	68 91 c5 00 00       	push   $0xc591
    7f3e:	e8 c0 37 00 00       	call   b703 <strlen>
    7f43:	89 c7                	mov    %eax,%edi
    7f45:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7f4c:	e8 b2 37 00 00       	call   b703 <strlen>
    7f51:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7f55:	83 c4 10             	add    $0x10,%esp
    7f58:	39 d8                	cmp    %ebx,%eax
    7f5a:	77 be                	ja     7f1a <test_mem_limit_negative_and_over_kernelbase+0x771>
    7f5c:	83 ec 0c             	sub    $0xc,%esp
    7f5f:	68 92 04 00 00       	push   $0x492
    7f64:	68 f9 bf 00 00       	push   $0xbff9
    7f69:	56                   	push   %esi
    7f6a:	68 90 f8 00 00       	push   $0xf890
    7f6f:	6a 01                	push   $0x1
    7f71:	e8 f1 3b 00 00       	call   bb67 <printf>
    7f76:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    7f7d:	00 00 00 
    7f80:	83 c4 20             	add    $0x20,%esp
}
    7f83:	8d 65 f4             	lea    -0xc(%ebp),%esp
    7f86:	5b                   	pop    %ebx
    7f87:	5e                   	pop    %esi
    7f88:	5f                   	pop    %edi
    7f89:	5d                   	pop    %ebp
    7f8a:	c3                   	ret    

00007f8b <test_cant_move_over_mem_limit>:

TEST(test_cant_move_over_mem_limit)
{
    7f8b:	55                   	push   %ebp
    7f8c:	89 e5                	mov    %esp,%ebp
    7f8e:	57                   	push   %edi
    7f8f:	56                   	push   %esi
    7f90:	53                   	push   %ebx
    7f91:	83 ec 28             	sub    $0x28,%esp
    7f94:	8b 75 08             	mov    0x8(%ebp),%esi
  char saved_mem[12];

  // Enable memory controller
  ASSERT_TRUE(enable_controller(MEM_CNT));
    7f97:	6a 03                	push   $0x3
    7f99:	e8 c2 83 ff ff       	call   360 <enable_controller>
    7f9e:	83 c4 10             	add    $0x10,%esp
    7fa1:	85 c0                	test   %eax,%eax
    7fa3:	74 19                	je     7fbe <test_cant_move_over_mem_limit+0x33>
    7fa5:	eb 6e                	jmp    8015 <test_cant_move_over_mem_limit+0x8a>
    7fa7:	83 ec 08             	sub    $0x8,%esp
    7faa:	68 3c bf 00 00       	push   $0xbf3c
    7faf:	6a 01                	push   $0x1
    7fb1:	e8 b1 3b 00 00       	call   bb67 <printf>
    7fb6:	83 c3 01             	add    $0x1,%ebx
    7fb9:	83 c4 10             	add    $0x10,%esp
    7fbc:	eb 05                	jmp    7fc3 <test_cant_move_over_mem_limit+0x38>
    7fbe:	bb 00 00 00 00       	mov    $0x0,%ebx
    7fc3:	83 ec 0c             	sub    $0xc,%esp
    7fc6:	68 5f c5 00 00       	push   $0xc55f
    7fcb:	e8 33 37 00 00       	call   b703 <strlen>
    7fd0:	89 c7                	mov    %eax,%edi
    7fd2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    7fd9:	e8 25 37 00 00       	call   b703 <strlen>
    7fde:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    7fe2:	83 c4 10             	add    $0x10,%esp
    7fe5:	39 d8                	cmp    %ebx,%eax
    7fe7:	77 be                	ja     7fa7 <test_cant_move_over_mem_limit+0x1c>
    7fe9:	83 ec 0c             	sub    $0xc,%esp
    7fec:	68 9a 04 00 00       	push   $0x49a
    7ff1:	68 f9 bf 00 00       	push   $0xbff9
    7ff6:	56                   	push   %esi
    7ff7:	68 54 f5 00 00       	push   $0xf554
    7ffc:	6a 01                	push   $0x1
    7ffe:	e8 64 3b 00 00       	call   bb67 <printf>
    8003:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    800a:	00 00 00 
    800d:	83 c4 20             	add    $0x20,%esp
    8010:	e9 84 04 00 00       	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Copy the current saved memory and remove newline at the end
  strcpy(saved_mem, read_file(TEST_1_MEM_MAX, 0));
    8015:	83 ec 08             	sub    $0x8,%esp
    8018:	6a 00                	push   $0x0
    801a:	68 20 c2 00 00       	push   $0xc220
    801f:	e8 78 81 ff ff       	call   19c <read_file>
    8024:	83 c4 08             	add    $0x8,%esp
    8027:	50                   	push   %eax
    8028:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    802b:	53                   	push   %ebx
    802c:	e8 5e 36 00 00       	call   b68f <strcpy>
  saved_mem[strlen(saved_mem) - 1] = '\0';
    8031:	89 1c 24             	mov    %ebx,(%esp)
    8034:	e8 ca 36 00 00       	call   b703 <strlen>
    8039:	c6 44 05 db 00       	movb   $0x0,-0x25(%ebp,%eax,1)

  // Update memory limit
  ASSERT_TRUE(write_file(TEST_1_MEM_MAX, "0"));
    803e:	83 c4 08             	add    $0x8,%esp
    8041:	68 9b c3 00 00       	push   $0xc39b
    8046:	68 20 c2 00 00       	push   $0xc220
    804b:	e8 fe 81 ff ff       	call   24e <write_file>
    8050:	83 c4 10             	add    $0x10,%esp
    8053:	85 c0                	test   %eax,%eax
    8055:	74 19                	je     8070 <test_cant_move_over_mem_limit+0xe5>
    8057:	eb 6e                	jmp    80c7 <test_cant_move_over_mem_limit+0x13c>
    8059:	83 ec 08             	sub    $0x8,%esp
    805c:	68 3c bf 00 00       	push   $0xbf3c
    8061:	6a 01                	push   $0x1
    8063:	e8 ff 3a 00 00       	call   bb67 <printf>
    8068:	83 c3 01             	add    $0x1,%ebx
    806b:	83 c4 10             	add    $0x10,%esp
    806e:	eb 05                	jmp    8075 <test_cant_move_over_mem_limit+0xea>
    8070:	bb 00 00 00 00       	mov    $0x0,%ebx
    8075:	83 ec 0c             	sub    $0xc,%esp
    8078:	68 ac 07 01 00       	push   $0x107ac
    807d:	e8 81 36 00 00       	call   b703 <strlen>
    8082:	89 c7                	mov    %eax,%edi
    8084:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    808b:	e8 73 36 00 00       	call   b703 <strlen>
    8090:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8094:	83 c4 10             	add    $0x10,%esp
    8097:	39 d8                	cmp    %ebx,%eax
    8099:	77 be                	ja     8059 <test_cant_move_over_mem_limit+0xce>
    809b:	83 ec 0c             	sub    $0xc,%esp
    809e:	68 a1 04 00 00       	push   $0x4a1
    80a3:	68 f9 bf 00 00       	push   $0xbff9
    80a8:	56                   	push   %esi
    80a9:	68 cc 07 01 00       	push   $0x107cc
    80ae:	6a 01                	push   $0x1
    80b0:	e8 b2 3a 00 00       	call   bb67 <printf>
    80b5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    80bc:	00 00 00 
    80bf:	83 c4 20             	add    $0x20,%esp
    80c2:	e9 d2 03 00 00       	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Check changes
  ASSERT_FALSE(strcmp(read_file(TEST_1_MEM_MAX, 0), "0\n"));
    80c7:	83 ec 08             	sub    $0x8,%esp
    80ca:	6a 00                	push   $0x0
    80cc:	68 20 c2 00 00       	push   $0xc220
    80d1:	e8 c6 80 ff ff       	call   19c <read_file>
    80d6:	83 c4 08             	add    $0x8,%esp
    80d9:	68 00 c5 00 00       	push   $0xc500
    80de:	50                   	push   %eax
    80df:	e8 c9 35 00 00       	call   b6ad <strcmp>
    80e4:	83 c4 10             	add    $0x10,%esp
    80e7:	85 c0                	test   %eax,%eax
    80e9:	75 19                	jne    8104 <test_cant_move_over_mem_limit+0x179>
    80eb:	eb 6e                	jmp    815b <test_cant_move_over_mem_limit+0x1d0>
    80ed:	83 ec 08             	sub    $0x8,%esp
    80f0:	68 3c bf 00 00       	push   $0xbf3c
    80f5:	6a 01                	push   $0x1
    80f7:	e8 6b 3a 00 00       	call   bb67 <printf>
    80fc:	83 c3 01             	add    $0x1,%ebx
    80ff:	83 c4 10             	add    $0x10,%esp
    8102:	eb 05                	jmp    8109 <test_cant_move_over_mem_limit+0x17e>
    8104:	bb 00 00 00 00       	mov    $0x0,%ebx
    8109:	83 ec 0c             	sub    $0xc,%esp
    810c:	68 18 08 01 00       	push   $0x10818
    8111:	e8 ed 35 00 00       	call   b703 <strlen>
    8116:	89 c7                	mov    %eax,%edi
    8118:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    811f:	e8 df 35 00 00       	call   b703 <strlen>
    8124:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8128:	83 c4 10             	add    $0x10,%esp
    812b:	39 d8                	cmp    %ebx,%eax
    812d:	77 be                	ja     80ed <test_cant_move_over_mem_limit+0x162>
    812f:	83 ec 0c             	sub    $0xc,%esp
    8132:	68 a4 04 00 00       	push   $0x4a4
    8137:	68 f9 bf 00 00       	push   $0xbff9
    813c:	56                   	push   %esi
    813d:	68 44 08 01 00       	push   $0x10844
    8142:	6a 01                	push   $0x1
    8144:	e8 1e 3a 00 00       	call   bb67 <printf>
    8149:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8150:	00 00 00 
    8153:	83 c4 20             	add    $0x20,%esp
    8156:	e9 3e 03 00 00       	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Attemp to move the current process to "/cgroup/test1" cgroup.
  ASSERT_FALSE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    815b:	e8 96 38 00 00       	call   b9f6 <getpid>
    8160:	83 ec 08             	sub    $0x8,%esp
    8163:	50                   	push   %eax
    8164:	68 06 c1 00 00       	push   $0xc106
    8169:	e8 c9 83 ff ff       	call   537 <move_proc>
    816e:	83 c4 10             	add    $0x10,%esp
    8171:	85 c0                	test   %eax,%eax
    8173:	75 19                	jne    818e <test_cant_move_over_mem_limit+0x203>
    8175:	eb 6e                	jmp    81e5 <test_cant_move_over_mem_limit+0x25a>
    8177:	83 ec 08             	sub    $0x8,%esp
    817a:	68 3c bf 00 00       	push   $0xbf3c
    817f:	6a 01                	push   $0x1
    8181:	e8 e1 39 00 00       	call   bb67 <printf>
    8186:	83 c3 01             	add    $0x1,%ebx
    8189:	83 c4 10             	add    $0x10,%esp
    818c:	eb 05                	jmp    8193 <test_cant_move_over_mem_limit+0x208>
    818e:	bb 00 00 00 00       	mov    $0x0,%ebx
    8193:	83 ec 0c             	sub    $0xc,%esp
    8196:	68 90 e3 00 00       	push   $0xe390
    819b:	e8 63 35 00 00       	call   b703 <strlen>
    81a0:	89 c7                	mov    %eax,%edi
    81a2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    81a9:	e8 55 35 00 00       	call   b703 <strlen>
    81ae:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    81b2:	83 c4 10             	add    $0x10,%esp
    81b5:	39 d8                	cmp    %ebx,%eax
    81b7:	77 be                	ja     8177 <test_cant_move_over_mem_limit+0x1ec>
    81b9:	83 ec 0c             	sub    $0xc,%esp
    81bc:	68 a7 04 00 00       	push   $0x4a7
    81c1:	68 f9 bf 00 00       	push   $0xbff9
    81c6:	56                   	push   %esi
    81c7:	68 bc e3 00 00       	push   $0xe3bc
    81cc:	6a 01                	push   $0x1
    81ce:	e8 94 39 00 00       	call   bb67 <printf>
    81d3:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    81da:	00 00 00 
    81dd:	83 c4 20             	add    $0x20,%esp
    81e0:	e9 b4 02 00 00       	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Check that the current process is not in "/cgroup/test1" cgroup.
  ASSERT_FALSE(is_pid_in_group(TEST_1_CGROUP_PROCS, getpid()));
    81e5:	e8 0c 38 00 00       	call   b9f6 <getpid>
    81ea:	83 ec 08             	sub    $0x8,%esp
    81ed:	50                   	push   %eax
    81ee:	68 06 c1 00 00       	push   $0xc106
    81f3:	e8 72 83 ff ff       	call   56a <is_pid_in_group>
    81f8:	83 c4 10             	add    $0x10,%esp
    81fb:	85 c0                	test   %eax,%eax
    81fd:	75 19                	jne    8218 <test_cant_move_over_mem_limit+0x28d>
    81ff:	eb 6e                	jmp    826f <test_cant_move_over_mem_limit+0x2e4>
    8201:	83 ec 08             	sub    $0x8,%esp
    8204:	68 3c bf 00 00       	push   $0xbf3c
    8209:	6a 01                	push   $0x1
    820b:	e8 57 39 00 00       	call   bb67 <printf>
    8210:	83 c3 01             	add    $0x1,%ebx
    8213:	83 c4 10             	add    $0x10,%esp
    8216:	eb 05                	jmp    821d <test_cant_move_over_mem_limit+0x292>
    8218:	bb 00 00 00 00       	mov    $0x0,%ebx
    821d:	83 ec 0c             	sub    $0xc,%esp
    8220:	68 10 e4 00 00       	push   $0xe410
    8225:	e8 d9 34 00 00       	call   b703 <strlen>
    822a:	89 c7                	mov    %eax,%edi
    822c:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8233:	e8 cb 34 00 00       	call   b703 <strlen>
    8238:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    823c:	83 c4 10             	add    $0x10,%esp
    823f:	39 d8                	cmp    %ebx,%eax
    8241:	77 be                	ja     8201 <test_cant_move_over_mem_limit+0x276>
    8243:	83 ec 0c             	sub    $0xc,%esp
    8246:	68 aa 04 00 00       	push   $0x4aa
    824b:	68 f9 bf 00 00       	push   $0xbff9
    8250:	56                   	push   %esi
    8251:	68 40 e4 00 00       	push   $0xe440
    8256:	6a 01                	push   $0x1
    8258:	e8 0a 39 00 00       	call   bb67 <printf>
    825d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8264:	00 00 00 
    8267:	83 c4 20             	add    $0x20,%esp
    826a:	e9 2a 02 00 00       	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Check that the current process is still in root group.
  ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    826f:	e8 82 37 00 00       	call   b9f6 <getpid>
    8274:	83 ec 08             	sub    $0x8,%esp
    8277:	50                   	push   %eax
    8278:	68 09 c4 00 00       	push   $0xc409
    827d:	e8 e8 82 ff ff       	call   56a <is_pid_in_group>
    8282:	83 c4 10             	add    $0x10,%esp
    8285:	85 c0                	test   %eax,%eax
    8287:	74 19                	je     82a2 <test_cant_move_over_mem_limit+0x317>
    8289:	eb 6e                	jmp    82f9 <test_cant_move_over_mem_limit+0x36e>
    828b:	83 ec 08             	sub    $0x8,%esp
    828e:	68 3c bf 00 00       	push   $0xbf3c
    8293:	6a 01                	push   $0x1
    8295:	e8 cd 38 00 00       	call   bb67 <printf>
    829a:	83 c3 01             	add    $0x1,%ebx
    829d:	83 c4 10             	add    $0x10,%esp
    82a0:	eb 05                	jmp    82a7 <test_cant_move_over_mem_limit+0x31c>
    82a2:	bb 00 00 00 00       	mov    $0x0,%ebx
    82a7:	83 ec 0c             	sub    $0xc,%esp
    82aa:	68 98 e4 00 00       	push   $0xe498
    82af:	e8 4f 34 00 00       	call   b703 <strlen>
    82b4:	89 c7                	mov    %eax,%edi
    82b6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    82bd:	e8 41 34 00 00       	call   b703 <strlen>
    82c2:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    82c6:	83 c4 10             	add    $0x10,%esp
    82c9:	39 d8                	cmp    %ebx,%eax
    82cb:	77 be                	ja     828b <test_cant_move_over_mem_limit+0x300>
    82cd:	83 ec 0c             	sub    $0xc,%esp
    82d0:	68 ad 04 00 00       	push   $0x4ad
    82d5:	68 f9 bf 00 00       	push   $0xbff9
    82da:	56                   	push   %esi
    82db:	68 c8 e4 00 00       	push   $0xe4c8
    82e0:	6a 01                	push   $0x1
    82e2:	e8 80 38 00 00       	call   bb67 <printf>
    82e7:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    82ee:	00 00 00 
    82f1:	83 c4 20             	add    $0x20,%esp
    82f4:	e9 a0 01 00 00       	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Restore memory limit to original
  ASSERT_TRUE(write_file(TEST_1_MEM_MAX, saved_mem));
    82f9:	83 ec 08             	sub    $0x8,%esp
    82fc:	8d 45 dc             	lea    -0x24(%ebp),%eax
    82ff:	50                   	push   %eax
    8300:	68 20 c2 00 00       	push   $0xc220
    8305:	e8 44 7f ff ff       	call   24e <write_file>
    830a:	83 c4 10             	add    $0x10,%esp
    830d:	85 c0                	test   %eax,%eax
    830f:	74 19                	je     832a <test_cant_move_over_mem_limit+0x39f>
    8311:	eb 6e                	jmp    8381 <test_cant_move_over_mem_limit+0x3f6>
    8313:	83 ec 08             	sub    $0x8,%esp
    8316:	68 3c bf 00 00       	push   $0xbf3c
    831b:	6a 01                	push   $0x1
    831d:	e8 45 38 00 00       	call   bb67 <printf>
    8322:	83 c3 01             	add    $0x1,%ebx
    8325:	83 c4 10             	add    $0x10,%esp
    8328:	eb 05                	jmp    832f <test_cant_move_over_mem_limit+0x3a4>
    832a:	bb 00 00 00 00       	mov    $0x0,%ebx
    832f:	83 ec 0c             	sub    $0xc,%esp
    8332:	68 9c 08 01 00       	push   $0x1089c
    8337:	e8 c7 33 00 00       	call   b703 <strlen>
    833c:	89 c7                	mov    %eax,%edi
    833e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8345:	e8 b9 33 00 00       	call   b703 <strlen>
    834a:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    834e:	83 c4 10             	add    $0x10,%esp
    8351:	39 d8                	cmp    %ebx,%eax
    8353:	77 be                	ja     8313 <test_cant_move_over_mem_limit+0x388>
    8355:	83 ec 0c             	sub    $0xc,%esp
    8358:	68 b0 04 00 00       	push   $0x4b0
    835d:	68 f9 bf 00 00       	push   $0xbff9
    8362:	56                   	push   %esi
    8363:	68 c4 08 01 00       	push   $0x108c4
    8368:	6a 01                	push   $0x1
    836a:	e8 f8 37 00 00       	call   bb67 <printf>
    836f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8376:	00 00 00 
    8379:	83 c4 20             	add    $0x20,%esp
    837c:	e9 18 01 00 00       	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Check changes
  ASSERT_FALSE(strncmp(read_file(TEST_1_MEM_MAX, 0), saved_mem, strlen(saved_mem)));
    8381:	83 ec 0c             	sub    $0xc,%esp
    8384:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    8387:	53                   	push   %ebx
    8388:	e8 76 33 00 00       	call   b703 <strlen>
    838d:	89 c7                	mov    %eax,%edi
    838f:	83 c4 08             	add    $0x8,%esp
    8392:	6a 00                	push   $0x0
    8394:	68 20 c2 00 00       	push   $0xc220
    8399:	e8 fe 7d ff ff       	call   19c <read_file>
    839e:	83 c4 0c             	add    $0xc,%esp
    83a1:	57                   	push   %edi
    83a2:	53                   	push   %ebx
    83a3:	50                   	push   %eax
    83a4:	e8 2a 33 00 00       	call   b6d3 <strncmp>
    83a9:	83 c4 10             	add    $0x10,%esp
    83ac:	85 c0                	test   %eax,%eax
    83ae:	75 19                	jne    83c9 <test_cant_move_over_mem_limit+0x43e>
    83b0:	eb 6b                	jmp    841d <test_cant_move_over_mem_limit+0x492>
    83b2:	83 ec 08             	sub    $0x8,%esp
    83b5:	68 3c bf 00 00       	push   $0xbf3c
    83ba:	6a 01                	push   $0x1
    83bc:	e8 a6 37 00 00       	call   bb67 <printf>
    83c1:	83 c3 01             	add    $0x1,%ebx
    83c4:	83 c4 10             	add    $0x10,%esp
    83c7:	eb 05                	jmp    83ce <test_cant_move_over_mem_limit+0x443>
    83c9:	bb 00 00 00 00       	mov    $0x0,%ebx
    83ce:	83 ec 0c             	sub    $0xc,%esp
    83d1:	68 14 09 01 00       	push   $0x10914
    83d6:	e8 28 33 00 00       	call   b703 <strlen>
    83db:	89 c7                	mov    %eax,%edi
    83dd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    83e4:	e8 1a 33 00 00       	call   b703 <strlen>
    83e9:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    83ed:	83 c4 10             	add    $0x10,%esp
    83f0:	39 d8                	cmp    %ebx,%eax
    83f2:	77 be                	ja     83b2 <test_cant_move_over_mem_limit+0x427>
    83f4:	83 ec 0c             	sub    $0xc,%esp
    83f7:	68 b3 04 00 00       	push   $0x4b3
    83fc:	68 f9 bf 00 00       	push   $0xbff9
    8401:	56                   	push   %esi
    8402:	68 58 09 01 00       	push   $0x10958
    8407:	6a 01                	push   $0x1
    8409:	e8 59 37 00 00       	call   bb67 <printf>
    840e:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8415:	00 00 00 
    8418:	83 c4 20             	add    $0x20,%esp
    841b:	eb 7c                	jmp    8499 <test_cant_move_over_mem_limit+0x50e>

  // Disable memory controller
  ASSERT_TRUE(disable_controller(MEM_CNT));
    841d:	83 ec 0c             	sub    $0xc,%esp
    8420:	6a 03                	push   $0x3
    8422:	e8 8e 7f ff ff       	call   3b5 <disable_controller>
    8427:	83 c4 10             	add    $0x10,%esp
    842a:	85 c0                	test   %eax,%eax
    842c:	74 19                	je     8447 <test_cant_move_over_mem_limit+0x4bc>
    842e:	eb 69                	jmp    8499 <test_cant_move_over_mem_limit+0x50e>
    8430:	83 ec 08             	sub    $0x8,%esp
    8433:	68 3c bf 00 00       	push   $0xbf3c
    8438:	6a 01                	push   $0x1
    843a:	e8 28 37 00 00       	call   bb67 <printf>
    843f:	83 c3 01             	add    $0x1,%ebx
    8442:	83 c4 10             	add    $0x10,%esp
    8445:	eb 05                	jmp    844c <test_cant_move_over_mem_limit+0x4c1>
    8447:	bb 00 00 00 00       	mov    $0x0,%ebx
    844c:	83 ec 0c             	sub    $0xc,%esp
    844f:	68 91 c5 00 00       	push   $0xc591
    8454:	e8 aa 32 00 00       	call   b703 <strlen>
    8459:	89 c7                	mov    %eax,%edi
    845b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8462:	e8 9c 32 00 00       	call   b703 <strlen>
    8467:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    846b:	83 c4 10             	add    $0x10,%esp
    846e:	39 d8                	cmp    %ebx,%eax
    8470:	77 be                	ja     8430 <test_cant_move_over_mem_limit+0x4a5>
    8472:	83 ec 0c             	sub    $0xc,%esp
    8475:	68 b6 04 00 00       	push   $0x4b6
    847a:	68 f9 bf 00 00       	push   $0xbff9
    847f:	56                   	push   %esi
    8480:	68 90 f8 00 00       	push   $0xf890
    8485:	6a 01                	push   $0x1
    8487:	e8 db 36 00 00       	call   bb67 <printf>
    848c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8493:	00 00 00 
    8496:	83 c4 20             	add    $0x20,%esp
}
    8499:	8d 65 f4             	lea    -0xc(%ebp),%esp
    849c:	5b                   	pop    %ebx
    849d:	5e                   	pop    %esi
    849e:	5f                   	pop    %edi
    849f:	5d                   	pop    %ebp
    84a0:	c3                   	ret    

000084a1 <test_cant_fork_over_mem_limit>:

TEST(test_cant_fork_over_mem_limit)
{
    84a1:	55                   	push   %ebp
    84a2:	89 e5                	mov    %esp,%ebp
    84a4:	57                   	push   %edi
    84a5:	56                   	push   %esi
    84a6:	53                   	push   %ebx
    84a7:	83 ec 2c             	sub    $0x2c,%esp
    84aa:	8b 75 08             	mov    0x8(%ebp),%esi
  // Save current process memory size.
  char proc_mem[10];
  itoa(proc_mem, getmem());
    84ad:	e8 ac 35 00 00       	call   ba5e <getmem>
    84b2:	83 ec 08             	sub    $0x8,%esp
    84b5:	50                   	push   %eax
    84b6:	8d 45 de             	lea    -0x22(%ebp),%eax
    84b9:	50                   	push   %eax
    84ba:	e8 8b 33 00 00       	call   b84a <itoa>
  // Buffer to read contents from memory file.
  char saved_mem[10];

  // Enable memory controller
  ASSERT_TRUE(enable_controller(MEM_CNT));
    84bf:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    84c6:	e8 95 7e ff ff       	call   360 <enable_controller>
    84cb:	83 c4 10             	add    $0x10,%esp
    84ce:	85 c0                	test   %eax,%eax
    84d0:	74 19                	je     84eb <test_cant_fork_over_mem_limit+0x4a>
    84d2:	eb 6e                	jmp    8542 <test_cant_fork_over_mem_limit+0xa1>
    84d4:	83 ec 08             	sub    $0x8,%esp
    84d7:	68 3c bf 00 00       	push   $0xbf3c
    84dc:	6a 01                	push   $0x1
    84de:	e8 84 36 00 00       	call   bb67 <printf>
    84e3:	83 c3 01             	add    $0x1,%ebx
    84e6:	83 c4 10             	add    $0x10,%esp
    84e9:	eb 05                	jmp    84f0 <test_cant_fork_over_mem_limit+0x4f>
    84eb:	bb 00 00 00 00       	mov    $0x0,%ebx
    84f0:	83 ec 0c             	sub    $0xc,%esp
    84f3:	68 5f c5 00 00       	push   $0xc55f
    84f8:	e8 06 32 00 00       	call   b703 <strlen>
    84fd:	89 c7                	mov    %eax,%edi
    84ff:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8506:	e8 f8 31 00 00       	call   b703 <strlen>
    850b:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    850f:	83 c4 10             	add    $0x10,%esp
    8512:	39 d8                	cmp    %ebx,%eax
    8514:	77 be                	ja     84d4 <test_cant_fork_over_mem_limit+0x33>
    8516:	83 ec 0c             	sub    $0xc,%esp
    8519:	68 c2 04 00 00       	push   $0x4c2
    851e:	68 f9 bf 00 00       	push   $0xbff9
    8523:	56                   	push   %esi
    8524:	68 54 f5 00 00       	push   $0xf554
    8529:	6a 01                	push   $0x1
    852b:	e8 37 36 00 00       	call   bb67 <printf>
    8530:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8537:	00 00 00 
    853a:	83 c4 20             	add    $0x20,%esp
    853d:	e9 84 03 00 00       	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>

  // Update memory limit
  ASSERT_TRUE(write_file(TEST_1_MEM_MAX, proc_mem));
    8542:	83 ec 08             	sub    $0x8,%esp
    8545:	8d 45 de             	lea    -0x22(%ebp),%eax
    8548:	50                   	push   %eax
    8549:	68 20 c2 00 00       	push   $0xc220
    854e:	e8 fb 7c ff ff       	call   24e <write_file>
    8553:	83 c4 10             	add    $0x10,%esp
    8556:	85 c0                	test   %eax,%eax
    8558:	74 19                	je     8573 <test_cant_fork_over_mem_limit+0xd2>
    855a:	eb 6e                	jmp    85ca <test_cant_fork_over_mem_limit+0x129>
    855c:	83 ec 08             	sub    $0x8,%esp
    855f:	68 3c bf 00 00       	push   $0xbf3c
    8564:	6a 01                	push   $0x1
    8566:	e8 fc 35 00 00       	call   bb67 <printf>
    856b:	83 c3 01             	add    $0x1,%ebx
    856e:	83 c4 10             	add    $0x10,%esp
    8571:	eb 05                	jmp    8578 <test_cant_fork_over_mem_limit+0xd7>
    8573:	bb 00 00 00 00       	mov    $0x0,%ebx
    8578:	83 ec 0c             	sub    $0xc,%esp
    857b:	68 c8 09 01 00       	push   $0x109c8
    8580:	e8 7e 31 00 00       	call   b703 <strlen>
    8585:	89 c7                	mov    %eax,%edi
    8587:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    858e:	e8 70 31 00 00       	call   b703 <strlen>
    8593:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8597:	83 c4 10             	add    $0x10,%esp
    859a:	39 d8                	cmp    %ebx,%eax
    859c:	77 be                	ja     855c <test_cant_fork_over_mem_limit+0xbb>
    859e:	83 ec 0c             	sub    $0xc,%esp
    85a1:	68 c5 04 00 00       	push   $0x4c5
    85a6:	68 f9 bf 00 00       	push   $0xbff9
    85ab:	56                   	push   %esi
    85ac:	68 f0 09 01 00       	push   $0x109f0
    85b1:	6a 01                	push   $0x1
    85b3:	e8 af 35 00 00       	call   bb67 <printf>
    85b8:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    85bf:	00 00 00 
    85c2:	83 c4 20             	add    $0x20,%esp
    85c5:	e9 fc 02 00 00       	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>

  // Read the contents of limit file and convert it for comparison.
  strcpy(saved_mem, read_file(TEST_1_MEM_MAX, 0));
    85ca:	83 ec 08             	sub    $0x8,%esp
    85cd:	6a 00                	push   $0x0
    85cf:	68 20 c2 00 00       	push   $0xc220
    85d4:	e8 c3 7b ff ff       	call   19c <read_file>
    85d9:	83 c4 08             	add    $0x8,%esp
    85dc:	50                   	push   %eax
    85dd:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
    85e0:	53                   	push   %ebx
    85e1:	e8 a9 30 00 00       	call   b68f <strcpy>

  strcat(proc_mem, "\n");
    85e6:	83 c4 08             	add    $0x8,%esp
    85e9:	68 05 c8 00 00       	push   $0xc805
    85ee:	8d 7d de             	lea    -0x22(%ebp),%edi
    85f1:	57                   	push   %edi
    85f2:	e8 df 32 00 00       	call   b8d6 <strcat>

  // Check changes
  ASSERT_FALSE(strcmp(saved_mem, proc_mem));
    85f7:	83 c4 08             	add    $0x8,%esp
    85fa:	57                   	push   %edi
    85fb:	53                   	push   %ebx
    85fc:	e8 ac 30 00 00       	call   b6ad <strcmp>
    8601:	83 c4 10             	add    $0x10,%esp
    8604:	85 c0                	test   %eax,%eax
    8606:	75 19                	jne    8621 <test_cant_fork_over_mem_limit+0x180>
    8608:	eb 6e                	jmp    8678 <test_cant_fork_over_mem_limit+0x1d7>
    860a:	83 ec 08             	sub    $0x8,%esp
    860d:	68 3c bf 00 00       	push   $0xbf3c
    8612:	6a 01                	push   $0x1
    8614:	e8 4e 35 00 00       	call   bb67 <printf>
    8619:	83 c3 01             	add    $0x1,%ebx
    861c:	83 c4 10             	add    $0x10,%esp
    861f:	eb 05                	jmp    8626 <test_cant_fork_over_mem_limit+0x185>
    8621:	bb 00 00 00 00       	mov    $0x0,%ebx
    8626:	83 ec 0c             	sub    $0xc,%esp
    8629:	68 43 c5 00 00       	push   $0xc543
    862e:	e8 d0 30 00 00       	call   b703 <strlen>
    8633:	89 c7                	mov    %eax,%edi
    8635:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    863c:	e8 c2 30 00 00       	call   b703 <strlen>
    8641:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8645:	83 c4 10             	add    $0x10,%esp
    8648:	39 d8                	cmp    %ebx,%eax
    864a:	77 be                	ja     860a <test_cant_fork_over_mem_limit+0x169>
    864c:	83 ec 0c             	sub    $0xc,%esp
    864f:	68 cd 04 00 00       	push   $0x4cd
    8654:	68 f9 bf 00 00       	push   $0xbff9
    8659:	56                   	push   %esi
    865a:	68 0c f5 00 00       	push   $0xf50c
    865f:	6a 01                	push   $0x1
    8661:	e8 01 35 00 00       	call   bb67 <printf>
    8666:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    866d:	00 00 00 
    8670:	83 c4 20             	add    $0x20,%esp
    8673:	e9 4e 02 00 00       	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>

  // Move the current process to "/cgroup/test1" cgroup.
  ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    8678:	e8 79 33 00 00       	call   b9f6 <getpid>
    867d:	83 ec 08             	sub    $0x8,%esp
    8680:	50                   	push   %eax
    8681:	68 06 c1 00 00       	push   $0xc106
    8686:	e8 ac 7e ff ff       	call   537 <move_proc>
    868b:	83 c4 10             	add    $0x10,%esp
    868e:	85 c0                	test   %eax,%eax
    8690:	74 19                	je     86ab <test_cant_fork_over_mem_limit+0x20a>
    8692:	eb 6e                	jmp    8702 <test_cant_fork_over_mem_limit+0x261>
    8694:	83 ec 08             	sub    $0x8,%esp
    8697:	68 3c bf 00 00       	push   $0xbf3c
    869c:	6a 01                	push   $0x1
    869e:	e8 c4 34 00 00       	call   bb67 <printf>
    86a3:	83 c3 01             	add    $0x1,%ebx
    86a6:	83 c4 10             	add    $0x10,%esp
    86a9:	eb 05                	jmp    86b0 <test_cant_fork_over_mem_limit+0x20f>
    86ab:	bb 00 00 00 00       	mov    $0x0,%ebx
    86b0:	83 ec 0c             	sub    $0xc,%esp
    86b3:	68 90 e3 00 00       	push   $0xe390
    86b8:	e8 46 30 00 00       	call   b703 <strlen>
    86bd:	89 c7                	mov    %eax,%edi
    86bf:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    86c6:	e8 38 30 00 00       	call   b703 <strlen>
    86cb:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    86cf:	83 c4 10             	add    $0x10,%esp
    86d2:	39 d8                	cmp    %ebx,%eax
    86d4:	77 be                	ja     8694 <test_cant_fork_over_mem_limit+0x1f3>
    86d6:	83 ec 0c             	sub    $0xc,%esp
    86d9:	68 d0 04 00 00       	push   $0x4d0
    86de:	68 f9 bf 00 00       	push   $0xbff9
    86e3:	56                   	push   %esi
    86e4:	68 d4 e5 00 00       	push   $0xe5d4
    86e9:	6a 01                	push   $0x1
    86eb:	e8 77 34 00 00       	call   bb67 <printf>
    86f0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    86f7:	00 00 00 
    86fa:	83 c4 20             	add    $0x20,%esp
    86fd:	e9 c4 01 00 00       	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>

  // Attempt to fork, notice this operation should fail and return -1.
  ASSERT_UINT_EQ(fork(), -1);
    8702:	e8 67 32 00 00       	call   b96e <fork>
    8707:	83 f8 ff             	cmp    $0xffffffff,%eax
    870a:	74 2d                	je     8739 <test_cant_fork_over_mem_limit+0x298>
    870c:	e8 5d 32 00 00       	call   b96e <fork>
    8711:	83 ec 0c             	sub    $0xc,%esp
    8714:	68 d3 04 00 00       	push   $0x4d3
    8719:	68 f9 bf 00 00       	push   $0xbff9
    871e:	6a ff                	push   $0xffffffff
    8720:	50                   	push   %eax
    8721:	56                   	push   %esi
    8722:	e8 ed 78 ff ff       	call   14 <print_error>
    8727:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    872e:	00 00 00 
    8731:	83 c4 20             	add    $0x20,%esp
    8734:	e9 8d 01 00 00       	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>

  // Return the process to root cgroup.
  ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    8739:	e8 b8 32 00 00       	call   b9f6 <getpid>
    873e:	83 ec 08             	sub    $0x8,%esp
    8741:	50                   	push   %eax
    8742:	68 09 c4 00 00       	push   $0xc409
    8747:	e8 eb 7d ff ff       	call   537 <move_proc>
    874c:	83 c4 10             	add    $0x10,%esp
    874f:	85 c0                	test   %eax,%eax
    8751:	74 19                	je     876c <test_cant_fork_over_mem_limit+0x2cb>
    8753:	eb 6e                	jmp    87c3 <test_cant_fork_over_mem_limit+0x322>
    8755:	83 ec 08             	sub    $0x8,%esp
    8758:	68 3c bf 00 00       	push   $0xbf3c
    875d:	6a 01                	push   $0x1
    875f:	e8 03 34 00 00       	call   bb67 <printf>
    8764:	83 c3 01             	add    $0x1,%ebx
    8767:	83 c4 10             	add    $0x10,%esp
    876a:	eb 05                	jmp    8771 <test_cant_fork_over_mem_limit+0x2d0>
    876c:	bb 00 00 00 00       	mov    $0x0,%ebx
    8771:	83 ec 0c             	sub    $0xc,%esp
    8774:	68 80 e6 00 00       	push   $0xe680
    8779:	e8 85 2f 00 00       	call   b703 <strlen>
    877e:	89 c7                	mov    %eax,%edi
    8780:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8787:	e8 77 2f 00 00       	call   b703 <strlen>
    878c:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8790:	83 c4 10             	add    $0x10,%esp
    8793:	39 d8                	cmp    %ebx,%eax
    8795:	77 be                	ja     8755 <test_cant_fork_over_mem_limit+0x2b4>
    8797:	83 ec 0c             	sub    $0xc,%esp
    879a:	68 d6 04 00 00       	push   $0x4d6
    879f:	68 f9 bf 00 00       	push   $0xbff9
    87a4:	56                   	push   %esi
    87a5:	68 a8 e6 00 00       	push   $0xe6a8
    87aa:	6a 01                	push   $0x1
    87ac:	e8 b6 33 00 00       	call   bb67 <printf>
    87b1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    87b8:	00 00 00 
    87bb:	83 c4 20             	add    $0x20,%esp
    87be:	e9 03 01 00 00       	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>

  // Check that the process we returned is really in root cgroup.
  ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    87c3:	e8 2e 32 00 00       	call   b9f6 <getpid>
    87c8:	83 ec 08             	sub    $0x8,%esp
    87cb:	50                   	push   %eax
    87cc:	68 09 c4 00 00       	push   $0xc409
    87d1:	e8 94 7d ff ff       	call   56a <is_pid_in_group>
    87d6:	83 c4 10             	add    $0x10,%esp
    87d9:	85 c0                	test   %eax,%eax
    87db:	74 19                	je     87f6 <test_cant_fork_over_mem_limit+0x355>
    87dd:	eb 6b                	jmp    884a <test_cant_fork_over_mem_limit+0x3a9>
    87df:	83 ec 08             	sub    $0x8,%esp
    87e2:	68 3c bf 00 00       	push   $0xbf3c
    87e7:	6a 01                	push   $0x1
    87e9:	e8 79 33 00 00       	call   bb67 <printf>
    87ee:	83 c3 01             	add    $0x1,%ebx
    87f1:	83 c4 10             	add    $0x10,%esp
    87f4:	eb 05                	jmp    87fb <test_cant_fork_over_mem_limit+0x35a>
    87f6:	bb 00 00 00 00       	mov    $0x0,%ebx
    87fb:	83 ec 0c             	sub    $0xc,%esp
    87fe:	68 98 e4 00 00       	push   $0xe498
    8803:	e8 fb 2e 00 00       	call   b703 <strlen>
    8808:	89 c7                	mov    %eax,%edi
    880a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8811:	e8 ed 2e 00 00       	call   b703 <strlen>
    8816:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    881a:	83 c4 10             	add    $0x10,%esp
    881d:	39 d8                	cmp    %ebx,%eax
    881f:	77 be                	ja     87df <test_cant_fork_over_mem_limit+0x33e>
    8821:	83 ec 0c             	sub    $0xc,%esp
    8824:	68 d9 04 00 00       	push   $0x4d9
    8829:	68 f9 bf 00 00       	push   $0xbff9
    882e:	56                   	push   %esi
    882f:	68 c8 e4 00 00       	push   $0xe4c8
    8834:	6a 01                	push   $0x1
    8836:	e8 2c 33 00 00       	call   bb67 <printf>
    883b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8842:	00 00 00 
    8845:	83 c4 20             	add    $0x20,%esp
    8848:	eb 7c                	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>

  // Disable memory controller
  ASSERT_TRUE(disable_controller(MEM_CNT));
    884a:	83 ec 0c             	sub    $0xc,%esp
    884d:	6a 03                	push   $0x3
    884f:	e8 61 7b ff ff       	call   3b5 <disable_controller>
    8854:	83 c4 10             	add    $0x10,%esp
    8857:	85 c0                	test   %eax,%eax
    8859:	74 19                	je     8874 <test_cant_fork_over_mem_limit+0x3d3>
    885b:	eb 69                	jmp    88c6 <test_cant_fork_over_mem_limit+0x425>
    885d:	83 ec 08             	sub    $0x8,%esp
    8860:	68 3c bf 00 00       	push   $0xbf3c
    8865:	6a 01                	push   $0x1
    8867:	e8 fb 32 00 00       	call   bb67 <printf>
    886c:	83 c3 01             	add    $0x1,%ebx
    886f:	83 c4 10             	add    $0x10,%esp
    8872:	eb 05                	jmp    8879 <test_cant_fork_over_mem_limit+0x3d8>
    8874:	bb 00 00 00 00       	mov    $0x0,%ebx
    8879:	83 ec 0c             	sub    $0xc,%esp
    887c:	68 91 c5 00 00       	push   $0xc591
    8881:	e8 7d 2e 00 00       	call   b703 <strlen>
    8886:	89 c7                	mov    %eax,%edi
    8888:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    888f:	e8 6f 2e 00 00       	call   b703 <strlen>
    8894:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8898:	83 c4 10             	add    $0x10,%esp
    889b:	39 d8                	cmp    %ebx,%eax
    889d:	77 be                	ja     885d <test_cant_fork_over_mem_limit+0x3bc>
    889f:	83 ec 0c             	sub    $0xc,%esp
    88a2:	68 dc 04 00 00       	push   $0x4dc
    88a7:	68 f9 bf 00 00       	push   $0xbff9
    88ac:	56                   	push   %esi
    88ad:	68 90 f8 00 00       	push   $0xf890
    88b2:	6a 01                	push   $0x1
    88b4:	e8 ae 32 00 00       	call   bb67 <printf>
    88b9:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    88c0:	00 00 00 
    88c3:	83 c4 20             	add    $0x20,%esp
}
    88c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    88c9:	5b                   	pop    %ebx
    88ca:	5e                   	pop    %esi
    88cb:	5f                   	pop    %edi
    88cc:	5d                   	pop    %ebp
    88cd:	c3                   	ret    

000088ce <test_cant_grow_over_mem_limit>:

TEST(test_cant_grow_over_mem_limit)
{
    88ce:	55                   	push   %ebp
    88cf:	89 e5                	mov    %esp,%ebp
    88d1:	57                   	push   %edi
    88d2:	56                   	push   %esi
    88d3:	53                   	push   %ebx
    88d4:	83 ec 2c             	sub    $0x2c,%esp
    88d7:	8b 75 08             	mov    0x8(%ebp),%esi
  // Save current process memory size.
  char proc_mem[10];
  itoa(proc_mem, getmem());
    88da:	e8 7f 31 00 00       	call   ba5e <getmem>
    88df:	83 ec 08             	sub    $0x8,%esp
    88e2:	50                   	push   %eax
    88e3:	8d 45 de             	lea    -0x22(%ebp),%eax
    88e6:	50                   	push   %eax
    88e7:	e8 5e 2f 00 00       	call   b84a <itoa>
  // Buffer to read contents from memory file.
  char saved_mem[10];

  // Enable memory controller
  ASSERT_TRUE(enable_controller(MEM_CNT));
    88ec:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    88f3:	e8 68 7a ff ff       	call   360 <enable_controller>
    88f8:	83 c4 10             	add    $0x10,%esp
    88fb:	85 c0                	test   %eax,%eax
    88fd:	74 19                	je     8918 <test_cant_grow_over_mem_limit+0x4a>
    88ff:	eb 6e                	jmp    896f <test_cant_grow_over_mem_limit+0xa1>
    8901:	83 ec 08             	sub    $0x8,%esp
    8904:	68 3c bf 00 00       	push   $0xbf3c
    8909:	6a 01                	push   $0x1
    890b:	e8 57 32 00 00       	call   bb67 <printf>
    8910:	83 c3 01             	add    $0x1,%ebx
    8913:	83 c4 10             	add    $0x10,%esp
    8916:	eb 05                	jmp    891d <test_cant_grow_over_mem_limit+0x4f>
    8918:	bb 00 00 00 00       	mov    $0x0,%ebx
    891d:	83 ec 0c             	sub    $0xc,%esp
    8920:	68 5f c5 00 00       	push   $0xc55f
    8925:	e8 d9 2d 00 00       	call   b703 <strlen>
    892a:	89 c7                	mov    %eax,%edi
    892c:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8933:	e8 cb 2d 00 00       	call   b703 <strlen>
    8938:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    893c:	83 c4 10             	add    $0x10,%esp
    893f:	39 d8                	cmp    %ebx,%eax
    8941:	77 be                	ja     8901 <test_cant_grow_over_mem_limit+0x33>
    8943:	83 ec 0c             	sub    $0xc,%esp
    8946:	68 e8 04 00 00       	push   $0x4e8
    894b:	68 f9 bf 00 00       	push   $0xbff9
    8950:	56                   	push   %esi
    8951:	68 54 f5 00 00       	push   $0xf554
    8956:	6a 01                	push   $0x1
    8958:	e8 0a 32 00 00       	call   bb67 <printf>
    895d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8964:	00 00 00 
    8967:	83 c4 20             	add    $0x20,%esp
    896a:	e9 90 03 00 00       	jmp    8cff <test_cant_grow_over_mem_limit+0x431>

  // Update memory limit
  ASSERT_TRUE(write_file(TEST_1_MEM_MAX, proc_mem));
    896f:	83 ec 08             	sub    $0x8,%esp
    8972:	8d 45 de             	lea    -0x22(%ebp),%eax
    8975:	50                   	push   %eax
    8976:	68 20 c2 00 00       	push   $0xc220
    897b:	e8 ce 78 ff ff       	call   24e <write_file>
    8980:	83 c4 10             	add    $0x10,%esp
    8983:	85 c0                	test   %eax,%eax
    8985:	74 19                	je     89a0 <test_cant_grow_over_mem_limit+0xd2>
    8987:	eb 6e                	jmp    89f7 <test_cant_grow_over_mem_limit+0x129>
    8989:	83 ec 08             	sub    $0x8,%esp
    898c:	68 3c bf 00 00       	push   $0xbf3c
    8991:	6a 01                	push   $0x1
    8993:	e8 cf 31 00 00       	call   bb67 <printf>
    8998:	83 c3 01             	add    $0x1,%ebx
    899b:	83 c4 10             	add    $0x10,%esp
    899e:	eb 05                	jmp    89a5 <test_cant_grow_over_mem_limit+0xd7>
    89a0:	bb 00 00 00 00       	mov    $0x0,%ebx
    89a5:	83 ec 0c             	sub    $0xc,%esp
    89a8:	68 c8 09 01 00       	push   $0x109c8
    89ad:	e8 51 2d 00 00       	call   b703 <strlen>
    89b2:	89 c7                	mov    %eax,%edi
    89b4:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    89bb:	e8 43 2d 00 00       	call   b703 <strlen>
    89c0:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    89c4:	83 c4 10             	add    $0x10,%esp
    89c7:	39 d8                	cmp    %ebx,%eax
    89c9:	77 be                	ja     8989 <test_cant_grow_over_mem_limit+0xbb>
    89cb:	83 ec 0c             	sub    $0xc,%esp
    89ce:	68 eb 04 00 00       	push   $0x4eb
    89d3:	68 f9 bf 00 00       	push   $0xbff9
    89d8:	56                   	push   %esi
    89d9:	68 f0 09 01 00       	push   $0x109f0
    89de:	6a 01                	push   $0x1
    89e0:	e8 82 31 00 00       	call   bb67 <printf>
    89e5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    89ec:	00 00 00 
    89ef:	83 c4 20             	add    $0x20,%esp
    89f2:	e9 08 03 00 00       	jmp    8cff <test_cant_grow_over_mem_limit+0x431>

  strcat(proc_mem, "\n");
    89f7:	83 ec 08             	sub    $0x8,%esp
    89fa:	68 05 c8 00 00       	push   $0xc805
    89ff:	8d 7d de             	lea    -0x22(%ebp),%edi
    8a02:	57                   	push   %edi
    8a03:	e8 ce 2e 00 00       	call   b8d6 <strcat>

  // Read the contents of limit file and convert it for comparison.
  strcpy(saved_mem, read_file(TEST_1_MEM_MAX, 0));
    8a08:	83 c4 08             	add    $0x8,%esp
    8a0b:	6a 00                	push   $0x0
    8a0d:	68 20 c2 00 00       	push   $0xc220
    8a12:	e8 85 77 ff ff       	call   19c <read_file>
    8a17:	83 c4 08             	add    $0x8,%esp
    8a1a:	50                   	push   %eax
    8a1b:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
    8a1e:	53                   	push   %ebx
    8a1f:	e8 6b 2c 00 00       	call   b68f <strcpy>

  // Check changes
  ASSERT_FALSE(strcmp(saved_mem, proc_mem));
    8a24:	83 c4 08             	add    $0x8,%esp
    8a27:	57                   	push   %edi
    8a28:	53                   	push   %ebx
    8a29:	e8 7f 2c 00 00       	call   b6ad <strcmp>
    8a2e:	83 c4 10             	add    $0x10,%esp
    8a31:	85 c0                	test   %eax,%eax
    8a33:	75 19                	jne    8a4e <test_cant_grow_over_mem_limit+0x180>
    8a35:	eb 6e                	jmp    8aa5 <test_cant_grow_over_mem_limit+0x1d7>
    8a37:	83 ec 08             	sub    $0x8,%esp
    8a3a:	68 3c bf 00 00       	push   $0xbf3c
    8a3f:	6a 01                	push   $0x1
    8a41:	e8 21 31 00 00       	call   bb67 <printf>
    8a46:	83 c3 01             	add    $0x1,%ebx
    8a49:	83 c4 10             	add    $0x10,%esp
    8a4c:	eb 05                	jmp    8a53 <test_cant_grow_over_mem_limit+0x185>
    8a4e:	bb 00 00 00 00       	mov    $0x0,%ebx
    8a53:	83 ec 0c             	sub    $0xc,%esp
    8a56:	68 43 c5 00 00       	push   $0xc543
    8a5b:	e8 a3 2c 00 00       	call   b703 <strlen>
    8a60:	89 c7                	mov    %eax,%edi
    8a62:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8a69:	e8 95 2c 00 00       	call   b703 <strlen>
    8a6e:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8a72:	83 c4 10             	add    $0x10,%esp
    8a75:	39 d8                	cmp    %ebx,%eax
    8a77:	77 be                	ja     8a37 <test_cant_grow_over_mem_limit+0x169>
    8a79:	83 ec 0c             	sub    $0xc,%esp
    8a7c:	68 f3 04 00 00       	push   $0x4f3
    8a81:	68 f9 bf 00 00       	push   $0xbff9
    8a86:	56                   	push   %esi
    8a87:	68 0c f5 00 00       	push   $0xf50c
    8a8c:	6a 01                	push   $0x1
    8a8e:	e8 d4 30 00 00       	call   bb67 <printf>
    8a93:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8a9a:	00 00 00 
    8a9d:	83 c4 20             	add    $0x20,%esp
    8aa0:	e9 5a 02 00 00       	jmp    8cff <test_cant_grow_over_mem_limit+0x431>

  // Move the current process to "/cgroup/test1" cgroup.
  ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, getpid()));
    8aa5:	e8 4c 2f 00 00       	call   b9f6 <getpid>
    8aaa:	83 ec 08             	sub    $0x8,%esp
    8aad:	50                   	push   %eax
    8aae:	68 06 c1 00 00       	push   $0xc106
    8ab3:	e8 7f 7a ff ff       	call   537 <move_proc>
    8ab8:	83 c4 10             	add    $0x10,%esp
    8abb:	85 c0                	test   %eax,%eax
    8abd:	74 19                	je     8ad8 <test_cant_grow_over_mem_limit+0x20a>
    8abf:	eb 6e                	jmp    8b2f <test_cant_grow_over_mem_limit+0x261>
    8ac1:	83 ec 08             	sub    $0x8,%esp
    8ac4:	68 3c bf 00 00       	push   $0xbf3c
    8ac9:	6a 01                	push   $0x1
    8acb:	e8 97 30 00 00       	call   bb67 <printf>
    8ad0:	83 c3 01             	add    $0x1,%ebx
    8ad3:	83 c4 10             	add    $0x10,%esp
    8ad6:	eb 05                	jmp    8add <test_cant_grow_over_mem_limit+0x20f>
    8ad8:	bb 00 00 00 00       	mov    $0x0,%ebx
    8add:	83 ec 0c             	sub    $0xc,%esp
    8ae0:	68 90 e3 00 00       	push   $0xe390
    8ae5:	e8 19 2c 00 00       	call   b703 <strlen>
    8aea:	89 c7                	mov    %eax,%edi
    8aec:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8af3:	e8 0b 2c 00 00       	call   b703 <strlen>
    8af8:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8afc:	83 c4 10             	add    $0x10,%esp
    8aff:	39 d8                	cmp    %ebx,%eax
    8b01:	77 be                	ja     8ac1 <test_cant_grow_over_mem_limit+0x1f3>
    8b03:	83 ec 0c             	sub    $0xc,%esp
    8b06:	68 f6 04 00 00       	push   $0x4f6
    8b0b:	68 f9 bf 00 00       	push   $0xbff9
    8b10:	56                   	push   %esi
    8b11:	68 d4 e5 00 00       	push   $0xe5d4
    8b16:	6a 01                	push   $0x1
    8b18:	e8 4a 30 00 00       	call   bb67 <printf>
    8b1d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8b24:	00 00 00 
    8b27:	83 c4 20             	add    $0x20,%esp
    8b2a:	e9 d0 01 00 00       	jmp    8cff <test_cant_grow_over_mem_limit+0x431>

  // Attempt to grow process memory, notice this operation should fail and return -1.
  ASSERT_UINT_EQ((int)sbrk(10), -1);
    8b2f:	83 ec 0c             	sub    $0xc,%esp
    8b32:	6a 0a                	push   $0xa
    8b34:	e8 c5 2e 00 00       	call   b9fe <sbrk>
    8b39:	83 c4 10             	add    $0x10,%esp
    8b3c:	83 f8 ff             	cmp    $0xffffffff,%eax
    8b3f:	74 31                	je     8b72 <test_cant_grow_over_mem_limit+0x2a4>
    8b41:	83 ec 0c             	sub    $0xc,%esp
    8b44:	6a 0a                	push   $0xa
    8b46:	e8 b3 2e 00 00       	call   b9fe <sbrk>
    8b4b:	c7 04 24 f9 04 00 00 	movl   $0x4f9,(%esp)
    8b52:	68 f9 bf 00 00       	push   $0xbff9
    8b57:	6a ff                	push   $0xffffffff
    8b59:	50                   	push   %eax
    8b5a:	56                   	push   %esi
    8b5b:	e8 b4 74 ff ff       	call   14 <print_error>
    8b60:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8b67:	00 00 00 
    8b6a:	83 c4 20             	add    $0x20,%esp
    8b6d:	e9 8d 01 00 00       	jmp    8cff <test_cant_grow_over_mem_limit+0x431>

  // Return the process to root cgroup.
  ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, getpid()));
    8b72:	e8 7f 2e 00 00       	call   b9f6 <getpid>
    8b77:	83 ec 08             	sub    $0x8,%esp
    8b7a:	50                   	push   %eax
    8b7b:	68 09 c4 00 00       	push   $0xc409
    8b80:	e8 b2 79 ff ff       	call   537 <move_proc>
    8b85:	83 c4 10             	add    $0x10,%esp
    8b88:	85 c0                	test   %eax,%eax
    8b8a:	74 19                	je     8ba5 <test_cant_grow_over_mem_limit+0x2d7>
    8b8c:	eb 6e                	jmp    8bfc <test_cant_grow_over_mem_limit+0x32e>
    8b8e:	83 ec 08             	sub    $0x8,%esp
    8b91:	68 3c bf 00 00       	push   $0xbf3c
    8b96:	6a 01                	push   $0x1
    8b98:	e8 ca 2f 00 00       	call   bb67 <printf>
    8b9d:	83 c3 01             	add    $0x1,%ebx
    8ba0:	83 c4 10             	add    $0x10,%esp
    8ba3:	eb 05                	jmp    8baa <test_cant_grow_over_mem_limit+0x2dc>
    8ba5:	bb 00 00 00 00       	mov    $0x0,%ebx
    8baa:	83 ec 0c             	sub    $0xc,%esp
    8bad:	68 80 e6 00 00       	push   $0xe680
    8bb2:	e8 4c 2b 00 00       	call   b703 <strlen>
    8bb7:	89 c7                	mov    %eax,%edi
    8bb9:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8bc0:	e8 3e 2b 00 00       	call   b703 <strlen>
    8bc5:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8bc9:	83 c4 10             	add    $0x10,%esp
    8bcc:	39 d8                	cmp    %ebx,%eax
    8bce:	77 be                	ja     8b8e <test_cant_grow_over_mem_limit+0x2c0>
    8bd0:	83 ec 0c             	sub    $0xc,%esp
    8bd3:	68 fc 04 00 00       	push   $0x4fc
    8bd8:	68 f9 bf 00 00       	push   $0xbff9
    8bdd:	56                   	push   %esi
    8bde:	68 a8 e6 00 00       	push   $0xe6a8
    8be3:	6a 01                	push   $0x1
    8be5:	e8 7d 2f 00 00       	call   bb67 <printf>
    8bea:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8bf1:	00 00 00 
    8bf4:	83 c4 20             	add    $0x20,%esp
    8bf7:	e9 03 01 00 00       	jmp    8cff <test_cant_grow_over_mem_limit+0x431>

  // Check that the process we returned is really in root cgroup.
  ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, getpid()));
    8bfc:	e8 f5 2d 00 00       	call   b9f6 <getpid>
    8c01:	83 ec 08             	sub    $0x8,%esp
    8c04:	50                   	push   %eax
    8c05:	68 09 c4 00 00       	push   $0xc409
    8c0a:	e8 5b 79 ff ff       	call   56a <is_pid_in_group>
    8c0f:	83 c4 10             	add    $0x10,%esp
    8c12:	85 c0                	test   %eax,%eax
    8c14:	74 19                	je     8c2f <test_cant_grow_over_mem_limit+0x361>
    8c16:	eb 6b                	jmp    8c83 <test_cant_grow_over_mem_limit+0x3b5>
    8c18:	83 ec 08             	sub    $0x8,%esp
    8c1b:	68 3c bf 00 00       	push   $0xbf3c
    8c20:	6a 01                	push   $0x1
    8c22:	e8 40 2f 00 00       	call   bb67 <printf>
    8c27:	83 c3 01             	add    $0x1,%ebx
    8c2a:	83 c4 10             	add    $0x10,%esp
    8c2d:	eb 05                	jmp    8c34 <test_cant_grow_over_mem_limit+0x366>
    8c2f:	bb 00 00 00 00       	mov    $0x0,%ebx
    8c34:	83 ec 0c             	sub    $0xc,%esp
    8c37:	68 98 e4 00 00       	push   $0xe498
    8c3c:	e8 c2 2a 00 00       	call   b703 <strlen>
    8c41:	89 c7                	mov    %eax,%edi
    8c43:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8c4a:	e8 b4 2a 00 00       	call   b703 <strlen>
    8c4f:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8c53:	83 c4 10             	add    $0x10,%esp
    8c56:	39 d8                	cmp    %ebx,%eax
    8c58:	77 be                	ja     8c18 <test_cant_grow_over_mem_limit+0x34a>
    8c5a:	83 ec 0c             	sub    $0xc,%esp
    8c5d:	68 ff 04 00 00       	push   $0x4ff
    8c62:	68 f9 bf 00 00       	push   $0xbff9
    8c67:	56                   	push   %esi
    8c68:	68 c8 e4 00 00       	push   $0xe4c8
    8c6d:	6a 01                	push   $0x1
    8c6f:	e8 f3 2e 00 00       	call   bb67 <printf>
    8c74:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8c7b:	00 00 00 
    8c7e:	83 c4 20             	add    $0x20,%esp
    8c81:	eb 7c                	jmp    8cff <test_cant_grow_over_mem_limit+0x431>

  // Disable memory controller
  ASSERT_TRUE(disable_controller(MEM_CNT));
    8c83:	83 ec 0c             	sub    $0xc,%esp
    8c86:	6a 03                	push   $0x3
    8c88:	e8 28 77 ff ff       	call   3b5 <disable_controller>
    8c8d:	83 c4 10             	add    $0x10,%esp
    8c90:	85 c0                	test   %eax,%eax
    8c92:	74 19                	je     8cad <test_cant_grow_over_mem_limit+0x3df>
    8c94:	eb 69                	jmp    8cff <test_cant_grow_over_mem_limit+0x431>
    8c96:	83 ec 08             	sub    $0x8,%esp
    8c99:	68 3c bf 00 00       	push   $0xbf3c
    8c9e:	6a 01                	push   $0x1
    8ca0:	e8 c2 2e 00 00       	call   bb67 <printf>
    8ca5:	83 c3 01             	add    $0x1,%ebx
    8ca8:	83 c4 10             	add    $0x10,%esp
    8cab:	eb 05                	jmp    8cb2 <test_cant_grow_over_mem_limit+0x3e4>
    8cad:	bb 00 00 00 00       	mov    $0x0,%ebx
    8cb2:	83 ec 0c             	sub    $0xc,%esp
    8cb5:	68 91 c5 00 00       	push   $0xc591
    8cba:	e8 44 2a 00 00       	call   b703 <strlen>
    8cbf:	89 c7                	mov    %eax,%edi
    8cc1:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8cc8:	e8 36 2a 00 00       	call   b703 <strlen>
    8ccd:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    8cd1:	83 c4 10             	add    $0x10,%esp
    8cd4:	39 d8                	cmp    %ebx,%eax
    8cd6:	77 be                	ja     8c96 <test_cant_grow_over_mem_limit+0x3c8>
    8cd8:	83 ec 0c             	sub    $0xc,%esp
    8cdb:	68 02 05 00 00       	push   $0x502
    8ce0:	68 f9 bf 00 00       	push   $0xbff9
    8ce5:	56                   	push   %esi
    8ce6:	68 90 f8 00 00       	push   $0xf890
    8ceb:	6a 01                	push   $0x1
    8ced:	e8 75 2e 00 00       	call   bb67 <printf>
    8cf2:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8cf9:	00 00 00 
    8cfc:	83 c4 20             	add    $0x20,%esp
}
    8cff:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8d02:	5b                   	pop    %ebx
    8d03:	5e                   	pop    %esi
    8d04:	5f                   	pop    %edi
    8d05:	5d                   	pop    %ebp
    8d06:	c3                   	ret    

00008d07 <test_memory_stat_content_valid>:

TEST(test_memory_stat_content_valid)
{
    8d07:	55                   	push   %ebp
    8d08:	89 e5                	mov    %esp,%ebp
    8d0a:	57                   	push   %edi
    8d0b:	56                   	push   %esi
    8d0c:	53                   	push   %ebx
    8d0d:	81 ec 34 01 00 00    	sub    $0x134,%esp
    char buf[265];
    strcpy(buf, read_file(TEST_1_MEM_STAT, 0));
    8d13:	6a 00                	push   $0x0
    8d15:	68 52 c2 00 00       	push   $0xc252
    8d1a:	e8 7d 74 ff ff       	call   19c <read_file>
    8d1f:	83 c4 08             	add    $0x8,%esp
    8d22:	50                   	push   %eax
    8d23:	8d 9d df fe ff ff    	lea    -0x121(%ebp),%ebx
    8d29:	53                   	push   %ebx
    8d2a:	e8 60 29 00 00       	call   b68f <strcpy>
    int file_dirty = get_val(buf, "file_dirty - ");
    8d2f:	83 c4 08             	add    $0x8,%esp
    8d32:	68 67 c6 00 00       	push   $0xc667
    8d37:	53                   	push   %ebx
    8d38:	e8 bb 79 ff ff       	call   6f8 <get_val>
    8d3d:	89 c6                	mov    %eax,%esi
    int file_dirty_aggregated = get_val(buf, "file_dirty_aggregated - ");
    8d3f:	83 c4 08             	add    $0x8,%esp
    8d42:	68 75 c6 00 00       	push   $0xc675
    8d47:	53                   	push   %ebx
    8d48:	e8 ab 79 ff ff       	call   6f8 <get_val>
    8d4d:	89 c7                	mov    %eax,%edi
    int pgfault = get_val(buf, "pgfault - ");
    8d4f:	83 c4 08             	add    $0x8,%esp
    8d52:	68 8e c6 00 00       	push   $0xc68e
    8d57:	53                   	push   %ebx
    8d58:	e8 9b 79 ff ff       	call   6f8 <get_val>
    8d5d:	89 85 d4 fe ff ff    	mov    %eax,-0x12c(%ebp)
    int pgmajfault = get_val(buf, "file_dirty - ");
    8d63:	83 c4 08             	add    $0x8,%esp
    8d66:	68 67 c6 00 00       	push   $0xc667
    8d6b:	53                   	push   %ebx
    8d6c:	e8 87 79 ff ff       	call   6f8 <get_val>
    ASSERT_UINT_EQ(file_dirty, 0);
    8d71:	83 c4 10             	add    $0x10,%esp
    8d74:	85 f6                	test   %esi,%esi
    8d76:	74 2a                	je     8da2 <test_memory_stat_content_valid+0x9b>
    8d78:	83 ec 0c             	sub    $0xc,%esp
    8d7b:	68 0d 05 00 00       	push   $0x50d
    8d80:	68 f9 bf 00 00       	push   $0xbff9
    8d85:	6a 00                	push   $0x0
    8d87:	56                   	push   %esi
    8d88:	ff 75 08             	pushl  0x8(%ebp)
    8d8b:	e8 84 72 ff ff       	call   14 <print_error>
    8d90:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8d97:	00 00 00 
    8d9a:	83 c4 20             	add    $0x20,%esp
    8d9d:	e9 89 00 00 00       	jmp    8e2b <test_memory_stat_content_valid+0x124>
    ASSERT_UINT_EQ(file_dirty_aggregated, 0);
    8da2:	85 ff                	test   %edi,%edi
    8da4:	74 27                	je     8dcd <test_memory_stat_content_valid+0xc6>
    8da6:	83 ec 0c             	sub    $0xc,%esp
    8da9:	68 0e 05 00 00       	push   $0x50e
    8dae:	68 f9 bf 00 00       	push   $0xbff9
    8db3:	6a 00                	push   $0x0
    8db5:	57                   	push   %edi
    8db6:	ff 75 08             	pushl  0x8(%ebp)
    8db9:	e8 56 72 ff ff       	call   14 <print_error>
    8dbe:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8dc5:	00 00 00 
    8dc8:	83 c4 20             	add    $0x20,%esp
    8dcb:	eb 5e                	jmp    8e2b <test_memory_stat_content_valid+0x124>
    ASSERT_UINT_EQ(pgfault, 0);
    8dcd:	83 bd d4 fe ff ff 00 	cmpl   $0x0,-0x12c(%ebp)
    8dd4:	74 2c                	je     8e02 <test_memory_stat_content_valid+0xfb>
    8dd6:	83 ec 0c             	sub    $0xc,%esp
    8dd9:	68 0f 05 00 00       	push   $0x50f
    8dde:	68 f9 bf 00 00       	push   $0xbff9
    8de3:	6a 00                	push   $0x0
    8de5:	ff b5 d4 fe ff ff    	pushl  -0x12c(%ebp)
    8deb:	ff 75 08             	pushl  0x8(%ebp)
    8dee:	e8 21 72 ff ff       	call   14 <print_error>
    8df3:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8dfa:	00 00 00 
    8dfd:	83 c4 20             	add    $0x20,%esp
    8e00:	eb 29                	jmp    8e2b <test_memory_stat_content_valid+0x124>
    ASSERT_UINT_EQ(pgmajfault, 0);
    8e02:	85 c0                	test   %eax,%eax
    8e04:	74 25                	je     8e2b <test_memory_stat_content_valid+0x124>
    8e06:	83 ec 0c             	sub    $0xc,%esp
    8e09:	68 10 05 00 00       	push   $0x510
    8e0e:	68 f9 bf 00 00       	push   $0xbff9
    8e13:	6a 00                	push   $0x0
    8e15:	50                   	push   %eax
    8e16:	ff 75 08             	pushl  0x8(%ebp)
    8e19:	e8 f6 71 ff ff       	call   14 <print_error>
    8e1e:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8e25:	00 00 00 
    8e28:	83 c4 20             	add    $0x20,%esp
}
    8e2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8e2e:	5b                   	pop    %ebx
    8e2f:	5e                   	pop    %esi
    8e30:	5f                   	pop    %edi
    8e31:	5d                   	pop    %ebp
    8e32:	c3                   	ret    

00008e33 <test_kernel_freem_mem>:

TEST(test_kernel_freem_mem)
{
    8e33:	55                   	push   %ebp
    8e34:	89 e5                	mov    %esp,%ebp
    8e36:	56                   	push   %esi
    8e37:	53                   	push   %ebx
  ASSERT_FALSE(kmemtest());
    8e38:	e8 29 2c 00 00       	call   ba66 <kmemtest>
    8e3d:	85 c0                	test   %eax,%eax
    8e3f:	75 19                	jne    8e5a <test_kernel_freem_mem+0x27>
    8e41:	eb 6b                	jmp    8eae <test_kernel_freem_mem+0x7b>
    8e43:	83 ec 08             	sub    $0x8,%esp
    8e46:	68 3c bf 00 00       	push   $0xbf3c
    8e4b:	6a 01                	push   $0x1
    8e4d:	e8 15 2d 00 00       	call   bb67 <printf>
    8e52:	83 c3 01             	add    $0x1,%ebx
    8e55:	83 c4 10             	add    $0x10,%esp
    8e58:	eb 05                	jmp    8e5f <test_kernel_freem_mem+0x2c>
    8e5a:	bb 00 00 00 00       	mov    $0x0,%ebx
    8e5f:	83 ec 0c             	sub    $0xc,%esp
    8e62:	68 99 c6 00 00       	push   $0xc699
    8e67:	e8 97 28 00 00       	call   b703 <strlen>
    8e6c:	89 c6                	mov    %eax,%esi
    8e6e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    8e75:	e8 89 28 00 00       	call   b703 <strlen>
    8e7a:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    8e7e:	83 c4 10             	add    $0x10,%esp
    8e81:	39 d8                	cmp    %ebx,%eax
    8e83:	77 be                	ja     8e43 <test_kernel_freem_mem+0x10>
    8e85:	83 ec 0c             	sub    $0xc,%esp
    8e88:	68 15 05 00 00       	push   $0x515
    8e8d:	68 f9 bf 00 00       	push   $0xbff9
    8e92:	ff 75 08             	pushl  0x8(%ebp)
    8e95:	68 40 0a 01 00       	push   $0x10a40
    8e9a:	6a 01                	push   $0x1
    8e9c:	e8 c6 2c 00 00       	call   bb67 <printf>
    8ea1:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8ea8:	00 00 00 
    8eab:	83 c4 20             	add    $0x20,%esp
}
    8eae:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8eb1:	5b                   	pop    %ebx
    8eb2:	5e                   	pop    %esi
    8eb3:	5d                   	pop    %ebp
    8eb4:	c3                   	ret    

00008eb5 <test_cpu_stat_content_valid>:

TEST(test_cpu_stat_content_valid)
{
    8eb5:	55                   	push   %ebp
    8eb6:	89 e5                	mov    %esp,%ebp
    8eb8:	57                   	push   %edi
    8eb9:	56                   	push   %esi
    8eba:	53                   	push   %ebx
    8ebb:	81 ec 24 01 00 00    	sub    $0x124,%esp
    char buf[265];
    strcpy(buf, read_file(TEST_1_CPU_STAT, 0));
    8ec1:	6a 00                	push   $0x0
    8ec3:	68 86 c1 00 00       	push   $0xc186
    8ec8:	e8 cf 72 ff ff       	call   19c <read_file>
    8ecd:	83 c4 08             	add    $0x8,%esp
    8ed0:	50                   	push   %eax
    8ed1:	8d 9d df fe ff ff    	lea    -0x121(%ebp),%ebx
    8ed7:	53                   	push   %ebx
    8ed8:	e8 b2 27 00 00       	call   b68f <strcpy>
    int usage_usec = get_val(buf, "usage_usec - ");
    8edd:	83 c4 08             	add    $0x8,%esp
    8ee0:	68 a4 c6 00 00       	push   $0xc6a4
    8ee5:	53                   	push   %ebx
    8ee6:	e8 0d 78 ff ff       	call   6f8 <get_val>
    8eeb:	89 c6                	mov    %eax,%esi
    int user_usec = get_val(buf, "user_usec - ");
    8eed:	83 c4 08             	add    $0x8,%esp
    8ef0:	68 b2 c6 00 00       	push   $0xc6b2
    8ef5:	53                   	push   %ebx
    8ef6:	e8 fd 77 ff ff       	call   6f8 <get_val>
    8efb:	89 c7                	mov    %eax,%edi
    int system_usec = get_val(buf, "system_usec - ");
    8efd:	83 c4 08             	add    $0x8,%esp
    8f00:	68 bf c6 00 00       	push   $0xc6bf
    8f05:	53                   	push   %ebx
    8f06:	e8 ed 77 ff ff       	call   6f8 <get_val>
    ASSERT_UINT_EQ(usage_usec, 0);
    8f0b:	83 c4 10             	add    $0x10,%esp
    8f0e:	85 f6                	test   %esi,%esi
    8f10:	74 27                	je     8f39 <test_cpu_stat_content_valid+0x84>
    8f12:	83 ec 0c             	sub    $0xc,%esp
    8f15:	68 1f 05 00 00       	push   $0x51f
    8f1a:	68 f9 bf 00 00       	push   $0xbff9
    8f1f:	6a 00                	push   $0x0
    8f21:	56                   	push   %esi
    8f22:	ff 75 08             	pushl  0x8(%ebp)
    8f25:	e8 ea 70 ff ff       	call   14 <print_error>
    8f2a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8f31:	00 00 00 
    8f34:	83 c4 20             	add    $0x20,%esp
    8f37:	eb 54                	jmp    8f8d <test_cpu_stat_content_valid+0xd8>
    ASSERT_UINT_EQ(user_usec, 0);
    8f39:	85 ff                	test   %edi,%edi
    8f3b:	74 27                	je     8f64 <test_cpu_stat_content_valid+0xaf>
    8f3d:	83 ec 0c             	sub    $0xc,%esp
    8f40:	68 20 05 00 00       	push   $0x520
    8f45:	68 f9 bf 00 00       	push   $0xbff9
    8f4a:	6a 00                	push   $0x0
    8f4c:	57                   	push   %edi
    8f4d:	ff 75 08             	pushl  0x8(%ebp)
    8f50:	e8 bf 70 ff ff       	call   14 <print_error>
    8f55:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8f5c:	00 00 00 
    8f5f:	83 c4 20             	add    $0x20,%esp
    8f62:	eb 29                	jmp    8f8d <test_cpu_stat_content_valid+0xd8>
    ASSERT_UINT_EQ(system_usec, 0);
    8f64:	85 c0                	test   %eax,%eax
    8f66:	74 25                	je     8f8d <test_cpu_stat_content_valid+0xd8>
    8f68:	83 ec 0c             	sub    $0xc,%esp
    8f6b:	68 21 05 00 00       	push   $0x521
    8f70:	68 f9 bf 00 00       	push   $0xbff9
    8f75:	6a 00                	push   $0x0
    8f77:	50                   	push   %eax
    8f78:	ff 75 08             	pushl  0x8(%ebp)
    8f7b:	e8 94 70 ff ff       	call   14 <print_error>
    8f80:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    8f87:	00 00 00 
    8f8a:	83 c4 20             	add    $0x20,%esp
}
    8f8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8f90:	5b                   	pop    %ebx
    8f91:	5e                   	pop    %esi
    8f92:	5f                   	pop    %edi
    8f93:	5d                   	pop    %ebp
    8f94:	c3                   	ret    

00008f95 <test_cpu_stat>:

TEST(test_cpu_stat)
{
    8f95:	55                   	push   %ebp
    8f96:	89 e5                	mov    %esp,%ebp
    8f98:	57                   	push   %edi
    8f99:	56                   	push   %esi
    8f9a:	53                   	push   %ebx
    8f9b:	81 ec 34 03 00 00    	sub    $0x334,%esp
    8fa1:	8b 75 08             	mov    0x8(%ebp),%esi
    char buf1[265];
    char buf2[265];
    char buf3[265];

    // read cpu.stat into a buffer
    strcpy(buf1, read_file(TEST_1_CPU_STAT,0));
    8fa4:	6a 00                	push   $0x0
    8fa6:	68 86 c1 00 00       	push   $0xc186
    8fab:	e8 ec 71 ff ff       	call   19c <read_file>
    8fb0:	83 c4 08             	add    $0x8,%esp
    8fb3:	50                   	push   %eax
    8fb4:	8d 85 df fe ff ff    	lea    -0x121(%ebp),%eax
    8fba:	50                   	push   %eax
    8fbb:	e8 cf 26 00 00       	call   b68f <strcpy>

    // Fork here since the process should not be running after we move it inside the cgroup.
    int pid = fork();
    8fc0:	e8 a9 29 00 00       	call   b96e <fork>
    int pidToMove = 0;
    int sum = 0;
    int wstatus;

    // Child
    if (pid == 0) {
    8fc5:	83 c4 10             	add    $0x10,%esp
    8fc8:	85 c0                	test   %eax,%eax
    8fca:	75 55                	jne    9021 <test_cpu_stat+0x8c>
        pidToMove = getpid();
    8fcc:	e8 25 2a 00 00       	call   b9f6 <getpid>

        // Save the pid of child in temp file.
        temp_write(pidToMove);
    8fd1:	83 ec 0c             	sub    $0xc,%esp
    8fd4:	50                   	push   %eax
    8fd5:	e8 30 76 ff ff       	call   60a <temp_write>

        // Go to sleep for long period of time.
        sleep(10);
    8fda:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    8fe1:	e8 20 2a 00 00       	call   ba06 <sleep>

        // At this point, the child process should already be inside the cgroup.
        //By running the loop we ensure CPU usage which should be reflected in cpu.stst
        for (int i = 0; i < 10; i++) {
    8fe6:	83 c4 10             	add    $0x10,%esp
    8fe9:	ba 00 00 00 00       	mov    $0x0,%edx
    strcpy(buf1, read_file(TEST_1_CPU_STAT,0));

    // Fork here since the process should not be running after we move it inside the cgroup.
    int pid = fork();
    int pidToMove = 0;
    int sum = 0;
    8fee:	b8 00 00 00 00       	mov    $0x0,%eax
        // Go to sleep for long period of time.
        sleep(10);

        // At this point, the child process should already be inside the cgroup.
        //By running the loop we ensure CPU usage which should be reflected in cpu.stst
        for (int i = 0; i < 10; i++) {
    8ff3:	eb 06                	jmp    8ffb <test_cpu_stat+0x66>
            sum += 1;
    8ff5:	83 c0 01             	add    $0x1,%eax
        // Go to sleep for long period of time.
        sleep(10);

        // At this point, the child process should already be inside the cgroup.
        //By running the loop we ensure CPU usage which should be reflected in cpu.stst
        for (int i = 0; i < 10; i++) {
    8ff8:	83 c2 01             	add    $0x1,%edx
    8ffb:	83 fa 09             	cmp    $0x9,%edx
    8ffe:	7e f5                	jle    8ff5 <test_cpu_stat+0x60>
            sum += 1;
        }

        // Save sum into temp file.
        temp_write(sum);
    9000:	83 ec 0c             	sub    $0xc,%esp
    9003:	50                   	push   %eax
    9004:	e8 01 76 ff ff       	call   60a <temp_write>

        // Go to sleep to ensure we cen return the child to root cgroup
        sleep(25);
    9009:	c7 04 24 19 00 00 00 	movl   $0x19,(%esp)
    9010:	e8 f1 29 00 00       	call   ba06 <sleep>
        exit(0);
    9015:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    901c:	e8 55 29 00 00       	call   b976 <exit>
    }
    // Father
    else {
        sleep(5);
    9021:	83 ec 0c             	sub    $0xc,%esp
    9024:	6a 05                	push   $0x5
    9026:	e8 db 29 00 00       	call   ba06 <sleep>

        // Read the child pid from temp file.
        pidToMove = temp_read(0);
    902b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9032:	e8 6d 76 ff ff       	call   6a4 <temp_read>
    9037:	89 c3                	mov    %eax,%ebx

        // Update the temp file for further reading, since next sum will be read from it.
        ASSERT_TRUE(temp_write(0));
    9039:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9040:	e8 c5 75 ff ff       	call   60a <temp_write>
    9045:	83 c4 10             	add    $0x10,%esp
    9048:	85 c0                	test   %eax,%eax
    904a:	74 19                	je     9065 <test_cpu_stat+0xd0>
    904c:	eb 6e                	jmp    90bc <test_cpu_stat+0x127>
    904e:	83 ec 08             	sub    $0x8,%esp
    9051:	68 3c bf 00 00       	push   $0xbf3c
    9056:	6a 01                	push   $0x1
    9058:	e8 0a 2b 00 00       	call   bb67 <printf>
    905d:	83 c3 01             	add    $0x1,%ebx
    9060:	83 c4 10             	add    $0x10,%esp
    9063:	eb 05                	jmp    906a <test_cpu_stat+0xd5>
    9065:	bb 00 00 00 00       	mov    $0x0,%ebx
    906a:	83 ec 0c             	sub    $0xc,%esp
    906d:	68 c5 c4 00 00       	push   $0xc4c5
    9072:	e8 8c 26 00 00       	call   b703 <strlen>
    9077:	89 c7                	mov    %eax,%edi
    9079:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9080:	e8 7e 26 00 00       	call   b703 <strlen>
    9085:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    9089:	83 c4 10             	add    $0x10,%esp
    908c:	39 d8                	cmp    %ebx,%eax
    908e:	77 be                	ja     904e <test_cpu_stat+0xb9>
    9090:	83 ec 0c             	sub    $0xc,%esp
    9093:	68 53 05 00 00       	push   $0x553
    9098:	68 f9 bf 00 00       	push   $0xbff9
    909d:	56                   	push   %esi
    909e:	68 7c ee 00 00       	push   $0xee7c
    90a3:	6a 01                	push   $0x1
    90a5:	e8 bd 2a 00 00       	call   bb67 <printf>
    90aa:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    90b1:	00 00 00 
    90b4:	83 c4 20             	add    $0x20,%esp
    90b7:	e9 ac 04 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        // Move the child process to "/cgroup/test1" cgroup.
        ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, pidToMove));
    90bc:	83 ec 08             	sub    $0x8,%esp
    90bf:	53                   	push   %ebx
    90c0:	68 06 c1 00 00       	push   $0xc106
    90c5:	e8 6d 74 ff ff       	call   537 <move_proc>
    90ca:	83 c4 10             	add    $0x10,%esp
    90cd:	85 c0                	test   %eax,%eax
    90cf:	74 19                	je     90ea <test_cpu_stat+0x155>
    90d1:	eb 6e                	jmp    9141 <test_cpu_stat+0x1ac>
    90d3:	83 ec 08             	sub    $0x8,%esp
    90d6:	68 3c bf 00 00       	push   $0xbf3c
    90db:	6a 01                	push   $0x1
    90dd:	e8 85 2a 00 00       	call   bb67 <printf>
    90e2:	83 c3 01             	add    $0x1,%ebx
    90e5:	83 c4 10             	add    $0x10,%esp
    90e8:	eb 05                	jmp    90ef <test_cpu_stat+0x15a>
    90ea:	bb 00 00 00 00       	mov    $0x0,%ebx
    90ef:	83 ec 0c             	sub    $0xc,%esp
    90f2:	68 b4 ee 00 00       	push   $0xeeb4
    90f7:	e8 07 26 00 00       	call   b703 <strlen>
    90fc:	89 c7                	mov    %eax,%edi
    90fe:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9105:	e8 f9 25 00 00       	call   b703 <strlen>
    910a:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    910e:	83 c4 10             	add    $0x10,%esp
    9111:	39 d8                	cmp    %ebx,%eax
    9113:	77 be                	ja     90d3 <test_cpu_stat+0x13e>
    9115:	83 ec 0c             	sub    $0xc,%esp
    9118:	68 56 05 00 00       	push   $0x556
    911d:	68 f9 bf 00 00       	push   $0xbff9
    9122:	56                   	push   %esi
    9123:	68 e0 ee 00 00       	push   $0xeee0
    9128:	6a 01                	push   $0x1
    912a:	e8 38 2a 00 00       	call   bb67 <printf>
    912f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9136:	00 00 00 
    9139:	83 c4 20             	add    $0x20,%esp
    913c:	e9 27 04 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        // Check that the process we moved is really in "/cgroup/test1" cgroup.
        ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, pidToMove));
    9141:	83 ec 08             	sub    $0x8,%esp
    9144:	53                   	push   %ebx
    9145:	68 06 c1 00 00       	push   $0xc106
    914a:	e8 1b 74 ff ff       	call   56a <is_pid_in_group>
    914f:	83 c4 10             	add    $0x10,%esp
    9152:	85 c0                	test   %eax,%eax
    9154:	74 19                	je     916f <test_cpu_stat+0x1da>
    9156:	eb 6e                	jmp    91c6 <test_cpu_stat+0x231>
    9158:	83 ec 08             	sub    $0x8,%esp
    915b:	68 3c bf 00 00       	push   $0xbf3c
    9160:	6a 01                	push   $0x1
    9162:	e8 00 2a 00 00       	call   bb67 <printf>
    9167:	83 c3 01             	add    $0x1,%ebx
    916a:	83 c4 10             	add    $0x10,%esp
    916d:	eb 05                	jmp    9174 <test_cpu_stat+0x1df>
    916f:	bb 00 00 00 00       	mov    $0x0,%ebx
    9174:	83 ec 0c             	sub    $0xc,%esp
    9177:	68 34 ef 00 00       	push   $0xef34
    917c:	e8 82 25 00 00       	call   b703 <strlen>
    9181:	89 c7                	mov    %eax,%edi
    9183:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    918a:	e8 74 25 00 00       	call   b703 <strlen>
    918f:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    9193:	83 c4 10             	add    $0x10,%esp
    9196:	39 d8                	cmp    %ebx,%eax
    9198:	77 be                	ja     9158 <test_cpu_stat+0x1c3>
    919a:	83 ec 0c             	sub    $0xc,%esp
    919d:	68 59 05 00 00       	push   $0x559
    91a2:	68 f9 bf 00 00       	push   $0xbff9
    91a7:	56                   	push   %esi
    91a8:	68 64 ef 00 00       	push   $0xef64
    91ad:	6a 01                	push   $0x1
    91af:	e8 b3 29 00 00       	call   bb67 <printf>
    91b4:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    91bb:	00 00 00 
    91be:	83 c4 20             	add    $0x20,%esp
    91c1:	e9 a2 03 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        // Go to sleep to ensure the child process had a chance to be scheduled.
        sleep(15);
    91c6:	83 ec 0c             	sub    $0xc,%esp
    91c9:	6a 0f                	push   $0xf
    91cb:	e8 36 28 00 00       	call   ba06 <sleep>

        // Verify that the child process have ran
        sum = temp_read(0);
    91d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    91d7:	e8 c8 74 ff ff       	call   6a4 <temp_read>
        ASSERT_UINT_EQ(sum, 10);
    91dc:	83 c4 10             	add    $0x10,%esp
    91df:	83 f8 0a             	cmp    $0xa,%eax
    91e2:	74 28                	je     920c <test_cpu_stat+0x277>
    91e4:	83 ec 0c             	sub    $0xc,%esp
    91e7:	68 60 05 00 00       	push   $0x560
    91ec:	68 f9 bf 00 00       	push   $0xbff9
    91f1:	6a 0a                	push   $0xa
    91f3:	50                   	push   %eax
    91f4:	56                   	push   %esi
    91f5:	e8 1a 6e ff ff       	call   14 <print_error>
    91fa:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9201:	00 00 00 
    9204:	83 c4 20             	add    $0x20,%esp
    9207:	e9 5c 03 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        // Return the child to root cgroup.
        ASSERT_TRUE(move_proc(ROOT_CGROUP_PROCS, pidToMove));
    920c:	83 ec 08             	sub    $0x8,%esp
    920f:	53                   	push   %ebx
    9210:	68 09 c4 00 00       	push   $0xc409
    9215:	e8 1d 73 ff ff       	call   537 <move_proc>
    921a:	83 c4 10             	add    $0x10,%esp
    921d:	85 c0                	test   %eax,%eax
    921f:	74 19                	je     923a <test_cpu_stat+0x2a5>
    9221:	eb 6e                	jmp    9291 <test_cpu_stat+0x2fc>
    9223:	83 ec 08             	sub    $0x8,%esp
    9226:	68 3c bf 00 00       	push   $0xbf3c
    922b:	6a 01                	push   $0x1
    922d:	e8 35 29 00 00       	call   bb67 <printf>
    9232:	83 c3 01             	add    $0x1,%ebx
    9235:	83 c4 10             	add    $0x10,%esp
    9238:	eb 05                	jmp    923f <test_cpu_stat+0x2aa>
    923a:	bb 00 00 00 00       	mov    $0x0,%ebx
    923f:	83 ec 0c             	sub    $0xc,%esp
    9242:	68 c0 ef 00 00       	push   $0xefc0
    9247:	e8 b7 24 00 00       	call   b703 <strlen>
    924c:	89 c7                	mov    %eax,%edi
    924e:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9255:	e8 a9 24 00 00       	call   b703 <strlen>
    925a:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    925e:	83 c4 10             	add    $0x10,%esp
    9261:	39 d8                	cmp    %ebx,%eax
    9263:	77 be                	ja     9223 <test_cpu_stat+0x28e>
    9265:	83 ec 0c             	sub    $0xc,%esp
    9268:	68 63 05 00 00       	push   $0x563
    926d:	68 f9 bf 00 00       	push   $0xbff9
    9272:	56                   	push   %esi
    9273:	68 e8 ef 00 00       	push   $0xefe8
    9278:	6a 01                	push   $0x1
    927a:	e8 e8 28 00 00       	call   bb67 <printf>
    927f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9286:	00 00 00 
    9289:	83 c4 20             	add    $0x20,%esp
    928c:	e9 d7 02 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        // Check that the child we returned is really in root cgroup.
        ASSERT_TRUE(is_pid_in_group(ROOT_CGROUP_PROCS, pidToMove));
    9291:	83 ec 08             	sub    $0x8,%esp
    9294:	53                   	push   %ebx
    9295:	68 09 c4 00 00       	push   $0xc409
    929a:	e8 cb 72 ff ff       	call   56a <is_pid_in_group>
    929f:	83 c4 10             	add    $0x10,%esp
    92a2:	85 c0                	test   %eax,%eax
    92a4:	74 19                	je     92bf <test_cpu_stat+0x32a>
    92a6:	eb 6e                	jmp    9316 <test_cpu_stat+0x381>
    92a8:	83 ec 08             	sub    $0x8,%esp
    92ab:	68 3c bf 00 00       	push   $0xbf3c
    92b0:	6a 01                	push   $0x1
    92b2:	e8 b0 28 00 00       	call   bb67 <printf>
    92b7:	83 c3 01             	add    $0x1,%ebx
    92ba:	83 c4 10             	add    $0x10,%esp
    92bd:	eb 05                	jmp    92c4 <test_cpu_stat+0x32f>
    92bf:	bb 00 00 00 00       	mov    $0x0,%ebx
    92c4:	83 ec 0c             	sub    $0xc,%esp
    92c7:	68 3c f0 00 00       	push   $0xf03c
    92cc:	e8 32 24 00 00       	call   b703 <strlen>
    92d1:	89 c7                	mov    %eax,%edi
    92d3:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    92da:	e8 24 24 00 00       	call   b703 <strlen>
    92df:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    92e3:	83 c4 10             	add    $0x10,%esp
    92e6:	39 d8                	cmp    %ebx,%eax
    92e8:	77 be                	ja     92a8 <test_cpu_stat+0x313>
    92ea:	83 ec 0c             	sub    $0xc,%esp
    92ed:	68 66 05 00 00       	push   $0x566
    92f2:	68 f9 bf 00 00       	push   $0xbff9
    92f7:	56                   	push   %esi
    92f8:	68 6c f0 00 00       	push   $0xf06c
    92fd:	6a 01                	push   $0x1
    92ff:	e8 63 28 00 00       	call   bb67 <printf>
    9304:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    930b:	00 00 00 
    930e:	83 c4 20             	add    $0x20,%esp
    9311:	e9 52 02 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        // read cpu.stat into a seconde buffer
        strcpy(buf2,read_file(TEST_1_CPU_STAT,0));
    9316:	83 ec 08             	sub    $0x8,%esp
    9319:	6a 00                	push   $0x0
    931b:	68 86 c1 00 00       	push   $0xc186
    9320:	e8 77 6e ff ff       	call   19c <read_file>
    9325:	83 c4 08             	add    $0x8,%esp
    9328:	50                   	push   %eax
    9329:	8d 9d d6 fd ff ff    	lea    -0x22a(%ebp),%ebx
    932f:	53                   	push   %ebx
    9330:	e8 5a 23 00 00       	call   b68f <strcpy>

        // Verify that the cpu time has changed because of the child's runing
        ASSERT_TRUE(strcmp(buf1, buf2));
    9335:	83 c4 08             	add    $0x8,%esp
    9338:	53                   	push   %ebx
    9339:	8d 85 df fe ff ff    	lea    -0x121(%ebp),%eax
    933f:	50                   	push   %eax
    9340:	e8 68 23 00 00       	call   b6ad <strcmp>
    9345:	83 c4 10             	add    $0x10,%esp
    9348:	85 c0                	test   %eax,%eax
    934a:	74 19                	je     9365 <test_cpu_stat+0x3d0>
    934c:	eb 6e                	jmp    93bc <test_cpu_stat+0x427>
    934e:	83 ec 08             	sub    $0x8,%esp
    9351:	68 3c bf 00 00       	push   $0xbf3c
    9356:	6a 01                	push   $0x1
    9358:	e8 0a 28 00 00       	call   bb67 <printf>
    935d:	83 c3 01             	add    $0x1,%ebx
    9360:	83 c4 10             	add    $0x10,%esp
    9363:	eb 05                	jmp    936a <test_cpu_stat+0x3d5>
    9365:	bb 00 00 00 00       	mov    $0x0,%ebx
    936a:	83 ec 0c             	sub    $0xc,%esp
    936d:	68 ce c6 00 00       	push   $0xc6ce
    9372:	e8 8c 23 00 00       	call   b703 <strlen>
    9377:	89 c7                	mov    %eax,%edi
    9379:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9380:	e8 7e 23 00 00       	call   b703 <strlen>
    9385:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    9389:	83 c4 10             	add    $0x10,%esp
    938c:	39 d8                	cmp    %ebx,%eax
    938e:	77 be                	ja     934e <test_cpu_stat+0x3b9>
    9390:	83 ec 0c             	sub    $0xc,%esp
    9393:	68 6c 05 00 00       	push   $0x56c
    9398:	68 f9 bf 00 00       	push   $0xbff9
    939d:	56                   	push   %esi
    939e:	68 74 0a 01 00       	push   $0x10a74
    93a3:	6a 01                	push   $0x1
    93a5:	e8 bd 27 00 00       	call   bb67 <printf>
    93aa:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    93b1:	00 00 00 
    93b4:	83 c4 20             	add    $0x20,%esp
    93b7:	e9 ac 01 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        sleep(10);
    93bc:	83 ec 0c             	sub    $0xc,%esp
    93bf:	6a 0a                	push   $0xa
    93c1:	e8 40 26 00 00       	call   ba06 <sleep>

        // read cpu.stat into a third buffer
        strcpy(buf3,read_file(TEST_1_CPU_STAT,0));
    93c6:	83 c4 08             	add    $0x8,%esp
    93c9:	6a 00                	push   $0x0
    93cb:	68 86 c1 00 00       	push   $0xc186
    93d0:	e8 c7 6d ff ff       	call   19c <read_file>
    93d5:	83 c4 08             	add    $0x8,%esp
    93d8:	50                   	push   %eax
    93d9:	8d 9d cd fc ff ff    	lea    -0x333(%ebp),%ebx
    93df:	53                   	push   %ebx
    93e0:	e8 aa 22 00 00       	call   b68f <strcpy>

        // Verify that the cpu time has no changed since the child removed
        ASSERT_FALSE(strcmp(buf2,buf3));
    93e5:	83 c4 08             	add    $0x8,%esp
    93e8:	53                   	push   %ebx
    93e9:	8d 85 d6 fd ff ff    	lea    -0x22a(%ebp),%eax
    93ef:	50                   	push   %eax
    93f0:	e8 b8 22 00 00       	call   b6ad <strcmp>
    93f5:	83 c4 10             	add    $0x10,%esp
    93f8:	85 c0                	test   %eax,%eax
    93fa:	75 19                	jne    9415 <test_cpu_stat+0x480>
    93fc:	eb 6e                	jmp    946c <test_cpu_stat+0x4d7>
    93fe:	83 ec 08             	sub    $0x8,%esp
    9401:	68 3c bf 00 00       	push   $0xbf3c
    9406:	6a 01                	push   $0x1
    9408:	e8 5a 27 00 00       	call   bb67 <printf>
    940d:	83 c3 01             	add    $0x1,%ebx
    9410:	83 c4 10             	add    $0x10,%esp
    9413:	eb 05                	jmp    941a <test_cpu_stat+0x485>
    9415:	bb 00 00 00 00       	mov    $0x0,%ebx
    941a:	83 ec 0c             	sub    $0xc,%esp
    941d:	68 e1 c6 00 00       	push   $0xc6e1
    9422:	e8 dc 22 00 00       	call   b703 <strlen>
    9427:	89 c7                	mov    %eax,%edi
    9429:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9430:	e8 ce 22 00 00       	call   b703 <strlen>
    9435:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    9439:	83 c4 10             	add    $0x10,%esp
    943c:	39 d8                	cmp    %ebx,%eax
    943e:	77 be                	ja     93fe <test_cpu_stat+0x469>
    9440:	83 ec 0c             	sub    $0xc,%esp
    9443:	68 74 05 00 00       	push   $0x574
    9448:	68 f9 bf 00 00       	push   $0xbff9
    944d:	56                   	push   %esi
    944e:	68 b0 0a 01 00       	push   $0x10ab0
    9453:	6a 01                	push   $0x1
    9455:	e8 0d 27 00 00       	call   bb67 <printf>
    945a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9461:	00 00 00 
    9464:	83 c4 20             	add    $0x20,%esp
    9467:	e9 fc 00 00 00       	jmp    9568 <test_cpu_stat+0x5d3>

        // Wait for child to exit.
        wait(&wstatus);
    946c:	83 ec 0c             	sub    $0xc,%esp
    946f:	8d 85 c8 fc ff ff    	lea    -0x338(%ebp),%eax
    9475:	50                   	push   %eax
    9476:	e8 03 25 00 00       	call   b97e <wait>
        ASSERT_TRUE(wstatus);
    947b:	83 c4 10             	add    $0x10,%esp
    947e:	83 bd c8 fc ff ff 00 	cmpl   $0x0,-0x338(%ebp)
    9485:	74 19                	je     94a0 <test_cpu_stat+0x50b>
    9487:	eb 6b                	jmp    94f4 <test_cpu_stat+0x55f>
    9489:	83 ec 08             	sub    $0x8,%esp
    948c:	68 3c bf 00 00       	push   $0xbf3c
    9491:	6a 01                	push   $0x1
    9493:	e8 cf 26 00 00       	call   bb67 <printf>
    9498:	83 c3 01             	add    $0x1,%ebx
    949b:	83 c4 10             	add    $0x10,%esp
    949e:	eb 05                	jmp    94a5 <test_cpu_stat+0x510>
    94a0:	bb 00 00 00 00       	mov    $0x0,%ebx
    94a5:	83 ec 0c             	sub    $0xc,%esp
    94a8:	68 d3 c4 00 00       	push   $0xc4d3
    94ad:	e8 51 22 00 00       	call   b703 <strlen>
    94b2:	89 c7                	mov    %eax,%edi
    94b4:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    94bb:	e8 43 22 00 00       	call   b703 <strlen>
    94c0:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    94c4:	83 c4 10             	add    $0x10,%esp
    94c7:	39 d8                	cmp    %ebx,%eax
    94c9:	77 be                	ja     9489 <test_cpu_stat+0x4f4>
    94cb:	83 ec 0c             	sub    $0xc,%esp
    94ce:	68 78 05 00 00       	push   $0x578
    94d3:	68 f9 bf 00 00       	push   $0xbff9
    94d8:	56                   	push   %esi
    94d9:	68 c4 f0 00 00       	push   $0xf0c4
    94de:	6a 01                	push   $0x1
    94e0:	e8 82 26 00 00       	call   bb67 <printf>
    94e5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    94ec:	00 00 00 
    94ef:	83 c4 20             	add    $0x20,%esp
    94f2:	eb 74                	jmp    9568 <test_cpu_stat+0x5d3>

        // Remove the temp file.
        ASSERT_TRUE(temp_delete());
    94f4:	e8 c8 71 ff ff       	call   6c1 <temp_delete>
    94f9:	85 c0                	test   %eax,%eax
    94fb:	74 19                	je     9516 <test_cpu_stat+0x581>
    94fd:	eb 69                	jmp    9568 <test_cpu_stat+0x5d3>
    94ff:	83 ec 08             	sub    $0x8,%esp
    9502:	68 3c bf 00 00       	push   $0xbf3c
    9507:	6a 01                	push   $0x1
    9509:	e8 59 26 00 00       	call   bb67 <printf>
    950e:	83 c3 01             	add    $0x1,%ebx
    9511:	83 c4 10             	add    $0x10,%esp
    9514:	eb 05                	jmp    951b <test_cpu_stat+0x586>
    9516:	bb 00 00 00 00       	mov    $0x0,%ebx
    951b:	83 ec 0c             	sub    $0xc,%esp
    951e:	68 db c4 00 00       	push   $0xc4db
    9523:	e8 db 21 00 00       	call   b703 <strlen>
    9528:	89 c7                	mov    %eax,%edi
    952a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9531:	e8 cd 21 00 00       	call   b703 <strlen>
    9536:	8d 44 07 02          	lea    0x2(%edi,%eax,1),%eax
    953a:	83 c4 10             	add    $0x10,%esp
    953d:	39 d8                	cmp    %ebx,%eax
    953f:	77 be                	ja     94ff <test_cpu_stat+0x56a>
    9541:	83 ec 0c             	sub    $0xc,%esp
    9544:	68 7b 05 00 00       	push   $0x57b
    9549:	68 f9 bf 00 00       	push   $0xbff9
    954e:	56                   	push   %esi
    954f:	68 f8 f0 00 00       	push   $0xf0f8
    9554:	6a 01                	push   $0x1
    9556:	e8 0c 26 00 00       	call   bb67 <printf>
    955b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9562:	00 00 00 
    9565:	83 c4 20             	add    $0x20,%esp

    }
}
    9568:	8d 65 f4             	lea    -0xc(%ebp),%esp
    956b:	5b                   	pop    %ebx
    956c:	5e                   	pop    %esi
    956d:	5f                   	pop    %edi
    956e:	5d                   	pop    %ebp
    956f:	c3                   	ret    

00009570 <test_mem_stat>:

TEST (test_mem_stat) {
    9570:	55                   	push   %ebp
    9571:	89 e5                	mov    %esp,%ebp
    9573:	57                   	push   %edi
    9574:	56                   	push   %esi
    9575:	53                   	push   %ebx
    9576:	81 ec 34 04 00 00    	sub    $0x434,%esp
    int wstatus;
    char befor_all[265];
    char effect_write_first_file[265];
    char effect_write_second_file[265];

    strcpy(befor_all, read_file(TEST_1_MEM_STAT,0));
    957c:	6a 00                	push   $0x0
    957e:	68 52 c2 00 00       	push   $0xc252
    9583:	e8 14 6c ff ff       	call   19c <read_file>
    9588:	83 c4 08             	add    $0x8,%esp
    958b:	50                   	push   %eax
    958c:	8d 85 db fe ff ff    	lea    -0x125(%ebp),%eax
    9592:	50                   	push   %eax
    9593:	e8 f7 20 00 00       	call   b68f <strcpy>
    // Fork a process because reading the memory values from inside the cgroup may affect the values.
    int pid = fork();
    9598:	e8 d1 23 00 00       	call   b96e <fork>
    int pidToMove = 0;
    // Child
    if (pid == 0) {
    959d:	83 c4 10             	add    $0x10,%esp
    95a0:	85 c0                	test   %eax,%eax
    95a2:	0f 85 73 04 00 00    	jne    9a1b <test_mem_stat+0x4ab>
        pidToMove = getpid();
    95a8:	e8 49 24 00 00       	call   b9f6 <getpid>
        // Save the pid of child in temp file.
        ASSERT_TRUE(temp_write(pidToMove));
    95ad:	83 ec 0c             	sub    $0xc,%esp
    95b0:	50                   	push   %eax
    95b1:	e8 54 70 ff ff       	call   60a <temp_write>
    95b6:	83 c4 10             	add    $0x10,%esp
    95b9:	85 c0                	test   %eax,%eax
    95bb:	74 19                	je     95d6 <test_mem_stat+0x66>
    95bd:	eb 70                	jmp    962f <test_mem_stat+0xbf>
    95bf:	83 ec 08             	sub    $0x8,%esp
    95c2:	68 3c bf 00 00       	push   $0xbf3c
    95c7:	6a 01                	push   $0x1
    95c9:	e8 99 25 00 00       	call   bb67 <printf>
    95ce:	83 c3 01             	add    $0x1,%ebx
    95d1:	83 c4 10             	add    $0x10,%esp
    95d4:	eb 05                	jmp    95db <test_mem_stat+0x6b>
    95d6:	bb 00 00 00 00       	mov    $0x0,%ebx
    95db:	83 ec 0c             	sub    $0xc,%esp
    95de:	68 1d c5 00 00       	push   $0xc51d
    95e3:	e8 1b 21 00 00       	call   b703 <strlen>
    95e8:	89 c6                	mov    %eax,%esi
    95ea:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    95f1:	e8 0d 21 00 00       	call   b703 <strlen>
    95f6:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    95fa:	83 c4 10             	add    $0x10,%esp
    95fd:	39 d8                	cmp    %ebx,%eax
    95ff:	77 be                	ja     95bf <test_mem_stat+0x4f>
    9601:	83 ec 0c             	sub    $0xc,%esp
    9604:	68 8e 05 00 00       	push   $0x58e
    9609:	68 f9 bf 00 00       	push   $0xbff9
    960e:	ff 75 08             	pushl  0x8(%ebp)
    9611:	68 90 f4 00 00       	push   $0xf490
    9616:	6a 01                	push   $0x1
    9618:	e8 4a 25 00 00       	call   bb67 <printf>
    961d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9624:	00 00 00 
    9627:	83 c4 20             	add    $0x20,%esp
    962a:	e9 09 09 00 00       	jmp    9f38 <test_mem_stat+0x9c8>

        // Go to sleep for long period of time alowe move the prosses into cgroup.
        sleep(10);
    962f:	83 ec 0c             	sub    $0xc,%esp
    9632:	6a 0a                	push   $0xa
    9634:	e8 cd 23 00 00       	call   ba06 <sleep>
        char str [256];
        memset(str, 'a', 256);
    9639:	83 c4 0c             	add    $0xc,%esp
    963c:	68 00 01 00 00       	push   $0x100
    9641:	6a 61                	push   $0x61
    9643:	8d 9d c9 fb ff ff    	lea    -0x437(%ebp),%ebx
    9649:	53                   	push   %ebx
    964a:	e8 ce 20 00 00       	call   b71d <memset>

        // Write to a new file 2 times.
        int fd;
        ASSERT_TRUE(fd=write_new_file("c", str));
    964f:	83 c4 08             	add    $0x8,%esp
    9652:	53                   	push   %ebx
    9653:	68 06 c0 00 00       	push   $0xc006
    9658:	e8 8d 6c ff ff       	call   2ea <write_new_file>
    965d:	89 c3                	mov    %eax,%ebx
    965f:	83 c4 10             	add    $0x10,%esp
    9662:	85 c0                	test   %eax,%eax
    9664:	74 19                	je     967f <test_mem_stat+0x10f>
    9666:	eb 70                	jmp    96d8 <test_mem_stat+0x168>
    9668:	83 ec 08             	sub    $0x8,%esp
    966b:	68 3c bf 00 00       	push   $0xbf3c
    9670:	6a 01                	push   $0x1
    9672:	e8 f0 24 00 00       	call   bb67 <printf>
    9677:	83 c3 01             	add    $0x1,%ebx
    967a:	83 c4 10             	add    $0x10,%esp
    967d:	eb 05                	jmp    9684 <test_mem_stat+0x114>
    967f:	bb 00 00 00 00       	mov    $0x0,%ebx
    9684:	83 ec 0c             	sub    $0xc,%esp
    9687:	68 f3 c6 00 00       	push   $0xc6f3
    968c:	e8 72 20 00 00       	call   b703 <strlen>
    9691:	89 c6                	mov    %eax,%esi
    9693:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    969a:	e8 64 20 00 00       	call   b703 <strlen>
    969f:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    96a3:	83 c4 10             	add    $0x10,%esp
    96a6:	39 d8                	cmp    %ebx,%eax
    96a8:	77 be                	ja     9668 <test_mem_stat+0xf8>
    96aa:	83 ec 0c             	sub    $0xc,%esp
    96ad:	68 97 05 00 00       	push   $0x597
    96b2:	68 f9 bf 00 00       	push   $0xbff9
    96b7:	ff 75 08             	pushl  0x8(%ebp)
    96ba:	68 ec 0a 01 00       	push   $0x10aec
    96bf:	6a 01                	push   $0x1
    96c1:	e8 a1 24 00 00       	call   bb67 <printf>
    96c6:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    96cd:	00 00 00 
    96d0:	83 c4 20             	add    $0x20,%esp
    96d3:	e9 60 08 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        ASSERT_TRUE(write_new_file("c", str));
    96d8:	83 ec 08             	sub    $0x8,%esp
    96db:	8d 85 c9 fb ff ff    	lea    -0x437(%ebp),%eax
    96e1:	50                   	push   %eax
    96e2:	68 06 c0 00 00       	push   $0xc006
    96e7:	e8 fe 6b ff ff       	call   2ea <write_new_file>
    96ec:	83 c4 10             	add    $0x10,%esp
    96ef:	85 c0                	test   %eax,%eax
    96f1:	74 19                	je     970c <test_mem_stat+0x19c>
    96f3:	eb 70                	jmp    9765 <test_mem_stat+0x1f5>
    96f5:	83 ec 08             	sub    $0x8,%esp
    96f8:	68 3c bf 00 00       	push   $0xbf3c
    96fd:	6a 01                	push   $0x1
    96ff:	e8 63 24 00 00       	call   bb67 <printf>
    9704:	83 c3 01             	add    $0x1,%ebx
    9707:	83 c4 10             	add    $0x10,%esp
    970a:	eb 05                	jmp    9711 <test_mem_stat+0x1a1>
    970c:	bb 00 00 00 00       	mov    $0x0,%ebx
    9711:	83 ec 0c             	sub    $0xc,%esp
    9714:	68 f6 c6 00 00       	push   $0xc6f6
    9719:	e8 e5 1f 00 00       	call   b703 <strlen>
    971e:	89 c6                	mov    %eax,%esi
    9720:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9727:	e8 d7 1f 00 00       	call   b703 <strlen>
    972c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9730:	83 c4 10             	add    $0x10,%esp
    9733:	39 d8                	cmp    %ebx,%eax
    9735:	77 be                	ja     96f5 <test_mem_stat+0x185>
    9737:	83 ec 0c             	sub    $0xc,%esp
    973a:	68 98 05 00 00       	push   $0x598
    973f:	68 f9 bf 00 00       	push   $0xbff9
    9744:	ff 75 08             	pushl  0x8(%ebp)
    9747:	68 34 0b 01 00       	push   $0x10b34
    974c:	6a 01                	push   $0x1
    974e:	e8 14 24 00 00       	call   bb67 <printf>
    9753:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    975a:	00 00 00 
    975d:	83 c4 20             	add    $0x20,%esp
    9760:	e9 d3 07 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        ASSERT_TRUE(close_file(fd));
    9765:	83 ec 0c             	sub    $0xc,%esp
    9768:	53                   	push   %ebx
    9769:	e8 bf 69 ff ff       	call   12d <close_file>
    976e:	83 c4 10             	add    $0x10,%esp
    9771:	85 c0                	test   %eax,%eax
    9773:	74 19                	je     978e <test_mem_stat+0x21e>
    9775:	eb 70                	jmp    97e7 <test_mem_stat+0x277>
    9777:	83 ec 08             	sub    $0x8,%esp
    977a:	68 3c bf 00 00       	push   $0xbf3c
    977f:	6a 01                	push   $0x1
    9781:	e8 e1 23 00 00       	call   bb67 <printf>
    9786:	83 c3 01             	add    $0x1,%ebx
    9789:	83 c4 10             	add    $0x10,%esp
    978c:	eb 05                	jmp    9793 <test_mem_stat+0x223>
    978e:	bb 00 00 00 00       	mov    $0x0,%ebx
    9793:	83 ec 0c             	sub    $0xc,%esp
    9796:	68 0f c7 00 00       	push   $0xc70f
    979b:	e8 63 1f 00 00       	call   b703 <strlen>
    97a0:	89 c6                	mov    %eax,%esi
    97a2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    97a9:	e8 55 1f 00 00       	call   b703 <strlen>
    97ae:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    97b2:	83 c4 10             	add    $0x10,%esp
    97b5:	39 d8                	cmp    %ebx,%eax
    97b7:	77 be                	ja     9777 <test_mem_stat+0x207>
    97b9:	83 ec 0c             	sub    $0xc,%esp
    97bc:	68 99 05 00 00       	push   $0x599
    97c1:	68 f9 bf 00 00       	push   $0xbff9
    97c6:	ff 75 08             	pushl  0x8(%ebp)
    97c9:	68 78 0b 01 00       	push   $0x10b78
    97ce:	6a 01                	push   $0x1
    97d0:	e8 92 23 00 00       	call   bb67 <printf>
    97d5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    97dc:	00 00 00 
    97df:	83 c4 20             	add    $0x20,%esp
    97e2:	e9 51 07 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        sleep(20);
    97e7:	83 ec 0c             	sub    $0xc,%esp
    97ea:	6a 14                	push   $0x14
    97ec:	e8 15 22 00 00       	call   ba06 <sleep>

        // Write times to another file with the file closed in the middle.
        ASSERT_TRUE(fd=write_new_file("d", str));
    97f1:	83 c4 08             	add    $0x8,%esp
    97f4:	8d 85 c9 fb ff ff    	lea    -0x437(%ebp),%eax
    97fa:	50                   	push   %eax
    97fb:	68 82 c7 00 00       	push   $0xc782
    9800:	e8 e5 6a ff ff       	call   2ea <write_new_file>
    9805:	89 c3                	mov    %eax,%ebx
    9807:	83 c4 10             	add    $0x10,%esp
    980a:	85 c0                	test   %eax,%eax
    980c:	74 19                	je     9827 <test_mem_stat+0x2b7>
    980e:	eb 70                	jmp    9880 <test_mem_stat+0x310>
    9810:	83 ec 08             	sub    $0x8,%esp
    9813:	68 3c bf 00 00       	push   $0xbf3c
    9818:	6a 01                	push   $0x1
    981a:	e8 48 23 00 00       	call   bb67 <printf>
    981f:	83 c3 01             	add    $0x1,%ebx
    9822:	83 c4 10             	add    $0x10,%esp
    9825:	eb 05                	jmp    982c <test_mem_stat+0x2bc>
    9827:	bb 00 00 00 00       	mov    $0x0,%ebx
    982c:	83 ec 0c             	sub    $0xc,%esp
    982f:	68 1e c7 00 00       	push   $0xc71e
    9834:	e8 ca 1e 00 00       	call   b703 <strlen>
    9839:	89 c6                	mov    %eax,%esi
    983b:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9842:	e8 bc 1e 00 00       	call   b703 <strlen>
    9847:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    984b:	83 c4 10             	add    $0x10,%esp
    984e:	39 d8                	cmp    %ebx,%eax
    9850:	77 be                	ja     9810 <test_mem_stat+0x2a0>
    9852:	83 ec 0c             	sub    $0xc,%esp
    9855:	68 9d 05 00 00       	push   $0x59d
    985a:	68 f9 bf 00 00       	push   $0xbff9
    985f:	ff 75 08             	pushl  0x8(%ebp)
    9862:	68 b0 0b 01 00       	push   $0x10bb0
    9867:	6a 01                	push   $0x1
    9869:	e8 f9 22 00 00       	call   bb67 <printf>
    986e:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9875:	00 00 00 
    9878:	83 c4 20             	add    $0x20,%esp
    987b:	e9 b8 06 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        ASSERT_TRUE(close_file(fd));
    9880:	83 ec 0c             	sub    $0xc,%esp
    9883:	50                   	push   %eax
    9884:	e8 a4 68 ff ff       	call   12d <close_file>
    9889:	83 c4 10             	add    $0x10,%esp
    988c:	85 c0                	test   %eax,%eax
    988e:	74 19                	je     98a9 <test_mem_stat+0x339>
    9890:	eb 70                	jmp    9902 <test_mem_stat+0x392>
    9892:	83 ec 08             	sub    $0x8,%esp
    9895:	68 3c bf 00 00       	push   $0xbf3c
    989a:	6a 01                	push   $0x1
    989c:	e8 c6 22 00 00       	call   bb67 <printf>
    98a1:	83 c3 01             	add    $0x1,%ebx
    98a4:	83 c4 10             	add    $0x10,%esp
    98a7:	eb 05                	jmp    98ae <test_mem_stat+0x33e>
    98a9:	bb 00 00 00 00       	mov    $0x0,%ebx
    98ae:	83 ec 0c             	sub    $0xc,%esp
    98b1:	68 0f c7 00 00       	push   $0xc70f
    98b6:	e8 48 1e 00 00       	call   b703 <strlen>
    98bb:	89 c6                	mov    %eax,%esi
    98bd:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    98c4:	e8 3a 1e 00 00       	call   b703 <strlen>
    98c9:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    98cd:	83 c4 10             	add    $0x10,%esp
    98d0:	39 d8                	cmp    %ebx,%eax
    98d2:	77 be                	ja     9892 <test_mem_stat+0x322>
    98d4:	83 ec 0c             	sub    $0xc,%esp
    98d7:	68 9e 05 00 00       	push   $0x59e
    98dc:	68 f9 bf 00 00       	push   $0xbff9
    98e1:	ff 75 08             	pushl  0x8(%ebp)
    98e4:	68 78 0b 01 00       	push   $0x10b78
    98e9:	6a 01                	push   $0x1
    98eb:	e8 77 22 00 00       	call   bb67 <printf>
    98f0:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    98f7:	00 00 00 
    98fa:	83 c4 20             	add    $0x20,%esp
    98fd:	e9 36 06 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        ASSERT_TRUE(write_new_file("d", str));
    9902:	83 ec 08             	sub    $0x8,%esp
    9905:	8d 85 c9 fb ff ff    	lea    -0x437(%ebp),%eax
    990b:	50                   	push   %eax
    990c:	68 82 c7 00 00       	push   $0xc782
    9911:	e8 d4 69 ff ff       	call   2ea <write_new_file>
    9916:	83 c4 10             	add    $0x10,%esp
    9919:	85 c0                	test   %eax,%eax
    991b:	74 19                	je     9936 <test_mem_stat+0x3c6>
    991d:	eb 70                	jmp    998f <test_mem_stat+0x41f>
    991f:	83 ec 08             	sub    $0x8,%esp
    9922:	68 3c bf 00 00       	push   $0xbf3c
    9927:	6a 01                	push   $0x1
    9929:	e8 39 22 00 00       	call   bb67 <printf>
    992e:	83 c3 01             	add    $0x1,%ebx
    9931:	83 c4 10             	add    $0x10,%esp
    9934:	eb 05                	jmp    993b <test_mem_stat+0x3cb>
    9936:	bb 00 00 00 00       	mov    $0x0,%ebx
    993b:	83 ec 0c             	sub    $0xc,%esp
    993e:	68 21 c7 00 00       	push   $0xc721
    9943:	e8 bb 1d 00 00       	call   b703 <strlen>
    9948:	89 c6                	mov    %eax,%esi
    994a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9951:	e8 ad 1d 00 00       	call   b703 <strlen>
    9956:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    995a:	83 c4 10             	add    $0x10,%esp
    995d:	39 d8                	cmp    %ebx,%eax
    995f:	77 be                	ja     991f <test_mem_stat+0x3af>
    9961:	83 ec 0c             	sub    $0xc,%esp
    9964:	68 9f 05 00 00       	push   $0x59f
    9969:	68 f9 bf 00 00       	push   $0xbff9
    996e:	ff 75 08             	pushl  0x8(%ebp)
    9971:	68 f8 0b 01 00       	push   $0x10bf8
    9976:	6a 01                	push   $0x1
    9978:	e8 ea 21 00 00       	call   bb67 <printf>
    997d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9984:	00 00 00 
    9987:	83 c4 20             	add    $0x20,%esp
    998a:	e9 a9 05 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        ASSERT_TRUE(close_file(fd));
    998f:	83 ec 0c             	sub    $0xc,%esp
    9992:	53                   	push   %ebx
    9993:	e8 95 67 ff ff       	call   12d <close_file>
    9998:	83 c4 10             	add    $0x10,%esp
    999b:	85 c0                	test   %eax,%eax
    999d:	74 19                	je     99b8 <test_mem_stat+0x448>
    999f:	eb 70                	jmp    9a11 <test_mem_stat+0x4a1>
    99a1:	83 ec 08             	sub    $0x8,%esp
    99a4:	68 3c bf 00 00       	push   $0xbf3c
    99a9:	6a 01                	push   $0x1
    99ab:	e8 b7 21 00 00       	call   bb67 <printf>
    99b0:	83 c3 01             	add    $0x1,%ebx
    99b3:	83 c4 10             	add    $0x10,%esp
    99b6:	eb 05                	jmp    99bd <test_mem_stat+0x44d>
    99b8:	bb 00 00 00 00       	mov    $0x0,%ebx
    99bd:	83 ec 0c             	sub    $0xc,%esp
    99c0:	68 0f c7 00 00       	push   $0xc70f
    99c5:	e8 39 1d 00 00       	call   b703 <strlen>
    99ca:	89 c6                	mov    %eax,%esi
    99cc:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    99d3:	e8 2b 1d 00 00       	call   b703 <strlen>
    99d8:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    99dc:	83 c4 10             	add    $0x10,%esp
    99df:	39 d8                	cmp    %ebx,%eax
    99e1:	77 be                	ja     99a1 <test_mem_stat+0x431>
    99e3:	83 ec 0c             	sub    $0xc,%esp
    99e6:	68 a0 05 00 00       	push   $0x5a0
    99eb:	68 f9 bf 00 00       	push   $0xbff9
    99f0:	ff 75 08             	pushl  0x8(%ebp)
    99f3:	68 78 0b 01 00       	push   $0x10b78
    99f8:	6a 01                	push   $0x1
    99fa:	e8 68 21 00 00       	call   bb67 <printf>
    99ff:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9a06:	00 00 00 
    9a09:	83 c4 20             	add    $0x20,%esp
    9a0c:	e9 27 05 00 00       	jmp    9f38 <test_mem_stat+0x9c8>

        exit(0);
    9a11:	83 ec 0c             	sub    $0xc,%esp
    9a14:	6a 00                	push   $0x0
    9a16:	e8 5b 1f 00 00       	call   b976 <exit>

    } else { // Father

        sleep(5);
    9a1b:	83 ec 0c             	sub    $0xc,%esp
    9a1e:	6a 05                	push   $0x5
    9a20:	e8 e1 1f 00 00       	call   ba06 <sleep>
        // Read the child pid from temp file.
        pidToMove = temp_read(0);
    9a25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9a2c:	e8 73 6c ff ff       	call   6a4 <temp_read>
    9a31:	89 c3                	mov    %eax,%ebx
        // Move the child process to "/cgroup/test1" cgroup.
        ASSERT_TRUE(move_proc(TEST_1_CGROUP_PROCS, pidToMove));
    9a33:	83 c4 08             	add    $0x8,%esp
    9a36:	50                   	push   %eax
    9a37:	68 06 c1 00 00       	push   $0xc106
    9a3c:	e8 f6 6a ff ff       	call   537 <move_proc>
    9a41:	83 c4 10             	add    $0x10,%esp
    9a44:	85 c0                	test   %eax,%eax
    9a46:	74 19                	je     9a61 <test_mem_stat+0x4f1>
    9a48:	eb 70                	jmp    9aba <test_mem_stat+0x54a>
    9a4a:	83 ec 08             	sub    $0x8,%esp
    9a4d:	68 3c bf 00 00       	push   $0xbf3c
    9a52:	6a 01                	push   $0x1
    9a54:	e8 0e 21 00 00       	call   bb67 <printf>
    9a59:	83 c3 01             	add    $0x1,%ebx
    9a5c:	83 c4 10             	add    $0x10,%esp
    9a5f:	eb 05                	jmp    9a66 <test_mem_stat+0x4f6>
    9a61:	bb 00 00 00 00       	mov    $0x0,%ebx
    9a66:	83 ec 0c             	sub    $0xc,%esp
    9a69:	68 b4 ee 00 00       	push   $0xeeb4
    9a6e:	e8 90 1c 00 00       	call   b703 <strlen>
    9a73:	89 c6                	mov    %eax,%esi
    9a75:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9a7c:	e8 82 1c 00 00       	call   b703 <strlen>
    9a81:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9a85:	83 c4 10             	add    $0x10,%esp
    9a88:	39 d8                	cmp    %ebx,%eax
    9a8a:	77 be                	ja     9a4a <test_mem_stat+0x4da>
    9a8c:	83 ec 0c             	sub    $0xc,%esp
    9a8f:	68 aa 05 00 00       	push   $0x5aa
    9a94:	68 f9 bf 00 00       	push   $0xbff9
    9a99:	ff 75 08             	pushl  0x8(%ebp)
    9a9c:	68 e0 ee 00 00       	push   $0xeee0
    9aa1:	6a 01                	push   $0x1
    9aa3:	e8 bf 20 00 00       	call   bb67 <printf>
    9aa8:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9aaf:	00 00 00 
    9ab2:	83 c4 20             	add    $0x20,%esp
    9ab5:	e9 7e 04 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        // Check that the process we moved is really in "/cgroup/test1" cgroup.
        ASSERT_TRUE(is_pid_in_group(TEST_1_CGROUP_PROCS, pidToMove));
    9aba:	83 ec 08             	sub    $0x8,%esp
    9abd:	53                   	push   %ebx
    9abe:	68 06 c1 00 00       	push   $0xc106
    9ac3:	e8 a2 6a ff ff       	call   56a <is_pid_in_group>
    9ac8:	83 c4 10             	add    $0x10,%esp
    9acb:	85 c0                	test   %eax,%eax
    9acd:	74 19                	je     9ae8 <test_mem_stat+0x578>
    9acf:	eb 70                	jmp    9b41 <test_mem_stat+0x5d1>
    9ad1:	83 ec 08             	sub    $0x8,%esp
    9ad4:	68 3c bf 00 00       	push   $0xbf3c
    9ad9:	6a 01                	push   $0x1
    9adb:	e8 87 20 00 00       	call   bb67 <printf>
    9ae0:	83 c3 01             	add    $0x1,%ebx
    9ae3:	83 c4 10             	add    $0x10,%esp
    9ae6:	eb 05                	jmp    9aed <test_mem_stat+0x57d>
    9ae8:	bb 00 00 00 00       	mov    $0x0,%ebx
    9aed:	83 ec 0c             	sub    $0xc,%esp
    9af0:	68 34 ef 00 00       	push   $0xef34
    9af5:	e8 09 1c 00 00       	call   b703 <strlen>
    9afa:	89 c6                	mov    %eax,%esi
    9afc:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9b03:	e8 fb 1b 00 00       	call   b703 <strlen>
    9b08:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9b0c:	83 c4 10             	add    $0x10,%esp
    9b0f:	39 d8                	cmp    %ebx,%eax
    9b11:	77 be                	ja     9ad1 <test_mem_stat+0x561>
    9b13:	83 ec 0c             	sub    $0xc,%esp
    9b16:	68 ac 05 00 00       	push   $0x5ac
    9b1b:	68 f9 bf 00 00       	push   $0xbff9
    9b20:	ff 75 08             	pushl  0x8(%ebp)
    9b23:	68 64 ef 00 00       	push   $0xef64
    9b28:	6a 01                	push   $0x1
    9b2a:	e8 38 20 00 00       	call   bb67 <printf>
    9b2f:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9b36:	00 00 00 
    9b39:	83 c4 20             	add    $0x20,%esp
    9b3c:	e9 f7 03 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        // Go to sleep to ensure the child process had a chance to be scheduled.
        // Allows the child to write a page twice for a new file
        sleep(20);
    9b41:	83 ec 0c             	sub    $0xc,%esp
    9b44:	6a 14                	push   $0x14
    9b46:	e8 bb 1e 00 00       	call   ba06 <sleep>
        strcpy(effect_write_first_file, read_file(TEST_1_MEM_STAT,0));
    9b4b:	83 c4 08             	add    $0x8,%esp
    9b4e:	6a 00                	push   $0x0
    9b50:	68 52 c2 00 00       	push   $0xc252
    9b55:	e8 42 66 ff ff       	call   19c <read_file>
    9b5a:	83 c4 08             	add    $0x8,%esp
    9b5d:	50                   	push   %eax
    9b5e:	8d 85 d2 fd ff ff    	lea    -0x22e(%ebp),%eax
    9b64:	50                   	push   %eax
    9b65:	e8 25 1b 00 00       	call   b68f <strcpy>

        //Allows the child to write to a new file close and write again
        sleep(20);
    9b6a:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
    9b71:	e8 90 1e 00 00       	call   ba06 <sleep>
        strcpy(effect_write_second_file, read_file(TEST_1_MEM_STAT,0));
    9b76:	83 c4 08             	add    $0x8,%esp
    9b79:	6a 00                	push   $0x0
    9b7b:	68 52 c2 00 00       	push   $0xc252
    9b80:	e8 17 66 ff ff       	call   19c <read_file>
    9b85:	83 c4 08             	add    $0x8,%esp
    9b88:	50                   	push   %eax
    9b89:	8d b5 c9 fc ff ff    	lea    -0x337(%ebp),%esi
    9b8f:	56                   	push   %esi
    9b90:	e8 fa 1a 00 00       	call   b68f <strcpy>

        // check the effect of pgmajfault
        int pgmajfault_befor = get_val(befor_all, "pgmajfault - ");
    9b95:	83 c4 08             	add    $0x8,%esp
    9b98:	68 3a c7 00 00       	push   $0xc73a
    9b9d:	8d 85 db fe ff ff    	lea    -0x125(%ebp),%eax
    9ba3:	50                   	push   %eax
    9ba4:	e8 4f 6b ff ff       	call   6f8 <get_val>
    9ba9:	89 c3                	mov    %eax,%ebx
        int pgmajfault_after = get_val(effect_write_second_file, "pgmajfault - ");
    9bab:	83 c4 08             	add    $0x8,%esp
    9bae:	68 3a c7 00 00       	push   $0xc73a
    9bb3:	56                   	push   %esi
    9bb4:	e8 3f 6b ff ff       	call   6f8 <get_val>
        ASSERT_TRUE(pgmajfault_after - pgmajfault_befor >= 2);
    9bb9:	29 d8                	sub    %ebx,%eax
    9bbb:	83 c4 10             	add    $0x10,%esp
    9bbe:	83 f8 01             	cmp    $0x1,%eax
    9bc1:	7f 72                	jg     9c35 <test_mem_stat+0x6c5>
    9bc3:	eb 17                	jmp    9bdc <test_mem_stat+0x66c>
    9bc5:	83 ec 08             	sub    $0x8,%esp
    9bc8:	68 3c bf 00 00       	push   $0xbf3c
    9bcd:	6a 01                	push   $0x1
    9bcf:	e8 93 1f 00 00       	call   bb67 <printf>
    9bd4:	83 c3 01             	add    $0x1,%ebx
    9bd7:	83 c4 10             	add    $0x10,%esp
    9bda:	eb 05                	jmp    9be1 <test_mem_stat+0x671>
    9bdc:	bb 00 00 00 00       	mov    $0x0,%ebx
    9be1:	83 ec 0c             	sub    $0xc,%esp
    9be4:	68 3c 0c 01 00       	push   $0x10c3c
    9be9:	e8 15 1b 00 00       	call   b703 <strlen>
    9bee:	89 c6                	mov    %eax,%esi
    9bf0:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9bf7:	e8 07 1b 00 00       	call   b703 <strlen>
    9bfc:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9c00:	83 c4 10             	add    $0x10,%esp
    9c03:	39 d8                	cmp    %ebx,%eax
    9c05:	77 be                	ja     9bc5 <test_mem_stat+0x655>
    9c07:	83 ec 0c             	sub    $0xc,%esp
    9c0a:	68 b9 05 00 00       	push   $0x5b9
    9c0f:	68 f9 bf 00 00       	push   $0xbff9
    9c14:	ff 75 08             	pushl  0x8(%ebp)
    9c17:	68 68 0c 01 00       	push   $0x10c68
    9c1c:	6a 01                	push   $0x1
    9c1e:	e8 44 1f 00 00       	call   bb67 <printf>
    9c23:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9c2a:	00 00 00 
    9c2d:	83 c4 20             	add    $0x20,%esp
    9c30:	e9 03 03 00 00       	jmp    9f38 <test_mem_stat+0x9c8>

        // check the effect of pgfault
        // The second write to file c was before closing and file d was after closing,
        // so we need more pgfaults besides what the writing itself causes
        int grow_pgfoult_after_first = get_val(effect_write_first_file, "pgfault - ") - get_val(befor_all , "pgfault - ");
    9c35:	83 ec 08             	sub    $0x8,%esp
    9c38:	68 8e c6 00 00       	push   $0xc68e
    9c3d:	8d bd d2 fd ff ff    	lea    -0x22e(%ebp),%edi
    9c43:	57                   	push   %edi
    9c44:	e8 af 6a ff ff       	call   6f8 <get_val>
    9c49:	89 c3                	mov    %eax,%ebx
    9c4b:	83 c4 08             	add    $0x8,%esp
    9c4e:	68 8e c6 00 00       	push   $0xc68e
    9c53:	8d 85 db fe ff ff    	lea    -0x125(%ebp),%eax
    9c59:	50                   	push   %eax
    9c5a:	e8 99 6a ff ff       	call   6f8 <get_val>
    9c5f:	29 c3                	sub    %eax,%ebx
        int grow_pgfoult_after_seconde = get_val(effect_write_second_file, "pgfault - ") - get_val(effect_write_first_file, "pgfault - ");
    9c61:	83 c4 08             	add    $0x8,%esp
    9c64:	68 8e c6 00 00       	push   $0xc68e
    9c69:	8d 85 c9 fc ff ff    	lea    -0x337(%ebp),%eax
    9c6f:	50                   	push   %eax
    9c70:	e8 83 6a ff ff       	call   6f8 <get_val>
    9c75:	89 c6                	mov    %eax,%esi
    9c77:	83 c4 08             	add    $0x8,%esp
    9c7a:	68 8e c6 00 00       	push   $0xc68e
    9c7f:	57                   	push   %edi
    9c80:	e8 73 6a ff ff       	call   6f8 <get_val>
    9c85:	29 c6                	sub    %eax,%esi
        ASSERT_TRUE(grow_pgfoult_after_first);
    9c87:	83 c4 10             	add    $0x10,%esp
    9c8a:	85 db                	test   %ebx,%ebx
    9c8c:	74 19                	je     9ca7 <test_mem_stat+0x737>
    9c8e:	eb 70                	jmp    9d00 <test_mem_stat+0x790>
    9c90:	83 ec 08             	sub    $0x8,%esp
    9c93:	68 3c bf 00 00       	push   $0xbf3c
    9c98:	6a 01                	push   $0x1
    9c9a:	e8 c8 1e 00 00       	call   bb67 <printf>
    9c9f:	83 c3 01             	add    $0x1,%ebx
    9ca2:	83 c4 10             	add    $0x10,%esp
    9ca5:	eb 05                	jmp    9cac <test_mem_stat+0x73c>
    9ca7:	bb 00 00 00 00       	mov    $0x0,%ebx
    9cac:	83 ec 0c             	sub    $0xc,%esp
    9caf:	68 48 c7 00 00       	push   $0xc748
    9cb4:	e8 4a 1a 00 00       	call   b703 <strlen>
    9cb9:	89 c6                	mov    %eax,%esi
    9cbb:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9cc2:	e8 3c 1a 00 00       	call   b703 <strlen>
    9cc7:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9ccb:	83 c4 10             	add    $0x10,%esp
    9cce:	39 d8                	cmp    %ebx,%eax
    9cd0:	77 be                	ja     9c90 <test_mem_stat+0x720>
    9cd2:	83 ec 0c             	sub    $0xc,%esp
    9cd5:	68 c0 05 00 00       	push   $0x5c0
    9cda:	68 f9 bf 00 00       	push   $0xbff9
    9cdf:	ff 75 08             	pushl  0x8(%ebp)
    9ce2:	68 bc 0c 01 00       	push   $0x10cbc
    9ce7:	6a 01                	push   $0x1
    9ce9:	e8 79 1e 00 00       	call   bb67 <printf>
    9cee:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9cf5:	00 00 00 
    9cf8:	83 c4 20             	add    $0x20,%esp
    9cfb:	e9 38 02 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        ASSERT_TRUE(grow_pgfoult_after_seconde > grow_pgfoult_after_first);
    9d00:	39 f3                	cmp    %esi,%ebx
    9d02:	7d 19                	jge    9d1d <test_mem_stat+0x7ad>
    9d04:	eb 70                	jmp    9d76 <test_mem_stat+0x806>
    9d06:	83 ec 08             	sub    $0x8,%esp
    9d09:	68 3c bf 00 00       	push   $0xbf3c
    9d0e:	6a 01                	push   $0x1
    9d10:	e8 52 1e 00 00       	call   bb67 <printf>
    9d15:	83 c3 01             	add    $0x1,%ebx
    9d18:	83 c4 10             	add    $0x10,%esp
    9d1b:	eb 05                	jmp    9d22 <test_mem_stat+0x7b2>
    9d1d:	bb 00 00 00 00       	mov    $0x0,%ebx
    9d22:	83 ec 0c             	sub    $0xc,%esp
    9d25:	68 00 0d 01 00       	push   $0x10d00
    9d2a:	e8 d4 19 00 00       	call   b703 <strlen>
    9d2f:	89 c6                	mov    %eax,%esi
    9d31:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9d38:	e8 c6 19 00 00       	call   b703 <strlen>
    9d3d:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9d41:	83 c4 10             	add    $0x10,%esp
    9d44:	39 d8                	cmp    %ebx,%eax
    9d46:	77 be                	ja     9d06 <test_mem_stat+0x796>
    9d48:	83 ec 0c             	sub    $0xc,%esp
    9d4b:	68 c1 05 00 00       	push   $0x5c1
    9d50:	68 f9 bf 00 00       	push   $0xbff9
    9d55:	ff 75 08             	pushl  0x8(%ebp)
    9d58:	68 38 0d 01 00       	push   $0x10d38
    9d5d:	6a 01                	push   $0x1
    9d5f:	e8 03 1e 00 00       	call   bb67 <printf>
    9d64:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9d6b:	00 00 00 
    9d6e:	83 c4 20             	add    $0x20,%esp
    9d71:	e9 c2 01 00 00       	jmp    9f38 <test_mem_stat+0x9c8>

        // check the effect of file dirty
        // we calculate the dirte and aggregated together as it is impossible to know if there is a delay in writing to disk
        int dirty_befor = get_val(befor_all, "file_dirty - ") + get_val(befor_all, "file_dirty_aggregated - ");
    9d76:	83 ec 08             	sub    $0x8,%esp
    9d79:	68 67 c6 00 00       	push   $0xc667
    9d7e:	8d b5 db fe ff ff    	lea    -0x125(%ebp),%esi
    9d84:	56                   	push   %esi
    9d85:	e8 6e 69 ff ff       	call   6f8 <get_val>
    9d8a:	89 c3                	mov    %eax,%ebx
    9d8c:	83 c4 08             	add    $0x8,%esp
    9d8f:	68 75 c6 00 00       	push   $0xc675
    9d94:	56                   	push   %esi
    9d95:	e8 5e 69 ff ff       	call   6f8 <get_val>
    9d9a:	01 c3                	add    %eax,%ebx
        int dirty_after = get_val(effect_write_second_file, "file_dirty - ") + get_val(effect_write_second_file, "file_dirty_aggregated - ");
    9d9c:	83 c4 08             	add    $0x8,%esp
    9d9f:	68 67 c6 00 00       	push   $0xc667
    9da4:	8d b5 c9 fc ff ff    	lea    -0x337(%ebp),%esi
    9daa:	56                   	push   %esi
    9dab:	e8 48 69 ff ff       	call   6f8 <get_val>
    9db0:	89 c7                	mov    %eax,%edi
    9db2:	83 c4 08             	add    $0x8,%esp
    9db5:	68 75 c6 00 00       	push   $0xc675
    9dba:	56                   	push   %esi
    9dbb:	e8 38 69 ff ff       	call   6f8 <get_val>
    9dc0:	01 f8                	add    %edi,%eax
        ASSERT_TRUE(dirty_after - dirty_befor >= 2);
    9dc2:	29 d8                	sub    %ebx,%eax
    9dc4:	83 c4 10             	add    $0x10,%esp
    9dc7:	83 f8 01             	cmp    $0x1,%eax
    9dca:	7f 72                	jg     9e3e <test_mem_stat+0x8ce>
    9dcc:	eb 17                	jmp    9de5 <test_mem_stat+0x875>
    9dce:	83 ec 08             	sub    $0x8,%esp
    9dd1:	68 3c bf 00 00       	push   $0xbf3c
    9dd6:	6a 01                	push   $0x1
    9dd8:	e8 8a 1d 00 00       	call   bb67 <printf>
    9ddd:	83 c3 01             	add    $0x1,%ebx
    9de0:	83 c4 10             	add    $0x10,%esp
    9de3:	eb 05                	jmp    9dea <test_mem_stat+0x87a>
    9de5:	bb 00 00 00 00       	mov    $0x0,%ebx
    9dea:	83 ec 0c             	sub    $0xc,%esp
    9ded:	68 98 0d 01 00       	push   $0x10d98
    9df2:	e8 0c 19 00 00       	call   b703 <strlen>
    9df7:	89 c6                	mov    %eax,%esi
    9df9:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9e00:	e8 fe 18 00 00       	call   b703 <strlen>
    9e05:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9e09:	83 c4 10             	add    $0x10,%esp
    9e0c:	39 d8                	cmp    %ebx,%eax
    9e0e:	77 be                	ja     9dce <test_mem_stat+0x85e>
    9e10:	83 ec 0c             	sub    $0xc,%esp
    9e13:	68 c7 05 00 00       	push   $0x5c7
    9e18:	68 f9 bf 00 00       	push   $0xbff9
    9e1d:	ff 75 08             	pushl  0x8(%ebp)
    9e20:	68 b8 0d 01 00       	push   $0x10db8
    9e25:	6a 01                	push   $0x1
    9e27:	e8 3b 1d 00 00       	call   bb67 <printf>
    9e2c:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9e33:	00 00 00 
    9e36:	83 c4 20             	add    $0x20,%esp
    9e39:	e9 fa 00 00 00       	jmp    9f38 <test_mem_stat+0x9c8>
        // Wait for child to exit.
        wait(&wstatus);
    9e3e:	83 ec 0c             	sub    $0xc,%esp
    9e41:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    9e44:	50                   	push   %eax
    9e45:	e8 34 1b 00 00       	call   b97e <wait>
        ASSERT_TRUE(wstatus);
    9e4a:	83 c4 10             	add    $0x10,%esp
    9e4d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9e51:	74 19                	je     9e6c <test_mem_stat+0x8fc>
    9e53:	eb 6d                	jmp    9ec2 <test_mem_stat+0x952>
    9e55:	83 ec 08             	sub    $0x8,%esp
    9e58:	68 3c bf 00 00       	push   $0xbf3c
    9e5d:	6a 01                	push   $0x1
    9e5f:	e8 03 1d 00 00       	call   bb67 <printf>
    9e64:	83 c3 01             	add    $0x1,%ebx
    9e67:	83 c4 10             	add    $0x10,%esp
    9e6a:	eb 05                	jmp    9e71 <test_mem_stat+0x901>
    9e6c:	bb 00 00 00 00       	mov    $0x0,%ebx
    9e71:	83 ec 0c             	sub    $0xc,%esp
    9e74:	68 d3 c4 00 00       	push   $0xc4d3
    9e79:	e8 85 18 00 00       	call   b703 <strlen>
    9e7e:	89 c6                	mov    %eax,%esi
    9e80:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9e87:	e8 77 18 00 00       	call   b703 <strlen>
    9e8c:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9e90:	83 c4 10             	add    $0x10,%esp
    9e93:	39 d8                	cmp    %ebx,%eax
    9e95:	77 be                	ja     9e55 <test_mem_stat+0x8e5>
    9e97:	83 ec 0c             	sub    $0xc,%esp
    9e9a:	68 ca 05 00 00       	push   $0x5ca
    9e9f:	68 f9 bf 00 00       	push   $0xbff9
    9ea4:	ff 75 08             	pushl  0x8(%ebp)
    9ea7:	68 c4 f0 00 00       	push   $0xf0c4
    9eac:	6a 01                	push   $0x1
    9eae:	e8 b4 1c 00 00       	call   bb67 <printf>
    9eb3:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9eba:	00 00 00 
    9ebd:	83 c4 20             	add    $0x20,%esp
    9ec0:	eb 76                	jmp    9f38 <test_mem_stat+0x9c8>
        // Remove the temp file.
        ASSERT_TRUE(temp_delete());
    9ec2:	e8 fa 67 ff ff       	call   6c1 <temp_delete>
    9ec7:	85 c0                	test   %eax,%eax
    9ec9:	74 19                	je     9ee4 <test_mem_stat+0x974>
    9ecb:	eb 6b                	jmp    9f38 <test_mem_stat+0x9c8>
    9ecd:	83 ec 08             	sub    $0x8,%esp
    9ed0:	68 3c bf 00 00       	push   $0xbf3c
    9ed5:	6a 01                	push   $0x1
    9ed7:	e8 8b 1c 00 00       	call   bb67 <printf>
    9edc:	83 c3 01             	add    $0x1,%ebx
    9edf:	83 c4 10             	add    $0x10,%esp
    9ee2:	eb 05                	jmp    9ee9 <test_mem_stat+0x979>
    9ee4:	bb 00 00 00 00       	mov    $0x0,%ebx
    9ee9:	83 ec 0c             	sub    $0xc,%esp
    9eec:	68 db c4 00 00       	push   $0xc4db
    9ef1:	e8 0d 18 00 00       	call   b703 <strlen>
    9ef6:	89 c6                	mov    %eax,%esi
    9ef8:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    9eff:	e8 ff 17 00 00       	call   b703 <strlen>
    9f04:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    9f08:	83 c4 10             	add    $0x10,%esp
    9f0b:	39 d8                	cmp    %ebx,%eax
    9f0d:	77 be                	ja     9ecd <test_mem_stat+0x95d>
    9f0f:	83 ec 0c             	sub    $0xc,%esp
    9f12:	68 cc 05 00 00       	push   $0x5cc
    9f17:	68 f9 bf 00 00       	push   $0xbff9
    9f1c:	ff 75 08             	pushl  0x8(%ebp)
    9f1f:	68 f8 f0 00 00       	push   $0xf0f8
    9f24:	6a 01                	push   $0x1
    9f26:	e8 3c 1c 00 00       	call   bb67 <printf>
    9f2b:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    9f32:	00 00 00 
    9f35:	83 c4 20             	add    $0x20,%esp
    }
}
    9f38:	8d 65 f4             	lea    -0xc(%ebp),%esp
    9f3b:	5b                   	pop    %ebx
    9f3c:	5e                   	pop    %esi
    9f3d:	5f                   	pop    %edi
    9f3e:	5d                   	pop    %ebp
    9f3f:	c3                   	ret    

00009f40 <test_nested_cgroups>:


TEST (test_nested_cgroups)
{
    9f40:	55                   	push   %ebp
    9f41:	89 e5                	mov    %esp,%ebp
    9f43:	57                   	push   %edi
    9f44:	56                   	push   %esi
    9f45:	53                   	push   %ebx
    9f46:	81 ec 34 02 00 00    	sub    $0x234,%esp
  char * mem_str_buf = 0;
  uint kernel_total_mem = 0;
  uint depth_cnt = 1;
  char min_val[12] = {0};
    9f4c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9f53:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9f5a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  //char max_val[12] = {0};
  char current_nested_cgroup[MAX_PATH_LENGTH] = {0};
    9f61:	8d bd dc fd ff ff    	lea    -0x224(%ebp),%edi
    9f67:	b9 80 00 00 00       	mov    $0x80,%ecx
    9f6c:	b8 00 00 00 00       	mov    $0x0,%eax
    9f71:	f3 ab                	rep stos %eax,%es:(%edi)
  char current_nesting_index = '0';
  uint current_nested_cgroup_length = 0;


  mem_str_buf = read_file(TEST_1_MEM_STAT, 0);
    9f73:	6a 00                	push   $0x0
    9f75:	68 52 c2 00 00       	push   $0xc252
    9f7a:	e8 1d 62 ff ff       	call   19c <read_file>
  kernel_total_mem = get_kernel_total_memory(mem_str_buf);
    9f7f:	89 04 24             	mov    %eax,(%esp)
    9f82:	e8 fe 60 ff ff       	call   85 <get_kernel_total_memory>
    9f87:	89 c6                	mov    %eax,%esi

  printf(1, "\nkernel total memory: %x \n", kernel_total_mem);
    9f89:	83 c4 0c             	add    $0xc,%esp
    9f8c:	50                   	push   %eax
    9f8d:	68 61 c7 00 00       	push   $0xc761
    9f92:	6a 01                	push   $0x1
    9f94:	e8 ce 1b 00 00       	call   bb67 <printf>

  //initialize the nested cgroup path
  strcpy(current_nested_cgroup, ROOT_CGROUP);
    9f99:	83 c4 08             	add    $0x8,%esp
    9f9c:	68 de bf 00 00       	push   $0xbfde
    9fa1:	8d 9d dc fd ff ff    	lea    -0x224(%ebp),%ebx
    9fa7:	53                   	push   %ebx
    9fa8:	e8 e2 16 00 00       	call   b68f <strcpy>
  strcat(current_nested_cgroup, TESTED_NESTED_CGROUP_CHILD);
    9fad:	83 c4 08             	add    $0x8,%esp
    9fb0:	68 7c c7 00 00       	push   $0xc77c
    9fb5:	53                   	push   %ebx
    9fb6:	e8 1b 19 00 00       	call   b8d6 <strcat>
  current_nested_cgroup[strlen(current_nested_cgroup)] = current_nesting_index;
    9fbb:	89 1c 24             	mov    %ebx,(%esp)
    9fbe:	e8 40 17 00 00       	call   b703 <strlen>
    9fc3:	c6 84 05 dc fd ff ff 	movb   $0x30,-0x224(%ebp,%eax,1)
    9fca:	30 

  /* Create the root nested cgroup and enable the memory controller*/
  ASSERT_FALSE(mkdir(current_nested_cgroup));
    9fcb:	89 1c 24             	mov    %ebx,(%esp)
    9fce:	e8 0b 1a 00 00       	call   b9de <mkdir>
    9fd3:	83 c4 10             	add    $0x10,%esp
    9fd6:	85 c0                	test   %eax,%eax
    9fd8:	75 19                	jne    9ff3 <test_nested_cgroups+0xb3>
    9fda:	eb 70                	jmp    a04c <test_nested_cgroups+0x10c>
    9fdc:	83 ec 08             	sub    $0x8,%esp
    9fdf:	68 3c bf 00 00       	push   $0xbf3c
    9fe4:	6a 01                	push   $0x1
    9fe6:	e8 7c 1b 00 00       	call   bb67 <printf>
    9feb:	83 c3 01             	add    $0x1,%ebx
    9fee:	83 c4 10             	add    $0x10,%esp
    9ff1:	eb 05                	jmp    9ff8 <test_nested_cgroups+0xb8>
    9ff3:	bb 00 00 00 00       	mov    $0x0,%ebx
    9ff8:	83 ec 0c             	sub    $0xc,%esp
    9ffb:	68 84 c7 00 00       	push   $0xc784
    a000:	e8 fe 16 00 00       	call   b703 <strlen>
    a005:	89 c6                	mov    %eax,%esi
    a007:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a00e:	e8 f0 16 00 00       	call   b703 <strlen>
    a013:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a017:	83 c4 10             	add    $0x10,%esp
    a01a:	39 d8                	cmp    %ebx,%eax
    a01c:	77 be                	ja     9fdc <test_nested_cgroups+0x9c>
    a01e:	83 ec 0c             	sub    $0xc,%esp
    a021:	68 e8 05 00 00       	push   $0x5e8
    a026:	68 f9 bf 00 00       	push   $0xbff9
    a02b:	ff 75 08             	pushl  0x8(%ebp)
    a02e:	68 00 0e 01 00       	push   $0x10e00
    a033:	6a 01                	push   $0x1
    a035:	e8 2d 1b 00 00       	call   bb67 <printf>
    a03a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a041:	00 00 00 
    a044:	83 c4 20             	add    $0x20,%esp
    a047:	e9 17 06 00 00       	jmp    a663 <test_nested_cgroups+0x723>

  strcpy(temp_path_g, current_nested_cgroup);
    a04c:	83 ec 08             	sub    $0x8,%esp
    a04f:	8d 85 dc fd ff ff    	lea    -0x224(%ebp),%eax
    a055:	50                   	push   %eax
    a056:	68 40 40 01 00       	push   $0x14040
    a05b:	e8 2f 16 00 00       	call   b68f <strcpy>
  strcat(temp_path_g, TEST_NESTED_SUBTREE_CONTROL);
    a060:	83 c4 08             	add    $0x8,%esp
    a063:	68 a1 c7 00 00       	push   $0xc7a1
    a068:	68 40 40 01 00       	push   $0x14040
    a06d:	e8 64 18 00 00       	call   b8d6 <strcat>
  ASSERT_TRUE(write_file(temp_path_g, "+mem"));
    a072:	83 c4 08             	add    $0x8,%esp
    a075:	68 b4 c5 00 00       	push   $0xc5b4
    a07a:	68 40 40 01 00       	push   $0x14040
    a07f:	e8 ca 61 ff ff       	call   24e <write_file>
    a084:	83 c4 10             	add    $0x10,%esp
    a087:	85 c0                	test   %eax,%eax
    a089:	74 28                	je     a0b3 <test_nested_cgroups+0x173>
    a08b:	c6 85 d7 fd ff ff 30 	movb   $0x30,-0x229(%ebp)
    a092:	bf 01 00 00 00       	mov    $0x1,%edi
    a097:	e9 03 03 00 00       	jmp    a39f <test_nested_cgroups+0x45f>
    a09c:	83 ec 08             	sub    $0x8,%esp
    a09f:	68 3c bf 00 00       	push   $0xbf3c
    a0a4:	6a 01                	push   $0x1
    a0a6:	e8 bc 1a 00 00       	call   bb67 <printf>
    a0ab:	83 c3 01             	add    $0x1,%ebx
    a0ae:	83 c4 10             	add    $0x10,%esp
    a0b1:	eb 05                	jmp    a0b8 <test_nested_cgroups+0x178>
    a0b3:	bb 00 00 00 00       	mov    $0x0,%ebx
    a0b8:	83 ec 0c             	sub    $0xc,%esp
    a0bb:	68 48 0e 01 00       	push   $0x10e48
    a0c0:	e8 3e 16 00 00       	call   b703 <strlen>
    a0c5:	89 c6                	mov    %eax,%esi
    a0c7:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a0ce:	e8 30 16 00 00       	call   b703 <strlen>
    a0d3:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a0d7:	83 c4 10             	add    $0x10,%esp
    a0da:	39 d8                	cmp    %ebx,%eax
    a0dc:	77 be                	ja     a09c <test_nested_cgroups+0x15c>
    a0de:	83 ec 0c             	sub    $0xc,%esp
    a0e1:	68 ec 05 00 00       	push   $0x5ec
    a0e6:	68 f9 bf 00 00       	push   $0xbff9
    a0eb:	ff 75 08             	pushl  0x8(%ebp)
    a0ee:	68 68 0e 01 00       	push   $0x10e68
    a0f3:	6a 01                	push   $0x1
    a0f5:	e8 6d 1a 00 00       	call   bb67 <printf>
    a0fa:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a101:	00 00 00 
    a104:	83 c4 20             	add    $0x20,%esp
    a107:	e9 57 05 00 00       	jmp    a663 <test_nested_cgroups+0x723>
  /* create the 9 other nested groups. Enable memory controller in each of them because
     it's not propagated from the parent cgroup */
  for(depth_cnt = 1; depth_cnt < 10; depth_cnt++)
  {
    /* define the min-max values for the current cgroup */
    memset(min_val, 12, 0);
    a10c:	83 ec 04             	sub    $0x4,%esp
    a10f:	6a 00                	push   $0x0
    a111:	6a 0c                	push   $0xc
    a113:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    a116:	53                   	push   %ebx
    a117:	e8 01 16 00 00       	call   b71d <memset>
    itoa(min_val, kernel_total_mem / 10);
    a11c:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    a121:	89 f0                	mov    %esi,%eax
    a123:	f7 e2                	mul    %edx
    a125:	c1 ea 03             	shr    $0x3,%edx
    a128:	83 c4 08             	add    $0x8,%esp
    a12b:	52                   	push   %edx
    a12c:	53                   	push   %ebx
    a12d:	e8 18 17 00 00       	call   b84a <itoa>

    // Protect portion of memory for the current nested cgroup
    memset(temp_path_g, 0, MAX_PATH_LENGTH);
    a132:	83 c4 0c             	add    $0xc,%esp
    a135:	68 00 02 00 00       	push   $0x200
    a13a:	6a 00                	push   $0x0
    a13c:	68 40 40 01 00       	push   $0x14040
    a141:	e8 d7 15 00 00       	call   b71d <memset>
    strcpy(temp_path_g, current_nested_cgroup);
    a146:	83 c4 08             	add    $0x8,%esp
    a149:	8d 85 dc fd ff ff    	lea    -0x224(%ebp),%eax
    a14f:	50                   	push   %eax
    a150:	68 40 40 01 00       	push   $0x14040
    a155:	e8 35 15 00 00       	call   b68f <strcpy>
    strcat(temp_path_g, TEST_NESTED_MEM_MIN);
    a15a:	83 c4 08             	add    $0x8,%esp
    a15d:	68 46 c2 00 00       	push   $0xc246
    a162:	68 40 40 01 00       	push   $0x14040
    a167:	e8 6a 17 00 00       	call   b8d6 <strcat>
    printf(1, "temp_path_g nested cgroup min path: %s\n", temp_path_g);
    a16c:	83 c4 0c             	add    $0xc,%esp
    a16f:	68 40 40 01 00       	push   $0x14040
    a174:	68 b4 0e 01 00       	push   $0x10eb4
    a179:	6a 01                	push   $0x1
    a17b:	e8 e7 19 00 00       	call   bb67 <printf>
    ASSERT_TRUE(write_file(temp_path_g, min_val));
    a180:	83 c4 08             	add    $0x8,%esp
    a183:	53                   	push   %ebx
    a184:	68 40 40 01 00       	push   $0x14040
    a189:	e8 c0 60 ff ff       	call   24e <write_file>
    a18e:	83 c4 10             	add    $0x10,%esp
    a191:	85 c0                	test   %eax,%eax
    a193:	75 72                	jne    a207 <test_nested_cgroups+0x2c7>
    a195:	eb 17                	jmp    a1ae <test_nested_cgroups+0x26e>
    a197:	83 ec 08             	sub    $0x8,%esp
    a19a:	68 3c bf 00 00       	push   $0xbf3c
    a19f:	6a 01                	push   $0x1
    a1a1:	e8 c1 19 00 00       	call   bb67 <printf>
    a1a6:	83 c3 01             	add    $0x1,%ebx
    a1a9:	83 c4 10             	add    $0x10,%esp
    a1ac:	eb 05                	jmp    a1b3 <test_nested_cgroups+0x273>
    a1ae:	bb 00 00 00 00       	mov    $0x0,%ebx
    a1b3:	83 ec 0c             	sub    $0xc,%esp
    a1b6:	68 dc 0e 01 00       	push   $0x10edc
    a1bb:	e8 43 15 00 00       	call   b703 <strlen>
    a1c0:	89 c6                	mov    %eax,%esi
    a1c2:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a1c9:	e8 35 15 00 00       	call   b703 <strlen>
    a1ce:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a1d2:	83 c4 10             	add    $0x10,%esp
    a1d5:	39 d8                	cmp    %ebx,%eax
    a1d7:	77 be                	ja     a197 <test_nested_cgroups+0x257>
    a1d9:	83 ec 0c             	sub    $0xc,%esp
    a1dc:	68 fb 05 00 00       	push   $0x5fb
    a1e1:	68 f9 bf 00 00       	push   $0xbff9
    a1e6:	ff 75 08             	pushl  0x8(%ebp)
    a1e9:	68 00 0f 01 00       	push   $0x10f00
    a1ee:	6a 01                	push   $0x1
    a1f0:	e8 72 19 00 00       	call   bb67 <printf>
    a1f5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a1fc:	00 00 00 
    a1ff:	83 c4 20             	add    $0x20,%esp
    a202:	e9 5c 04 00 00       	jmp    a663 <test_nested_cgroups+0x723>
    read_file(temp_path_g, 1);
    a207:	83 ec 08             	sub    $0x8,%esp
    a20a:	6a 01                	push   $0x1
    a20c:	68 40 40 01 00       	push   $0x14040
    a211:	e8 86 5f ff ff       	call   19c <read_file>

    //create another nested cgroup (mem controller should be enabled)
    current_nesting_index++;
    a216:	0f b6 85 d7 fd ff ff 	movzbl -0x229(%ebp),%eax
    a21d:	83 c0 01             	add    $0x1,%eax
    a220:	88 85 d6 fd ff ff    	mov    %al,-0x22a(%ebp)
    a226:	88 85 d7 fd ff ff    	mov    %al,-0x229(%ebp)
    strcat(current_nested_cgroup, TESTED_NESTED_CGROUP_CHILD);
    a22c:	83 c4 08             	add    $0x8,%esp
    a22f:	68 7c c7 00 00       	push   $0xc77c
    a234:	8d 9d dc fd ff ff    	lea    -0x224(%ebp),%ebx
    a23a:	53                   	push   %ebx
    a23b:	e8 96 16 00 00       	call   b8d6 <strcat>
    current_nested_cgroup[strlen(current_nested_cgroup)] = current_nesting_index;
    a240:	89 1c 24             	mov    %ebx,(%esp)
    a243:	e8 bb 14 00 00       	call   b703 <strlen>
    a248:	0f b6 8d d6 fd ff ff 	movzbl -0x22a(%ebp),%ecx
    a24f:	88 8c 05 dc fd ff ff 	mov    %cl,-0x224(%ebp,%eax,1)
    ASSERT_FALSE(mkdir(current_nested_cgroup));
    a256:	89 1c 24             	mov    %ebx,(%esp)
    a259:	e8 80 17 00 00       	call   b9de <mkdir>
    a25e:	83 c4 10             	add    $0x10,%esp
    a261:	85 c0                	test   %eax,%eax
    a263:	74 72                	je     a2d7 <test_nested_cgroups+0x397>
    a265:	eb 17                	jmp    a27e <test_nested_cgroups+0x33e>
    a267:	83 ec 08             	sub    $0x8,%esp
    a26a:	68 3c bf 00 00       	push   $0xbf3c
    a26f:	6a 01                	push   $0x1
    a271:	e8 f1 18 00 00       	call   bb67 <printf>
    a276:	83 c3 01             	add    $0x1,%ebx
    a279:	83 c4 10             	add    $0x10,%esp
    a27c:	eb 05                	jmp    a283 <test_nested_cgroups+0x343>
    a27e:	bb 00 00 00 00       	mov    $0x0,%ebx
    a283:	83 ec 0c             	sub    $0xc,%esp
    a286:	68 84 c7 00 00       	push   $0xc784
    a28b:	e8 73 14 00 00       	call   b703 <strlen>
    a290:	89 c6                	mov    %eax,%esi
    a292:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a299:	e8 65 14 00 00       	call   b703 <strlen>
    a29e:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a2a2:	83 c4 10             	add    $0x10,%esp
    a2a5:	39 d8                	cmp    %ebx,%eax
    a2a7:	77 be                	ja     a267 <test_nested_cgroups+0x327>
    a2a9:	83 ec 0c             	sub    $0xc,%esp
    a2ac:	68 02 06 00 00       	push   $0x602
    a2b1:	68 f9 bf 00 00       	push   $0xbff9
    a2b6:	ff 75 08             	pushl  0x8(%ebp)
    a2b9:	68 00 0e 01 00       	push   $0x10e00
    a2be:	6a 01                	push   $0x1
    a2c0:	e8 a2 18 00 00       	call   bb67 <printf>
    a2c5:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a2cc:	00 00 00 
    a2cf:	83 c4 20             	add    $0x20,%esp
    a2d2:	e9 8c 03 00 00       	jmp    a663 <test_nested_cgroups+0x723>

    memset(temp_path_g, 0, MAX_PATH_LENGTH);
    a2d7:	83 ec 04             	sub    $0x4,%esp
    a2da:	68 00 02 00 00       	push   $0x200
    a2df:	6a 00                	push   $0x0
    a2e1:	68 40 40 01 00       	push   $0x14040
    a2e6:	e8 32 14 00 00       	call   b71d <memset>
    strcpy(temp_path_g, current_nested_cgroup);
    a2eb:	83 c4 08             	add    $0x8,%esp
    a2ee:	8d 85 dc fd ff ff    	lea    -0x224(%ebp),%eax
    a2f4:	50                   	push   %eax
    a2f5:	68 40 40 01 00       	push   $0x14040
    a2fa:	e8 90 13 00 00       	call   b68f <strcpy>
    strcat(temp_path_g, TEST_NESTED_SUBTREE_CONTROL);
    a2ff:	83 c4 08             	add    $0x8,%esp
    a302:	68 a1 c7 00 00       	push   $0xc7a1
    a307:	68 40 40 01 00       	push   $0x14040
    a30c:	e8 c5 15 00 00       	call   b8d6 <strcat>
    ASSERT_TRUE(write_file(temp_path_g, "+mem"));
    a311:	83 c4 08             	add    $0x8,%esp
    a314:	68 b4 c5 00 00       	push   $0xc5b4
    a319:	68 40 40 01 00       	push   $0x14040
    a31e:	e8 2b 5f ff ff       	call   24e <write_file>
    a323:	83 c4 10             	add    $0x10,%esp
    a326:	85 c0                	test   %eax,%eax
    a328:	75 72                	jne    a39c <test_nested_cgroups+0x45c>
    a32a:	eb 17                	jmp    a343 <test_nested_cgroups+0x403>
    a32c:	83 ec 08             	sub    $0x8,%esp
    a32f:	68 3c bf 00 00       	push   $0xbf3c
    a334:	6a 01                	push   $0x1
    a336:	e8 2c 18 00 00       	call   bb67 <printf>
    a33b:	83 c3 01             	add    $0x1,%ebx
    a33e:	83 c4 10             	add    $0x10,%esp
    a341:	eb 05                	jmp    a348 <test_nested_cgroups+0x408>
    a343:	bb 00 00 00 00       	mov    $0x0,%ebx
    a348:	83 ec 0c             	sub    $0xc,%esp
    a34b:	68 48 0e 01 00       	push   $0x10e48
    a350:	e8 ae 13 00 00       	call   b703 <strlen>
    a355:	89 c6                	mov    %eax,%esi
    a357:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a35e:	e8 a0 13 00 00       	call   b703 <strlen>
    a363:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a367:	83 c4 10             	add    $0x10,%esp
    a36a:	39 d8                	cmp    %ebx,%eax
    a36c:	77 be                	ja     a32c <test_nested_cgroups+0x3ec>
    a36e:	83 ec 0c             	sub    $0xc,%esp
    a371:	68 07 06 00 00       	push   $0x607
    a376:	68 f9 bf 00 00       	push   $0xbff9
    a37b:	ff 75 08             	pushl  0x8(%ebp)
    a37e:	68 68 0e 01 00       	push   $0x10e68
    a383:	6a 01                	push   $0x1
    a385:	e8 dd 17 00 00       	call   bb67 <printf>
    a38a:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a391:	00 00 00 
    a394:	83 c4 20             	add    $0x20,%esp
    a397:	e9 c7 02 00 00       	jmp    a663 <test_nested_cgroups+0x723>
  strcat(temp_path_g, TEST_NESTED_SUBTREE_CONTROL);
  ASSERT_TRUE(write_file(temp_path_g, "+mem"));

  /* create the 9 other nested groups. Enable memory controller in each of them because
     it's not propagated from the parent cgroup */
  for(depth_cnt = 1; depth_cnt < 10; depth_cnt++)
    a39c:	83 c7 01             	add    $0x1,%edi
    a39f:	83 ff 09             	cmp    $0x9,%edi
    a3a2:	0f 86 64 fd ff ff    	jbe    a10c <test_nested_cgroups+0x1cc>
    strcat(temp_path_g, TEST_NESTED_SUBTREE_CONTROL);
    ASSERT_TRUE(write_file(temp_path_g, "+mem"));
  }

  //check if we can allocate now more memory in the last cgroup
  memset(temp_path_g, 0, MAX_PATH_LENGTH);
    a3a8:	83 ec 04             	sub    $0x4,%esp
    a3ab:	68 00 02 00 00       	push   $0x200
    a3b0:	6a 00                	push   $0x0
    a3b2:	68 40 40 01 00       	push   $0x14040
    a3b7:	e8 61 13 00 00       	call   b71d <memset>
  strcpy(temp_path_g, current_nested_cgroup);
    a3bc:	83 c4 08             	add    $0x8,%esp
    a3bf:	8d 85 dc fd ff ff    	lea    -0x224(%ebp),%eax
    a3c5:	50                   	push   %eax
    a3c6:	68 40 40 01 00       	push   $0x14040
    a3cb:	e8 bf 12 00 00       	call   b68f <strcpy>
  strcat(temp_path_g, TEST_NESTED_MEM_MIN);
    a3d0:	83 c4 08             	add    $0x8,%esp
    a3d3:	68 46 c2 00 00       	push   $0xc246
    a3d8:	68 40 40 01 00       	push   $0x14040
    a3dd:	e8 f4 14 00 00       	call   b8d6 <strcat>

  //allocate 25% of kernel space - should fail (this should also fail for lesser values)
  memset(min_val, 12, 0);
    a3e2:	83 c4 0c             	add    $0xc,%esp
    a3e5:	6a 00                	push   $0x0
    a3e7:	6a 0c                	push   $0xc
    a3e9:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    a3ec:	53                   	push   %ebx
    a3ed:	e8 2b 13 00 00       	call   b71d <memset>
  itoa(min_val, kernel_total_mem / 4);
    a3f2:	c1 ee 02             	shr    $0x2,%esi
    a3f5:	83 c4 08             	add    $0x8,%esp
    a3f8:	56                   	push   %esi
    a3f9:	53                   	push   %ebx
    a3fa:	e8 4b 14 00 00       	call   b84a <itoa>
  ASSERT_FALSE(write_file(temp_path_g, min_val));
    a3ff:	83 c4 08             	add    $0x8,%esp
    a402:	53                   	push   %ebx
    a403:	68 40 40 01 00       	push   $0x14040
    a408:	e8 41 5e ff ff       	call   24e <write_file>
    a40d:	83 c4 10             	add    $0x10,%esp
    a410:	85 c0                	test   %eax,%eax
    a412:	75 19                	jne    a42d <test_nested_cgroups+0x4ed>
    a414:	eb 70                	jmp    a486 <test_nested_cgroups+0x546>
    a416:	83 ec 08             	sub    $0x8,%esp
    a419:	68 3c bf 00 00       	push   $0xbf3c
    a41e:	6a 01                	push   $0x1
    a420:	e8 42 17 00 00       	call   bb67 <printf>
    a425:	83 c3 01             	add    $0x1,%ebx
    a428:	83 c4 10             	add    $0x10,%esp
    a42b:	eb 05                	jmp    a432 <test_nested_cgroups+0x4f2>
    a42d:	bb 00 00 00 00       	mov    $0x0,%ebx
    a432:	83 ec 0c             	sub    $0xc,%esp
    a435:	68 dc 0e 01 00       	push   $0x10edc
    a43a:	e8 c4 12 00 00       	call   b703 <strlen>
    a43f:	89 c6                	mov    %eax,%esi
    a441:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a448:	e8 b6 12 00 00       	call   b703 <strlen>
    a44d:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a451:	83 c4 10             	add    $0x10,%esp
    a454:	39 d8                	cmp    %ebx,%eax
    a456:	77 be                	ja     a416 <test_nested_cgroups+0x4d6>
    a458:	83 ec 0c             	sub    $0xc,%esp
    a45b:	68 12 06 00 00       	push   $0x612
    a460:	68 f9 bf 00 00       	push   $0xbff9
    a465:	ff 75 08             	pushl  0x8(%ebp)
    a468:	68 4c 0f 01 00       	push   $0x10f4c
    a46d:	6a 01                	push   $0x1
    a46f:	e8 f3 16 00 00       	call   bb67 <printf>
    a474:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a47b:	00 00 00 
    a47e:	83 c4 20             	add    $0x20,%esp
    a481:	e9 dd 01 00 00       	jmp    a663 <test_nested_cgroups+0x723>

  memset(min_val, 12, 0);
    a486:	83 ec 04             	sub    $0x4,%esp
    a489:	6a 00                	push   $0x0
    a48b:	6a 0c                	push   $0xc
    a48d:	8d 5d dc             	lea    -0x24(%ebp),%ebx
    a490:	53                   	push   %ebx
    a491:	e8 87 12 00 00       	call   b71d <memset>
  itoa(min_val, 0);
    a496:	83 c4 08             	add    $0x8,%esp
    a499:	6a 00                	push   $0x0
    a49b:	53                   	push   %ebx
    a49c:	e8 a9 13 00 00       	call   b84a <itoa>
  current_nested_cgroup_length = strlen(current_nested_cgroup);
    a4a1:	8d 85 dc fd ff ff    	lea    -0x224(%ebp),%eax
    a4a7:	89 04 24             	mov    %eax,(%esp)
    a4aa:	e8 54 12 00 00       	call   b703 <strlen>
    a4af:	89 c6                	mov    %eax,%esi

  /* disable memory controllers, set min back to 0 and delete cgroups
    Here we do it backwards - reversed tro the last loop */
  for(depth_cnt = 0; depth_cnt < 10; depth_cnt++)
    a4b1:	83 c4 10             	add    $0x10,%esp
    a4b4:	bb 00 00 00 00       	mov    $0x0,%ebx
    a4b9:	e9 9c 01 00 00       	jmp    a65a <test_nested_cgroups+0x71a>
  {
    // set min value to 0 (just in case)
    memset(temp_path_g, 0, MAX_PATH_LENGTH);
    a4be:	83 ec 04             	sub    $0x4,%esp
    a4c1:	68 00 02 00 00       	push   $0x200
    a4c6:	6a 00                	push   $0x0
    a4c8:	68 40 40 01 00       	push   $0x14040
    a4cd:	e8 4b 12 00 00       	call   b71d <memset>
    strcpy(temp_path_g, current_nested_cgroup);
    a4d2:	83 c4 08             	add    $0x8,%esp
    a4d5:	8d 85 dc fd ff ff    	lea    -0x224(%ebp),%eax
    a4db:	50                   	push   %eax
    a4dc:	68 40 40 01 00       	push   $0x14040
    a4e1:	e8 a9 11 00 00       	call   b68f <strcpy>
    strcat(temp_path_g, TEST_NESTED_MEM_MIN);
    a4e6:	83 c4 08             	add    $0x8,%esp
    a4e9:	68 46 c2 00 00       	push   $0xc246
    a4ee:	68 40 40 01 00       	push   $0x14040
    a4f3:	e8 de 13 00 00       	call   b8d6 <strcat>
    ASSERT_TRUE(write_file(temp_path_g, min_val));
    a4f8:	83 c4 08             	add    $0x8,%esp
    a4fb:	8d 45 dc             	lea    -0x24(%ebp),%eax
    a4fe:	50                   	push   %eax
    a4ff:	68 40 40 01 00       	push   $0x14040
    a504:	e8 45 5d ff ff       	call   24e <write_file>
    a509:	83 c4 10             	add    $0x10,%esp
    a50c:	85 c0                	test   %eax,%eax
    a50e:	75 72                	jne    a582 <test_nested_cgroups+0x642>
    a510:	eb 17                	jmp    a529 <test_nested_cgroups+0x5e9>
    a512:	83 ec 08             	sub    $0x8,%esp
    a515:	68 3c bf 00 00       	push   $0xbf3c
    a51a:	6a 01                	push   $0x1
    a51c:	e8 46 16 00 00       	call   bb67 <printf>
    a521:	83 c3 01             	add    $0x1,%ebx
    a524:	83 c4 10             	add    $0x10,%esp
    a527:	eb 05                	jmp    a52e <test_nested_cgroups+0x5ee>
    a529:	bb 00 00 00 00       	mov    $0x0,%ebx
    a52e:	83 ec 0c             	sub    $0xc,%esp
    a531:	68 dc 0e 01 00       	push   $0x10edc
    a536:	e8 c8 11 00 00       	call   b703 <strlen>
    a53b:	89 c6                	mov    %eax,%esi
    a53d:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a544:	e8 ba 11 00 00       	call   b703 <strlen>
    a549:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a54d:	83 c4 10             	add    $0x10,%esp
    a550:	39 d8                	cmp    %ebx,%eax
    a552:	77 be                	ja     a512 <test_nested_cgroups+0x5d2>
    a554:	83 ec 0c             	sub    $0xc,%esp
    a557:	68 20 06 00 00       	push   $0x620
    a55c:	68 f9 bf 00 00       	push   $0xbff9
    a561:	ff 75 08             	pushl  0x8(%ebp)
    a564:	68 00 0f 01 00       	push   $0x10f00
    a569:	6a 01                	push   $0x1
    a56b:	e8 f7 15 00 00       	call   bb67 <printf>
    a570:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a577:	00 00 00 
    a57a:	83 c4 20             	add    $0x20,%esp
    a57d:	e9 e1 00 00 00       	jmp    a663 <test_nested_cgroups+0x723>

    // disable mem controller
    memset(temp_path_g, 0, MAX_PATH_LENGTH);
    a582:	83 ec 04             	sub    $0x4,%esp
    a585:	68 00 02 00 00       	push   $0x200
    a58a:	6a 00                	push   $0x0
    a58c:	68 40 40 01 00       	push   $0x14040
    a591:	e8 87 11 00 00       	call   b71d <memset>
    strcpy(temp_path_g, current_nested_cgroup);
    a596:	83 c4 08             	add    $0x8,%esp
    a599:	8d bd dc fd ff ff    	lea    -0x224(%ebp),%edi
    a59f:	57                   	push   %edi
    a5a0:	68 40 40 01 00       	push   $0x14040
    a5a5:	e8 e5 10 00 00       	call   b68f <strcpy>
    strcat(temp_path_g, TEST_NESTED_SUBTREE_CONTROL);
    a5aa:	83 c4 08             	add    $0x8,%esp
    a5ad:	68 a1 c7 00 00       	push   $0xc7a1
    a5b2:	68 40 40 01 00       	push   $0x14040
    a5b7:	e8 1a 13 00 00       	call   b8d6 <strcat>
    write_file(temp_path_g, "-mem");
    a5bc:	83 c4 08             	add    $0x8,%esp
    a5bf:	68 d2 c5 00 00       	push   $0xc5d2
    a5c4:	68 40 40 01 00       	push   $0x14040
    a5c9:	e8 80 5c ff ff       	call   24e <write_file>

    //delete nested cgroup
    ASSERT_FALSE(unlink(current_nested_cgroup));
    a5ce:	89 3c 24             	mov    %edi,(%esp)
    a5d1:	e8 f0 13 00 00       	call   b9c6 <unlink>
    a5d6:	83 c4 10             	add    $0x10,%esp
    a5d9:	85 c0                	test   %eax,%eax
    a5db:	74 6f                	je     a64c <test_nested_cgroups+0x70c>
    a5dd:	eb 17                	jmp    a5f6 <test_nested_cgroups+0x6b6>
    a5df:	83 ec 08             	sub    $0x8,%esp
    a5e2:	68 3c bf 00 00       	push   $0xbf3c
    a5e7:	6a 01                	push   $0x1
    a5e9:	e8 79 15 00 00       	call   bb67 <printf>
    a5ee:	83 c3 01             	add    $0x1,%ebx
    a5f1:	83 c4 10             	add    $0x10,%esp
    a5f4:	eb 05                	jmp    a5fb <test_nested_cgroups+0x6bb>
    a5f6:	bb 00 00 00 00       	mov    $0x0,%ebx
    a5fb:	83 ec 0c             	sub    $0xc,%esp
    a5fe:	68 b9 c7 00 00       	push   $0xc7b9
    a603:	e8 fb 10 00 00       	call   b703 <strlen>
    a608:	89 c6                	mov    %eax,%esi
    a60a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a611:	e8 ed 10 00 00       	call   b703 <strlen>
    a616:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a61a:	83 c4 10             	add    $0x10,%esp
    a61d:	39 d8                	cmp    %ebx,%eax
    a61f:	77 be                	ja     a5df <test_nested_cgroups+0x69f>
    a621:	83 ec 0c             	sub    $0xc,%esp
    a624:	68 29 06 00 00       	push   $0x629
    a629:	68 f9 bf 00 00       	push   $0xbff9
    a62e:	ff 75 08             	pushl  0x8(%ebp)
    a631:	68 98 0f 01 00       	push   $0x10f98
    a636:	6a 01                	push   $0x1
    a638:	e8 2a 15 00 00       	call   bb67 <printf>
    a63d:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    a644:	00 00 00 
    a647:	83 c4 20             	add    $0x20,%esp
    a64a:	eb 17                	jmp    a663 <test_nested_cgroups+0x723>

    current_nested_cgroup_length -= sizeof(TESTED_NESTED_CGROUP_CHILD);
    a64c:	83 ee 08             	sub    $0x8,%esi
    current_nested_cgroup[current_nested_cgroup_length] = 0;
    a64f:	c6 84 35 dc fd ff ff 	movb   $0x0,-0x224(%ebp,%esi,1)
    a656:	00 
  itoa(min_val, 0);
  current_nested_cgroup_length = strlen(current_nested_cgroup);

  /* disable memory controllers, set min back to 0 and delete cgroups
    Here we do it backwards - reversed tro the last loop */
  for(depth_cnt = 0; depth_cnt < 10; depth_cnt++)
    a657:	83 c3 01             	add    $0x1,%ebx
    a65a:	83 fb 09             	cmp    $0x9,%ebx
    a65d:	0f 86 5b fe ff ff    	jbe    a4be <test_nested_cgroups+0x57e>
    ASSERT_FALSE(unlink(current_nested_cgroup));

    current_nested_cgroup_length -= sizeof(TESTED_NESTED_CGROUP_CHILD);
    current_nested_cgroup[current_nested_cgroup_length] = 0;
  }
}
    a663:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a666:	5b                   	pop    %ebx
    a667:	5e                   	pop    %esi
    a668:	5f                   	pop    %edi
    a669:	5d                   	pop    %ebp
    a66a:	c3                   	ret    

0000a66b <main>:


int main(int argc, char * argv[])
{
    a66b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    a66f:	83 e4 f0             	and    $0xfffffff0,%esp
    a672:	ff 71 fc             	pushl  -0x4(%ecx)
    a675:	55                   	push   %ebp
    a676:	89 e5                	mov    %esp,%ebp
    a678:	56                   	push   %esi
    a679:	53                   	push   %ebx
    a67a:	51                   	push   %ecx
    a67b:	83 ec 0c             	sub    $0xc,%esp
    // comment out for debug messages
    set_suppress(1);
    a67e:	6a 01                	push   $0x1
    a680:	e8 55 5a ff ff       	call   da <set_suppress>

    run_test(test_mount_cgroup_fs);
    a685:	83 c4 04             	add    $0x4,%esp
    a688:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a68f:	75 23                	jne    a6b4 <main+0x49>
    a691:	83 ec 04             	sub    $0x4,%esp
    a694:	68 d7 c7 00 00       	push   $0xc7d7
    a699:	68 ec c7 00 00       	push   $0xc7ec
    a69e:	6a 01                	push   $0x1
    a6a0:	e8 c2 14 00 00       	call   bb67 <printf>
    a6a5:	c7 04 24 d7 c7 00 00 	movl   $0xc7d7,(%esp)
    a6ac:	e8 e1 61 ff ff       	call   892 <test_mount_cgroup_fs>
    a6b1:	83 c4 10             	add    $0x10,%esp
    a6b4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a6bb:	74 19                	je     a6d6 <main+0x6b>
    a6bd:	eb 59                	jmp    a718 <main+0xad>
    a6bf:	83 ec 08             	sub    $0x8,%esp
    a6c2:	68 3c bf 00 00       	push   $0xbf3c
    a6c7:	6a 01                	push   $0x1
    a6c9:	e8 99 14 00 00       	call   bb67 <printf>
    a6ce:	83 c3 01             	add    $0x1,%ebx
    a6d1:	83 c4 10             	add    $0x10,%esp
    a6d4:	eb 05                	jmp    a6db <main+0x70>
    a6d6:	bb 00 00 00 00       	mov    $0x0,%ebx
    a6db:	83 ec 0c             	sub    $0xc,%esp
    a6de:	68 d7 c7 00 00       	push   $0xc7d7
    a6e3:	e8 1b 10 00 00       	call   b703 <strlen>
    a6e8:	89 c6                	mov    %eax,%esi
    a6ea:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a6f1:	e8 0d 10 00 00       	call   b703 <strlen>
    a6f6:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a6fa:	83 c4 10             	add    $0x10,%esp
    a6fd:	39 d8                	cmp    %ebx,%eax
    a6ff:	77 be                	ja     a6bf <main+0x54>
    a701:	83 ec 04             	sub    $0x4,%esp
    a704:	68 d7 c7 00 00       	push   $0xc7d7
    a709:	68 f9 c7 00 00       	push   $0xc7f9
    a70e:	6a 01                	push   $0x1
    a710:	e8 52 14 00 00       	call   bb67 <printf>
    a715:	83 c4 10             	add    $0x10,%esp
    run_test(test_creating_cgroups);
    a718:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a71f:	75 23                	jne    a744 <main+0xd9>
    a721:	83 ec 04             	sub    $0x4,%esp
    a724:	68 07 c8 00 00       	push   $0xc807
    a729:	68 ec c7 00 00       	push   $0xc7ec
    a72e:	6a 01                	push   $0x1
    a730:	e8 32 14 00 00       	call   bb67 <printf>
    a735:	c7 04 24 07 c8 00 00 	movl   $0xc807,(%esp)
    a73c:	e8 7e 63 ff ff       	call   abf <test_creating_cgroups>
    a741:	83 c4 10             	add    $0x10,%esp
    a744:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a74b:	74 19                	je     a766 <main+0xfb>
    a74d:	eb 59                	jmp    a7a8 <main+0x13d>
    a74f:	83 ec 08             	sub    $0x8,%esp
    a752:	68 3c bf 00 00       	push   $0xbf3c
    a757:	6a 01                	push   $0x1
    a759:	e8 09 14 00 00       	call   bb67 <printf>
    a75e:	83 c3 01             	add    $0x1,%ebx
    a761:	83 c4 10             	add    $0x10,%esp
    a764:	eb 05                	jmp    a76b <main+0x100>
    a766:	bb 00 00 00 00       	mov    $0x0,%ebx
    a76b:	83 ec 0c             	sub    $0xc,%esp
    a76e:	68 07 c8 00 00       	push   $0xc807
    a773:	e8 8b 0f 00 00       	call   b703 <strlen>
    a778:	89 c6                	mov    %eax,%esi
    a77a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a781:	e8 7d 0f 00 00       	call   b703 <strlen>
    a786:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a78a:	83 c4 10             	add    $0x10,%esp
    a78d:	39 d8                	cmp    %ebx,%eax
    a78f:	77 be                	ja     a74f <main+0xe4>
    a791:	83 ec 04             	sub    $0x4,%esp
    a794:	68 07 c8 00 00       	push   $0xc807
    a799:	68 f9 c7 00 00       	push   $0xc7f9
    a79e:	6a 01                	push   $0x1
    a7a0:	e8 c2 13 00 00       	call   bb67 <printf>
    a7a5:	83 c4 10             	add    $0x10,%esp
    run_test(test_opening_and_closing_cgroup_files);
    a7a8:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a7af:	75 23                	jne    a7d4 <main+0x169>
    a7b1:	83 ec 04             	sub    $0x4,%esp
    a7b4:	68 e0 0f 01 00       	push   $0x10fe0
    a7b9:	68 ec c7 00 00       	push   $0xc7ec
    a7be:	6a 01                	push   $0x1
    a7c0:	e8 a2 13 00 00       	call   bb67 <printf>
    a7c5:	c7 04 24 e0 0f 01 00 	movl   $0x10fe0,(%esp)
    a7cc:	e8 2c 67 ff ff       	call   efd <test_opening_and_closing_cgroup_files>
    a7d1:	83 c4 10             	add    $0x10,%esp
    a7d4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a7db:	74 19                	je     a7f6 <main+0x18b>
    a7dd:	eb 59                	jmp    a838 <main+0x1cd>
    a7df:	83 ec 08             	sub    $0x8,%esp
    a7e2:	68 3c bf 00 00       	push   $0xbf3c
    a7e7:	6a 01                	push   $0x1
    a7e9:	e8 79 13 00 00       	call   bb67 <printf>
    a7ee:	83 c3 01             	add    $0x1,%ebx
    a7f1:	83 c4 10             	add    $0x10,%esp
    a7f4:	eb 05                	jmp    a7fb <main+0x190>
    a7f6:	bb 00 00 00 00       	mov    $0x0,%ebx
    a7fb:	83 ec 0c             	sub    $0xc,%esp
    a7fe:	68 e0 0f 01 00       	push   $0x10fe0
    a803:	e8 fb 0e 00 00       	call   b703 <strlen>
    a808:	89 c6                	mov    %eax,%esi
    a80a:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a811:	e8 ed 0e 00 00       	call   b703 <strlen>
    a816:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a81a:	83 c4 10             	add    $0x10,%esp
    a81d:	39 d8                	cmp    %ebx,%eax
    a81f:	77 be                	ja     a7df <main+0x174>
    a821:	83 ec 04             	sub    $0x4,%esp
    a824:	68 e0 0f 01 00       	push   $0x10fe0
    a829:	68 f9 c7 00 00       	push   $0xc7f9
    a82e:	6a 01                	push   $0x1
    a830:	e8 32 13 00 00       	call   bb67 <printf>
    a835:	83 c4 10             	add    $0x10,%esp
    run_test_break_msg(test_reading_cgroup_files);
    a838:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a83f:	75 23                	jne    a864 <main+0x1f9>
    a841:	83 ec 04             	sub    $0x4,%esp
    a844:	68 1d c8 00 00       	push   $0xc81d
    a849:	68 37 c8 00 00       	push   $0xc837
    a84e:	6a 01                	push   $0x1
    a850:	e8 12 13 00 00       	call   bb67 <printf>
    a855:	c7 04 24 1d c8 00 00 	movl   $0xc81d,(%esp)
    a85c:	e8 ed 6f ff ff       	call   184e <test_reading_cgroup_files>
    a861:	83 c4 10             	add    $0x10,%esp
    a864:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a86b:	75 17                	jne    a884 <main+0x219>
    a86d:	83 ec 04             	sub    $0x4,%esp
    a870:	68 1d c8 00 00       	push   $0xc81d
    a875:	68 45 c8 00 00       	push   $0xc845
    a87a:	6a 01                	push   $0x1
    a87c:	e8 e6 12 00 00       	call   bb67 <printf>
    a881:	83 c4 10             	add    $0x10,%esp
    run_test(test_memory_stat_content_valid);
    a884:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a88b:	75 23                	jne    a8b0 <main+0x245>
    a88d:	83 ec 04             	sub    $0x4,%esp
    a890:	68 08 10 01 00       	push   $0x11008
    a895:	68 ec c7 00 00       	push   $0xc7ec
    a89a:	6a 01                	push   $0x1
    a89c:	e8 c6 12 00 00       	call   bb67 <printf>
    a8a1:	c7 04 24 08 10 01 00 	movl   $0x11008,(%esp)
    a8a8:	e8 5a e4 ff ff       	call   8d07 <test_memory_stat_content_valid>
    a8ad:	83 c4 10             	add    $0x10,%esp
    a8b0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a8b7:	74 19                	je     a8d2 <main+0x267>
    a8b9:	eb 59                	jmp    a914 <main+0x2a9>
    a8bb:	83 ec 08             	sub    $0x8,%esp
    a8be:	68 3c bf 00 00       	push   $0xbf3c
    a8c3:	6a 01                	push   $0x1
    a8c5:	e8 9d 12 00 00       	call   bb67 <printf>
    a8ca:	83 c3 01             	add    $0x1,%ebx
    a8cd:	83 c4 10             	add    $0x10,%esp
    a8d0:	eb 05                	jmp    a8d7 <main+0x26c>
    a8d2:	bb 00 00 00 00       	mov    $0x0,%ebx
    a8d7:	83 ec 0c             	sub    $0xc,%esp
    a8da:	68 08 10 01 00       	push   $0x11008
    a8df:	e8 1f 0e 00 00       	call   b703 <strlen>
    a8e4:	89 c6                	mov    %eax,%esi
    a8e6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a8ed:	e8 11 0e 00 00       	call   b703 <strlen>
    a8f2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a8f6:	83 c4 10             	add    $0x10,%esp
    a8f9:	39 d8                	cmp    %ebx,%eax
    a8fb:	77 be                	ja     a8bb <main+0x250>
    a8fd:	83 ec 04             	sub    $0x4,%esp
    a900:	68 08 10 01 00       	push   $0x11008
    a905:	68 f9 c7 00 00       	push   $0xc7f9
    a90a:	6a 01                	push   $0x1
    a90c:	e8 56 12 00 00       	call   bb67 <printf>
    a911:	83 c4 10             	add    $0x10,%esp
    run_test(test_cpu_stat_content_valid);
    a914:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a91b:	75 23                	jne    a940 <main+0x2d5>
    a91d:	83 ec 04             	sub    $0x4,%esp
    a920:	68 50 c8 00 00       	push   $0xc850
    a925:	68 ec c7 00 00       	push   $0xc7ec
    a92a:	6a 01                	push   $0x1
    a92c:	e8 36 12 00 00       	call   bb67 <printf>
    a931:	c7 04 24 50 c8 00 00 	movl   $0xc850,(%esp)
    a938:	e8 78 e5 ff ff       	call   8eb5 <test_cpu_stat_content_valid>
    a93d:	83 c4 10             	add    $0x10,%esp
    a940:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a947:	74 19                	je     a962 <main+0x2f7>
    a949:	eb 59                	jmp    a9a4 <main+0x339>
    a94b:	83 ec 08             	sub    $0x8,%esp
    a94e:	68 3c bf 00 00       	push   $0xbf3c
    a953:	6a 01                	push   $0x1
    a955:	e8 0d 12 00 00       	call   bb67 <printf>
    a95a:	83 c3 01             	add    $0x1,%ebx
    a95d:	83 c4 10             	add    $0x10,%esp
    a960:	eb 05                	jmp    a967 <main+0x2fc>
    a962:	bb 00 00 00 00       	mov    $0x0,%ebx
    a967:	83 ec 0c             	sub    $0xc,%esp
    a96a:	68 50 c8 00 00       	push   $0xc850
    a96f:	e8 8f 0d 00 00       	call   b703 <strlen>
    a974:	89 c6                	mov    %eax,%esi
    a976:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    a97d:	e8 81 0d 00 00       	call   b703 <strlen>
    a982:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    a986:	83 c4 10             	add    $0x10,%esp
    a989:	39 d8                	cmp    %ebx,%eax
    a98b:	77 be                	ja     a94b <main+0x2e0>
    a98d:	83 ec 04             	sub    $0x4,%esp
    a990:	68 50 c8 00 00       	push   $0xc850
    a995:	68 f9 c7 00 00       	push   $0xc7f9
    a99a:	6a 01                	push   $0x1
    a99c:	e8 c6 11 00 00       	call   bb67 <printf>
    a9a1:	83 c4 10             	add    $0x10,%esp
    run_test(test_moving_process);
    a9a4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a9ab:	75 23                	jne    a9d0 <main+0x365>
    a9ad:	83 ec 04             	sub    $0x4,%esp
    a9b0:	68 6c c8 00 00       	push   $0xc86c
    a9b5:	68 ec c7 00 00       	push   $0xc7ec
    a9ba:	6a 01                	push   $0x1
    a9bc:	e8 a6 11 00 00       	call   bb67 <printf>
    a9c1:	c7 04 24 6c c8 00 00 	movl   $0xc86c,(%esp)
    a9c8:	e8 48 89 ff ff       	call   3315 <test_moving_process>
    a9cd:	83 c4 10             	add    $0x10,%esp
    a9d0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    a9d7:	74 19                	je     a9f2 <main+0x387>
    a9d9:	eb 59                	jmp    aa34 <main+0x3c9>
    a9db:	83 ec 08             	sub    $0x8,%esp
    a9de:	68 3c bf 00 00       	push   $0xbf3c
    a9e3:	6a 01                	push   $0x1
    a9e5:	e8 7d 11 00 00       	call   bb67 <printf>
    a9ea:	83 c3 01             	add    $0x1,%ebx
    a9ed:	83 c4 10             	add    $0x10,%esp
    a9f0:	eb 05                	jmp    a9f7 <main+0x38c>
    a9f2:	bb 00 00 00 00       	mov    $0x0,%ebx
    a9f7:	83 ec 0c             	sub    $0xc,%esp
    a9fa:	68 6c c8 00 00       	push   $0xc86c
    a9ff:	e8 ff 0c 00 00       	call   b703 <strlen>
    aa04:	89 c6                	mov    %eax,%esi
    aa06:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    aa0d:	e8 f1 0c 00 00       	call   b703 <strlen>
    aa12:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    aa16:	83 c4 10             	add    $0x10,%esp
    aa19:	39 d8                	cmp    %ebx,%eax
    aa1b:	77 be                	ja     a9db <main+0x370>
    aa1d:	83 ec 04             	sub    $0x4,%esp
    aa20:	68 6c c8 00 00       	push   $0xc86c
    aa25:	68 f9 c7 00 00       	push   $0xc7f9
    aa2a:	6a 01                	push   $0x1
    aa2c:	e8 36 11 00 00       	call   bb67 <printf>
    aa31:	83 c4 10             	add    $0x10,%esp
    run_test(test_enable_and_disable_all_controllers);
    aa34:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    aa3b:	75 23                	jne    aa60 <main+0x3f5>
    aa3d:	83 ec 04             	sub    $0x4,%esp
    aa40:	68 28 10 01 00       	push   $0x11028
    aa45:	68 ec c7 00 00       	push   $0xc7ec
    aa4a:	6a 01                	push   $0x1
    aa4c:	e8 16 11 00 00       	call   bb67 <printf>
    aa51:	c7 04 24 28 10 01 00 	movl   $0x11028,(%esp)
    aa58:	e8 14 78 ff ff       	call   2271 <test_enable_and_disable_all_controllers>
    aa5d:	83 c4 10             	add    $0x10,%esp
    aa60:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    aa67:	74 19                	je     aa82 <main+0x417>
    aa69:	eb 59                	jmp    aac4 <main+0x459>
    aa6b:	83 ec 08             	sub    $0x8,%esp
    aa6e:	68 3c bf 00 00       	push   $0xbf3c
    aa73:	6a 01                	push   $0x1
    aa75:	e8 ed 10 00 00       	call   bb67 <printf>
    aa7a:	83 c3 01             	add    $0x1,%ebx
    aa7d:	83 c4 10             	add    $0x10,%esp
    aa80:	eb 05                	jmp    aa87 <main+0x41c>
    aa82:	bb 00 00 00 00       	mov    $0x0,%ebx
    aa87:	83 ec 0c             	sub    $0xc,%esp
    aa8a:	68 28 10 01 00       	push   $0x11028
    aa8f:	e8 6f 0c 00 00       	call   b703 <strlen>
    aa94:	89 c6                	mov    %eax,%esi
    aa96:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    aa9d:	e8 61 0c 00 00       	call   b703 <strlen>
    aaa2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    aaa6:	83 c4 10             	add    $0x10,%esp
    aaa9:	39 d8                	cmp    %ebx,%eax
    aaab:	77 be                	ja     aa6b <main+0x400>
    aaad:	83 ec 04             	sub    $0x4,%esp
    aab0:	68 28 10 01 00       	push   $0x11028
    aab5:	68 f9 c7 00 00       	push   $0xc7f9
    aaba:	6a 01                	push   $0x1
    aabc:	e8 a6 10 00 00       	call   bb67 <printf>
    aac1:	83 c4 10             	add    $0x10,%esp
    run_test(test_limiting_pids);
    aac4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    aacb:	75 23                	jne    aaf0 <main+0x485>
    aacd:	83 ec 04             	sub    $0x4,%esp
    aad0:	68 80 c8 00 00       	push   $0xc880
    aad5:	68 ec c7 00 00       	push   $0xc7ec
    aada:	6a 01                	push   $0x1
    aadc:	e8 86 10 00 00       	call   bb67 <printf>
    aae1:	c7 04 24 80 c8 00 00 	movl   $0xc880,(%esp)
    aae8:	e8 6a 7b ff ff       	call   2657 <test_limiting_pids>
    aaed:	83 c4 10             	add    $0x10,%esp
    aaf0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    aaf7:	74 19                	je     ab12 <main+0x4a7>
    aaf9:	eb 59                	jmp    ab54 <main+0x4e9>
    aafb:	83 ec 08             	sub    $0x8,%esp
    aafe:	68 3c bf 00 00       	push   $0xbf3c
    ab03:	6a 01                	push   $0x1
    ab05:	e8 5d 10 00 00       	call   bb67 <printf>
    ab0a:	83 c3 01             	add    $0x1,%ebx
    ab0d:	83 c4 10             	add    $0x10,%esp
    ab10:	eb 05                	jmp    ab17 <main+0x4ac>
    ab12:	bb 00 00 00 00       	mov    $0x0,%ebx
    ab17:	83 ec 0c             	sub    $0xc,%esp
    ab1a:	68 80 c8 00 00       	push   $0xc880
    ab1f:	e8 df 0b 00 00       	call   b703 <strlen>
    ab24:	89 c6                	mov    %eax,%esi
    ab26:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    ab2d:	e8 d1 0b 00 00       	call   b703 <strlen>
    ab32:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    ab36:	83 c4 10             	add    $0x10,%esp
    ab39:	39 d8                	cmp    %ebx,%eax
    ab3b:	77 be                	ja     aafb <main+0x490>
    ab3d:	83 ec 04             	sub    $0x4,%esp
    ab40:	68 80 c8 00 00       	push   $0xc880
    ab45:	68 f9 c7 00 00       	push   $0xc7f9
    ab4a:	6a 01                	push   $0x1
    ab4c:	e8 16 10 00 00       	call   bb67 <printf>
    ab51:	83 c4 10             	add    $0x10,%esp
    run_test(test_move_failure);
    ab54:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ab5b:	75 23                	jne    ab80 <main+0x515>
    ab5d:	83 ec 04             	sub    $0x4,%esp
    ab60:	68 93 c8 00 00       	push   $0xc893
    ab65:	68 ec c7 00 00       	push   $0xc7ec
    ab6a:	6a 01                	push   $0x1
    ab6c:	e8 f6 0f 00 00       	call   bb67 <printf>
    ab71:	c7 04 24 93 c8 00 00 	movl   $0xc893,(%esp)
    ab78:	e8 a6 7d ff ff       	call   2923 <test_move_failure>
    ab7d:	83 c4 10             	add    $0x10,%esp
    ab80:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ab87:	74 19                	je     aba2 <main+0x537>
    ab89:	eb 59                	jmp    abe4 <main+0x579>
    ab8b:	83 ec 08             	sub    $0x8,%esp
    ab8e:	68 3c bf 00 00       	push   $0xbf3c
    ab93:	6a 01                	push   $0x1
    ab95:	e8 cd 0f 00 00       	call   bb67 <printf>
    ab9a:	83 c3 01             	add    $0x1,%ebx
    ab9d:	83 c4 10             	add    $0x10,%esp
    aba0:	eb 05                	jmp    aba7 <main+0x53c>
    aba2:	bb 00 00 00 00       	mov    $0x0,%ebx
    aba7:	83 ec 0c             	sub    $0xc,%esp
    abaa:	68 93 c8 00 00       	push   $0xc893
    abaf:	e8 4f 0b 00 00       	call   b703 <strlen>
    abb4:	89 c6                	mov    %eax,%esi
    abb6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    abbd:	e8 41 0b 00 00       	call   b703 <strlen>
    abc2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    abc6:	83 c4 10             	add    $0x10,%esp
    abc9:	39 d8                	cmp    %ebx,%eax
    abcb:	77 be                	ja     ab8b <main+0x520>
    abcd:	83 ec 04             	sub    $0x4,%esp
    abd0:	68 93 c8 00 00       	push   $0xc893
    abd5:	68 f9 c7 00 00       	push   $0xc7f9
    abda:	6a 01                	push   $0x1
    abdc:	e8 86 0f 00 00       	call   bb67 <printf>
    abe1:	83 c4 10             	add    $0x10,%esp
    run_test(test_fork_failure);
    abe4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    abeb:	75 23                	jne    ac10 <main+0x5a5>
    abed:	83 ec 04             	sub    $0x4,%esp
    abf0:	68 a5 c8 00 00       	push   $0xc8a5
    abf5:	68 ec c7 00 00       	push   $0xc7ec
    abfa:	6a 01                	push   $0x1
    abfc:	e8 66 0f 00 00       	call   bb67 <printf>
    ac01:	c7 04 24 a5 c8 00 00 	movl   $0xc8a5,(%esp)
    ac08:	e8 48 80 ff ff       	call   2c55 <test_fork_failure>
    ac0d:	83 c4 10             	add    $0x10,%esp
    ac10:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ac17:	74 19                	je     ac32 <main+0x5c7>
    ac19:	eb 59                	jmp    ac74 <main+0x609>
    ac1b:	83 ec 08             	sub    $0x8,%esp
    ac1e:	68 3c bf 00 00       	push   $0xbf3c
    ac23:	6a 01                	push   $0x1
    ac25:	e8 3d 0f 00 00       	call   bb67 <printf>
    ac2a:	83 c3 01             	add    $0x1,%ebx
    ac2d:	83 c4 10             	add    $0x10,%esp
    ac30:	eb 05                	jmp    ac37 <main+0x5cc>
    ac32:	bb 00 00 00 00       	mov    $0x0,%ebx
    ac37:	83 ec 0c             	sub    $0xc,%esp
    ac3a:	68 a5 c8 00 00       	push   $0xc8a5
    ac3f:	e8 bf 0a 00 00       	call   b703 <strlen>
    ac44:	89 c6                	mov    %eax,%esi
    ac46:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    ac4d:	e8 b1 0a 00 00       	call   b703 <strlen>
    ac52:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    ac56:	83 c4 10             	add    $0x10,%esp
    ac59:	39 d8                	cmp    %ebx,%eax
    ac5b:	77 be                	ja     ac1b <main+0x5b0>
    ac5d:	83 ec 04             	sub    $0x4,%esp
    ac60:	68 a5 c8 00 00       	push   $0xc8a5
    ac65:	68 f9 c7 00 00       	push   $0xc7f9
    ac6a:	6a 01                	push   $0x1
    ac6c:	e8 f6 0e 00 00       	call   bb67 <printf>
    ac71:	83 c4 10             	add    $0x10,%esp
    run_test(test_cpu_stat);
    ac74:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ac7b:	75 23                	jne    aca0 <main+0x635>
    ac7d:	83 ec 04             	sub    $0x4,%esp
    ac80:	68 b7 c8 00 00       	push   $0xc8b7
    ac85:	68 ec c7 00 00       	push   $0xc7ec
    ac8a:	6a 01                	push   $0x1
    ac8c:	e8 d6 0e 00 00       	call   bb67 <printf>
    ac91:	c7 04 24 b7 c8 00 00 	movl   $0xc8b7,(%esp)
    ac98:	e8 f8 e2 ff ff       	call   8f95 <test_cpu_stat>
    ac9d:	83 c4 10             	add    $0x10,%esp
    aca0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    aca7:	74 19                	je     acc2 <main+0x657>
    aca9:	eb 59                	jmp    ad04 <main+0x699>
    acab:	83 ec 08             	sub    $0x8,%esp
    acae:	68 3c bf 00 00       	push   $0xbf3c
    acb3:	6a 01                	push   $0x1
    acb5:	e8 ad 0e 00 00       	call   bb67 <printf>
    acba:	83 c3 01             	add    $0x1,%ebx
    acbd:	83 c4 10             	add    $0x10,%esp
    acc0:	eb 05                	jmp    acc7 <main+0x65c>
    acc2:	bb 00 00 00 00       	mov    $0x0,%ebx
    acc7:	83 ec 0c             	sub    $0xc,%esp
    acca:	68 b7 c8 00 00       	push   $0xc8b7
    accf:	e8 2f 0a 00 00       	call   b703 <strlen>
    acd4:	89 c6                	mov    %eax,%esi
    acd6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    acdd:	e8 21 0a 00 00       	call   b703 <strlen>
    ace2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    ace6:	83 c4 10             	add    $0x10,%esp
    ace9:	39 d8                	cmp    %ebx,%eax
    aceb:	77 be                	ja     acab <main+0x640>
    aced:	83 ec 04             	sub    $0x4,%esp
    acf0:	68 b7 c8 00 00       	push   $0xc8b7
    acf5:	68 f9 c7 00 00       	push   $0xc7f9
    acfa:	6a 01                	push   $0x1
    acfc:	e8 66 0e 00 00       	call   bb67 <printf>
    ad01:	83 c4 10             	add    $0x10,%esp
    run_test(test_pid_current);
    ad04:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ad0b:	75 23                	jne    ad30 <main+0x6c5>
    ad0d:	83 ec 04             	sub    $0x4,%esp
    ad10:	68 c5 c8 00 00       	push   $0xc8c5
    ad15:	68 ec c7 00 00       	push   $0xc7ec
    ad1a:	6a 01                	push   $0x1
    ad1c:	e8 46 0e 00 00       	call   bb67 <printf>
    ad21:	c7 04 24 c5 c8 00 00 	movl   $0xc8c5,(%esp)
    ad28:	e8 1b 83 ff ff       	call   3048 <test_pid_current>
    ad2d:	83 c4 10             	add    $0x10,%esp
    ad30:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ad37:	74 19                	je     ad52 <main+0x6e7>
    ad39:	eb 59                	jmp    ad94 <main+0x729>
    ad3b:	83 ec 08             	sub    $0x8,%esp
    ad3e:	68 3c bf 00 00       	push   $0xbf3c
    ad43:	6a 01                	push   $0x1
    ad45:	e8 1d 0e 00 00       	call   bb67 <printf>
    ad4a:	83 c3 01             	add    $0x1,%ebx
    ad4d:	83 c4 10             	add    $0x10,%esp
    ad50:	eb 05                	jmp    ad57 <main+0x6ec>
    ad52:	bb 00 00 00 00       	mov    $0x0,%ebx
    ad57:	83 ec 0c             	sub    $0xc,%esp
    ad5a:	68 c5 c8 00 00       	push   $0xc8c5
    ad5f:	e8 9f 09 00 00       	call   b703 <strlen>
    ad64:	89 c6                	mov    %eax,%esi
    ad66:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    ad6d:	e8 91 09 00 00       	call   b703 <strlen>
    ad72:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    ad76:	83 c4 10             	add    $0x10,%esp
    ad79:	39 d8                	cmp    %ebx,%eax
    ad7b:	77 be                	ja     ad3b <main+0x6d0>
    ad7d:	83 ec 04             	sub    $0x4,%esp
    ad80:	68 c5 c8 00 00       	push   $0xc8c5
    ad85:	68 f9 c7 00 00       	push   $0xc7f9
    ad8a:	6a 01                	push   $0x1
    ad8c:	e8 d6 0d 00 00       	call   bb67 <printf>
    ad91:	83 c4 10             	add    $0x10,%esp
    run_test(test_setting_cpu_id);
    ad94:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ad9b:	75 23                	jne    adc0 <main+0x755>
    ad9d:	83 ec 04             	sub    $0x4,%esp
    ada0:	68 d6 c8 00 00       	push   $0xc8d6
    ada5:	68 ec c7 00 00       	push   $0xc7ec
    adaa:	6a 01                	push   $0x1
    adac:	e8 b6 0d 00 00       	call   bb67 <printf>
    adb1:	c7 04 24 d6 c8 00 00 	movl   $0xc8d6,(%esp)
    adb8:	e8 7e 8c ff ff       	call   3a3b <test_setting_cpu_id>
    adbd:	83 c4 10             	add    $0x10,%esp
    adc0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    adc7:	74 19                	je     ade2 <main+0x777>
    adc9:	eb 59                	jmp    ae24 <main+0x7b9>
    adcb:	83 ec 08             	sub    $0x8,%esp
    adce:	68 3c bf 00 00       	push   $0xbf3c
    add3:	6a 01                	push   $0x1
    add5:	e8 8d 0d 00 00       	call   bb67 <printf>
    adda:	83 c3 01             	add    $0x1,%ebx
    addd:	83 c4 10             	add    $0x10,%esp
    ade0:	eb 05                	jmp    ade7 <main+0x77c>
    ade2:	bb 00 00 00 00       	mov    $0x0,%ebx
    ade7:	83 ec 0c             	sub    $0xc,%esp
    adea:	68 d6 c8 00 00       	push   $0xc8d6
    adef:	e8 0f 09 00 00       	call   b703 <strlen>
    adf4:	89 c6                	mov    %eax,%esi
    adf6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    adfd:	e8 01 09 00 00       	call   b703 <strlen>
    ae02:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    ae06:	83 c4 10             	add    $0x10,%esp
    ae09:	39 d8                	cmp    %ebx,%eax
    ae0b:	77 be                	ja     adcb <main+0x760>
    ae0d:	83 ec 04             	sub    $0x4,%esp
    ae10:	68 d6 c8 00 00       	push   $0xc8d6
    ae15:	68 f9 c7 00 00       	push   $0xc7f9
    ae1a:	6a 01                	push   $0x1
    ae1c:	e8 46 0d 00 00       	call   bb67 <printf>
    ae21:	83 c4 10             	add    $0x10,%esp
    run_test(test_correct_cpu_running);
    ae24:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ae2b:	75 23                	jne    ae50 <main+0x7e5>
    ae2d:	83 ec 04             	sub    $0x4,%esp
    ae30:	68 ea c8 00 00       	push   $0xc8ea
    ae35:	68 ec c7 00 00       	push   $0xc7ec
    ae3a:	6a 01                	push   $0x1
    ae3c:	e8 26 0d 00 00       	call   bb67 <printf>
    ae41:	c7 04 24 ea c8 00 00 	movl   $0xc8ea,(%esp)
    ae48:	e8 33 8f ff ff       	call   3d80 <test_correct_cpu_running>
    ae4d:	83 c4 10             	add    $0x10,%esp
    ae50:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    ae57:	74 19                	je     ae72 <main+0x807>
    ae59:	eb 59                	jmp    aeb4 <main+0x849>
    ae5b:	83 ec 08             	sub    $0x8,%esp
    ae5e:	68 3c bf 00 00       	push   $0xbf3c
    ae63:	6a 01                	push   $0x1
    ae65:	e8 fd 0c 00 00       	call   bb67 <printf>
    ae6a:	83 c3 01             	add    $0x1,%ebx
    ae6d:	83 c4 10             	add    $0x10,%esp
    ae70:	eb 05                	jmp    ae77 <main+0x80c>
    ae72:	bb 00 00 00 00       	mov    $0x0,%ebx
    ae77:	83 ec 0c             	sub    $0xc,%esp
    ae7a:	68 ea c8 00 00       	push   $0xc8ea
    ae7f:	e8 7f 08 00 00       	call   b703 <strlen>
    ae84:	89 c6                	mov    %eax,%esi
    ae86:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    ae8d:	e8 71 08 00 00       	call   b703 <strlen>
    ae92:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    ae96:	83 c4 10             	add    $0x10,%esp
    ae99:	39 d8                	cmp    %ebx,%eax
    ae9b:	77 be                	ja     ae5b <main+0x7f0>
    ae9d:	83 ec 04             	sub    $0x4,%esp
    aea0:	68 ea c8 00 00       	push   $0xc8ea
    aea5:	68 f9 c7 00 00       	push   $0xc7f9
    aeaa:	6a 01                	push   $0x1
    aeac:	e8 b6 0c 00 00       	call   bb67 <printf>
    aeb1:	83 c4 10             	add    $0x10,%esp
    run_test(test_no_run);
    aeb4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    aebb:	75 23                	jne    aee0 <main+0x875>
    aebd:	83 ec 04             	sub    $0x4,%esp
    aec0:	68 03 c9 00 00       	push   $0xc903
    aec5:	68 ec c7 00 00       	push   $0xc7ec
    aeca:	6a 01                	push   $0x1
    aecc:	e8 96 0c 00 00       	call   bb67 <printf>
    aed1:	c7 04 24 03 c9 00 00 	movl   $0xc903,(%esp)
    aed8:	e8 36 93 ff ff       	call   4213 <test_no_run>
    aedd:	83 c4 10             	add    $0x10,%esp
    aee0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    aee7:	74 19                	je     af02 <main+0x897>
    aee9:	eb 59                	jmp    af44 <main+0x8d9>
    aeeb:	83 ec 08             	sub    $0x8,%esp
    aeee:	68 3c bf 00 00       	push   $0xbf3c
    aef3:	6a 01                	push   $0x1
    aef5:	e8 6d 0c 00 00       	call   bb67 <printf>
    aefa:	83 c3 01             	add    $0x1,%ebx
    aefd:	83 c4 10             	add    $0x10,%esp
    af00:	eb 05                	jmp    af07 <main+0x89c>
    af02:	bb 00 00 00 00       	mov    $0x0,%ebx
    af07:	83 ec 0c             	sub    $0xc,%esp
    af0a:	68 03 c9 00 00       	push   $0xc903
    af0f:	e8 ef 07 00 00       	call   b703 <strlen>
    af14:	89 c6                	mov    %eax,%esi
    af16:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    af1d:	e8 e1 07 00 00       	call   b703 <strlen>
    af22:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    af26:	83 c4 10             	add    $0x10,%esp
    af29:	39 d8                	cmp    %ebx,%eax
    af2b:	77 be                	ja     aeeb <main+0x880>
    af2d:	83 ec 04             	sub    $0x4,%esp
    af30:	68 03 c9 00 00       	push   $0xc903
    af35:	68 f9 c7 00 00       	push   $0xc7f9
    af3a:	6a 01                	push   $0x1
    af3c:	e8 26 0c 00 00       	call   bb67 <printf>
    af41:	83 c4 10             	add    $0x10,%esp
    run_test(test_mem_stat);
    af44:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    af4b:	75 23                	jne    af70 <main+0x905>
    af4d:	83 ec 04             	sub    $0x4,%esp
    af50:	68 0f c9 00 00       	push   $0xc90f
    af55:	68 ec c7 00 00       	push   $0xc7ec
    af5a:	6a 01                	push   $0x1
    af5c:	e8 06 0c 00 00       	call   bb67 <printf>
    af61:	c7 04 24 0f c9 00 00 	movl   $0xc90f,(%esp)
    af68:	e8 03 e6 ff ff       	call   9570 <test_mem_stat>
    af6d:	83 c4 10             	add    $0x10,%esp
    af70:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    af77:	74 19                	je     af92 <main+0x927>
    af79:	eb 59                	jmp    afd4 <main+0x969>
    af7b:	83 ec 08             	sub    $0x8,%esp
    af7e:	68 3c bf 00 00       	push   $0xbf3c
    af83:	6a 01                	push   $0x1
    af85:	e8 dd 0b 00 00       	call   bb67 <printf>
    af8a:	83 c3 01             	add    $0x1,%ebx
    af8d:	83 c4 10             	add    $0x10,%esp
    af90:	eb 05                	jmp    af97 <main+0x92c>
    af92:	bb 00 00 00 00       	mov    $0x0,%ebx
    af97:	83 ec 0c             	sub    $0xc,%esp
    af9a:	68 0f c9 00 00       	push   $0xc90f
    af9f:	e8 5f 07 00 00       	call   b703 <strlen>
    afa4:	89 c6                	mov    %eax,%esi
    afa6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    afad:	e8 51 07 00 00       	call   b703 <strlen>
    afb2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    afb6:	83 c4 10             	add    $0x10,%esp
    afb9:	39 d8                	cmp    %ebx,%eax
    afbb:	77 be                	ja     af7b <main+0x910>
    afbd:	83 ec 04             	sub    $0x4,%esp
    afc0:	68 0f c9 00 00       	push   $0xc90f
    afc5:	68 f9 c7 00 00       	push   $0xc7f9
    afca:	6a 01                	push   $0x1
    afcc:	e8 96 0b 00 00       	call   bb67 <printf>
    afd1:	83 c4 10             	add    $0x10,%esp
    run_test(test_setting_freeze);
    afd4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    afdb:	75 23                	jne    b000 <main+0x995>
    afdd:	83 ec 04             	sub    $0x4,%esp
    afe0:	68 1d c9 00 00       	push   $0xc91d
    afe5:	68 ec c7 00 00       	push   $0xc7ec
    afea:	6a 01                	push   $0x1
    afec:	e8 76 0b 00 00       	call   bb67 <printf>
    aff1:	c7 04 24 1d c9 00 00 	movl   $0xc91d,(%esp)
    aff8:	e8 28 98 ff ff       	call   4825 <test_setting_freeze>
    affd:	83 c4 10             	add    $0x10,%esp
    b000:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b007:	74 19                	je     b022 <main+0x9b7>
    b009:	eb 59                	jmp    b064 <main+0x9f9>
    b00b:	83 ec 08             	sub    $0x8,%esp
    b00e:	68 3c bf 00 00       	push   $0xbf3c
    b013:	6a 01                	push   $0x1
    b015:	e8 4d 0b 00 00       	call   bb67 <printf>
    b01a:	83 c3 01             	add    $0x1,%ebx
    b01d:	83 c4 10             	add    $0x10,%esp
    b020:	eb 05                	jmp    b027 <main+0x9bc>
    b022:	bb 00 00 00 00       	mov    $0x0,%ebx
    b027:	83 ec 0c             	sub    $0xc,%esp
    b02a:	68 1d c9 00 00       	push   $0xc91d
    b02f:	e8 cf 06 00 00       	call   b703 <strlen>
    b034:	89 c6                	mov    %eax,%esi
    b036:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b03d:	e8 c1 06 00 00       	call   b703 <strlen>
    b042:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b046:	83 c4 10             	add    $0x10,%esp
    b049:	39 d8                	cmp    %ebx,%eax
    b04b:	77 be                	ja     b00b <main+0x9a0>
    b04d:	83 ec 04             	sub    $0x4,%esp
    b050:	68 1d c9 00 00       	push   $0xc91d
    b055:	68 f9 c7 00 00       	push   $0xc7f9
    b05a:	6a 01                	push   $0x1
    b05c:	e8 06 0b 00 00       	call   bb67 <printf>
    b061:	83 c4 10             	add    $0x10,%esp
    run_test(test_frozen_not_running);
    b064:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b06b:	75 23                	jne    b090 <main+0xa25>
    b06d:	83 ec 04             	sub    $0x4,%esp
    b070:	68 31 c9 00 00       	push   $0xc931
    b075:	68 ec c7 00 00       	push   $0xc7ec
    b07a:	6a 01                	push   $0x1
    b07c:	e8 e6 0a 00 00       	call   bb67 <printf>
    b081:	c7 04 24 31 c9 00 00 	movl   $0xc931,(%esp)
    b088:	e8 9a 9b ff ff       	call   4c27 <test_frozen_not_running>
    b08d:	83 c4 10             	add    $0x10,%esp
    b090:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b097:	74 19                	je     b0b2 <main+0xa47>
    b099:	eb 59                	jmp    b0f4 <main+0xa89>
    b09b:	83 ec 08             	sub    $0x8,%esp
    b09e:	68 3c bf 00 00       	push   $0xbf3c
    b0a3:	6a 01                	push   $0x1
    b0a5:	e8 bd 0a 00 00       	call   bb67 <printf>
    b0aa:	83 c3 01             	add    $0x1,%ebx
    b0ad:	83 c4 10             	add    $0x10,%esp
    b0b0:	eb 05                	jmp    b0b7 <main+0xa4c>
    b0b2:	bb 00 00 00 00       	mov    $0x0,%ebx
    b0b7:	83 ec 0c             	sub    $0xc,%esp
    b0ba:	68 31 c9 00 00       	push   $0xc931
    b0bf:	e8 3f 06 00 00       	call   b703 <strlen>
    b0c4:	89 c6                	mov    %eax,%esi
    b0c6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b0cd:	e8 31 06 00 00       	call   b703 <strlen>
    b0d2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b0d6:	83 c4 10             	add    $0x10,%esp
    b0d9:	39 d8                	cmp    %ebx,%eax
    b0db:	77 be                	ja     b09b <main+0xa30>
    b0dd:	83 ec 04             	sub    $0x4,%esp
    b0e0:	68 31 c9 00 00       	push   $0xc931
    b0e5:	68 f9 c7 00 00       	push   $0xc7f9
    b0ea:	6a 01                	push   $0x1
    b0ec:	e8 76 0a 00 00       	call   bb67 <printf>
    b0f1:	83 c4 10             	add    $0x10,%esp
   // run_test(test_limiting_mem);
   // run_test(test_ensure_mem_min_is_less_then_mem_max);
   // run_test(test_cant_use_protected_memory);
   // run_test(test_release_protected_memory_after_delete_cgroup);
   // run_test(test_cant_move_under_mem_limit);
    run_test(test_nested_cgroups);
    b0f4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b0fb:	75 23                	jne    b120 <main+0xab5>
    b0fd:	83 ec 04             	sub    $0x4,%esp
    b100:	68 49 c9 00 00       	push   $0xc949
    b105:	68 ec c7 00 00       	push   $0xc7ec
    b10a:	6a 01                	push   $0x1
    b10c:	e8 56 0a 00 00       	call   bb67 <printf>
    b111:	c7 04 24 49 c9 00 00 	movl   $0xc949,(%esp)
    b118:	e8 23 ee ff ff       	call   9f40 <test_nested_cgroups>
    b11d:	83 c4 10             	add    $0x10,%esp
    b120:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b127:	74 19                	je     b142 <main+0xad7>
    b129:	eb 59                	jmp    b184 <main+0xb19>
    b12b:	83 ec 08             	sub    $0x8,%esp
    b12e:	68 3c bf 00 00       	push   $0xbf3c
    b133:	6a 01                	push   $0x1
    b135:	e8 2d 0a 00 00       	call   bb67 <printf>
    b13a:	83 c3 01             	add    $0x1,%ebx
    b13d:	83 c4 10             	add    $0x10,%esp
    b140:	eb 05                	jmp    b147 <main+0xadc>
    b142:	bb 00 00 00 00       	mov    $0x0,%ebx
    b147:	83 ec 0c             	sub    $0xc,%esp
    b14a:	68 49 c9 00 00       	push   $0xc949
    b14f:	e8 af 05 00 00       	call   b703 <strlen>
    b154:	89 c6                	mov    %eax,%esi
    b156:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b15d:	e8 a1 05 00 00       	call   b703 <strlen>
    b162:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b166:	83 c4 10             	add    $0x10,%esp
    b169:	39 d8                	cmp    %ebx,%eax
    b16b:	77 be                	ja     b12b <main+0xac0>
    b16d:	83 ec 04             	sub    $0x4,%esp
    b170:	68 49 c9 00 00       	push   $0xc949
    b175:	68 f9 c7 00 00       	push   $0xc7f9
    b17a:	6a 01                	push   $0x1
    b17c:	e8 e6 09 00 00       	call   bb67 <printf>
    b181:	83 c4 10             	add    $0x10,%esp
    run_test(test_mem_limit_negative_and_over_kernelbase);
    b184:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b18b:	75 23                	jne    b1b0 <main+0xb45>
    b18d:	83 ec 04             	sub    $0x4,%esp
    b190:	68 50 10 01 00       	push   $0x11050
    b195:	68 ec c7 00 00       	push   $0xc7ec
    b19a:	6a 01                	push   $0x1
    b19c:	e8 c6 09 00 00       	call   bb67 <printf>
    b1a1:	c7 04 24 50 10 01 00 	movl   $0x11050,(%esp)
    b1a8:	e8 fc c5 ff ff       	call   77a9 <test_mem_limit_negative_and_over_kernelbase>
    b1ad:	83 c4 10             	add    $0x10,%esp
    b1b0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b1b7:	74 19                	je     b1d2 <main+0xb67>
    b1b9:	eb 59                	jmp    b214 <main+0xba9>
    b1bb:	83 ec 08             	sub    $0x8,%esp
    b1be:	68 3c bf 00 00       	push   $0xbf3c
    b1c3:	6a 01                	push   $0x1
    b1c5:	e8 9d 09 00 00       	call   bb67 <printf>
    b1ca:	83 c3 01             	add    $0x1,%ebx
    b1cd:	83 c4 10             	add    $0x10,%esp
    b1d0:	eb 05                	jmp    b1d7 <main+0xb6c>
    b1d2:	bb 00 00 00 00       	mov    $0x0,%ebx
    b1d7:	83 ec 0c             	sub    $0xc,%esp
    b1da:	68 50 10 01 00       	push   $0x11050
    b1df:	e8 1f 05 00 00       	call   b703 <strlen>
    b1e4:	89 c6                	mov    %eax,%esi
    b1e6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b1ed:	e8 11 05 00 00       	call   b703 <strlen>
    b1f2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b1f6:	83 c4 10             	add    $0x10,%esp
    b1f9:	39 d8                	cmp    %ebx,%eax
    b1fb:	77 be                	ja     b1bb <main+0xb50>
    b1fd:	83 ec 04             	sub    $0x4,%esp
    b200:	68 50 10 01 00       	push   $0x11050
    b205:	68 f9 c7 00 00       	push   $0xc7f9
    b20a:	6a 01                	push   $0x1
    b20c:	e8 56 09 00 00       	call   bb67 <printf>
    b211:	83 c4 10             	add    $0x10,%esp
    run_test(test_cant_move_over_mem_limit);
    b214:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b21b:	75 23                	jne    b240 <main+0xbd5>
    b21d:	83 ec 04             	sub    $0x4,%esp
    b220:	68 5d c9 00 00       	push   $0xc95d
    b225:	68 ec c7 00 00       	push   $0xc7ec
    b22a:	6a 01                	push   $0x1
    b22c:	e8 36 09 00 00       	call   bb67 <printf>
    b231:	c7 04 24 5d c9 00 00 	movl   $0xc95d,(%esp)
    b238:	e8 4e cd ff ff       	call   7f8b <test_cant_move_over_mem_limit>
    b23d:	83 c4 10             	add    $0x10,%esp
    b240:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b247:	74 19                	je     b262 <main+0xbf7>
    b249:	eb 59                	jmp    b2a4 <main+0xc39>
    b24b:	83 ec 08             	sub    $0x8,%esp
    b24e:	68 3c bf 00 00       	push   $0xbf3c
    b253:	6a 01                	push   $0x1
    b255:	e8 0d 09 00 00       	call   bb67 <printf>
    b25a:	83 c3 01             	add    $0x1,%ebx
    b25d:	83 c4 10             	add    $0x10,%esp
    b260:	eb 05                	jmp    b267 <main+0xbfc>
    b262:	bb 00 00 00 00       	mov    $0x0,%ebx
    b267:	83 ec 0c             	sub    $0xc,%esp
    b26a:	68 5d c9 00 00       	push   $0xc95d
    b26f:	e8 8f 04 00 00       	call   b703 <strlen>
    b274:	89 c6                	mov    %eax,%esi
    b276:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b27d:	e8 81 04 00 00       	call   b703 <strlen>
    b282:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b286:	83 c4 10             	add    $0x10,%esp
    b289:	39 d8                	cmp    %ebx,%eax
    b28b:	77 be                	ja     b24b <main+0xbe0>
    b28d:	83 ec 04             	sub    $0x4,%esp
    b290:	68 5d c9 00 00       	push   $0xc95d
    b295:	68 f9 c7 00 00       	push   $0xc7f9
    b29a:	6a 01                	push   $0x1
    b29c:	e8 c6 08 00 00       	call   bb67 <printf>
    b2a1:	83 c4 10             	add    $0x10,%esp
    run_test(test_cant_fork_over_mem_limit);
    b2a4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b2ab:	75 23                	jne    b2d0 <main+0xc65>
    b2ad:	83 ec 04             	sub    $0x4,%esp
    b2b0:	68 7b c9 00 00       	push   $0xc97b
    b2b5:	68 ec c7 00 00       	push   $0xc7ec
    b2ba:	6a 01                	push   $0x1
    b2bc:	e8 a6 08 00 00       	call   bb67 <printf>
    b2c1:	c7 04 24 7b c9 00 00 	movl   $0xc97b,(%esp)
    b2c8:	e8 d4 d1 ff ff       	call   84a1 <test_cant_fork_over_mem_limit>
    b2cd:	83 c4 10             	add    $0x10,%esp
    b2d0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b2d7:	74 19                	je     b2f2 <main+0xc87>
    b2d9:	eb 59                	jmp    b334 <main+0xcc9>
    b2db:	83 ec 08             	sub    $0x8,%esp
    b2de:	68 3c bf 00 00       	push   $0xbf3c
    b2e3:	6a 01                	push   $0x1
    b2e5:	e8 7d 08 00 00       	call   bb67 <printf>
    b2ea:	83 c3 01             	add    $0x1,%ebx
    b2ed:	83 c4 10             	add    $0x10,%esp
    b2f0:	eb 05                	jmp    b2f7 <main+0xc8c>
    b2f2:	bb 00 00 00 00       	mov    $0x0,%ebx
    b2f7:	83 ec 0c             	sub    $0xc,%esp
    b2fa:	68 7b c9 00 00       	push   $0xc97b
    b2ff:	e8 ff 03 00 00       	call   b703 <strlen>
    b304:	89 c6                	mov    %eax,%esi
    b306:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b30d:	e8 f1 03 00 00       	call   b703 <strlen>
    b312:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b316:	83 c4 10             	add    $0x10,%esp
    b319:	39 d8                	cmp    %ebx,%eax
    b31b:	77 be                	ja     b2db <main+0xc70>
    b31d:	83 ec 04             	sub    $0x4,%esp
    b320:	68 7b c9 00 00       	push   $0xc97b
    b325:	68 f9 c7 00 00       	push   $0xc7f9
    b32a:	6a 01                	push   $0x1
    b32c:	e8 36 08 00 00       	call   bb67 <printf>
    b331:	83 c4 10             	add    $0x10,%esp
    run_test(test_cant_grow_over_mem_limit);
    b334:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b33b:	75 23                	jne    b360 <main+0xcf5>
    b33d:	83 ec 04             	sub    $0x4,%esp
    b340:	68 99 c9 00 00       	push   $0xc999
    b345:	68 ec c7 00 00       	push   $0xc7ec
    b34a:	6a 01                	push   $0x1
    b34c:	e8 16 08 00 00       	call   bb67 <printf>
    b351:	c7 04 24 99 c9 00 00 	movl   $0xc999,(%esp)
    b358:	e8 71 d5 ff ff       	call   88ce <test_cant_grow_over_mem_limit>
    b35d:	83 c4 10             	add    $0x10,%esp
    b360:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b367:	74 19                	je     b382 <main+0xd17>
    b369:	eb 59                	jmp    b3c4 <main+0xd59>
    b36b:	83 ec 08             	sub    $0x8,%esp
    b36e:	68 3c bf 00 00       	push   $0xbf3c
    b373:	6a 01                	push   $0x1
    b375:	e8 ed 07 00 00       	call   bb67 <printf>
    b37a:	83 c3 01             	add    $0x1,%ebx
    b37d:	83 c4 10             	add    $0x10,%esp
    b380:	eb 05                	jmp    b387 <main+0xd1c>
    b382:	bb 00 00 00 00       	mov    $0x0,%ebx
    b387:	83 ec 0c             	sub    $0xc,%esp
    b38a:	68 99 c9 00 00       	push   $0xc999
    b38f:	e8 6f 03 00 00       	call   b703 <strlen>
    b394:	89 c6                	mov    %eax,%esi
    b396:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b39d:	e8 61 03 00 00       	call   b703 <strlen>
    b3a2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b3a6:	83 c4 10             	add    $0x10,%esp
    b3a9:	39 d8                	cmp    %ebx,%eax
    b3ab:	77 be                	ja     b36b <main+0xd00>
    b3ad:	83 ec 04             	sub    $0x4,%esp
    b3b0:	68 99 c9 00 00       	push   $0xc999
    b3b5:	68 f9 c7 00 00       	push   $0xc7f9
    b3ba:	6a 01                	push   $0x1
    b3bc:	e8 a6 07 00 00       	call   bb67 <printf>
    b3c1:	83 c4 10             	add    $0x10,%esp
    run_test(test_limiting_cpu_max_and_period);
    b3c4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b3cb:	75 23                	jne    b3f0 <main+0xd85>
    b3cd:	83 ec 04             	sub    $0x4,%esp
    b3d0:	68 7c 10 01 00       	push   $0x1107c
    b3d5:	68 ec c7 00 00       	push   $0xc7ec
    b3da:	6a 01                	push   $0x1
    b3dc:	e8 86 07 00 00       	call   bb67 <printf>
    b3e1:	c7 04 24 7c 10 01 00 	movl   $0x1107c,(%esp)
    b3e8:	e8 25 6f ff ff       	call   2312 <test_limiting_cpu_max_and_period>
    b3ed:	83 c4 10             	add    $0x10,%esp
    b3f0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b3f7:	74 19                	je     b412 <main+0xda7>
    b3f9:	eb 59                	jmp    b454 <main+0xde9>
    b3fb:	83 ec 08             	sub    $0x8,%esp
    b3fe:	68 3c bf 00 00       	push   $0xbf3c
    b403:	6a 01                	push   $0x1
    b405:	e8 5d 07 00 00       	call   bb67 <printf>
    b40a:	83 c3 01             	add    $0x1,%ebx
    b40d:	83 c4 10             	add    $0x10,%esp
    b410:	eb 05                	jmp    b417 <main+0xdac>
    b412:	bb 00 00 00 00       	mov    $0x0,%ebx
    b417:	83 ec 0c             	sub    $0xc,%esp
    b41a:	68 7c 10 01 00       	push   $0x1107c
    b41f:	e8 df 02 00 00       	call   b703 <strlen>
    b424:	89 c6                	mov    %eax,%esi
    b426:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b42d:	e8 d1 02 00 00       	call   b703 <strlen>
    b432:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b436:	83 c4 10             	add    $0x10,%esp
    b439:	39 d8                	cmp    %ebx,%eax
    b43b:	77 be                	ja     b3fb <main+0xd90>
    b43d:	83 ec 04             	sub    $0x4,%esp
    b440:	68 7c 10 01 00       	push   $0x1107c
    b445:	68 f9 c7 00 00       	push   $0xc7f9
    b44a:	6a 01                	push   $0x1
    b44c:	e8 16 07 00 00       	call   bb67 <printf>
    b451:	83 c4 10             	add    $0x10,%esp
    run_test(test_setting_max_descendants_and_max_depth);
    b454:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b45b:	75 23                	jne    b480 <main+0xe15>
    b45d:	83 ec 04             	sub    $0x4,%esp
    b460:	68 a0 10 01 00       	push   $0x110a0
    b465:	68 ec c7 00 00       	push   $0xc7ec
    b46a:	6a 01                	push   $0x1
    b46c:	e8 f6 06 00 00       	call   bb67 <printf>
    b471:	c7 04 24 a0 10 01 00 	movl   $0x110a0,(%esp)
    b478:	e8 65 81 ff ff       	call   35e2 <test_setting_max_descendants_and_max_depth>
    b47d:	83 c4 10             	add    $0x10,%esp
    b480:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b487:	74 19                	je     b4a2 <main+0xe37>
    b489:	eb 59                	jmp    b4e4 <main+0xe79>
    b48b:	83 ec 08             	sub    $0x8,%esp
    b48e:	68 3c bf 00 00       	push   $0xbf3c
    b493:	6a 01                	push   $0x1
    b495:	e8 cd 06 00 00       	call   bb67 <printf>
    b49a:	83 c3 01             	add    $0x1,%ebx
    b49d:	83 c4 10             	add    $0x10,%esp
    b4a0:	eb 05                	jmp    b4a7 <main+0xe3c>
    b4a2:	bb 00 00 00 00       	mov    $0x0,%ebx
    b4a7:	83 ec 0c             	sub    $0xc,%esp
    b4aa:	68 a0 10 01 00       	push   $0x110a0
    b4af:	e8 4f 02 00 00       	call   b703 <strlen>
    b4b4:	89 c6                	mov    %eax,%esi
    b4b6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b4bd:	e8 41 02 00 00       	call   b703 <strlen>
    b4c2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b4c6:	83 c4 10             	add    $0x10,%esp
    b4c9:	39 d8                	cmp    %ebx,%eax
    b4cb:	77 be                	ja     b48b <main+0xe20>
    b4cd:	83 ec 04             	sub    $0x4,%esp
    b4d0:	68 a0 10 01 00       	push   $0x110a0
    b4d5:	68 f9 c7 00 00       	push   $0xc7f9
    b4da:	6a 01                	push   $0x1
    b4dc:	e8 86 06 00 00       	call   bb67 <printf>
    b4e1:	83 c4 10             	add    $0x10,%esp
    run_test(test_deleting_cgroups);
    b4e4:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b4eb:	75 23                	jne    b510 <main+0xea5>
    b4ed:	83 ec 04             	sub    $0x4,%esp
    b4f0:	68 b7 c9 00 00       	push   $0xc9b7
    b4f5:	68 ec c7 00 00       	push   $0xc7ec
    b4fa:	6a 01                	push   $0x1
    b4fc:	e8 66 06 00 00       	call   bb67 <printf>
    b501:	c7 04 24 b7 c9 00 00 	movl   $0xc9b7,(%esp)
    b508:	e8 d1 57 ff ff       	call   cde <test_deleting_cgroups>
    b50d:	83 c4 10             	add    $0x10,%esp
    b510:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b517:	74 19                	je     b532 <main+0xec7>
    b519:	eb 59                	jmp    b574 <main+0xf09>
    b51b:	83 ec 08             	sub    $0x8,%esp
    b51e:	68 3c bf 00 00       	push   $0xbf3c
    b523:	6a 01                	push   $0x1
    b525:	e8 3d 06 00 00       	call   bb67 <printf>
    b52a:	83 c3 01             	add    $0x1,%ebx
    b52d:	83 c4 10             	add    $0x10,%esp
    b530:	eb 05                	jmp    b537 <main+0xecc>
    b532:	bb 00 00 00 00       	mov    $0x0,%ebx
    b537:	83 ec 0c             	sub    $0xc,%esp
    b53a:	68 b7 c9 00 00       	push   $0xc9b7
    b53f:	e8 bf 01 00 00       	call   b703 <strlen>
    b544:	89 c6                	mov    %eax,%esi
    b546:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b54d:	e8 b1 01 00 00       	call   b703 <strlen>
    b552:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b556:	83 c4 10             	add    $0x10,%esp
    b559:	39 d8                	cmp    %ebx,%eax
    b55b:	77 be                	ja     b51b <main+0xeb0>
    b55d:	83 ec 04             	sub    $0x4,%esp
    b560:	68 b7 c9 00 00       	push   $0xc9b7
    b565:	68 f9 c7 00 00       	push   $0xc7f9
    b56a:	6a 01                	push   $0x1
    b56c:	e8 f6 05 00 00       	call   bb67 <printf>
    b571:	83 c4 10             	add    $0x10,%esp
    run_test(test_umount_cgroup_fs);
    b574:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b57b:	75 23                	jne    b5a0 <main+0xf35>
    b57d:	83 ec 04             	sub    $0x4,%esp
    b580:	68 cd c9 00 00       	push   $0xc9cd
    b585:	68 ec c7 00 00       	push   $0xc7ec
    b58a:	6a 01                	push   $0x1
    b58c:	e8 d6 05 00 00       	call   bb67 <printf>
    b591:	c7 04 24 cd c9 00 00 	movl   $0xc9cd,(%esp)
    b598:	e8 0f 54 ff ff       	call   9ac <test_umount_cgroup_fs>
    b59d:	83 c4 10             	add    $0x10,%esp
    b5a0:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b5a7:	74 19                	je     b5c2 <main+0xf57>
    b5a9:	eb 59                	jmp    b604 <main+0xf99>
    b5ab:	83 ec 08             	sub    $0x8,%esp
    b5ae:	68 3c bf 00 00       	push   $0xbf3c
    b5b3:	6a 01                	push   $0x1
    b5b5:	e8 ad 05 00 00       	call   bb67 <printf>
    b5ba:	83 c3 01             	add    $0x1,%ebx
    b5bd:	83 c4 10             	add    $0x10,%esp
    b5c0:	eb 05                	jmp    b5c7 <main+0xf5c>
    b5c2:	bb 00 00 00 00       	mov    $0x0,%ebx
    b5c7:	83 ec 0c             	sub    $0xc,%esp
    b5ca:	68 cd c9 00 00       	push   $0xc9cd
    b5cf:	e8 2f 01 00 00       	call   b703 <strlen>
    b5d4:	89 c6                	mov    %eax,%esi
    b5d6:	c7 04 24 3e bf 00 00 	movl   $0xbf3e,(%esp)
    b5dd:	e8 21 01 00 00       	call   b703 <strlen>
    b5e2:	8d 44 06 02          	lea    0x2(%esi,%eax,1),%eax
    b5e6:	83 c4 10             	add    $0x10,%esp
    b5e9:	39 d8                	cmp    %ebx,%eax
    b5eb:	77 be                	ja     b5ab <main+0xf40>
    b5ed:	83 ec 04             	sub    $0x4,%esp
    b5f0:	68 cd c9 00 00       	push   $0xc9cd
    b5f5:	68 f9 c7 00 00       	push   $0xc7f9
    b5fa:	6a 01                	push   $0x1
    b5fc:	e8 66 05 00 00       	call   bb67 <printf>
    b601:	83 c4 10             	add    $0x10,%esp
    run_test_break_msg(test_kernel_freem_mem);
    b604:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b60b:	75 23                	jne    b630 <main+0xfc5>
    b60d:	83 ec 04             	sub    $0x4,%esp
    b610:	68 e3 c9 00 00       	push   $0xc9e3
    b615:	68 37 c8 00 00       	push   $0xc837
    b61a:	6a 01                	push   $0x1
    b61c:	e8 46 05 00 00       	call   bb67 <printf>
    b621:	c7 04 24 e3 c9 00 00 	movl   $0xc9e3,(%esp)
    b628:	e8 06 d8 ff ff       	call   8e33 <test_kernel_freem_mem>
    b62d:	83 c4 10             	add    $0x10,%esp
    b630:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b637:	75 17                	jne    b650 <main+0xfe5>
    b639:	83 ec 04             	sub    $0x4,%esp
    b63c:	68 e3 c9 00 00       	push   $0xc9e3
    b641:	68 45 c8 00 00       	push   $0xc845
    b646:	6a 01                	push   $0x1
    b648:	e8 1a 05 00 00       	call   bb67 <printf>
    b64d:	83 c4 10             	add    $0x10,%esp

    if (failed) {
    b650:	83 3d 40 42 01 00 00 	cmpl   $0x0,0x14240
    b657:	74 1b                	je     b674 <main+0x1009>
        printf(1, "[    CGROUPTESTS FAILED    ]\n");
    b659:	83 ec 08             	sub    $0x8,%esp
    b65c:	68 f9 c9 00 00       	push   $0xc9f9
    b661:	6a 01                	push   $0x1
    b663:	e8 ff 04 00 00       	call   bb67 <printf>
        exit(1);
    b668:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    b66f:	e8 02 03 00 00       	call   b976 <exit>
    } else {
        printf(1, "[    CGROUPTESTS PASSED    ]\n");
    b674:	83 ec 08             	sub    $0x8,%esp
    b677:	68 17 ca 00 00       	push   $0xca17
    b67c:	6a 01                	push   $0x1
    b67e:	e8 e4 04 00 00       	call   bb67 <printf>
        exit(0);
    b683:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    b68a:	e8 e7 02 00 00       	call   b976 <exit>

0000b68f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    b68f:	55                   	push   %ebp
    b690:	89 e5                	mov    %esp,%ebp
    b692:	53                   	push   %ebx
    b693:	8b 45 08             	mov    0x8(%ebp),%eax
    b696:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    b699:	89 c2                	mov    %eax,%edx
    b69b:	0f b6 19             	movzbl (%ecx),%ebx
    b69e:	88 1a                	mov    %bl,(%edx)
    b6a0:	8d 52 01             	lea    0x1(%edx),%edx
    b6a3:	8d 49 01             	lea    0x1(%ecx),%ecx
    b6a6:	84 db                	test   %bl,%bl
    b6a8:	75 f1                	jne    b69b <strcpy+0xc>
    ;
  return os;
}
    b6aa:	5b                   	pop    %ebx
    b6ab:	5d                   	pop    %ebp
    b6ac:	c3                   	ret    

0000b6ad <strcmp>:

int
strcmp(const char *p, const char *q)
{
    b6ad:	55                   	push   %ebp
    b6ae:	89 e5                	mov    %esp,%ebp
    b6b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b6b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    b6b6:	eb 06                	jmp    b6be <strcmp+0x11>
    p++, q++;
    b6b8:	83 c1 01             	add    $0x1,%ecx
    b6bb:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    b6be:	0f b6 01             	movzbl (%ecx),%eax
    b6c1:	84 c0                	test   %al,%al
    b6c3:	74 04                	je     b6c9 <strcmp+0x1c>
    b6c5:	3a 02                	cmp    (%edx),%al
    b6c7:	74 ef                	je     b6b8 <strcmp+0xb>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    b6c9:	0f b6 c0             	movzbl %al,%eax
    b6cc:	0f b6 12             	movzbl (%edx),%edx
    b6cf:	29 d0                	sub    %edx,%eax
}
    b6d1:	5d                   	pop    %ebp
    b6d2:	c3                   	ret    

0000b6d3 <strncmp>:

int
strncmp(const char *p, const char *q, int n)
{
    b6d3:	55                   	push   %ebp
    b6d4:	89 e5                	mov    %esp,%ebp
    b6d6:	53                   	push   %ebx
    b6d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b6da:	8b 55 0c             	mov    0xc(%ebp),%edx
    b6dd:	8b 5d 10             	mov    0x10(%ebp),%ebx
  while(*p && *p == *q && --n)
    b6e0:	eb 06                	jmp    b6e8 <strncmp+0x15>
    p++, q++;
    b6e2:	83 c1 01             	add    $0x1,%ecx
    b6e5:	83 c2 01             	add    $0x1,%edx
}

int
strncmp(const char *p, const char *q, int n)
{
  while(*p && *p == *q && --n)
    b6e8:	0f b6 01             	movzbl (%ecx),%eax
    b6eb:	84 c0                	test   %al,%al
    b6ed:	74 09                	je     b6f8 <strncmp+0x25>
    b6ef:	3a 02                	cmp    (%edx),%al
    b6f1:	75 05                	jne    b6f8 <strncmp+0x25>
    b6f3:	83 eb 01             	sub    $0x1,%ebx
    b6f6:	75 ea                	jne    b6e2 <strncmp+0xf>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    b6f8:	0f b6 c0             	movzbl %al,%eax
    b6fb:	0f b6 12             	movzbl (%edx),%edx
    b6fe:	29 d0                	sub    %edx,%eax
}
    b700:	5b                   	pop    %ebx
    b701:	5d                   	pop    %ebp
    b702:	c3                   	ret    

0000b703 <strlen>:

uint
strlen(const char *s)
{
    b703:	55                   	push   %ebp
    b704:	89 e5                	mov    %esp,%ebp
    b706:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    b709:	ba 00 00 00 00       	mov    $0x0,%edx
    b70e:	eb 03                	jmp    b713 <strlen+0x10>
    b710:	83 c2 01             	add    $0x1,%edx
    b713:	89 d0                	mov    %edx,%eax
    b715:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    b719:	75 f5                	jne    b710 <strlen+0xd>
    ;
  return n;
}
    b71b:	5d                   	pop    %ebp
    b71c:	c3                   	ret    

0000b71d <memset>:

void*
memset(void *dst, int c, uint n)
{
    b71d:	55                   	push   %ebp
    b71e:	89 e5                	mov    %esp,%ebp
    b720:	57                   	push   %edi
    b721:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    b724:	89 d7                	mov    %edx,%edi
    b726:	8b 4d 10             	mov    0x10(%ebp),%ecx
    b729:	8b 45 0c             	mov    0xc(%ebp),%eax
    b72c:	fc                   	cld    
    b72d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    b72f:	89 d0                	mov    %edx,%eax
    b731:	5f                   	pop    %edi
    b732:	5d                   	pop    %ebp
    b733:	c3                   	ret    

0000b734 <strchr>:

char*
strchr(const char *s, char c)
{
    b734:	55                   	push   %ebp
    b735:	89 e5                	mov    %esp,%ebp
    b737:	8b 45 08             	mov    0x8(%ebp),%eax
    b73a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    b73e:	eb 07                	jmp    b747 <strchr+0x13>
    if(*s == c)
    b740:	38 ca                	cmp    %cl,%dl
    b742:	74 0f                	je     b753 <strchr+0x1f>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    b744:	83 c0 01             	add    $0x1,%eax
    b747:	0f b6 10             	movzbl (%eax),%edx
    b74a:	84 d2                	test   %dl,%dl
    b74c:	75 f2                	jne    b740 <strchr+0xc>
    if(*s == c)
      return (char*)s;
  return 0;
    b74e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    b753:	5d                   	pop    %ebp
    b754:	c3                   	ret    

0000b755 <gets>:

char*
gets(char *buf, int max)
{
    b755:	55                   	push   %ebp
    b756:	89 e5                	mov    %esp,%ebp
    b758:	57                   	push   %edi
    b759:	56                   	push   %esi
    b75a:	53                   	push   %ebx
    b75b:	83 ec 1c             	sub    $0x1c,%esp
    b75e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    b761:	be 00 00 00 00       	mov    $0x0,%esi
    b766:	eb 2e                	jmp    b796 <gets+0x41>
    cc = read(0, &c, 1);
    b768:	83 ec 04             	sub    $0x4,%esp
    b76b:	6a 01                	push   $0x1
    b76d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    b770:	50                   	push   %eax
    b771:	6a 00                	push   $0x0
    b773:	e8 16 02 00 00       	call   b98e <read>
    if(cc < 1)
    b778:	83 c4 10             	add    $0x10,%esp
    b77b:	85 c0                	test   %eax,%eax
    b77d:	7e 17                	jle    b796 <gets+0x41>
      continue;
    buf[i++] = c;
    b77f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    b783:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    b786:	3c 0a                	cmp    $0xa,%al
    b788:	0f 94 c2             	sete   %dl
    b78b:	3c 0d                	cmp    $0xd,%al
    b78d:	0f 94 c0             	sete   %al
    b790:	08 c2                	or     %al,%dl
    b792:	75 0c                	jne    b7a0 <gets+0x4b>

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    b794:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    b796:	8d 5e 01             	lea    0x1(%esi),%ebx
    b799:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    b79c:	7c ca                	jl     b768 <gets+0x13>
    b79e:	eb 02                	jmp    b7a2 <gets+0x4d>
    cc = read(0, &c, 1);
    if(cc < 1)
      continue;
    buf[i++] = c;
    b7a0:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    b7a2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    b7a6:	89 f8                	mov    %edi,%eax
    b7a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    b7ab:	5b                   	pop    %ebx
    b7ac:	5e                   	pop    %esi
    b7ad:	5f                   	pop    %edi
    b7ae:	5d                   	pop    %ebp
    b7af:	c3                   	ret    

0000b7b0 <stat>:

int
stat(const char *n, struct stat *st)
{
    b7b0:	55                   	push   %ebp
    b7b1:	89 e5                	mov    %esp,%ebp
    b7b3:	56                   	push   %esi
    b7b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    b7b5:	83 ec 08             	sub    $0x8,%esp
    b7b8:	6a 00                	push   $0x0
    b7ba:	ff 75 08             	pushl  0x8(%ebp)
    b7bd:	e8 f4 01 00 00       	call   b9b6 <open>
  if(fd < 0)
    b7c2:	83 c4 10             	add    $0x10,%esp
    b7c5:	85 c0                	test   %eax,%eax
    b7c7:	78 1f                	js     b7e8 <stat+0x38>
    b7c9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    b7cb:	83 ec 08             	sub    $0x8,%esp
    b7ce:	ff 75 0c             	pushl  0xc(%ebp)
    b7d1:	50                   	push   %eax
    b7d2:	e8 f7 01 00 00       	call   b9ce <fstat>
    b7d7:	89 c6                	mov    %eax,%esi
  close(fd);
    b7d9:	89 1c 24             	mov    %ebx,(%esp)
    b7dc:	e8 bd 01 00 00       	call   b99e <close>
  return r;
    b7e1:	83 c4 10             	add    $0x10,%esp
    b7e4:	89 f0                	mov    %esi,%eax
    b7e6:	eb 05                	jmp    b7ed <stat+0x3d>
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    b7e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  r = fstat(fd, st);
  close(fd);
  return r;
}
    b7ed:	8d 65 f8             	lea    -0x8(%ebp),%esp
    b7f0:	5b                   	pop    %ebx
    b7f1:	5e                   	pop    %esi
    b7f2:	5d                   	pop    %ebp
    b7f3:	c3                   	ret    

0000b7f4 <atoi>:

int
atoi(const char *s)
{
    b7f4:	55                   	push   %ebp
    b7f5:	89 e5                	mov    %esp,%ebp
    b7f7:	53                   	push   %ebx
    b7f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    b7fb:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    b800:	eb 10                	jmp    b812 <atoi+0x1e>
    n = n*10 + *s++ - '0';
    b802:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
    b805:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    b808:	83 c1 01             	add    $0x1,%ecx
    b80b:	0f be d2             	movsbl %dl,%edx
    b80e:	8d 44 10 d0          	lea    -0x30(%eax,%edx,1),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    b812:	0f b6 11             	movzbl (%ecx),%edx
    b815:	8d 5a d0             	lea    -0x30(%edx),%ebx
    b818:	80 fb 09             	cmp    $0x9,%bl
    b81b:	76 e5                	jbe    b802 <atoi+0xe>
    n = n*10 + *s++ - '0';
  return n;
}
    b81d:	5b                   	pop    %ebx
    b81e:	5d                   	pop    %ebp
    b81f:	c3                   	ret    

0000b820 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    b820:	55                   	push   %ebp
    b821:	89 e5                	mov    %esp,%ebp
    b823:	56                   	push   %esi
    b824:	53                   	push   %ebx
    b825:	8b 45 08             	mov    0x8(%ebp),%eax
    b828:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    b82b:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
    b82e:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
    b830:	eb 0d                	jmp    b83f <memmove+0x1f>
    *dst++ = *src++;
    b832:	0f b6 13             	movzbl (%ebx),%edx
    b835:	88 11                	mov    %dl,(%ecx)
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    b837:	89 f2                	mov    %esi,%edx
    *dst++ = *src++;
    b839:	8d 5b 01             	lea    0x1(%ebx),%ebx
    b83c:	8d 49 01             	lea    0x1(%ecx),%ecx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    b83f:	8d 72 ff             	lea    -0x1(%edx),%esi
    b842:	85 d2                	test   %edx,%edx
    b844:	7f ec                	jg     b832 <memmove+0x12>
    *dst++ = *src++;
  return vdst;
}
    b846:	5b                   	pop    %ebx
    b847:	5e                   	pop    %esi
    b848:	5d                   	pop    %ebp
    b849:	c3                   	ret    

0000b84a <itoa>:

/*
 * Set buf to string representation of number in int.
 */
int itoa(char * buf, int n)
{
    b84a:	55                   	push   %ebp
    b84b:	89 e5                	mov    %esp,%ebp
    b84d:	57                   	push   %edi
    b84e:	56                   	push   %esi
    b84f:	53                   	push   %ebx
    b850:	83 ec 04             	sub    $0x4,%esp
    b853:	8b 7d 08             	mov    0x8(%ebp),%edi
    b856:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int i = n;
    b859:	89 d9                	mov    %ebx,%ecx
    int length = 0;
    b85b:	be 00 00 00 00       	mov    $0x0,%esi

    while (i > 0) {
    b860:	eb 16                	jmp    b878 <itoa+0x2e>
        length++;
    b862:	83 c6 01             	add    $0x1,%esi
        i /= 10;
    b865:	ba 67 66 66 66       	mov    $0x66666667,%edx
    b86a:	89 c8                	mov    %ecx,%eax
    b86c:	f7 ea                	imul   %edx
    b86e:	c1 fa 02             	sar    $0x2,%edx
    b871:	c1 f9 1f             	sar    $0x1f,%ecx
    b874:	29 ca                	sub    %ecx,%edx
    b876:	89 d1                	mov    %edx,%ecx
int itoa(char * buf, int n)
{
    int i = n;
    int length = 0;

    while (i > 0) {
    b878:	85 c9                	test   %ecx,%ecx
    b87a:	7f e6                	jg     b862 <itoa+0x18>
        length++;
        i /= 10;
    }

    if (n == 0) {
    b87c:	85 db                	test   %ebx,%ebx
    b87e:	75 06                	jne    b886 <itoa+0x3c>
        buf[0] = '0';
    b880:	c6 07 30             	movb   $0x30,(%edi)
        length++;
    b883:	83 c6 01             	add    $0x1,%esi
    }
    for (i = length; n > 0 && i > 0; i--) {
    b886:	89 f1                	mov    %esi,%ecx
    b888:	89 75 f0             	mov    %esi,-0x10(%ebp)
    b88b:	eb 2a                	jmp    b8b7 <itoa+0x6d>
        buf[i - 1] = (n % 10) + '0';
    b88d:	83 e9 01             	sub    $0x1,%ecx
    b890:	ba 67 66 66 66       	mov    $0x66666667,%edx
    b895:	89 d8                	mov    %ebx,%eax
    b897:	f7 ea                	imul   %edx
    b899:	c1 fa 02             	sar    $0x2,%edx
    b89c:	89 d8                	mov    %ebx,%eax
    b89e:	c1 f8 1f             	sar    $0x1f,%eax
    b8a1:	29 c2                	sub    %eax,%edx
    b8a3:	89 d6                	mov    %edx,%esi
    b8a5:	8d 14 92             	lea    (%edx,%edx,4),%edx
    b8a8:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b8ab:	29 c3                	sub    %eax,%ebx
    b8ad:	89 da                	mov    %ebx,%edx
    b8af:	83 c2 30             	add    $0x30,%edx
    b8b2:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
        n /= 10;
    b8b5:	89 f3                	mov    %esi,%ebx

    if (n == 0) {
        buf[0] = '0';
        length++;
    }
    for (i = length; n > 0 && i > 0; i--) {
    b8b7:	85 db                	test   %ebx,%ebx
    b8b9:	0f 9f c2             	setg   %dl
    b8bc:	85 c9                	test   %ecx,%ecx
    b8be:	0f 9f c0             	setg   %al
    b8c1:	84 c2                	test   %al,%dl
    b8c3:	75 c8                	jne    b88d <itoa+0x43>
    b8c5:	8b 75 f0             	mov    -0x10(%ebp),%esi
        buf[i - 1] = (n % 10) + '0';
        n /= 10;
    }
    buf[length] = '\0';
    b8c8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
    return length;
}
    b8cc:	89 f0                	mov    %esi,%eax
    b8ce:	83 c4 04             	add    $0x4,%esp
    b8d1:	5b                   	pop    %ebx
    b8d2:	5e                   	pop    %esi
    b8d3:	5f                   	pop    %edi
    b8d4:	5d                   	pop    %ebp
    b8d5:	c3                   	ret    

0000b8d6 <strcat>:

char* strcat(char* dest, const char* source)
{
    b8d6:	55                   	push   %ebp
    b8d7:	89 e5                	mov    %esp,%ebp
    b8d9:	57                   	push   %edi
    b8da:	56                   	push   %esi
    b8db:	53                   	push   %ebx
    b8dc:	8b 45 08             	mov    0x8(%ebp),%eax
    b8df:	8b 7d 0c             	mov    0xc(%ebp),%edi
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);
    b8e2:	b9 00 00 00 00       	mov    $0x0,%ecx
    b8e7:	eb 03                	jmp    b8ec <strcat+0x16>
    b8e9:	83 c1 01             	add    $0x1,%ecx
    b8ec:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
    b8f0:	75 f7                	jne    b8e9 <strcat+0x13>
    b8f2:	ba 00 00 00 00       	mov    $0x0,%edx
    b8f7:	eb 09                	jmp    b902 <strcat+0x2c>

        for (j = 0; source[j] != '\0'; j++)
                dest[i + j] = source[j];
    b8f9:	8d 34 11             	lea    (%ecx,%edx,1),%esi
    b8fc:	88 1c 30             	mov    %bl,(%eax,%esi,1)
{
        int i, j;

        for (i = 0; dest[i] != '\0'; i++);

        for (j = 0; source[j] != '\0'; j++)
    b8ff:	83 c2 01             	add    $0x1,%edx
    b902:	0f b6 1c 17          	movzbl (%edi,%edx,1),%ebx
    b906:	84 db                	test   %bl,%bl
    b908:	75 ef                	jne    b8f9 <strcat+0x23>
                dest[i + j] = source[j];

        dest[i + j] = '\0';
    b90a:	01 ca                	add    %ecx,%edx
    b90c:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)

        return dest;
}
    b910:	5b                   	pop    %ebx
    b911:	5e                   	pop    %esi
    b912:	5f                   	pop    %edi
    b913:	5d                   	pop    %ebp
    b914:	c3                   	ret    

0000b915 <strstr>:

char * strstr(char * src, char * needle)
{
    b915:	55                   	push   %ebp
    b916:	89 e5                	mov    %esp,%ebp
    b918:	57                   	push   %edi
    b919:	56                   	push   %esi
    b91a:	53                   	push   %ebx
    b91b:	83 ec 04             	sub    $0x4,%esp
    b91e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint i = 0;
  uint needle_size = strlen(needle);
    b921:	ff 75 0c             	pushl  0xc(%ebp)
    b924:	e8 da fd ff ff       	call   b703 <strlen>
    b929:	89 c7                	mov    %eax,%edi
  uint src_len = strlen(src);
    b92b:	89 1c 24             	mov    %ebx,(%esp)
    b92e:	e8 d0 fd ff ff       	call   b703 <strlen>
    b933:	83 c4 04             	add    $0x4,%esp
    b936:	89 45 f0             	mov    %eax,-0x10(%ebp)

  for(i = 0; i < src_len; i++)
    b939:	be 00 00 00 00       	mov    $0x0,%esi
    b93e:	eb 1c                	jmp    b95c <strstr+0x47>
  {
    if(0 == strncmp(src, needle, needle_size))
    b940:	57                   	push   %edi
    b941:	ff 75 0c             	pushl  0xc(%ebp)
    b944:	53                   	push   %ebx
    b945:	e8 89 fd ff ff       	call   b6d3 <strncmp>
    b94a:	83 c4 0c             	add    $0xc,%esp
    b94d:	85 c0                	test   %eax,%eax
    b94f:	75 05                	jne    b956 <strstr+0x41>
    {
      return src + needle_size;
    b951:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
    b954:	eb 10                	jmp    b966 <strstr+0x51>
    }
    src++;
    b956:	83 c3 01             	add    $0x1,%ebx
{
  uint i = 0;
  uint needle_size = strlen(needle);
  uint src_len = strlen(src);

  for(i = 0; i < src_len; i++)
    b959:	83 c6 01             	add    $0x1,%esi
    b95c:	3b 75 f0             	cmp    -0x10(%ebp),%esi
    b95f:	72 df                	jb     b940 <strstr+0x2b>
    {
      return src + needle_size;
    }
    src++;
  }
  return 0;
    b961:	b8 00 00 00 00       	mov    $0x0,%eax
}
    b966:	8d 65 f4             	lea    -0xc(%ebp),%esp
    b969:	5b                   	pop    %ebx
    b96a:	5e                   	pop    %esi
    b96b:	5f                   	pop    %edi
    b96c:	5d                   	pop    %ebp
    b96d:	c3                   	ret    

0000b96e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    b96e:	b8 01 00 00 00       	mov    $0x1,%eax
    b973:	cd 40                	int    $0x40
    b975:	c3                   	ret    

0000b976 <exit>:
SYSCALL(exit)
    b976:	b8 02 00 00 00       	mov    $0x2,%eax
    b97b:	cd 40                	int    $0x40
    b97d:	c3                   	ret    

0000b97e <wait>:
SYSCALL(wait)
    b97e:	b8 03 00 00 00       	mov    $0x3,%eax
    b983:	cd 40                	int    $0x40
    b985:	c3                   	ret    

0000b986 <pipe>:
SYSCALL(pipe)
    b986:	b8 04 00 00 00       	mov    $0x4,%eax
    b98b:	cd 40                	int    $0x40
    b98d:	c3                   	ret    

0000b98e <read>:
SYSCALL(read)
    b98e:	b8 05 00 00 00       	mov    $0x5,%eax
    b993:	cd 40                	int    $0x40
    b995:	c3                   	ret    

0000b996 <write>:
SYSCALL(write)
    b996:	b8 10 00 00 00       	mov    $0x10,%eax
    b99b:	cd 40                	int    $0x40
    b99d:	c3                   	ret    

0000b99e <close>:
SYSCALL(close)
    b99e:	b8 15 00 00 00       	mov    $0x15,%eax
    b9a3:	cd 40                	int    $0x40
    b9a5:	c3                   	ret    

0000b9a6 <kill>:
SYSCALL(kill)
    b9a6:	b8 06 00 00 00       	mov    $0x6,%eax
    b9ab:	cd 40                	int    $0x40
    b9ad:	c3                   	ret    

0000b9ae <exec>:
SYSCALL(exec)
    b9ae:	b8 07 00 00 00       	mov    $0x7,%eax
    b9b3:	cd 40                	int    $0x40
    b9b5:	c3                   	ret    

0000b9b6 <open>:
SYSCALL(open)
    b9b6:	b8 0f 00 00 00       	mov    $0xf,%eax
    b9bb:	cd 40                	int    $0x40
    b9bd:	c3                   	ret    

0000b9be <mknod>:
SYSCALL(mknod)
    b9be:	b8 11 00 00 00       	mov    $0x11,%eax
    b9c3:	cd 40                	int    $0x40
    b9c5:	c3                   	ret    

0000b9c6 <unlink>:
SYSCALL(unlink)
    b9c6:	b8 12 00 00 00       	mov    $0x12,%eax
    b9cb:	cd 40                	int    $0x40
    b9cd:	c3                   	ret    

0000b9ce <fstat>:
SYSCALL(fstat)
    b9ce:	b8 08 00 00 00       	mov    $0x8,%eax
    b9d3:	cd 40                	int    $0x40
    b9d5:	c3                   	ret    

0000b9d6 <link>:
SYSCALL(link)
    b9d6:	b8 13 00 00 00       	mov    $0x13,%eax
    b9db:	cd 40                	int    $0x40
    b9dd:	c3                   	ret    

0000b9de <mkdir>:
SYSCALL(mkdir)
    b9de:	b8 14 00 00 00       	mov    $0x14,%eax
    b9e3:	cd 40                	int    $0x40
    b9e5:	c3                   	ret    

0000b9e6 <chdir>:
SYSCALL(chdir)
    b9e6:	b8 09 00 00 00       	mov    $0x9,%eax
    b9eb:	cd 40                	int    $0x40
    b9ed:	c3                   	ret    

0000b9ee <dup>:
SYSCALL(dup)
    b9ee:	b8 0a 00 00 00       	mov    $0xa,%eax
    b9f3:	cd 40                	int    $0x40
    b9f5:	c3                   	ret    

0000b9f6 <getpid>:
SYSCALL(getpid)
    b9f6:	b8 0b 00 00 00       	mov    $0xb,%eax
    b9fb:	cd 40                	int    $0x40
    b9fd:	c3                   	ret    

0000b9fe <sbrk>:
SYSCALL(sbrk)
    b9fe:	b8 0c 00 00 00       	mov    $0xc,%eax
    ba03:	cd 40                	int    $0x40
    ba05:	c3                   	ret    

0000ba06 <sleep>:
SYSCALL(sleep)
    ba06:	b8 0d 00 00 00       	mov    $0xd,%eax
    ba0b:	cd 40                	int    $0x40
    ba0d:	c3                   	ret    

0000ba0e <uptime>:
SYSCALL(uptime)
    ba0e:	b8 0e 00 00 00       	mov    $0xe,%eax
    ba13:	cd 40                	int    $0x40
    ba15:	c3                   	ret    

0000ba16 <mount>:
SYSCALL(mount)
    ba16:	b8 16 00 00 00       	mov    $0x16,%eax
    ba1b:	cd 40                	int    $0x40
    ba1d:	c3                   	ret    

0000ba1e <umount>:
SYSCALL(umount)
    ba1e:	b8 17 00 00 00       	mov    $0x17,%eax
    ba23:	cd 40                	int    $0x40
    ba25:	c3                   	ret    

0000ba26 <printmounts>:
SYSCALL(printmounts)
    ba26:	b8 18 00 00 00       	mov    $0x18,%eax
    ba2b:	cd 40                	int    $0x40
    ba2d:	c3                   	ret    

0000ba2e <printdevices>:
SYSCALL(printdevices)
    ba2e:	b8 19 00 00 00       	mov    $0x19,%eax
    ba33:	cd 40                	int    $0x40
    ba35:	c3                   	ret    

0000ba36 <unshare>:
SYSCALL(unshare)
    ba36:	b8 1a 00 00 00       	mov    $0x1a,%eax
    ba3b:	cd 40                	int    $0x40
    ba3d:	c3                   	ret    

0000ba3e <usleep>:
SYSCALL(usleep)
    ba3e:	b8 1b 00 00 00       	mov    $0x1b,%eax
    ba43:	cd 40                	int    $0x40
    ba45:	c3                   	ret    

0000ba46 <ioctl>:
SYSCALL(ioctl)
    ba46:	b8 1c 00 00 00       	mov    $0x1c,%eax
    ba4b:	cd 40                	int    $0x40
    ba4d:	c3                   	ret    

0000ba4e <getppid>:
SYSCALL(getppid)
    ba4e:	b8 1d 00 00 00       	mov    $0x1d,%eax
    ba53:	cd 40                	int    $0x40
    ba55:	c3                   	ret    

0000ba56 <getcpu>:
SYSCALL(getcpu)
    ba56:	b8 1e 00 00 00       	mov    $0x1e,%eax
    ba5b:	cd 40                	int    $0x40
    ba5d:	c3                   	ret    

0000ba5e <getmem>:
SYSCALL(getmem)
    ba5e:	b8 1f 00 00 00       	mov    $0x1f,%eax
    ba63:	cd 40                	int    $0x40
    ba65:	c3                   	ret    

0000ba66 <kmemtest>:
SYSCALL(kmemtest)
    ba66:	b8 20 00 00 00       	mov    $0x20,%eax
    ba6b:	cd 40                	int    $0x40
    ba6d:	c3                   	ret    

0000ba6e <printint>:
  return write(fd, &c, 1);
}

static int
printint(int fd, int xx, int base, int sgn)
{
    ba6e:	55                   	push   %ebp
    ba6f:	89 e5                	mov    %esp,%ebp
    ba71:	57                   	push   %edi
    ba72:	56                   	push   %esi
    ba73:	53                   	push   %ebx
    ba74:	83 ec 3c             	sub    $0x3c,%esp
    ba77:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    ba7a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    ba7e:	0f 95 c3             	setne  %bl
    ba81:	89 d0                	mov    %edx,%eax
    ba83:	c1 e8 1f             	shr    $0x1f,%eax
    ba86:	84 c3                	test   %al,%bl
    ba88:	74 09                	je     ba93 <printint+0x25>
    neg = 1;
    x = -xx;
    ba8a:	f7 da                	neg    %edx
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    ba8c:	bf 01 00 00 00       	mov    $0x1,%edi
    ba91:	eb 05                	jmp    ba98 <printint+0x2a>
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    ba93:	bf 00 00 00 00       	mov    $0x0,%edi
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
    ba98:	be 00 00 00 00       	mov    $0x0,%esi
    ba9d:	eb 02                	jmp    baa1 <printint+0x33>
  do{
    buf[i++] = digits[x % base];
    ba9f:	89 de                	mov    %ebx,%esi
    baa1:	8d 5e 01             	lea    0x1(%esi),%ebx
    baa4:	89 d0                	mov    %edx,%eax
    baa6:	ba 00 00 00 00       	mov    $0x0,%edx
    baab:	f7 f1                	div    %ecx
    baad:	0f b6 92 dc 10 01 00 	movzbl 0x110dc(%edx),%edx
    bab4:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
    bab8:	89 c2                	mov    %eax,%edx
    baba:	85 c0                	test   %eax,%eax
    babc:	75 e1                	jne    ba9f <printint+0x31>
  if(neg)
    babe:	85 ff                	test   %edi,%edi
    bac0:	74 08                	je     baca <printint+0x5c>
    buf[i++] = '-';
    bac2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    bac7:	8d 5e 02             	lea    0x2(%esi),%ebx
    baca:	b8 00 00 00 00       	mov    $0x0,%eax
    bacf:	eb 0c                	jmp    badd <printint+0x6f>

  char str[16];
  int j = 0;
  while(--i >= 0) {
      str[j++] = buf[i];
    bad1:	0f b6 54 1d d8       	movzbl -0x28(%ebp,%ebx,1),%edx
    bad6:	88 54 05 c8          	mov    %dl,-0x38(%ebp,%eax,1)
    bada:	8d 40 01             	lea    0x1(%eax),%eax
  if(neg)
    buf[i++] = '-';

  char str[16];
  int j = 0;
  while(--i >= 0) {
    badd:	83 eb 01             	sub    $0x1,%ebx
    bae0:	79 ef                	jns    bad1 <printint+0x63>
      str[j++] = buf[i];
  }
  str[j] = '\0';
    bae2:	c6 44 05 c8 00       	movb   $0x0,-0x38(%ebp,%eax,1)
  
  return write(fd, str, strlen(str));
    bae7:	83 ec 0c             	sub    $0xc,%esp
    baea:	8d 5d c8             	lea    -0x38(%ebp),%ebx
    baed:	53                   	push   %ebx
    baee:	e8 10 fc ff ff       	call   b703 <strlen>
    baf3:	83 c4 0c             	add    $0xc,%esp
    baf6:	50                   	push   %eax
    baf7:	53                   	push   %ebx
    baf8:	ff 75 c4             	pushl  -0x3c(%ebp)
    bafb:	e8 96 fe ff ff       	call   b996 <write>
}
    bb00:	8d 65 f4             	lea    -0xc(%ebp),%esp
    bb03:	5b                   	pop    %ebx
    bb04:	5e                   	pop    %esi
    bb05:	5f                   	pop    %edi
    bb06:	5d                   	pop    %ebp
    bb07:	c3                   	ret    

0000bb08 <printstr>:

static int
printstr(int fd, char *str)
{
    bb08:	55                   	push   %ebp
    bb09:	89 e5                	mov    %esp,%ebp
    bb0b:	56                   	push   %esi
    bb0c:	53                   	push   %ebx
    bb0d:	89 c6                	mov    %eax,%esi
    bb0f:	89 d3                	mov    %edx,%ebx

  if (str == 0)
    bb11:	85 d2                	test   %edx,%edx
    bb13:	75 05                	jne    bb1a <printstr+0x12>
    str = "(null)";
    bb15:	bb d4 10 01 00       	mov    $0x110d4,%ebx

  return write(fd , str, strlen(str));
    bb1a:	83 ec 0c             	sub    $0xc,%esp
    bb1d:	53                   	push   %ebx
    bb1e:	e8 e0 fb ff ff       	call   b703 <strlen>
    bb23:	83 c4 0c             	add    $0xc,%esp
    bb26:	50                   	push   %eax
    bb27:	53                   	push   %ebx
    bb28:	56                   	push   %esi
    bb29:	e8 68 fe ff ff       	call   b996 <write>
}
    bb2e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    bb31:	5b                   	pop    %ebx
    bb32:	5e                   	pop    %esi
    bb33:	5d                   	pop    %ebp
    bb34:	c3                   	ret    

0000bb35 <putc>:
#include "stat.h"
#include "user.h"

static int
putc(int fd, char c)
{
    bb35:	55                   	push   %ebp
    bb36:	89 e5                	mov    %esp,%ebp
    bb38:	83 ec 1c             	sub    $0x1c,%esp
    bb3b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  return write(fd, &c, 1);
    bb3e:	6a 01                	push   $0x1
    bb40:	8d 55 f4             	lea    -0xc(%ebp),%edx
    bb43:	52                   	push   %edx
    bb44:	50                   	push   %eax
    bb45:	e8 4c fe ff ff       	call   b996 <write>
}
    bb4a:	c9                   	leave  
    bb4b:	c3                   	ret    

0000bb4c <printunknown>:
  return write(fd , str, strlen(str));
}

static int
printunknown(int fd, char c)
{
    bb4c:	55                   	push   %ebp
    bb4d:	89 e5                	mov    %esp,%ebp
    bb4f:	83 ec 1c             	sub    $0x1c,%esp
    char str[2];
    str[0] = '%';
    bb52:	c6 45 f6 25          	movb   $0x25,-0xa(%ebp)
    str[1] = c;
    bb56:	88 55 f7             	mov    %dl,-0x9(%ebp)
 
    return write(fd, str, 2);
    bb59:	6a 02                	push   $0x2
    bb5b:	8d 55 f6             	lea    -0xa(%ebp),%edx
    bb5e:	52                   	push   %edx
    bb5f:	50                   	push   %eax
    bb60:	e8 31 fe ff ff       	call   b996 <write>
}
    bb65:	c9                   	leave  
    bb66:	c3                   	ret    

0000bb67 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
int
printf(int fd, const char *fmt, ...)
{
    bb67:	55                   	push   %ebp
    bb68:	89 e5                	mov    %esp,%ebp
    bb6a:	57                   	push   %edi
    bb6b:	56                   	push   %esi
    bb6c:	53                   	push   %ebx
    bb6d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;
    bb70:	bb 00 00 00 00       	mov    $0x0,%ebx

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    bb75:	8d 45 10             	lea    0x10(%ebp),%eax
    bb78:	89 45 e0             	mov    %eax,-0x20(%ebp)
  int c, i, state;
  uint *ap;
  int num_chars = 0;
  int retval = 0;

  state = 0;
    bb7b:	bf 00 00 00 00       	mov    $0x0,%edi
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    bb80:	be 00 00 00 00       	mov    $0x0,%esi
    bb85:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
    bb88:	e9 14 01 00 00       	jmp    bca1 <printf+0x13a>
    num_chars = 0;
    c = fmt[i] & 0xff;
    bb8d:	0f be d0             	movsbl %al,%edx
    bb90:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    bb93:	85 ff                	test   %edi,%edi
    bb95:	75 16                	jne    bbad <printf+0x46>
      if(c == '%'){
    bb97:	83 f8 25             	cmp    $0x25,%eax
    bb9a:	0f 84 e6 00 00 00    	je     bc86 <printf+0x11f>
        state = '%';
      } else {
        num_chars = putc(fd, c);
    bba0:	8b 45 08             	mov    0x8(%ebp),%eax
    bba3:	e8 8d ff ff ff       	call   bb35 <putc>
    bba8:	e9 ea 00 00 00       	jmp    bc97 <printf+0x130>
      }
    } else if(state == '%'){
    bbad:	83 ff 25             	cmp    $0x25,%edi
    bbb0:	0f 85 dc 00 00 00    	jne    bc92 <printf+0x12b>
      if(c == 'd'){
    bbb6:	83 f8 64             	cmp    $0x64,%eax
    bbb9:	75 2c                	jne    bbe7 <printf+0x80>
        num_chars = printint(fd, *ap, 10, 1);
    bbbb:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    bbbe:	8b 13                	mov    (%ebx),%edx
    bbc0:	83 ec 0c             	sub    $0xc,%esp
    bbc3:	6a 01                	push   $0x1
    bbc5:	b9 0a 00 00 00       	mov    $0xa,%ecx
    bbca:	8b 45 08             	mov    0x8(%ebp),%eax
    bbcd:	e8 9c fe ff ff       	call   ba6e <printint>
        ap++;
    bbd2:	89 d9                	mov    %ebx,%ecx
    bbd4:	83 c1 04             	add    $0x4,%ecx
    bbd7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    bbda:	83 c4 10             	add    $0x10,%esp
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    bbdd:	bf 00 00 00 00       	mov    $0x0,%edi
    bbe2:	e9 b0 00 00 00       	jmp    bc97 <printf+0x130>
      }
    } else if(state == '%'){
      if(c == 'd'){
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    bbe7:	83 f8 78             	cmp    $0x78,%eax
    bbea:	0f 94 c1             	sete   %cl
    bbed:	89 cf                	mov    %ecx,%edi
    bbef:	83 f8 70             	cmp    $0x70,%eax
    bbf2:	0f 94 c1             	sete   %cl
    bbf5:	89 fb                	mov    %edi,%ebx
    bbf7:	08 cb                	or     %cl,%bl
    bbf9:	74 27                	je     bc22 <printf+0xbb>
        num_chars = printint(fd, *ap, 16, 0);
    bbfb:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    bbfe:	8b 13                	mov    (%ebx),%edx
    bc00:	83 ec 0c             	sub    $0xc,%esp
    bc03:	6a 00                	push   $0x0
    bc05:	b9 10 00 00 00       	mov    $0x10,%ecx
    bc0a:	8b 45 08             	mov    0x8(%ebp),%eax
    bc0d:	e8 5c fe ff ff       	call   ba6e <printint>
        ap++;
    bc12:	83 c3 04             	add    $0x4,%ebx
    bc15:	89 5d e0             	mov    %ebx,-0x20(%ebp)
    bc18:	83 c4 10             	add    $0x10,%esp
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    bc1b:	bf 00 00 00 00       	mov    $0x0,%edi
    bc20:	eb 75                	jmp    bc97 <printf+0x130>
        num_chars = printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        num_chars = printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    bc22:	83 f8 73             	cmp    $0x73,%eax
    bc25:	75 1a                	jne    bc41 <printf+0xda>
        s = (char*)*ap;
    bc27:	8b 45 e0             	mov    -0x20(%ebp),%eax
    bc2a:	8b 10                	mov    (%eax),%edx
        ap++;
    bc2c:	83 c0 04             	add    $0x4,%eax
    bc2f:	89 45 e0             	mov    %eax,-0x20(%ebp)
        num_chars = printstr(fd, s);
    bc32:	8b 45 08             	mov    0x8(%ebp),%eax
    bc35:	e8 ce fe ff ff       	call   bb08 <printstr>
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    bc3a:	bf 00 00 00 00       	mov    $0x0,%edi
    bc3f:	eb 56                	jmp    bc97 <printf+0x130>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
    bc41:	83 f8 63             	cmp    $0x63,%eax
    bc44:	75 1d                	jne    bc63 <printf+0xfc>
        num_chars = putc(fd, *ap);
    bc46:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    bc49:	0f be 13             	movsbl (%ebx),%edx
    bc4c:	8b 45 08             	mov    0x8(%ebp),%eax
    bc4f:	e8 e1 fe ff ff       	call   bb35 <putc>
        ap++;
    bc54:	89 d9                	mov    %ebx,%ecx
    bc56:	83 c1 04             	add    $0x4,%ecx
    bc59:	89 4d e0             	mov    %ecx,-0x20(%ebp)
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    bc5c:	bf 00 00 00 00       	mov    $0x0,%edi
    bc61:	eb 34                	jmp    bc97 <printf+0x130>
        ap++;
        num_chars = printstr(fd, s);
      } else if(c == 'c'){
        num_chars = putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    bc63:	83 f8 25             	cmp    $0x25,%eax
    bc66:	75 0f                	jne    bc77 <printf+0x110>
        num_chars = putc(fd, c);
    bc68:	8b 45 08             	mov    0x8(%ebp),%eax
    bc6b:	e8 c5 fe ff ff       	call   bb35 <putc>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    bc70:	bf 00 00 00 00       	mov    $0x0,%edi
    bc75:	eb 20                	jmp    bc97 <printf+0x130>
        ap++;
      } else if(c == '%'){
        num_chars = putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
    bc77:	8b 45 08             	mov    0x8(%ebp),%eax
    bc7a:	e8 cd fe ff ff       	call   bb4c <printunknown>
      }
      state = 0;
    bc7f:	bf 00 00 00 00       	mov    $0x0,%edi
    bc84:	eb 11                	jmp    bc97 <printf+0x130>
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    bc86:	b8 00 00 00 00       	mov    $0x0,%eax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    bc8b:	bf 25 00 00 00       	mov    $0x25,%edi
    bc90:	eb 05                	jmp    bc97 <printf+0x130>
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    num_chars = 0;
    bc92:	b8 00 00 00 00       	mov    $0x0,%eax
        // Unknown % sequence.  Print it to draw attention.
        num_chars = printunknown(fd, c);
      }
      state = 0;
    }
    if (num_chars < 0) {
    bc97:	85 c0                	test   %eax,%eax
    bc99:	78 1b                	js     bcb6 <printf+0x14f>
      return num_chars;
    }
    retval += num_chars;
    bc9b:	01 45 e4             	add    %eax,-0x1c(%ebp)
  int num_chars = 0;
  int retval = 0;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    bc9e:	83 c6 01             	add    $0x1,%esi
    bca1:	89 f0                	mov    %esi,%eax
    bca3:	03 45 0c             	add    0xc(%ebp),%eax
    bca6:	0f b6 00             	movzbl (%eax),%eax
    bca9:	84 c0                	test   %al,%al
    bcab:	0f 85 dc fe ff ff    	jne    bb8d <printf+0x26>
    bcb1:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    if (num_chars < 0) {
      return num_chars;
    }
    retval += num_chars;
  }
  return retval;
    bcb4:	89 d8                	mov    %ebx,%eax
}
    bcb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    bcb9:	5b                   	pop    %ebx
    bcba:	5e                   	pop    %esi
    bcbb:	5f                   	pop    %edi
    bcbc:	5d                   	pop    %ebp
    bcbd:	c3                   	ret    

0000bcbe <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    bcbe:	55                   	push   %ebp
    bcbf:	89 e5                	mov    %esp,%ebp
    bcc1:	57                   	push   %edi
    bcc2:	56                   	push   %esi
    bcc3:	53                   	push   %ebx
    bcc4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    bcc7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    bcca:	a1 60 43 01 00       	mov    0x14360,%eax
    bccf:	eb 14                	jmp    bce5 <free+0x27>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    bcd1:	8b 10                	mov    (%eax),%edx
    bcd3:	39 d0                	cmp    %edx,%eax
    bcd5:	72 0c                	jb     bce3 <free+0x25>
    bcd7:	39 c8                	cmp    %ecx,%eax
    bcd9:	72 12                	jb     bced <free+0x2f>
    bcdb:	39 d1                	cmp    %edx,%ecx
    bcdd:	72 0e                	jb     bced <free+0x2f>
    bcdf:	89 d0                	mov    %edx,%eax
    bce1:	eb 02                	jmp    bce5 <free+0x27>
    bce3:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    bce5:	39 c8                	cmp    %ecx,%eax
    bce7:	73 e8                	jae    bcd1 <free+0x13>
    bce9:	3b 08                	cmp    (%eax),%ecx
    bceb:	73 e4                	jae    bcd1 <free+0x13>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bced:	8b 73 fc             	mov    -0x4(%ebx),%esi
    bcf0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    bcf3:	8b 10                	mov    (%eax),%edx
    bcf5:	39 d7                	cmp    %edx,%edi
    bcf7:	75 0f                	jne    bd08 <free+0x4a>
    bp->s.size += p->s.ptr->s.size;
    bcf9:	03 72 04             	add    0x4(%edx),%esi
    bcfc:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    bcff:	8b 10                	mov    (%eax),%edx
    bd01:	8b 12                	mov    (%edx),%edx
    bd03:	89 53 f8             	mov    %edx,-0x8(%ebx)
    bd06:	eb 03                	jmp    bd0b <free+0x4d>
  } else
    bp->s.ptr = p->s.ptr;
    bd08:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    bd0b:	8b 50 04             	mov    0x4(%eax),%edx
    bd0e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    bd11:	39 f1                	cmp    %esi,%ecx
    bd13:	75 0d                	jne    bd22 <free+0x64>
    p->s.size += bp->s.size;
    bd15:	03 53 fc             	add    -0x4(%ebx),%edx
    bd18:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    bd1b:	8b 53 f8             	mov    -0x8(%ebx),%edx
    bd1e:	89 10                	mov    %edx,(%eax)
    bd20:	eb 02                	jmp    bd24 <free+0x66>
  } else
    p->s.ptr = bp;
    bd22:	89 08                	mov    %ecx,(%eax)
  freep = p;
    bd24:	a3 60 43 01 00       	mov    %eax,0x14360
}
    bd29:	5b                   	pop    %ebx
    bd2a:	5e                   	pop    %esi
    bd2b:	5f                   	pop    %edi
    bd2c:	5d                   	pop    %ebp
    bd2d:	c3                   	ret    

0000bd2e <morecore>:

static Header*
morecore(uint nu)
{
    bd2e:	55                   	push   %ebp
    bd2f:	89 e5                	mov    %esp,%ebp
    bd31:	53                   	push   %ebx
    bd32:	83 ec 04             	sub    $0x4,%esp
    bd35:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    bd37:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    bd3c:	77 05                	ja     bd43 <morecore+0x15>
    nu = 4096;
    bd3e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    bd43:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    bd4a:	83 ec 0c             	sub    $0xc,%esp
    bd4d:	50                   	push   %eax
    bd4e:	e8 ab fc ff ff       	call   b9fe <sbrk>
  if(p == (char*)-1)
    bd53:	83 c4 10             	add    $0x10,%esp
    bd56:	83 f8 ff             	cmp    $0xffffffff,%eax
    bd59:	74 19                	je     bd74 <morecore+0x46>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    bd5b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    bd5e:	83 ec 0c             	sub    $0xc,%esp
    bd61:	83 c0 08             	add    $0x8,%eax
    bd64:	50                   	push   %eax
    bd65:	e8 54 ff ff ff       	call   bcbe <free>
  return freep;
    bd6a:	a1 60 43 01 00       	mov    0x14360,%eax
    bd6f:	83 c4 10             	add    $0x10,%esp
    bd72:	eb 05                	jmp    bd79 <morecore+0x4b>

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
    return 0;
    bd74:	b8 00 00 00 00       	mov    $0x0,%eax
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
  return freep;
}
    bd79:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    bd7c:	c9                   	leave  
    bd7d:	c3                   	ret    

0000bd7e <malloc>:

void*
malloc(uint nbytes)
{
    bd7e:	55                   	push   %ebp
    bd7f:	89 e5                	mov    %esp,%ebp
    bd81:	53                   	push   %ebx
    bd82:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    bd85:	8b 45 08             	mov    0x8(%ebp),%eax
    bd88:	8d 58 07             	lea    0x7(%eax),%ebx
    bd8b:	c1 eb 03             	shr    $0x3,%ebx
    bd8e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    bd91:	8b 0d 60 43 01 00    	mov    0x14360,%ecx
    bd97:	85 c9                	test   %ecx,%ecx
    bd99:	75 23                	jne    bdbe <malloc+0x40>
    base.s.ptr = freep = prevp = &base;
    bd9b:	c7 05 60 43 01 00 64 	movl   $0x14364,0x14360
    bda2:	43 01 00 
    bda5:	c7 05 64 43 01 00 64 	movl   $0x14364,0x14364
    bdac:	43 01 00 
    base.s.size = 0;
    bdaf:	c7 05 68 43 01 00 00 	movl   $0x0,0x14368
    bdb6:	00 00 00 
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    bdb9:	b9 64 43 01 00       	mov    $0x14364,%ecx
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    bdbe:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    bdc0:	8b 50 04             	mov    0x4(%eax),%edx
    bdc3:	39 d3                	cmp    %edx,%ebx
    bdc5:	77 20                	ja     bde7 <malloc+0x69>
      if(p->s.size == nunits)
    bdc7:	39 d3                	cmp    %edx,%ebx
    bdc9:	75 06                	jne    bdd1 <malloc+0x53>
        prevp->s.ptr = p->s.ptr;
    bdcb:	8b 10                	mov    (%eax),%edx
    bdcd:	89 11                	mov    %edx,(%ecx)
    bdcf:	eb 0b                	jmp    bddc <malloc+0x5e>
      else {
        p->s.size -= nunits;
    bdd1:	29 da                	sub    %ebx,%edx
    bdd3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    bdd6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    bdd9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    bddc:	89 0d 60 43 01 00    	mov    %ecx,0x14360
      return (void*)(p + 1);
    bde2:	83 c0 08             	add    $0x8,%eax
    bde5:	eb 1e                	jmp    be05 <malloc+0x87>
    }
    if(p == freep)
    bde7:	3b 05 60 43 01 00    	cmp    0x14360,%eax
    bded:	75 0b                	jne    bdfa <malloc+0x7c>
      if((p = morecore(nunits)) == 0)
    bdef:	89 d8                	mov    %ebx,%eax
    bdf1:	e8 38 ff ff ff       	call   bd2e <morecore>
    bdf6:	85 c0                	test   %eax,%eax
    bdf8:	74 06                	je     be00 <malloc+0x82>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    bdfa:	89 c1                	mov    %eax,%ecx
    bdfc:	8b 00                	mov    (%eax),%eax
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    bdfe:	eb c0                	jmp    bdc0 <malloc+0x42>
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
    be00:	b8 00 00 00 00       	mov    $0x0,%eax
  }
}
    be05:	83 c4 04             	add    $0x4,%esp
    be08:	5b                   	pop    %ebx
    be09:	5d                   	pop    %ebp
    be0a:	c3                   	ret    

0000be0b <is_attached_tty>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int
is_attached_tty(int tty_fd){
    be0b:	55                   	push   %ebp
    be0c:	89 e5                	mov    %esp,%ebp
    be0e:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_ATTACH);
    be11:	6a 10                	push   $0x10
    be13:	6a 02                	push   $0x2
    be15:	ff 75 08             	pushl  0x8(%ebp)
    be18:	e8 29 fc ff ff       	call   ba46 <ioctl>
}
    be1d:	c9                   	leave  
    be1e:	c3                   	ret    

0000be1f <is_connected_tty>:

int
is_connected_tty(int tty_fd){
    be1f:	55                   	push   %ebp
    be20:	89 e5                	mov    %esp,%ebp
    be22:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYGETS, DEV_CONNECT);
    be25:	68 00 10 00 00       	push   $0x1000
    be2a:	6a 02                	push   $0x2
    be2c:	ff 75 08             	pushl  0x8(%ebp)
    be2f:	e8 12 fc ff ff       	call   ba46 <ioctl>
}
    be34:	c9                   	leave  
    be35:	c3                   	ret    

0000be36 <attach_tty>:

int
attach_tty(int tty_fd)
{
    be36:	55                   	push   %ebp
    be37:	89 e5                	mov    %esp,%ebp
    be39:	53                   	push   %ebx
    be3a:	83 ec 08             	sub    $0x8,%esp
    be3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
    be40:	6a 10                	push   $0x10
    be42:	6a 01                	push   $0x1
    be44:	53                   	push   %ebx
    be45:	e8 fc fb ff ff       	call   ba46 <ioctl>
    be4a:	83 c4 10             	add    $0x10,%esp
    be4d:	85 c0                	test   %eax,%eax
    be4f:	78 58                	js     bea9 <attach_tty+0x73>
     return -1;

    close(0);
    be51:	83 ec 0c             	sub    $0xc,%esp
    be54:	6a 00                	push   $0x0
    be56:	e8 43 fb ff ff       	call   b99e <close>
    close(1);
    be5b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    be62:	e8 37 fb ff ff       	call   b99e <close>
    close(2);
    be67:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    be6e:	e8 2b fb ff ff       	call   b99e <close>
    if(dup(tty_fd) < 0)
    be73:	89 1c 24             	mov    %ebx,(%esp)
    be76:	e8 73 fb ff ff       	call   b9ee <dup>
    be7b:	83 c4 10             	add    $0x10,%esp
    be7e:	85 c0                	test   %eax,%eax
    be80:	78 2e                	js     beb0 <attach_tty+0x7a>
      return -1;

    if(dup(tty_fd) < 0)
    be82:	83 ec 0c             	sub    $0xc,%esp
    be85:	53                   	push   %ebx
    be86:	e8 63 fb ff ff       	call   b9ee <dup>
    be8b:	83 c4 10             	add    $0x10,%esp
    be8e:	85 c0                	test   %eax,%eax
    be90:	78 25                	js     beb7 <attach_tty+0x81>
      return -1;

    if(dup(tty_fd) < 0)
    be92:	83 ec 0c             	sub    $0xc,%esp
    be95:	53                   	push   %ebx
    be96:	e8 53 fb ff ff       	call   b9ee <dup>
    be9b:	83 c4 10             	add    $0x10,%esp
    be9e:	85 c0                	test   %eax,%eax
    bea0:	79 1c                	jns    bebe <attach_tty+0x88>
      return -1;
    bea2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    bea7:	eb 1a                	jmp    bec3 <attach_tty+0x8d>

int
attach_tty(int tty_fd)
{
   if(ioctl(tty_fd, TTYSETS, DEV_ATTACH) < 0)
     return -1;
    bea9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    beae:	eb 13                	jmp    bec3 <attach_tty+0x8d>

    close(0);
    close(1);
    close(2);
    if(dup(tty_fd) < 0)
      return -1;
    beb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    beb5:	eb 0c                	jmp    bec3 <attach_tty+0x8d>

    if(dup(tty_fd) < 0)
      return -1;
    beb7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    bebc:	eb 05                	jmp    bec3 <attach_tty+0x8d>

    if(dup(tty_fd) < 0)
      return -1;

     return 0;
    bebe:	b8 00 00 00 00       	mov    $0x0,%eax
}
    bec3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    bec6:	c9                   	leave  
    bec7:	c3                   	ret    

0000bec8 <detach_tty>:

int
detach_tty(int tty_fd)
{
    bec8:	55                   	push   %ebp
    bec9:	89 e5                	mov    %esp,%ebp
    becb:	83 ec 0c             	sub    $0xc,%esp
    ioctl(tty_fd, TTYSETS, DEV_DETACH);
    bece:	6a 20                	push   $0x20
    bed0:	6a 01                	push   $0x1
    bed2:	ff 75 08             	pushl  0x8(%ebp)
    bed5:	e8 6c fb ff ff       	call   ba46 <ioctl>
    return 0;
}
    beda:	b8 00 00 00 00       	mov    $0x0,%eax
    bedf:	c9                   	leave  
    bee0:	c3                   	ret    

0000bee1 <connect_tty>:


int
connect_tty(int tty_fd)
{
    bee1:	55                   	push   %ebp
    bee2:	89 e5                	mov    %esp,%ebp
    bee4:	53                   	push   %ebx
    bee5:	83 ec 10             	sub    $0x10,%esp
    bee8:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(!is_attached_tty(tty_fd)){
    beeb:	53                   	push   %ebx
    beec:	e8 1a ff ff ff       	call   be0b <is_attached_tty>
    bef1:	83 c4 10             	add    $0x10,%esp
    bef4:	85 c0                	test   %eax,%eax
    bef6:	75 13                	jne    bf0b <connect_tty+0x2a>
      close(tty_fd);
    bef8:	83 ec 0c             	sub    $0xc,%esp
    befb:	53                   	push   %ebx
    befc:	e8 9d fa ff ff       	call   b99e <close>
       return -1;
    bf01:	83 c4 10             	add    $0x10,%esp
    bf04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    bf09:	eb 15                	jmp    bf20 <connect_tty+0x3f>
     }

     ioctl(tty_fd, TTYSETS, DEV_CONNECT);
    bf0b:	83 ec 04             	sub    $0x4,%esp
    bf0e:	68 00 10 00 00       	push   $0x1000
    bf13:	6a 01                	push   $0x1
    bf15:	53                   	push   %ebx
    bf16:	e8 2b fb ff ff       	call   ba46 <ioctl>
     return tty_fd;
    bf1b:	83 c4 10             	add    $0x10,%esp
    bf1e:	89 d8                	mov    %ebx,%eax
}
    bf20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    bf23:	c9                   	leave  
    bf24:	c3                   	ret    

0000bf25 <disconnect_tty>:

int
disconnect_tty(int tty_fd)
{
    bf25:	55                   	push   %ebp
    bf26:	89 e5                	mov    %esp,%ebp
    bf28:	83 ec 0c             	sub    $0xc,%esp
    return ioctl(tty_fd, TTYSETS, DEV_DISCONNECT);
    bf2b:	68 00 20 00 00       	push   $0x2000
    bf30:	6a 01                	push   $0x1
    bf32:	ff 75 08             	pushl  0x8(%ebp)
    bf35:	e8 0c fb ff ff       	call   ba46 <ioctl>
}
    bf3a:	c9                   	leave  
    bf3b:	c3                   	ret    
