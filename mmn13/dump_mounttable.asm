
_dump_mounttable:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
   9:	c7 44 24 04 05 0b 00 	movl   $0xb05,0x4(%esp)
  10:	00 
  11:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  18:	e8 d3 05 00 00       	call   5f0 <printf>
  1d:	e8 e5 04 00 00       	call   507 <printmounts>
  22:	85 c0                	test   %eax,%eax
  24:	75 1d                	jne    43 <main+0x43>
  26:	c7 44 24 04 21 0b 00 	movl   $0xb21,0x4(%esp)
  2d:	00 
  2e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  35:	e8 b6 05 00 00       	call   5f0 <printf>
  3a:	e8 d0 04 00 00       	call   50f <printdevices>
  3f:	85 c0                	test   %eax,%eax
  41:	74 20                	je     63 <main+0x63>
  43:	c7 44 24 04 13 0b 00 	movl   $0xb13,0x4(%esp)
  4a:	00 
  4b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  52:	e8 99 05 00 00       	call   5f0 <printf>
  57:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5e:	e8 f4 03 00 00       	call   457 <exit>
  63:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6a:	e8 e8 03 00 00       	call   457 <exit>
  6f:	90                   	nop

00000070 <strcpy>:
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	8b 45 08             	mov    0x8(%ebp),%eax
  76:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  79:	53                   	push   %ebx
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 55 08             	mov    0x8(%ebp),%edx
  a6:	53                   	push   %ebx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 2d                	je     de <strcmp+0x3e>
  b1:	0f b6 19             	movzbl (%ecx),%ebx
  b4:	38 d8                	cmp    %bl,%al
  b6:	74 0e                	je     c6 <strcmp+0x26>
  b8:	eb 2b                	jmp    e5 <strcmp+0x45>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	38 c8                	cmp    %cl,%al
  c2:	75 15                	jne    d9 <strcmp+0x39>
  c4:	89 d9                	mov    %ebx,%ecx
  c6:	83 c2 01             	add    $0x1,%edx
  c9:	0f b6 02             	movzbl (%edx),%eax
  cc:	8d 59 01             	lea    0x1(%ecx),%ebx
  cf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  d3:	84 c0                	test   %al,%al
  d5:	75 e9                	jne    c0 <strcmp+0x20>
  d7:	31 c0                	xor    %eax,%eax
  d9:	29 c8                	sub    %ecx,%eax
  db:	5b                   	pop    %ebx
  dc:	5d                   	pop    %ebp
  dd:	c3                   	ret    
  de:	0f b6 09             	movzbl (%ecx),%ecx
  e1:	31 c0                	xor    %eax,%eax
  e3:	eb f4                	jmp    d9 <strcmp+0x39>
  e5:	0f b6 cb             	movzbl %bl,%ecx
  e8:	eb ef                	jmp    d9 <strcmp+0x39>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000f0 <strncmp>:
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	56                   	push   %esi
  f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  fa:	53                   	push   %ebx
  fb:	0f b6 08             	movzbl (%eax),%ecx
  fe:	84 c9                	test   %cl,%cl
 100:	74 5a                	je     15c <strncmp+0x6c>
 102:	0f b6 1a             	movzbl (%edx),%ebx
 105:	38 d9                	cmp    %bl,%cl
 107:	75 5a                	jne    163 <strncmp+0x73>
 109:	8b 5d 10             	mov    0x10(%ebp),%ebx
 10c:	83 eb 01             	sub    $0x1,%ebx
 10f:	75 16                	jne    127 <strncmp+0x37>
 111:	eb 2d                	jmp    140 <strncmp+0x50>
 113:	90                   	nop
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 118:	0f b6 52 01          	movzbl 0x1(%edx),%edx
 11c:	38 d1                	cmp    %dl,%cl
 11e:	75 30                	jne    150 <strncmp+0x60>
 120:	83 eb 01             	sub    $0x1,%ebx
 123:	74 1b                	je     140 <strncmp+0x50>
 125:	89 f2                	mov    %esi,%edx
 127:	83 c0 01             	add    $0x1,%eax
 12a:	0f b6 08             	movzbl (%eax),%ecx
 12d:	8d 72 01             	lea    0x1(%edx),%esi
 130:	84 c9                	test   %cl,%cl
 132:	75 e4                	jne    118 <strncmp+0x28>
 134:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
 138:	31 c0                	xor    %eax,%eax
 13a:	5b                   	pop    %ebx
 13b:	29 c8                	sub    %ecx,%eax
 13d:	5e                   	pop    %esi
 13e:	5d                   	pop    %ebp
 13f:	c3                   	ret    
 140:	0f b6 c1             	movzbl %cl,%eax
 143:	5b                   	pop    %ebx
 144:	29 c8                	sub    %ecx,%eax
 146:	5e                   	pop    %esi
 147:	5d                   	pop    %ebp
 148:	c3                   	ret    
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 150:	0f b6 c1             	movzbl %cl,%eax
 153:	0f b6 ca             	movzbl %dl,%ecx
 156:	5b                   	pop    %ebx
 157:	29 c8                	sub    %ecx,%eax
 159:	5e                   	pop    %esi
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    
 15c:	0f b6 0a             	movzbl (%edx),%ecx
 15f:	31 c0                	xor    %eax,%eax
 161:	eb d7                	jmp    13a <strncmp+0x4a>
 163:	0f b6 c1             	movzbl %cl,%eax
 166:	0f b6 cb             	movzbl %bl,%ecx
 169:	eb cf                	jmp    13a <strncmp+0x4a>
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strlen>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 4d 08             	mov    0x8(%ebp),%ecx
 176:	80 39 00             	cmpb   $0x0,(%ecx)
 179:	74 12                	je     18d <strlen+0x1d>
 17b:	31 d2                	xor    %edx,%edx
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c2 01             	add    $0x1,%edx
 183:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 187:	89 d0                	mov    %edx,%eax
 189:	75 f5                	jne    180 <strlen+0x10>
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    
 18d:	31 c0                	xor    %eax,%eax
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    
 191:	eb 0d                	jmp    1a0 <memset>
 193:	90                   	nop
 194:	90                   	nop
 195:	90                   	nop
 196:	90                   	nop
 197:	90                   	nop
 198:	90                   	nop
 199:	90                   	nop
 19a:	90                   	nop
 19b:	90                   	nop
 19c:	90                   	nop
 19d:	90                   	nop
 19e:	90                   	nop
 19f:	90                   	nop

000001a0 <memset>:
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
 1a6:	57                   	push   %edi
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld    
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
 1b2:	89 d0                	mov    %edx,%eax
 1b4:	5f                   	pop    %edi
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	89 f6                	mov    %esi,%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <strchr>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	53                   	push   %ebx
 1c7:	8b 55 0c             	mov    0xc(%ebp),%edx
 1ca:	0f b6 18             	movzbl (%eax),%ebx
 1cd:	84 db                	test   %bl,%bl
 1cf:	74 1d                	je     1ee <strchr+0x2e>
 1d1:	38 d3                	cmp    %dl,%bl
 1d3:	89 d1                	mov    %edx,%ecx
 1d5:	75 0d                	jne    1e4 <strchr+0x24>
 1d7:	eb 17                	jmp    1f0 <strchr+0x30>
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e0:	38 ca                	cmp    %cl,%dl
 1e2:	74 0c                	je     1f0 <strchr+0x30>
 1e4:	83 c0 01             	add    $0x1,%eax
 1e7:	0f b6 10             	movzbl (%eax),%edx
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strchr+0x20>
 1ee:	31 c0                	xor    %eax,%eax
 1f0:	5b                   	pop    %ebx
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <gets>:
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
 205:	be 01 00 00 00       	mov    $0x1,%esi
 20a:	53                   	push   %ebx
 20b:	83 ec 2c             	sub    $0x2c,%esp
 20e:	8d 5d e7             	lea    -0x19(%ebp),%ebx
 211:	eb 37                	jmp    24a <gets+0x4a>
 213:	90                   	nop
 214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 218:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 21f:	00 
 220:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 224:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 22b:	e8 3f 02 00 00       	call   46f <read>
 230:	85 c0                	test   %eax,%eax
 232:	7e e4                	jle    218 <gets+0x18>
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 32 ff          	mov    %al,-0x1(%edx,%esi,1)
 23f:	83 c6 01             	add    $0x1,%esi
 242:	3c 0d                	cmp    $0xd,%al
 244:	74 22                	je     268 <gets+0x68>
 246:	3c 0a                	cmp    $0xa,%al
 248:	74 1e                	je     268 <gets+0x68>
 24a:	39 75 0c             	cmp    %esi,0xc(%ebp)
 24d:	89 f7                	mov    %esi,%edi
 24f:	8d 46 ff             	lea    -0x1(%esi),%eax
 252:	7f c4                	jg     218 <gets+0x18>
 254:	8b 4d 08             	mov    0x8(%ebp),%ecx
 257:	c6 04 01 00          	movb   $0x0,(%ecx,%eax,1)
 25b:	83 c4 2c             	add    $0x2c,%esp
 25e:	89 c8                	mov    %ecx,%eax
 260:	5b                   	pop    %ebx
 261:	5e                   	pop    %esi
 262:	5f                   	pop    %edi
 263:	5d                   	pop    %ebp
 264:	c3                   	ret    
 265:	8d 76 00             	lea    0x0(%esi),%esi
 268:	89 f8                	mov    %edi,%eax
 26a:	eb e8                	jmp    254 <gets+0x54>
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <stat>:
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	83 ec 10             	sub    $0x10,%esp
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 282:	00 
 283:	89 04 24             	mov    %eax,(%esp)
 286:	e8 0c 02 00 00       	call   497 <open>
 28b:	85 c0                	test   %eax,%eax
 28d:	89 c3                	mov    %eax,%ebx
 28f:	78 27                	js     2b8 <stat+0x48>
 291:	8b 45 0c             	mov    0xc(%ebp),%eax
 294:	89 1c 24             	mov    %ebx,(%esp)
 297:	89 44 24 04          	mov    %eax,0x4(%esp)
 29b:	e8 0f 02 00 00       	call   4af <fstat>
 2a0:	89 1c 24             	mov    %ebx,(%esp)
 2a3:	89 c6                	mov    %eax,%esi
 2a5:	e8 d5 01 00 00       	call   47f <close>
 2aa:	89 f0                	mov    %esi,%eax
 2ac:	83 c4 10             	add    $0x10,%esp
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	90                   	nop
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2bd:	eb ed                	jmp    2ac <stat+0x3c>
 2bf:	90                   	nop

000002c0 <atoi>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c6:	53                   	push   %ebx
 2c7:	0f be 11             	movsbl (%ecx),%edx
 2ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 2cd:	3c 09                	cmp    $0x9,%al
 2cf:	b8 00 00 00 00       	mov    $0x0,%eax
 2d4:	77 17                	ja     2ed <atoi+0x2d>
 2d6:	66 90                	xchg   %ax,%ax
 2d8:	83 c1 01             	add    $0x1,%ecx
 2db:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2de:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 2e2:	0f be 11             	movsbl (%ecx),%edx
 2e5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2e8:	80 fb 09             	cmp    $0x9,%bl
 2eb:	76 eb                	jbe    2d8 <atoi+0x18>
 2ed:	5b                   	pop    %ebx
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    

000002f0 <memmove>:
 2f0:	55                   	push   %ebp
 2f1:	31 d2                	xor    %edx,%edx
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	56                   	push   %esi
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	53                   	push   %ebx
 2fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2fd:	8b 75 0c             	mov    0xc(%ebp),%esi
 300:	85 db                	test   %ebx,%ebx
 302:	7e 12                	jle    316 <memmove+0x26>
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
 312:	39 da                	cmp    %ebx,%edx
 314:	75 f2                	jne    308 <memmove+0x18>
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <itoa>:
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	83 ec 0c             	sub    $0xc,%esp
 329:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 32c:	83 fb 00             	cmp    $0x0,%ebx
 32f:	0f 8e a1 00 00 00    	jle    3d6 <itoa+0xb6>
 335:	89 d9                	mov    %ebx,%ecx
 337:	31 f6                	xor    %esi,%esi
 339:	bf 67 66 66 66       	mov    $0x66666667,%edi
 33e:	66 90                	xchg   %ax,%ax
 340:	89 c8                	mov    %ecx,%eax
 342:	83 c6 01             	add    $0x1,%esi
 345:	f7 ef                	imul   %edi
 347:	c1 f9 1f             	sar    $0x1f,%ecx
 34a:	c1 fa 02             	sar    $0x2,%edx
 34d:	29 ca                	sub    %ecx,%edx
 34f:	89 d1                	mov    %edx,%ecx
 351:	75 ed                	jne    340 <itoa+0x20>
 353:	8d 46 0f             	lea    0xf(%esi),%eax
 356:	83 e0 f0             	and    $0xfffffff0,%eax
 359:	29 c4                	sub    %eax,%esp
 35b:	85 f6                	test   %esi,%esi
 35d:	89 e7                	mov    %esp,%edi
 35f:	0f 8e 92 00 00 00    	jle    3f7 <itoa+0xd7>
 365:	85 db                	test   %ebx,%ebx
 367:	0f 8e 8a 00 00 00    	jle    3f7 <itoa+0xd7>
 36d:	31 c9                	xor    %ecx,%ecx
 36f:	eb 0d                	jmp    37e <itoa+0x5e>
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	85 db                	test   %ebx,%ebx
 37a:	7e 29                	jle    3a5 <itoa+0x85>
 37c:	89 d1                	mov    %edx,%ecx
 37e:	b8 67 66 66 66       	mov    $0x66666667,%eax
 383:	f7 eb                	imul   %ebx
 385:	89 d8                	mov    %ebx,%eax
 387:	c1 f8 1f             	sar    $0x1f,%eax
 38a:	c1 fa 02             	sar    $0x2,%edx
 38d:	29 c2                	sub    %eax,%edx
 38f:	8d 04 92             	lea    (%edx,%edx,4),%eax
 392:	01 c0                	add    %eax,%eax
 394:	29 c3                	sub    %eax,%ebx
 396:	8d 43 30             	lea    0x30(%ebx),%eax
 399:	89 d3                	mov    %edx,%ebx
 39b:	8d 51 01             	lea    0x1(%ecx),%edx
 39e:	39 d6                	cmp    %edx,%esi
 3a0:	88 04 0f             	mov    %al,(%edi,%ecx,1)
 3a3:	7f d3                	jg     378 <itoa+0x58>
 3a5:	89 cb                	mov    %ecx,%ebx
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	eb 08                	jmp    3b4 <itoa+0x94>
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b0:	0f b6 04 0f          	movzbl (%edi,%ecx,1),%eax
 3b4:	83 e9 01             	sub    $0x1,%ecx
 3b7:	83 c2 01             	add    $0x1,%edx
 3ba:	88 42 ff             	mov    %al,-0x1(%edx)
 3bd:	83 f9 ff             	cmp    $0xffffffff,%ecx
 3c0:	75 ee                	jne    3b0 <itoa+0x90>
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	8d 44 18 01          	lea    0x1(%eax,%ebx,1),%eax
 3c9:	c6 00 00             	movb   $0x0,(%eax)
 3cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cf:	89 f0                	mov    %esi,%eax
 3d1:	5b                   	pop    %ebx
 3d2:	5e                   	pop    %esi
 3d3:	5f                   	pop    %edi
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    
 3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 3d9:	75 18                	jne    3f3 <itoa+0xd3>
 3db:	8b 75 08             	mov    0x8(%ebp),%esi
 3de:	83 c0 01             	add    $0x1,%eax
 3e1:	c6 06 30             	movb   $0x30,(%esi)
 3e4:	31 f6                	xor    %esi,%esi
 3e6:	c6 00 00             	movb   $0x0,(%eax)
 3e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ec:	89 f0                	mov    %esi,%eax
 3ee:	5b                   	pop    %ebx
 3ef:	5e                   	pop    %esi
 3f0:	5f                   	pop    %edi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    
 3f3:	31 f6                	xor    %esi,%esi
 3f5:	eb d2                	jmp    3c9 <itoa+0xa9>
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	eb cd                	jmp    3c9 <itoa+0xa9>
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <strcat>:
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	57                   	push   %edi
 407:	56                   	push   %esi
 408:	8b 75 0c             	mov    0xc(%ebp),%esi
 40b:	53                   	push   %ebx
 40c:	80 38 00             	cmpb   $0x0,(%eax)
 40f:	74 38                	je     449 <strcat+0x49>
 411:	31 c9                	xor    %ecx,%ecx
 413:	90                   	nop
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 418:	83 c1 01             	add    $0x1,%ecx
 41b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
 41f:	75 f7                	jne    418 <strcat+0x18>
 421:	89 ca                	mov    %ecx,%edx
 423:	0f b6 1e             	movzbl (%esi),%ebx
 426:	84 db                	test   %bl,%bl
 428:	74 16                	je     440 <strcat+0x40>
 42a:	31 d2                	xor    %edx,%edx
 42c:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
 42f:	90                   	nop
 430:	88 1c 17             	mov    %bl,(%edi,%edx,1)
 433:	83 c2 01             	add    $0x1,%edx
 436:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
 43a:	84 db                	test   %bl,%bl
 43c:	75 f2                	jne    430 <strcat+0x30>
 43e:	01 ca                	add    %ecx,%edx
 440:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
 444:	5b                   	pop    %ebx
 445:	5e                   	pop    %esi
 446:	5f                   	pop    %edi
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    
 449:	31 d2                	xor    %edx,%edx
 44b:	31 c9                	xor    %ecx,%ecx
 44d:	eb d4                	jmp    423 <strcat+0x23>

0000044f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44f:	b8 01 00 00 00       	mov    $0x1,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <exit>:
SYSCALL(exit)
 457:	b8 02 00 00 00       	mov    $0x2,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <wait>:
SYSCALL(wait)
 45f:	b8 03 00 00 00       	mov    $0x3,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <pipe>:
SYSCALL(pipe)
 467:	b8 04 00 00 00       	mov    $0x4,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <read>:
SYSCALL(read)
 46f:	b8 05 00 00 00       	mov    $0x5,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <write>:
SYSCALL(write)
 477:	b8 10 00 00 00       	mov    $0x10,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <close>:
SYSCALL(close)
 47f:	b8 15 00 00 00       	mov    $0x15,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <kill>:
SYSCALL(kill)
 487:	b8 06 00 00 00       	mov    $0x6,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <exec>:
SYSCALL(exec)
 48f:	b8 07 00 00 00       	mov    $0x7,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <open>:
SYSCALL(open)
 497:	b8 0f 00 00 00       	mov    $0xf,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <mknod>:
SYSCALL(mknod)
 49f:	b8 11 00 00 00       	mov    $0x11,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <unlink>:
SYSCALL(unlink)
 4a7:	b8 12 00 00 00       	mov    $0x12,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <fstat>:
SYSCALL(fstat)
 4af:	b8 08 00 00 00       	mov    $0x8,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <link>:
SYSCALL(link)
 4b7:	b8 13 00 00 00       	mov    $0x13,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <mkdir>:
SYSCALL(mkdir)
 4bf:	b8 14 00 00 00       	mov    $0x14,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <chdir>:
SYSCALL(chdir)
 4c7:	b8 09 00 00 00       	mov    $0x9,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <dup>:
SYSCALL(dup)
 4cf:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <getpid>:
SYSCALL(getpid)
 4d7:	b8 0b 00 00 00       	mov    $0xb,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <sbrk>:
SYSCALL(sbrk)
 4df:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <sleep>:
SYSCALL(sleep)
 4e7:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <uptime>:
SYSCALL(uptime)
 4ef:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <mount>:
SYSCALL(mount)
 4f7:	b8 16 00 00 00       	mov    $0x16,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <umount>:
SYSCALL(umount)
 4ff:	b8 17 00 00 00       	mov    $0x17,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <printmounts>:
SYSCALL(printmounts)
 507:	b8 18 00 00 00       	mov    $0x18,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <printdevices>:
SYSCALL(printdevices)
 50f:	b8 19 00 00 00       	mov    $0x19,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <unshare>:
SYSCALL(unshare)
 517:	b8 1a 00 00 00       	mov    $0x1a,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <usleep>:
SYSCALL(usleep)
 51f:	b8 1b 00 00 00       	mov    $0x1b,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <ioctl>:
SYSCALL(ioctl)
 527:	b8 1c 00 00 00       	mov    $0x1c,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <getppid>:
SYSCALL(getppid)
 52f:	b8 1d 00 00 00       	mov    $0x1d,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <getcpu>:
SYSCALL(getcpu)
 537:	b8 1e 00 00 00       	mov    $0x1e,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <getmem>:
SYSCALL(getmem)
 53f:	b8 1f 00 00 00       	mov    $0x1f,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <kmemtest>:
SYSCALL(kmemtest)
 547:	b8 20 00 00 00       	mov    $0x20,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    
 54f:	90                   	nop

00000550 <printint>:
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	89 c6                	mov    %eax,%esi
 557:	53                   	push   %ebx
 558:	83 ec 4c             	sub    $0x4c,%esp
 55b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 55e:	85 db                	test   %ebx,%ebx
 560:	74 09                	je     56b <printint+0x1b>
 562:	89 d0                	mov    %edx,%eax
 564:	c1 e8 1f             	shr    $0x1f,%eax
 567:	84 c0                	test   %al,%al
 569:	75 75                	jne    5e0 <printint+0x90>
 56b:	89 d0                	mov    %edx,%eax
 56d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 574:	89 75 c0             	mov    %esi,-0x40(%ebp)
 577:	31 ff                	xor    %edi,%edi
 579:	89 ce                	mov    %ecx,%esi
 57b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 57e:	eb 02                	jmp    582 <printint+0x32>
 580:	89 cf                	mov    %ecx,%edi
 582:	31 d2                	xor    %edx,%edx
 584:	f7 f6                	div    %esi
 586:	8d 4f 01             	lea    0x1(%edi),%ecx
 589:	0f b6 92 37 0b 00 00 	movzbl 0xb37(%edx),%edx
 590:	85 c0                	test   %eax,%eax
 592:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 595:	75 e9                	jne    580 <printint+0x30>
 597:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 59a:	89 c8                	mov    %ecx,%eax
 59c:	8b 75 c0             	mov    -0x40(%ebp),%esi
 59f:	85 d2                	test   %edx,%edx
 5a1:	74 08                	je     5ab <printint+0x5b>
 5a3:	8d 4f 02             	lea    0x2(%edi),%ecx
 5a6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 5ab:	8d 79 ff             	lea    -0x1(%ecx),%edi
 5ae:	66 90                	xchg   %ax,%ax
 5b0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 5b5:	83 ef 01             	sub    $0x1,%edi
 5b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5bf:	00 
 5c0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 5c4:	89 34 24             	mov    %esi,(%esp)
 5c7:	88 45 d7             	mov    %al,-0x29(%ebp)
 5ca:	e8 a8 fe ff ff       	call   477 <write>
 5cf:	83 ff ff             	cmp    $0xffffffff,%edi
 5d2:	75 dc                	jne    5b0 <printint+0x60>
 5d4:	83 c4 4c             	add    $0x4c,%esp
 5d7:	5b                   	pop    %ebx
 5d8:	5e                   	pop    %esi
 5d9:	5f                   	pop    %edi
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	f7 d8                	neg    %eax
 5e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 5eb:	eb 87                	jmp    574 <printint+0x24>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi

000005f0 <printf>:
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	31 ff                	xor    %edi,%edi
 5f6:	56                   	push   %esi
 5f7:	53                   	push   %ebx
 5f8:	83 ec 3c             	sub    $0x3c,%esp
 5fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 5fe:	8d 45 10             	lea    0x10(%ebp),%eax
 601:	8b 75 08             	mov    0x8(%ebp),%esi
 604:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 607:	0f b6 13             	movzbl (%ebx),%edx
 60a:	83 c3 01             	add    $0x1,%ebx
 60d:	84 d2                	test   %dl,%dl
 60f:	75 39                	jne    64a <printf+0x5a>
 611:	e9 c2 00 00 00       	jmp    6d8 <printf+0xe8>
 616:	66 90                	xchg   %ax,%ax
 618:	83 fa 25             	cmp    $0x25,%edx
 61b:	0f 84 bf 00 00 00    	je     6e0 <printf+0xf0>
 621:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 624:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 62b:	00 
 62c:	89 44 24 04          	mov    %eax,0x4(%esp)
 630:	89 34 24             	mov    %esi,(%esp)
 633:	88 55 e2             	mov    %dl,-0x1e(%ebp)
 636:	e8 3c fe ff ff       	call   477 <write>
 63b:	83 c3 01             	add    $0x1,%ebx
 63e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 642:	84 d2                	test   %dl,%dl
 644:	0f 84 8e 00 00 00    	je     6d8 <printf+0xe8>
 64a:	85 ff                	test   %edi,%edi
 64c:	0f be c2             	movsbl %dl,%eax
 64f:	74 c7                	je     618 <printf+0x28>
 651:	83 ff 25             	cmp    $0x25,%edi
 654:	75 e5                	jne    63b <printf+0x4b>
 656:	83 fa 64             	cmp    $0x64,%edx
 659:	0f 84 31 01 00 00    	je     790 <printf+0x1a0>
 65f:	25 f7 00 00 00       	and    $0xf7,%eax
 664:	83 f8 70             	cmp    $0x70,%eax
 667:	0f 84 83 00 00 00    	je     6f0 <printf+0x100>
 66d:	83 fa 73             	cmp    $0x73,%edx
 670:	0f 84 a2 00 00 00    	je     718 <printf+0x128>
 676:	83 fa 63             	cmp    $0x63,%edx
 679:	0f 84 35 01 00 00    	je     7b4 <printf+0x1c4>
 67f:	83 fa 25             	cmp    $0x25,%edx
 682:	0f 84 e0 00 00 00    	je     768 <printf+0x178>
 688:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 68b:	83 c3 01             	add    $0x1,%ebx
 68e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 695:	00 
 696:	31 ff                	xor    %edi,%edi
 698:	89 44 24 04          	mov    %eax,0x4(%esp)
 69c:	89 34 24             	mov    %esi,(%esp)
 69f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 6a2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 6a6:	e8 cc fd ff ff       	call   477 <write>
 6ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
 6ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b8:	00 
 6b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bd:	89 34 24             	mov    %esi,(%esp)
 6c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6c3:	e8 af fd ff ff       	call   477 <write>
 6c8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 6cc:	84 d2                	test   %dl,%dl
 6ce:	0f 85 76 ff ff ff    	jne    64a <printf+0x5a>
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6d8:	83 c4 3c             	add    $0x3c,%esp
 6db:	5b                   	pop    %ebx
 6dc:	5e                   	pop    %esi
 6dd:	5f                   	pop    %edi
 6de:	5d                   	pop    %ebp
 6df:	c3                   	ret    
 6e0:	bf 25 00 00 00       	mov    $0x25,%edi
 6e5:	e9 51 ff ff ff       	jmp    63b <printf+0x4b>
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f8:	31 ff                	xor    %edi,%edi
 6fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 701:	8b 10                	mov    (%eax),%edx
 703:	89 f0                	mov    %esi,%eax
 705:	e8 46 fe ff ff       	call   550 <printint>
 70a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 70e:	e9 28 ff ff ff       	jmp    63b <printf+0x4b>
 713:	90                   	nop
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 718:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 71b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 71f:	8b 38                	mov    (%eax),%edi
 721:	b8 30 0b 00 00       	mov    $0xb30,%eax
 726:	85 ff                	test   %edi,%edi
 728:	0f 44 f8             	cmove  %eax,%edi
 72b:	0f b6 07             	movzbl (%edi),%eax
 72e:	84 c0                	test   %al,%al
 730:	74 2a                	je     75c <printf+0x16c>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 738:	88 45 e3             	mov    %al,-0x1d(%ebp)
 73b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 73e:	83 c7 01             	add    $0x1,%edi
 741:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 748:	00 
 749:	89 44 24 04          	mov    %eax,0x4(%esp)
 74d:	89 34 24             	mov    %esi,(%esp)
 750:	e8 22 fd ff ff       	call   477 <write>
 755:	0f b6 07             	movzbl (%edi),%eax
 758:	84 c0                	test   %al,%al
 75a:	75 dc                	jne    738 <printf+0x148>
 75c:	31 ff                	xor    %edi,%edi
 75e:	e9 d8 fe ff ff       	jmp    63b <printf+0x4b>
 763:	90                   	nop
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 768:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 76b:	31 ff                	xor    %edi,%edi
 76d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 774:	00 
 775:	89 44 24 04          	mov    %eax,0x4(%esp)
 779:	89 34 24             	mov    %esi,(%esp)
 77c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 780:	e8 f2 fc ff ff       	call   477 <write>
 785:	e9 b1 fe ff ff       	jmp    63b <printf+0x4b>
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 790:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 793:	b9 0a 00 00 00       	mov    $0xa,%ecx
 798:	66 31 ff             	xor    %di,%di
 79b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 7a2:	8b 10                	mov    (%eax),%edx
 7a4:	89 f0                	mov    %esi,%eax
 7a6:	e8 a5 fd ff ff       	call   550 <printint>
 7ab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7af:	e9 87 fe ff ff       	jmp    63b <printf+0x4b>
 7b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7b7:	31 ff                	xor    %edi,%edi
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7c2:	00 
 7c3:	89 34 24             	mov    %esi,(%esp)
 7c6:	88 45 e4             	mov    %al,-0x1c(%ebp)
 7c9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d0:	e8 a2 fc ff ff       	call   477 <write>
 7d5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7d9:	e9 5d fe ff ff       	jmp    63b <printf+0x4b>
 7de:	66 90                	xchg   %ax,%ax

000007e0 <free>:
 7e0:	55                   	push   %ebp
 7e1:	a1 38 0f 00 00       	mov    0xf38,%eax
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	53                   	push   %ebx
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7ee:	8b 08                	mov    (%eax),%ecx
 7f0:	8d 53 f8             	lea    -0x8(%ebx),%edx
 7f3:	39 d0                	cmp    %edx,%eax
 7f5:	72 11                	jb     808 <free+0x28>
 7f7:	90                   	nop
 7f8:	39 c8                	cmp    %ecx,%eax
 7fa:	72 04                	jb     800 <free+0x20>
 7fc:	39 ca                	cmp    %ecx,%edx
 7fe:	72 10                	jb     810 <free+0x30>
 800:	89 c8                	mov    %ecx,%eax
 802:	39 d0                	cmp    %edx,%eax
 804:	8b 08                	mov    (%eax),%ecx
 806:	73 f0                	jae    7f8 <free+0x18>
 808:	39 ca                	cmp    %ecx,%edx
 80a:	72 04                	jb     810 <free+0x30>
 80c:	39 c8                	cmp    %ecx,%eax
 80e:	72 f0                	jb     800 <free+0x20>
 810:	8b 73 fc             	mov    -0x4(%ebx),%esi
 813:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 816:	39 cf                	cmp    %ecx,%edi
 818:	74 1e                	je     838 <free+0x58>
 81a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
 81d:	8b 48 04             	mov    0x4(%eax),%ecx
 820:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 823:	39 f2                	cmp    %esi,%edx
 825:	74 28                	je     84f <free+0x6f>
 827:	89 10                	mov    %edx,(%eax)
 829:	a3 38 0f 00 00       	mov    %eax,0xf38
 82e:	5b                   	pop    %ebx
 82f:	5e                   	pop    %esi
 830:	5f                   	pop    %edi
 831:	5d                   	pop    %ebp
 832:	c3                   	ret    
 833:	90                   	nop
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 838:	03 71 04             	add    0x4(%ecx),%esi
 83b:	89 73 fc             	mov    %esi,-0x4(%ebx)
 83e:	8b 08                	mov    (%eax),%ecx
 840:	8b 09                	mov    (%ecx),%ecx
 842:	89 4b f8             	mov    %ecx,-0x8(%ebx)
 845:	8b 48 04             	mov    0x4(%eax),%ecx
 848:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 84b:	39 f2                	cmp    %esi,%edx
 84d:	75 d8                	jne    827 <free+0x47>
 84f:	03 4b fc             	add    -0x4(%ebx),%ecx
 852:	a3 38 0f 00 00       	mov    %eax,0xf38
 857:	89 48 04             	mov    %ecx,0x4(%eax)
 85a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 85d:	89 10                	mov    %edx,(%eax)
 85f:	5b                   	pop    %ebx
 860:	5e                   	pop    %esi
 861:	5f                   	pop    %edi
 862:	5d                   	pop    %ebp
 863:	c3                   	ret    
 864:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 86a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000870 <malloc>:
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 1c             	sub    $0x1c,%esp
 879:	8b 45 08             	mov    0x8(%ebp),%eax
 87c:	8b 1d 38 0f 00 00    	mov    0xf38,%ebx
 882:	8d 48 07             	lea    0x7(%eax),%ecx
 885:	c1 e9 03             	shr    $0x3,%ecx
 888:	85 db                	test   %ebx,%ebx
 88a:	8d 71 01             	lea    0x1(%ecx),%esi
 88d:	0f 84 9b 00 00 00    	je     92e <malloc+0xbe>
 893:	8b 13                	mov    (%ebx),%edx
 895:	8b 7a 04             	mov    0x4(%edx),%edi
 898:	39 fe                	cmp    %edi,%esi
 89a:	76 64                	jbe    900 <malloc+0x90>
 89c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 8a3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 8a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8ab:	eb 0e                	jmp    8bb <malloc+0x4b>
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
 8b0:	8b 02                	mov    (%edx),%eax
 8b2:	8b 78 04             	mov    0x4(%eax),%edi
 8b5:	39 fe                	cmp    %edi,%esi
 8b7:	76 4f                	jbe    908 <malloc+0x98>
 8b9:	89 c2                	mov    %eax,%edx
 8bb:	3b 15 38 0f 00 00    	cmp    0xf38,%edx
 8c1:	75 ed                	jne    8b0 <malloc+0x40>
 8c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8cc:	bf 00 10 00 00       	mov    $0x1000,%edi
 8d1:	0f 43 fe             	cmovae %esi,%edi
 8d4:	0f 42 c3             	cmovb  %ebx,%eax
 8d7:	89 04 24             	mov    %eax,(%esp)
 8da:	e8 00 fc ff ff       	call   4df <sbrk>
 8df:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e2:	74 18                	je     8fc <malloc+0x8c>
 8e4:	89 78 04             	mov    %edi,0x4(%eax)
 8e7:	83 c0 08             	add    $0x8,%eax
 8ea:	89 04 24             	mov    %eax,(%esp)
 8ed:	e8 ee fe ff ff       	call   7e0 <free>
 8f2:	8b 15 38 0f 00 00    	mov    0xf38,%edx
 8f8:	85 d2                	test   %edx,%edx
 8fa:	75 b4                	jne    8b0 <malloc+0x40>
 8fc:	31 c0                	xor    %eax,%eax
 8fe:	eb 20                	jmp    920 <malloc+0xb0>
 900:	89 d0                	mov    %edx,%eax
 902:	89 da                	mov    %ebx,%edx
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 908:	39 fe                	cmp    %edi,%esi
 90a:	74 1c                	je     928 <malloc+0xb8>
 90c:	29 f7                	sub    %esi,%edi
 90e:	89 78 04             	mov    %edi,0x4(%eax)
 911:	8d 04 f8             	lea    (%eax,%edi,8),%eax
 914:	89 70 04             	mov    %esi,0x4(%eax)
 917:	89 15 38 0f 00 00    	mov    %edx,0xf38
 91d:	83 c0 08             	add    $0x8,%eax
 920:	83 c4 1c             	add    $0x1c,%esp
 923:	5b                   	pop    %ebx
 924:	5e                   	pop    %esi
 925:	5f                   	pop    %edi
 926:	5d                   	pop    %ebp
 927:	c3                   	ret    
 928:	8b 08                	mov    (%eax),%ecx
 92a:	89 0a                	mov    %ecx,(%edx)
 92c:	eb e9                	jmp    917 <malloc+0xa7>
 92e:	c7 05 38 0f 00 00 3c 	movl   $0xf3c,0xf38
 935:	0f 00 00 
 938:	ba 3c 0f 00 00       	mov    $0xf3c,%edx
 93d:	c7 05 3c 0f 00 00 3c 	movl   $0xf3c,0xf3c
 944:	0f 00 00 
 947:	c7 05 40 0f 00 00 00 	movl   $0x0,0xf40
 94e:	00 00 00 
 951:	e9 46 ff ff ff       	jmp    89c <malloc+0x2c>
 956:	66 90                	xchg   %ax,%ax
 958:	66 90                	xchg   %ax,%ax
 95a:	66 90                	xchg   %ax,%ax
 95c:	66 90                	xchg   %ax,%ax
 95e:	66 90                	xchg   %ax,%ax

00000960 <is_attached_tty>:
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	83 ec 18             	sub    $0x18,%esp
 966:	8b 45 08             	mov    0x8(%ebp),%eax
 969:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 970:	00 
 971:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 978:	00 
 979:	89 04 24             	mov    %eax,(%esp)
 97c:	e8 a6 fb ff ff       	call   527 <ioctl>
 981:	c9                   	leave  
 982:	c3                   	ret    
 983:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <is_connected_tty>:
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	83 ec 18             	sub    $0x18,%esp
 996:	8b 45 08             	mov    0x8(%ebp),%eax
 999:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
 9a0:	00 
 9a1:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 9a8:	00 
 9a9:	89 04 24             	mov    %eax,(%esp)
 9ac:	e8 76 fb ff ff       	call   527 <ioctl>
 9b1:	c9                   	leave  
 9b2:	c3                   	ret    
 9b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009c0 <attach_tty>:
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	53                   	push   %ebx
 9c4:	83 ec 14             	sub    $0x14,%esp
 9c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9ca:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 9d1:	00 
 9d2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9d9:	00 
 9da:	89 1c 24             	mov    %ebx,(%esp)
 9dd:	e8 45 fb ff ff       	call   527 <ioctl>
 9e2:	85 c0                	test   %eax,%eax
 9e4:	78 52                	js     a38 <attach_tty+0x78>
 9e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9ed:	e8 8d fa ff ff       	call   47f <close>
 9f2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9f9:	e8 81 fa ff ff       	call   47f <close>
 9fe:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a05:	e8 75 fa ff ff       	call   47f <close>
 a0a:	89 1c 24             	mov    %ebx,(%esp)
 a0d:	e8 bd fa ff ff       	call   4cf <dup>
 a12:	85 c0                	test   %eax,%eax
 a14:	78 22                	js     a38 <attach_tty+0x78>
 a16:	89 1c 24             	mov    %ebx,(%esp)
 a19:	e8 b1 fa ff ff       	call   4cf <dup>
 a1e:	85 c0                	test   %eax,%eax
 a20:	78 16                	js     a38 <attach_tty+0x78>
 a22:	89 1c 24             	mov    %ebx,(%esp)
 a25:	e8 a5 fa ff ff       	call   4cf <dup>
 a2a:	83 c4 14             	add    $0x14,%esp
 a2d:	5b                   	pop    %ebx
 a2e:	5d                   	pop    %ebp
 a2f:	c1 f8 1f             	sar    $0x1f,%eax
 a32:	c3                   	ret    
 a33:	90                   	nop
 a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a38:	83 c4 14             	add    $0x14,%esp
 a3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a40:	5b                   	pop    %ebx
 a41:	5d                   	pop    %ebp
 a42:	c3                   	ret    
 a43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a50 <detach_tty>:
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	83 ec 18             	sub    $0x18,%esp
 a56:	8b 45 08             	mov    0x8(%ebp),%eax
 a59:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
 a60:	00 
 a61:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 a68:	00 
 a69:	89 04 24             	mov    %eax,(%esp)
 a6c:	e8 b6 fa ff ff       	call   527 <ioctl>
 a71:	31 c0                	xor    %eax,%eax
 a73:	c9                   	leave  
 a74:	c3                   	ret    
 a75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a80 <connect_tty>:
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	53                   	push   %ebx
 a84:	83 ec 14             	sub    $0x14,%esp
 a87:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a8a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 a91:	00 
 a92:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 a99:	00 
 a9a:	89 1c 24             	mov    %ebx,(%esp)
 a9d:	e8 85 fa ff ff       	call   527 <ioctl>
 aa2:	85 c0                	test   %eax,%eax
 aa4:	74 22                	je     ac8 <connect_tty+0x48>
 aa6:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
 aad:	00 
 aae:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 ab5:	00 
 ab6:	89 1c 24             	mov    %ebx,(%esp)
 ab9:	e8 69 fa ff ff       	call   527 <ioctl>
 abe:	89 d8                	mov    %ebx,%eax
 ac0:	83 c4 14             	add    $0x14,%esp
 ac3:	5b                   	pop    %ebx
 ac4:	5d                   	pop    %ebp
 ac5:	c3                   	ret    
 ac6:	66 90                	xchg   %ax,%ax
 ac8:	89 1c 24             	mov    %ebx,(%esp)
 acb:	e8 af f9 ff ff       	call   47f <close>
 ad0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ad5:	eb e9                	jmp    ac0 <connect_tty+0x40>
 ad7:	89 f6                	mov    %esi,%esi
 ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ae0 <disconnect_tty>:
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	83 ec 18             	sub    $0x18,%esp
 ae6:	8b 45 08             	mov    0x8(%ebp),%eax
 ae9:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 af0:	00 
 af1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 af8:	00 
 af9:	89 04 24             	mov    %eax,(%esp)
 afc:	e8 26 fa ff ff       	call   527 <ioctl>
 b01:	31 c0                	xor    %eax,%eax
 b03:	c9                   	leave  
 b04:	c3                   	ret    
