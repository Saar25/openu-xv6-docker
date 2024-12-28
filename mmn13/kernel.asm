
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 f0 11 00       	mov    $0x11f000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 25 12 80       	mov    $0x801225c0,%esp
8010002d:	b8 30 3b 10 80       	mov    $0x80103b30,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 25 12 80       	mov    $0x801225f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 60 e6 10 80       	push   $0x8010e660
80100051:	68 c0 25 12 80       	push   $0x801225c0
80100056:	e8 d5 60 00 00       	call   80106130 <initlock>
8010005b:	c7 05 84 a9 12 80 34 	movl   $0x8012a934,0x8012a984
80100062:	a9 12 80 
80100065:	c7 05 88 a9 12 80 34 	movl   $0x8012a934,0x8012a988
8010006c:	a9 12 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 34 a9 12 80       	mov    $0x8012a934,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 34 a9 12 80 	movl   $0x8012a934,0x50(%ebx)
80100092:	68 67 e6 10 80       	push   $0x8010e667
80100097:	50                   	push   %eax
80100098:	e8 83 5f 00 00       	call   80106020 <initsleeplock>
8010009d:	a1 88 a9 12 80       	mov    0x8012a988,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 60 04 00 00    	lea    0x460(%ebx),%eax
801000b0:	89 1d 88 a9 12 80    	mov    %ebx,0x8012a988
801000b6:	3d 34 a9 12 80       	cmp    $0x8012a934,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <invalidateblocks>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	53                   	push   %ebx
801000d4:	83 ec 10             	sub    $0x10,%esp
801000d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801000da:	68 c0 25 12 80       	push   $0x801225c0
801000df:	e8 4c 61 00 00       	call   80106230 <acquire>
801000e4:	a1 88 a9 12 80       	mov    0x8012a988,%eax
801000e9:	83 c4 10             	add    $0x10,%esp
801000ec:	3d 34 a9 12 80       	cmp    $0x8012a934,%eax
801000f1:	75 0f                	jne    80100102 <invalidateblocks+0x32>
801000f3:	eb 1f                	jmp    80100114 <invalidateblocks+0x44>
801000f5:	8d 76 00             	lea    0x0(%esi),%esi
801000f8:	8b 40 54             	mov    0x54(%eax),%eax
801000fb:	3d 34 a9 12 80       	cmp    $0x8012a934,%eax
80100100:	74 12                	je     80100114 <invalidateblocks+0x44>
80100102:	39 58 04             	cmp    %ebx,0x4(%eax)
80100105:	75 f1                	jne    801000f8 <invalidateblocks+0x28>
80100107:	83 20 f9             	andl   $0xfffffff9,(%eax)
8010010a:	8b 40 54             	mov    0x54(%eax),%eax
8010010d:	3d 34 a9 12 80       	cmp    $0x8012a934,%eax
80100112:	75 ee                	jne    80100102 <invalidateblocks+0x32>
80100114:	c7 45 08 c0 25 12 80 	movl   $0x801225c0,0x8(%ebp)
8010011b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010011e:	c9                   	leave  
8010011f:	e9 2c 62 00 00       	jmp    80106350 <release>
80100124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010012a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100130 <devicerw>:
80100130:	55                   	push   %ebp
80100131:	89 e5                	mov    %esp,%ebp
80100133:	53                   	push   %ebx
80100134:	83 ec 04             	sub    $0x4,%esp
80100137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010013a:	8b 55 08             	mov    0x8(%ebp),%edx
8010013d:	f6 03 04             	testb  $0x4,(%ebx)
80100140:	74 2e                	je     80100170 <devicerw+0x40>
80100142:	68 00 04 00 00       	push   $0x400
80100147:	8b 43 08             	mov    0x8(%ebx),%eax
8010014a:	c1 e0 0a             	shl    $0xa,%eax
8010014d:	50                   	push   %eax
8010014e:	8d 43 60             	lea    0x60(%ebx),%eax
80100151:	50                   	push   %eax
80100152:	52                   	push   %edx
80100153:	e8 78 21 00 00       	call   801022d0 <writei>
80100158:	8b 03                	mov    (%ebx),%eax
8010015a:	83 c4 10             	add    $0x10,%esp
8010015d:	83 e0 fb             	and    $0xfffffffb,%eax
80100160:	83 c8 02             	or     $0x2,%eax
80100163:	89 03                	mov    %eax,(%ebx)
80100165:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100168:	c9                   	leave  
80100169:	c3                   	ret    
8010016a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100170:	68 00 04 00 00       	push   $0x400
80100175:	8b 43 08             	mov    0x8(%ebx),%eax
80100178:	c1 e0 0a             	shl    $0xa,%eax
8010017b:	50                   	push   %eax
8010017c:	8d 43 60             	lea    0x60(%ebx),%eax
8010017f:	50                   	push   %eax
80100180:	52                   	push   %edx
80100181:	e8 3a 20 00 00       	call   801021c0 <readi>
80100186:	8b 03                	mov    (%ebx),%eax
80100188:	83 c4 10             	add    $0x10,%esp
8010018b:	83 e0 fb             	and    $0xfffffffb,%eax
8010018e:	83 c8 02             	or     $0x2,%eax
80100191:	89 03                	mov    %eax,(%ebx)
80100193:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100196:	c9                   	leave  
80100197:	c3                   	ret    
80100198:	90                   	nop
80100199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801001a0 <brw>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	ff 73 04             	pushl  0x4(%ebx)
801001ad:	e8 5e 0e 00 00       	call   80101010 <getinodefordevice>
801001b2:	83 c4 10             	add    $0x10,%esp
801001b5:	85 c0                	test   %eax,%eax
801001b7:	74 17                	je     801001d0 <brw+0x30>
801001b9:	83 ec 08             	sub    $0x8,%esp
801001bc:	53                   	push   %ebx
801001bd:	50                   	push   %eax
801001be:	e8 6d ff ff ff       	call   80100130 <devicerw>
801001c3:	83 c4 10             	add    $0x10,%esp
801001c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c9:	c9                   	leave  
801001ca:	c3                   	ret    
801001cb:	90                   	nop
801001cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d6:	c9                   	leave  
801001d7:	e9 34 29 00 00       	jmp    80102b10 <iderw>
801001dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801001e0 <bread>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	57                   	push   %edi
801001e4:	56                   	push   %esi
801001e5:	53                   	push   %ebx
801001e6:	83 ec 1c             	sub    $0x1c,%esp
801001e9:	8b 7d 08             	mov    0x8(%ebp),%edi
801001ec:	8b 75 0c             	mov    0xc(%ebp),%esi
801001ef:	e8 00 5e 00 00       	call   80105ff4 <proc_get_cgroup>
801001f4:	83 ec 0c             	sub    $0xc,%esp
801001f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801001fa:	68 c0 25 12 80       	push   $0x801225c0
801001ff:	e8 2c 60 00 00       	call   80106230 <acquire>
80100204:	8b 1d 88 a9 12 80    	mov    0x8012a988,%ebx
8010020a:	83 c4 10             	add    $0x10,%esp
8010020d:	81 fb 34 a9 12 80    	cmp    $0x8012a934,%ebx
80100213:	75 16                	jne    8010022b <bread+0x4b>
80100215:	eb 59                	jmp    80100270 <bread+0x90>
80100217:	89 f6                	mov    %esi,%esi
80100219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100220:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100223:	81 fb 34 a9 12 80    	cmp    $0x8012a934,%ebx
80100229:	74 45                	je     80100270 <bread+0x90>
8010022b:	3b 7b 04             	cmp    0x4(%ebx),%edi
8010022e:	75 f0                	jne    80100220 <bread+0x40>
80100230:	3b 73 08             	cmp    0x8(%ebx),%esi
80100233:	75 eb                	jne    80100220 <bread+0x40>
80100235:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100239:	83 ec 0c             	sub    $0xc,%esp
8010023c:	68 c0 25 12 80       	push   $0x801225c0
80100241:	e8 0a 61 00 00       	call   80106350 <release>
80100246:	8d 43 0c             	lea    0xc(%ebx),%eax
80100249:	89 04 24             	mov    %eax,(%esp)
8010024c:	e8 0f 5e 00 00       	call   80106060 <acquiresleep>
80100251:	59                   	pop    %ecx
80100252:	ff 75 e4             	pushl  -0x1c(%ebp)
80100255:	e8 06 e1 00 00       	call   8010e360 <cgroup_mem_stat_pgfault_incr>
8010025a:	83 c4 10             	add    $0x10,%esp
8010025d:	f6 03 02             	testb  $0x2,(%ebx)
80100260:	74 78                	je     801002da <bread+0xfa>
80100262:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100265:	89 d8                	mov    %ebx,%eax
80100267:	5b                   	pop    %ebx
80100268:	5e                   	pop    %esi
80100269:	5f                   	pop    %edi
8010026a:	5d                   	pop    %ebp
8010026b:	c3                   	ret    
8010026c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100270:	8b 1d 84 a9 12 80    	mov    0x8012a984,%ebx
80100276:	81 fb 34 a9 12 80    	cmp    $0x8012a934,%ebx
8010027c:	75 0d                	jne    8010028b <bread+0xab>
8010027e:	eb 70                	jmp    801002f0 <bread+0x110>
80100280:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100283:	81 fb 34 a9 12 80    	cmp    $0x8012a934,%ebx
80100289:	74 65                	je     801002f0 <bread+0x110>
8010028b:	8b 53 4c             	mov    0x4c(%ebx),%edx
8010028e:	85 d2                	test   %edx,%edx
80100290:	75 ee                	jne    80100280 <bread+0xa0>
80100292:	f6 03 04             	testb  $0x4,(%ebx)
80100295:	75 e9                	jne    80100280 <bread+0xa0>
80100297:	83 ec 0c             	sub    $0xc,%esp
8010029a:	89 7b 04             	mov    %edi,0x4(%ebx)
8010029d:	89 73 08             	mov    %esi,0x8(%ebx)
801002a0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801002a6:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
801002ad:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
801002b4:	68 c0 25 12 80       	push   $0x801225c0
801002b9:	e8 92 60 00 00       	call   80106350 <release>
801002be:	8d 43 0c             	lea    0xc(%ebx),%eax
801002c1:	89 04 24             	mov    %eax,(%esp)
801002c4:	e8 97 5d 00 00       	call   80106060 <acquiresleep>
801002c9:	58                   	pop    %eax
801002ca:	ff 75 e4             	pushl  -0x1c(%ebp)
801002cd:	e8 be e0 00 00       	call   8010e390 <cgroup_mem_stat_pgmajfault_incr>
801002d2:	83 c4 10             	add    $0x10,%esp
801002d5:	f6 03 02             	testb  $0x2,(%ebx)
801002d8:	75 88                	jne    80100262 <bread+0x82>
801002da:	83 ec 0c             	sub    $0xc,%esp
801002dd:	53                   	push   %ebx
801002de:	e8 bd fe ff ff       	call   801001a0 <brw>
801002e3:	83 c4 10             	add    $0x10,%esp
801002e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002e9:	89 d8                	mov    %ebx,%eax
801002eb:	5b                   	pop    %ebx
801002ec:	5e                   	pop    %esi
801002ed:	5f                   	pop    %edi
801002ee:	5d                   	pop    %ebp
801002ef:	c3                   	ret    
801002f0:	83 ec 0c             	sub    $0xc,%esp
801002f3:	68 6e e6 10 80       	push   $0x8010e66e
801002f8:	e8 d3 00 00 00       	call   801003d0 <panic>
801002fd:	8d 76 00             	lea    0x0(%esi),%esi

80100300 <bwrite>:
80100300:	55                   	push   %ebp
80100301:	89 e5                	mov    %esp,%ebp
80100303:	53                   	push   %ebx
80100304:	83 ec 10             	sub    $0x10,%esp
80100307:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010030a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010030d:	50                   	push   %eax
8010030e:	e8 ed 5d 00 00       	call   80106100 <holdingsleep>
80100313:	83 c4 10             	add    $0x10,%esp
80100316:	85 c0                	test   %eax,%eax
80100318:	74 0f                	je     80100329 <bwrite+0x29>
8010031a:	83 0b 04             	orl    $0x4,(%ebx)
8010031d:	89 5d 08             	mov    %ebx,0x8(%ebp)
80100320:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100323:	c9                   	leave  
80100324:	e9 77 fe ff ff       	jmp    801001a0 <brw>
80100329:	83 ec 0c             	sub    $0xc,%esp
8010032c:	68 7f e6 10 80       	push   $0x8010e67f
80100331:	e8 9a 00 00 00       	call   801003d0 <panic>
80100336:	8d 76 00             	lea    0x0(%esi),%esi
80100339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100340 <brelse>:
80100340:	55                   	push   %ebp
80100341:	89 e5                	mov    %esp,%ebp
80100343:	56                   	push   %esi
80100344:	53                   	push   %ebx
80100345:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100348:	83 ec 0c             	sub    $0xc,%esp
8010034b:	8d 73 0c             	lea    0xc(%ebx),%esi
8010034e:	56                   	push   %esi
8010034f:	e8 ac 5d 00 00       	call   80106100 <holdingsleep>
80100354:	83 c4 10             	add    $0x10,%esp
80100357:	85 c0                	test   %eax,%eax
80100359:	74 66                	je     801003c1 <brelse+0x81>
8010035b:	83 ec 0c             	sub    $0xc,%esp
8010035e:	56                   	push   %esi
8010035f:	e8 5c 5d 00 00       	call   801060c0 <releasesleep>
80100364:	c7 04 24 c0 25 12 80 	movl   $0x801225c0,(%esp)
8010036b:	e8 c0 5e 00 00       	call   80106230 <acquire>
80100370:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100373:	83 c4 10             	add    $0x10,%esp
80100376:	83 e8 01             	sub    $0x1,%eax
80100379:	85 c0                	test   %eax,%eax
8010037b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010037e:	75 2f                	jne    801003af <brelse+0x6f>
80100380:	8b 43 54             	mov    0x54(%ebx),%eax
80100383:	8b 53 50             	mov    0x50(%ebx),%edx
80100386:	89 50 50             	mov    %edx,0x50(%eax)
80100389:	8b 43 50             	mov    0x50(%ebx),%eax
8010038c:	8b 53 54             	mov    0x54(%ebx),%edx
8010038f:	89 50 54             	mov    %edx,0x54(%eax)
80100392:	a1 88 a9 12 80       	mov    0x8012a988,%eax
80100397:	c7 43 50 34 a9 12 80 	movl   $0x8012a934,0x50(%ebx)
8010039e:	89 43 54             	mov    %eax,0x54(%ebx)
801003a1:	a1 88 a9 12 80       	mov    0x8012a988,%eax
801003a6:	89 58 50             	mov    %ebx,0x50(%eax)
801003a9:	89 1d 88 a9 12 80    	mov    %ebx,0x8012a988
801003af:	c7 45 08 c0 25 12 80 	movl   $0x801225c0,0x8(%ebp)
801003b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801003b9:	5b                   	pop    %ebx
801003ba:	5e                   	pop    %esi
801003bb:	5d                   	pop    %ebp
801003bc:	e9 8f 5f 00 00       	jmp    80106350 <release>
801003c1:	83 ec 0c             	sub    $0xc,%esp
801003c4:	68 86 e6 10 80       	push   $0x8010e686
801003c9:	e8 02 00 00 00       	call   801003d0 <panic>
801003ce:	66 90                	xchg   %ax,%ax

801003d0 <panic>:
801003d0:	55                   	push   %ebp
801003d1:	89 e5                	mov    %esp,%ebp
801003d3:	56                   	push   %esi
801003d4:	53                   	push   %ebx
801003d5:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
801003d8:	fa                   	cli    
801003d9:	c7 05 54 05 12 80 00 	movl   $0x0,0x80120554
801003e0:	00 00 00 
801003e3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003e6:	8d 75 f8             	lea    -0x8(%ebp),%esi
801003e9:	e8 82 2f 00 00       	call   80103370 <lapicid>
801003ee:	83 ec 08             	sub    $0x8,%esp
801003f1:	50                   	push   %eax
801003f2:	68 8d e6 10 80       	push   $0x8010e68d
801003f7:	e8 64 02 00 00       	call   80100660 <cprintf>
801003fc:	58                   	pop    %eax
801003fd:	ff 75 08             	pushl  0x8(%ebp)
80100400:	e8 5b 02 00 00       	call   80100660 <cprintf>
80100405:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010040c:	e8 4f 02 00 00       	call   80100660 <cprintf>
80100411:	5a                   	pop    %edx
80100412:	8d 45 08             	lea    0x8(%ebp),%eax
80100415:	59                   	pop    %ecx
80100416:	53                   	push   %ebx
80100417:	50                   	push   %eax
80100418:	e8 33 5d 00 00       	call   80106150 <getcallerpcs>
8010041d:	83 c4 10             	add    $0x10,%esp
80100420:	83 ec 08             	sub    $0x8,%esp
80100423:	ff 33                	pushl  (%ebx)
80100425:	83 c3 04             	add    $0x4,%ebx
80100428:	68 a1 e6 10 80       	push   $0x8010e6a1
8010042d:	e8 2e 02 00 00       	call   80100660 <cprintf>
80100432:	83 c4 10             	add    $0x10,%esp
80100435:	39 f3                	cmp    %esi,%ebx
80100437:	75 e7                	jne    80100420 <panic+0x50>
80100439:	c7 05 58 05 12 80 01 	movl   $0x1,0x80120558
80100440:	00 00 00 
80100443:	eb fe                	jmp    80100443 <panic+0x73>
80100445:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100450 <consputc>:
80100450:	8b 15 58 05 12 80    	mov    0x80120558,%edx
80100456:	85 d2                	test   %edx,%edx
80100458:	74 06                	je     80100460 <consputc+0x10>
8010045a:	fa                   	cli    
8010045b:	eb fe                	jmp    8010045b <consputc+0xb>
8010045d:	8d 76 00             	lea    0x0(%esi),%esi
80100460:	55                   	push   %ebp
80100461:	89 e5                	mov    %esp,%ebp
80100463:	57                   	push   %edi
80100464:	56                   	push   %esi
80100465:	53                   	push   %ebx
80100466:	89 c3                	mov    %eax,%ebx
80100468:	83 ec 0c             	sub    $0xc,%esp
8010046b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100470:	0f 84 b8 00 00 00    	je     8010052e <consputc+0xde>
80100476:	83 ec 0c             	sub    $0xc,%esp
80100479:	50                   	push   %eax
8010047a:	e8 41 80 00 00       	call   801084c0 <uartputc>
8010047f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100482:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100487:	b8 0e 00 00 00       	mov    $0xe,%eax
8010048c:	89 fa                	mov    %edi,%edx
8010048e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010048f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100494:	89 f2                	mov    %esi,%edx
80100496:	ec                   	in     (%dx),%al
80100497:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010049a:	89 fa                	mov    %edi,%edx
8010049c:	c1 e0 08             	shl    $0x8,%eax
8010049f:	89 c1                	mov    %eax,%ecx
801004a1:	b8 0f 00 00 00       	mov    $0xf,%eax
801004a6:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801004a7:	89 f2                	mov    %esi,%edx
801004a9:	ec                   	in     (%dx),%al
801004aa:	0f b6 c0             	movzbl %al,%eax
801004ad:	09 c8                	or     %ecx,%eax
801004af:	83 fb 0a             	cmp    $0xa,%ebx
801004b2:	0f 84 0b 01 00 00    	je     801005c3 <consputc+0x173>
801004b8:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
801004be:	0f 84 e6 00 00 00    	je     801005aa <consputc+0x15a>
801004c4:	0f b6 d3             	movzbl %bl,%edx
801004c7:	8d 78 01             	lea    0x1(%eax),%edi
801004ca:	80 ce 07             	or     $0x7,%dh
801004cd:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
801004d4:	80 
801004d5:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
801004db:	0f 8f bc 00 00 00    	jg     8010059d <consputc+0x14d>
801004e1:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
801004e7:	7f 6f                	jg     80100558 <consputc+0x108>
801004e9:	89 f8                	mov    %edi,%eax
801004eb:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
801004f2:	89 fb                	mov    %edi,%ebx
801004f4:	c1 e8 08             	shr    $0x8,%eax
801004f7:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801004f9:	bf d4 03 00 00       	mov    $0x3d4,%edi
801004fe:	b8 0e 00 00 00       	mov    $0xe,%eax
80100503:	89 fa                	mov    %edi,%edx
80100505:	ee                   	out    %al,(%dx)
80100506:	ba d5 03 00 00       	mov    $0x3d5,%edx
8010050b:	89 f0                	mov    %esi,%eax
8010050d:	ee                   	out    %al,(%dx)
8010050e:	b8 0f 00 00 00       	mov    $0xf,%eax
80100513:	89 fa                	mov    %edi,%edx
80100515:	ee                   	out    %al,(%dx)
80100516:	ba d5 03 00 00       	mov    $0x3d5,%edx
8010051b:	89 d8                	mov    %ebx,%eax
8010051d:	ee                   	out    %al,(%dx)
8010051e:	b8 20 07 00 00       	mov    $0x720,%eax
80100523:	66 89 01             	mov    %ax,(%ecx)
80100526:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100529:	5b                   	pop    %ebx
8010052a:	5e                   	pop    %esi
8010052b:	5f                   	pop    %edi
8010052c:	5d                   	pop    %ebp
8010052d:	c3                   	ret    
8010052e:	83 ec 0c             	sub    $0xc,%esp
80100531:	6a 08                	push   $0x8
80100533:	e8 88 7f 00 00       	call   801084c0 <uartputc>
80100538:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
8010053f:	e8 7c 7f 00 00       	call   801084c0 <uartputc>
80100544:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010054b:	e8 70 7f 00 00       	call   801084c0 <uartputc>
80100550:	83 c4 10             	add    $0x10,%esp
80100553:	e9 2a ff ff ff       	jmp    80100482 <consputc+0x32>
80100558:	83 ec 04             	sub    $0x4,%esp
8010055b:	8d 5f b0             	lea    -0x50(%edi),%ebx
8010055e:	68 60 0e 00 00       	push   $0xe60
80100563:	68 a0 80 0b 80       	push   $0x800b80a0
80100568:	68 00 80 0b 80       	push   $0x800b8000
8010056d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100574:	e8 d7 5e 00 00       	call   80106450 <memmove>
80100579:	b8 80 07 00 00       	mov    $0x780,%eax
8010057e:	83 c4 0c             	add    $0xc,%esp
80100581:	29 d8                	sub    %ebx,%eax
80100583:	01 c0                	add    %eax,%eax
80100585:	50                   	push   %eax
80100586:	6a 00                	push   $0x0
80100588:	56                   	push   %esi
80100589:	e8 12 5e 00 00       	call   801063a0 <memset>
8010058e:	89 f1                	mov    %esi,%ecx
80100590:	83 c4 10             	add    $0x10,%esp
80100593:	be 07 00 00 00       	mov    $0x7,%esi
80100598:	e9 5c ff ff ff       	jmp    801004f9 <consputc+0xa9>
8010059d:	83 ec 0c             	sub    $0xc,%esp
801005a0:	68 a5 e6 10 80       	push   $0x8010e6a5
801005a5:	e8 26 fe ff ff       	call   801003d0 <panic>
801005aa:	85 c0                	test   %eax,%eax
801005ac:	8d 78 ff             	lea    -0x1(%eax),%edi
801005af:	0f 85 20 ff ff ff    	jne    801004d5 <consputc+0x85>
801005b5:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
801005ba:	31 db                	xor    %ebx,%ebx
801005bc:	31 f6                	xor    %esi,%esi
801005be:	e9 36 ff ff ff       	jmp    801004f9 <consputc+0xa9>
801005c3:	ba 67 66 66 66       	mov    $0x66666667,%edx
801005c8:	f7 ea                	imul   %edx
801005ca:	89 d0                	mov    %edx,%eax
801005cc:	c1 e8 05             	shr    $0x5,%eax
801005cf:	8d 04 80             	lea    (%eax,%eax,4),%eax
801005d2:	c1 e0 04             	shl    $0x4,%eax
801005d5:	8d 78 50             	lea    0x50(%eax),%edi
801005d8:	e9 f8 fe ff ff       	jmp    801004d5 <consputc+0x85>
801005dd:	8d 76 00             	lea    0x0(%esi),%esi

801005e0 <printint>:
801005e0:	55                   	push   %ebp
801005e1:	89 e5                	mov    %esp,%ebp
801005e3:	57                   	push   %edi
801005e4:	56                   	push   %esi
801005e5:	53                   	push   %ebx
801005e6:	89 d6                	mov    %edx,%esi
801005e8:	83 ec 2c             	sub    $0x2c,%esp
801005eb:	85 c9                	test   %ecx,%ecx
801005ed:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
801005f0:	74 0c                	je     801005fe <printint+0x1e>
801005f2:	89 c7                	mov    %eax,%edi
801005f4:	c1 ef 1f             	shr    $0x1f,%edi
801005f7:	85 c0                	test   %eax,%eax
801005f9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
801005fc:	78 51                	js     8010064f <printint+0x6f>
801005fe:	31 ff                	xor    %edi,%edi
80100600:	8d 5d d7             	lea    -0x29(%ebp),%ebx
80100603:	eb 05                	jmp    8010060a <printint+0x2a>
80100605:	8d 76 00             	lea    0x0(%esi),%esi
80100608:	89 cf                	mov    %ecx,%edi
8010060a:	31 d2                	xor    %edx,%edx
8010060c:	8d 4f 01             	lea    0x1(%edi),%ecx
8010060f:	f7 f6                	div    %esi
80100611:	0f b6 92 fc e6 10 80 	movzbl -0x7fef1904(%edx),%edx
80100618:	85 c0                	test   %eax,%eax
8010061a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
8010061d:	75 e9                	jne    80100608 <printint+0x28>
8010061f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80100622:	85 c0                	test   %eax,%eax
80100624:	74 08                	je     8010062e <printint+0x4e>
80100626:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
8010062b:	8d 4f 02             	lea    0x2(%edi),%ecx
8010062e:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
80100632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100638:	0f be 06             	movsbl (%esi),%eax
8010063b:	83 ee 01             	sub    $0x1,%esi
8010063e:	e8 0d fe ff ff       	call   80100450 <consputc>
80100643:	39 de                	cmp    %ebx,%esi
80100645:	75 f1                	jne    80100638 <printint+0x58>
80100647:	83 c4 2c             	add    $0x2c,%esp
8010064a:	5b                   	pop    %ebx
8010064b:	5e                   	pop    %esi
8010064c:	5f                   	pop    %edi
8010064d:	5d                   	pop    %ebp
8010064e:	c3                   	ret    
8010064f:	f7 d8                	neg    %eax
80100651:	eb ab                	jmp    801005fe <printint+0x1e>
80100653:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 05 12 80       	mov    0x80120554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 05 ff ff ff       	call   801005e0 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 5d fd ff ff       	call   80100450 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 05 12 80       	push   $0x80120520
8010070d:	e8 3e 5c 00 00       	call   80106350 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 a2 fe ff ff       	call   801005e0 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 fb fc ff ff       	call   80100450 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 f1 fc ff ff       	call   80100450 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 de fc ff ff       	call   80100450 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 b8 e6 10 80       	mov    $0x8010e6b8,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 a8 fc ff ff       	call   80100450 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 05 12 80       	push   $0x80120520
801007c8:	e8 63 5a 00 00       	call   80106230 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 bf e6 10 80       	push   $0x8010e6bf
801007dd:	e8 ee fb ff ff       	call   801003d0 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleclear>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	83 ec 0c             	sub    $0xc,%esp
801007f6:	68 00 0f 00 00       	push   $0xf00
801007fb:	6a 00                	push   $0x0
801007fd:	68 00 80 0b 80       	push   $0x800b8000
80100802:	e8 99 5b 00 00       	call   801063a0 <memset>
80100807:	ba d4 03 00 00       	mov    $0x3d4,%edx
8010080c:	b8 0e 00 00 00       	mov    $0xe,%eax
80100811:	ee                   	out    %al,(%dx)
80100812:	ba d5 03 00 00       	mov    $0x3d5,%edx
80100817:	31 c0                	xor    %eax,%eax
80100819:	ee                   	out    %al,(%dx)
8010081a:	ba d4 03 00 00       	mov    $0x3d4,%edx
8010081f:	b8 0f 00 00 00       	mov    $0xf,%eax
80100824:	ee                   	out    %al,(%dx)
80100825:	ba d5 03 00 00       	mov    $0x3d5,%edx
8010082a:	31 c0                	xor    %eax,%eax
8010082c:	ee                   	out    %al,(%dx)
8010082d:	b8 20 07 00 00       	mov    $0x720,%eax
80100832:	83 c4 10             	add    $0x10,%esp
80100835:	66 a3 00 80 0b 80    	mov    %ax,0x800b8000
8010083b:	c9                   	leave  
8010083c:	c3                   	ret    
8010083d:	8d 76 00             	lea    0x0(%esi),%esi

80100840 <consoleintr>:
80100840:	55                   	push   %ebp
80100841:	89 e5                	mov    %esp,%ebp
80100843:	57                   	push   %edi
80100844:	56                   	push   %esi
80100845:	53                   	push   %ebx
80100846:	31 f6                	xor    %esi,%esi
80100848:	83 ec 18             	sub    $0x18,%esp
8010084b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010084e:	68 20 05 12 80       	push   $0x80120520
80100853:	e8 d8 59 00 00       	call   80106230 <acquire>
80100858:	83 c4 10             	add    $0x10,%esp
8010085b:	90                   	nop
8010085c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100860:	ff d3                	call   *%ebx
80100862:	85 c0                	test   %eax,%eax
80100864:	89 c7                	mov    %eax,%edi
80100866:	78 48                	js     801008b0 <consoleintr+0x70>
80100868:	83 ff 10             	cmp    $0x10,%edi
8010086b:	0f 84 3f 01 00 00    	je     801009b0 <consoleintr+0x170>
80100871:	7e 5d                	jle    801008d0 <consoleintr+0x90>
80100873:	83 ff 15             	cmp    $0x15,%edi
80100876:	0f 84 dc 00 00 00    	je     80100958 <consoleintr+0x118>
8010087c:	83 ff 7f             	cmp    $0x7f,%edi
8010087f:	75 54                	jne    801008d5 <consoleintr+0x95>
80100881:	a1 28 ae 12 80       	mov    0x8012ae28,%eax
80100886:	3b 05 24 ae 12 80    	cmp    0x8012ae24,%eax
8010088c:	74 d2                	je     80100860 <consoleintr+0x20>
8010088e:	83 e8 01             	sub    $0x1,%eax
80100891:	a3 28 ae 12 80       	mov    %eax,0x8012ae28
80100896:	b8 00 01 00 00       	mov    $0x100,%eax
8010089b:	e8 b0 fb ff ff       	call   80100450 <consputc>
801008a0:	ff d3                	call   *%ebx
801008a2:	85 c0                	test   %eax,%eax
801008a4:	89 c7                	mov    %eax,%edi
801008a6:	79 c0                	jns    80100868 <consoleintr+0x28>
801008a8:	90                   	nop
801008a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801008b0:	83 ec 0c             	sub    $0xc,%esp
801008b3:	68 20 05 12 80       	push   $0x80120520
801008b8:	e8 93 5a 00 00       	call   80106350 <release>
801008bd:	83 c4 10             	add    $0x10,%esp
801008c0:	85 f6                	test   %esi,%esi
801008c2:	0f 85 f8 00 00 00    	jne    801009c0 <consoleintr+0x180>
801008c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801008cb:	5b                   	pop    %ebx
801008cc:	5e                   	pop    %esi
801008cd:	5f                   	pop    %edi
801008ce:	5d                   	pop    %ebp
801008cf:	c3                   	ret    
801008d0:	83 ff 08             	cmp    $0x8,%edi
801008d3:	74 ac                	je     80100881 <consoleintr+0x41>
801008d5:	85 ff                	test   %edi,%edi
801008d7:	74 87                	je     80100860 <consoleintr+0x20>
801008d9:	a1 28 ae 12 80       	mov    0x8012ae28,%eax
801008de:	89 c2                	mov    %eax,%edx
801008e0:	2b 15 20 ae 12 80    	sub    0x8012ae20,%edx
801008e6:	83 fa 7f             	cmp    $0x7f,%edx
801008e9:	0f 87 71 ff ff ff    	ja     80100860 <consoleintr+0x20>
801008ef:	8d 50 01             	lea    0x1(%eax),%edx
801008f2:	83 e0 7f             	and    $0x7f,%eax
801008f5:	83 ff 0d             	cmp    $0xd,%edi
801008f8:	89 15 28 ae 12 80    	mov    %edx,0x8012ae28
801008fe:	0f 84 c8 00 00 00    	je     801009cc <consoleintr+0x18c>
80100904:	89 f9                	mov    %edi,%ecx
80100906:	88 88 a0 ad 12 80    	mov    %cl,-0x7fed5260(%eax)
8010090c:	89 f8                	mov    %edi,%eax
8010090e:	e8 3d fb ff ff       	call   80100450 <consputc>
80100913:	83 ff 0a             	cmp    $0xa,%edi
80100916:	0f 84 c1 00 00 00    	je     801009dd <consoleintr+0x19d>
8010091c:	83 ff 04             	cmp    $0x4,%edi
8010091f:	0f 84 b8 00 00 00    	je     801009dd <consoleintr+0x19d>
80100925:	a1 20 ae 12 80       	mov    0x8012ae20,%eax
8010092a:	83 e8 80             	sub    $0xffffff80,%eax
8010092d:	39 05 28 ae 12 80    	cmp    %eax,0x8012ae28
80100933:	0f 85 27 ff ff ff    	jne    80100860 <consoleintr+0x20>
80100939:	83 ec 0c             	sub    $0xc,%esp
8010093c:	a3 24 ae 12 80       	mov    %eax,0x8012ae24
80100941:	68 20 ae 12 80       	push   $0x8012ae20
80100946:	e8 63 54 00 00       	call   80105dae <wakeup>
8010094b:	83 c4 10             	add    $0x10,%esp
8010094e:	e9 0d ff ff ff       	jmp    80100860 <consoleintr+0x20>
80100953:	90                   	nop
80100954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100958:	a1 28 ae 12 80       	mov    0x8012ae28,%eax
8010095d:	39 05 24 ae 12 80    	cmp    %eax,0x8012ae24
80100963:	75 2b                	jne    80100990 <consoleintr+0x150>
80100965:	e9 f6 fe ff ff       	jmp    80100860 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	a3 28 ae 12 80       	mov    %eax,0x8012ae28
80100975:	b8 00 01 00 00       	mov    $0x100,%eax
8010097a:	e8 d1 fa ff ff       	call   80100450 <consputc>
8010097f:	a1 28 ae 12 80       	mov    0x8012ae28,%eax
80100984:	3b 05 24 ae 12 80    	cmp    0x8012ae24,%eax
8010098a:	0f 84 d0 fe ff ff    	je     80100860 <consoleintr+0x20>
80100990:	83 e8 01             	sub    $0x1,%eax
80100993:	89 c2                	mov    %eax,%edx
80100995:	83 e2 7f             	and    $0x7f,%edx
80100998:	80 ba a0 ad 12 80 0a 	cmpb   $0xa,-0x7fed5260(%edx)
8010099f:	75 cf                	jne    80100970 <consoleintr+0x130>
801009a1:	e9 ba fe ff ff       	jmp    80100860 <consoleintr+0x20>
801009a6:	8d 76 00             	lea    0x0(%esi),%esi
801009a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801009b0:	be 01 00 00 00       	mov    $0x1,%esi
801009b5:	e9 a6 fe ff ff       	jmp    80100860 <consoleintr+0x20>
801009ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801009c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009c3:	5b                   	pop    %ebx
801009c4:	5e                   	pop    %esi
801009c5:	5f                   	pop    %edi
801009c6:	5d                   	pop    %ebp
801009c7:	e9 97 54 00 00       	jmp    80105e63 <procdump>
801009cc:	c6 80 a0 ad 12 80 0a 	movb   $0xa,-0x7fed5260(%eax)
801009d3:	b8 0a 00 00 00       	mov    $0xa,%eax
801009d8:	e8 73 fa ff ff       	call   80100450 <consputc>
801009dd:	a1 28 ae 12 80       	mov    0x8012ae28,%eax
801009e2:	e9 52 ff ff ff       	jmp    80100939 <consoleintr+0xf9>
801009e7:	89 f6                	mov    %esi,%esi
801009e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009f0 <consoleread>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	83 ec 28             	sub    $0x28,%esp
801009f9:	8b 7d 08             	mov    0x8(%ebp),%edi
801009fc:	8b 75 0c             	mov    0xc(%ebp),%esi
801009ff:	57                   	push   %edi
80100a00:	e8 ab 15 00 00       	call   80101fb0 <iunlock>
80100a05:	c7 04 24 20 05 12 80 	movl   $0x80120520,(%esp)
80100a0c:	e8 1f 58 00 00       	call   80106230 <acquire>
80100a11:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100a14:	83 c4 10             	add    $0x10,%esp
80100a17:	31 c0                	xor    %eax,%eax
80100a19:	85 db                	test   %ebx,%ebx
80100a1b:	0f 8e 9a 00 00 00    	jle    80100abb <consoleread+0xcb>
80100a21:	a1 20 ae 12 80       	mov    0x8012ae20,%eax
80100a26:	3b 05 24 ae 12 80    	cmp    0x8012ae24,%eax
80100a2c:	74 24                	je     80100a52 <consoleread+0x62>
80100a2e:	eb 58                	jmp    80100a88 <consoleread+0x98>
80100a30:	83 ec 08             	sub    $0x8,%esp
80100a33:	68 20 05 12 80       	push   $0x80120520
80100a38:	68 20 ae 12 80       	push   $0x8012ae20
80100a3d:	e8 9f 51 00 00       	call   80105be1 <sleep>
80100a42:	a1 20 ae 12 80       	mov    0x8012ae20,%eax
80100a47:	83 c4 10             	add    $0x10,%esp
80100a4a:	3b 05 24 ae 12 80    	cmp    0x8012ae24,%eax
80100a50:	75 36                	jne    80100a88 <consoleread+0x98>
80100a52:	e8 cc 47 00 00       	call   80105223 <myproc>
80100a57:	8b 40 44             	mov    0x44(%eax),%eax
80100a5a:	85 c0                	test   %eax,%eax
80100a5c:	74 d2                	je     80100a30 <consoleread+0x40>
80100a5e:	83 ec 0c             	sub    $0xc,%esp
80100a61:	68 20 05 12 80       	push   $0x80120520
80100a66:	e8 e5 58 00 00       	call   80106350 <release>
80100a6b:	89 3c 24             	mov    %edi,(%esp)
80100a6e:	e8 5d 14 00 00       	call   80101ed0 <ilock>
80100a73:	83 c4 10             	add    $0x10,%esp
80100a76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a7b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a7e:	5b                   	pop    %ebx
80100a7f:	5e                   	pop    %esi
80100a80:	5f                   	pop    %edi
80100a81:	5d                   	pop    %ebp
80100a82:	c3                   	ret    
80100a83:	90                   	nop
80100a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a88:	8d 50 01             	lea    0x1(%eax),%edx
80100a8b:	89 15 20 ae 12 80    	mov    %edx,0x8012ae20
80100a91:	89 c2                	mov    %eax,%edx
80100a93:	83 e2 7f             	and    $0x7f,%edx
80100a96:	0f be 92 a0 ad 12 80 	movsbl -0x7fed5260(%edx),%edx
80100a9d:	83 fa 04             	cmp    $0x4,%edx
80100aa0:	74 39                	je     80100adb <consoleread+0xeb>
80100aa2:	83 c6 01             	add    $0x1,%esi
80100aa5:	83 eb 01             	sub    $0x1,%ebx
80100aa8:	83 fa 0a             	cmp    $0xa,%edx
80100aab:	88 56 ff             	mov    %dl,-0x1(%esi)
80100aae:	74 35                	je     80100ae5 <consoleread+0xf5>
80100ab0:	85 db                	test   %ebx,%ebx
80100ab2:	0f 85 69 ff ff ff    	jne    80100a21 <consoleread+0x31>
80100ab8:	8b 45 10             	mov    0x10(%ebp),%eax
80100abb:	83 ec 0c             	sub    $0xc,%esp
80100abe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100ac1:	68 20 05 12 80       	push   $0x80120520
80100ac6:	e8 85 58 00 00       	call   80106350 <release>
80100acb:	89 3c 24             	mov    %edi,(%esp)
80100ace:	e8 fd 13 00 00       	call   80101ed0 <ilock>
80100ad3:	83 c4 10             	add    $0x10,%esp
80100ad6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ad9:	eb a0                	jmp    80100a7b <consoleread+0x8b>
80100adb:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80100ade:	76 05                	jbe    80100ae5 <consoleread+0xf5>
80100ae0:	a3 20 ae 12 80       	mov    %eax,0x8012ae20
80100ae5:	8b 45 10             	mov    0x10(%ebp),%eax
80100ae8:	29 d8                	sub    %ebx,%eax
80100aea:	eb cf                	jmp    80100abb <consoleread+0xcb>
80100aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100af0 <ttyread>:
80100af0:	55                   	push   %ebp
80100af1:	89 e5                	mov    %esp,%ebp
80100af3:	53                   	push   %ebx
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100afa:	0f bf 43 54          	movswl 0x54(%ebx),%eax
80100afe:	6b c0 38             	imul   $0x38,%eax,%eax
80100b01:	8b 80 40 ae 12 80    	mov    -0x7fed51c0(%eax),%eax
80100b07:	f6 c4 10             	test   $0x10,%ah
80100b0a:	75 7c                	jne    80100b88 <ttyread+0x98>
80100b0c:	a8 10                	test   $0x10,%al
80100b0e:	75 10                	jne    80100b20 <ttyread+0x30>
80100b10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100b18:	c9                   	leave  
80100b19:	c3                   	ret    
80100b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b20:	83 ec 0c             	sub    $0xc,%esp
80100b23:	53                   	push   %ebx
80100b24:	e8 87 14 00 00       	call   80101fb0 <iunlock>
80100b29:	0f bf 43 54          	movswl 0x54(%ebx),%eax
80100b2d:	6b c0 38             	imul   $0x38,%eax,%eax
80100b30:	05 44 ae 12 80       	add    $0x8012ae44,%eax
80100b35:	89 04 24             	mov    %eax,(%esp)
80100b38:	e8 f3 56 00 00       	call   80106230 <acquire>
80100b3d:	0f bf 43 54          	movswl 0x54(%ebx),%eax
80100b41:	5a                   	pop    %edx
80100b42:	59                   	pop    %ecx
80100b43:	6b c0 38             	imul   $0x38,%eax,%eax
80100b46:	8d 90 44 ae 12 80    	lea    -0x7fed51bc(%eax),%edx
80100b4c:	05 40 ae 12 80       	add    $0x8012ae40,%eax
80100b51:	52                   	push   %edx
80100b52:	50                   	push   %eax
80100b53:	e8 89 50 00 00       	call   80105be1 <sleep>
80100b58:	0f bf 43 54          	movswl 0x54(%ebx),%eax
80100b5c:	6b c0 38             	imul   $0x38,%eax,%eax
80100b5f:	05 44 ae 12 80       	add    $0x8012ae44,%eax
80100b64:	89 04 24             	mov    %eax,(%esp)
80100b67:	e8 e4 57 00 00       	call   80106350 <release>
80100b6c:	89 1c 24             	mov    %ebx,(%esp)
80100b6f:	e8 5c 13 00 00       	call   80101ed0 <ilock>
80100b74:	83 c4 10             	add    $0x10,%esp
80100b77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b7c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100b7f:	c9                   	leave  
80100b80:	c3                   	ret    
80100b81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100b88:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100b8b:	c9                   	leave  
80100b8c:	e9 5f fe ff ff       	jmp    801009f0 <consoleread>
80100b91:	eb 0d                	jmp    80100ba0 <consolewrite>
80100b93:	90                   	nop
80100b94:	90                   	nop
80100b95:	90                   	nop
80100b96:	90                   	nop
80100b97:	90                   	nop
80100b98:	90                   	nop
80100b99:	90                   	nop
80100b9a:	90                   	nop
80100b9b:	90                   	nop
80100b9c:	90                   	nop
80100b9d:	90                   	nop
80100b9e:	90                   	nop
80100b9f:	90                   	nop

80100ba0 <consolewrite>:
80100ba0:	55                   	push   %ebp
80100ba1:	89 e5                	mov    %esp,%ebp
80100ba3:	57                   	push   %edi
80100ba4:	56                   	push   %esi
80100ba5:	53                   	push   %ebx
80100ba6:	83 ec 18             	sub    $0x18,%esp
80100ba9:	ff 75 08             	pushl  0x8(%ebp)
80100bac:	8b 75 10             	mov    0x10(%ebp),%esi
80100baf:	e8 fc 13 00 00       	call   80101fb0 <iunlock>
80100bb4:	c7 04 24 20 05 12 80 	movl   $0x80120520,(%esp)
80100bbb:	e8 70 56 00 00       	call   80106230 <acquire>
80100bc0:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100bc3:	83 c4 10             	add    $0x10,%esp
80100bc6:	85 f6                	test   %esi,%esi
80100bc8:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
80100bcb:	7e 12                	jle    80100bdf <consolewrite+0x3f>
80100bcd:	8d 76 00             	lea    0x0(%esi),%esi
80100bd0:	0f b6 07             	movzbl (%edi),%eax
80100bd3:	83 c7 01             	add    $0x1,%edi
80100bd6:	e8 75 f8 ff ff       	call   80100450 <consputc>
80100bdb:	39 df                	cmp    %ebx,%edi
80100bdd:	75 f1                	jne    80100bd0 <consolewrite+0x30>
80100bdf:	83 ec 0c             	sub    $0xc,%esp
80100be2:	68 20 05 12 80       	push   $0x80120520
80100be7:	e8 64 57 00 00       	call   80106350 <release>
80100bec:	58                   	pop    %eax
80100bed:	ff 75 08             	pushl  0x8(%ebp)
80100bf0:	e8 db 12 00 00       	call   80101ed0 <ilock>
80100bf5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100bf8:	89 f0                	mov    %esi,%eax
80100bfa:	5b                   	pop    %ebx
80100bfb:	5e                   	pop    %esi
80100bfc:	5f                   	pop    %edi
80100bfd:	5d                   	pop    %ebp
80100bfe:	c3                   	ret    
80100bff:	90                   	nop

80100c00 <ttywrite>:
80100c00:	55                   	push   %ebp
80100c01:	89 e5                	mov    %esp,%ebp
80100c03:	53                   	push   %ebx
80100c04:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100c07:	8b 45 10             	mov    0x10(%ebp),%eax
80100c0a:	0f bf 51 54          	movswl 0x54(%ecx),%edx
80100c0e:	6b d2 38             	imul   $0x38,%edx,%edx
80100c11:	f6 82 41 ae 12 80 10 	testb  $0x10,-0x7fed51bf(%edx)
80100c18:	75 06                	jne    80100c20 <ttywrite+0x20>
80100c1a:	5b                   	pop    %ebx
80100c1b:	5d                   	pop    %ebp
80100c1c:	c3                   	ret    
80100c1d:	8d 76 00             	lea    0x0(%esi),%esi
80100c20:	5b                   	pop    %ebx
80100c21:	5d                   	pop    %ebp
80100c22:	e9 79 ff ff ff       	jmp    80100ba0 <consolewrite>
80100c27:	89 f6                	mov    %esi,%esi
80100c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100c30 <consoleinit>:
80100c30:	55                   	push   %ebp
80100c31:	89 e5                	mov    %esp,%ebp
80100c33:	83 ec 10             	sub    $0x10,%esp
80100c36:	68 cb e6 10 80       	push   $0x8010e6cb
80100c3b:	68 20 05 12 80       	push   $0x80120520
80100c40:	e8 eb 54 00 00       	call   80106130 <initlock>
80100c45:	58                   	pop    %eax
80100c46:	5a                   	pop    %edx
80100c47:	68 c8 e6 10 80       	push   $0x8010e6c8
80100c4c:	68 44 ae 12 80       	push   $0x8012ae44
80100c51:	c7 05 0c dd 12 80 00 	movl   $0x80100c00,0x8012dd0c
80100c58:	0c 10 80 
80100c5b:	c7 05 08 dd 12 80 f0 	movl   $0x80100af0,0x8012dd08
80100c62:	0a 10 80 
80100c65:	c7 05 40 ae 12 80 10 	movl   $0x1010,0x8012ae40
80100c6c:	10 00 00 
80100c6f:	e8 bc 54 00 00       	call   80106130 <initlock>
80100c74:	59                   	pop    %ecx
80100c75:	58                   	pop    %eax
80100c76:	6a 00                	push   $0x0
80100c78:	6a 01                	push   $0x1
80100c7a:	c7 05 54 05 12 80 01 	movl   $0x1,0x80120554
80100c81:	00 00 00 
80100c84:	e8 37 20 00 00       	call   80102cc0 <ioapicenable>
80100c89:	83 c4 10             	add    $0x10,%esp
80100c8c:	c9                   	leave  
80100c8d:	c3                   	ret    
80100c8e:	66 90                	xchg   %ax,%ax

80100c90 <ttyinit>:
80100c90:	55                   	push   %ebp
80100c91:	c7 05 78 ae 12 80 00 	movl   $0x0,0x8012ae78
80100c98:	00 00 00 
80100c9b:	c7 05 b0 ae 12 80 00 	movl   $0x0,0x8012aeb0
80100ca2:	00 00 00 
80100ca5:	c7 05 e8 ae 12 80 00 	movl   $0x0,0x8012aee8
80100cac:	00 00 00 
80100caf:	89 e5                	mov    %esp,%ebp
80100cb1:	5d                   	pop    %ebp
80100cb2:	c3                   	ret    
80100cb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100cc0 <tty_disconnect>:
80100cc0:	55                   	push   %ebp
80100cc1:	89 e5                	mov    %esp,%ebp
80100cc3:	83 ec 14             	sub    $0x14,%esp
80100cc6:	8b 45 08             	mov    0x8(%ebp),%eax
80100cc9:	0f bf 40 54          	movswl 0x54(%eax),%eax
80100ccd:	68 40 ae 12 80       	push   $0x8012ae40
80100cd2:	6b c0 38             	imul   $0x38,%eax,%eax
80100cd5:	81 a0 40 ae 12 80 ff 	andl   $0xffffefff,-0x7fed51c0(%eax)
80100cdc:	ef ff ff 
80100cdf:	81 0d 40 ae 12 80 00 	orl    $0x1000,0x8012ae40
80100ce6:	10 00 00 
80100ce9:	e8 c0 50 00 00       	call   80105dae <wakeup>
80100cee:	e8 fd fa ff ff       	call   801007f0 <consoleclear>
80100cf3:	83 c4 10             	add    $0x10,%esp
80100cf6:	c7 45 08 d3 e6 10 80 	movl   $0x8010e6d3,0x8(%ebp)
80100cfd:	c9                   	leave  
80100cfe:	e9 5d f9 ff ff       	jmp    80100660 <cprintf>
80100d03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100d10 <tty_connect>:
80100d10:	55                   	push   %ebp
80100d11:	ba 40 ae 12 80       	mov    $0x8012ae40,%edx
80100d16:	89 e5                	mov    %esp,%ebp
80100d18:	53                   	push   %ebx
80100d19:	83 ec 04             	sub    $0x4,%esp
80100d1c:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100d1f:	0f bf 43 54          	movswl 0x54(%ebx),%eax
80100d23:	6b c0 38             	imul   $0x38,%eax,%eax
80100d26:	81 88 40 ae 12 80 00 	orl    $0x1000,-0x7fed51c0(%eax)
80100d2d:	10 00 00 
80100d30:	31 c0                	xor    %eax,%eax
80100d32:	0f bf 4b 54          	movswl 0x54(%ebx),%ecx
80100d36:	39 c1                	cmp    %eax,%ecx
80100d38:	74 06                	je     80100d40 <tty_connect+0x30>
80100d3a:	81 22 ff ef ff ff    	andl   $0xffffefff,(%edx)
80100d40:	83 c0 01             	add    $0x1,%eax
80100d43:	83 c2 38             	add    $0x38,%edx
80100d46:	83 f8 04             	cmp    $0x4,%eax
80100d49:	75 e7                	jne    80100d32 <tty_connect+0x22>
80100d4b:	e8 a0 fa ff ff       	call   801007f0 <consoleclear>
80100d50:	0f bf 43 54          	movswl 0x54(%ebx),%eax
80100d54:	83 ec 08             	sub    $0x8,%esp
80100d57:	83 e8 01             	sub    $0x1,%eax
80100d5a:	50                   	push   %eax
80100d5b:	68 e6 e6 10 80       	push   $0x8010e6e6
80100d60:	e8 fb f8 ff ff       	call   80100660 <cprintf>
80100d65:	0f bf 43 54          	movswl 0x54(%ebx),%eax
80100d69:	83 c4 10             	add    $0x10,%esp
80100d6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d6f:	6b c0 38             	imul   $0x38,%eax,%eax
80100d72:	05 40 ae 12 80       	add    $0x8012ae40,%eax
80100d77:	89 45 08             	mov    %eax,0x8(%ebp)
80100d7a:	c9                   	leave  
80100d7b:	e9 2e 50 00 00       	jmp    80105dae <wakeup>

80100d80 <tty_attach>:
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	83 ec 10             	sub    $0x10,%esp
80100d86:	8b 55 08             	mov    0x8(%ebp),%edx
80100d89:	0f bf 42 54          	movswl 0x54(%edx),%eax
80100d8d:	68 f8 e6 10 80       	push   $0x8010e6f8
80100d92:	6b c0 38             	imul   $0x38,%eax,%eax
80100d95:	83 88 40 ae 12 80 10 	orl    $0x10,-0x7fed51c0(%eax)
80100d9c:	0f bf 42 54          	movswl 0x54(%edx),%eax
80100da0:	6b c0 38             	imul   $0x38,%eax,%eax
80100da3:	05 44 ae 12 80       	add    $0x8012ae44,%eax
80100da8:	50                   	push   %eax
80100da9:	e8 82 53 00 00       	call   80106130 <initlock>
80100dae:	83 c4 10             	add    $0x10,%esp
80100db1:	c9                   	leave  
80100db2:	c3                   	ret    
80100db3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dc0 <tty_detach>:
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	8b 45 08             	mov    0x8(%ebp),%eax
80100dc6:	5d                   	pop    %ebp
80100dc7:	0f bf 40 54          	movswl 0x54(%eax),%eax
80100dcb:	6b c0 38             	imul   $0x38,%eax,%eax
80100dce:	83 a0 40 ae 12 80 ef 	andl   $0xffffffef,-0x7fed51c0(%eax)
80100dd5:	c3                   	ret    
80100dd6:	8d 76 00             	lea    0x0(%esi),%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <tty_gets>:
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	8b 45 08             	mov    0x8(%ebp),%eax
80100de6:	8b 55 0c             	mov    0xc(%ebp),%edx
80100de9:	5d                   	pop    %ebp
80100dea:	0f bf 40 54          	movswl 0x54(%eax),%eax
80100dee:	6b c0 38             	imul   $0x38,%eax,%eax
80100df1:	85 90 40 ae 12 80    	test   %edx,-0x7fed51c0(%eax)
80100df7:	0f 95 c0             	setne  %al
80100dfa:	0f b6 c0             	movzbl %al,%eax
80100dfd:	c3                   	ret    
80100dfe:	66 90                	xchg   %ax,%ax

80100e00 <devinit>:
80100e00:	55                   	push   %ebp
80100e01:	89 e5                	mov    %esp,%ebp
80100e03:	83 ec 10             	sub    $0x10,%esp
80100e06:	68 0d e7 10 80       	push   $0x8010e70d
80100e0b:	68 20 af 12 80       	push   $0x8012af20
80100e10:	e8 1b 53 00 00       	call   80106130 <initlock>
80100e15:	83 c4 10             	add    $0x10,%esp
80100e18:	c9                   	leave  
80100e19:	c3                   	ret    
80100e1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100e20 <getorcreatedevice>:
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100e2b:	31 db                	xor    %ebx,%ebx
80100e2d:	83 ec 18             	sub    $0x18,%esp
80100e30:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e33:	68 20 af 12 80       	push   $0x8012af20
80100e38:	e8 f3 53 00 00       	call   80106230 <acquire>
80100e3d:	ba 70 af 12 80       	mov    $0x8012af70,%edx
80100e42:	83 c4 10             	add    $0x10,%esp
80100e45:	eb 19                	jmp    80100e60 <getorcreatedevice+0x40>
80100e47:	89 f6                	mov    %esi,%esi
80100e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100e50:	39 7a 04             	cmp    %edi,0x4(%edx)
80100e53:	74 73                	je     80100ec8 <getorcreatedevice+0xa8>
80100e55:	83 c3 01             	add    $0x1,%ebx
80100e58:	83 c2 24             	add    $0x24,%edx
80100e5b:	83 fb 0a             	cmp    $0xa,%ebx
80100e5e:	74 18                	je     80100e78 <getorcreatedevice+0x58>
80100e60:	8b 0a                	mov    (%edx),%ecx
80100e62:	85 c9                	test   %ecx,%ecx
80100e64:	75 ea                	jne    80100e50 <getorcreatedevice+0x30>
80100e66:	83 fe ff             	cmp    $0xffffffff,%esi
80100e69:	75 e5                	jne    80100e50 <getorcreatedevice+0x30>
80100e6b:	89 de                	mov    %ebx,%esi
80100e6d:	83 c3 01             	add    $0x1,%ebx
80100e70:	83 c2 24             	add    $0x24,%edx
80100e73:	83 fb 0a             	cmp    $0xa,%ebx
80100e76:	75 e8                	jne    80100e60 <getorcreatedevice+0x40>
80100e78:	83 fe ff             	cmp    $0xffffffff,%esi
80100e7b:	74 7a                	je     80100ef7 <getorcreatedevice+0xd7>
80100e7d:	8d 04 f6             	lea    (%esi,%esi,8),%eax
80100e80:	83 ec 0c             	sub    $0xc,%esp
80100e83:	81 ce 00 00 07 00    	or     $0x70000,%esi
80100e89:	8d 1c 85 20 af 12 80 	lea    -0x7fed50e0(,%eax,4),%ebx
80100e90:	c7 43 50 01 00 00 00 	movl   $0x1,0x50(%ebx)
80100e97:	57                   	push   %edi
80100e98:	e8 03 10 00 00       	call   80101ea0 <idup>
80100e9d:	89 43 54             	mov    %eax,0x54(%ebx)
80100ea0:	c7 04 24 20 af 12 80 	movl   $0x8012af20,(%esp)
80100ea7:	e8 a4 54 00 00       	call   80106350 <release>
80100eac:	89 34 24             	mov    %esi,(%esp)
80100eaf:	e8 dc 0d 00 00       	call   80101c90 <fsinit>
80100eb4:	83 c4 10             	add    $0x10,%esp
80100eb7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eba:	89 f0                	mov    %esi,%eax
80100ebc:	5b                   	pop    %ebx
80100ebd:	5e                   	pop    %esi
80100ebe:	5f                   	pop    %edi
80100ebf:	5d                   	pop    %ebp
80100ec0:	c3                   	ret    
80100ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100ec8:	83 ec 0c             	sub    $0xc,%esp
80100ecb:	8d 04 db             	lea    (%ebx,%ebx,8),%eax
80100ece:	83 c1 01             	add    $0x1,%ecx
80100ed1:	68 20 af 12 80       	push   $0x8012af20
80100ed6:	89 de                	mov    %ebx,%esi
80100ed8:	89 0c 85 70 af 12 80 	mov    %ecx,-0x7fed5090(,%eax,4)
80100edf:	81 ce 00 00 07 00    	or     $0x70000,%esi
80100ee5:	e8 66 54 00 00       	call   80106350 <release>
80100eea:	83 c4 10             	add    $0x10,%esp
80100eed:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef0:	89 f0                	mov    %esi,%eax
80100ef2:	5b                   	pop    %ebx
80100ef3:	5e                   	pop    %esi
80100ef4:	5f                   	pop    %edi
80100ef5:	5d                   	pop    %ebp
80100ef6:	c3                   	ret    
80100ef7:	83 ec 0c             	sub    $0xc,%esp
80100efa:	68 20 af 12 80       	push   $0x8012af20
80100eff:	e8 4c 54 00 00       	call   80106350 <release>
80100f04:	83 c4 10             	add    $0x10,%esp
80100f07:	eb ae                	jmp    80100eb7 <getorcreatedevice+0x97>
80100f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100f10 <deviceget>:
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	53                   	push   %ebx
80100f14:	83 ec 04             	sub    $0x4,%esp
80100f17:	8b 45 08             	mov    0x8(%ebp),%eax
80100f1a:	89 c2                	mov    %eax,%edx
80100f1c:	c1 ea 10             	shr    $0x10,%edx
80100f1f:	83 fa 07             	cmp    $0x7,%edx
80100f22:	74 0c                	je     80100f30 <deviceget+0x20>
80100f24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f27:	c9                   	leave  
80100f28:	c3                   	ret    
80100f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f30:	83 ec 0c             	sub    $0xc,%esp
80100f33:	0f b7 d8             	movzwl %ax,%ebx
80100f36:	68 20 af 12 80       	push   $0x8012af20
80100f3b:	e8 f0 52 00 00       	call   80106230 <acquire>
80100f40:	8d 04 db             	lea    (%ebx,%ebx,8),%eax
80100f43:	83 c4 10             	add    $0x10,%esp
80100f46:	c7 45 08 20 af 12 80 	movl   $0x8012af20,0x8(%ebp)
80100f4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f50:	83 04 85 70 af 12 80 	addl   $0x1,-0x7fed5090(,%eax,4)
80100f57:	01 
80100f58:	c9                   	leave  
80100f59:	e9 f2 53 00 00       	jmp    80106350 <release>
80100f5e:	66 90                	xchg   %ax,%ax

80100f60 <deviceput>:
80100f60:	55                   	push   %ebp
80100f61:	89 e5                	mov    %esp,%ebp
80100f63:	56                   	push   %esi
80100f64:	53                   	push   %ebx
80100f65:	8b 45 08             	mov    0x8(%ebp),%eax
80100f68:	89 c2                	mov    %eax,%edx
80100f6a:	c1 ea 10             	shr    $0x10,%edx
80100f6d:	83 fa 07             	cmp    $0x7,%edx
80100f70:	74 0e                	je     80100f80 <deviceput+0x20>
80100f72:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100f75:	5b                   	pop    %ebx
80100f76:	5e                   	pop    %esi
80100f77:	5d                   	pop    %ebp
80100f78:	c3                   	ret    
80100f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f80:	83 ec 0c             	sub    $0xc,%esp
80100f83:	0f b7 d8             	movzwl %ax,%ebx
80100f86:	68 20 af 12 80       	push   $0x8012af20
80100f8b:	e8 a0 52 00 00       	call   80106230 <acquire>
80100f90:	8d 04 db             	lea    (%ebx,%ebx,8),%eax
80100f93:	83 c4 10             	add    $0x10,%esp
80100f96:	8d 34 85 20 af 12 80 	lea    -0x7fed50e0(,%eax,4),%esi
80100f9d:	8b 46 50             	mov    0x50(%esi),%eax
80100fa0:	83 f8 01             	cmp    $0x1,%eax
80100fa3:	74 23                	je     80100fc8 <deviceput+0x68>
80100fa5:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
80100fa8:	83 e8 01             	sub    $0x1,%eax
80100fab:	c7 45 08 20 af 12 80 	movl   $0x8012af20,0x8(%ebp)
80100fb2:	89 04 95 70 af 12 80 	mov    %eax,-0x7fed5090(,%edx,4)
80100fb9:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100fbc:	5b                   	pop    %ebx
80100fbd:	5e                   	pop    %esi
80100fbe:	5d                   	pop    %ebp
80100fbf:	e9 8c 53 00 00       	jmp    80106350 <release>
80100fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100fc8:	83 ec 0c             	sub    $0xc,%esp
80100fcb:	68 20 af 12 80       	push   $0x8012af20
80100fd0:	e8 7b 53 00 00       	call   80106350 <release>
80100fd5:	58                   	pop    %eax
80100fd6:	ff 76 54             	pushl  0x54(%esi)
80100fd9:	e8 22 10 00 00       	call   80102000 <iput>
80100fde:	89 d8                	mov    %ebx,%eax
80100fe0:	0d 00 00 07 00       	or     $0x70000,%eax
80100fe5:	89 04 24             	mov    %eax,(%esp)
80100fe8:	e8 e3 f0 ff ff       	call   801000d0 <invalidateblocks>
80100fed:	c7 04 24 20 af 12 80 	movl   $0x8012af20,(%esp)
80100ff4:	e8 37 52 00 00       	call   80106230 <acquire>
80100ff9:	c7 46 54 00 00 00 00 	movl   $0x0,0x54(%esi)
80101000:	8b 46 50             	mov    0x50(%esi),%eax
80101003:	83 c4 10             	add    $0x10,%esp
80101006:	eb 9d                	jmp    80100fa5 <deviceput+0x45>
80101008:	90                   	nop
80101009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101010 <getinodefordevice>:
80101010:	55                   	push   %ebp
80101011:	31 c0                	xor    %eax,%eax
80101013:	89 e5                	mov    %esp,%ebp
80101015:	8b 55 08             	mov    0x8(%ebp),%edx
80101018:	89 d1                	mov    %edx,%ecx
8010101a:	c1 e9 10             	shr    $0x10,%ecx
8010101d:	83 f9 07             	cmp    $0x7,%ecx
80101020:	75 17                	jne    80101039 <getinodefordevice+0x29>
80101022:	0f b7 d2             	movzwl %dx,%edx
80101025:	8d 14 d2             	lea    (%edx,%edx,8),%edx
80101028:	8d 14 95 20 af 12 80 	lea    -0x7fed50e0(,%edx,4),%edx
8010102f:	8b 4a 50             	mov    0x50(%edx),%ecx
80101032:	85 c9                	test   %ecx,%ecx
80101034:	74 03                	je     80101039 <getinodefordevice+0x29>
80101036:	8b 42 54             	mov    0x54(%edx),%eax
80101039:	5d                   	pop    %ebp
8010103a:	c3                   	ret    
8010103b:	90                   	nop
8010103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101040 <printdevices>:
80101040:	55                   	push   %ebp
80101041:	89 e5                	mov    %esp,%ebp
80101043:	56                   	push   %esi
80101044:	53                   	push   %ebx
80101045:	be 70 af 12 80       	mov    $0x8012af70,%esi
8010104a:	31 db                	xor    %ebx,%ebx
8010104c:	83 ec 0c             	sub    $0xc,%esp
8010104f:	68 20 af 12 80       	push   $0x8012af20
80101054:	e8 d7 51 00 00       	call   80106230 <acquire>
80101059:	c7 04 24 16 e7 10 80 	movl   $0x8010e716,(%esp)
80101060:	e8 fb f5 ff ff       	call   80100660 <cprintf>
80101065:	83 c4 10             	add    $0x10,%esp
80101068:	eb 11                	jmp    8010107b <printdevices+0x3b>
8010106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101070:	83 c3 01             	add    $0x1,%ebx
80101073:	83 c6 24             	add    $0x24,%esi
80101076:	83 fb 0a             	cmp    $0xa,%ebx
80101079:	74 23                	je     8010109e <printdevices+0x5e>
8010107b:	8b 06                	mov    (%esi),%eax
8010107d:	85 c0                	test   %eax,%eax
8010107f:	74 ef                	je     80101070 <printdevices+0x30>
80101081:	50                   	push   %eax
80101082:	ff 76 04             	pushl  0x4(%esi)
80101085:	83 c6 24             	add    $0x24,%esi
80101088:	53                   	push   %ebx
80101089:	68 2c e7 10 80       	push   $0x8010e72c
8010108e:	83 c3 01             	add    $0x1,%ebx
80101091:	e8 ca f5 ff ff       	call   80100660 <cprintf>
80101096:	83 c4 10             	add    $0x10,%esp
80101099:	83 fb 0a             	cmp    $0xa,%ebx
8010109c:	75 dd                	jne    8010107b <printdevices+0x3b>
8010109e:	83 ec 0c             	sub    $0xc,%esp
801010a1:	68 20 af 12 80       	push   $0x8012af20
801010a6:	e8 a5 52 00 00       	call   80106350 <release>
801010ab:	83 c4 10             	add    $0x10,%esp
801010ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801010b1:	5b                   	pop    %ebx
801010b2:	5e                   	pop    %esi
801010b3:	5d                   	pop    %ebp
801010b4:	c3                   	ret    
801010b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801010c0 <getsuperblock>:
801010c0:	55                   	push   %ebp
801010c1:	89 e5                	mov    %esp,%ebp
801010c3:	83 ec 08             	sub    $0x8,%esp
801010c6:	8b 45 08             	mov    0x8(%ebp),%eax
801010c9:	89 c2                	mov    %eax,%edx
801010cb:	c1 ea 10             	shr    $0x10,%edx
801010ce:	83 fa 07             	cmp    $0x7,%edx
801010d1:	74 15                	je     801010e8 <getsuperblock+0x28>
801010d3:	83 f8 01             	cmp    $0x1,%eax
801010d6:	77 2f                	ja     80101107 <getsuperblock+0x47>
801010d8:	6b c0 1c             	imul   $0x1c,%eax,%eax
801010db:	c9                   	leave  
801010dc:	05 bc b0 12 80       	add    $0x8012b0bc,%eax
801010e1:	c3                   	ret    
801010e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801010e8:	0f b7 c0             	movzwl %ax,%eax
801010eb:	83 f8 09             	cmp    $0x9,%eax
801010ee:	77 24                	ja     80101114 <getsuperblock+0x54>
801010f0:	8d 04 c0             	lea    (%eax,%eax,8),%eax
801010f3:	c1 e0 02             	shl    $0x2,%eax
801010f6:	8b 90 70 af 12 80    	mov    -0x7fed5090(%eax),%edx
801010fc:	85 d2                	test   %edx,%edx
801010fe:	74 21                	je     80101121 <getsuperblock+0x61>
80101100:	05 54 af 12 80       	add    $0x8012af54,%eax
80101105:	c9                   	leave  
80101106:	c3                   	ret    
80101107:	83 ec 0c             	sub    $0xc,%esp
8010110a:	68 d0 e7 10 80       	push   $0x8010e7d0
8010110f:	e8 bc f2 ff ff       	call   801003d0 <panic>
80101114:	83 ec 0c             	sub    $0xc,%esp
80101117:	68 58 e7 10 80       	push   $0x8010e758
8010111c:	e8 af f2 ff ff       	call   801003d0 <panic>
80101121:	83 ec 0c             	sub    $0xc,%esp
80101124:	68 94 e7 10 80       	push   $0x8010e794
80101129:	e8 a2 f2 ff ff       	call   801003d0 <panic>
8010112e:	66 90                	xchg   %ax,%ax

80101130 <doesbackdevice>:
80101130:	55                   	push   %ebp
80101131:	89 e5                	mov    %esp,%ebp
80101133:	53                   	push   %ebx
80101134:	83 ec 10             	sub    $0x10,%esp
80101137:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010113a:	68 20 af 12 80       	push   $0x8012af20
8010113f:	e8 ec 50 00 00       	call   80106230 <acquire>
80101144:	b8 74 af 12 80       	mov    $0x8012af74,%eax
80101149:	83 c4 10             	add    $0x10,%esp
8010114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101150:	39 18                	cmp    %ebx,(%eax)
80101152:	74 24                	je     80101178 <doesbackdevice+0x48>
80101154:	83 c0 24             	add    $0x24,%eax
80101157:	3d dc b0 12 80       	cmp    $0x8012b0dc,%eax
8010115c:	75 f2                	jne    80101150 <doesbackdevice+0x20>
8010115e:	83 ec 0c             	sub    $0xc,%esp
80101161:	68 20 af 12 80       	push   $0x8012af20
80101166:	e8 e5 51 00 00       	call   80106350 <release>
8010116b:	83 c4 10             	add    $0x10,%esp
8010116e:	31 c0                	xor    %eax,%eax
80101170:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101173:	c9                   	leave  
80101174:	c3                   	ret    
80101175:	8d 76 00             	lea    0x0(%esi),%esi
80101178:	83 ec 0c             	sub    $0xc,%esp
8010117b:	68 20 af 12 80       	push   $0x8012af20
80101180:	e8 cb 51 00 00       	call   80106350 <release>
80101185:	83 c4 10             	add    $0x10,%esp
80101188:	b8 01 00 00 00       	mov    $0x1,%eax
8010118d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101190:	c9                   	leave  
80101191:	c3                   	ret    
80101192:	66 90                	xchg   %ax,%ax
80101194:	66 90                	xchg   %ax,%ax
80101196:	66 90                	xchg   %ax,%ax
80101198:	66 90                	xchg   %ax,%ax
8010119a:	66 90                	xchg   %ax,%ax
8010119c:	66 90                	xchg   %ax,%ax
8010119e:	66 90                	xchg   %ax,%ax

801011a0 <exec>:
801011a0:	55                   	push   %ebp
801011a1:	89 e5                	mov    %esp,%ebp
801011a3:	57                   	push   %edi
801011a4:	56                   	push   %esi
801011a5:	53                   	push   %ebx
801011a6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801011ac:	e8 72 40 00 00       	call   80105223 <myproc>
801011b1:	89 c6                	mov    %eax,%esi
801011b3:	8b 80 ac 02 00 00    	mov    0x2ac(%eax),%eax
801011b9:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
801011bf:	e8 1c 26 00 00       	call   801037e0 <begin_op>
801011c4:	83 ec 0c             	sub    $0xc,%esp
801011c7:	ff 75 08             	pushl  0x8(%ebp)
801011ca:	e8 91 16 00 00       	call   80102860 <namei>
801011cf:	83 c4 10             	add    $0x10,%esp
801011d2:	85 c0                	test   %eax,%eax
801011d4:	0f 84 b1 01 00 00    	je     8010138b <exec+0x1eb>
801011da:	83 ec 0c             	sub    $0xc,%esp
801011dd:	89 c3                	mov    %eax,%ebx
801011df:	50                   	push   %eax
801011e0:	e8 eb 0c 00 00       	call   80101ed0 <ilock>
801011e5:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
801011eb:	6a 34                	push   $0x34
801011ed:	6a 00                	push   $0x0
801011ef:	50                   	push   %eax
801011f0:	53                   	push   %ebx
801011f1:	e8 ca 0f 00 00       	call   801021c0 <readi>
801011f6:	83 c4 20             	add    $0x20,%esp
801011f9:	83 f8 34             	cmp    $0x34,%eax
801011fc:	74 22                	je     80101220 <exec+0x80>
801011fe:	83 ec 0c             	sub    $0xc,%esp
80101201:	53                   	push   %ebx
80101202:	e8 69 0f 00 00       	call   80102170 <iunlockput>
80101207:	e8 44 26 00 00       	call   80103850 <end_op>
8010120c:	83 c4 10             	add    $0x10,%esp
8010120f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101214:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101217:	5b                   	pop    %ebx
80101218:	5e                   	pop    %esi
80101219:	5f                   	pop    %edi
8010121a:	5d                   	pop    %ebp
8010121b:	c3                   	ret    
8010121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101220:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80101227:	45 4c 46 
8010122a:	75 d2                	jne    801011fe <exec+0x5e>
8010122c:	e8 ff 84 00 00       	call   80109730 <setupkvm>
80101231:	85 c0                	test   %eax,%eax
80101233:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80101239:	74 c3                	je     801011fe <exec+0x5e>
8010123b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80101242:	00 
80101243:	8b bd 40 ff ff ff    	mov    -0xc0(%ebp),%edi
80101249:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80101250:	00 00 00 
80101253:	0f 84 d3 00 00 00    	je     8010132c <exec+0x18c>
80101259:	31 c0                	xor    %eax,%eax
8010125b:	89 b5 e8 fe ff ff    	mov    %esi,-0x118(%ebp)
80101261:	89 c6                	mov    %eax,%esi
80101263:	eb 18                	jmp    8010127d <exec+0xdd>
80101265:	8d 76 00             	lea    0x0(%esi),%esi
80101268:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
8010126f:	83 c6 01             	add    $0x1,%esi
80101272:	83 c7 20             	add    $0x20,%edi
80101275:	39 f0                	cmp    %esi,%eax
80101277:	0f 8e a9 00 00 00    	jle    80101326 <exec+0x186>
8010127d:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80101283:	6a 20                	push   $0x20
80101285:	57                   	push   %edi
80101286:	50                   	push   %eax
80101287:	53                   	push   %ebx
80101288:	e8 33 0f 00 00       	call   801021c0 <readi>
8010128d:	83 c4 10             	add    $0x10,%esp
80101290:	83 f8 20             	cmp    $0x20,%eax
80101293:	75 7b                	jne    80101310 <exec+0x170>
80101295:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
8010129c:	75 ca                	jne    80101268 <exec+0xc8>
8010129e:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
801012a4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
801012aa:	72 64                	jb     80101310 <exec+0x170>
801012ac:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
801012b2:	72 5c                	jb     80101310 <exec+0x170>
801012b4:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
801012ba:	50                   	push   %eax
801012bb:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
801012c1:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
801012c7:	e8 54 82 00 00       	call   80109520 <allocuvm>
801012cc:	83 c4 10             	add    $0x10,%esp
801012cf:	85 c0                	test   %eax,%eax
801012d1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
801012d7:	74 37                	je     80101310 <exec+0x170>
801012d9:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
801012df:	a9 ff 0f 00 00       	test   $0xfff,%eax
801012e4:	75 2a                	jne    80101310 <exec+0x170>
801012e6:	83 ec 0c             	sub    $0xc,%esp
801012e9:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
801012ef:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
801012f5:	53                   	push   %ebx
801012f6:	50                   	push   %eax
801012f7:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
801012fd:	e8 de 80 00 00       	call   801093e0 <loaduvm>
80101302:	83 c4 20             	add    $0x20,%esp
80101305:	85 c0                	test   %eax,%eax
80101307:	0f 89 5b ff ff ff    	jns    80101268 <exec+0xc8>
8010130d:	8d 76 00             	lea    0x0(%esi),%esi
80101310:	83 ec 0c             	sub    $0xc,%esp
80101313:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80101319:	e8 92 83 00 00       	call   801096b0 <freevm>
8010131e:	83 c4 10             	add    $0x10,%esp
80101321:	e9 d8 fe ff ff       	jmp    801011fe <exec+0x5e>
80101326:	8b b5 e8 fe ff ff    	mov    -0x118(%ebp),%esi
8010132c:	83 ec 0c             	sub    $0xc,%esp
8010132f:	53                   	push   %ebx
80101330:	e8 3b 0e 00 00       	call   80102170 <iunlockput>
80101335:	e8 16 25 00 00       	call   80103850 <end_op>
8010133a:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80101340:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80101346:	05 ff 0f 00 00       	add    $0xfff,%eax
8010134b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80101350:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80101356:	52                   	push   %edx
80101357:	50                   	push   %eax
80101358:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
8010135e:	e8 bd 81 00 00       	call   80109520 <allocuvm>
80101363:	83 c4 20             	add    $0x20,%esp
80101366:	85 c0                	test   %eax,%eax
80101368:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
8010136e:	75 2a                	jne    8010139a <exec+0x1fa>
80101370:	83 ec 0c             	sub    $0xc,%esp
80101373:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80101379:	e8 32 83 00 00       	call   801096b0 <freevm>
8010137e:	83 c4 10             	add    $0x10,%esp
80101381:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101386:	e9 89 fe ff ff       	jmp    80101214 <exec+0x74>
8010138b:	e8 c0 24 00 00       	call   80103850 <end_op>
80101390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101395:	e9 7a fe ff ff       	jmp    80101214 <exec+0x74>
8010139a:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
801013a0:	83 ec 08             	sub    $0x8,%esp
801013a3:	31 ff                	xor    %edi,%edi
801013a5:	89 d8                	mov    %ebx,%eax
801013a7:	2d 00 20 00 00       	sub    $0x2000,%eax
801013ac:	50                   	push   %eax
801013ad:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
801013b3:	e8 18 84 00 00       	call   801097d0 <clearpteu>
801013b8:	8b 45 0c             	mov    0xc(%ebp),%eax
801013bb:	83 c4 10             	add    $0x10,%esp
801013be:	8b 00                	mov    (%eax),%eax
801013c0:	85 c0                	test   %eax,%eax
801013c2:	0f 84 58 01 00 00    	je     80101520 <exec+0x380>
801013c8:	89 b5 e8 fe ff ff    	mov    %esi,-0x118(%ebp)
801013ce:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
801013d4:	eb 0f                	jmp    801013e5 <exec+0x245>
801013d6:	8d 76 00             	lea    0x0(%esi),%esi
801013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801013e0:	83 ff 20             	cmp    $0x20,%edi
801013e3:	74 8b                	je     80101370 <exec+0x1d0>
801013e5:	83 ec 0c             	sub    $0xc,%esp
801013e8:	50                   	push   %eax
801013e9:	e8 42 52 00 00       	call   80106630 <strlen>
801013ee:	f7 d0                	not    %eax
801013f0:	01 c3                	add    %eax,%ebx
801013f2:	8b 45 0c             	mov    0xc(%ebp),%eax
801013f5:	5a                   	pop    %edx
801013f6:	83 e3 fc             	and    $0xfffffffc,%ebx
801013f9:	ff 34 b8             	pushl  (%eax,%edi,4)
801013fc:	e8 2f 52 00 00       	call   80106630 <strlen>
80101401:	83 c0 01             	add    $0x1,%eax
80101404:	50                   	push   %eax
80101405:	8b 45 0c             	mov    0xc(%ebp),%eax
80101408:	ff 34 b8             	pushl  (%eax,%edi,4)
8010140b:	53                   	push   %ebx
8010140c:	56                   	push   %esi
8010140d:	e8 1e 85 00 00       	call   80109930 <copyout>
80101412:	83 c4 20             	add    $0x20,%esp
80101415:	85 c0                	test   %eax,%eax
80101417:	0f 88 53 ff ff ff    	js     80101370 <exec+0x1d0>
8010141d:	8b 45 0c             	mov    0xc(%ebp),%eax
80101420:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80101427:	83 c7 01             	add    $0x1,%edi
8010142a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80101430:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80101433:	85 c0                	test   %eax,%eax
80101435:	75 a9                	jne    801013e0 <exec+0x240>
80101437:	8b b5 e8 fe ff ff    	mov    -0x118(%ebp),%esi
8010143d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80101444:	89 d9                	mov    %ebx,%ecx
80101446:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
8010144d:	00 00 00 00 
80101451:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80101458:	ff ff ff 
8010145b:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80101461:	29 c1                	sub    %eax,%ecx
80101463:	83 c0 0c             	add    $0xc,%eax
80101466:	29 c3                	sub    %eax,%ebx
80101468:	50                   	push   %eax
80101469:	52                   	push   %edx
8010146a:	53                   	push   %ebx
8010146b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80101471:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80101477:	e8 b4 84 00 00       	call   80109930 <copyout>
8010147c:	83 c4 10             	add    $0x10,%esp
8010147f:	85 c0                	test   %eax,%eax
80101481:	0f 88 e9 fe ff ff    	js     80101370 <exec+0x1d0>
80101487:	8b 45 08             	mov    0x8(%ebp),%eax
8010148a:	0f b6 10             	movzbl (%eax),%edx
8010148d:	84 d2                	test   %dl,%dl
8010148f:	74 19                	je     801014aa <exec+0x30a>
80101491:	8b 4d 08             	mov    0x8(%ebp),%ecx
80101494:	83 c0 01             	add    $0x1,%eax
80101497:	80 fa 2f             	cmp    $0x2f,%dl
8010149a:	0f b6 10             	movzbl (%eax),%edx
8010149d:	0f 44 c8             	cmove  %eax,%ecx
801014a0:	83 c0 01             	add    $0x1,%eax
801014a3:	84 d2                	test   %dl,%dl
801014a5:	75 f0                	jne    80101497 <exec+0x2f7>
801014a7:	89 4d 08             	mov    %ecx,0x8(%ebp)
801014aa:	50                   	push   %eax
801014ab:	8d 86 90 00 00 00    	lea    0x90(%esi),%eax
801014b1:	6a 10                	push   $0x10
801014b3:	ff 75 08             	pushl  0x8(%ebp)
801014b6:	50                   	push   %eax
801014b7:	e8 34 51 00 00       	call   801065f0 <safestrcpy>
801014bc:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
801014c2:	8b 8d ec fe ff ff    	mov    -0x114(%ebp),%ecx
801014c8:	83 c4 10             	add    $0x10,%esp
801014cb:	89 ca                	mov    %ecx,%edx
801014cd:	2b 16                	sub    (%esi),%edx
801014cf:	01 90 38 03 00 00    	add    %edx,0x338(%eax)
801014d5:	8b 80 08 03 00 00    	mov    0x308(%eax),%eax
801014db:	85 c0                	test   %eax,%eax
801014dd:	75 ec                	jne    801014cb <exec+0x32b>
801014df:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
801014e5:	8b 7e 04             	mov    0x4(%esi),%edi
801014e8:	83 ec 0c             	sub    $0xc,%esp
801014eb:	89 46 04             	mov    %eax,0x4(%esi)
801014ee:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
801014f4:	89 06                	mov    %eax,(%esi)
801014f6:	8b 46 38             	mov    0x38(%esi),%eax
801014f9:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
801014ff:	89 50 38             	mov    %edx,0x38(%eax)
80101502:	8b 46 38             	mov    0x38(%esi),%eax
80101505:	89 58 44             	mov    %ebx,0x44(%eax)
80101508:	56                   	push   %esi
80101509:	e8 42 7d 00 00       	call   80109250 <switchuvm>
8010150e:	89 3c 24             	mov    %edi,(%esp)
80101511:	e8 9a 81 00 00       	call   801096b0 <freevm>
80101516:	83 c4 10             	add    $0x10,%esp
80101519:	31 c0                	xor    %eax,%eax
8010151b:	e9 f4 fc ff ff       	jmp    80101214 <exec+0x74>
80101520:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
80101526:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
8010152c:	e9 0c ff ff ff       	jmp    8010143d <exec+0x29d>
80101531:	66 90                	xchg   %ax,%ax
80101533:	66 90                	xchg   %ax,%ax
80101535:	66 90                	xchg   %ax,%ax
80101537:	66 90                	xchg   %ax,%ax
80101539:	66 90                	xchg   %ax,%ax
8010153b:	66 90                	xchg   %ax,%ax
8010153d:	66 90                	xchg   %ax,%ax
8010153f:	90                   	nop

80101540 <fileinit>:
80101540:	55                   	push   %ebp
80101541:	89 e5                	mov    %esp,%ebp
80101543:	83 ec 10             	sub    $0x10,%esp
80101546:	68 f5 e7 10 80       	push   $0x8010e7f5
8010154b:	68 00 b1 12 80       	push   $0x8012b100
80101550:	e8 db 4b 00 00       	call   80106130 <initlock>
80101555:	83 c4 10             	add    $0x10,%esp
80101558:	c9                   	leave  
80101559:	c3                   	ret    
8010155a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101560 <filealloc>:
80101560:	55                   	push   %ebp
80101561:	89 e5                	mov    %esp,%ebp
80101563:	53                   	push   %ebx
80101564:	bb 34 b1 12 80       	mov    $0x8012b134,%ebx
80101569:	83 ec 10             	sub    $0x10,%esp
8010156c:	68 00 b1 12 80       	push   $0x8012b100
80101571:	e8 ba 4c 00 00       	call   80106230 <acquire>
80101576:	83 c4 10             	add    $0x10,%esp
80101579:	eb 10                	jmp    8010158b <filealloc+0x2b>
8010157b:	90                   	nop
8010157c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101580:	83 c3 70             	add    $0x70,%ebx
80101583:	81 fb f4 dc 12 80    	cmp    $0x8012dcf4,%ebx
80101589:	74 25                	je     801015b0 <filealloc+0x50>
8010158b:	8b 43 04             	mov    0x4(%ebx),%eax
8010158e:	85 c0                	test   %eax,%eax
80101590:	75 ee                	jne    80101580 <filealloc+0x20>
80101592:	83 ec 0c             	sub    $0xc,%esp
80101595:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
8010159c:	68 00 b1 12 80       	push   $0x8012b100
801015a1:	e8 aa 4d 00 00       	call   80106350 <release>
801015a6:	89 d8                	mov    %ebx,%eax
801015a8:	83 c4 10             	add    $0x10,%esp
801015ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801015ae:	c9                   	leave  
801015af:	c3                   	ret    
801015b0:	83 ec 0c             	sub    $0xc,%esp
801015b3:	68 00 b1 12 80       	push   $0x8012b100
801015b8:	e8 93 4d 00 00       	call   80106350 <release>
801015bd:	83 c4 10             	add    $0x10,%esp
801015c0:	31 c0                	xor    %eax,%eax
801015c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801015c5:	c9                   	leave  
801015c6:	c3                   	ret    
801015c7:	89 f6                	mov    %esi,%esi
801015c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801015d0 <filedup>:
801015d0:	55                   	push   %ebp
801015d1:	89 e5                	mov    %esp,%ebp
801015d3:	53                   	push   %ebx
801015d4:	83 ec 10             	sub    $0x10,%esp
801015d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015da:	68 00 b1 12 80       	push   $0x8012b100
801015df:	e8 4c 4c 00 00       	call   80106230 <acquire>
801015e4:	8b 43 04             	mov    0x4(%ebx),%eax
801015e7:	83 c4 10             	add    $0x10,%esp
801015ea:	85 c0                	test   %eax,%eax
801015ec:	7e 1a                	jle    80101608 <filedup+0x38>
801015ee:	83 c0 01             	add    $0x1,%eax
801015f1:	83 ec 0c             	sub    $0xc,%esp
801015f4:	89 43 04             	mov    %eax,0x4(%ebx)
801015f7:	68 00 b1 12 80       	push   $0x8012b100
801015fc:	e8 4f 4d 00 00       	call   80106350 <release>
80101601:	89 d8                	mov    %ebx,%eax
80101603:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101606:	c9                   	leave  
80101607:	c3                   	ret    
80101608:	83 ec 0c             	sub    $0xc,%esp
8010160b:	68 fc e7 10 80       	push   $0x8010e7fc
80101610:	e8 bb ed ff ff       	call   801003d0 <panic>
80101615:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101620 <fileclose>:
80101620:	55                   	push   %ebp
80101621:	89 e5                	mov    %esp,%ebp
80101623:	57                   	push   %edi
80101624:	56                   	push   %esi
80101625:	53                   	push   %ebx
80101626:	83 ec 28             	sub    $0x28,%esp
80101629:	8b 7d 08             	mov    0x8(%ebp),%edi
8010162c:	68 00 b1 12 80       	push   $0x8012b100
80101631:	e8 fa 4b 00 00       	call   80106230 <acquire>
80101636:	8b 47 04             	mov    0x4(%edi),%eax
80101639:	83 c4 10             	add    $0x10,%esp
8010163c:	85 c0                	test   %eax,%eax
8010163e:	0f 8e a3 00 00 00    	jle    801016e7 <fileclose+0xc7>
80101644:	83 e8 01             	sub    $0x1,%eax
80101647:	85 c0                	test   %eax,%eax
80101649:	89 47 04             	mov    %eax,0x4(%edi)
8010164c:	74 1a                	je     80101668 <fileclose+0x48>
8010164e:	c7 45 08 00 b1 12 80 	movl   $0x8012b100,0x8(%ebp)
80101655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101658:	5b                   	pop    %ebx
80101659:	5e                   	pop    %esi
8010165a:	5f                   	pop    %edi
8010165b:	5d                   	pop    %ebp
8010165c:	e9 ef 4c 00 00       	jmp    80106350 <release>
80101661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101668:	0f b6 47 09          	movzbl 0x9(%edi),%eax
8010166c:	8b 1f                	mov    (%edi),%ebx
8010166e:	83 ec 0c             	sub    $0xc,%esp
80101671:	8b 77 10             	mov    0x10(%edi),%esi
80101674:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
8010167a:	88 45 e7             	mov    %al,-0x19(%ebp)
8010167d:	8b 47 14             	mov    0x14(%edi),%eax
80101680:	68 00 b1 12 80       	push   $0x8012b100
80101685:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101688:	e8 c3 4c 00 00       	call   80106350 <release>
8010168d:	83 c4 10             	add    $0x10,%esp
80101690:	83 fb 01             	cmp    $0x1,%ebx
80101693:	74 13                	je     801016a8 <fileclose+0x88>
80101695:	83 fb 02             	cmp    $0x2,%ebx
80101698:	74 26                	je     801016c0 <fileclose+0xa0>
8010169a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010169d:	5b                   	pop    %ebx
8010169e:	5e                   	pop    %esi
8010169f:	5f                   	pop    %edi
801016a0:	5d                   	pop    %ebp
801016a1:	c3                   	ret    
801016a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801016a8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
801016ac:	83 ec 08             	sub    $0x8,%esp
801016af:	53                   	push   %ebx
801016b0:	56                   	push   %esi
801016b1:	e8 9a 36 00 00       	call   80104d50 <pipeclose>
801016b6:	83 c4 10             	add    $0x10,%esp
801016b9:	eb df                	jmp    8010169a <fileclose+0x7a>
801016bb:	90                   	nop
801016bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801016c0:	83 ec 0c             	sub    $0xc,%esp
801016c3:	ff 75 e0             	pushl  -0x20(%ebp)
801016c6:	e8 10 28 00 00       	call   80103edb <mntput>
801016cb:	e8 10 21 00 00       	call   801037e0 <begin_op>
801016d0:	89 34 24             	mov    %esi,(%esp)
801016d3:	e8 28 09 00 00       	call   80102000 <iput>
801016d8:	83 c4 10             	add    $0x10,%esp
801016db:	8d 65 f4             	lea    -0xc(%ebp),%esp
801016de:	5b                   	pop    %ebx
801016df:	5e                   	pop    %esi
801016e0:	5f                   	pop    %edi
801016e1:	5d                   	pop    %ebp
801016e2:	e9 69 21 00 00       	jmp    80103850 <end_op>
801016e7:	83 ec 0c             	sub    $0xc,%esp
801016ea:	68 04 e8 10 80       	push   $0x8010e804
801016ef:	e8 dc ec ff ff       	call   801003d0 <panic>
801016f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801016fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101700 <filestat>:
80101700:	55                   	push   %ebp
80101701:	89 e5                	mov    %esp,%ebp
80101703:	53                   	push   %ebx
80101704:	83 ec 04             	sub    $0x4,%esp
80101707:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010170a:	83 3b 02             	cmpl   $0x2,(%ebx)
8010170d:	75 31                	jne    80101740 <filestat+0x40>
8010170f:	83 ec 0c             	sub    $0xc,%esp
80101712:	ff 73 10             	pushl  0x10(%ebx)
80101715:	e8 b6 07 00 00       	call   80101ed0 <ilock>
8010171a:	58                   	pop    %eax
8010171b:	5a                   	pop    %edx
8010171c:	ff 75 0c             	pushl  0xc(%ebp)
8010171f:	ff 73 10             	pushl  0x10(%ebx)
80101722:	e8 69 0a 00 00       	call   80102190 <stati>
80101727:	59                   	pop    %ecx
80101728:	ff 73 10             	pushl  0x10(%ebx)
8010172b:	e8 80 08 00 00       	call   80101fb0 <iunlock>
80101730:	83 c4 10             	add    $0x10,%esp
80101733:	31 c0                	xor    %eax,%eax
80101735:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101738:	c9                   	leave  
80101739:	c3                   	ret    
8010173a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101740:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101745:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101748:	c9                   	leave  
80101749:	c3                   	ret    
8010174a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101750 <fileread>:
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	57                   	push   %edi
80101754:	56                   	push   %esi
80101755:	53                   	push   %ebx
80101756:	83 ec 0c             	sub    $0xc,%esp
80101759:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010175c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010175f:	8b 7d 10             	mov    0x10(%ebp),%edi
80101762:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101766:	74 60                	je     801017c8 <fileread+0x78>
80101768:	8b 03                	mov    (%ebx),%eax
8010176a:	83 f8 01             	cmp    $0x1,%eax
8010176d:	74 41                	je     801017b0 <fileread+0x60>
8010176f:	83 f8 02             	cmp    $0x2,%eax
80101772:	75 5b                	jne    801017cf <fileread+0x7f>
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	ff 73 10             	pushl  0x10(%ebx)
8010177a:	e8 51 07 00 00       	call   80101ed0 <ilock>
8010177f:	57                   	push   %edi
80101780:	ff 73 0c             	pushl  0xc(%ebx)
80101783:	56                   	push   %esi
80101784:	ff 73 10             	pushl  0x10(%ebx)
80101787:	e8 34 0a 00 00       	call   801021c0 <readi>
8010178c:	83 c4 20             	add    $0x20,%esp
8010178f:	85 c0                	test   %eax,%eax
80101791:	89 c6                	mov    %eax,%esi
80101793:	7e 03                	jle    80101798 <fileread+0x48>
80101795:	01 43 0c             	add    %eax,0xc(%ebx)
80101798:	83 ec 0c             	sub    $0xc,%esp
8010179b:	ff 73 10             	pushl  0x10(%ebx)
8010179e:	e8 0d 08 00 00       	call   80101fb0 <iunlock>
801017a3:	83 c4 10             	add    $0x10,%esp
801017a6:	89 f0                	mov    %esi,%eax
801017a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017ab:	5b                   	pop    %ebx
801017ac:	5e                   	pop    %esi
801017ad:	5f                   	pop    %edi
801017ae:	5d                   	pop    %ebp
801017af:	c3                   	ret    
801017b0:	8b 43 10             	mov    0x10(%ebx),%eax
801017b3:	89 45 08             	mov    %eax,0x8(%ebp)
801017b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017b9:	5b                   	pop    %ebx
801017ba:	5e                   	pop    %esi
801017bb:	5f                   	pop    %edi
801017bc:	5d                   	pop    %ebp
801017bd:	e9 2e 37 00 00       	jmp    80104ef0 <piperead>
801017c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801017c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801017cd:	eb d9                	jmp    801017a8 <fileread+0x58>
801017cf:	83 ec 0c             	sub    $0xc,%esp
801017d2:	68 0e e8 10 80       	push   $0x8010e80e
801017d7:	e8 f4 eb ff ff       	call   801003d0 <panic>
801017dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801017e0 <filewrite>:
801017e0:	55                   	push   %ebp
801017e1:	89 e5                	mov    %esp,%ebp
801017e3:	57                   	push   %edi
801017e4:	56                   	push   %esi
801017e5:	53                   	push   %ebx
801017e6:	83 ec 1c             	sub    $0x1c,%esp
801017e9:	8b 75 08             	mov    0x8(%ebp),%esi
801017ec:	8b 45 0c             	mov    0xc(%ebp),%eax
801017ef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
801017f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
801017f6:	8b 45 10             	mov    0x10(%ebp),%eax
801017f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801017fc:	0f 84 aa 00 00 00    	je     801018ac <filewrite+0xcc>
80101802:	8b 06                	mov    (%esi),%eax
80101804:	83 f8 01             	cmp    $0x1,%eax
80101807:	0f 84 c2 00 00 00    	je     801018cf <filewrite+0xef>
8010180d:	83 f8 02             	cmp    $0x2,%eax
80101810:	0f 85 d8 00 00 00    	jne    801018ee <filewrite+0x10e>
80101816:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101819:	31 ff                	xor    %edi,%edi
8010181b:	85 c0                	test   %eax,%eax
8010181d:	7f 34                	jg     80101853 <filewrite+0x73>
8010181f:	e9 9c 00 00 00       	jmp    801018c0 <filewrite+0xe0>
80101824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101828:	01 46 0c             	add    %eax,0xc(%esi)
8010182b:	83 ec 0c             	sub    $0xc,%esp
8010182e:	ff 76 10             	pushl  0x10(%esi)
80101831:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101834:	e8 77 07 00 00       	call   80101fb0 <iunlock>
80101839:	e8 12 20 00 00       	call   80103850 <end_op>
8010183e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101841:	83 c4 10             	add    $0x10,%esp
80101844:	39 d8                	cmp    %ebx,%eax
80101846:	0f 85 95 00 00 00    	jne    801018e1 <filewrite+0x101>
8010184c:	01 c7                	add    %eax,%edi
8010184e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101851:	7e 6d                	jle    801018c0 <filewrite+0xe0>
80101853:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101856:	b8 00 06 00 00       	mov    $0x600,%eax
8010185b:	29 fb                	sub    %edi,%ebx
8010185d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101863:	0f 4f d8             	cmovg  %eax,%ebx
80101866:	e8 75 1f 00 00       	call   801037e0 <begin_op>
8010186b:	83 ec 0c             	sub    $0xc,%esp
8010186e:	ff 76 10             	pushl  0x10(%esi)
80101871:	e8 5a 06 00 00       	call   80101ed0 <ilock>
80101876:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101879:	53                   	push   %ebx
8010187a:	ff 76 0c             	pushl  0xc(%esi)
8010187d:	01 f8                	add    %edi,%eax
8010187f:	50                   	push   %eax
80101880:	ff 76 10             	pushl  0x10(%esi)
80101883:	e8 48 0a 00 00       	call   801022d0 <writei>
80101888:	83 c4 20             	add    $0x20,%esp
8010188b:	85 c0                	test   %eax,%eax
8010188d:	7f 99                	jg     80101828 <filewrite+0x48>
8010188f:	83 ec 0c             	sub    $0xc,%esp
80101892:	ff 76 10             	pushl  0x10(%esi)
80101895:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101898:	e8 13 07 00 00       	call   80101fb0 <iunlock>
8010189d:	e8 ae 1f 00 00       	call   80103850 <end_op>
801018a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801018a5:	83 c4 10             	add    $0x10,%esp
801018a8:	85 c0                	test   %eax,%eax
801018aa:	74 98                	je     80101844 <filewrite+0x64>
801018ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801018b4:	5b                   	pop    %ebx
801018b5:	5e                   	pop    %esi
801018b6:	5f                   	pop    %edi
801018b7:	5d                   	pop    %ebp
801018b8:	c3                   	ret    
801018b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801018c3:	75 e7                	jne    801018ac <filewrite+0xcc>
801018c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018c8:	89 f8                	mov    %edi,%eax
801018ca:	5b                   	pop    %ebx
801018cb:	5e                   	pop    %esi
801018cc:	5f                   	pop    %edi
801018cd:	5d                   	pop    %ebp
801018ce:	c3                   	ret    
801018cf:	8b 46 10             	mov    0x10(%esi),%eax
801018d2:	89 45 08             	mov    %eax,0x8(%ebp)
801018d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018d8:	5b                   	pop    %ebx
801018d9:	5e                   	pop    %esi
801018da:	5f                   	pop    %edi
801018db:	5d                   	pop    %ebp
801018dc:	e9 0f 35 00 00       	jmp    80104df0 <pipewrite>
801018e1:	83 ec 0c             	sub    $0xc,%esp
801018e4:	68 17 e8 10 80       	push   $0x8010e817
801018e9:	e8 e2 ea ff ff       	call   801003d0 <panic>
801018ee:	83 ec 0c             	sub    $0xc,%esp
801018f1:	68 1d e8 10 80       	push   $0x8010e81d
801018f6:	e8 d5 ea ff ff       	call   801003d0 <panic>
801018fb:	66 90                	xchg   %ax,%ax
801018fd:	66 90                	xchg   %ax,%ax
801018ff:	90                   	nop

80101900 <balloc>:
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	57                   	push   %edi
80101904:	56                   	push   %esi
80101905:	53                   	push   %ebx
80101906:	83 ec 38             	sub    $0x38,%esp
80101909:	89 45 d4             	mov    %eax,-0x2c(%ebp)
8010190c:	50                   	push   %eax
8010190d:	e8 ae f7 ff ff       	call   801010c0 <getsuperblock>
80101912:	8b 08                	mov    (%eax),%ecx
80101914:	83 c4 10             	add    $0x10,%esp
80101917:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010191a:	85 c9                	test   %ecx,%ecx
8010191c:	0f 84 84 00 00 00    	je     801019a6 <balloc+0xa6>
80101922:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101929:	8b 75 dc             	mov    -0x24(%ebp),%esi
8010192c:	8b 7d d8             	mov    -0x28(%ebp),%edi
8010192f:	83 ec 08             	sub    $0x8,%esp
80101932:	89 f0                	mov    %esi,%eax
80101934:	c1 f8 0d             	sar    $0xd,%eax
80101937:	03 47 18             	add    0x18(%edi),%eax
8010193a:	50                   	push   %eax
8010193b:	ff 75 d4             	pushl  -0x2c(%ebp)
8010193e:	e8 9d e8 ff ff       	call   801001e0 <bread>
80101943:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101946:	8b 07                	mov    (%edi),%eax
80101948:	83 c4 10             	add    $0x10,%esp
8010194b:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010194e:	31 c0                	xor    %eax,%eax
80101950:	eb 30                	jmp    80101982 <balloc+0x82>
80101952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101958:	89 c1                	mov    %eax,%ecx
8010195a:	ba 01 00 00 00       	mov    $0x1,%edx
8010195f:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101962:	83 e1 07             	and    $0x7,%ecx
80101965:	d3 e2                	shl    %cl,%edx
80101967:	89 c1                	mov    %eax,%ecx
80101969:	c1 f9 03             	sar    $0x3,%ecx
8010196c:	0f b6 7c 0b 60       	movzbl 0x60(%ebx,%ecx,1),%edi
80101971:	85 d7                	test   %edx,%edi
80101973:	74 43                	je     801019b8 <balloc+0xb8>
80101975:	83 c0 01             	add    $0x1,%eax
80101978:	83 c6 01             	add    $0x1,%esi
8010197b:	3d 00 20 00 00       	cmp    $0x2000,%eax
80101980:	74 05                	je     80101987 <balloc+0x87>
80101982:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80101985:	72 d1                	jb     80101958 <balloc+0x58>
80101987:	83 ec 0c             	sub    $0xc,%esp
8010198a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010198d:	e8 ae e9 ff ff       	call   80100340 <brelse>
80101992:	8b 75 d8             	mov    -0x28(%ebp),%esi
80101995:	81 45 dc 00 20 00 00 	addl   $0x2000,-0x24(%ebp)
8010199c:	83 c4 10             	add    $0x10,%esp
8010199f:	8b 45 dc             	mov    -0x24(%ebp),%eax
801019a2:	39 06                	cmp    %eax,(%esi)
801019a4:	77 83                	ja     80101929 <balloc+0x29>
801019a6:	83 ec 0c             	sub    $0xc,%esp
801019a9:	68 27 e8 10 80       	push   $0x8010e827
801019ae:	e8 1d ea ff ff       	call   801003d0 <panic>
801019b3:	90                   	nop
801019b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801019b8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801019bb:	83 ec 0c             	sub    $0xc,%esp
801019be:	09 fa                	or     %edi,%edx
801019c0:	88 54 0b 60          	mov    %dl,0x60(%ebx,%ecx,1)
801019c4:	53                   	push   %ebx
801019c5:	e8 f6 1f 00 00       	call   801039c0 <log_write>
801019ca:	89 1c 24             	mov    %ebx,(%esp)
801019cd:	e8 6e e9 ff ff       	call   80100340 <brelse>
801019d2:	58                   	pop    %eax
801019d3:	5a                   	pop    %edx
801019d4:	56                   	push   %esi
801019d5:	ff 75 d4             	pushl  -0x2c(%ebp)
801019d8:	e8 03 e8 ff ff       	call   801001e0 <bread>
801019dd:	89 c3                	mov    %eax,%ebx
801019df:	8d 40 60             	lea    0x60(%eax),%eax
801019e2:	83 c4 0c             	add    $0xc,%esp
801019e5:	68 00 04 00 00       	push   $0x400
801019ea:	6a 00                	push   $0x0
801019ec:	50                   	push   %eax
801019ed:	e8 ae 49 00 00       	call   801063a0 <memset>
801019f2:	89 1c 24             	mov    %ebx,(%esp)
801019f5:	e8 c6 1f 00 00       	call   801039c0 <log_write>
801019fa:	89 1c 24             	mov    %ebx,(%esp)
801019fd:	e8 3e e9 ff ff       	call   80100340 <brelse>
80101a02:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a05:	89 f0                	mov    %esi,%eax
80101a07:	5b                   	pop    %ebx
80101a08:	5e                   	pop    %esi
80101a09:	5f                   	pop    %edi
80101a0a:	5d                   	pop    %ebp
80101a0b:	c3                   	ret    
80101a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101a10 <iget>:
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	57                   	push   %edi
80101a14:	56                   	push   %esi
80101a15:	53                   	push   %ebx
80101a16:	89 c7                	mov    %eax,%edi
80101a18:	31 f6                	xor    %esi,%esi
80101a1a:	bb 94 dd 12 80       	mov    $0x8012dd94,%ebx
80101a1f:	83 ec 28             	sub    $0x28,%esp
80101a22:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101a25:	68 60 dd 12 80       	push   $0x8012dd60
80101a2a:	e8 01 48 00 00       	call   80106230 <acquire>
80101a2f:	83 c4 10             	add    $0x10,%esp
80101a32:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101a35:	eb 1b                	jmp    80101a52 <iget+0x42>
80101a37:	89 f6                	mov    %esi,%esi
80101a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101a40:	85 f6                	test   %esi,%esi
80101a42:	74 44                	je     80101a88 <iget+0x78>
80101a44:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101a4a:	81 fb b4 f9 12 80    	cmp    $0x8012f9b4,%ebx
80101a50:	74 4e                	je     80101aa0 <iget+0x90>
80101a52:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101a55:	85 c9                	test   %ecx,%ecx
80101a57:	7e e7                	jle    80101a40 <iget+0x30>
80101a59:	39 3b                	cmp    %edi,(%ebx)
80101a5b:	75 e3                	jne    80101a40 <iget+0x30>
80101a5d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101a60:	75 de                	jne    80101a40 <iget+0x30>
80101a62:	83 ec 0c             	sub    $0xc,%esp
80101a65:	83 c1 01             	add    $0x1,%ecx
80101a68:	89 de                	mov    %ebx,%esi
80101a6a:	68 60 dd 12 80       	push   $0x8012dd60
80101a6f:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101a72:	e8 d9 48 00 00       	call   80106350 <release>
80101a77:	83 c4 10             	add    $0x10,%esp
80101a7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a7d:	89 f0                	mov    %esi,%eax
80101a7f:	5b                   	pop    %ebx
80101a80:	5e                   	pop    %esi
80101a81:	5f                   	pop    %edi
80101a82:	5d                   	pop    %ebp
80101a83:	c3                   	ret    
80101a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101a88:	85 c9                	test   %ecx,%ecx
80101a8a:	0f 44 f3             	cmove  %ebx,%esi
80101a8d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101a93:	81 fb b4 f9 12 80    	cmp    $0x8012f9b4,%ebx
80101a99:	75 b7                	jne    80101a52 <iget+0x42>
80101a9b:	90                   	nop
80101a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101aa0:	85 f6                	test   %esi,%esi
80101aa2:	74 3b                	je     80101adf <iget+0xcf>
80101aa4:	83 ec 0c             	sub    $0xc,%esp
80101aa7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101aaa:	57                   	push   %edi
80101aab:	e8 60 f4 ff ff       	call   80100f10 <deviceget>
80101ab0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ab3:	89 3e                	mov    %edi,(%esi)
80101ab5:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101abc:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101ac3:	89 56 04             	mov    %edx,0x4(%esi)
80101ac6:	c7 04 24 60 dd 12 80 	movl   $0x8012dd60,(%esp)
80101acd:	e8 7e 48 00 00       	call   80106350 <release>
80101ad2:	83 c4 10             	add    $0x10,%esp
80101ad5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ad8:	89 f0                	mov    %esi,%eax
80101ada:	5b                   	pop    %ebx
80101adb:	5e                   	pop    %esi
80101adc:	5f                   	pop    %edi
80101add:	5d                   	pop    %ebp
80101ade:	c3                   	ret    
80101adf:	83 ec 0c             	sub    $0xc,%esp
80101ae2:	68 3d e8 10 80       	push   $0x8010e83d
80101ae7:	e8 e4 e8 ff ff       	call   801003d0 <panic>
80101aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101af0 <bmap>:
80101af0:	55                   	push   %ebp
80101af1:	89 e5                	mov    %esp,%ebp
80101af3:	57                   	push   %edi
80101af4:	56                   	push   %esi
80101af5:	53                   	push   %ebx
80101af6:	89 c6                	mov    %eax,%esi
80101af8:	83 ec 1c             	sub    $0x1c,%esp
80101afb:	83 fa 0b             	cmp    $0xb,%edx
80101afe:	77 18                	ja     80101b18 <bmap+0x28>
80101b00:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80101b03:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101b06:	85 c0                	test   %eax,%eax
80101b08:	74 76                	je     80101b80 <bmap+0x90>
80101b0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b0d:	5b                   	pop    %ebx
80101b0e:	5e                   	pop    %esi
80101b0f:	5f                   	pop    %edi
80101b10:	5d                   	pop    %ebp
80101b11:	c3                   	ret    
80101b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101b18:	8d 5a f4             	lea    -0xc(%edx),%ebx
80101b1b:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
80101b21:	0f 87 80 00 00 00    	ja     80101ba7 <bmap+0xb7>
80101b27:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101b2d:	85 c0                	test   %eax,%eax
80101b2f:	74 67                	je     80101b98 <bmap+0xa8>
80101b31:	83 ec 08             	sub    $0x8,%esp
80101b34:	50                   	push   %eax
80101b35:	ff 36                	pushl  (%esi)
80101b37:	e8 a4 e6 ff ff       	call   801001e0 <bread>
80101b3c:	8d 54 98 60          	lea    0x60(%eax,%ebx,4),%edx
80101b40:	83 c4 10             	add    $0x10,%esp
80101b43:	89 c7                	mov    %eax,%edi
80101b45:	8b 1a                	mov    (%edx),%ebx
80101b47:	85 db                	test   %ebx,%ebx
80101b49:	75 1d                	jne    80101b68 <bmap+0x78>
80101b4b:	8b 06                	mov    (%esi),%eax
80101b4d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101b50:	e8 ab fd ff ff       	call   80101900 <balloc>
80101b55:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b58:	83 ec 0c             	sub    $0xc,%esp
80101b5b:	89 c3                	mov    %eax,%ebx
80101b5d:	89 02                	mov    %eax,(%edx)
80101b5f:	57                   	push   %edi
80101b60:	e8 5b 1e 00 00       	call   801039c0 <log_write>
80101b65:	83 c4 10             	add    $0x10,%esp
80101b68:	83 ec 0c             	sub    $0xc,%esp
80101b6b:	57                   	push   %edi
80101b6c:	e8 cf e7 ff ff       	call   80100340 <brelse>
80101b71:	83 c4 10             	add    $0x10,%esp
80101b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b77:	89 d8                	mov    %ebx,%eax
80101b79:	5b                   	pop    %ebx
80101b7a:	5e                   	pop    %esi
80101b7b:	5f                   	pop    %edi
80101b7c:	5d                   	pop    %ebp
80101b7d:	c3                   	ret    
80101b7e:	66 90                	xchg   %ax,%ax
80101b80:	8b 06                	mov    (%esi),%eax
80101b82:	e8 79 fd ff ff       	call   80101900 <balloc>
80101b87:	89 43 5c             	mov    %eax,0x5c(%ebx)
80101b8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b8d:	5b                   	pop    %ebx
80101b8e:	5e                   	pop    %esi
80101b8f:	5f                   	pop    %edi
80101b90:	5d                   	pop    %ebp
80101b91:	c3                   	ret    
80101b92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101b98:	8b 06                	mov    (%esi),%eax
80101b9a:	e8 61 fd ff ff       	call   80101900 <balloc>
80101b9f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101ba5:	eb 8a                	jmp    80101b31 <bmap+0x41>
80101ba7:	83 ec 0c             	sub    $0xc,%esp
80101baa:	68 4d e8 10 80       	push   $0x8010e84d
80101baf:	e8 1c e8 ff ff       	call   801003d0 <panic>
80101bb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101bba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101bc0 <readsb>:
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	56                   	push   %esi
80101bc4:	53                   	push   %ebx
80101bc5:	8b 75 0c             	mov    0xc(%ebp),%esi
80101bc8:	83 ec 08             	sub    $0x8,%esp
80101bcb:	6a 01                	push   $0x1
80101bcd:	ff 75 08             	pushl  0x8(%ebp)
80101bd0:	e8 0b e6 ff ff       	call   801001e0 <bread>
80101bd5:	89 c3                	mov    %eax,%ebx
80101bd7:	8d 40 60             	lea    0x60(%eax),%eax
80101bda:	83 c4 0c             	add    $0xc,%esp
80101bdd:	6a 1c                	push   $0x1c
80101bdf:	50                   	push   %eax
80101be0:	56                   	push   %esi
80101be1:	e8 6a 48 00 00       	call   80106450 <memmove>
80101be6:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101be9:	83 c4 10             	add    $0x10,%esp
80101bec:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101bef:	5b                   	pop    %ebx
80101bf0:	5e                   	pop    %esi
80101bf1:	5d                   	pop    %ebp
80101bf2:	e9 49 e7 ff ff       	jmp    80100340 <brelse>
80101bf7:	89 f6                	mov    %esi,%esi
80101bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c00 <bfree>:
80101c00:	55                   	push   %ebp
80101c01:	89 e5                	mov    %esp,%ebp
80101c03:	57                   	push   %edi
80101c04:	56                   	push   %esi
80101c05:	53                   	push   %ebx
80101c06:	89 c6                	mov    %eax,%esi
80101c08:	89 d3                	mov    %edx,%ebx
80101c0a:	83 ec 18             	sub    $0x18,%esp
80101c0d:	50                   	push   %eax
80101c0e:	e8 ad f4 ff ff       	call   801010c0 <getsuperblock>
80101c13:	5a                   	pop    %edx
80101c14:	59                   	pop    %ecx
80101c15:	50                   	push   %eax
80101c16:	56                   	push   %esi
80101c17:	89 c7                	mov    %eax,%edi
80101c19:	e8 a2 ff ff ff       	call   80101bc0 <readsb>
80101c1e:	58                   	pop    %eax
80101c1f:	8b 47 18             	mov    0x18(%edi),%eax
80101c22:	5a                   	pop    %edx
80101c23:	89 da                	mov    %ebx,%edx
80101c25:	c1 ea 0d             	shr    $0xd,%edx
80101c28:	01 d0                	add    %edx,%eax
80101c2a:	50                   	push   %eax
80101c2b:	56                   	push   %esi
80101c2c:	e8 af e5 ff ff       	call   801001e0 <bread>
80101c31:	89 d9                	mov    %ebx,%ecx
80101c33:	81 e3 ff 1f 00 00    	and    $0x1fff,%ebx
80101c39:	ba 01 00 00 00       	mov    $0x1,%edx
80101c3e:	83 e1 07             	and    $0x7,%ecx
80101c41:	c1 fb 03             	sar    $0x3,%ebx
80101c44:	83 c4 10             	add    $0x10,%esp
80101c47:	d3 e2                	shl    %cl,%edx
80101c49:	0f b6 4c 18 60       	movzbl 0x60(%eax,%ebx,1),%ecx
80101c4e:	85 d1                	test   %edx,%ecx
80101c50:	74 28                	je     80101c7a <bfree+0x7a>
80101c52:	89 c6                	mov    %eax,%esi
80101c54:	f7 d2                	not    %edx
80101c56:	89 c8                	mov    %ecx,%eax
80101c58:	83 ec 0c             	sub    $0xc,%esp
80101c5b:	21 d0                	and    %edx,%eax
80101c5d:	88 44 1e 60          	mov    %al,0x60(%esi,%ebx,1)
80101c61:	56                   	push   %esi
80101c62:	e8 59 1d 00 00       	call   801039c0 <log_write>
80101c67:	89 34 24             	mov    %esi,(%esp)
80101c6a:	e8 d1 e6 ff ff       	call   80100340 <brelse>
80101c6f:	83 c4 10             	add    $0x10,%esp
80101c72:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c75:	5b                   	pop    %ebx
80101c76:	5e                   	pop    %esi
80101c77:	5f                   	pop    %edi
80101c78:	5d                   	pop    %ebp
80101c79:	c3                   	ret    
80101c7a:	83 ec 0c             	sub    $0xc,%esp
80101c7d:	68 60 e8 10 80       	push   $0x8010e860
80101c82:	e8 49 e7 ff ff       	call   801003d0 <panic>
80101c87:	89 f6                	mov    %esi,%esi
80101c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c90 <fsinit>:
80101c90:	55                   	push   %ebp
80101c91:	89 e5                	mov    %esp,%ebp
80101c93:	56                   	push   %esi
80101c94:	53                   	push   %ebx
80101c95:	8b 75 08             	mov    0x8(%ebp),%esi
80101c98:	83 ec 0c             	sub    $0xc,%esp
80101c9b:	56                   	push   %esi
80101c9c:	e8 1f f4 ff ff       	call   801010c0 <getsuperblock>
80101ca1:	89 c3                	mov    %eax,%ebx
80101ca3:	58                   	pop    %eax
80101ca4:	5a                   	pop    %edx
80101ca5:	53                   	push   %ebx
80101ca6:	56                   	push   %esi
80101ca7:	e8 14 ff ff ff       	call   80101bc0 <readsb>
80101cac:	ff 73 18             	pushl  0x18(%ebx)
80101caf:	ff 73 14             	pushl  0x14(%ebx)
80101cb2:	ff 73 10             	pushl  0x10(%ebx)
80101cb5:	ff 73 0c             	pushl  0xc(%ebx)
80101cb8:	ff 73 08             	pushl  0x8(%ebx)
80101cbb:	ff 73 04             	pushl  0x4(%ebx)
80101cbe:	ff 33                	pushl  (%ebx)
80101cc0:	68 e0 e8 10 80       	push   $0x8010e8e0
80101cc5:	e8 96 e9 ff ff       	call   80100660 <cprintf>
80101cca:	83 c4 30             	add    $0x30,%esp
80101ccd:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101cd0:	5b                   	pop    %ebx
80101cd1:	5e                   	pop    %esi
80101cd2:	5d                   	pop    %ebp
80101cd3:	c3                   	ret    
80101cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101ce0 <iinit>:
80101ce0:	55                   	push   %ebp
80101ce1:	89 e5                	mov    %esp,%ebp
80101ce3:	56                   	push   %esi
80101ce4:	53                   	push   %ebx
80101ce5:	8b 75 08             	mov    0x8(%ebp),%esi
80101ce8:	bb a0 dd 12 80       	mov    $0x8012dda0,%ebx
80101ced:	83 ec 08             	sub    $0x8,%esp
80101cf0:	68 73 e8 10 80       	push   $0x8010e873
80101cf5:	68 60 dd 12 80       	push   $0x8012dd60
80101cfa:	e8 31 44 00 00       	call   80106130 <initlock>
80101cff:	83 c4 10             	add    $0x10,%esp
80101d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101d08:	83 ec 08             	sub    $0x8,%esp
80101d0b:	68 7a e8 10 80       	push   $0x8010e87a
80101d10:	53                   	push   %ebx
80101d11:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101d17:	e8 04 43 00 00       	call   80106020 <initsleeplock>
80101d1c:	83 c4 10             	add    $0x10,%esp
80101d1f:	81 fb c0 f9 12 80    	cmp    $0x8012f9c0,%ebx
80101d25:	75 e1                	jne    80101d08 <iinit+0x28>
80101d27:	89 75 08             	mov    %esi,0x8(%ebp)
80101d2a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101d2d:	5b                   	pop    %ebx
80101d2e:	5e                   	pop    %esi
80101d2f:	5d                   	pop    %ebp
80101d30:	e9 5b ff ff ff       	jmp    80101c90 <fsinit>
80101d35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101d40 <ialloc>:
80101d40:	55                   	push   %ebp
80101d41:	89 e5                	mov    %esp,%ebp
80101d43:	57                   	push   %edi
80101d44:	56                   	push   %esi
80101d45:	53                   	push   %ebx
80101d46:	83 ec 28             	sub    $0x28,%esp
80101d49:	8b 7d 08             	mov    0x8(%ebp),%edi
80101d4c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d4f:	57                   	push   %edi
80101d50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d53:	e8 68 f3 ff ff       	call   801010c0 <getsuperblock>
80101d58:	83 c4 10             	add    $0x10,%esp
80101d5b:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
80101d5f:	0f 86 91 00 00 00    	jbe    80101df6 <ialloc+0xb6>
80101d65:	89 c6                	mov    %eax,%esi
80101d67:	bb 01 00 00 00       	mov    $0x1,%ebx
80101d6c:	eb 16                	jmp    80101d84 <ialloc+0x44>
80101d6e:	66 90                	xchg   %ax,%ax
80101d70:	83 ec 0c             	sub    $0xc,%esp
80101d73:	83 c3 01             	add    $0x1,%ebx
80101d76:	52                   	push   %edx
80101d77:	e8 c4 e5 ff ff       	call   80100340 <brelse>
80101d7c:	83 c4 10             	add    $0x10,%esp
80101d7f:	39 5e 08             	cmp    %ebx,0x8(%esi)
80101d82:	76 72                	jbe    80101df6 <ialloc+0xb6>
80101d84:	89 d8                	mov    %ebx,%eax
80101d86:	83 ec 08             	sub    $0x8,%esp
80101d89:	c1 e8 04             	shr    $0x4,%eax
80101d8c:	03 46 14             	add    0x14(%esi),%eax
80101d8f:	50                   	push   %eax
80101d90:	57                   	push   %edi
80101d91:	e8 4a e4 ff ff       	call   801001e0 <bread>
80101d96:	89 c2                	mov    %eax,%edx
80101d98:	89 d8                	mov    %ebx,%eax
80101d9a:	83 c4 10             	add    $0x10,%esp
80101d9d:	83 e0 0f             	and    $0xf,%eax
80101da0:	c1 e0 06             	shl    $0x6,%eax
80101da3:	8d 4c 02 60          	lea    0x60(%edx,%eax,1),%ecx
80101da7:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101dab:	75 c3                	jne    80101d70 <ialloc+0x30>
80101dad:	83 ec 04             	sub    $0x4,%esp
80101db0:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101db3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101db6:	6a 40                	push   $0x40
80101db8:	6a 00                	push   $0x0
80101dba:	51                   	push   %ecx
80101dbb:	e8 e0 45 00 00       	call   801063a0 <memset>
80101dc0:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101dc4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101dc7:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101dca:	66 89 01             	mov    %ax,(%ecx)
80101dcd:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101dd0:	89 14 24             	mov    %edx,(%esp)
80101dd3:	e8 e8 1b 00 00       	call   801039c0 <log_write>
80101dd8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ddb:	89 14 24             	mov    %edx,(%esp)
80101dde:	e8 5d e5 ff ff       	call   80100340 <brelse>
80101de3:	83 c4 10             	add    $0x10,%esp
80101de6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de9:	89 da                	mov    %ebx,%edx
80101deb:	89 f8                	mov    %edi,%eax
80101ded:	5b                   	pop    %ebx
80101dee:	5e                   	pop    %esi
80101def:	5f                   	pop    %edi
80101df0:	5d                   	pop    %ebp
80101df1:	e9 1a fc ff ff       	jmp    80101a10 <iget>
80101df6:	83 ec 0c             	sub    $0xc,%esp
80101df9:	68 80 e8 10 80       	push   $0x8010e880
80101dfe:	e8 cd e5 ff ff       	call   801003d0 <panic>
80101e03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e10 <iupdate>:
80101e10:	55                   	push   %ebp
80101e11:	89 e5                	mov    %esp,%ebp
80101e13:	56                   	push   %esi
80101e14:	53                   	push   %ebx
80101e15:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e18:	83 ec 0c             	sub    $0xc,%esp
80101e1b:	ff 33                	pushl  (%ebx)
80101e1d:	83 c3 5c             	add    $0x5c,%ebx
80101e20:	e8 9b f2 ff ff       	call   801010c0 <getsuperblock>
80101e25:	5a                   	pop    %edx
80101e26:	8b 53 a8             	mov    -0x58(%ebx),%edx
80101e29:	59                   	pop    %ecx
80101e2a:	c1 ea 04             	shr    $0x4,%edx
80101e2d:	03 50 14             	add    0x14(%eax),%edx
80101e30:	52                   	push   %edx
80101e31:	ff 73 a4             	pushl  -0x5c(%ebx)
80101e34:	e8 a7 e3 ff ff       	call   801001e0 <bread>
80101e39:	89 c6                	mov    %eax,%esi
80101e3b:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101e3e:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
80101e42:	83 c4 0c             	add    $0xc,%esp
80101e45:	83 e0 0f             	and    $0xf,%eax
80101e48:	c1 e0 06             	shl    $0x6,%eax
80101e4b:	8d 44 06 60          	lea    0x60(%esi,%eax,1),%eax
80101e4f:	66 89 10             	mov    %dx,(%eax)
80101e52:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101e56:	83 c0 0c             	add    $0xc,%eax
80101e59:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101e5d:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
80101e61:	66 89 50 f8          	mov    %dx,-0x8(%eax)
80101e65:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101e69:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101e6d:	8b 53 fc             	mov    -0x4(%ebx),%edx
80101e70:	89 50 fc             	mov    %edx,-0x4(%eax)
80101e73:	6a 34                	push   $0x34
80101e75:	53                   	push   %ebx
80101e76:	50                   	push   %eax
80101e77:	e8 d4 45 00 00       	call   80106450 <memmove>
80101e7c:	89 34 24             	mov    %esi,(%esp)
80101e7f:	e8 3c 1b 00 00       	call   801039c0 <log_write>
80101e84:	89 75 08             	mov    %esi,0x8(%ebp)
80101e87:	83 c4 10             	add    $0x10,%esp
80101e8a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101e8d:	5b                   	pop    %ebx
80101e8e:	5e                   	pop    %esi
80101e8f:	5d                   	pop    %ebp
80101e90:	e9 ab e4 ff ff       	jmp    80100340 <brelse>
80101e95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ea0 <idup>:
80101ea0:	55                   	push   %ebp
80101ea1:	89 e5                	mov    %esp,%ebp
80101ea3:	53                   	push   %ebx
80101ea4:	83 ec 10             	sub    $0x10,%esp
80101ea7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101eaa:	68 60 dd 12 80       	push   $0x8012dd60
80101eaf:	e8 7c 43 00 00       	call   80106230 <acquire>
80101eb4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101eb8:	c7 04 24 60 dd 12 80 	movl   $0x8012dd60,(%esp)
80101ebf:	e8 8c 44 00 00       	call   80106350 <release>
80101ec4:	89 d8                	mov    %ebx,%eax
80101ec6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101ec9:	c9                   	leave  
80101eca:	c3                   	ret    
80101ecb:	90                   	nop
80101ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101ed0 <ilock>:
80101ed0:	55                   	push   %ebp
80101ed1:	89 e5                	mov    %esp,%ebp
80101ed3:	56                   	push   %esi
80101ed4:	53                   	push   %ebx
80101ed5:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101ed8:	85 db                	test   %ebx,%ebx
80101eda:	0f 84 bd 00 00 00    	je     80101f9d <ilock+0xcd>
80101ee0:	8b 43 08             	mov    0x8(%ebx),%eax
80101ee3:	85 c0                	test   %eax,%eax
80101ee5:	0f 8e b2 00 00 00    	jle    80101f9d <ilock+0xcd>
80101eeb:	8d 43 0c             	lea    0xc(%ebx),%eax
80101eee:	83 ec 0c             	sub    $0xc,%esp
80101ef1:	50                   	push   %eax
80101ef2:	e8 69 41 00 00       	call   80106060 <acquiresleep>
80101ef7:	8b 73 4c             	mov    0x4c(%ebx),%esi
80101efa:	83 c4 10             	add    $0x10,%esp
80101efd:	85 f6                	test   %esi,%esi
80101eff:	74 0f                	je     80101f10 <ilock+0x40>
80101f01:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f04:	5b                   	pop    %ebx
80101f05:	5e                   	pop    %esi
80101f06:	5d                   	pop    %ebp
80101f07:	c3                   	ret    
80101f08:	90                   	nop
80101f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f10:	83 ec 0c             	sub    $0xc,%esp
80101f13:	ff 33                	pushl  (%ebx)
80101f15:	e8 a6 f1 ff ff       	call   801010c0 <getsuperblock>
80101f1a:	5a                   	pop    %edx
80101f1b:	8b 53 04             	mov    0x4(%ebx),%edx
80101f1e:	59                   	pop    %ecx
80101f1f:	c1 ea 04             	shr    $0x4,%edx
80101f22:	03 50 14             	add    0x14(%eax),%edx
80101f25:	52                   	push   %edx
80101f26:	ff 33                	pushl  (%ebx)
80101f28:	e8 b3 e2 ff ff       	call   801001e0 <bread>
80101f2d:	89 c6                	mov    %eax,%esi
80101f2f:	8b 43 04             	mov    0x4(%ebx),%eax
80101f32:	83 c4 0c             	add    $0xc,%esp
80101f35:	83 e0 0f             	and    $0xf,%eax
80101f38:	c1 e0 06             	shl    $0x6,%eax
80101f3b:	8d 44 06 60          	lea    0x60(%esi,%eax,1),%eax
80101f3f:	0f b7 10             	movzwl (%eax),%edx
80101f42:	83 c0 0c             	add    $0xc,%eax
80101f45:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101f49:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101f4d:	66 89 53 52          	mov    %dx,0x52(%ebx)
80101f51:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
80101f55:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101f59:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101f5d:	66 89 53 56          	mov    %dx,0x56(%ebx)
80101f61:	8b 50 fc             	mov    -0x4(%eax),%edx
80101f64:	89 53 58             	mov    %edx,0x58(%ebx)
80101f67:	6a 34                	push   $0x34
80101f69:	50                   	push   %eax
80101f6a:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101f6d:	50                   	push   %eax
80101f6e:	e8 dd 44 00 00       	call   80106450 <memmove>
80101f73:	89 34 24             	mov    %esi,(%esp)
80101f76:	e8 c5 e3 ff ff       	call   80100340 <brelse>
80101f7b:	83 c4 10             	add    $0x10,%esp
80101f7e:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101f83:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101f8a:	0f 85 71 ff ff ff    	jne    80101f01 <ilock+0x31>
80101f90:	83 ec 0c             	sub    $0xc,%esp
80101f93:	68 98 e8 10 80       	push   $0x8010e898
80101f98:	e8 33 e4 ff ff       	call   801003d0 <panic>
80101f9d:	83 ec 0c             	sub    $0xc,%esp
80101fa0:	68 92 e8 10 80       	push   $0x8010e892
80101fa5:	e8 26 e4 ff ff       	call   801003d0 <panic>
80101faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101fb0 <iunlock>:
80101fb0:	55                   	push   %ebp
80101fb1:	89 e5                	mov    %esp,%ebp
80101fb3:	56                   	push   %esi
80101fb4:	53                   	push   %ebx
80101fb5:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101fb8:	85 db                	test   %ebx,%ebx
80101fba:	74 28                	je     80101fe4 <iunlock+0x34>
80101fbc:	8d 73 0c             	lea    0xc(%ebx),%esi
80101fbf:	83 ec 0c             	sub    $0xc,%esp
80101fc2:	56                   	push   %esi
80101fc3:	e8 38 41 00 00       	call   80106100 <holdingsleep>
80101fc8:	83 c4 10             	add    $0x10,%esp
80101fcb:	85 c0                	test   %eax,%eax
80101fcd:	74 15                	je     80101fe4 <iunlock+0x34>
80101fcf:	8b 43 08             	mov    0x8(%ebx),%eax
80101fd2:	85 c0                	test   %eax,%eax
80101fd4:	7e 0e                	jle    80101fe4 <iunlock+0x34>
80101fd6:	89 75 08             	mov    %esi,0x8(%ebp)
80101fd9:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fdc:	5b                   	pop    %ebx
80101fdd:	5e                   	pop    %esi
80101fde:	5d                   	pop    %ebp
80101fdf:	e9 dc 40 00 00       	jmp    801060c0 <releasesleep>
80101fe4:	83 ec 0c             	sub    $0xc,%esp
80101fe7:	68 a7 e8 10 80       	push   $0x8010e8a7
80101fec:	e8 df e3 ff ff       	call   801003d0 <panic>
80101ff1:	eb 0d                	jmp    80102000 <iput>
80101ff3:	90                   	nop
80101ff4:	90                   	nop
80101ff5:	90                   	nop
80101ff6:	90                   	nop
80101ff7:	90                   	nop
80101ff8:	90                   	nop
80101ff9:	90                   	nop
80101ffa:	90                   	nop
80101ffb:	90                   	nop
80101ffc:	90                   	nop
80101ffd:	90                   	nop
80101ffe:	90                   	nop
80101fff:	90                   	nop

80102000 <iput>:
80102000:	55                   	push   %ebp
80102001:	89 e5                	mov    %esp,%ebp
80102003:	57                   	push   %edi
80102004:	56                   	push   %esi
80102005:	53                   	push   %ebx
80102006:	83 ec 28             	sub    $0x28,%esp
80102009:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010200c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010200f:	57                   	push   %edi
80102010:	e8 4b 40 00 00       	call   80106060 <acquiresleep>
80102015:	8b 53 4c             	mov    0x4c(%ebx),%edx
80102018:	83 c4 10             	add    $0x10,%esp
8010201b:	85 d2                	test   %edx,%edx
8010201d:	74 07                	je     80102026 <iput+0x26>
8010201f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80102024:	74 4a                	je     80102070 <iput+0x70>
80102026:	83 ec 0c             	sub    $0xc,%esp
80102029:	57                   	push   %edi
8010202a:	e8 91 40 00 00       	call   801060c0 <releasesleep>
8010202f:	c7 04 24 60 dd 12 80 	movl   $0x8012dd60,(%esp)
80102036:	e8 f5 41 00 00       	call   80106230 <acquire>
8010203b:	8b 43 08             	mov    0x8(%ebx),%eax
8010203e:	83 c4 10             	add    $0x10,%esp
80102041:	83 e8 01             	sub    $0x1,%eax
80102044:	85 c0                	test   %eax,%eax
80102046:	89 43 08             	mov    %eax,0x8(%ebx)
80102049:	75 0d                	jne    80102058 <iput+0x58>
8010204b:	83 ec 0c             	sub    $0xc,%esp
8010204e:	ff 33                	pushl  (%ebx)
80102050:	e8 0b ef ff ff       	call   80100f60 <deviceput>
80102055:	83 c4 10             	add    $0x10,%esp
80102058:	c7 45 08 60 dd 12 80 	movl   $0x8012dd60,0x8(%ebp)
8010205f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102062:	5b                   	pop    %ebx
80102063:	5e                   	pop    %esi
80102064:	5f                   	pop    %edi
80102065:	5d                   	pop    %ebp
80102066:	e9 e5 42 00 00       	jmp    80106350 <release>
8010206b:	90                   	nop
8010206c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102070:	83 ec 0c             	sub    $0xc,%esp
80102073:	68 60 dd 12 80       	push   $0x8012dd60
80102078:	e8 b3 41 00 00       	call   80106230 <acquire>
8010207d:	8b 73 08             	mov    0x8(%ebx),%esi
80102080:	c7 04 24 60 dd 12 80 	movl   $0x8012dd60,(%esp)
80102087:	e8 c4 42 00 00       	call   80106350 <release>
8010208c:	83 c4 10             	add    $0x10,%esp
8010208f:	83 fe 01             	cmp    $0x1,%esi
80102092:	75 92                	jne    80102026 <iput+0x26>
80102094:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
8010209a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
8010209d:	8d 73 5c             	lea    0x5c(%ebx),%esi
801020a0:	89 cf                	mov    %ecx,%edi
801020a2:	eb 0b                	jmp    801020af <iput+0xaf>
801020a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801020a8:	83 c6 04             	add    $0x4,%esi
801020ab:	39 fe                	cmp    %edi,%esi
801020ad:	74 19                	je     801020c8 <iput+0xc8>
801020af:	8b 16                	mov    (%esi),%edx
801020b1:	85 d2                	test   %edx,%edx
801020b3:	74 f3                	je     801020a8 <iput+0xa8>
801020b5:	8b 03                	mov    (%ebx),%eax
801020b7:	e8 44 fb ff ff       	call   80101c00 <bfree>
801020bc:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801020c2:	eb e4                	jmp    801020a8 <iput+0xa8>
801020c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801020c8:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801020ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801020d1:	85 c0                	test   %eax,%eax
801020d3:	75 2d                	jne    80102102 <iput+0x102>
801020d5:	83 ec 0c             	sub    $0xc,%esp
801020d8:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801020df:	53                   	push   %ebx
801020e0:	e8 2b fd ff ff       	call   80101e10 <iupdate>
801020e5:	31 c0                	xor    %eax,%eax
801020e7:	66 89 43 50          	mov    %ax,0x50(%ebx)
801020eb:	89 1c 24             	mov    %ebx,(%esp)
801020ee:	e8 1d fd ff ff       	call   80101e10 <iupdate>
801020f3:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801020fa:	83 c4 10             	add    $0x10,%esp
801020fd:	e9 24 ff ff ff       	jmp    80102026 <iput+0x26>
80102102:	83 ec 08             	sub    $0x8,%esp
80102105:	50                   	push   %eax
80102106:	ff 33                	pushl  (%ebx)
80102108:	e8 d3 e0 ff ff       	call   801001e0 <bread>
8010210d:	8d 88 60 04 00 00    	lea    0x460(%eax),%ecx
80102113:	89 7d e0             	mov    %edi,-0x20(%ebp)
80102116:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102119:	8d 70 60             	lea    0x60(%eax),%esi
8010211c:	83 c4 10             	add    $0x10,%esp
8010211f:	89 cf                	mov    %ecx,%edi
80102121:	eb 0c                	jmp    8010212f <iput+0x12f>
80102123:	90                   	nop
80102124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102128:	83 c6 04             	add    $0x4,%esi
8010212b:	39 fe                	cmp    %edi,%esi
8010212d:	74 0f                	je     8010213e <iput+0x13e>
8010212f:	8b 16                	mov    (%esi),%edx
80102131:	85 d2                	test   %edx,%edx
80102133:	74 f3                	je     80102128 <iput+0x128>
80102135:	8b 03                	mov    (%ebx),%eax
80102137:	e8 c4 fa ff ff       	call   80101c00 <bfree>
8010213c:	eb ea                	jmp    80102128 <iput+0x128>
8010213e:	83 ec 0c             	sub    $0xc,%esp
80102141:	ff 75 e4             	pushl  -0x1c(%ebp)
80102144:	8b 7d e0             	mov    -0x20(%ebp),%edi
80102147:	e8 f4 e1 ff ff       	call   80100340 <brelse>
8010214c:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80102152:	8b 03                	mov    (%ebx),%eax
80102154:	e8 a7 fa ff ff       	call   80101c00 <bfree>
80102159:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80102160:	00 00 00 
80102163:	83 c4 10             	add    $0x10,%esp
80102166:	e9 6a ff ff ff       	jmp    801020d5 <iput+0xd5>
8010216b:	90                   	nop
8010216c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102170 <iunlockput>:
80102170:	55                   	push   %ebp
80102171:	89 e5                	mov    %esp,%ebp
80102173:	53                   	push   %ebx
80102174:	83 ec 10             	sub    $0x10,%esp
80102177:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010217a:	53                   	push   %ebx
8010217b:	e8 30 fe ff ff       	call   80101fb0 <iunlock>
80102180:	89 5d 08             	mov    %ebx,0x8(%ebp)
80102183:	83 c4 10             	add    $0x10,%esp
80102186:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102189:	c9                   	leave  
8010218a:	e9 71 fe ff ff       	jmp    80102000 <iput>
8010218f:	90                   	nop

80102190 <stati>:
80102190:	55                   	push   %ebp
80102191:	89 e5                	mov    %esp,%ebp
80102193:	8b 55 08             	mov    0x8(%ebp),%edx
80102196:	8b 45 0c             	mov    0xc(%ebp),%eax
80102199:	8b 0a                	mov    (%edx),%ecx
8010219b:	89 48 04             	mov    %ecx,0x4(%eax)
8010219e:	8b 4a 04             	mov    0x4(%edx),%ecx
801021a1:	89 48 08             	mov    %ecx,0x8(%eax)
801021a4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
801021a8:	66 89 08             	mov    %cx,(%eax)
801021ab:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
801021af:	66 89 48 0c          	mov    %cx,0xc(%eax)
801021b3:	8b 52 58             	mov    0x58(%edx),%edx
801021b6:	89 50 10             	mov    %edx,0x10(%eax)
801021b9:	5d                   	pop    %ebp
801021ba:	c3                   	ret    
801021bb:	90                   	nop
801021bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801021c0 <readi>:
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	57                   	push   %edi
801021c4:	56                   	push   %esi
801021c5:	53                   	push   %ebx
801021c6:	83 ec 1c             	sub    $0x1c,%esp
801021c9:	8b 45 08             	mov    0x8(%ebp),%eax
801021cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801021cf:	8b 75 10             	mov    0x10(%ebp),%esi
801021d2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
801021d7:	89 7d e0             	mov    %edi,-0x20(%ebp)
801021da:	8b 7d 14             	mov    0x14(%ebp),%edi
801021dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
801021e0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801021e3:	0f 84 a7 00 00 00    	je     80102290 <readi+0xd0>
801021e9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801021ec:	8b 40 58             	mov    0x58(%eax),%eax
801021ef:	39 f0                	cmp    %esi,%eax
801021f1:	0f 82 c9 00 00 00    	jb     801022c0 <readi+0x100>
801021f7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801021fa:	89 fa                	mov    %edi,%edx
801021fc:	01 f2                	add    %esi,%edx
801021fe:	0f 82 bc 00 00 00    	jb     801022c0 <readi+0x100>
80102204:	89 c1                	mov    %eax,%ecx
80102206:	29 f1                	sub    %esi,%ecx
80102208:	39 d0                	cmp    %edx,%eax
8010220a:	0f 43 cf             	cmovae %edi,%ecx
8010220d:	31 ff                	xor    %edi,%edi
8010220f:	85 c9                	test   %ecx,%ecx
80102211:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80102214:	74 6d                	je     80102283 <readi+0xc3>
80102216:	8d 76 00             	lea    0x0(%esi),%esi
80102219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102220:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80102223:	89 f2                	mov    %esi,%edx
80102225:	c1 ea 0a             	shr    $0xa,%edx
80102228:	89 d8                	mov    %ebx,%eax
8010222a:	e8 c1 f8 ff ff       	call   80101af0 <bmap>
8010222f:	83 ec 08             	sub    $0x8,%esp
80102232:	50                   	push   %eax
80102233:	ff 33                	pushl  (%ebx)
80102235:	bb 00 04 00 00       	mov    $0x400,%ebx
8010223a:	e8 a1 df ff ff       	call   801001e0 <bread>
8010223f:	89 c2                	mov    %eax,%edx
80102241:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102244:	89 f1                	mov    %esi,%ecx
80102246:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
8010224c:	83 c4 0c             	add    $0xc,%esp
8010224f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80102252:	29 cb                	sub    %ecx,%ebx
80102254:	29 f8                	sub    %edi,%eax
80102256:	39 c3                	cmp    %eax,%ebx
80102258:	0f 47 d8             	cmova  %eax,%ebx
8010225b:	8d 44 0a 60          	lea    0x60(%edx,%ecx,1),%eax
8010225f:	53                   	push   %ebx
80102260:	01 df                	add    %ebx,%edi
80102262:	01 de                	add    %ebx,%esi
80102264:	50                   	push   %eax
80102265:	ff 75 e0             	pushl  -0x20(%ebp)
80102268:	e8 e3 41 00 00       	call   80106450 <memmove>
8010226d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80102270:	89 14 24             	mov    %edx,(%esp)
80102273:	e8 c8 e0 ff ff       	call   80100340 <brelse>
80102278:	01 5d e0             	add    %ebx,-0x20(%ebp)
8010227b:	83 c4 10             	add    $0x10,%esp
8010227e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80102281:	77 9d                	ja     80102220 <readi+0x60>
80102283:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102286:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102289:	5b                   	pop    %ebx
8010228a:	5e                   	pop    %esi
8010228b:	5f                   	pop    %edi
8010228c:	5d                   	pop    %ebp
8010228d:	c3                   	ret    
8010228e:	66 90                	xchg   %ax,%ax
80102290:	89 c6                	mov    %eax,%esi
80102292:	0f bf 40 52          	movswl 0x52(%eax),%eax
80102296:	66 83 f8 09          	cmp    $0x9,%ax
8010229a:	77 24                	ja     801022c0 <readi+0x100>
8010229c:	66 83 7e 54 03       	cmpw   $0x3,0x54(%esi)
801022a1:	77 1d                	ja     801022c0 <readi+0x100>
801022a3:	8b 04 c5 00 dd 12 80 	mov    -0x7fed2300(,%eax,8),%eax
801022aa:	85 c0                	test   %eax,%eax
801022ac:	74 12                	je     801022c0 <readi+0x100>
801022ae:	89 7d 10             	mov    %edi,0x10(%ebp)
801022b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801022b4:	5b                   	pop    %ebx
801022b5:	5e                   	pop    %esi
801022b6:	5f                   	pop    %edi
801022b7:	5d                   	pop    %ebp
801022b8:	ff e0                	jmp    *%eax
801022ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801022c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801022c5:	eb bf                	jmp    80102286 <readi+0xc6>
801022c7:	89 f6                	mov    %esi,%esi
801022c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022d0 <writei>:
801022d0:	55                   	push   %ebp
801022d1:	89 e5                	mov    %esp,%ebp
801022d3:	57                   	push   %edi
801022d4:	56                   	push   %esi
801022d5:	53                   	push   %ebx
801022d6:	83 ec 1c             	sub    $0x1c,%esp
801022d9:	8b 45 08             	mov    0x8(%ebp),%eax
801022dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801022df:	8b 7d 14             	mov    0x14(%ebp),%edi
801022e2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
801022e7:	89 75 dc             	mov    %esi,-0x24(%ebp)
801022ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
801022ed:	8b 75 10             	mov    0x10(%ebp),%esi
801022f0:	89 7d e0             	mov    %edi,-0x20(%ebp)
801022f3:	0f 84 b7 00 00 00    	je     801023b0 <writei+0xe0>
801022f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801022fc:	39 70 58             	cmp    %esi,0x58(%eax)
801022ff:	0f 82 f3 00 00 00    	jb     801023f8 <writei+0x128>
80102305:	8b 7d e0             	mov    -0x20(%ebp),%edi
80102308:	89 f8                	mov    %edi,%eax
8010230a:	01 f0                	add    %esi,%eax
8010230c:	3d 00 30 04 00       	cmp    $0x43000,%eax
80102311:	0f 87 e1 00 00 00    	ja     801023f8 <writei+0x128>
80102317:	39 c6                	cmp    %eax,%esi
80102319:	0f 87 d9 00 00 00    	ja     801023f8 <writei+0x128>
8010231f:	85 ff                	test   %edi,%edi
80102321:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80102328:	74 78                	je     801023a2 <writei+0xd2>
8010232a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102330:	8b 7d d8             	mov    -0x28(%ebp),%edi
80102333:	89 f2                	mov    %esi,%edx
80102335:	bb 00 04 00 00       	mov    $0x400,%ebx
8010233a:	c1 ea 0a             	shr    $0xa,%edx
8010233d:	89 f8                	mov    %edi,%eax
8010233f:	e8 ac f7 ff ff       	call   80101af0 <bmap>
80102344:	83 ec 08             	sub    $0x8,%esp
80102347:	50                   	push   %eax
80102348:	ff 37                	pushl  (%edi)
8010234a:	e8 91 de ff ff       	call   801001e0 <bread>
8010234f:	89 c7                	mov    %eax,%edi
80102351:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102354:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80102357:	89 f1                	mov    %esi,%ecx
80102359:	83 c4 0c             	add    $0xc,%esp
8010235c:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
80102362:	29 cb                	sub    %ecx,%ebx
80102364:	39 c3                	cmp    %eax,%ebx
80102366:	0f 47 d8             	cmova  %eax,%ebx
80102369:	8d 44 0f 60          	lea    0x60(%edi,%ecx,1),%eax
8010236d:	53                   	push   %ebx
8010236e:	ff 75 dc             	pushl  -0x24(%ebp)
80102371:	01 de                	add    %ebx,%esi
80102373:	50                   	push   %eax
80102374:	e8 d7 40 00 00       	call   80106450 <memmove>
80102379:	89 3c 24             	mov    %edi,(%esp)
8010237c:	e8 3f 16 00 00       	call   801039c0 <log_write>
80102381:	89 3c 24             	mov    %edi,(%esp)
80102384:	e8 b7 df ff ff       	call   80100340 <brelse>
80102389:	01 5d e4             	add    %ebx,-0x1c(%ebp)
8010238c:	01 5d dc             	add    %ebx,-0x24(%ebp)
8010238f:	83 c4 10             	add    $0x10,%esp
80102392:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80102395:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80102398:	77 96                	ja     80102330 <writei+0x60>
8010239a:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010239d:	3b 70 58             	cmp    0x58(%eax),%esi
801023a0:	77 3e                	ja     801023e0 <writei+0x110>
801023a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801023a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801023a8:	5b                   	pop    %ebx
801023a9:	5e                   	pop    %esi
801023aa:	5f                   	pop    %edi
801023ab:	5d                   	pop    %ebp
801023ac:	c3                   	ret    
801023ad:	8d 76 00             	lea    0x0(%esi),%esi
801023b0:	89 c6                	mov    %eax,%esi
801023b2:	0f bf 40 52          	movswl 0x52(%eax),%eax
801023b6:	66 83 f8 09          	cmp    $0x9,%ax
801023ba:	77 3c                	ja     801023f8 <writei+0x128>
801023bc:	66 83 7e 54 03       	cmpw   $0x3,0x54(%esi)
801023c1:	77 35                	ja     801023f8 <writei+0x128>
801023c3:	8b 04 c5 04 dd 12 80 	mov    -0x7fed22fc(,%eax,8),%eax
801023ca:	85 c0                	test   %eax,%eax
801023cc:	74 2a                	je     801023f8 <writei+0x128>
801023ce:	89 7d 10             	mov    %edi,0x10(%ebp)
801023d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801023d4:	5b                   	pop    %ebx
801023d5:	5e                   	pop    %esi
801023d6:	5f                   	pop    %edi
801023d7:	5d                   	pop    %ebp
801023d8:	ff e0                	jmp    *%eax
801023da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801023e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
801023e3:	83 ec 0c             	sub    $0xc,%esp
801023e6:	89 70 58             	mov    %esi,0x58(%eax)
801023e9:	50                   	push   %eax
801023ea:	e8 21 fa ff ff       	call   80101e10 <iupdate>
801023ef:	83 c4 10             	add    $0x10,%esp
801023f2:	eb ae                	jmp    801023a2 <writei+0xd2>
801023f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801023f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801023fd:	eb a6                	jmp    801023a5 <writei+0xd5>
801023ff:	90                   	nop

80102400 <namecmp>:
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	83 ec 0c             	sub    $0xc,%esp
80102406:	6a 0e                	push   $0xe
80102408:	ff 75 0c             	pushl  0xc(%ebp)
8010240b:	ff 75 08             	pushl  0x8(%ebp)
8010240e:	e8 bd 40 00 00       	call   801064d0 <strncmp>
80102413:	c9                   	leave  
80102414:	c3                   	ret    
80102415:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102420 <dirlookup>:
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	57                   	push   %edi
80102424:	56                   	push   %esi
80102425:	53                   	push   %ebx
80102426:	83 ec 1c             	sub    $0x1c,%esp
80102429:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010242c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80102431:	0f 85 80 00 00 00    	jne    801024b7 <dirlookup+0x97>
80102437:	8b 53 58             	mov    0x58(%ebx),%edx
8010243a:	31 ff                	xor    %edi,%edi
8010243c:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010243f:	85 d2                	test   %edx,%edx
80102441:	75 0d                	jne    80102450 <dirlookup+0x30>
80102443:	eb 5b                	jmp    801024a0 <dirlookup+0x80>
80102445:	8d 76 00             	lea    0x0(%esi),%esi
80102448:	83 c7 10             	add    $0x10,%edi
8010244b:	39 7b 58             	cmp    %edi,0x58(%ebx)
8010244e:	76 50                	jbe    801024a0 <dirlookup+0x80>
80102450:	6a 10                	push   $0x10
80102452:	57                   	push   %edi
80102453:	56                   	push   %esi
80102454:	53                   	push   %ebx
80102455:	e8 66 fd ff ff       	call   801021c0 <readi>
8010245a:	83 c4 10             	add    $0x10,%esp
8010245d:	83 f8 10             	cmp    $0x10,%eax
80102460:	75 48                	jne    801024aa <dirlookup+0x8a>
80102462:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80102467:	74 df                	je     80102448 <dirlookup+0x28>
80102469:	8d 45 da             	lea    -0x26(%ebp),%eax
8010246c:	83 ec 04             	sub    $0x4,%esp
8010246f:	6a 0e                	push   $0xe
80102471:	50                   	push   %eax
80102472:	ff 75 0c             	pushl  0xc(%ebp)
80102475:	e8 56 40 00 00       	call   801064d0 <strncmp>
8010247a:	83 c4 10             	add    $0x10,%esp
8010247d:	85 c0                	test   %eax,%eax
8010247f:	75 c7                	jne    80102448 <dirlookup+0x28>
80102481:	8b 45 10             	mov    0x10(%ebp),%eax
80102484:	85 c0                	test   %eax,%eax
80102486:	74 05                	je     8010248d <dirlookup+0x6d>
80102488:	8b 45 10             	mov    0x10(%ebp),%eax
8010248b:	89 38                	mov    %edi,(%eax)
8010248d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80102491:	8b 03                	mov    (%ebx),%eax
80102493:	e8 78 f5 ff ff       	call   80101a10 <iget>
80102498:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010249b:	5b                   	pop    %ebx
8010249c:	5e                   	pop    %esi
8010249d:	5f                   	pop    %edi
8010249e:	5d                   	pop    %ebp
8010249f:	c3                   	ret    
801024a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801024a3:	31 c0                	xor    %eax,%eax
801024a5:	5b                   	pop    %ebx
801024a6:	5e                   	pop    %esi
801024a7:	5f                   	pop    %edi
801024a8:	5d                   	pop    %ebp
801024a9:	c3                   	ret    
801024aa:	83 ec 0c             	sub    $0xc,%esp
801024ad:	68 c1 e8 10 80       	push   $0x8010e8c1
801024b2:	e8 19 df ff ff       	call   801003d0 <panic>
801024b7:	83 ec 0c             	sub    $0xc,%esp
801024ba:	68 af e8 10 80       	push   $0x8010e8af
801024bf:	e8 0c df ff ff       	call   801003d0 <panic>
801024c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801024d0 <namex>:
801024d0:	55                   	push   %ebp
801024d1:	89 e5                	mov    %esp,%ebp
801024d3:	57                   	push   %edi
801024d4:	56                   	push   %esi
801024d5:	53                   	push   %ebx
801024d6:	89 c3                	mov    %eax,%ebx
801024d8:	83 ec 2c             	sub    $0x2c,%esp
801024db:	80 38 2f             	cmpb   $0x2f,(%eax)
801024de:	89 55 d4             	mov    %edx,-0x2c(%ebp)
801024e1:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801024e4:	0f 84 2b 02 00 00    	je     80102715 <namex+0x245>
801024ea:	e8 34 2d 00 00       	call   80105223 <myproc>
801024ef:	83 ec 0c             	sub    $0xc,%esp
801024f2:	ff b0 8c 00 00 00    	pushl  0x8c(%eax)
801024f8:	e8 3c 19 00 00       	call   80103e39 <mntdup>
801024fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102500:	e8 1e 2d 00 00       	call   80105223 <myproc>
80102505:	8b b8 88 00 00 00    	mov    0x88(%eax),%edi
8010250b:	c7 04 24 60 dd 12 80 	movl   $0x8012dd60,(%esp)
80102512:	e8 19 3d 00 00       	call   80106230 <acquire>
80102517:	83 47 08 01          	addl   $0x1,0x8(%edi)
8010251b:	c7 04 24 60 dd 12 80 	movl   $0x8012dd60,(%esp)
80102522:	e8 29 3e 00 00       	call   80106350 <release>
80102527:	83 c4 10             	add    $0x10,%esp
8010252a:	eb 07                	jmp    80102533 <namex+0x63>
8010252c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102530:	83 c3 01             	add    $0x1,%ebx
80102533:	0f b6 03             	movzbl (%ebx),%eax
80102536:	3c 2f                	cmp    $0x2f,%al
80102538:	74 f6                	je     80102530 <namex+0x60>
8010253a:	84 c0                	test   %al,%al
8010253c:	0f 84 60 01 00 00    	je     801026a2 <namex+0x1d2>
80102542:	0f b6 03             	movzbl (%ebx),%eax
80102545:	89 de                	mov    %ebx,%esi
80102547:	84 c0                	test   %al,%al
80102549:	0f 84 2a 01 00 00    	je     80102679 <namex+0x1a9>
8010254f:	3c 2f                	cmp    $0x2f,%al
80102551:	75 11                	jne    80102564 <namex+0x94>
80102553:	e9 21 01 00 00       	jmp    80102679 <namex+0x1a9>
80102558:	90                   	nop
80102559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102560:	84 c0                	test   %al,%al
80102562:	74 0a                	je     8010256e <namex+0x9e>
80102564:	83 c6 01             	add    $0x1,%esi
80102567:	0f b6 06             	movzbl (%esi),%eax
8010256a:	3c 2f                	cmp    $0x2f,%al
8010256c:	75 f2                	jne    80102560 <namex+0x90>
8010256e:	89 f2                	mov    %esi,%edx
80102570:	29 da                	sub    %ebx,%edx
80102572:	83 fa 0d             	cmp    $0xd,%edx
80102575:	0f 8e 05 01 00 00    	jle    80102680 <namex+0x1b0>
8010257b:	83 ec 04             	sub    $0x4,%esp
8010257e:	6a 0e                	push   $0xe
80102580:	53                   	push   %ebx
80102581:	89 f3                	mov    %esi,%ebx
80102583:	ff 75 e0             	pushl  -0x20(%ebp)
80102586:	e8 c5 3e 00 00       	call   80106450 <memmove>
8010258b:	83 c4 10             	add    $0x10,%esp
8010258e:	80 3e 2f             	cmpb   $0x2f,(%esi)
80102591:	75 0d                	jne    801025a0 <namex+0xd0>
80102593:	90                   	nop
80102594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102598:	83 c3 01             	add    $0x1,%ebx
8010259b:	80 3b 2f             	cmpb   $0x2f,(%ebx)
8010259e:	74 f8                	je     80102598 <namex+0xc8>
801025a0:	83 ec 0c             	sub    $0xc,%esp
801025a3:	57                   	push   %edi
801025a4:	e8 27 f9 ff ff       	call   80101ed0 <ilock>
801025a9:	83 c4 10             	add    $0x10,%esp
801025ac:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
801025b1:	0f 85 37 01 00 00    	jne    801026ee <namex+0x21e>
801025b7:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
801025ba:	85 c9                	test   %ecx,%ecx
801025bc:	74 09                	je     801025c7 <namex+0xf7>
801025be:	80 3b 00             	cmpb   $0x0,(%ebx)
801025c1:	0f 84 78 01 00 00    	je     8010273f <namex+0x26f>
801025c7:	83 ec 04             	sub    $0x4,%esp
801025ca:	6a 00                	push   $0x0
801025cc:	ff 75 e0             	pushl  -0x20(%ebp)
801025cf:	57                   	push   %edi
801025d0:	e8 4b fe ff ff       	call   80102420 <dirlookup>
801025d5:	83 c4 10             	add    $0x10,%esp
801025d8:	85 c0                	test   %eax,%eax
801025da:	89 c6                	mov    %eax,%esi
801025dc:	0f 84 0c 01 00 00    	je     801026ee <namex+0x21e>
801025e2:	83 ec 0c             	sub    $0xc,%esp
801025e5:	8b 47 04             	mov    0x4(%edi),%eax
801025e8:	57                   	push   %edi
801025e9:	89 45 dc             	mov    %eax,-0x24(%ebp)
801025ec:	e8 bf f9 ff ff       	call   80101fb0 <iunlock>
801025f1:	89 3c 24             	mov    %edi,(%esp)
801025f4:	e8 07 fa ff ff       	call   80102000 <iput>
801025f9:	83 c4 0c             	add    $0xc,%esp
801025fc:	6a 0e                	push   $0xe
801025fe:	68 d0 e8 10 80       	push   $0x8010e8d0
80102603:	ff 75 e0             	pushl  -0x20(%ebp)
80102606:	e8 c5 3e 00 00       	call   801064d0 <strncmp>
8010260b:	83 c4 10             	add    $0x10,%esp
8010260e:	85 c0                	test   %eax,%eax
80102610:	75 13                	jne    80102625 <namex+0x155>
80102612:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102615:	83 78 0c 01          	cmpl   $0x1,0xc(%eax)
80102619:	74 0a                	je     80102625 <namex+0x155>
8010261b:	83 7d dc 01          	cmpl   $0x1,-0x24(%ebp)
8010261f:	0f 84 9a 00 00 00    	je     801026bf <namex+0x1ef>
80102625:	83 ec 08             	sub    $0x8,%esp
80102628:	ff 75 e4             	pushl  -0x1c(%ebp)
8010262b:	56                   	push   %esi
8010262c:	e8 5f 1b 00 00       	call   80104190 <mntlookup>
80102631:	83 c4 10             	add    $0x10,%esp
80102634:	89 c1                	mov    %eax,%ecx
80102636:	ba 01 00 00 00       	mov    $0x1,%edx
8010263b:	85 c9                	test   %ecx,%ecx
8010263d:	89 55 d8             	mov    %edx,-0x28(%ebp)
80102640:	89 f7                	mov    %esi,%edi
80102642:	89 4d dc             	mov    %ecx,-0x24(%ebp)
80102645:	0f 84 e8 fe ff ff    	je     80102533 <namex+0x63>
8010264b:	83 ec 0c             	sub    $0xc,%esp
8010264e:	ff 75 e4             	pushl  -0x1c(%ebp)
80102651:	e8 85 18 00 00       	call   80103edb <mntput>
80102656:	89 34 24             	mov    %esi,(%esp)
80102659:	e8 a2 f9 ff ff       	call   80102000 <iput>
8010265e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80102661:	8b 55 d8             	mov    -0x28(%ebp),%edx
80102664:	8b 41 0c             	mov    0xc(%ecx),%eax
80102667:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010266a:	e8 a1 f3 ff ff       	call   80101a10 <iget>
8010266f:	83 c4 10             	add    $0x10,%esp
80102672:	89 c7                	mov    %eax,%edi
80102674:	e9 ba fe ff ff       	jmp    80102533 <namex+0x63>
80102679:	31 d2                	xor    %edx,%edx
8010267b:	90                   	nop
8010267c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102680:	83 ec 04             	sub    $0x4,%esp
80102683:	89 55 dc             	mov    %edx,-0x24(%ebp)
80102686:	52                   	push   %edx
80102687:	53                   	push   %ebx
80102688:	8b 5d e0             	mov    -0x20(%ebp),%ebx
8010268b:	53                   	push   %ebx
8010268c:	e8 bf 3d 00 00       	call   80106450 <memmove>
80102691:	8b 55 dc             	mov    -0x24(%ebp),%edx
80102694:	83 c4 10             	add    $0x10,%esp
80102697:	c6 04 13 00          	movb   $0x0,(%ebx,%edx,1)
8010269b:	89 f3                	mov    %esi,%ebx
8010269d:	e9 ec fe ff ff       	jmp    8010258e <namex+0xbe>
801026a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801026a5:	85 c0                	test   %eax,%eax
801026a7:	0f 85 b0 00 00 00    	jne    8010275d <namex+0x28d>
801026ad:	8b 45 08             	mov    0x8(%ebp),%eax
801026b0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801026b3:	89 08                	mov    %ecx,(%eax)
801026b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801026b8:	89 f8                	mov    %edi,%eax
801026ba:	5b                   	pop    %ebx
801026bb:	5e                   	pop    %esi
801026bc:	5f                   	pop    %edi
801026bd:	5d                   	pop    %ebp
801026be:	c3                   	ret    
801026bf:	83 ec 0c             	sub    $0xc,%esp
801026c2:	ff 30                	pushl  (%eax)
801026c4:	89 c7                	mov    %eax,%edi
801026c6:	e8 6e 17 00 00       	call   80103e39 <mntdup>
801026cb:	83 c4 0c             	add    $0xc,%esp
801026ce:	89 45 dc             	mov    %eax,-0x24(%ebp)
801026d1:	6a 00                	push   $0x0
801026d3:	68 d0 e8 10 80       	push   $0x8010e8d0
801026d8:	ff 77 04             	pushl  0x4(%edi)
801026db:	e8 40 fd ff ff       	call   80102420 <dirlookup>
801026e0:	83 c4 10             	add    $0x10,%esp
801026e3:	8b 50 04             	mov    0x4(%eax),%edx
801026e6:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801026e9:	e9 4d ff ff ff       	jmp    8010263b <namex+0x16b>
801026ee:	83 ec 0c             	sub    $0xc,%esp
801026f1:	57                   	push   %edi
801026f2:	e8 b9 f8 ff ff       	call   80101fb0 <iunlock>
801026f7:	89 3c 24             	mov    %edi,(%esp)
801026fa:	e8 01 f9 ff ff       	call   80102000 <iput>
801026ff:	5a                   	pop    %edx
80102700:	ff 75 e4             	pushl  -0x1c(%ebp)
80102703:	e8 d3 17 00 00       	call   80103edb <mntput>
80102708:	83 c4 10             	add    $0x10,%esp
8010270b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010270e:	31 c0                	xor    %eax,%eax
80102710:	5b                   	pop    %ebx
80102711:	5e                   	pop    %esi
80102712:	5f                   	pop    %edi
80102713:	5d                   	pop    %ebp
80102714:	c3                   	ret    
80102715:	e8 ad 16 00 00       	call   80103dc7 <getrootmount>
8010271a:	83 ec 0c             	sub    $0xc,%esp
8010271d:	50                   	push   %eax
8010271e:	e8 16 17 00 00       	call   80103e39 <mntdup>
80102723:	ba 01 00 00 00       	mov    $0x1,%edx
80102728:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010272b:	b8 01 00 00 00       	mov    $0x1,%eax
80102730:	e8 db f2 ff ff       	call   80101a10 <iget>
80102735:	83 c4 10             	add    $0x10,%esp
80102738:	89 c7                	mov    %eax,%edi
8010273a:	e9 f4 fd ff ff       	jmp    80102533 <namex+0x63>
8010273f:	83 ec 0c             	sub    $0xc,%esp
80102742:	57                   	push   %edi
80102743:	e8 68 f8 ff ff       	call   80101fb0 <iunlock>
80102748:	8b 45 08             	mov    0x8(%ebp),%eax
8010274b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010274e:	83 c4 10             	add    $0x10,%esp
80102751:	89 08                	mov    %ecx,(%eax)
80102753:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102756:	89 f8                	mov    %edi,%eax
80102758:	5b                   	pop    %ebx
80102759:	5e                   	pop    %esi
8010275a:	5f                   	pop    %edi
8010275b:	5d                   	pop    %ebp
8010275c:	c3                   	ret    
8010275d:	83 ec 0c             	sub    $0xc,%esp
80102760:	57                   	push   %edi
80102761:	eb 97                	jmp    801026fa <namex+0x22a>
80102763:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102770 <dirlink>:
80102770:	55                   	push   %ebp
80102771:	89 e5                	mov    %esp,%ebp
80102773:	57                   	push   %edi
80102774:	56                   	push   %esi
80102775:	53                   	push   %ebx
80102776:	83 ec 20             	sub    $0x20,%esp
80102779:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010277c:	6a 00                	push   $0x0
8010277e:	ff 75 0c             	pushl  0xc(%ebp)
80102781:	53                   	push   %ebx
80102782:	e8 99 fc ff ff       	call   80102420 <dirlookup>
80102787:	83 c4 10             	add    $0x10,%esp
8010278a:	85 c0                	test   %eax,%eax
8010278c:	75 67                	jne    801027f5 <dirlink+0x85>
8010278e:	8b 7b 58             	mov    0x58(%ebx),%edi
80102791:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102794:	85 ff                	test   %edi,%edi
80102796:	74 29                	je     801027c1 <dirlink+0x51>
80102798:	31 ff                	xor    %edi,%edi
8010279a:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010279d:	eb 09                	jmp    801027a8 <dirlink+0x38>
8010279f:	90                   	nop
801027a0:	83 c7 10             	add    $0x10,%edi
801027a3:	39 7b 58             	cmp    %edi,0x58(%ebx)
801027a6:	76 19                	jbe    801027c1 <dirlink+0x51>
801027a8:	6a 10                	push   $0x10
801027aa:	57                   	push   %edi
801027ab:	56                   	push   %esi
801027ac:	53                   	push   %ebx
801027ad:	e8 0e fa ff ff       	call   801021c0 <readi>
801027b2:	83 c4 10             	add    $0x10,%esp
801027b5:	83 f8 10             	cmp    $0x10,%eax
801027b8:	75 4e                	jne    80102808 <dirlink+0x98>
801027ba:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801027bf:	75 df                	jne    801027a0 <dirlink+0x30>
801027c1:	8d 45 da             	lea    -0x26(%ebp),%eax
801027c4:	83 ec 04             	sub    $0x4,%esp
801027c7:	6a 0e                	push   $0xe
801027c9:	ff 75 0c             	pushl  0xc(%ebp)
801027cc:	50                   	push   %eax
801027cd:	e8 be 3d 00 00       	call   80106590 <strncpy>
801027d2:	8b 45 10             	mov    0x10(%ebp),%eax
801027d5:	6a 10                	push   $0x10
801027d7:	57                   	push   %edi
801027d8:	56                   	push   %esi
801027d9:	53                   	push   %ebx
801027da:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
801027de:	e8 ed fa ff ff       	call   801022d0 <writei>
801027e3:	83 c4 20             	add    $0x20,%esp
801027e6:	83 f8 10             	cmp    $0x10,%eax
801027e9:	75 2a                	jne    80102815 <dirlink+0xa5>
801027eb:	31 c0                	xor    %eax,%eax
801027ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801027f0:	5b                   	pop    %ebx
801027f1:	5e                   	pop    %esi
801027f2:	5f                   	pop    %edi
801027f3:	5d                   	pop    %ebp
801027f4:	c3                   	ret    
801027f5:	83 ec 0c             	sub    $0xc,%esp
801027f8:	50                   	push   %eax
801027f9:	e8 02 f8 ff ff       	call   80102000 <iput>
801027fe:	83 c4 10             	add    $0x10,%esp
80102801:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102806:	eb e5                	jmp    801027ed <dirlink+0x7d>
80102808:	83 ec 0c             	sub    $0xc,%esp
8010280b:	68 d3 e8 10 80       	push   $0x8010e8d3
80102810:	e8 bb db ff ff       	call   801003d0 <panic>
80102815:	83 ec 0c             	sub    $0xc,%esp
80102818:	68 07 f1 10 80       	push   $0x8010f107
8010281d:	e8 ae db ff ff       	call   801003d0 <panic>
80102822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102830 <initprocessroot>:
80102830:	55                   	push   %ebp
80102831:	89 e5                	mov    %esp,%ebp
80102833:	53                   	push   %ebx
80102834:	83 ec 04             	sub    $0x4,%esp
80102837:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010283a:	e8 7e 15 00 00       	call   80103dbd <getinitialrootmount>
8010283f:	ba 01 00 00 00       	mov    $0x1,%edx
80102844:	89 03                	mov    %eax,(%ebx)
80102846:	83 c4 04             	add    $0x4,%esp
80102849:	b8 01 00 00 00       	mov    $0x1,%eax
8010284e:	5b                   	pop    %ebx
8010284f:	5d                   	pop    %ebp
80102850:	e9 bb f1 ff ff       	jmp    80101a10 <iget>
80102855:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102860 <namei>:
80102860:	55                   	push   %ebp
80102861:	31 d2                	xor    %edx,%edx
80102863:	89 e5                	mov    %esp,%ebp
80102865:	53                   	push   %ebx
80102866:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80102869:	8d 4d ea             	lea    -0x16(%ebp),%ecx
8010286c:	83 ec 30             	sub    $0x30,%esp
8010286f:	50                   	push   %eax
80102870:	8b 45 08             	mov    0x8(%ebp),%eax
80102873:	e8 58 fc ff ff       	call   801024d0 <namex>
80102878:	83 c4 10             	add    $0x10,%esp
8010287b:	85 c0                	test   %eax,%eax
8010287d:	89 c3                	mov    %eax,%ebx
8010287f:	74 0e                	je     8010288f <namei+0x2f>
80102881:	83 ec 0c             	sub    $0xc,%esp
80102884:	ff 75 e4             	pushl  -0x1c(%ebp)
80102887:	e8 4f 16 00 00       	call   80103edb <mntput>
8010288c:	83 c4 10             	add    $0x10,%esp
8010288f:	89 d8                	mov    %ebx,%eax
80102891:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102894:	c9                   	leave  
80102895:	c3                   	ret    
80102896:	8d 76 00             	lea    0x0(%esi),%esi
80102899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801028a0 <nameiparent>:
801028a0:	55                   	push   %ebp
801028a1:	ba 01 00 00 00       	mov    $0x1,%edx
801028a6:	89 e5                	mov    %esp,%ebp
801028a8:	53                   	push   %ebx
801028a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801028ac:	83 ec 20             	sub    $0x20,%esp
801028af:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801028b2:	50                   	push   %eax
801028b3:	8b 45 08             	mov    0x8(%ebp),%eax
801028b6:	e8 15 fc ff ff       	call   801024d0 <namex>
801028bb:	83 c4 10             	add    $0x10,%esp
801028be:	85 c0                	test   %eax,%eax
801028c0:	89 c3                	mov    %eax,%ebx
801028c2:	74 0e                	je     801028d2 <nameiparent+0x32>
801028c4:	83 ec 0c             	sub    $0xc,%esp
801028c7:	ff 75 f4             	pushl  -0xc(%ebp)
801028ca:	e8 0c 16 00 00       	call   80103edb <mntput>
801028cf:	83 c4 10             	add    $0x10,%esp
801028d2:	89 d8                	mov    %ebx,%eax
801028d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801028d7:	c9                   	leave  
801028d8:	c3                   	ret    
801028d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801028e0 <nameiparentmount>:
801028e0:	55                   	push   %ebp
801028e1:	89 e5                	mov    %esp,%ebp
801028e3:	8b 55 10             	mov    0x10(%ebp),%edx
801028e6:	8b 45 08             	mov    0x8(%ebp),%eax
801028e9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801028ec:	89 55 08             	mov    %edx,0x8(%ebp)
801028ef:	ba 01 00 00 00       	mov    $0x1,%edx
801028f4:	5d                   	pop    %ebp
801028f5:	e9 d6 fb ff ff       	jmp    801024d0 <namex>
801028fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102900 <nameimount>:
80102900:	55                   	push   %ebp
80102901:	31 d2                	xor    %edx,%edx
80102903:	89 e5                	mov    %esp,%ebp
80102905:	83 ec 24             	sub    $0x24,%esp
80102908:	8b 45 08             	mov    0x8(%ebp),%eax
8010290b:	ff 75 0c             	pushl  0xc(%ebp)
8010290e:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80102911:	e8 ba fb ff ff       	call   801024d0 <namex>
80102916:	c9                   	leave  
80102917:	c3                   	ret    
80102918:	66 90                	xchg   %ax,%ax
8010291a:	66 90                	xchg   %ax,%ax
8010291c:	66 90                	xchg   %ax,%ax
8010291e:	66 90                	xchg   %ax,%ax

80102920 <idestart>:
80102920:	55                   	push   %ebp
80102921:	85 c0                	test   %eax,%eax
80102923:	89 e5                	mov    %esp,%ebp
80102925:	56                   	push   %esi
80102926:	53                   	push   %ebx
80102927:	0f 84 ad 00 00 00    	je     801029da <idestart+0xba>
8010292d:	8b 48 08             	mov    0x8(%eax),%ecx
80102930:	89 c3                	mov    %eax,%ebx
80102932:	81 f9 cf 07 00 00    	cmp    $0x7cf,%ecx
80102938:	0f 87 8f 00 00 00    	ja     801029cd <idestart+0xad>
8010293e:	01 c9                	add    %ecx,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102940:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102945:	8d 76 00             	lea    0x0(%esi),%esi
80102948:	ec                   	in     (%dx),%al
80102949:	83 e0 c0             	and    $0xffffffc0,%eax
8010294c:	3c 40                	cmp    $0x40,%al
8010294e:	75 f8                	jne    80102948 <idestart+0x28>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102950:	31 f6                	xor    %esi,%esi
80102952:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102957:	89 f0                	mov    %esi,%eax
80102959:	ee                   	out    %al,(%dx)
8010295a:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010295f:	b8 02 00 00 00       	mov    $0x2,%eax
80102964:	ee                   	out    %al,(%dx)
80102965:	ba f3 01 00 00       	mov    $0x1f3,%edx
8010296a:	89 c8                	mov    %ecx,%eax
8010296c:	ee                   	out    %al,(%dx)
8010296d:	89 c8                	mov    %ecx,%eax
8010296f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80102974:	c1 f8 08             	sar    $0x8,%eax
80102977:	ee                   	out    %al,(%dx)
80102978:	ba f5 01 00 00       	mov    $0x1f5,%edx
8010297d:	89 f0                	mov    %esi,%eax
8010297f:	ee                   	out    %al,(%dx)
80102980:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
80102984:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102989:	83 e0 01             	and    $0x1,%eax
8010298c:	c1 e0 04             	shl    $0x4,%eax
8010298f:	83 c8 e0             	or     $0xffffffe0,%eax
80102992:	ee                   	out    %al,(%dx)
80102993:	f6 03 04             	testb  $0x4,(%ebx)
80102996:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010299b:	75 13                	jne    801029b0 <idestart+0x90>
8010299d:	b8 c4 ff ff ff       	mov    $0xffffffc4,%eax
801029a2:	ee                   	out    %al,(%dx)
801029a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801029a6:	5b                   	pop    %ebx
801029a7:	5e                   	pop    %esi
801029a8:	5d                   	pop    %ebp
801029a9:	c3                   	ret    
801029aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801029b0:	b8 c5 ff ff ff       	mov    $0xffffffc5,%eax
801029b5:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
801029b6:	b9 00 01 00 00       	mov    $0x100,%ecx
801029bb:	8d 73 60             	lea    0x60(%ebx),%esi
801029be:	ba f0 01 00 00       	mov    $0x1f0,%edx
801029c3:	fc                   	cld    
801029c4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
801029c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801029c9:	5b                   	pop    %ebx
801029ca:	5e                   	pop    %esi
801029cb:	5d                   	pop    %ebp
801029cc:	c3                   	ret    
801029cd:	83 ec 0c             	sub    $0xc,%esp
801029d0:	68 3c e9 10 80       	push   $0x8010e93c
801029d5:	e8 f6 d9 ff ff       	call   801003d0 <panic>
801029da:	83 ec 0c             	sub    $0xc,%esp
801029dd:	68 33 e9 10 80       	push   $0x8010e933
801029e2:	e8 e9 d9 ff ff       	call   801003d0 <panic>
801029e7:	89 f6                	mov    %esi,%esi
801029e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801029f0 <ideinit>:
801029f0:	55                   	push   %ebp
801029f1:	89 e5                	mov    %esp,%ebp
801029f3:	83 ec 10             	sub    $0x10,%esp
801029f6:	68 4e e9 10 80       	push   $0x8010e94e
801029fb:	68 80 05 12 80       	push   $0x80120580
80102a00:	e8 2b 37 00 00       	call   80106130 <initlock>
80102a05:	58                   	pop    %eax
80102a06:	a1 80 0a 13 80       	mov    0x80130a80,%eax
80102a0b:	5a                   	pop    %edx
80102a0c:	83 e8 01             	sub    $0x1,%eax
80102a0f:	50                   	push   %eax
80102a10:	6a 0e                	push   $0xe
80102a12:	e8 a9 02 00 00       	call   80102cc0 <ioapicenable>
80102a17:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a1a:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102a1f:	90                   	nop
80102a20:	ec                   	in     (%dx),%al
80102a21:	83 e0 c0             	and    $0xffffffc0,%eax
80102a24:	3c 40                	cmp    $0x40,%al
80102a26:	75 f8                	jne    80102a20 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a28:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102a2d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102a32:	ee                   	out    %al,(%dx)
80102a33:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a38:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102a3d:	eb 06                	jmp    80102a45 <ideinit+0x55>
80102a3f:	90                   	nop
80102a40:	83 e9 01             	sub    $0x1,%ecx
80102a43:	74 0f                	je     80102a54 <ideinit+0x64>
80102a45:	ec                   	in     (%dx),%al
80102a46:	84 c0                	test   %al,%al
80102a48:	74 f6                	je     80102a40 <ideinit+0x50>
80102a4a:	c7 05 60 05 12 80 01 	movl   $0x1,0x80120560
80102a51:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a54:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102a59:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102a5e:	ee                   	out    %al,(%dx)
80102a5f:	c9                   	leave  
80102a60:	c3                   	ret    
80102a61:	eb 0d                	jmp    80102a70 <ideintr>
80102a63:	90                   	nop
80102a64:	90                   	nop
80102a65:	90                   	nop
80102a66:	90                   	nop
80102a67:	90                   	nop
80102a68:	90                   	nop
80102a69:	90                   	nop
80102a6a:	90                   	nop
80102a6b:	90                   	nop
80102a6c:	90                   	nop
80102a6d:	90                   	nop
80102a6e:	90                   	nop
80102a6f:	90                   	nop

80102a70 <ideintr>:
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	57                   	push   %edi
80102a74:	56                   	push   %esi
80102a75:	53                   	push   %ebx
80102a76:	83 ec 18             	sub    $0x18,%esp
80102a79:	68 80 05 12 80       	push   $0x80120580
80102a7e:	e8 ad 37 00 00       	call   80106230 <acquire>
80102a83:	8b 1d 64 05 12 80    	mov    0x80120564,%ebx
80102a89:	83 c4 10             	add    $0x10,%esp
80102a8c:	85 db                	test   %ebx,%ebx
80102a8e:	74 34                	je     80102ac4 <ideintr+0x54>
80102a90:	8b 43 58             	mov    0x58(%ebx),%eax
80102a93:	a3 64 05 12 80       	mov    %eax,0x80120564
80102a98:	8b 33                	mov    (%ebx),%esi
80102a9a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102aa0:	74 3e                	je     80102ae0 <ideintr+0x70>
80102aa2:	83 e6 fb             	and    $0xfffffffb,%esi
80102aa5:	83 ec 0c             	sub    $0xc,%esp
80102aa8:	83 ce 02             	or     $0x2,%esi
80102aab:	89 33                	mov    %esi,(%ebx)
80102aad:	53                   	push   %ebx
80102aae:	e8 fb 32 00 00       	call   80105dae <wakeup>
80102ab3:	a1 64 05 12 80       	mov    0x80120564,%eax
80102ab8:	83 c4 10             	add    $0x10,%esp
80102abb:	85 c0                	test   %eax,%eax
80102abd:	74 05                	je     80102ac4 <ideintr+0x54>
80102abf:	e8 5c fe ff ff       	call   80102920 <idestart>
80102ac4:	83 ec 0c             	sub    $0xc,%esp
80102ac7:	68 80 05 12 80       	push   $0x80120580
80102acc:	e8 7f 38 00 00       	call   80106350 <release>
80102ad1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ad4:	5b                   	pop    %ebx
80102ad5:	5e                   	pop    %esi
80102ad6:	5f                   	pop    %edi
80102ad7:	5d                   	pop    %ebp
80102ad8:	c3                   	ret    
80102ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ae0:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102ae5:	8d 76 00             	lea    0x0(%esi),%esi
80102ae8:	ec                   	in     (%dx),%al
80102ae9:	89 c1                	mov    %eax,%ecx
80102aeb:	83 e1 c0             	and    $0xffffffc0,%ecx
80102aee:	80 f9 40             	cmp    $0x40,%cl
80102af1:	75 f5                	jne    80102ae8 <ideintr+0x78>
80102af3:	a8 21                	test   $0x21,%al
80102af5:	75 ab                	jne    80102aa2 <ideintr+0x32>
80102af7:	8d 7b 60             	lea    0x60(%ebx),%edi
  asm volatile("cld; rep insl" :
80102afa:	b9 00 01 00 00       	mov    $0x100,%ecx
80102aff:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102b04:	fc                   	cld    
80102b05:	f3 6d                	rep insl (%dx),%es:(%edi)
80102b07:	8b 33                	mov    (%ebx),%esi
80102b09:	eb 97                	jmp    80102aa2 <ideintr+0x32>
80102b0b:	90                   	nop
80102b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b10 <iderw>:
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 10             	sub    $0x10,%esp
80102b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b1a:	8d 43 0c             	lea    0xc(%ebx),%eax
80102b1d:	50                   	push   %eax
80102b1e:	e8 dd 35 00 00       	call   80106100 <holdingsleep>
80102b23:	83 c4 10             	add    $0x10,%esp
80102b26:	85 c0                	test   %eax,%eax
80102b28:	0f 84 ad 00 00 00    	je     80102bdb <iderw+0xcb>
80102b2e:	8b 03                	mov    (%ebx),%eax
80102b30:	83 e0 06             	and    $0x6,%eax
80102b33:	83 f8 02             	cmp    $0x2,%eax
80102b36:	0f 84 b9 00 00 00    	je     80102bf5 <iderw+0xe5>
80102b3c:	8b 53 04             	mov    0x4(%ebx),%edx
80102b3f:	85 d2                	test   %edx,%edx
80102b41:	74 0d                	je     80102b50 <iderw+0x40>
80102b43:	a1 60 05 12 80       	mov    0x80120560,%eax
80102b48:	85 c0                	test   %eax,%eax
80102b4a:	0f 84 98 00 00 00    	je     80102be8 <iderw+0xd8>
80102b50:	83 ec 0c             	sub    $0xc,%esp
80102b53:	68 80 05 12 80       	push   $0x80120580
80102b58:	e8 d3 36 00 00       	call   80106230 <acquire>
80102b5d:	8b 15 64 05 12 80    	mov    0x80120564,%edx
80102b63:	83 c4 10             	add    $0x10,%esp
80102b66:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80102b6d:	85 d2                	test   %edx,%edx
80102b6f:	75 09                	jne    80102b7a <iderw+0x6a>
80102b71:	eb 58                	jmp    80102bcb <iderw+0xbb>
80102b73:	90                   	nop
80102b74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b78:	89 c2                	mov    %eax,%edx
80102b7a:	8b 42 58             	mov    0x58(%edx),%eax
80102b7d:	85 c0                	test   %eax,%eax
80102b7f:	75 f7                	jne    80102b78 <iderw+0x68>
80102b81:	83 c2 58             	add    $0x58,%edx
80102b84:	89 1a                	mov    %ebx,(%edx)
80102b86:	3b 1d 64 05 12 80    	cmp    0x80120564,%ebx
80102b8c:	74 44                	je     80102bd2 <iderw+0xc2>
80102b8e:	8b 03                	mov    (%ebx),%eax
80102b90:	83 e0 06             	and    $0x6,%eax
80102b93:	83 f8 02             	cmp    $0x2,%eax
80102b96:	74 23                	je     80102bbb <iderw+0xab>
80102b98:	90                   	nop
80102b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ba0:	83 ec 08             	sub    $0x8,%esp
80102ba3:	68 80 05 12 80       	push   $0x80120580
80102ba8:	53                   	push   %ebx
80102ba9:	e8 33 30 00 00       	call   80105be1 <sleep>
80102bae:	8b 03                	mov    (%ebx),%eax
80102bb0:	83 c4 10             	add    $0x10,%esp
80102bb3:	83 e0 06             	and    $0x6,%eax
80102bb6:	83 f8 02             	cmp    $0x2,%eax
80102bb9:	75 e5                	jne    80102ba0 <iderw+0x90>
80102bbb:	c7 45 08 80 05 12 80 	movl   $0x80120580,0x8(%ebp)
80102bc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102bc5:	c9                   	leave  
80102bc6:	e9 85 37 00 00       	jmp    80106350 <release>
80102bcb:	ba 64 05 12 80       	mov    $0x80120564,%edx
80102bd0:	eb b2                	jmp    80102b84 <iderw+0x74>
80102bd2:	89 d8                	mov    %ebx,%eax
80102bd4:	e8 47 fd ff ff       	call   80102920 <idestart>
80102bd9:	eb b3                	jmp    80102b8e <iderw+0x7e>
80102bdb:	83 ec 0c             	sub    $0xc,%esp
80102bde:	68 52 e9 10 80       	push   $0x8010e952
80102be3:	e8 e8 d7 ff ff       	call   801003d0 <panic>
80102be8:	83 ec 0c             	sub    $0xc,%esp
80102beb:	68 7d e9 10 80       	push   $0x8010e97d
80102bf0:	e8 db d7 ff ff       	call   801003d0 <panic>
80102bf5:	83 ec 0c             	sub    $0xc,%esp
80102bf8:	68 68 e9 10 80       	push   $0x8010e968
80102bfd:	e8 ce d7 ff ff       	call   801003d0 <panic>
80102c02:	66 90                	xchg   %ax,%ax
80102c04:	66 90                	xchg   %ax,%ax
80102c06:	66 90                	xchg   %ax,%ax
80102c08:	66 90                	xchg   %ax,%ax
80102c0a:	66 90                	xchg   %ax,%ax
80102c0c:	66 90                	xchg   %ax,%ax
80102c0e:	66 90                	xchg   %ax,%ax

80102c10 <ioapicinit>:
80102c10:	55                   	push   %ebp
80102c11:	c7 05 b4 f9 12 80 00 	movl   $0xfec00000,0x8012f9b4
80102c18:	00 c0 fe 
80102c1b:	89 e5                	mov    %esp,%ebp
80102c1d:	56                   	push   %esi
80102c1e:	53                   	push   %ebx
80102c1f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102c26:	00 00 00 
80102c29:	8b 15 b4 f9 12 80    	mov    0x8012f9b4,%edx
80102c2f:	8b 72 10             	mov    0x10(%edx),%esi
80102c32:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102c38:	8b 0d b4 f9 12 80    	mov    0x8012f9b4,%ecx
80102c3e:	0f b6 15 e0 04 13 80 	movzbl 0x801304e0,%edx
80102c45:	89 f0                	mov    %esi,%eax
80102c47:	c1 e8 10             	shr    $0x10,%eax
80102c4a:	0f b6 f0             	movzbl %al,%esi
80102c4d:	8b 41 10             	mov    0x10(%ecx),%eax
80102c50:	c1 e8 18             	shr    $0x18,%eax
80102c53:	39 d0                	cmp    %edx,%eax
80102c55:	74 16                	je     80102c6d <ioapicinit+0x5d>
80102c57:	83 ec 0c             	sub    $0xc,%esp
80102c5a:	68 9c e9 10 80       	push   $0x8010e99c
80102c5f:	e8 fc d9 ff ff       	call   80100660 <cprintf>
80102c64:	8b 0d b4 f9 12 80    	mov    0x8012f9b4,%ecx
80102c6a:	83 c4 10             	add    $0x10,%esp
80102c6d:	83 c6 21             	add    $0x21,%esi
80102c70:	ba 10 00 00 00       	mov    $0x10,%edx
80102c75:	b8 20 00 00 00       	mov    $0x20,%eax
80102c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102c80:	89 11                	mov    %edx,(%ecx)
80102c82:	8b 0d b4 f9 12 80    	mov    0x8012f9b4,%ecx
80102c88:	89 c3                	mov    %eax,%ebx
80102c8a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102c90:	83 c0 01             	add    $0x1,%eax
80102c93:	89 59 10             	mov    %ebx,0x10(%ecx)
80102c96:	8d 5a 01             	lea    0x1(%edx),%ebx
80102c99:	83 c2 02             	add    $0x2,%edx
80102c9c:	39 f0                	cmp    %esi,%eax
80102c9e:	89 19                	mov    %ebx,(%ecx)
80102ca0:	8b 0d b4 f9 12 80    	mov    0x8012f9b4,%ecx
80102ca6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
80102cad:	75 d1                	jne    80102c80 <ioapicinit+0x70>
80102caf:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102cb2:	5b                   	pop    %ebx
80102cb3:	5e                   	pop    %esi
80102cb4:	5d                   	pop    %ebp
80102cb5:	c3                   	ret    
80102cb6:	8d 76 00             	lea    0x0(%esi),%esi
80102cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102cc0 <ioapicenable>:
80102cc0:	55                   	push   %ebp
80102cc1:	8b 0d b4 f9 12 80    	mov    0x8012f9b4,%ecx
80102cc7:	89 e5                	mov    %esp,%ebp
80102cc9:	8b 45 08             	mov    0x8(%ebp),%eax
80102ccc:	8d 50 20             	lea    0x20(%eax),%edx
80102ccf:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102cd3:	89 01                	mov    %eax,(%ecx)
80102cd5:	8b 0d b4 f9 12 80    	mov    0x8012f9b4,%ecx
80102cdb:	83 c0 01             	add    $0x1,%eax
80102cde:	89 51 10             	mov    %edx,0x10(%ecx)
80102ce1:	8b 55 0c             	mov    0xc(%ebp),%edx
80102ce4:	89 01                	mov    %eax,(%ecx)
80102ce6:	a1 b4 f9 12 80       	mov    0x8012f9b4,%eax
80102ceb:	c1 e2 18             	shl    $0x18,%edx
80102cee:	89 50 10             	mov    %edx,0x10(%eax)
80102cf1:	5d                   	pop    %ebp
80102cf2:	c3                   	ret    
80102cf3:	66 90                	xchg   %ax,%ax
80102cf5:	66 90                	xchg   %ax,%ax
80102cf7:	66 90                	xchg   %ax,%ax
80102cf9:	66 90                	xchg   %ax,%ax
80102cfb:	66 90                	xchg   %ax,%ax
80102cfd:	66 90                	xchg   %ax,%ax
80102cff:	90                   	nop

80102d00 <kfree>:
80102d00:	55                   	push   %ebp
80102d01:	89 e5                	mov    %esp,%ebp
80102d03:	53                   	push   %ebx
80102d04:	83 ec 04             	sub    $0x4,%esp
80102d07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d0a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102d10:	0f 85 7c 00 00 00    	jne    80102d92 <kfree+0x92>
80102d16:	81 fb 54 a6 14 80    	cmp    $0x8014a654,%ebx
80102d1c:	72 74                	jb     80102d92 <kfree+0x92>
80102d1e:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102d24:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102d29:	77 67                	ja     80102d92 <kfree+0x92>
80102d2b:	83 ec 04             	sub    $0x4,%esp
80102d2e:	68 00 10 00 00       	push   $0x1000
80102d33:	6a 01                	push   $0x1
80102d35:	53                   	push   %ebx
80102d36:	e8 65 36 00 00       	call   801063a0 <memset>
80102d3b:	8b 15 f4 f9 12 80    	mov    0x8012f9f4,%edx
80102d41:	83 c4 10             	add    $0x10,%esp
80102d44:	85 d2                	test   %edx,%edx
80102d46:	75 38                	jne    80102d80 <kfree+0x80>
80102d48:	a1 00 fa 12 80       	mov    0x8012fa00,%eax
80102d4d:	89 03                	mov    %eax,(%ebx)
80102d4f:	a1 f4 f9 12 80       	mov    0x8012f9f4,%eax
80102d54:	83 05 f8 f9 12 80 01 	addl   $0x1,0x8012f9f8
80102d5b:	89 1d 00 fa 12 80    	mov    %ebx,0x8012fa00
80102d61:	85 c0                	test   %eax,%eax
80102d63:	75 0b                	jne    80102d70 <kfree+0x70>
80102d65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d68:	c9                   	leave  
80102d69:	c3                   	ret    
80102d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102d70:	c7 45 08 c0 f9 12 80 	movl   $0x8012f9c0,0x8(%ebp)
80102d77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d7a:	c9                   	leave  
80102d7b:	e9 d0 35 00 00       	jmp    80106350 <release>
80102d80:	83 ec 0c             	sub    $0xc,%esp
80102d83:	68 c0 f9 12 80       	push   $0x8012f9c0
80102d88:	e8 a3 34 00 00       	call   80106230 <acquire>
80102d8d:	83 c4 10             	add    $0x10,%esp
80102d90:	eb b6                	jmp    80102d48 <kfree+0x48>
80102d92:	83 ec 0c             	sub    $0xc,%esp
80102d95:	68 ce e9 10 80       	push   $0x8010e9ce
80102d9a:	e8 31 d6 ff ff       	call   801003d0 <panic>
80102d9f:	90                   	nop

80102da0 <freerange>:
80102da0:	55                   	push   %ebp
80102da1:	89 e5                	mov    %esp,%ebp
80102da3:	56                   	push   %esi
80102da4:	53                   	push   %ebx
80102da5:	8b 45 08             	mov    0x8(%ebp),%eax
80102da8:	8b 75 0c             	mov    0xc(%ebp),%esi
80102dab:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102db1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102db7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102dbd:	39 de                	cmp    %ebx,%esi
80102dbf:	72 23                	jb     80102de4 <freerange+0x44>
80102dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102dc8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102dce:	83 ec 0c             	sub    $0xc,%esp
80102dd1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102dd7:	50                   	push   %eax
80102dd8:	e8 23 ff ff ff       	call   80102d00 <kfree>
80102ddd:	83 c4 10             	add    $0x10,%esp
80102de0:	39 f3                	cmp    %esi,%ebx
80102de2:	76 e4                	jbe    80102dc8 <freerange+0x28>
80102de4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102de7:	5b                   	pop    %ebx
80102de8:	5e                   	pop    %esi
80102de9:	5d                   	pop    %ebp
80102dea:	c3                   	ret    
80102deb:	90                   	nop
80102dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102df0 <kinit1>:
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	56                   	push   %esi
80102df4:	53                   	push   %ebx
80102df5:	8b 75 0c             	mov    0xc(%ebp),%esi
80102df8:	83 ec 08             	sub    $0x8,%esp
80102dfb:	68 d4 e9 10 80       	push   $0x8010e9d4
80102e00:	68 c0 f9 12 80       	push   $0x8012f9c0
80102e05:	e8 26 33 00 00       	call   80106130 <initlock>
80102e0a:	8b 45 08             	mov    0x8(%ebp),%eax
80102e0d:	83 c4 10             	add    $0x10,%esp
80102e10:	c7 05 f4 f9 12 80 00 	movl   $0x0,0x8012f9f4
80102e17:	00 00 00 
80102e1a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102e20:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102e26:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102e2c:	39 de                	cmp    %ebx,%esi
80102e2e:	72 1c                	jb     80102e4c <kinit1+0x5c>
80102e30:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102e3f:	50                   	push   %eax
80102e40:	e8 bb fe ff ff       	call   80102d00 <kfree>
80102e45:	83 c4 10             	add    $0x10,%esp
80102e48:	39 de                	cmp    %ebx,%esi
80102e4a:	73 e4                	jae    80102e30 <kinit1+0x40>
80102e4c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102e4f:	5b                   	pop    %ebx
80102e50:	5e                   	pop    %esi
80102e51:	5d                   	pop    %ebp
80102e52:	c3                   	ret    
80102e53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102e60 <kinit2>:
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	56                   	push   %esi
80102e64:	53                   	push   %ebx
80102e65:	8b 45 08             	mov    0x8(%ebp),%eax
80102e68:	8b 75 0c             	mov    0xc(%ebp),%esi
80102e6b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102e71:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102e77:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102e7d:	39 de                	cmp    %ebx,%esi
80102e7f:	72 23                	jb     80102ea4 <kinit2+0x44>
80102e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e88:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102e8e:	83 ec 0c             	sub    $0xc,%esp
80102e91:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102e97:	50                   	push   %eax
80102e98:	e8 63 fe ff ff       	call   80102d00 <kfree>
80102e9d:	83 c4 10             	add    $0x10,%esp
80102ea0:	39 de                	cmp    %ebx,%esi
80102ea2:	73 e4                	jae    80102e88 <kinit2+0x28>
80102ea4:	c7 05 fc f9 12 80 00 	movl   $0x0,0x8012f9fc
80102eab:	00 00 00 
80102eae:	c7 05 f4 f9 12 80 01 	movl   $0x1,0x8012f9f4
80102eb5:	00 00 00 
80102eb8:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102ebb:	5b                   	pop    %ebx
80102ebc:	5e                   	pop    %esi
80102ebd:	5d                   	pop    %ebp
80102ebe:	c3                   	ret    
80102ebf:	90                   	nop

80102ec0 <decrese_protect_counter>:
80102ec0:	55                   	push   %ebp
80102ec1:	89 e5                	mov    %esp,%ebp
80102ec3:	83 ec 08             	sub    $0x8,%esp
80102ec6:	8b 15 f4 f9 12 80    	mov    0x8012f9f4,%edx
80102ecc:	85 d2                	test   %edx,%edx
80102ece:	75 10                	jne    80102ee0 <decrese_protect_counter+0x20>
80102ed0:	8b 45 08             	mov    0x8(%ebp),%eax
80102ed3:	29 05 fc f9 12 80    	sub    %eax,0x8012f9fc
80102ed9:	31 c0                	xor    %eax,%eax
80102edb:	c9                   	leave  
80102edc:	c3                   	ret    
80102edd:	8d 76 00             	lea    0x0(%esi),%esi
80102ee0:	83 ec 0c             	sub    $0xc,%esp
80102ee3:	68 c0 f9 12 80       	push   $0x8012f9c0
80102ee8:	e8 43 33 00 00       	call   80106230 <acquire>
80102eed:	8b 45 08             	mov    0x8(%ebp),%eax
80102ef0:	29 05 fc f9 12 80    	sub    %eax,0x8012f9fc
80102ef6:	83 c4 10             	add    $0x10,%esp
80102ef9:	a1 f4 f9 12 80       	mov    0x8012f9f4,%eax
80102efe:	85 c0                	test   %eax,%eax
80102f00:	74 d7                	je     80102ed9 <decrese_protect_counter+0x19>
80102f02:	83 ec 0c             	sub    $0xc,%esp
80102f05:	68 c0 f9 12 80       	push   $0x8012f9c0
80102f0a:	e8 41 34 00 00       	call   80106350 <release>
80102f0f:	83 c4 10             	add    $0x10,%esp
80102f12:	31 c0                	xor    %eax,%eax
80102f14:	c9                   	leave  
80102f15:	c3                   	ret    
80102f16:	8d 76 00             	lea    0x0(%esi),%esi
80102f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102f20 <increse_protect_counter>:
80102f20:	55                   	push   %ebp
80102f21:	89 e5                	mov    %esp,%ebp
80102f23:	53                   	push   %ebx
80102f24:	83 ec 04             	sub    $0x4,%esp
80102f27:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102f2a:	85 db                	test   %ebx,%ebx
80102f2c:	0f 88 7e 00 00 00    	js     80102fb0 <increse_protect_counter+0x90>
80102f32:	a1 f4 f9 12 80       	mov    0x8012f9f4,%eax
80102f37:	85 c0                	test   %eax,%eax
80102f39:	75 45                	jne    80102f80 <increse_protect_counter+0x60>
80102f3b:	03 1d fc f9 12 80    	add    0x8012f9fc,%ebx
80102f41:	3b 1d f8 f9 12 80    	cmp    0x8012f9f8,%ebx
80102f47:	7f 27                	jg     80102f70 <increse_protect_counter+0x50>
80102f49:	89 1d fc f9 12 80    	mov    %ebx,0x8012f9fc
80102f4f:	31 db                	xor    %ebx,%ebx
80102f51:	85 c0                	test   %eax,%eax
80102f53:	74 10                	je     80102f65 <increse_protect_counter+0x45>
80102f55:	83 ec 0c             	sub    $0xc,%esp
80102f58:	68 c0 f9 12 80       	push   $0x8012f9c0
80102f5d:	e8 ee 33 00 00       	call   80106350 <release>
80102f62:	83 c4 10             	add    $0x10,%esp
80102f65:	89 d8                	mov    %ebx,%eax
80102f67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102f6a:	c9                   	leave  
80102f6b:	c3                   	ret    
80102f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102f70:	bb 01 00 00 00       	mov    $0x1,%ebx
80102f75:	89 d8                	mov    %ebx,%eax
80102f77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102f7a:	c9                   	leave  
80102f7b:	c3                   	ret    
80102f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102f80:	83 ec 0c             	sub    $0xc,%esp
80102f83:	68 c0 f9 12 80       	push   $0x8012f9c0
80102f88:	e8 a3 32 00 00       	call   80106230 <acquire>
80102f8d:	03 1d fc f9 12 80    	add    0x8012f9fc,%ebx
80102f93:	83 c4 10             	add    $0x10,%esp
80102f96:	a1 f4 f9 12 80       	mov    0x8012f9f4,%eax
80102f9b:	3b 1d f8 f9 12 80    	cmp    0x8012f9f8,%ebx
80102fa1:	7e a6                	jle    80102f49 <increse_protect_counter+0x29>
80102fa3:	bb 01 00 00 00       	mov    $0x1,%ebx
80102fa8:	eb a7                	jmp    80102f51 <increse_protect_counter+0x31>
80102faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102fb0:	f7 db                	neg    %ebx
80102fb2:	89 5d 08             	mov    %ebx,0x8(%ebp)
80102fb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102fb8:	c9                   	leave  
80102fb9:	e9 02 ff ff ff       	jmp    80102ec0 <decrese_protect_counter>
80102fbe:	66 90                	xchg   %ax,%ax

80102fc0 <get_total_memory>:
80102fc0:	55                   	push   %ebp
80102fc1:	a1 f8 f9 12 80       	mov    0x8012f9f8,%eax
80102fc6:	89 e5                	mov    %esp,%ebp
80102fc8:	5d                   	pop    %ebp
80102fc9:	c3                   	ret    
80102fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102fd0 <kalloc>:
80102fd0:	55                   	push   %ebp
80102fd1:	89 e5                	mov    %esp,%ebp
80102fd3:	53                   	push   %ebx
80102fd4:	83 ec 14             	sub    $0x14,%esp
80102fd7:	8b 15 f8 f9 12 80    	mov    0x8012f9f8,%edx
80102fdd:	3b 15 fc f9 12 80    	cmp    0x8012f9fc,%edx
80102fe3:	7e 7b                	jle    80103060 <kalloc+0x90>
80102fe5:	8b 0d f4 f9 12 80    	mov    0x8012f9f4,%ecx
80102feb:	85 c9                	test   %ecx,%ecx
80102fed:	75 49                	jne    80103038 <kalloc+0x68>
80102fef:	a1 00 fa 12 80       	mov    0x8012fa00,%eax
80102ff4:	85 c0                	test   %eax,%eax
80102ff6:	74 15                	je     8010300d <kalloc+0x3d>
80102ff8:	8b 18                	mov    (%eax),%ebx
80102ffa:	83 ea 01             	sub    $0x1,%edx
80102ffd:	89 15 f8 f9 12 80    	mov    %edx,0x8012f9f8
80103003:	89 1d 00 fa 12 80    	mov    %ebx,0x8012fa00
80103009:	85 c9                	test   %ecx,%ecx
8010300b:	75 0b                	jne    80103018 <kalloc+0x48>
8010300d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103010:	c9                   	leave  
80103011:	c3                   	ret    
80103012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103018:	83 ec 0c             	sub    $0xc,%esp
8010301b:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010301e:	68 c0 f9 12 80       	push   $0x8012f9c0
80103023:	e8 28 33 00 00       	call   80106350 <release>
80103028:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010302b:	83 c4 10             	add    $0x10,%esp
8010302e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103031:	c9                   	leave  
80103032:	c3                   	ret    
80103033:	90                   	nop
80103034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103038:	83 ec 0c             	sub    $0xc,%esp
8010303b:	68 c0 f9 12 80       	push   $0x8012f9c0
80103040:	e8 eb 31 00 00       	call   80106230 <acquire>
80103045:	a1 00 fa 12 80       	mov    0x8012fa00,%eax
8010304a:	83 c4 10             	add    $0x10,%esp
8010304d:	8b 15 f8 f9 12 80    	mov    0x8012f9f8,%edx
80103053:	8b 0d f4 f9 12 80    	mov    0x8012f9f4,%ecx
80103059:	85 c0                	test   %eax,%eax
8010305b:	75 9b                	jne    80102ff8 <kalloc+0x28>
8010305d:	eb aa                	jmp    80103009 <kalloc+0x39>
8010305f:	90                   	nop
80103060:	31 c0                	xor    %eax,%eax
80103062:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103065:	c9                   	leave  
80103066:	c3                   	ret    
80103067:	89 f6                	mov    %esi,%esi
80103069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103070 <kmemtest>:
80103070:	55                   	push   %ebp
80103071:	89 e5                	mov    %esp,%ebp
80103073:	57                   	push   %edi
80103074:	56                   	push   %esi
80103075:	53                   	push   %ebx
80103076:	83 ec 1c             	sub    $0x1c,%esp
80103079:	a1 f4 f9 12 80       	mov    0x8012f9f4,%eax
8010307e:	85 c0                	test   %eax,%eax
80103080:	89 45 e0             	mov    %eax,-0x20(%ebp)
80103083:	0f 85 97 00 00 00    	jne    80103120 <kmemtest+0xb0>
80103089:	8b 35 00 fa 12 80    	mov    0x8012fa00,%esi
8010308f:	a1 f8 f9 12 80       	mov    0x8012f9f8,%eax
80103094:	85 f6                	test   %esi,%esi
80103096:	89 45 dc             	mov    %eax,-0x24(%ebp)
80103099:	0f 84 c9 00 00 00    	je     80103168 <kmemtest+0xf8>
8010309f:	31 ff                	xor    %edi,%edi
801030a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801030a8:	bb 01 00 00 00       	mov    $0x1,%ebx
801030ad:	8d 76 00             	lea    0x0(%esi),%esi
801030b0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801030b4:	8d 46 04             	lea    0x4(%esi),%eax
801030b7:	8d 8e 00 10 00 00    	lea    0x1000(%esi),%ecx
801030bd:	31 d2                	xor    %edx,%edx
801030bf:	90                   	nop
801030c0:	80 38 01             	cmpb   $0x1,(%eax)
801030c3:	0f 45 d3             	cmovne %ebx,%edx
801030c6:	83 c0 01             	add    $0x1,%eax
801030c9:	39 c1                	cmp    %eax,%ecx
801030cb:	75 f3                	jne    801030c0 <kmemtest+0x50>
801030cd:	8b 36                	mov    (%esi),%esi
801030cf:	01 d7                	add    %edx,%edi
801030d1:	85 f6                	test   %esi,%esi
801030d3:	75 db                	jne    801030b0 <kmemtest+0x40>
801030d5:	85 ff                	test   %edi,%edi
801030d7:	0f 94 c3             	sete   %bl
801030da:	8b 45 e0             	mov    -0x20(%ebp),%eax
801030dd:	85 c0                	test   %eax,%eax
801030df:	74 10                	je     801030f1 <kmemtest+0x81>
801030e1:	83 ec 0c             	sub    $0xc,%esp
801030e4:	68 c0 f9 12 80       	push   $0x8012f9c0
801030e9:	e8 62 32 00 00       	call   80106350 <release>
801030ee:	83 c4 10             	add    $0x10,%esp
801030f1:	57                   	push   %edi
801030f2:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801030f5:	8b 7d dc             	mov    -0x24(%ebp),%edi
801030f8:	56                   	push   %esi
801030f9:	57                   	push   %edi
801030fa:	68 dc e9 10 80       	push   $0x8010e9dc
801030ff:	e8 5c d5 ff ff       	call   80100660 <cprintf>
80103104:	89 f8                	mov    %edi,%eax
80103106:	83 c4 10             	add    $0x10,%esp
80103109:	39 f0                	cmp    %esi,%eax
8010310b:	0f 94 c0             	sete   %al
8010310e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103111:	21 d8                	and    %ebx,%eax
80103113:	83 f0 01             	xor    $0x1,%eax
80103116:	0f b6 c0             	movzbl %al,%eax
80103119:	5b                   	pop    %ebx
8010311a:	f7 d8                	neg    %eax
8010311c:	5e                   	pop    %esi
8010311d:	5f                   	pop    %edi
8010311e:	5d                   	pop    %ebp
8010311f:	c3                   	ret    
80103120:	83 ec 0c             	sub    $0xc,%esp
80103123:	68 c0 f9 12 80       	push   $0x8012f9c0
80103128:	e8 03 31 00 00       	call   80106230 <acquire>
8010312d:	a1 f8 f9 12 80       	mov    0x8012f9f8,%eax
80103132:	8b 35 00 fa 12 80    	mov    0x8012fa00,%esi
80103138:	83 c4 10             	add    $0x10,%esp
8010313b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010313e:	a1 f4 f9 12 80       	mov    0x8012f9f4,%eax
80103143:	85 f6                	test   %esi,%esi
80103145:	89 45 e0             	mov    %eax,-0x20(%ebp)
80103148:	0f 85 51 ff ff ff    	jne    8010309f <kmemtest+0x2f>
8010314e:	bb 01 00 00 00       	mov    $0x1,%ebx
80103153:	31 ff                	xor    %edi,%edi
80103155:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010315c:	e9 79 ff ff ff       	jmp    801030da <kmemtest+0x6a>
80103161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103168:	bb 01 00 00 00       	mov    $0x1,%ebx
8010316d:	31 ff                	xor    %edi,%edi
8010316f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80103176:	e9 76 ff ff ff       	jmp    801030f1 <kmemtest+0x81>
8010317b:	66 90                	xchg   %ax,%ax
8010317d:	66 90                	xchg   %ax,%ax
8010317f:	90                   	nop

80103180 <kbdgetc>:
80103180:	55                   	push   %ebp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103181:	ba 64 00 00 00       	mov    $0x64,%edx
80103186:	89 e5                	mov    %esp,%ebp
80103188:	ec                   	in     (%dx),%al
80103189:	a8 01                	test   $0x1,%al
8010318b:	0f 84 af 00 00 00    	je     80103240 <kbdgetc+0xc0>
80103191:	ba 60 00 00 00       	mov    $0x60,%edx
80103196:	ec                   	in     (%dx),%al
80103197:	0f b6 d0             	movzbl %al,%edx
8010319a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801031a0:	74 7e                	je     80103220 <kbdgetc+0xa0>
801031a2:	84 c0                	test   %al,%al
801031a4:	8b 0d b4 05 12 80    	mov    0x801205b4,%ecx
801031aa:	79 24                	jns    801031d0 <kbdgetc+0x50>
801031ac:	f6 c1 40             	test   $0x40,%cl
801031af:	75 05                	jne    801031b6 <kbdgetc+0x36>
801031b1:	89 c2                	mov    %eax,%edx
801031b3:	83 e2 7f             	and    $0x7f,%edx
801031b6:	0f b6 82 40 eb 10 80 	movzbl -0x7fef14c0(%edx),%eax
801031bd:	83 c8 40             	or     $0x40,%eax
801031c0:	0f b6 c0             	movzbl %al,%eax
801031c3:	f7 d0                	not    %eax
801031c5:	21 c8                	and    %ecx,%eax
801031c7:	a3 b4 05 12 80       	mov    %eax,0x801205b4
801031cc:	31 c0                	xor    %eax,%eax
801031ce:	5d                   	pop    %ebp
801031cf:	c3                   	ret    
801031d0:	f6 c1 40             	test   $0x40,%cl
801031d3:	74 09                	je     801031de <kbdgetc+0x5e>
801031d5:	83 c8 80             	or     $0xffffff80,%eax
801031d8:	83 e1 bf             	and    $0xffffffbf,%ecx
801031db:	0f b6 d0             	movzbl %al,%edx
801031de:	0f b6 82 40 eb 10 80 	movzbl -0x7fef14c0(%edx),%eax
801031e5:	09 c1                	or     %eax,%ecx
801031e7:	0f b6 82 40 ea 10 80 	movzbl -0x7fef15c0(%edx),%eax
801031ee:	31 c1                	xor    %eax,%ecx
801031f0:	89 c8                	mov    %ecx,%eax
801031f2:	89 0d b4 05 12 80    	mov    %ecx,0x801205b4
801031f8:	83 e0 03             	and    $0x3,%eax
801031fb:	83 e1 08             	and    $0x8,%ecx
801031fe:	8b 04 85 20 ea 10 80 	mov    -0x7fef15e0(,%eax,4),%eax
80103205:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80103209:	74 c3                	je     801031ce <kbdgetc+0x4e>
8010320b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010320e:	83 fa 19             	cmp    $0x19,%edx
80103211:	77 1d                	ja     80103230 <kbdgetc+0xb0>
80103213:	83 e8 20             	sub    $0x20,%eax
80103216:	5d                   	pop    %ebp
80103217:	c3                   	ret    
80103218:	90                   	nop
80103219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103220:	31 c0                	xor    %eax,%eax
80103222:	83 0d b4 05 12 80 40 	orl    $0x40,0x801205b4
80103229:	5d                   	pop    %ebp
8010322a:	c3                   	ret    
8010322b:	90                   	nop
8010322c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103230:	8d 48 bf             	lea    -0x41(%eax),%ecx
80103233:	8d 50 20             	lea    0x20(%eax),%edx
80103236:	5d                   	pop    %ebp
80103237:	83 f9 19             	cmp    $0x19,%ecx
8010323a:	0f 46 c2             	cmovbe %edx,%eax
8010323d:	c3                   	ret    
8010323e:	66 90                	xchg   %ax,%ax
80103240:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103245:	5d                   	pop    %ebp
80103246:	c3                   	ret    
80103247:	89 f6                	mov    %esi,%esi
80103249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103250 <kbdintr>:
80103250:	55                   	push   %ebp
80103251:	89 e5                	mov    %esp,%ebp
80103253:	83 ec 14             	sub    $0x14,%esp
80103256:	68 80 31 10 80       	push   $0x80103180
8010325b:	e8 e0 d5 ff ff       	call   80100840 <consoleintr>
80103260:	83 c4 10             	add    $0x10,%esp
80103263:	c9                   	leave  
80103264:	c3                   	ret    
80103265:	66 90                	xchg   %ax,%ax
80103267:	66 90                	xchg   %ax,%ax
80103269:	66 90                	xchg   %ax,%ax
8010326b:	66 90                	xchg   %ax,%ax
8010326d:	66 90                	xchg   %ax,%ax
8010326f:	90                   	nop

80103270 <lapicinit>:
80103270:	a1 04 fa 12 80       	mov    0x8012fa04,%eax
80103275:	55                   	push   %ebp
80103276:	89 e5                	mov    %esp,%ebp
80103278:	85 c0                	test   %eax,%eax
8010327a:	0f 84 c8 00 00 00    	je     80103348 <lapicinit+0xd8>
80103280:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80103287:	01 00 00 
8010328a:	8b 50 20             	mov    0x20(%eax),%edx
8010328d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80103294:	00 00 00 
80103297:	8b 50 20             	mov    0x20(%eax),%edx
8010329a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801032a1:	00 02 00 
801032a4:	8b 50 20             	mov    0x20(%eax),%edx
801032a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801032ae:	96 98 00 
801032b1:	8b 50 20             	mov    0x20(%eax),%edx
801032b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801032bb:	00 01 00 
801032be:	8b 50 20             	mov    0x20(%eax),%edx
801032c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801032c8:	00 01 00 
801032cb:	8b 50 20             	mov    0x20(%eax),%edx
801032ce:	8b 50 30             	mov    0x30(%eax),%edx
801032d1:	c1 ea 10             	shr    $0x10,%edx
801032d4:	80 fa 03             	cmp    $0x3,%dl
801032d7:	77 77                	ja     80103350 <lapicinit+0xe0>
801032d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801032e0:	00 00 00 
801032e3:	8b 50 20             	mov    0x20(%eax),%edx
801032e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801032ed:	00 00 00 
801032f0:	8b 50 20             	mov    0x20(%eax),%edx
801032f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801032fa:	00 00 00 
801032fd:	8b 50 20             	mov    0x20(%eax),%edx
80103300:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80103307:	00 00 00 
8010330a:	8b 50 20             	mov    0x20(%eax),%edx
8010330d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80103314:	00 00 00 
80103317:	8b 50 20             	mov    0x20(%eax),%edx
8010331a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80103321:	85 08 00 
80103324:	8b 50 20             	mov    0x20(%eax),%edx
80103327:	89 f6                	mov    %esi,%esi
80103329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103330:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80103336:	80 e6 10             	and    $0x10,%dh
80103339:	75 f5                	jne    80103330 <lapicinit+0xc0>
8010333b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80103342:	00 00 00 
80103345:	8b 40 20             	mov    0x20(%eax),%eax
80103348:	5d                   	pop    %ebp
80103349:	c3                   	ret    
8010334a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103350:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80103357:	00 01 00 
8010335a:	8b 50 20             	mov    0x20(%eax),%edx
8010335d:	e9 77 ff ff ff       	jmp    801032d9 <lapicinit+0x69>
80103362:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103370 <lapicid>:
80103370:	a1 04 fa 12 80       	mov    0x8012fa04,%eax
80103375:	55                   	push   %ebp
80103376:	89 e5                	mov    %esp,%ebp
80103378:	85 c0                	test   %eax,%eax
8010337a:	74 0c                	je     80103388 <lapicid+0x18>
8010337c:	8b 40 20             	mov    0x20(%eax),%eax
8010337f:	5d                   	pop    %ebp
80103380:	c1 e8 18             	shr    $0x18,%eax
80103383:	c3                   	ret    
80103384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103388:	31 c0                	xor    %eax,%eax
8010338a:	5d                   	pop    %ebp
8010338b:	c3                   	ret    
8010338c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103390 <lapiceoi>:
80103390:	a1 04 fa 12 80       	mov    0x8012fa04,%eax
80103395:	55                   	push   %ebp
80103396:	89 e5                	mov    %esp,%ebp
80103398:	85 c0                	test   %eax,%eax
8010339a:	74 0d                	je     801033a9 <lapiceoi+0x19>
8010339c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801033a3:	00 00 00 
801033a6:	8b 40 20             	mov    0x20(%eax),%eax
801033a9:	5d                   	pop    %ebp
801033aa:	c3                   	ret    
801033ab:	90                   	nop
801033ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801033b0 <microdelay>:
801033b0:	55                   	push   %ebp
801033b1:	89 e5                	mov    %esp,%ebp
801033b3:	5d                   	pop    %ebp
801033b4:	c3                   	ret    
801033b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801033b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801033c0 <lapicstartap>:
801033c0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801033c1:	ba 70 00 00 00       	mov    $0x70,%edx
801033c6:	b8 0f 00 00 00       	mov    $0xf,%eax
801033cb:	89 e5                	mov    %esp,%ebp
801033cd:	53                   	push   %ebx
801033ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033d4:	ee                   	out    %al,(%dx)
801033d5:	ba 71 00 00 00       	mov    $0x71,%edx
801033da:	b8 0a 00 00 00       	mov    $0xa,%eax
801033df:	ee                   	out    %al,(%dx)
801033e0:	31 c0                	xor    %eax,%eax
801033e2:	c1 e3 18             	shl    $0x18,%ebx
801033e5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801033eb:	89 c8                	mov    %ecx,%eax
801033ed:	c1 e9 0c             	shr    $0xc,%ecx
801033f0:	c1 e8 04             	shr    $0x4,%eax
801033f3:	89 da                	mov    %ebx,%edx
801033f5:	80 cd 06             	or     $0x6,%ch
801033f8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801033fe:	a1 04 fa 12 80       	mov    0x8012fa04,%eax
80103403:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80103409:	8b 58 20             	mov    0x20(%eax),%ebx
8010340c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80103413:	c5 00 00 
80103416:	8b 58 20             	mov    0x20(%eax),%ebx
80103419:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80103420:	85 00 00 
80103423:	8b 58 20             	mov    0x20(%eax),%ebx
80103426:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010342c:	8b 58 20             	mov    0x20(%eax),%ebx
8010342f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80103435:	8b 58 20             	mov    0x20(%eax),%ebx
80103438:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010343e:	8b 50 20             	mov    0x20(%eax),%edx
80103441:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80103447:	8b 40 20             	mov    0x20(%eax),%eax
8010344a:	5b                   	pop    %ebx
8010344b:	5d                   	pop    %ebp
8010344c:	c3                   	ret    
8010344d:	8d 76 00             	lea    0x0(%esi),%esi

80103450 <cmostime>:
80103450:	55                   	push   %ebp
80103451:	ba 70 00 00 00       	mov    $0x70,%edx
80103456:	b8 0b 00 00 00       	mov    $0xb,%eax
8010345b:	89 e5                	mov    %esp,%ebp
8010345d:	57                   	push   %edi
8010345e:	56                   	push   %esi
8010345f:	53                   	push   %ebx
80103460:	83 ec 4c             	sub    $0x4c,%esp
80103463:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103464:	ba 71 00 00 00       	mov    $0x71,%edx
80103469:	ec                   	in     (%dx),%al
8010346a:	83 e0 04             	and    $0x4,%eax
8010346d:	8d 75 d0             	lea    -0x30(%ebp),%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103470:	31 db                	xor    %ebx,%ebx
80103472:	88 45 b7             	mov    %al,-0x49(%ebp)
80103475:	bf 70 00 00 00       	mov    $0x70,%edi
8010347a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103480:	89 d8                	mov    %ebx,%eax
80103482:	89 fa                	mov    %edi,%edx
80103484:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103485:	b9 71 00 00 00       	mov    $0x71,%ecx
8010348a:	89 ca                	mov    %ecx,%edx
8010348c:	ec                   	in     (%dx),%al
8010348d:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103490:	89 fa                	mov    %edi,%edx
80103492:	89 45 b8             	mov    %eax,-0x48(%ebp)
80103495:	b8 02 00 00 00       	mov    $0x2,%eax
8010349a:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010349b:	89 ca                	mov    %ecx,%edx
8010349d:	ec                   	in     (%dx),%al
8010349e:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801034a1:	89 fa                	mov    %edi,%edx
801034a3:	89 45 bc             	mov    %eax,-0x44(%ebp)
801034a6:	b8 04 00 00 00       	mov    $0x4,%eax
801034ab:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801034ac:	89 ca                	mov    %ecx,%edx
801034ae:	ec                   	in     (%dx),%al
801034af:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801034b2:	89 fa                	mov    %edi,%edx
801034b4:	89 45 c0             	mov    %eax,-0x40(%ebp)
801034b7:	b8 07 00 00 00       	mov    $0x7,%eax
801034bc:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801034bd:	89 ca                	mov    %ecx,%edx
801034bf:	ec                   	in     (%dx),%al
801034c0:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801034c3:	89 fa                	mov    %edi,%edx
801034c5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801034c8:	b8 08 00 00 00       	mov    $0x8,%eax
801034cd:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801034ce:	89 ca                	mov    %ecx,%edx
801034d0:	ec                   	in     (%dx),%al
801034d1:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801034d4:	89 fa                	mov    %edi,%edx
801034d6:	89 45 c8             	mov    %eax,-0x38(%ebp)
801034d9:	b8 09 00 00 00       	mov    $0x9,%eax
801034de:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801034df:	89 ca                	mov    %ecx,%edx
801034e1:	ec                   	in     (%dx),%al
801034e2:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801034e5:	89 fa                	mov    %edi,%edx
801034e7:	89 45 cc             	mov    %eax,-0x34(%ebp)
801034ea:	b8 0a 00 00 00       	mov    $0xa,%eax
801034ef:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801034f0:	89 ca                	mov    %ecx,%edx
801034f2:	ec                   	in     (%dx),%al
801034f3:	84 c0                	test   %al,%al
801034f5:	78 89                	js     80103480 <cmostime+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801034f7:	89 d8                	mov    %ebx,%eax
801034f9:	89 fa                	mov    %edi,%edx
801034fb:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801034fc:	89 ca                	mov    %ecx,%edx
801034fe:	ec                   	in     (%dx),%al
801034ff:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103502:	89 fa                	mov    %edi,%edx
80103504:	89 45 d0             	mov    %eax,-0x30(%ebp)
80103507:	b8 02 00 00 00       	mov    $0x2,%eax
8010350c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010350d:	89 ca                	mov    %ecx,%edx
8010350f:	ec                   	in     (%dx),%al
80103510:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103513:	89 fa                	mov    %edi,%edx
80103515:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80103518:	b8 04 00 00 00       	mov    $0x4,%eax
8010351d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010351e:	89 ca                	mov    %ecx,%edx
80103520:	ec                   	in     (%dx),%al
80103521:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103524:	89 fa                	mov    %edi,%edx
80103526:	89 45 d8             	mov    %eax,-0x28(%ebp)
80103529:	b8 07 00 00 00       	mov    $0x7,%eax
8010352e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010352f:	89 ca                	mov    %ecx,%edx
80103531:	ec                   	in     (%dx),%al
80103532:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103535:	89 fa                	mov    %edi,%edx
80103537:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010353a:	b8 08 00 00 00       	mov    $0x8,%eax
8010353f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103540:	89 ca                	mov    %ecx,%edx
80103542:	ec                   	in     (%dx),%al
80103543:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103546:	89 fa                	mov    %edi,%edx
80103548:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010354b:	b8 09 00 00 00       	mov    $0x9,%eax
80103550:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103551:	89 ca                	mov    %ecx,%edx
80103553:	ec                   	in     (%dx),%al
80103554:	0f b6 c0             	movzbl %al,%eax
80103557:	83 ec 04             	sub    $0x4,%esp
8010355a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010355d:	8d 45 b8             	lea    -0x48(%ebp),%eax
80103560:	6a 18                	push   $0x18
80103562:	56                   	push   %esi
80103563:	50                   	push   %eax
80103564:	e8 87 2e 00 00       	call   801063f0 <memcmp>
80103569:	83 c4 10             	add    $0x10,%esp
8010356c:	85 c0                	test   %eax,%eax
8010356e:	0f 85 0c ff ff ff    	jne    80103480 <cmostime+0x30>
80103574:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80103578:	75 78                	jne    801035f2 <cmostime+0x1a2>
8010357a:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010357d:	89 c2                	mov    %eax,%edx
8010357f:	83 e0 0f             	and    $0xf,%eax
80103582:	c1 ea 04             	shr    $0x4,%edx
80103585:	8d 14 92             	lea    (%edx,%edx,4),%edx
80103588:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010358b:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010358e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80103591:	89 c2                	mov    %eax,%edx
80103593:	83 e0 0f             	and    $0xf,%eax
80103596:	c1 ea 04             	shr    $0x4,%edx
80103599:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010359c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010359f:	89 45 bc             	mov    %eax,-0x44(%ebp)
801035a2:	8b 45 c0             	mov    -0x40(%ebp),%eax
801035a5:	89 c2                	mov    %eax,%edx
801035a7:	83 e0 0f             	and    $0xf,%eax
801035aa:	c1 ea 04             	shr    $0x4,%edx
801035ad:	8d 14 92             	lea    (%edx,%edx,4),%edx
801035b0:	8d 04 50             	lea    (%eax,%edx,2),%eax
801035b3:	89 45 c0             	mov    %eax,-0x40(%ebp)
801035b6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801035b9:	89 c2                	mov    %eax,%edx
801035bb:	83 e0 0f             	and    $0xf,%eax
801035be:	c1 ea 04             	shr    $0x4,%edx
801035c1:	8d 14 92             	lea    (%edx,%edx,4),%edx
801035c4:	8d 04 50             	lea    (%eax,%edx,2),%eax
801035c7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801035ca:	8b 45 c8             	mov    -0x38(%ebp),%eax
801035cd:	89 c2                	mov    %eax,%edx
801035cf:	83 e0 0f             	and    $0xf,%eax
801035d2:	c1 ea 04             	shr    $0x4,%edx
801035d5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801035d8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801035db:	89 45 c8             	mov    %eax,-0x38(%ebp)
801035de:	8b 45 cc             	mov    -0x34(%ebp),%eax
801035e1:	89 c2                	mov    %eax,%edx
801035e3:	83 e0 0f             	and    $0xf,%eax
801035e6:	c1 ea 04             	shr    $0x4,%edx
801035e9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801035ec:	8d 04 50             	lea    (%eax,%edx,2),%eax
801035ef:	89 45 cc             	mov    %eax,-0x34(%ebp)
801035f2:	8b 75 08             	mov    0x8(%ebp),%esi
801035f5:	8b 45 b8             	mov    -0x48(%ebp),%eax
801035f8:	89 06                	mov    %eax,(%esi)
801035fa:	8b 45 bc             	mov    -0x44(%ebp),%eax
801035fd:	89 46 04             	mov    %eax,0x4(%esi)
80103600:	8b 45 c0             	mov    -0x40(%ebp),%eax
80103603:	89 46 08             	mov    %eax,0x8(%esi)
80103606:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80103609:	89 46 0c             	mov    %eax,0xc(%esi)
8010360c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010360f:	89 46 10             	mov    %eax,0x10(%esi)
80103612:	8b 45 cc             	mov    -0x34(%ebp),%eax
80103615:	89 46 14             	mov    %eax,0x14(%esi)
80103618:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
8010361f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103622:	5b                   	pop    %ebx
80103623:	5e                   	pop    %esi
80103624:	5f                   	pop    %edi
80103625:	5d                   	pop    %ebp
80103626:	c3                   	ret    
80103627:	66 90                	xchg   %ax,%ax
80103629:	66 90                	xchg   %ax,%ax
8010362b:	66 90                	xchg   %ax,%ax
8010362d:	66 90                	xchg   %ax,%ax
8010362f:	90                   	nop

80103630 <write_head>:
80103630:	55                   	push   %ebp
80103631:	89 e5                	mov    %esp,%ebp
80103633:	53                   	push   %ebx
80103634:	83 ec 0c             	sub    $0xc,%esp
80103637:	ff 35 54 fa 12 80    	pushl  0x8012fa54
8010363d:	ff 35 64 fa 12 80    	pushl  0x8012fa64
80103643:	e8 98 cb ff ff       	call   801001e0 <bread>
80103648:	8b 0d 68 fa 12 80    	mov    0x8012fa68,%ecx
8010364e:	83 c4 10             	add    $0x10,%esp
80103651:	89 c3                	mov    %eax,%ebx
80103653:	85 c9                	test   %ecx,%ecx
80103655:	89 48 60             	mov    %ecx,0x60(%eax)
80103658:	7e 1f                	jle    80103679 <write_head+0x49>
8010365a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80103661:	31 d2                	xor    %edx,%edx
80103663:	90                   	nop
80103664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103668:	8b 8a 6c fa 12 80    	mov    -0x7fed0594(%edx),%ecx
8010366e:	89 4c 13 64          	mov    %ecx,0x64(%ebx,%edx,1)
80103672:	83 c2 04             	add    $0x4,%edx
80103675:	39 c2                	cmp    %eax,%edx
80103677:	75 ef                	jne    80103668 <write_head+0x38>
80103679:	83 ec 0c             	sub    $0xc,%esp
8010367c:	53                   	push   %ebx
8010367d:	e8 7e cc ff ff       	call   80100300 <bwrite>
80103682:	89 1c 24             	mov    %ebx,(%esp)
80103685:	e8 b6 cc ff ff       	call   80100340 <brelse>
8010368a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010368d:	c9                   	leave  
8010368e:	c3                   	ret    
8010368f:	90                   	nop

80103690 <install_trans>:
80103690:	a1 68 fa 12 80       	mov    0x8012fa68,%eax
80103695:	85 c0                	test   %eax,%eax
80103697:	0f 8e 98 00 00 00    	jle    80103735 <install_trans+0xa5>
8010369d:	55                   	push   %ebp
8010369e:	89 e5                	mov    %esp,%ebp
801036a0:	57                   	push   %edi
801036a1:	56                   	push   %esi
801036a2:	53                   	push   %ebx
801036a3:	31 f6                	xor    %esi,%esi
801036a5:	83 ec 0c             	sub    $0xc,%esp
801036a8:	90                   	nop
801036a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801036b0:	a1 54 fa 12 80       	mov    0x8012fa54,%eax
801036b5:	83 ec 08             	sub    $0x8,%esp
801036b8:	01 f0                	add    %esi,%eax
801036ba:	83 c0 01             	add    $0x1,%eax
801036bd:	50                   	push   %eax
801036be:	ff 35 64 fa 12 80    	pushl  0x8012fa64
801036c4:	e8 17 cb ff ff       	call   801001e0 <bread>
801036c9:	89 c7                	mov    %eax,%edi
801036cb:	58                   	pop    %eax
801036cc:	5a                   	pop    %edx
801036cd:	ff 34 b5 6c fa 12 80 	pushl  -0x7fed0594(,%esi,4)
801036d4:	ff 35 64 fa 12 80    	pushl  0x8012fa64
801036da:	83 c6 01             	add    $0x1,%esi
801036dd:	e8 fe ca ff ff       	call   801001e0 <bread>
801036e2:	89 c3                	mov    %eax,%ebx
801036e4:	8d 47 60             	lea    0x60(%edi),%eax
801036e7:	83 c4 0c             	add    $0xc,%esp
801036ea:	68 00 04 00 00       	push   $0x400
801036ef:	50                   	push   %eax
801036f0:	8d 43 60             	lea    0x60(%ebx),%eax
801036f3:	50                   	push   %eax
801036f4:	e8 57 2d 00 00       	call   80106450 <memmove>
801036f9:	89 1c 24             	mov    %ebx,(%esp)
801036fc:	e8 ff cb ff ff       	call   80100300 <bwrite>
80103701:	59                   	pop    %ecx
80103702:	ff 73 5c             	pushl  0x5c(%ebx)
80103705:	e8 f6 ab 00 00       	call   8010e300 <cgroup_mem_stat_file_dirty_decr>
8010370a:	58                   	pop    %eax
8010370b:	ff 73 5c             	pushl  0x5c(%ebx)
8010370e:	e8 1d ac 00 00       	call   8010e330 <cgroup_mem_stat_file_dirty_aggregated_incr>
80103713:	89 3c 24             	mov    %edi,(%esp)
80103716:	e8 25 cc ff ff       	call   80100340 <brelse>
8010371b:	89 1c 24             	mov    %ebx,(%esp)
8010371e:	e8 1d cc ff ff       	call   80100340 <brelse>
80103723:	83 c4 10             	add    $0x10,%esp
80103726:	39 35 68 fa 12 80    	cmp    %esi,0x8012fa68
8010372c:	7f 82                	jg     801036b0 <install_trans+0x20>
8010372e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103731:	5b                   	pop    %ebx
80103732:	5e                   	pop    %esi
80103733:	5f                   	pop    %edi
80103734:	5d                   	pop    %ebp
80103735:	f3 c3                	repz ret 
80103737:	89 f6                	mov    %esi,%esi
80103739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103740 <initlog>:
80103740:	55                   	push   %ebp
80103741:	89 e5                	mov    %esp,%ebp
80103743:	53                   	push   %ebx
80103744:	83 ec 2c             	sub    $0x2c,%esp
80103747:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010374a:	68 40 ec 10 80       	push   $0x8010ec40
8010374f:	68 20 fa 12 80       	push   $0x8012fa20
80103754:	e8 d7 29 00 00       	call   80106130 <initlock>
80103759:	58                   	pop    %eax
8010375a:	8d 45 dc             	lea    -0x24(%ebp),%eax
8010375d:	5a                   	pop    %edx
8010375e:	50                   	push   %eax
8010375f:	53                   	push   %ebx
80103760:	e8 5b e4 ff ff       	call   80101bc0 <readsb>
80103765:	8b 55 e8             	mov    -0x18(%ebp),%edx
80103768:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010376b:	59                   	pop    %ecx
8010376c:	89 1d 64 fa 12 80    	mov    %ebx,0x8012fa64
80103772:	89 15 58 fa 12 80    	mov    %edx,0x8012fa58
80103778:	a3 54 fa 12 80       	mov    %eax,0x8012fa54
8010377d:	5a                   	pop    %edx
8010377e:	50                   	push   %eax
8010377f:	53                   	push   %ebx
80103780:	e8 5b ca ff ff       	call   801001e0 <bread>
80103785:	8b 48 60             	mov    0x60(%eax),%ecx
80103788:	83 c4 10             	add    $0x10,%esp
8010378b:	85 c9                	test   %ecx,%ecx
8010378d:	89 0d 68 fa 12 80    	mov    %ecx,0x8012fa68
80103793:	7e 1c                	jle    801037b1 <initlog+0x71>
80103795:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
8010379c:	31 d2                	xor    %edx,%edx
8010379e:	66 90                	xchg   %ax,%ax
801037a0:	8b 4c 10 64          	mov    0x64(%eax,%edx,1),%ecx
801037a4:	83 c2 04             	add    $0x4,%edx
801037a7:	89 8a 68 fa 12 80    	mov    %ecx,-0x7fed0598(%edx)
801037ad:	39 da                	cmp    %ebx,%edx
801037af:	75 ef                	jne    801037a0 <initlog+0x60>
801037b1:	83 ec 0c             	sub    $0xc,%esp
801037b4:	50                   	push   %eax
801037b5:	e8 86 cb ff ff       	call   80100340 <brelse>
801037ba:	e8 d1 fe ff ff       	call   80103690 <install_trans>
801037bf:	c7 05 68 fa 12 80 00 	movl   $0x0,0x8012fa68
801037c6:	00 00 00 
801037c9:	e8 62 fe ff ff       	call   80103630 <write_head>
801037ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037d1:	c9                   	leave  
801037d2:	c3                   	ret    
801037d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037e0 <begin_op>:
801037e0:	55                   	push   %ebp
801037e1:	89 e5                	mov    %esp,%ebp
801037e3:	83 ec 14             	sub    $0x14,%esp
801037e6:	68 20 fa 12 80       	push   $0x8012fa20
801037eb:	e8 40 2a 00 00       	call   80106230 <acquire>
801037f0:	83 c4 10             	add    $0x10,%esp
801037f3:	eb 18                	jmp    8010380d <begin_op+0x2d>
801037f5:	8d 76 00             	lea    0x0(%esi),%esi
801037f8:	83 ec 08             	sub    $0x8,%esp
801037fb:	68 20 fa 12 80       	push   $0x8012fa20
80103800:	68 20 fa 12 80       	push   $0x8012fa20
80103805:	e8 d7 23 00 00       	call   80105be1 <sleep>
8010380a:	83 c4 10             	add    $0x10,%esp
8010380d:	a1 60 fa 12 80       	mov    0x8012fa60,%eax
80103812:	85 c0                	test   %eax,%eax
80103814:	75 e2                	jne    801037f8 <begin_op+0x18>
80103816:	a1 5c fa 12 80       	mov    0x8012fa5c,%eax
8010381b:	8b 15 68 fa 12 80    	mov    0x8012fa68,%edx
80103821:	83 c0 01             	add    $0x1,%eax
80103824:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80103827:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
8010382a:	83 fa 1e             	cmp    $0x1e,%edx
8010382d:	7f c9                	jg     801037f8 <begin_op+0x18>
8010382f:	83 ec 0c             	sub    $0xc,%esp
80103832:	a3 5c fa 12 80       	mov    %eax,0x8012fa5c
80103837:	68 20 fa 12 80       	push   $0x8012fa20
8010383c:	e8 0f 2b 00 00       	call   80106350 <release>
80103841:	83 c4 10             	add    $0x10,%esp
80103844:	c9                   	leave  
80103845:	c3                   	ret    
80103846:	8d 76 00             	lea    0x0(%esi),%esi
80103849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103850 <end_op>:
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	57                   	push   %edi
80103854:	56                   	push   %esi
80103855:	53                   	push   %ebx
80103856:	83 ec 18             	sub    $0x18,%esp
80103859:	68 20 fa 12 80       	push   $0x8012fa20
8010385e:	e8 cd 29 00 00       	call   80106230 <acquire>
80103863:	a1 5c fa 12 80       	mov    0x8012fa5c,%eax
80103868:	8b 1d 60 fa 12 80    	mov    0x8012fa60,%ebx
8010386e:	83 c4 10             	add    $0x10,%esp
80103871:	83 e8 01             	sub    $0x1,%eax
80103874:	85 db                	test   %ebx,%ebx
80103876:	a3 5c fa 12 80       	mov    %eax,0x8012fa5c
8010387b:	0f 85 23 01 00 00    	jne    801039a4 <end_op+0x154>
80103881:	85 c0                	test   %eax,%eax
80103883:	0f 85 f7 00 00 00    	jne    80103980 <end_op+0x130>
80103889:	83 ec 0c             	sub    $0xc,%esp
8010388c:	c7 05 60 fa 12 80 01 	movl   $0x1,0x8012fa60
80103893:	00 00 00 
80103896:	31 db                	xor    %ebx,%ebx
80103898:	68 20 fa 12 80       	push   $0x8012fa20
8010389d:	e8 ae 2a 00 00       	call   80106350 <release>
801038a2:	8b 0d 68 fa 12 80    	mov    0x8012fa68,%ecx
801038a8:	83 c4 10             	add    $0x10,%esp
801038ab:	85 c9                	test   %ecx,%ecx
801038ad:	0f 8e 8a 00 00 00    	jle    8010393d <end_op+0xed>
801038b3:	90                   	nop
801038b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801038b8:	a1 54 fa 12 80       	mov    0x8012fa54,%eax
801038bd:	83 ec 08             	sub    $0x8,%esp
801038c0:	01 d8                	add    %ebx,%eax
801038c2:	83 c0 01             	add    $0x1,%eax
801038c5:	50                   	push   %eax
801038c6:	ff 35 64 fa 12 80    	pushl  0x8012fa64
801038cc:	e8 0f c9 ff ff       	call   801001e0 <bread>
801038d1:	89 c6                	mov    %eax,%esi
801038d3:	58                   	pop    %eax
801038d4:	5a                   	pop    %edx
801038d5:	ff 34 9d 6c fa 12 80 	pushl  -0x7fed0594(,%ebx,4)
801038dc:	ff 35 64 fa 12 80    	pushl  0x8012fa64
801038e2:	83 c3 01             	add    $0x1,%ebx
801038e5:	e8 f6 c8 ff ff       	call   801001e0 <bread>
801038ea:	89 c7                	mov    %eax,%edi
801038ec:	8d 40 60             	lea    0x60(%eax),%eax
801038ef:	83 c4 0c             	add    $0xc,%esp
801038f2:	68 00 04 00 00       	push   $0x400
801038f7:	50                   	push   %eax
801038f8:	8d 46 60             	lea    0x60(%esi),%eax
801038fb:	50                   	push   %eax
801038fc:	e8 4f 2b 00 00       	call   80106450 <memmove>
80103901:	89 34 24             	mov    %esi,(%esp)
80103904:	e8 f7 c9 ff ff       	call   80100300 <bwrite>
80103909:	89 3c 24             	mov    %edi,(%esp)
8010390c:	e8 2f ca ff ff       	call   80100340 <brelse>
80103911:	89 34 24             	mov    %esi,(%esp)
80103914:	e8 27 ca ff ff       	call   80100340 <brelse>
80103919:	83 c4 10             	add    $0x10,%esp
8010391c:	3b 1d 68 fa 12 80    	cmp    0x8012fa68,%ebx
80103922:	7c 94                	jl     801038b8 <end_op+0x68>
80103924:	e8 07 fd ff ff       	call   80103630 <write_head>
80103929:	e8 62 fd ff ff       	call   80103690 <install_trans>
8010392e:	c7 05 68 fa 12 80 00 	movl   $0x0,0x8012fa68
80103935:	00 00 00 
80103938:	e8 f3 fc ff ff       	call   80103630 <write_head>
8010393d:	83 ec 0c             	sub    $0xc,%esp
80103940:	68 20 fa 12 80       	push   $0x8012fa20
80103945:	e8 e6 28 00 00       	call   80106230 <acquire>
8010394a:	c7 04 24 20 fa 12 80 	movl   $0x8012fa20,(%esp)
80103951:	c7 05 60 fa 12 80 00 	movl   $0x0,0x8012fa60
80103958:	00 00 00 
8010395b:	e8 4e 24 00 00       	call   80105dae <wakeup>
80103960:	c7 04 24 20 fa 12 80 	movl   $0x8012fa20,(%esp)
80103967:	e8 e4 29 00 00       	call   80106350 <release>
8010396c:	83 c4 10             	add    $0x10,%esp
8010396f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103972:	5b                   	pop    %ebx
80103973:	5e                   	pop    %esi
80103974:	5f                   	pop    %edi
80103975:	5d                   	pop    %ebp
80103976:	c3                   	ret    
80103977:	89 f6                	mov    %esi,%esi
80103979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103980:	83 ec 0c             	sub    $0xc,%esp
80103983:	68 20 fa 12 80       	push   $0x8012fa20
80103988:	e8 21 24 00 00       	call   80105dae <wakeup>
8010398d:	c7 04 24 20 fa 12 80 	movl   $0x8012fa20,(%esp)
80103994:	e8 b7 29 00 00       	call   80106350 <release>
80103999:	83 c4 10             	add    $0x10,%esp
8010399c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010399f:	5b                   	pop    %ebx
801039a0:	5e                   	pop    %esi
801039a1:	5f                   	pop    %edi
801039a2:	5d                   	pop    %ebp
801039a3:	c3                   	ret    
801039a4:	83 ec 0c             	sub    $0xc,%esp
801039a7:	68 44 ec 10 80       	push   $0x8010ec44
801039ac:	e8 1f ca ff ff       	call   801003d0 <panic>
801039b1:	eb 0d                	jmp    801039c0 <log_write>
801039b3:	90                   	nop
801039b4:	90                   	nop
801039b5:	90                   	nop
801039b6:	90                   	nop
801039b7:	90                   	nop
801039b8:	90                   	nop
801039b9:	90                   	nop
801039ba:	90                   	nop
801039bb:	90                   	nop
801039bc:	90                   	nop
801039bd:	90                   	nop
801039be:	90                   	nop
801039bf:	90                   	nop

801039c0 <log_write>:
801039c0:	55                   	push   %ebp
801039c1:	89 e5                	mov    %esp,%ebp
801039c3:	53                   	push   %ebx
801039c4:	83 ec 04             	sub    $0x4,%esp
801039c7:	8b 15 68 fa 12 80    	mov    0x8012fa68,%edx
801039cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
801039d0:	83 fa 1d             	cmp    $0x1d,%edx
801039d3:	0f 8f d7 00 00 00    	jg     80103ab0 <log_write+0xf0>
801039d9:	a1 58 fa 12 80       	mov    0x8012fa58,%eax
801039de:	83 e8 01             	sub    $0x1,%eax
801039e1:	39 c2                	cmp    %eax,%edx
801039e3:	0f 8d c7 00 00 00    	jge    80103ab0 <log_write+0xf0>
801039e9:	a1 5c fa 12 80       	mov    0x8012fa5c,%eax
801039ee:	85 c0                	test   %eax,%eax
801039f0:	0f 8e c7 00 00 00    	jle    80103abd <log_write+0xfd>
801039f6:	66 83 7b 06 07       	cmpw   $0x7,0x6(%ebx)
801039fb:	0f 84 8f 00 00 00    	je     80103a90 <log_write+0xd0>
80103a01:	83 ec 0c             	sub    $0xc,%esp
80103a04:	68 20 fa 12 80       	push   $0x8012fa20
80103a09:	e8 22 28 00 00       	call   80106230 <acquire>
80103a0e:	8b 15 68 fa 12 80    	mov    0x8012fa68,%edx
80103a14:	83 c4 10             	add    $0x10,%esp
80103a17:	83 fa 00             	cmp    $0x0,%edx
80103a1a:	0f 8e 7c 00 00 00    	jle    80103a9c <log_write+0xdc>
80103a20:	8b 4b 08             	mov    0x8(%ebx),%ecx
80103a23:	31 c0                	xor    %eax,%eax
80103a25:	3b 0d 6c fa 12 80    	cmp    0x8012fa6c,%ecx
80103a2b:	75 0c                	jne    80103a39 <log_write+0x79>
80103a2d:	eb 51                	jmp    80103a80 <log_write+0xc0>
80103a2f:	90                   	nop
80103a30:	39 0c 85 6c fa 12 80 	cmp    %ecx,-0x7fed0594(,%eax,4)
80103a37:	74 47                	je     80103a80 <log_write+0xc0>
80103a39:	83 c0 01             	add    $0x1,%eax
80103a3c:	39 d0                	cmp    %edx,%eax
80103a3e:	75 f0                	jne    80103a30 <log_write+0x70>
80103a40:	89 0c 95 6c fa 12 80 	mov    %ecx,-0x7fed0594(,%edx,4)
80103a47:	83 c2 01             	add    $0x1,%edx
80103a4a:	89 15 68 fa 12 80    	mov    %edx,0x8012fa68
80103a50:	e8 9f 25 00 00       	call   80105ff4 <proc_get_cgroup>
80103a55:	83 ec 0c             	sub    $0xc,%esp
80103a58:	89 43 5c             	mov    %eax,0x5c(%ebx)
80103a5b:	50                   	push   %eax
80103a5c:	e8 6f a8 00 00       	call   8010e2d0 <cgroup_mem_stat_file_dirty_incr>
80103a61:	83 c4 10             	add    $0x10,%esp
80103a64:	83 0b 04             	orl    $0x4,(%ebx)
80103a67:	c7 45 08 20 fa 12 80 	movl   $0x8012fa20,0x8(%ebp)
80103a6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a71:	c9                   	leave  
80103a72:	e9 d9 28 00 00       	jmp    80106350 <release>
80103a77:	89 f6                	mov    %esi,%esi
80103a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103a80:	89 0c 85 6c fa 12 80 	mov    %ecx,-0x7fed0594(,%eax,4)
80103a87:	eb db                	jmp    80103a64 <log_write+0xa4>
80103a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a90:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103a93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a96:	c9                   	leave  
80103a97:	e9 64 c8 ff ff       	jmp    80100300 <bwrite>
80103a9c:	8b 43 08             	mov    0x8(%ebx),%eax
80103a9f:	a3 6c fa 12 80       	mov    %eax,0x8012fa6c
80103aa4:	75 be                	jne    80103a64 <log_write+0xa4>
80103aa6:	eb 9f                	jmp    80103a47 <log_write+0x87>
80103aa8:	90                   	nop
80103aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ab0:	83 ec 0c             	sub    $0xc,%esp
80103ab3:	68 53 ec 10 80       	push   $0x8010ec53
80103ab8:	e8 13 c9 ff ff       	call   801003d0 <panic>
80103abd:	83 ec 0c             	sub    $0xc,%esp
80103ac0:	68 69 ec 10 80       	push   $0x8010ec69
80103ac5:	e8 06 c9 ff ff       	call   801003d0 <panic>
80103aca:	66 90                	xchg   %ax,%ax
80103acc:	66 90                	xchg   %ax,%ax
80103ace:	66 90                	xchg   %ax,%ax

80103ad0 <mpmain>:
80103ad0:	55                   	push   %ebp
80103ad1:	89 e5                	mov    %esp,%ebp
80103ad3:	53                   	push   %ebx
80103ad4:	83 ec 04             	sub    $0x4,%esp
80103ad7:	e8 2c 17 00 00       	call   80105208 <cpuid>
80103adc:	89 c3                	mov    %eax,%ebx
80103ade:	e8 25 17 00 00       	call   80105208 <cpuid>
80103ae3:	83 ec 04             	sub    $0x4,%esp
80103ae6:	53                   	push   %ebx
80103ae7:	50                   	push   %eax
80103ae8:	68 84 ec 10 80       	push   $0x8010ec84
80103aed:	e8 6e cb ff ff       	call   80100660 <cprintf>
80103af2:	e8 c9 45 00 00       	call   801080c0 <idtinit>
80103af7:	e8 b0 16 00 00       	call   801051ac <mycpu>
80103afc:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80103afe:	b8 01 00 00 00       	mov    $0x1,%eax
80103b03:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80103b0a:	e8 26 1d 00 00       	call   80105835 <scheduler>
80103b0f:	90                   	nop

80103b10 <mpenter>:
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	83 ec 08             	sub    $0x8,%esp
80103b16:	e8 15 57 00 00       	call   80109230 <switchkvm>
80103b1b:	e8 10 56 00 00       	call   80109130 <seginit>
80103b20:	e8 4b f7 ff ff       	call   80103270 <lapicinit>
80103b25:	e8 a6 ff ff ff       	call   80103ad0 <mpmain>
80103b2a:	66 90                	xchg   %ax,%ax
80103b2c:	66 90                	xchg   %ax,%ax
80103b2e:	66 90                	xchg   %ax,%ax

80103b30 <main>:
80103b30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103b34:	83 e4 f0             	and    $0xfffffff0,%esp
80103b37:	ff 71 fc             	pushl  -0x4(%ecx)
80103b3a:	55                   	push   %ebp
80103b3b:	89 e5                	mov    %esp,%ebp
80103b3d:	53                   	push   %ebx
80103b3e:	51                   	push   %ecx
80103b3f:	bb 00 05 13 80       	mov    $0x80130500,%ebx
80103b44:	83 ec 08             	sub    $0x8,%esp
80103b47:	68 00 00 40 80       	push   $0x80400000
80103b4c:	68 54 a6 14 80       	push   $0x8014a654
80103b51:	e8 9a f2 ff ff       	call   80102df0 <kinit1>
80103b56:	e8 55 5c 00 00       	call   801097b0 <kvmalloc>
80103b5b:	e8 10 0c 00 00       	call   80104770 <mpinit>
80103b60:	e8 0b f7 ff ff       	call   80103270 <lapicinit>
80103b65:	e8 c6 55 00 00       	call   80109130 <seginit>
80103b6a:	e8 c1 10 00 00       	call   80104c30 <picinit>
80103b6f:	e8 9c f0 ff ff       	call   80102c10 <ioapicinit>
80103b74:	e8 b7 d0 ff ff       	call   80100c30 <consoleinit>
80103b79:	e8 12 d1 ff ff       	call   80100c90 <ttyinit>
80103b7e:	e8 7d 48 00 00       	call   80108400 <uartinit>
80103b83:	e8 0a 16 00 00       	call   80105192 <pinit>
80103b88:	e8 93 44 00 00       	call   80108020 <tvinit>
80103b8d:	e8 ae c4 ff ff       	call   80100040 <binit>
80103b92:	e8 a9 d9 ff ff       	call   80101540 <fileinit>
80103b97:	e8 54 ee ff ff       	call   801029f0 <ideinit>
80103b9c:	83 c4 0c             	add    $0xc,%esp
80103b9f:	68 8a 00 00 00       	push   $0x8a
80103ba4:	68 8c 04 12 80       	push   $0x8012048c
80103ba9:	68 00 70 00 80       	push   $0x80007000
80103bae:	e8 9d 28 00 00       	call   80106450 <memmove>
80103bb3:	69 05 80 0a 13 80 b0 	imul   $0xb0,0x80130a80,%eax
80103bba:	00 00 00 
80103bbd:	83 c4 10             	add    $0x10,%esp
80103bc0:	05 00 05 13 80       	add    $0x80130500,%eax
80103bc5:	39 d8                	cmp    %ebx,%eax
80103bc7:	76 6a                	jbe    80103c33 <main+0x103>
80103bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103bd0:	e8 d7 15 00 00       	call   801051ac <mycpu>
80103bd5:	39 d8                	cmp    %ebx,%eax
80103bd7:	74 41                	je     80103c1a <main+0xea>
80103bd9:	e8 f2 f3 ff ff       	call   80102fd0 <kalloc>
80103bde:	05 00 10 00 00       	add    $0x1000,%eax
80103be3:	c7 05 f8 6f 00 80 10 	movl   $0x80103b10,0x80006ff8
80103bea:	3b 10 80 
80103bed:	c7 05 f4 6f 00 80 00 	movl   $0x11f000,0x80006ff4
80103bf4:	f0 11 00 
80103bf7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80103bfc:	0f b6 03             	movzbl (%ebx),%eax
80103bff:	83 ec 08             	sub    $0x8,%esp
80103c02:	68 00 70 00 00       	push   $0x7000
80103c07:	50                   	push   %eax
80103c08:	e8 b3 f7 ff ff       	call   801033c0 <lapicstartap>
80103c0d:	83 c4 10             	add    $0x10,%esp
80103c10:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103c16:	85 c0                	test   %eax,%eax
80103c18:	74 f6                	je     80103c10 <main+0xe0>
80103c1a:	69 05 80 0a 13 80 b0 	imul   $0xb0,0x80130a80,%eax
80103c21:	00 00 00 
80103c24:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80103c2a:	05 00 05 13 80       	add    $0x80130500,%eax
80103c2f:	39 c3                	cmp    %eax,%ebx
80103c31:	72 9d                	jb     80103bd0 <main+0xa0>
80103c33:	83 ec 08             	sub    $0x8,%esp
80103c36:	68 00 00 00 8e       	push   $0x8e000000
80103c3b:	68 00 00 40 80       	push   $0x80400000
80103c40:	e8 1b f2 ff ff       	call   80102e60 <kinit2>
80103c45:	e8 d6 8f 00 00       	call   8010cc20 <cginit>
80103c4a:	e8 1c 16 00 00       	call   8010526b <userinit>
80103c4f:	e8 ac d1 ff ff       	call   80100e00 <devinit>
80103c54:	e8 36 0d 00 00       	call   8010498f <namespaceinit>
80103c59:	e8 72 fe ff ff       	call   80103ad0 <mpmain>

80103c5e <allocmntlist>:
80103c5e:	55                   	push   %ebp
80103c5f:	89 e5                	mov    %esp,%ebp
80103c61:	53                   	push   %ebx
80103c62:	83 ec 10             	sub    $0x10,%esp
80103c65:	68 00 fb 12 80       	push   $0x8012fb00
80103c6a:	e8 c1 25 00 00       	call   80106230 <acquire>
80103c6f:	83 c4 10             	add    $0x10,%esp
80103c72:	ba 00 00 00 00       	mov    $0x0,%edx
80103c77:	eb 03                	jmp    80103c7c <allocmntlist+0x1e>
80103c79:	83 c2 01             	add    $0x1,%edx
80103c7c:	83 fa 09             	cmp    $0x9,%edx
80103c7f:	7f 13                	jg     80103c94 <allocmntlist+0x36>
80103c81:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
80103c84:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80103c8b:	83 b8 3c fb 12 80 00 	cmpl   $0x0,-0x7fed04c4(%eax)
80103c92:	75 e5                	jne    80103c79 <allocmntlist+0x1b>
80103c94:	83 fa 0a             	cmp    $0xa,%edx
80103c97:	75 0d                	jne    80103ca6 <allocmntlist+0x48>
80103c99:	83 ec 0c             	sub    $0xc,%esp
80103c9c:	68 98 ec 10 80       	push   $0x8010ec98
80103ca1:	e8 2a c7 ff ff       	call   801003d0 <panic>
80103ca6:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
80103cad:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
80103cb0:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80103cb7:	89 d9                	mov    %ebx,%ecx
80103cb9:	81 c3 34 fb 12 80    	add    $0x8012fb34,%ebx
80103cbf:	c7 81 3c fb 12 80 01 	movl   $0x1,-0x7fed04c4(%ecx)
80103cc6:	00 00 00 
80103cc9:	83 ec 0c             	sub    $0xc,%esp
80103ccc:	68 00 fb 12 80       	push   $0x8012fb00
80103cd1:	e8 7a 26 00 00       	call   80106350 <release>
80103cd6:	89 d8                	mov    %ebx,%eax
80103cd8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103cdb:	c9                   	leave  
80103cdc:	c3                   	ret    

80103cdd <shallowcopyactivemounts>:
80103cdd:	55                   	push   %ebp
80103cde:	89 e5                	mov    %esp,%ebp
80103ce0:	57                   	push   %edi
80103ce1:	56                   	push   %esi
80103ce2:	53                   	push   %ebx
80103ce3:	83 ec 1c             	sub    $0x1c,%esp
80103ce6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80103ce9:	e8 35 15 00 00       	call   80105223 <myproc>
80103cee:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103cf4:	8b 40 04             	mov    0x4(%eax),%eax
80103cf7:	8b 70 3c             	mov    0x3c(%eax),%esi
80103cfa:	bf 00 00 00 00       	mov    $0x0,%edi
80103cff:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80103d06:	eb 5a                	jmp    80103d62 <shallowcopyactivemounts+0x85>
80103d08:	e8 51 ff ff ff       	call   80103c5e <allocmntlist>
80103d0d:	89 c3                	mov    %eax,%ebx
80103d0f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80103d13:	75 03                	jne    80103d18 <shallowcopyactivemounts+0x3b>
80103d15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103d18:	c7 43 08 01 00 00 00 	movl   $0x1,0x8(%ebx)
80103d1f:	83 ec 0c             	sub    $0xc,%esp
80103d22:	ff 76 04             	pushl  0x4(%esi)
80103d25:	e8 76 e1 ff ff       	call   80101ea0 <idup>
80103d2a:	89 43 04             	mov    %eax,0x4(%ebx)
80103d2d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d33:	8b 46 0c             	mov    0xc(%esi),%eax
80103d36:	89 43 0c             	mov    %eax,0xc(%ebx)
80103d39:	89 04 24             	mov    %eax,(%esp)
80103d3c:	e8 cf d1 ff ff       	call   80100f10 <deviceget>
80103d41:	83 c4 10             	add    $0x10,%esp
80103d44:	85 ff                	test   %edi,%edi
80103d46:	74 03                	je     80103d4b <shallowcopyactivemounts+0x6e>
80103d48:	89 5f 10             	mov    %ebx,0x10(%edi)
80103d4b:	e8 d3 14 00 00       	call   80105223 <myproc>
80103d50:	39 b0 8c 00 00 00    	cmp    %esi,0x8c(%eax)
80103d56:	75 05                	jne    80103d5d <shallowcopyactivemounts+0x80>
80103d58:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103d5b:	89 18                	mov    %ebx,(%eax)
80103d5d:	8b 76 10             	mov    0x10(%esi),%esi
80103d60:	89 df                	mov    %ebx,%edi
80103d62:	85 f6                	test   %esi,%esi
80103d64:	75 a2                	jne    80103d08 <shallowcopyactivemounts+0x2b>
80103d66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103d69:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103d6c:	5b                   	pop    %ebx
80103d6d:	5e                   	pop    %esi
80103d6e:	5f                   	pop    %edi
80103d6f:	5d                   	pop    %ebp
80103d70:	c3                   	ret    

80103d71 <getactivemounts>:
80103d71:	55                   	push   %ebp
80103d72:	89 e5                	mov    %esp,%ebp
80103d74:	83 ec 08             	sub    $0x8,%esp
80103d77:	e8 a7 14 00 00       	call   80105223 <myproc>
80103d7c:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103d82:	8b 40 04             	mov    0x4(%eax),%eax
80103d85:	8b 40 3c             	mov    0x3c(%eax),%eax
80103d88:	c9                   	leave  
80103d89:	c3                   	ret    

80103d8a <addmountinternal>:
80103d8a:	55                   	push   %ebp
80103d8b:	89 e5                	mov    %esp,%ebp
80103d8d:	53                   	push   %ebx
80103d8e:	83 ec 04             	sub    $0x4,%esp
80103d91:	89 c3                	mov    %eax,%ebx
80103d93:	89 48 04             	mov    %ecx,0x4(%eax)
80103d96:	89 50 0c             	mov    %edx,0xc(%eax)
80103d99:	8b 45 08             	mov    0x8(%ebp),%eax
80103d9c:	89 03                	mov    %eax,(%ebx)
80103d9e:	e8 ce ff ff ff       	call   80103d71 <getactivemounts>
80103da3:	89 43 10             	mov    %eax,0x10(%ebx)
80103da6:	e8 78 14 00 00       	call   80105223 <myproc>
80103dab:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103db1:	8b 40 04             	mov    0x4(%eax),%eax
80103db4:	89 58 3c             	mov    %ebx,0x3c(%eax)
80103db7:	83 c4 04             	add    $0x4,%esp
80103dba:	5b                   	pop    %ebx
80103dbb:	5d                   	pop    %ebp
80103dbc:	c3                   	ret    

80103dbd <getinitialrootmount>:
80103dbd:	55                   	push   %ebp
80103dbe:	89 e5                	mov    %esp,%ebp
80103dc0:	b8 34 fb 12 80       	mov    $0x8012fb34,%eax
80103dc5:	5d                   	pop    %ebp
80103dc6:	c3                   	ret    

80103dc7 <getrootmount>:
80103dc7:	55                   	push   %ebp
80103dc8:	89 e5                	mov    %esp,%ebp
80103dca:	83 ec 08             	sub    $0x8,%esp
80103dcd:	e8 51 14 00 00       	call   80105223 <myproc>
80103dd2:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103dd8:	8b 40 04             	mov    0x4(%eax),%eax
80103ddb:	8b 40 38             	mov    0x38(%eax),%eax
80103dde:	c9                   	leave  
80103ddf:	c3                   	ret    

80103de0 <mntinit>:
80103de0:	55                   	push   %ebp
80103de1:	89 e5                	mov    %esp,%ebp
80103de3:	53                   	push   %ebx
80103de4:	83 ec 0c             	sub    $0xc,%esp
80103de7:	68 b2 ec 10 80       	push   $0x8010ecb2
80103dec:	68 00 fb 12 80       	push   $0x8012fb00
80103df1:	e8 3a 23 00 00       	call   80106130 <initlock>
80103df6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80103dfd:	b9 00 00 00 00       	mov    $0x0,%ecx
80103e02:	ba 01 00 00 00       	mov    $0x1,%edx
80103e07:	b8 34 fb 12 80       	mov    $0x8012fb34,%eax
80103e0c:	e8 79 ff ff ff       	call   80103d8a <addmountinternal>
80103e11:	c7 05 3c fb 12 80 01 	movl   $0x1,0x8012fb3c
80103e18:	00 00 00 
80103e1b:	e8 03 14 00 00       	call   80105223 <myproc>
80103e20:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103e26:	8b 58 04             	mov    0x4(%eax),%ebx
80103e29:	e8 8f ff ff ff       	call   80103dbd <getinitialrootmount>
80103e2e:	89 43 38             	mov    %eax,0x38(%ebx)
80103e31:	83 c4 10             	add    $0x10,%esp
80103e34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103e37:	c9                   	leave  
80103e38:	c3                   	ret    

80103e39 <mntdup>:
80103e39:	55                   	push   %ebp
80103e3a:	89 e5                	mov    %esp,%ebp
80103e3c:	53                   	push   %ebx
80103e3d:	83 ec 10             	sub    $0x10,%esp
80103e40:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e43:	68 00 fb 12 80       	push   $0x8012fb00
80103e48:	e8 e3 23 00 00       	call   80106230 <acquire>
80103e4d:	8b 43 08             	mov    0x8(%ebx),%eax
80103e50:	83 c0 01             	add    $0x1,%eax
80103e53:	89 43 08             	mov    %eax,0x8(%ebx)
80103e56:	c7 04 24 00 fb 12 80 	movl   $0x8012fb00,(%esp)
80103e5d:	e8 ee 24 00 00       	call   80106350 <release>
80103e62:	89 d8                	mov    %ebx,%eax
80103e64:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103e67:	c9                   	leave  
80103e68:	c3                   	ret    

80103e69 <fixparents>:
80103e69:	55                   	push   %ebp
80103e6a:	89 e5                	mov    %esp,%ebp
80103e6c:	56                   	push   %esi
80103e6d:	53                   	push   %ebx
80103e6e:	89 c6                	mov    %eax,%esi
80103e70:	e8 ae 13 00 00       	call   80105223 <myproc>
80103e75:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103e7b:	8b 40 04             	mov    0x4(%eax),%eax
80103e7e:	8b 58 3c             	mov    0x3c(%eax),%ebx
80103e81:	eb 4d                	jmp    80103ed0 <fixparents+0x67>
80103e83:	83 3b 00             	cmpl   $0x0,(%ebx)
80103e86:	74 42                	je     80103eca <fixparents+0x61>
80103e88:	e8 96 13 00 00       	call   80105223 <myproc>
80103e8d:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103e93:	8b 40 04             	mov    0x4(%eax),%eax
80103e96:	8b 40 3c             	mov    0x3c(%eax),%eax
80103e99:	89 f2                	mov    %esi,%edx
80103e9b:	eb 06                	jmp    80103ea3 <fixparents+0x3a>
80103e9d:	8b 40 10             	mov    0x10(%eax),%eax
80103ea0:	8b 52 10             	mov    0x10(%edx),%edx
80103ea3:	85 c0                	test   %eax,%eax
80103ea5:	74 04                	je     80103eab <fixparents+0x42>
80103ea7:	39 03                	cmp    %eax,(%ebx)
80103ea9:	75 f2                	jne    80103e9d <fixparents+0x34>
80103eab:	85 c0                	test   %eax,%eax
80103ead:	75 0d                	jne    80103ebc <fixparents+0x53>
80103eaf:	83 ec 0c             	sub    $0xc,%esp
80103eb2:	68 bd ec 10 80       	push   $0x8010ecbd
80103eb7:	e8 14 c5 ff ff       	call   801003d0 <panic>
80103ebc:	83 ec 0c             	sub    $0xc,%esp
80103ebf:	52                   	push   %edx
80103ec0:	e8 74 ff ff ff       	call   80103e39 <mntdup>
80103ec5:	89 06                	mov    %eax,(%esi)
80103ec7:	83 c4 10             	add    $0x10,%esp
80103eca:	8b 76 10             	mov    0x10(%esi),%esi
80103ecd:	8b 5b 10             	mov    0x10(%ebx),%ebx
80103ed0:	85 db                	test   %ebx,%ebx
80103ed2:	75 af                	jne    80103e83 <fixparents+0x1a>
80103ed4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ed7:	5b                   	pop    %ebx
80103ed8:	5e                   	pop    %esi
80103ed9:	5d                   	pop    %ebp
80103eda:	c3                   	ret    

80103edb <mntput>:
80103edb:	55                   	push   %ebp
80103edc:	89 e5                	mov    %esp,%ebp
80103ede:	53                   	push   %ebx
80103edf:	83 ec 10             	sub    $0x10,%esp
80103ee2:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103ee5:	68 00 fb 12 80       	push   $0x8012fb00
80103eea:	e8 41 23 00 00       	call   80106230 <acquire>
80103eef:	8b 43 08             	mov    0x8(%ebx),%eax
80103ef2:	83 e8 01             	sub    $0x1,%eax
80103ef5:	89 43 08             	mov    %eax,0x8(%ebx)
80103ef8:	c7 04 24 00 fb 12 80 	movl   $0x8012fb00,(%esp)
80103eff:	e8 4c 24 00 00       	call   80106350 <release>
80103f04:	83 c4 10             	add    $0x10,%esp
80103f07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f0a:	c9                   	leave  
80103f0b:	c3                   	ret    

80103f0c <mount>:
80103f0c:	55                   	push   %ebp
80103f0d:	89 e5                	mov    %esp,%ebp
80103f0f:	57                   	push   %edi
80103f10:	56                   	push   %esi
80103f11:	53                   	push   %ebx
80103f12:	83 ec 1c             	sub    $0x1c,%esp
80103f15:	8b 75 08             	mov    0x8(%ebp),%esi
80103f18:	8b 5d 10             	mov    0x10(%ebp),%ebx
80103f1b:	e8 3e fd ff ff       	call   80103c5e <allocmntlist>
80103f20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103f23:	83 ec 0c             	sub    $0xc,%esp
80103f26:	ff 75 0c             	pushl  0xc(%ebp)
80103f29:	e8 f2 ce ff ff       	call   80100e20 <getorcreatedevice>
80103f2e:	83 c4 10             	add    $0x10,%esp
80103f31:	85 c0                	test   %eax,%eax
80103f33:	79 24                	jns    80103f59 <mount+0x4d>
80103f35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103f38:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80103f3f:	83 ec 0c             	sub    $0xc,%esp
80103f42:	68 da ec 10 80       	push   $0x8010ecda
80103f47:	e8 14 c7 ff ff       	call   80100660 <cprintf>
80103f4c:	83 c4 10             	add    $0x10,%esp
80103f4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f54:	e9 b1 00 00 00       	jmp    8010400a <mount+0xfe>
80103f59:	89 c7                	mov    %eax,%edi
80103f5b:	e8 c3 12 00 00       	call   80105223 <myproc>
80103f60:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103f66:	8b 40 04             	mov    0x4(%eax),%eax
80103f69:	83 ec 0c             	sub    $0xc,%esp
80103f6c:	83 c0 04             	add    $0x4,%eax
80103f6f:	50                   	push   %eax
80103f70:	e8 bb 22 00 00       	call   80106230 <acquire>
80103f75:	e8 f7 fd ff ff       	call   80103d71 <getactivemounts>
80103f7a:	83 c4 10             	add    $0x10,%esp
80103f7d:	eb 4e                	jmp    80103fcd <mount+0xc1>
80103f7f:	39 18                	cmp    %ebx,(%eax)
80103f81:	75 47                	jne    80103fca <mount+0xbe>
80103f83:	39 70 04             	cmp    %esi,0x4(%eax)
80103f86:	75 42                	jne    80103fca <mount+0xbe>
80103f88:	e8 96 12 00 00       	call   80105223 <myproc>
80103f8d:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103f93:	8b 40 04             	mov    0x4(%eax),%eax
80103f96:	83 ec 0c             	sub    $0xc,%esp
80103f99:	83 c0 04             	add    $0x4,%eax
80103f9c:	50                   	push   %eax
80103f9d:	e8 ae 23 00 00       	call   80106350 <release>
80103fa2:	89 3c 24             	mov    %edi,(%esp)
80103fa5:	e8 b6 cf ff ff       	call   80100f60 <deviceput>
80103faa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103fad:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80103fb4:	c7 04 24 28 ed 10 80 	movl   $0x8010ed28,(%esp)
80103fbb:	e8 a0 c6 ff ff       	call   80100660 <cprintf>
80103fc0:	83 c4 10             	add    $0x10,%esp
80103fc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fc8:	eb 40                	jmp    8010400a <mount+0xfe>
80103fca:	8b 40 10             	mov    0x10(%eax),%eax
80103fcd:	85 c0                	test   %eax,%eax
80103fcf:	75 ae                	jne    80103f7f <mount+0x73>
80103fd1:	83 ec 0c             	sub    $0xc,%esp
80103fd4:	53                   	push   %ebx
80103fd5:	e8 5f fe ff ff       	call   80103e39 <mntdup>
80103fda:	89 1c 24             	mov    %ebx,(%esp)
80103fdd:	89 f1                	mov    %esi,%ecx
80103fdf:	89 fa                	mov    %edi,%edx
80103fe1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103fe4:	e8 a1 fd ff ff       	call   80103d8a <addmountinternal>
80103fe9:	e8 35 12 00 00       	call   80105223 <myproc>
80103fee:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80103ff4:	8b 40 04             	mov    0x4(%eax),%eax
80103ff7:	83 c0 04             	add    $0x4,%eax
80103ffa:	89 04 24             	mov    %eax,(%esp)
80103ffd:	e8 4e 23 00 00       	call   80106350 <release>
80104002:	83 c4 10             	add    $0x10,%esp
80104005:	b8 00 00 00 00       	mov    $0x0,%eax
8010400a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010400d:	5b                   	pop    %ebx
8010400e:	5e                   	pop    %esi
8010400f:	5f                   	pop    %edi
80104010:	5d                   	pop    %ebp
80104011:	c3                   	ret    

80104012 <umount>:
80104012:	55                   	push   %ebp
80104013:	89 e5                	mov    %esp,%ebp
80104015:	57                   	push   %edi
80104016:	56                   	push   %esi
80104017:	53                   	push   %ebx
80104018:	83 ec 0c             	sub    $0xc,%esp
8010401b:	8b 7d 08             	mov    0x8(%ebp),%edi
8010401e:	e8 00 12 00 00       	call   80105223 <myproc>
80104023:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104029:	8b 40 04             	mov    0x4(%eax),%eax
8010402c:	83 ec 0c             	sub    $0xc,%esp
8010402f:	83 c0 04             	add    $0x4,%eax
80104032:	50                   	push   %eax
80104033:	e8 f8 21 00 00       	call   80106230 <acquire>
80104038:	e8 34 fd ff ff       	call   80103d71 <getactivemounts>
8010403d:	89 c3                	mov    %eax,%ebx
8010403f:	e8 df 11 00 00       	call   80105223 <myproc>
80104044:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
8010404a:	8b 70 04             	mov    0x4(%eax),%esi
8010404d:	83 c6 3c             	add    $0x3c,%esi
80104050:	83 c4 10             	add    $0x10,%esp
80104053:	eb 0a                	jmp    8010405f <umount+0x4d>
80104055:	39 fb                	cmp    %edi,%ebx
80104057:	74 0a                	je     80104063 <umount+0x51>
80104059:	8d 73 10             	lea    0x10(%ebx),%esi
8010405c:	8b 5b 10             	mov    0x10(%ebx),%ebx
8010405f:	85 db                	test   %ebx,%ebx
80104061:	75 f2                	jne    80104055 <umount+0x43>
80104063:	85 db                	test   %ebx,%ebx
80104065:	75 33                	jne    8010409a <umount+0x88>
80104067:	e8 b7 11 00 00       	call   80105223 <myproc>
8010406c:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104072:	8b 40 04             	mov    0x4(%eax),%eax
80104075:	83 ec 0c             	sub    $0xc,%esp
80104078:	83 c0 04             	add    $0x4,%eax
8010407b:	50                   	push   %eax
8010407c:	e8 cf 22 00 00       	call   80106350 <release>
80104081:	c7 04 24 f4 ec 10 80 	movl   $0x8010ecf4,(%esp)
80104088:	e8 d3 c5 ff ff       	call   80100660 <cprintf>
8010408d:	83 c4 10             	add    $0x10,%esp
80104090:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104095:	e9 ee 00 00 00       	jmp    80104188 <umount+0x176>
8010409a:	83 3b 00             	cmpl   $0x0,(%ebx)
8010409d:	75 33                	jne    801040d2 <umount+0xc0>
8010409f:	e8 7f 11 00 00       	call   80105223 <myproc>
801040a4:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
801040aa:	8b 40 04             	mov    0x4(%eax),%eax
801040ad:	83 ec 0c             	sub    $0xc,%esp
801040b0:	83 c0 04             	add    $0x4,%eax
801040b3:	50                   	push   %eax
801040b4:	e8 97 22 00 00       	call   80106350 <release>
801040b9:	c7 04 24 ff ec 10 80 	movl   $0x8010ecff,(%esp)
801040c0:	e8 9b c5 ff ff       	call   80100660 <cprintf>
801040c5:	83 c4 10             	add    $0x10,%esp
801040c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040cd:	e9 b6 00 00 00       	jmp    80104188 <umount+0x176>
801040d2:	83 ec 0c             	sub    $0xc,%esp
801040d5:	68 00 fb 12 80       	push   $0x8012fb00
801040da:	e8 51 21 00 00       	call   80106230 <acquire>
801040df:	83 c4 10             	add    $0x10,%esp
801040e2:	83 7b 08 02          	cmpl   $0x2,0x8(%ebx)
801040e6:	7e 30                	jle    80104118 <umount+0x106>
801040e8:	83 ec 0c             	sub    $0xc,%esp
801040eb:	68 00 fb 12 80       	push   $0x8012fb00
801040f0:	e8 5b 22 00 00       	call   80106350 <release>
801040f5:	e8 29 11 00 00       	call   80105223 <myproc>
801040fa:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104100:	8b 40 04             	mov    0x4(%eax),%eax
80104103:	83 c0 04             	add    $0x4,%eax
80104106:	89 04 24             	mov    %eax,(%esp)
80104109:	e8 42 22 00 00       	call   80106350 <release>
8010410e:	83 c4 10             	add    $0x10,%esp
80104111:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104116:	eb 70                	jmp    80104188 <umount+0x176>
80104118:	8b 43 10             	mov    0x10(%ebx),%eax
8010411b:	89 06                	mov    %eax,(%esi)
8010411d:	e8 01 11 00 00       	call   80105223 <myproc>
80104122:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104128:	8b 40 04             	mov    0x4(%eax),%eax
8010412b:	83 ec 0c             	sub    $0xc,%esp
8010412e:	83 c0 04             	add    $0x4,%eax
80104131:	50                   	push   %eax
80104132:	e8 19 22 00 00       	call   80106350 <release>
80104137:	8b 7b 04             	mov    0x4(%ebx),%edi
8010413a:	8b 73 0c             	mov    0xc(%ebx),%esi
8010413d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
80104144:	8b 13                	mov    (%ebx),%edx
80104146:	8b 42 08             	mov    0x8(%edx),%eax
80104149:	83 e8 01             	sub    $0x1,%eax
8010414c:	89 42 08             	mov    %eax,0x8(%edx)
8010414f:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104156:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010415d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80104164:	c7 04 24 00 fb 12 80 	movl   $0x8012fb00,(%esp)
8010416b:	e8 e0 21 00 00       	call   80106350 <release>
80104170:	89 3c 24             	mov    %edi,(%esp)
80104173:	e8 88 de ff ff       	call   80102000 <iput>
80104178:	89 34 24             	mov    %esi,(%esp)
8010417b:	e8 e0 cd ff ff       	call   80100f60 <deviceput>
80104180:	83 c4 10             	add    $0x10,%esp
80104183:	b8 00 00 00 00       	mov    $0x0,%eax
80104188:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010418b:	5b                   	pop    %ebx
8010418c:	5e                   	pop    %esi
8010418d:	5f                   	pop    %edi
8010418e:	5d                   	pop    %ebp
8010418f:	c3                   	ret    

80104190 <mntlookup>:
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	57                   	push   %edi
80104194:	56                   	push   %esi
80104195:	53                   	push   %ebx
80104196:	83 ec 0c             	sub    $0xc,%esp
80104199:	8b 75 08             	mov    0x8(%ebp),%esi
8010419c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010419f:	e8 7f 10 00 00       	call   80105223 <myproc>
801041a4:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
801041aa:	8b 40 04             	mov    0x4(%eax),%eax
801041ad:	83 ec 0c             	sub    $0xc,%esp
801041b0:	83 c0 04             	add    $0x4,%eax
801041b3:	50                   	push   %eax
801041b4:	e8 77 20 00 00       	call   80106230 <acquire>
801041b9:	e8 b3 fb ff ff       	call   80103d71 <getactivemounts>
801041be:	89 c3                	mov    %eax,%ebx
801041c0:	83 c4 10             	add    $0x10,%esp
801041c3:	eb 33                	jmp    801041f8 <mntlookup+0x68>
801041c5:	39 73 04             	cmp    %esi,0x4(%ebx)
801041c8:	75 2b                	jne    801041f5 <mntlookup+0x65>
801041ca:	39 3b                	cmp    %edi,(%ebx)
801041cc:	75 27                	jne    801041f5 <mntlookup+0x65>
801041ce:	e8 50 10 00 00       	call   80105223 <myproc>
801041d3:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
801041d9:	8b 40 04             	mov    0x4(%eax),%eax
801041dc:	83 ec 0c             	sub    $0xc,%esp
801041df:	83 c0 04             	add    $0x4,%eax
801041e2:	50                   	push   %eax
801041e3:	e8 68 21 00 00       	call   80106350 <release>
801041e8:	89 1c 24             	mov    %ebx,(%esp)
801041eb:	e8 49 fc ff ff       	call   80103e39 <mntdup>
801041f0:	83 c4 10             	add    $0x10,%esp
801041f3:	eb 29                	jmp    8010421e <mntlookup+0x8e>
801041f5:	8b 5b 10             	mov    0x10(%ebx),%ebx
801041f8:	85 db                	test   %ebx,%ebx
801041fa:	75 c9                	jne    801041c5 <mntlookup+0x35>
801041fc:	e8 22 10 00 00       	call   80105223 <myproc>
80104201:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104207:	8b 40 04             	mov    0x4(%eax),%eax
8010420a:	83 ec 0c             	sub    $0xc,%esp
8010420d:	83 c0 04             	add    $0x4,%eax
80104210:	50                   	push   %eax
80104211:	e8 3a 21 00 00       	call   80106350 <release>
80104216:	83 c4 10             	add    $0x10,%esp
80104219:	b8 00 00 00 00       	mov    $0x0,%eax
8010421e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104221:	5b                   	pop    %ebx
80104222:	5e                   	pop    %esi
80104223:	5f                   	pop    %edi
80104224:	5d                   	pop    %ebp
80104225:	c3                   	ret    

80104226 <printmounts>:
80104226:	55                   	push   %ebp
80104227:	89 e5                	mov    %esp,%ebp
80104229:	56                   	push   %esi
8010422a:	53                   	push   %ebx
8010422b:	e8 f3 0f 00 00       	call   80105223 <myproc>
80104230:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104236:	8b 40 04             	mov    0x4(%eax),%eax
80104239:	83 ec 0c             	sub    $0xc,%esp
8010423c:	83 c0 04             	add    $0x4,%eax
8010423f:	50                   	push   %eax
80104240:	e8 eb 1f 00 00       	call   80106230 <acquire>
80104245:	e8 27 fb ff ff       	call   80103d71 <getactivemounts>
8010424a:	89 c3                	mov    %eax,%ebx
8010424c:	83 c4 10             	add    $0x10,%esp
8010424f:	85 c0                	test   %eax,%eax
80104251:	75 10                	jne    80104263 <printmounts+0x3d>
80104253:	83 ec 0c             	sub    $0xc,%esp
80104256:	68 19 ed 10 80       	push   $0x8010ed19
8010425b:	e8 00 c4 ff ff       	call   80100660 <cprintf>
80104260:	83 c4 10             	add    $0x10,%esp
80104263:	be 00 00 00 00       	mov    $0x0,%esi
80104268:	eb 20                	jmp    8010428a <printmounts+0x64>
8010426a:	83 c6 01             	add    $0x1,%esi
8010426d:	83 ec 08             	sub    $0x8,%esp
80104270:	ff 73 08             	pushl  0x8(%ebx)
80104273:	ff 33                	pushl  (%ebx)
80104275:	ff 73 04             	pushl  0x4(%ebx)
80104278:	53                   	push   %ebx
80104279:	56                   	push   %esi
8010427a:	68 50 ed 10 80       	push   $0x8010ed50
8010427f:	e8 dc c3 ff ff       	call   80100660 <cprintf>
80104284:	8b 5b 10             	mov    0x10(%ebx),%ebx
80104287:	83 c4 20             	add    $0x20,%esp
8010428a:	85 db                	test   %ebx,%ebx
8010428c:	75 dc                	jne    8010426a <printmounts+0x44>
8010428e:	e8 90 0f 00 00       	call   80105223 <myproc>
80104293:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104299:	8b 40 04             	mov    0x4(%eax),%eax
8010429c:	83 ec 0c             	sub    $0xc,%esp
8010429f:	83 c0 04             	add    $0x4,%eax
801042a2:	50                   	push   %eax
801042a3:	e8 a8 20 00 00       	call   80106350 <release>
801042a8:	83 c4 10             	add    $0x10,%esp
801042ab:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042ae:	5b                   	pop    %ebx
801042af:	5e                   	pop    %esi
801042b0:	5d                   	pop    %ebp
801042b1:	c3                   	ret    

801042b2 <copyactivemounts>:
801042b2:	55                   	push   %ebp
801042b3:	89 e5                	mov    %esp,%ebp
801042b5:	57                   	push   %edi
801042b6:	56                   	push   %esi
801042b7:	53                   	push   %ebx
801042b8:	83 ec 1c             	sub    $0x1c,%esp
801042bb:	e8 63 0f 00 00       	call   80105223 <myproc>
801042c0:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
801042c6:	8b 40 04             	mov    0x4(%eax),%eax
801042c9:	83 ec 0c             	sub    $0xc,%esp
801042cc:	83 c0 04             	add    $0x4,%eax
801042cf:	50                   	push   %eax
801042d0:	e8 5b 1f 00 00       	call   80106230 <acquire>
801042d5:	e8 49 0f 00 00       	call   80105223 <myproc>
801042da:	8b b0 8c 00 00 00    	mov    0x8c(%eax),%esi
801042e0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801042e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801042ea:	e8 ee f9 ff ff       	call   80103cdd <shallowcopyactivemounts>
801042ef:	89 c3                	mov    %eax,%ebx
801042f1:	e8 73 fb ff ff       	call   80103e69 <fixparents>
801042f6:	e8 28 0f 00 00       	call   80105223 <myproc>
801042fb:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104301:	8b 40 04             	mov    0x4(%eax),%eax
80104304:	83 c0 04             	add    $0x4,%eax
80104307:	89 04 24             	mov    %eax,(%esp)
8010430a:	e8 41 20 00 00       	call   80106350 <release>
8010430f:	e8 0f 0f 00 00       	call   80105223 <myproc>
80104314:	89 c7                	mov    %eax,%edi
80104316:	83 c4 04             	add    $0x4,%esp
80104319:	ff 75 e4             	pushl  -0x1c(%ebp)
8010431c:	e8 18 fb ff ff       	call   80103e39 <mntdup>
80104321:	89 87 8c 00 00 00    	mov    %eax,0x8c(%edi)
80104327:	89 34 24             	mov    %esi,(%esp)
8010432a:	e8 ac fb ff ff       	call   80103edb <mntput>
8010432f:	89 d8                	mov    %ebx,%eax
80104331:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104334:	5b                   	pop    %ebx
80104335:	5e                   	pop    %esi
80104336:	5f                   	pop    %edi
80104337:	5d                   	pop    %ebp
80104338:	c3                   	ret    

80104339 <getroot>:
80104339:	55                   	push   %ebp
8010433a:	89 e5                	mov    %esp,%ebp
8010433c:	83 ec 08             	sub    $0x8,%esp
8010433f:	8b 45 08             	mov    0x8(%ebp),%eax
80104342:	85 c0                	test   %eax,%eax
80104344:	74 1f                	je     80104365 <getroot+0x2c>
80104346:	eb 02                	jmp    8010434a <getroot+0x11>
80104348:	89 d0                	mov    %edx,%eax
8010434a:	85 c0                	test   %eax,%eax
8010434c:	74 06                	je     80104354 <getroot+0x1b>
8010434e:	8b 10                	mov    (%eax),%edx
80104350:	85 d2                	test   %edx,%edx
80104352:	75 f4                	jne    80104348 <getroot+0xf>
80104354:	85 c0                	test   %eax,%eax
80104356:	75 12                	jne    8010436a <getroot+0x31>
80104358:	83 ec 0c             	sub    $0xc,%esp
8010435b:	68 88 ed 10 80       	push   $0x8010ed88
80104360:	e8 6b c0 ff ff       	call   801003d0 <panic>
80104365:	b8 00 00 00 00       	mov    $0x0,%eax
8010436a:	c9                   	leave  
8010436b:	c3                   	ret    

8010436c <allocmount_ns>:
8010436c:	55                   	push   %ebp
8010436d:	89 e5                	mov    %esp,%ebp
8010436f:	53                   	push   %ebx
80104370:	83 ec 10             	sub    $0x10,%esp
80104373:	68 00 fc 12 80       	push   $0x8012fc00
80104378:	e8 b3 1e 00 00       	call   80106230 <acquire>
8010437d:	ba 34 fc 12 80       	mov    $0x8012fc34,%edx
80104382:	83 c4 10             	add    $0x10,%esp
80104385:	b8 00 00 00 00       	mov    $0x0,%eax
8010438a:	eb 0b                	jmp    80104397 <allocmount_ns+0x2b>
8010438c:	83 c0 01             	add    $0x1,%eax
8010438f:	83 c2 40             	add    $0x40,%edx
80104392:	83 f8 0c             	cmp    $0xc,%eax
80104395:	74 32                	je     801043c9 <allocmount_ns+0x5d>
80104397:	83 3a 00             	cmpl   $0x0,(%edx)
8010439a:	75 f0                	jne    8010438c <allocmount_ns+0x20>
8010439c:	83 7a 3c 00          	cmpl   $0x0,0x3c(%edx)
801043a0:	75 ea                	jne    8010438c <allocmount_ns+0x20>
801043a2:	c1 e0 06             	shl    $0x6,%eax
801043a5:	89 c3                	mov    %eax,%ebx
801043a7:	c7 80 34 fc 12 80 01 	movl   $0x1,-0x7fed03cc(%eax)
801043ae:	00 00 00 
801043b1:	83 ec 0c             	sub    $0xc,%esp
801043b4:	68 00 fc 12 80       	push   $0x8012fc00
801043b9:	e8 92 1f 00 00       	call   80106350 <release>
801043be:	8d 83 34 fc 12 80    	lea    -0x7fed03cc(%ebx),%eax
801043c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043c7:	c9                   	leave  
801043c8:	c3                   	ret    
801043c9:	83 ec 0c             	sub    $0xc,%esp
801043cc:	68 00 fc 12 80       	push   $0x8012fc00
801043d1:	e8 7a 1f 00 00       	call   80106350 <release>
801043d6:	c7 04 24 ac ed 10 80 	movl   $0x8010edac,(%esp)
801043dd:	e8 ee bf ff ff       	call   801003d0 <panic>

801043e2 <mount_nsinit>:
801043e2:	55                   	push   %ebp
801043e3:	89 e5                	mov    %esp,%ebp
801043e5:	56                   	push   %esi
801043e6:	53                   	push   %ebx
801043e7:	83 ec 08             	sub    $0x8,%esp
801043ea:	68 c4 ed 10 80       	push   $0x8010edc4
801043ef:	68 00 fc 12 80       	push   $0x8012fc00
801043f4:	e8 37 1d 00 00       	call   80106130 <initlock>
801043f9:	bb 38 fc 12 80       	mov    $0x8012fc38,%ebx
801043fe:	be 38 ff 12 80       	mov    $0x8012ff38,%esi
80104403:	83 c4 10             	add    $0x10,%esp
80104406:	83 ec 08             	sub    $0x8,%esp
80104409:	68 cc ed 10 80       	push   $0x8010edcc
8010440e:	53                   	push   %ebx
8010440f:	e8 1c 1d 00 00       	call   80106130 <initlock>
80104414:	83 c3 40             	add    $0x40,%ebx
80104417:	83 c4 10             	add    $0x10,%esp
8010441a:	39 f3                	cmp    %esi,%ebx
8010441c:	75 e8                	jne    80104406 <mount_nsinit+0x24>
8010441e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104421:	5b                   	pop    %ebx
80104422:	5e                   	pop    %esi
80104423:	5d                   	pop    %ebp
80104424:	c3                   	ret    

80104425 <mount_nsdup>:
80104425:	55                   	push   %ebp
80104426:	89 e5                	mov    %esp,%ebp
80104428:	53                   	push   %ebx
80104429:	83 ec 10             	sub    $0x10,%esp
8010442c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010442f:	68 00 fc 12 80       	push   $0x8012fc00
80104434:	e8 f7 1d 00 00       	call   80106230 <acquire>
80104439:	83 03 01             	addl   $0x1,(%ebx)
8010443c:	c7 04 24 00 fc 12 80 	movl   $0x8012fc00,(%esp)
80104443:	e8 08 1f 00 00       	call   80106350 <release>
80104448:	89 d8                	mov    %ebx,%eax
8010444a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010444d:	c9                   	leave  
8010444e:	c3                   	ret    

8010444f <umountlist>:
8010444f:	55                   	push   %ebp
80104450:	89 e5                	mov    %esp,%ebp
80104452:	53                   	push   %ebx
80104453:	83 ec 04             	sub    $0x4,%esp
80104456:	8b 45 08             	mov    0x8(%ebp),%eax
80104459:	85 c0                	test   %eax,%eax
8010445b:	75 12                	jne    8010446f <umountlist+0x20>
8010445d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104460:	c9                   	leave  
80104461:	c3                   	ret    
80104462:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104469:	89 d8                	mov    %ebx,%eax
8010446b:	85 db                	test   %ebx,%ebx
8010446d:	74 ee                	je     8010445d <umountlist+0xe>
8010446f:	8b 58 10             	mov    0x10(%eax),%ebx
80104472:	83 38 00             	cmpl   $0x0,(%eax)
80104475:	74 eb                	je     80104462 <umountlist+0x13>
80104477:	83 ec 0c             	sub    $0xc,%esp
8010447a:	50                   	push   %eax
8010447b:	e8 92 fb ff ff       	call   80104012 <umount>
80104480:	83 c4 10             	add    $0x10,%esp
80104483:	85 c0                	test   %eax,%eax
80104485:	74 e2                	je     80104469 <umountlist+0x1a>
80104487:	83 ec 0c             	sub    $0xc,%esp
8010448a:	68 d8 ed 10 80       	push   $0x8010edd8
8010448f:	e8 3c bf ff ff       	call   801003d0 <panic>

80104494 <mount_nsleave>:
80104494:	55                   	push   %ebp
80104495:	89 e5                	mov    %esp,%ebp
80104497:	5d                   	pop    %ebp
80104498:	c3                   	ret    

80104499 <copymount_ns>:
80104499:	55                   	push   %ebp
8010449a:	89 e5                	mov    %esp,%ebp
8010449c:	53                   	push   %ebx
8010449d:	83 ec 04             	sub    $0x4,%esp
801044a0:	e8 c7 fe ff ff       	call   8010436c <allocmount_ns>
801044a5:	89 c3                	mov    %eax,%ebx
801044a7:	e8 06 fe ff ff       	call   801042b2 <copyactivemounts>
801044ac:	89 43 3c             	mov    %eax,0x3c(%ebx)
801044af:	83 ec 0c             	sub    $0xc,%esp
801044b2:	50                   	push   %eax
801044b3:	e8 81 fe ff ff       	call   80104339 <getroot>
801044b8:	89 43 38             	mov    %eax,0x38(%ebx)
801044bb:	89 d8                	mov    %ebx,%eax
801044bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044c0:	c9                   	leave  
801044c1:	c3                   	ret    

801044c2 <newmount_ns>:
801044c2:	55                   	push   %ebp
801044c3:	89 e5                	mov    %esp,%ebp
801044c5:	83 ec 08             	sub    $0x8,%esp
801044c8:	e8 9f fe ff ff       	call   8010436c <allocmount_ns>
801044cd:	c9                   	leave  
801044ce:	c3                   	ret    
801044cf:	90                   	nop

801044d0 <pid_ns_init>:
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	53                   	push   %ebx
801044d4:	bb 7c ff 12 80       	mov    $0x8012ff7c,%ebx
801044d9:	83 ec 0c             	sub    $0xc,%esp
801044dc:	68 fe ed 10 80       	push   $0x8010edfe
801044e1:	68 40 ff 12 80       	push   $0x8012ff40
801044e6:	e8 45 1c 00 00       	call   80106130 <initlock>
801044eb:	83 c4 10             	add    $0x10,%esp
801044ee:	66 90                	xchg   %ax,%ax
801044f0:	83 ec 08             	sub    $0x8,%esp
801044f3:	68 fe ed 10 80       	push   $0x8010edfe
801044f8:	53                   	push   %ebx
801044f9:	83 c3 44             	add    $0x44,%ebx
801044fc:	e8 2f 1c 00 00       	call   80106130 <initlock>
80104501:	c7 43 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebx)
80104508:	83 c4 10             	add    $0x10,%esp
8010450b:	81 fb cc 04 13 80    	cmp    $0x801304cc,%ebx
80104511:	75 dd                	jne    801044f0 <pid_ns_init+0x20>
80104513:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104516:	c9                   	leave  
80104517:	c3                   	ret    
80104518:	90                   	nop
80104519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104520 <pid_ns_put>:
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	53                   	push   %ebx
80104524:	83 ec 10             	sub    $0x10,%esp
80104527:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010452a:	68 40 ff 12 80       	push   $0x8012ff40
8010452f:	e8 fc 1c 00 00       	call   80106230 <acquire>
80104534:	8b 03                	mov    (%ebx),%eax
80104536:	83 c4 10             	add    $0x10,%esp
80104539:	85 c0                	test   %eax,%eax
8010453b:	74 15                	je     80104552 <pid_ns_put+0x32>
8010453d:	83 e8 01             	sub    $0x1,%eax
80104540:	89 03                	mov    %eax,(%ebx)
80104542:	c7 45 08 40 ff 12 80 	movl   $0x8012ff40,0x8(%ebp)
80104549:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010454c:	c9                   	leave  
8010454d:	e9 fe 1d 00 00       	jmp    80106350 <release>
80104552:	83 ec 0c             	sub    $0xc,%esp
80104555:	68 04 ee 10 80       	push   $0x8010ee04
8010455a:	e8 71 be ff ff       	call   801003d0 <panic>
8010455f:	90                   	nop

80104560 <pid_ns_get>:
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	53                   	push   %ebx
80104564:	83 ec 10             	sub    $0x10,%esp
80104567:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010456a:	68 40 ff 12 80       	push   $0x8012ff40
8010456f:	e8 bc 1c 00 00       	call   80106230 <acquire>
80104574:	83 03 01             	addl   $0x1,(%ebx)
80104577:	83 c4 10             	add    $0x10,%esp
8010457a:	c7 45 08 40 ff 12 80 	movl   $0x8012ff40,0x8(%ebp)
80104581:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104584:	c9                   	leave  
80104585:	e9 c6 1d 00 00       	jmp    80106350 <release>
8010458a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104590 <pid_ns_alloc>:
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	53                   	push   %ebx
80104594:	83 ec 10             	sub    $0x10,%esp
80104597:	68 40 ff 12 80       	push   $0x8012ff40
8010459c:	e8 8f 1c 00 00       	call   80106230 <acquire>
801045a1:	ba 74 ff 12 80       	mov    $0x8012ff74,%edx
801045a6:	83 c4 10             	add    $0x10,%esp
801045a9:	31 c0                	xor    %eax,%eax
801045ab:	90                   	nop
801045ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045b0:	8b 0a                	mov    (%edx),%ecx
801045b2:	85 c9                	test   %ecx,%ecx
801045b4:	74 2a                	je     801045e0 <pid_ns_alloc+0x50>
801045b6:	83 c0 01             	add    $0x1,%eax
801045b9:	83 c2 44             	add    $0x44,%edx
801045bc:	83 f8 14             	cmp    $0x14,%eax
801045bf:	75 ef                	jne    801045b0 <pid_ns_alloc+0x20>
801045c1:	83 ec 0c             	sub    $0xc,%esp
801045c4:	68 40 ff 12 80       	push   $0x8012ff40
801045c9:	e8 82 1d 00 00       	call   80106350 <release>
801045ce:	c7 04 24 19 ee 10 80 	movl   $0x8010ee19,(%esp)
801045d5:	e8 f6 bd ff ff       	call   801003d0 <panic>
801045da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045e0:	89 c2                	mov    %eax,%edx
801045e2:	83 ec 0c             	sub    $0xc,%esp
801045e5:	c1 e2 06             	shl    $0x6,%edx
801045e8:	68 40 ff 12 80       	push   $0x8012ff40
801045ed:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
801045f0:	c7 83 74 ff 12 80 01 	movl   $0x1,-0x7fed008c(%ebx)
801045f7:	00 00 00 
801045fa:	e8 51 1d 00 00       	call   80106350 <release>
801045ff:	8d 83 74 ff 12 80    	lea    -0x7fed008c(%ebx),%eax
80104605:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104608:	c9                   	leave  
80104609:	c3                   	ret    
8010460a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104610 <pid_ns_init_ns>:
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	8b 45 08             	mov    0x8(%ebp),%eax
80104616:	8b 55 0c             	mov    0xc(%ebp),%edx
80104619:	c7 40 3c 01 00 00 00 	movl   $0x1,0x3c(%eax)
80104620:	89 50 04             	mov    %edx,0x4(%eax)
80104623:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
8010462a:	5d                   	pop    %ebp
8010462b:	c3                   	ret    
8010462c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104630 <pid_ns_dup>:
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	53                   	push   %ebx
80104634:	83 ec 10             	sub    $0x10,%esp
80104637:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010463a:	68 40 ff 12 80       	push   $0x8012ff40
8010463f:	e8 ec 1b 00 00       	call   80106230 <acquire>
80104644:	83 03 01             	addl   $0x1,(%ebx)
80104647:	c7 04 24 40 ff 12 80 	movl   $0x8012ff40,(%esp)
8010464e:	e8 fd 1c 00 00       	call   80106350 <release>
80104653:	89 d8                	mov    %ebx,%eax
80104655:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104658:	c9                   	leave  
80104659:	c3                   	ret    
8010465a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104660 <pid_ns_new>:
80104660:	55                   	push   %ebp
80104661:	89 e5                	mov    %esp,%ebp
80104663:	83 ec 08             	sub    $0x8,%esp
80104666:	e8 25 ff ff ff       	call   80104590 <pid_ns_alloc>
8010466b:	8b 55 08             	mov    0x8(%ebp),%edx
8010466e:	c7 40 3c 01 00 00 00 	movl   $0x1,0x3c(%eax)
80104675:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
8010467c:	89 50 04             	mov    %edx,0x4(%eax)
8010467f:	c9                   	leave  
80104680:	c3                   	ret    
80104681:	eb 0d                	jmp    80104690 <pid_ns_next_pid>
80104683:	90                   	nop
80104684:	90                   	nop
80104685:	90                   	nop
80104686:	90                   	nop
80104687:	90                   	nop
80104688:	90                   	nop
80104689:	90                   	nop
8010468a:	90                   	nop
8010468b:	90                   	nop
8010468c:	90                   	nop
8010468d:	90                   	nop
8010468e:	90                   	nop
8010468f:	90                   	nop

80104690 <pid_ns_next_pid>:
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	57                   	push   %edi
80104694:	56                   	push   %esi
80104695:	53                   	push   %ebx
80104696:	83 ec 18             	sub    $0x18,%esp
80104699:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010469c:	8d 7b 08             	lea    0x8(%ebx),%edi
8010469f:	57                   	push   %edi
801046a0:	e8 8b 1b 00 00       	call   80106230 <acquire>
801046a5:	8b 73 3c             	mov    0x3c(%ebx),%esi
801046a8:	8d 46 01             	lea    0x1(%esi),%eax
801046ab:	89 43 3c             	mov    %eax,0x3c(%ebx)
801046ae:	89 3c 24             	mov    %edi,(%esp)
801046b1:	e8 9a 1c 00 00       	call   80106350 <release>
801046b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801046b9:	89 f0                	mov    %esi,%eax
801046bb:	5b                   	pop    %ebx
801046bc:	5e                   	pop    %esi
801046bd:	5f                   	pop    %edi
801046be:	5d                   	pop    %ebp
801046bf:	c3                   	ret    

801046c0 <pid_ns_is_max_depth>:
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	8b 45 08             	mov    0x8(%ebp),%eax
801046c6:	85 c0                	test   %eax,%eax
801046c8:	74 1a                	je     801046e4 <pid_ns_is_max_depth+0x24>
801046ca:	31 d2                	xor    %edx,%edx
801046cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046d0:	8b 40 04             	mov    0x4(%eax),%eax
801046d3:	83 c2 01             	add    $0x1,%edx
801046d6:	85 c0                	test   %eax,%eax
801046d8:	75 f6                	jne    801046d0 <pid_ns_is_max_depth+0x10>
801046da:	31 c0                	xor    %eax,%eax
801046dc:	83 fa 03             	cmp    $0x3,%edx
801046df:	0f 9f c0             	setg   %al
801046e2:	5d                   	pop    %ebp
801046e3:	c3                   	ret    
801046e4:	31 c0                	xor    %eax,%eax
801046e6:	5d                   	pop    %ebp
801046e7:	c3                   	ret    
801046e8:	66 90                	xchg   %ax,%ax
801046ea:	66 90                	xchg   %ax,%ax
801046ec:	66 90                	xchg   %ax,%ax
801046ee:	66 90                	xchg   %ax,%ax

801046f0 <mpsearch1>:
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	57                   	push   %edi
801046f4:	56                   	push   %esi
801046f5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
801046fb:	53                   	push   %ebx
801046fc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
801046ff:	83 ec 0c             	sub    $0xc,%esp
80104702:	39 de                	cmp    %ebx,%esi
80104704:	73 48                	jae    8010474e <mpsearch1+0x5e>
80104706:	8d 76 00             	lea    0x0(%esi),%esi
80104709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104710:	83 ec 04             	sub    $0x4,%esp
80104713:	8d 7e 10             	lea    0x10(%esi),%edi
80104716:	6a 04                	push   $0x4
80104718:	68 2f ee 10 80       	push   $0x8010ee2f
8010471d:	56                   	push   %esi
8010471e:	e8 cd 1c 00 00       	call   801063f0 <memcmp>
80104723:	83 c4 10             	add    $0x10,%esp
80104726:	85 c0                	test   %eax,%eax
80104728:	75 1e                	jne    80104748 <mpsearch1+0x58>
8010472a:	8d 7e 10             	lea    0x10(%esi),%edi
8010472d:	89 f2                	mov    %esi,%edx
8010472f:	31 c9                	xor    %ecx,%ecx
80104731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104738:	0f b6 02             	movzbl (%edx),%eax
8010473b:	83 c2 01             	add    $0x1,%edx
8010473e:	01 c1                	add    %eax,%ecx
80104740:	39 fa                	cmp    %edi,%edx
80104742:	75 f4                	jne    80104738 <mpsearch1+0x48>
80104744:	84 c9                	test   %cl,%cl
80104746:	74 10                	je     80104758 <mpsearch1+0x68>
80104748:	39 fb                	cmp    %edi,%ebx
8010474a:	89 fe                	mov    %edi,%esi
8010474c:	77 c2                	ja     80104710 <mpsearch1+0x20>
8010474e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104751:	31 c0                	xor    %eax,%eax
80104753:	5b                   	pop    %ebx
80104754:	5e                   	pop    %esi
80104755:	5f                   	pop    %edi
80104756:	5d                   	pop    %ebp
80104757:	c3                   	ret    
80104758:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010475b:	89 f0                	mov    %esi,%eax
8010475d:	5b                   	pop    %ebx
8010475e:	5e                   	pop    %esi
8010475f:	5f                   	pop    %edi
80104760:	5d                   	pop    %ebp
80104761:	c3                   	ret    
80104762:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104770 <mpinit>:
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	57                   	push   %edi
80104774:	56                   	push   %esi
80104775:	53                   	push   %ebx
80104776:	83 ec 1c             	sub    $0x1c,%esp
80104779:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80104780:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80104787:	c1 e0 08             	shl    $0x8,%eax
8010478a:	09 d0                	or     %edx,%eax
8010478c:	c1 e0 04             	shl    $0x4,%eax
8010478f:	85 c0                	test   %eax,%eax
80104791:	75 1b                	jne    801047ae <mpinit+0x3e>
80104793:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010479a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801047a1:	c1 e0 08             	shl    $0x8,%eax
801047a4:	09 d0                	or     %edx,%eax
801047a6:	c1 e0 0a             	shl    $0xa,%eax
801047a9:	2d 00 04 00 00       	sub    $0x400,%eax
801047ae:	ba 00 04 00 00       	mov    $0x400,%edx
801047b3:	e8 38 ff ff ff       	call   801046f0 <mpsearch1>
801047b8:	85 c0                	test   %eax,%eax
801047ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801047bd:	0f 84 37 01 00 00    	je     801048fa <mpinit+0x18a>
801047c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801047c6:	8b 58 04             	mov    0x4(%eax),%ebx
801047c9:	85 db                	test   %ebx,%ebx
801047cb:	0f 84 43 01 00 00    	je     80104914 <mpinit+0x1a4>
801047d1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
801047d7:	83 ec 04             	sub    $0x4,%esp
801047da:	6a 04                	push   $0x4
801047dc:	68 34 ee 10 80       	push   $0x8010ee34
801047e1:	56                   	push   %esi
801047e2:	e8 09 1c 00 00       	call   801063f0 <memcmp>
801047e7:	83 c4 10             	add    $0x10,%esp
801047ea:	85 c0                	test   %eax,%eax
801047ec:	0f 85 22 01 00 00    	jne    80104914 <mpinit+0x1a4>
801047f2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801047f9:	3c 01                	cmp    $0x1,%al
801047fb:	74 08                	je     80104805 <mpinit+0x95>
801047fd:	3c 04                	cmp    $0x4,%al
801047ff:	0f 85 0f 01 00 00    	jne    80104914 <mpinit+0x1a4>
80104805:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010480c:	85 ff                	test   %edi,%edi
8010480e:	74 21                	je     80104831 <mpinit+0xc1>
80104810:	31 d2                	xor    %edx,%edx
80104812:	31 c0                	xor    %eax,%eax
80104814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104818:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010481f:	80 
80104820:	83 c0 01             	add    $0x1,%eax
80104823:	01 ca                	add    %ecx,%edx
80104825:	39 c7                	cmp    %eax,%edi
80104827:	75 ef                	jne    80104818 <mpinit+0xa8>
80104829:	84 d2                	test   %dl,%dl
8010482b:	0f 85 e3 00 00 00    	jne    80104914 <mpinit+0x1a4>
80104831:	85 f6                	test   %esi,%esi
80104833:	0f 84 db 00 00 00    	je     80104914 <mpinit+0x1a4>
80104839:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
8010483f:	a3 04 fa 12 80       	mov    %eax,0x8012fa04
80104844:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
8010484b:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80104851:	bb 01 00 00 00       	mov    $0x1,%ebx
80104856:	01 d6                	add    %edx,%esi
80104858:	90                   	nop
80104859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104860:	39 c6                	cmp    %eax,%esi
80104862:	76 23                	jbe    80104887 <mpinit+0x117>
80104864:	0f b6 10             	movzbl (%eax),%edx
80104867:	80 fa 04             	cmp    $0x4,%dl
8010486a:	0f 87 c0 00 00 00    	ja     80104930 <mpinit+0x1c0>
80104870:	ff 24 95 74 ee 10 80 	jmp    *-0x7fef118c(,%edx,4)
80104877:	89 f6                	mov    %esi,%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104880:	83 c0 08             	add    $0x8,%eax
80104883:	39 c6                	cmp    %eax,%esi
80104885:	77 dd                	ja     80104864 <mpinit+0xf4>
80104887:	85 db                	test   %ebx,%ebx
80104889:	0f 84 92 00 00 00    	je     80104921 <mpinit+0x1b1>
8010488f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104892:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80104896:	74 15                	je     801048ad <mpinit+0x13d>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80104898:	ba 22 00 00 00       	mov    $0x22,%edx
8010489d:	b8 70 00 00 00       	mov    $0x70,%eax
801048a2:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801048a3:	ba 23 00 00 00       	mov    $0x23,%edx
801048a8:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801048a9:	83 c8 01             	or     $0x1,%eax
801048ac:	ee                   	out    %al,(%dx)
801048ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048b0:	5b                   	pop    %ebx
801048b1:	5e                   	pop    %esi
801048b2:	5f                   	pop    %edi
801048b3:	5d                   	pop    %ebp
801048b4:	c3                   	ret    
801048b5:	8d 76 00             	lea    0x0(%esi),%esi
801048b8:	8b 0d 80 0a 13 80    	mov    0x80130a80,%ecx
801048be:	83 f9 07             	cmp    $0x7,%ecx
801048c1:	7f 19                	jg     801048dc <mpinit+0x16c>
801048c3:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801048c7:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
801048cd:	83 c1 01             	add    $0x1,%ecx
801048d0:	89 0d 80 0a 13 80    	mov    %ecx,0x80130a80
801048d6:	88 97 00 05 13 80    	mov    %dl,-0x7fecfb00(%edi)
801048dc:	83 c0 14             	add    $0x14,%eax
801048df:	e9 7c ff ff ff       	jmp    80104860 <mpinit+0xf0>
801048e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801048e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801048ec:	83 c0 08             	add    $0x8,%eax
801048ef:	88 15 e0 04 13 80    	mov    %dl,0x801304e0
801048f5:	e9 66 ff ff ff       	jmp    80104860 <mpinit+0xf0>
801048fa:	ba 00 00 01 00       	mov    $0x10000,%edx
801048ff:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80104904:	e8 e7 fd ff ff       	call   801046f0 <mpsearch1>
80104909:	85 c0                	test   %eax,%eax
8010490b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010490e:	0f 85 af fe ff ff    	jne    801047c3 <mpinit+0x53>
80104914:	83 ec 0c             	sub    $0xc,%esp
80104917:	68 39 ee 10 80       	push   $0x8010ee39
8010491c:	e8 af ba ff ff       	call   801003d0 <panic>
80104921:	83 ec 0c             	sub    $0xc,%esp
80104924:	68 54 ee 10 80       	push   $0x8010ee54
80104929:	e8 a2 ba ff ff       	call   801003d0 <panic>
8010492e:	66 90                	xchg   %ax,%ax
80104930:	31 db                	xor    %ebx,%ebx
80104932:	e9 30 ff ff ff       	jmp    80104867 <mpinit+0xf7>

80104937 <allocnsproxyinternal>:
80104937:	55                   	push   %ebp
80104938:	89 e5                	mov    %esp,%ebp
8010493a:	56                   	push   %esi
8010493b:	53                   	push   %ebx
8010493c:	b8 00 00 00 00       	mov    $0x0,%eax
80104941:	eb 17                	jmp    8010495a <allocnsproxyinternal+0x23>
80104943:	8d 0c 40             	lea    (%eax,%eax,2),%ecx
80104946:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
8010494d:	8b 92 d4 0a 13 80    	mov    -0x7fecf52c(%edx),%edx
80104953:	85 d2                	test   %edx,%edx
80104955:	74 15                	je     8010496c <allocnsproxyinternal+0x35>
80104957:	83 c0 01             	add    $0x1,%eax
8010495a:	83 f8 0b             	cmp    $0xb,%eax
8010495d:	7e e4                	jle    80104943 <allocnsproxyinternal+0xc>
8010495f:	83 ec 0c             	sub    $0xc,%esp
80104962:	68 88 ee 10 80       	push   $0x8010ee88
80104967:	e8 64 ba ff ff       	call   801003d0 <panic>
8010496c:	8d 0c 00             	lea    (%eax,%eax,1),%ecx
8010496f:	8d 34 01             	lea    (%ecx,%eax,1),%esi
80104972:	8d 1c b5 00 00 00 00 	lea    0x0(,%esi,4),%ebx
80104979:	83 c2 01             	add    $0x1,%edx
8010497c:	89 93 d4 0a 13 80    	mov    %edx,-0x7fecf52c(%ebx)
80104982:	8d 83 d4 0a 13 80    	lea    -0x7fecf52c(%ebx),%eax
80104988:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010498b:	5b                   	pop    %ebx
8010498c:	5e                   	pop    %esi
8010498d:	5d                   	pop    %ebp
8010498e:	c3                   	ret    

8010498f <namespaceinit>:
8010498f:	55                   	push   %ebp
80104990:	89 e5                	mov    %esp,%ebp
80104992:	83 ec 10             	sub    $0x10,%esp
80104995:	68 9f ee 10 80       	push   $0x8010ee9f
8010499a:	68 a0 0a 13 80       	push   $0x80130aa0
8010499f:	e8 8c 17 00 00       	call   80106130 <initlock>
801049a4:	e8 39 fa ff ff       	call   801043e2 <mount_nsinit>
801049a9:	e8 22 fb ff ff       	call   801044d0 <pid_ns_init>
801049ae:	83 c4 10             	add    $0x10,%esp
801049b1:	c9                   	leave  
801049b2:	c3                   	ret    

801049b3 <namespaceleave>:
801049b3:	55                   	push   %ebp
801049b4:	89 e5                	mov    %esp,%ebp
801049b6:	53                   	push   %ebx
801049b7:	83 ec 10             	sub    $0x10,%esp
801049ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
801049bd:	68 a0 0a 13 80       	push   $0x80130aa0
801049c2:	e8 69 18 00 00       	call   80106230 <acquire>
801049c7:	83 c4 10             	add    $0x10,%esp
801049ca:	83 3b 01             	cmpl   $0x1,(%ebx)
801049cd:	75 50                	jne    80104a1f <namespaceleave+0x6c>
801049cf:	83 ec 0c             	sub    $0xc,%esp
801049d2:	68 a0 0a 13 80       	push   $0x80130aa0
801049d7:	e8 74 19 00 00       	call   80106350 <release>
801049dc:	83 c4 04             	add    $0x4,%esp
801049df:	ff 73 04             	pushl  0x4(%ebx)
801049e2:	e8 ad fa ff ff       	call   80104494 <mount_nsleave>
801049e7:	8b 43 04             	mov    0x4(%ebx),%eax
801049ea:	83 c4 10             	add    $0x10,%esp
801049ed:	83 38 00             	cmpl   $0x0,(%eax)
801049f0:	75 05                	jne    801049f7 <namespaceleave+0x44>
801049f2:	e8 2f f8 ff ff       	call   80104226 <printmounts>
801049f7:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
801049fe:	83 ec 0c             	sub    $0xc,%esp
80104a01:	ff 73 08             	pushl  0x8(%ebx)
80104a04:	e8 17 fb ff ff       	call   80104520 <pid_ns_put>
80104a09:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104a10:	c7 04 24 a0 0a 13 80 	movl   $0x80130aa0,(%esp)
80104a17:	e8 14 18 00 00       	call   80106230 <acquire>
80104a1c:	83 c4 10             	add    $0x10,%esp
80104a1f:	83 2b 01             	subl   $0x1,(%ebx)
80104a22:	83 ec 0c             	sub    $0xc,%esp
80104a25:	68 a0 0a 13 80       	push   $0x80130aa0
80104a2a:	e8 21 19 00 00       	call   80106350 <release>
80104a2f:	83 c4 10             	add    $0x10,%esp
80104a32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a35:	c9                   	leave  
80104a36:	c3                   	ret    

80104a37 <namespacedup>:
80104a37:	55                   	push   %ebp
80104a38:	89 e5                	mov    %esp,%ebp
80104a3a:	53                   	push   %ebx
80104a3b:	83 ec 10             	sub    $0x10,%esp
80104a3e:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104a41:	68 a0 0a 13 80       	push   $0x80130aa0
80104a46:	e8 e5 17 00 00       	call   80106230 <acquire>
80104a4b:	8b 03                	mov    (%ebx),%eax
80104a4d:	83 c0 01             	add    $0x1,%eax
80104a50:	89 03                	mov    %eax,(%ebx)
80104a52:	c7 04 24 a0 0a 13 80 	movl   $0x80130aa0,(%esp)
80104a59:	e8 f2 18 00 00       	call   80106350 <release>
80104a5e:	89 d8                	mov    %ebx,%eax
80104a60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a63:	c9                   	leave  
80104a64:	c3                   	ret    

80104a65 <emptynsproxy>:
80104a65:	55                   	push   %ebp
80104a66:	89 e5                	mov    %esp,%ebp
80104a68:	53                   	push   %ebx
80104a69:	83 ec 10             	sub    $0x10,%esp
80104a6c:	68 a0 0a 13 80       	push   $0x80130aa0
80104a71:	e8 ba 17 00 00       	call   80106230 <acquire>
80104a76:	e8 bc fe ff ff       	call   80104937 <allocnsproxyinternal>
80104a7b:	89 c3                	mov    %eax,%ebx
80104a7d:	e8 40 fa ff ff       	call   801044c2 <newmount_ns>
80104a82:	89 43 04             	mov    %eax,0x4(%ebx)
80104a85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104a8c:	e8 cf fb ff ff       	call   80104660 <pid_ns_new>
80104a91:	89 43 08             	mov    %eax,0x8(%ebx)
80104a94:	c7 04 24 a0 0a 13 80 	movl   $0x80130aa0,(%esp)
80104a9b:	e8 b0 18 00 00       	call   80106350 <release>
80104aa0:	89 d8                	mov    %ebx,%eax
80104aa2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104aa5:	c9                   	leave  
80104aa6:	c3                   	ret    

80104aa7 <namespace_replace_pid_ns>:
80104aa7:	55                   	push   %ebp
80104aa8:	89 e5                	mov    %esp,%ebp
80104aaa:	53                   	push   %ebx
80104aab:	83 ec 04             	sub    $0x4,%esp
80104aae:	e8 84 fe ff ff       	call   80104937 <allocnsproxyinternal>
80104ab3:	89 c3                	mov    %eax,%ebx
80104ab5:	83 ec 0c             	sub    $0xc,%esp
80104ab8:	8b 45 08             	mov    0x8(%ebp),%eax
80104abb:	ff 70 04             	pushl  0x4(%eax)
80104abe:	e8 62 f9 ff ff       	call   80104425 <mount_nsdup>
80104ac3:	89 43 04             	mov    %eax,0x4(%ebx)
80104ac6:	83 c4 04             	add    $0x4,%esp
80104ac9:	ff 75 0c             	pushl  0xc(%ebp)
80104acc:	e8 5f fb ff ff       	call   80104630 <pid_ns_dup>
80104ad1:	89 43 08             	mov    %eax,0x8(%ebx)
80104ad4:	89 d8                	mov    %ebx,%eax
80104ad6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ad9:	c9                   	leave  
80104ada:	c3                   	ret    

80104adb <unshare>:
80104adb:	55                   	push   %ebp
80104adc:	89 e5                	mov    %esp,%ebp
80104ade:	57                   	push   %edi
80104adf:	56                   	push   %esi
80104ae0:	53                   	push   %ebx
80104ae1:	83 ec 18             	sub    $0x18,%esp
80104ae4:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104ae7:	68 a0 0a 13 80       	push   $0x80130aa0
80104aec:	e8 3f 17 00 00       	call   80106230 <acquire>
80104af1:	e8 2d 07 00 00       	call   80105223 <myproc>
80104af6:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104afc:	83 c4 10             	add    $0x10,%esp
80104aff:	83 38 01             	cmpl   $0x1,(%eax)
80104b02:	7e 59                	jle    80104b5d <unshare+0x82>
80104b04:	e8 1a 07 00 00       	call   80105223 <myproc>
80104b09:	8b b0 a0 00 00 00    	mov    0xa0(%eax),%esi
80104b0f:	e8 0f 07 00 00       	call   80105223 <myproc>
80104b14:	89 c7                	mov    %eax,%edi
80104b16:	e8 1c fe ff ff       	call   80104937 <allocnsproxyinternal>
80104b1b:	89 87 a0 00 00 00    	mov    %eax,0xa0(%edi)
80104b21:	e8 fd 06 00 00       	call   80105223 <myproc>
80104b26:	8b b8 a0 00 00 00    	mov    0xa0(%eax),%edi
80104b2c:	83 ec 0c             	sub    $0xc,%esp
80104b2f:	ff 76 04             	pushl  0x4(%esi)
80104b32:	e8 ee f8 ff ff       	call   80104425 <mount_nsdup>
80104b37:	89 47 04             	mov    %eax,0x4(%edi)
80104b3a:	e8 e4 06 00 00       	call   80105223 <myproc>
80104b3f:	8b b8 a0 00 00 00    	mov    0xa0(%eax),%edi
80104b45:	83 c4 04             	add    $0x4,%esp
80104b48:	ff 76 08             	pushl  0x8(%esi)
80104b4b:	e8 e0 fa ff ff       	call   80104630 <pid_ns_dup>
80104b50:	89 47 08             	mov    %eax,0x8(%edi)
80104b53:	8b 06                	mov    (%esi),%eax
80104b55:	83 e8 01             	sub    $0x1,%eax
80104b58:	89 06                	mov    %eax,(%esi)
80104b5a:	83 c4 10             	add    $0x10,%esp
80104b5d:	83 ec 0c             	sub    $0xc,%esp
80104b60:	68 a0 0a 13 80       	push   $0x80130aa0
80104b65:	e8 e6 17 00 00       	call   80106350 <release>
80104b6a:	83 c4 10             	add    $0x10,%esp
80104b6d:	83 fb 01             	cmp    $0x1,%ebx
80104b70:	74 0a                	je     80104b7c <unshare+0xa1>
80104b72:	83 fb 02             	cmp    $0x2,%ebx
80104b75:	74 39                	je     80104bb0 <unshare+0xd5>
80104b77:	e9 89 00 00 00       	jmp    80104c05 <unshare+0x12a>
80104b7c:	e8 a2 06 00 00       	call   80105223 <myproc>
80104b81:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104b87:	8b 58 04             	mov    0x4(%eax),%ebx
80104b8a:	e8 94 06 00 00       	call   80105223 <myproc>
80104b8f:	8b b0 a0 00 00 00    	mov    0xa0(%eax),%esi
80104b95:	e8 ff f8 ff ff       	call   80104499 <copymount_ns>
80104b9a:	89 46 04             	mov    %eax,0x4(%esi)
80104b9d:	83 ec 0c             	sub    $0xc,%esp
80104ba0:	53                   	push   %ebx
80104ba1:	e8 ee f8 ff ff       	call   80104494 <mount_nsleave>
80104ba6:	83 c4 10             	add    $0x10,%esp
80104ba9:	bb 00 00 00 00       	mov    $0x0,%ebx
80104bae:	eb 68                	jmp    80104c18 <unshare+0x13d>
80104bb0:	e8 6e 06 00 00       	call   80105223 <myproc>
80104bb5:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80104bbc:	75 4e                	jne    80104c0c <unshare+0x131>
80104bbe:	e8 60 06 00 00       	call   80105223 <myproc>
80104bc3:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104bc9:	83 ec 0c             	sub    $0xc,%esp
80104bcc:	ff 70 08             	pushl  0x8(%eax)
80104bcf:	e8 ec fa ff ff       	call   801046c0 <pid_ns_is_max_depth>
80104bd4:	89 c3                	mov    %eax,%ebx
80104bd6:	83 c4 10             	add    $0x10,%esp
80104bd9:	85 c0                	test   %eax,%eax
80104bdb:	75 36                	jne    80104c13 <unshare+0x138>
80104bdd:	e8 41 06 00 00       	call   80105223 <myproc>
80104be2:	89 c6                	mov    %eax,%esi
80104be4:	e8 3a 06 00 00       	call   80105223 <myproc>
80104be9:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80104bef:	83 ec 0c             	sub    $0xc,%esp
80104bf2:	ff 70 08             	pushl  0x8(%eax)
80104bf5:	e8 66 fa ff ff       	call   80104660 <pid_ns_new>
80104bfa:	89 86 a4 00 00 00    	mov    %eax,0xa4(%esi)
80104c00:	83 c4 10             	add    $0x10,%esp
80104c03:	eb 13                	jmp    80104c18 <unshare+0x13d>
80104c05:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c0a:	eb 0c                	jmp    80104c18 <unshare+0x13d>
80104c0c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c11:	eb 05                	jmp    80104c18 <unshare+0x13d>
80104c13:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c18:	89 d8                	mov    %ebx,%eax
80104c1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c1d:	5b                   	pop    %ebx
80104c1e:	5e                   	pop    %esi
80104c1f:	5f                   	pop    %edi
80104c20:	5d                   	pop    %ebp
80104c21:	c3                   	ret    
80104c22:	66 90                	xchg   %ax,%ax
80104c24:	66 90                	xchg   %ax,%ax
80104c26:	66 90                	xchg   %ax,%ax
80104c28:	66 90                	xchg   %ax,%ax
80104c2a:	66 90                	xchg   %ax,%ax
80104c2c:	66 90                	xchg   %ax,%ax
80104c2e:	66 90                	xchg   %ax,%ax

80104c30 <picinit>:
80104c30:	55                   	push   %ebp
80104c31:	ba 21 00 00 00       	mov    $0x21,%edx
80104c36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c3b:	89 e5                	mov    %esp,%ebp
80104c3d:	ee                   	out    %al,(%dx)
80104c3e:	ba a1 00 00 00       	mov    $0xa1,%edx
80104c43:	ee                   	out    %al,(%dx)
80104c44:	5d                   	pop    %ebp
80104c45:	c3                   	ret    
80104c46:	66 90                	xchg   %ax,%ax
80104c48:	66 90                	xchg   %ax,%ax
80104c4a:	66 90                	xchg   %ax,%ax
80104c4c:	66 90                	xchg   %ax,%ax
80104c4e:	66 90                	xchg   %ax,%ax

80104c50 <pipealloc>:
80104c50:	55                   	push   %ebp
80104c51:	89 e5                	mov    %esp,%ebp
80104c53:	57                   	push   %edi
80104c54:	56                   	push   %esi
80104c55:	53                   	push   %ebx
80104c56:	83 ec 0c             	sub    $0xc,%esp
80104c59:	8b 75 08             	mov    0x8(%ebp),%esi
80104c5c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104c5f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104c65:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80104c6b:	e8 f0 c8 ff ff       	call   80101560 <filealloc>
80104c70:	85 c0                	test   %eax,%eax
80104c72:	89 06                	mov    %eax,(%esi)
80104c74:	0f 84 a8 00 00 00    	je     80104d22 <pipealloc+0xd2>
80104c7a:	e8 e1 c8 ff ff       	call   80101560 <filealloc>
80104c7f:	85 c0                	test   %eax,%eax
80104c81:	89 03                	mov    %eax,(%ebx)
80104c83:	0f 84 87 00 00 00    	je     80104d10 <pipealloc+0xc0>
80104c89:	e8 42 e3 ff ff       	call   80102fd0 <kalloc>
80104c8e:	85 c0                	test   %eax,%eax
80104c90:	89 c7                	mov    %eax,%edi
80104c92:	0f 84 b0 00 00 00    	je     80104d48 <pipealloc+0xf8>
80104c98:	83 ec 08             	sub    $0x8,%esp
80104c9b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80104ca2:	00 00 00 
80104ca5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80104cac:	00 00 00 
80104caf:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80104cb6:	00 00 00 
80104cb9:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80104cc0:	00 00 00 
80104cc3:	68 a9 ee 10 80       	push   $0x8010eea9
80104cc8:	50                   	push   %eax
80104cc9:	e8 62 14 00 00       	call   80106130 <initlock>
80104cce:	8b 06                	mov    (%esi),%eax
80104cd0:	83 c4 10             	add    $0x10,%esp
80104cd3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80104cd9:	8b 06                	mov    (%esi),%eax
80104cdb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80104cdf:	8b 06                	mov    (%esi),%eax
80104ce1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80104ce5:	8b 06                	mov    (%esi),%eax
80104ce7:	89 78 10             	mov    %edi,0x10(%eax)
80104cea:	8b 03                	mov    (%ebx),%eax
80104cec:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80104cf2:	8b 03                	mov    (%ebx),%eax
80104cf4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80104cf8:	8b 03                	mov    (%ebx),%eax
80104cfa:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80104cfe:	8b 03                	mov    (%ebx),%eax
80104d00:	89 78 10             	mov    %edi,0x10(%eax)
80104d03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d06:	31 c0                	xor    %eax,%eax
80104d08:	5b                   	pop    %ebx
80104d09:	5e                   	pop    %esi
80104d0a:	5f                   	pop    %edi
80104d0b:	5d                   	pop    %ebp
80104d0c:	c3                   	ret    
80104d0d:	8d 76 00             	lea    0x0(%esi),%esi
80104d10:	8b 06                	mov    (%esi),%eax
80104d12:	85 c0                	test   %eax,%eax
80104d14:	74 1e                	je     80104d34 <pipealloc+0xe4>
80104d16:	83 ec 0c             	sub    $0xc,%esp
80104d19:	50                   	push   %eax
80104d1a:	e8 01 c9 ff ff       	call   80101620 <fileclose>
80104d1f:	83 c4 10             	add    $0x10,%esp
80104d22:	8b 03                	mov    (%ebx),%eax
80104d24:	85 c0                	test   %eax,%eax
80104d26:	74 0c                	je     80104d34 <pipealloc+0xe4>
80104d28:	83 ec 0c             	sub    $0xc,%esp
80104d2b:	50                   	push   %eax
80104d2c:	e8 ef c8 ff ff       	call   80101620 <fileclose>
80104d31:	83 c4 10             	add    $0x10,%esp
80104d34:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d3c:	5b                   	pop    %ebx
80104d3d:	5e                   	pop    %esi
80104d3e:	5f                   	pop    %edi
80104d3f:	5d                   	pop    %ebp
80104d40:	c3                   	ret    
80104d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d48:	8b 06                	mov    (%esi),%eax
80104d4a:	85 c0                	test   %eax,%eax
80104d4c:	75 c8                	jne    80104d16 <pipealloc+0xc6>
80104d4e:	eb d2                	jmp    80104d22 <pipealloc+0xd2>

80104d50 <pipeclose>:
80104d50:	55                   	push   %ebp
80104d51:	89 e5                	mov    %esp,%ebp
80104d53:	56                   	push   %esi
80104d54:	53                   	push   %ebx
80104d55:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104d58:	8b 75 0c             	mov    0xc(%ebp),%esi
80104d5b:	83 ec 0c             	sub    $0xc,%esp
80104d5e:	53                   	push   %ebx
80104d5f:	e8 cc 14 00 00       	call   80106230 <acquire>
80104d64:	83 c4 10             	add    $0x10,%esp
80104d67:	85 f6                	test   %esi,%esi
80104d69:	74 45                	je     80104db0 <pipeclose+0x60>
80104d6b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80104d71:	83 ec 0c             	sub    $0xc,%esp
80104d74:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80104d7b:	00 00 00 
80104d7e:	50                   	push   %eax
80104d7f:	e8 2a 10 00 00       	call   80105dae <wakeup>
80104d84:	83 c4 10             	add    $0x10,%esp
80104d87:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80104d8d:	85 d2                	test   %edx,%edx
80104d8f:	75 0a                	jne    80104d9b <pipeclose+0x4b>
80104d91:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80104d97:	85 c0                	test   %eax,%eax
80104d99:	74 35                	je     80104dd0 <pipeclose+0x80>
80104d9b:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104d9e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104da1:	5b                   	pop    %ebx
80104da2:	5e                   	pop    %esi
80104da3:	5d                   	pop    %ebp
80104da4:	e9 a7 15 00 00       	jmp    80106350 <release>
80104da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104db0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80104db6:	83 ec 0c             	sub    $0xc,%esp
80104db9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80104dc0:	00 00 00 
80104dc3:	50                   	push   %eax
80104dc4:	e8 e5 0f 00 00       	call   80105dae <wakeup>
80104dc9:	83 c4 10             	add    $0x10,%esp
80104dcc:	eb b9                	jmp    80104d87 <pipeclose+0x37>
80104dce:	66 90                	xchg   %ax,%ax
80104dd0:	83 ec 0c             	sub    $0xc,%esp
80104dd3:	53                   	push   %ebx
80104dd4:	e8 77 15 00 00       	call   80106350 <release>
80104dd9:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104ddc:	83 c4 10             	add    $0x10,%esp
80104ddf:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104de2:	5b                   	pop    %ebx
80104de3:	5e                   	pop    %esi
80104de4:	5d                   	pop    %ebp
80104de5:	e9 16 df ff ff       	jmp    80102d00 <kfree>
80104dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104df0 <pipewrite>:
80104df0:	55                   	push   %ebp
80104df1:	89 e5                	mov    %esp,%ebp
80104df3:	57                   	push   %edi
80104df4:	56                   	push   %esi
80104df5:	53                   	push   %ebx
80104df6:	83 ec 28             	sub    $0x28,%esp
80104df9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104dfc:	53                   	push   %ebx
80104dfd:	e8 2e 14 00 00       	call   80106230 <acquire>
80104e02:	8b 45 10             	mov    0x10(%ebp),%eax
80104e05:	83 c4 10             	add    $0x10,%esp
80104e08:	85 c0                	test   %eax,%eax
80104e0a:	0f 8e b9 00 00 00    	jle    80104ec9 <pipewrite+0xd9>
80104e10:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104e13:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80104e19:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
80104e1f:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80104e25:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80104e28:	03 4d 10             	add    0x10(%ebp),%ecx
80104e2b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80104e2e:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
80104e34:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80104e3a:	39 d0                	cmp    %edx,%eax
80104e3c:	74 38                	je     80104e76 <pipewrite+0x86>
80104e3e:	eb 59                	jmp    80104e99 <pipewrite+0xa9>
80104e40:	e8 de 03 00 00       	call   80105223 <myproc>
80104e45:	8b 48 44             	mov    0x44(%eax),%ecx
80104e48:	85 c9                	test   %ecx,%ecx
80104e4a:	75 34                	jne    80104e80 <pipewrite+0x90>
80104e4c:	83 ec 0c             	sub    $0xc,%esp
80104e4f:	57                   	push   %edi
80104e50:	e8 59 0f 00 00       	call   80105dae <wakeup>
80104e55:	58                   	pop    %eax
80104e56:	5a                   	pop    %edx
80104e57:	53                   	push   %ebx
80104e58:	56                   	push   %esi
80104e59:	e8 83 0d 00 00       	call   80105be1 <sleep>
80104e5e:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80104e64:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80104e6a:	83 c4 10             	add    $0x10,%esp
80104e6d:	05 00 02 00 00       	add    $0x200,%eax
80104e72:	39 c2                	cmp    %eax,%edx
80104e74:	75 2a                	jne    80104ea0 <pipewrite+0xb0>
80104e76:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80104e7c:	85 c0                	test   %eax,%eax
80104e7e:	75 c0                	jne    80104e40 <pipewrite+0x50>
80104e80:	83 ec 0c             	sub    $0xc,%esp
80104e83:	53                   	push   %ebx
80104e84:	e8 c7 14 00 00       	call   80106350 <release>
80104e89:	83 c4 10             	add    $0x10,%esp
80104e8c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e91:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e94:	5b                   	pop    %ebx
80104e95:	5e                   	pop    %esi
80104e96:	5f                   	pop    %edi
80104e97:	5d                   	pop    %ebp
80104e98:	c3                   	ret    
80104e99:	89 c2                	mov    %eax,%edx
80104e9b:	90                   	nop
80104e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ea0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80104ea3:	8d 42 01             	lea    0x1(%edx),%eax
80104ea6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80104eaa:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80104eb0:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80104eb6:	0f b6 09             	movzbl (%ecx),%ecx
80104eb9:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
80104ebd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80104ec0:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80104ec3:	0f 85 65 ff ff ff    	jne    80104e2e <pipewrite+0x3e>
80104ec9:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80104ecf:	83 ec 0c             	sub    $0xc,%esp
80104ed2:	50                   	push   %eax
80104ed3:	e8 d6 0e 00 00       	call   80105dae <wakeup>
80104ed8:	89 1c 24             	mov    %ebx,(%esp)
80104edb:	e8 70 14 00 00       	call   80106350 <release>
80104ee0:	83 c4 10             	add    $0x10,%esp
80104ee3:	8b 45 10             	mov    0x10(%ebp),%eax
80104ee6:	eb a9                	jmp    80104e91 <pipewrite+0xa1>
80104ee8:	90                   	nop
80104ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104ef0 <piperead>:
80104ef0:	55                   	push   %ebp
80104ef1:	89 e5                	mov    %esp,%ebp
80104ef3:	57                   	push   %edi
80104ef4:	56                   	push   %esi
80104ef5:	53                   	push   %ebx
80104ef6:	83 ec 18             	sub    $0x18,%esp
80104ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104efc:	8b 7d 0c             	mov    0xc(%ebp),%edi
80104eff:	53                   	push   %ebx
80104f00:	e8 2b 13 00 00       	call   80106230 <acquire>
80104f05:	83 c4 10             	add    $0x10,%esp
80104f08:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80104f0e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
80104f14:	75 6a                	jne    80104f80 <piperead+0x90>
80104f16:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
80104f1c:	85 f6                	test   %esi,%esi
80104f1e:	0f 84 cc 00 00 00    	je     80104ff0 <piperead+0x100>
80104f24:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
80104f2a:	eb 2d                	jmp    80104f59 <piperead+0x69>
80104f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104f30:	83 ec 08             	sub    $0x8,%esp
80104f33:	53                   	push   %ebx
80104f34:	56                   	push   %esi
80104f35:	e8 a7 0c 00 00       	call   80105be1 <sleep>
80104f3a:	83 c4 10             	add    $0x10,%esp
80104f3d:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80104f43:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80104f49:	75 35                	jne    80104f80 <piperead+0x90>
80104f4b:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
80104f51:	85 d2                	test   %edx,%edx
80104f53:	0f 84 97 00 00 00    	je     80104ff0 <piperead+0x100>
80104f59:	e8 c5 02 00 00       	call   80105223 <myproc>
80104f5e:	8b 48 44             	mov    0x44(%eax),%ecx
80104f61:	85 c9                	test   %ecx,%ecx
80104f63:	74 cb                	je     80104f30 <piperead+0x40>
80104f65:	83 ec 0c             	sub    $0xc,%esp
80104f68:	53                   	push   %ebx
80104f69:	e8 e2 13 00 00       	call   80106350 <release>
80104f6e:	83 c4 10             	add    $0x10,%esp
80104f71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f79:	5b                   	pop    %ebx
80104f7a:	5e                   	pop    %esi
80104f7b:	5f                   	pop    %edi
80104f7c:	5d                   	pop    %ebp
80104f7d:	c3                   	ret    
80104f7e:	66 90                	xchg   %ax,%ax
80104f80:	8b 45 10             	mov    0x10(%ebp),%eax
80104f83:	85 c0                	test   %eax,%eax
80104f85:	7e 69                	jle    80104ff0 <piperead+0x100>
80104f87:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80104f8d:	31 c9                	xor    %ecx,%ecx
80104f8f:	eb 15                	jmp    80104fa6 <piperead+0xb6>
80104f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104f98:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80104f9e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80104fa4:	74 5a                	je     80105000 <piperead+0x110>
80104fa6:	8d 70 01             	lea    0x1(%eax),%esi
80104fa9:	25 ff 01 00 00       	and    $0x1ff,%eax
80104fae:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80104fb4:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80104fb9:	88 04 0f             	mov    %al,(%edi,%ecx,1)
80104fbc:	83 c1 01             	add    $0x1,%ecx
80104fbf:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80104fc2:	75 d4                	jne    80104f98 <piperead+0xa8>
80104fc4:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80104fca:	83 ec 0c             	sub    $0xc,%esp
80104fcd:	50                   	push   %eax
80104fce:	e8 db 0d 00 00       	call   80105dae <wakeup>
80104fd3:	89 1c 24             	mov    %ebx,(%esp)
80104fd6:	e8 75 13 00 00       	call   80106350 <release>
80104fdb:	8b 45 10             	mov    0x10(%ebp),%eax
80104fde:	83 c4 10             	add    $0x10,%esp
80104fe1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fe4:	5b                   	pop    %ebx
80104fe5:	5e                   	pop    %esi
80104fe6:	5f                   	pop    %edi
80104fe7:	5d                   	pop    %ebp
80104fe8:	c3                   	ret    
80104fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ff0:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80104ff7:	eb cb                	jmp    80104fc4 <piperead+0xd4>
80104ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105000:	89 4d 10             	mov    %ecx,0x10(%ebp)
80105003:	eb bf                	jmp    80104fc4 <piperead+0xd4>

80105005 <hlt>:
80105005:	55                   	push   %ebp
80105006:	89 e5                	mov    %esp,%ebp
80105008:	f4                   	hlt    
80105009:	5d                   	pop    %ebp
8010500a:	c3                   	ret    

8010500b <wakeup1>:
8010500b:	55                   	push   %ebp
8010500c:	89 e5                	mov    %esp,%ebp
8010500e:	ba b4 0b 13 80       	mov    $0x80130bb4,%edx
80105013:	eb 18                	jmp    8010502d <wakeup1+0x22>
80105015:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80105019:	75 0c                	jne    80105027 <wakeup1+0x1c>
8010501b:	39 42 40             	cmp    %eax,0x40(%edx)
8010501e:	75 07                	jne    80105027 <wakeup1+0x1c>
80105020:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80105027:	81 c2 c0 02 00 00    	add    $0x2c0,%edx
8010502d:	81 fa b4 bb 13 80    	cmp    $0x8013bbb4,%edx
80105033:	72 e0                	jb     80105015 <wakeup1+0xa>
80105035:	5d                   	pop    %ebp
80105036:	c3                   	ret    

80105037 <allocproc>:
80105037:	55                   	push   %ebp
80105038:	89 e5                	mov    %esp,%ebp
8010503a:	53                   	push   %ebx
8010503b:	83 ec 10             	sub    $0x10,%esp
8010503e:	68 80 0b 13 80       	push   $0x80130b80
80105043:	e8 e8 11 00 00       	call   80106230 <acquire>
80105048:	83 c4 10             	add    $0x10,%esp
8010504b:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
80105050:	eb 0c                	jmp    8010505e <allocproc+0x27>
80105052:	83 7b 0c 00          	cmpl   $0x0,0xc(%ebx)
80105056:	74 28                	je     80105080 <allocproc+0x49>
80105058:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
8010505e:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
80105064:	72 ec                	jb     80105052 <allocproc+0x1b>
80105066:	83 ec 0c             	sub    $0xc,%esp
80105069:	68 80 0b 13 80       	push   $0x80130b80
8010506e:	e8 dd 12 00 00       	call   80106350 <release>
80105073:	83 c4 10             	add    $0x10,%esp
80105076:	b8 00 00 00 00       	mov    $0x0,%eax
8010507b:	e9 9c 00 00 00       	jmp    8010511c <allocproc+0xe5>
80105080:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80105087:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
8010508e:	83 ec 0c             	sub    $0xc,%esp
80105091:	68 80 0b 13 80       	push   $0x80130b80
80105096:	e8 b5 12 00 00       	call   80106350 <release>
8010509b:	e8 30 df ff ff       	call   80102fd0 <kalloc>
801050a0:	89 43 08             	mov    %eax,0x8(%ebx)
801050a3:	83 c4 10             	add    $0x10,%esp
801050a6:	85 c0                	test   %eax,%eax
801050a8:	75 09                	jne    801050b3 <allocproc+0x7c>
801050aa:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801050b1:	eb 69                	jmp    8010511c <allocproc+0xe5>
801050b3:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801050b9:	89 53 38             	mov    %edx,0x38(%ebx)
801050bc:	c7 80 b0 0f 00 00 11 	movl   $0x80108011,0xfb0(%eax)
801050c3:	80 10 80 
801050c6:	05 9c 0f 00 00       	add    $0xf9c,%eax
801050cb:	89 43 3c             	mov    %eax,0x3c(%ebx)
801050ce:	83 ec 04             	sub    $0x4,%esp
801050d1:	6a 14                	push   $0x14
801050d3:	6a 00                	push   $0x0
801050d5:	50                   	push   %eax
801050d6:	e8 c5 12 00 00       	call   801063a0 <memset>
801050db:	8b 43 3c             	mov    0x3c(%ebx),%eax
801050de:	c7 40 10 21 51 10 80 	movl   $0x80105121,0x10(%eax)
801050e5:	c7 83 ac 02 00 00 00 	movl   $0x0,0x2ac(%ebx)
801050ec:	00 00 00 
801050ef:	c7 83 bc 02 00 00 00 	movl   $0x0,0x2bc(%ebx)
801050f6:	00 00 00 
801050f9:	c7 83 b0 02 00 00 00 	movl   $0x0,0x2b0(%ebx)
80105100:	00 00 00 
80105103:	c7 83 b4 02 00 00 00 	movl   $0x0,0x2b4(%ebx)
8010510a:	00 00 00 
8010510d:	c7 83 b8 02 00 00 00 	movl   $0x0,0x2b8(%ebx)
80105114:	00 00 00 
80105117:	83 c4 10             	add    $0x10,%esp
8010511a:	89 d8                	mov    %ebx,%eax
8010511c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010511f:	c9                   	leave  
80105120:	c3                   	ret    

80105121 <forkret>:
80105121:	55                   	push   %ebp
80105122:	89 e5                	mov    %esp,%ebp
80105124:	83 ec 14             	sub    $0x14,%esp
80105127:	68 80 0b 13 80       	push   $0x80130b80
8010512c:	e8 1f 12 00 00       	call   80106350 <release>
80105131:	83 c4 10             	add    $0x10,%esp
80105134:	83 3d 00 00 12 80 00 	cmpl   $0x0,0x80120000
8010513b:	74 28                	je     80105165 <forkret+0x44>
8010513d:	c7 05 00 00 12 80 00 	movl   $0x0,0x80120000
80105144:	00 00 00 
80105147:	83 ec 0c             	sub    $0xc,%esp
8010514a:	6a 01                	push   $0x1
8010514c:	e8 8f cb ff ff       	call   80101ce0 <iinit>
80105151:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105158:	e8 e3 e5 ff ff       	call   80103740 <initlog>
8010515d:	e8 7e ec ff ff       	call   80103de0 <mntinit>
80105162:	83 c4 10             	add    $0x10,%esp
80105165:	c9                   	leave  
80105166:	c3                   	ret    

80105167 <get_pid_for_ns>:
80105167:	55                   	push   %ebp
80105168:	89 e5                	mov    %esp,%ebp
8010516a:	8b 55 08             	mov    0x8(%ebp),%edx
8010516d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80105170:	b8 00 00 00 00       	mov    $0x0,%eax
80105175:	eb 0f                	jmp    80105186 <get_pid_for_ns+0x1f>
80105177:	39 4c c2 14          	cmp    %ecx,0x14(%edx,%eax,8)
8010517b:	75 06                	jne    80105183 <get_pid_for_ns+0x1c>
8010517d:	8b 44 c2 18          	mov    0x18(%edx,%eax,8),%eax
80105181:	eb 0d                	jmp    80105190 <get_pid_for_ns+0x29>
80105183:	83 c0 01             	add    $0x1,%eax
80105186:	83 f8 03             	cmp    $0x3,%eax
80105189:	7e ec                	jle    80105177 <get_pid_for_ns+0x10>
8010518b:	b8 00 00 00 00       	mov    $0x0,%eax
80105190:	5d                   	pop    %ebp
80105191:	c3                   	ret    

80105192 <pinit>:
80105192:	55                   	push   %ebp
80105193:	89 e5                	mov    %esp,%ebp
80105195:	83 ec 10             	sub    $0x10,%esp
80105198:	68 ae ee 10 80       	push   $0x8010eeae
8010519d:	68 80 0b 13 80       	push   $0x80130b80
801051a2:	e8 89 0f 00 00       	call   80106130 <initlock>
801051a7:	83 c4 10             	add    $0x10,%esp
801051aa:	c9                   	leave  
801051ab:	c3                   	ret    

801051ac <mycpu>:
801051ac:	55                   	push   %ebp
801051ad:	89 e5                	mov    %esp,%ebp
801051af:	83 ec 08             	sub    $0x8,%esp
801051b2:	9c                   	pushf  
801051b3:	58                   	pop    %eax
801051b4:	f6 c4 02             	test   $0x2,%ah
801051b7:	74 0d                	je     801051c6 <mycpu+0x1a>
801051b9:	83 ec 0c             	sub    $0xc,%esp
801051bc:	68 b4 ef 10 80       	push   $0x8010efb4
801051c1:	e8 0a b2 ff ff       	call   801003d0 <panic>
801051c6:	e8 a5 e1 ff ff       	call   80103370 <lapicid>
801051cb:	ba 00 00 00 00       	mov    $0x0,%edx
801051d0:	eb 14                	jmp    801051e6 <mycpu+0x3a>
801051d2:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
801051d8:	0f b6 89 00 05 13 80 	movzbl -0x7fecfb00(%ecx),%ecx
801051df:	39 c8                	cmp    %ecx,%eax
801051e1:	74 18                	je     801051fb <mycpu+0x4f>
801051e3:	83 c2 01             	add    $0x1,%edx
801051e6:	3b 15 80 0a 13 80    	cmp    0x80130a80,%edx
801051ec:	7c e4                	jl     801051d2 <mycpu+0x26>
801051ee:	83 ec 0c             	sub    $0xc,%esp
801051f1:	68 b5 ee 10 80       	push   $0x8010eeb5
801051f6:	e8 d5 b1 ff ff       	call   801003d0 <panic>
801051fb:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
80105201:	05 00 05 13 80       	add    $0x80130500,%eax
80105206:	c9                   	leave  
80105207:	c3                   	ret    

80105208 <cpuid>:
80105208:	55                   	push   %ebp
80105209:	89 e5                	mov    %esp,%ebp
8010520b:	83 ec 08             	sub    $0x8,%esp
8010520e:	e8 99 ff ff ff       	call   801051ac <mycpu>
80105213:	2d 00 05 13 80       	sub    $0x80130500,%eax
80105218:	c1 f8 04             	sar    $0x4,%eax
8010521b:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
80105221:	c9                   	leave  
80105222:	c3                   	ret    

80105223 <myproc>:
80105223:	55                   	push   %ebp
80105224:	89 e5                	mov    %esp,%ebp
80105226:	53                   	push   %ebx
80105227:	83 ec 04             	sub    $0x4,%esp
8010522a:	e8 c1 0f 00 00       	call   801061f0 <pushcli>
8010522f:	e8 78 ff ff ff       	call   801051ac <mycpu>
80105234:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
8010523a:	e8 a1 10 00 00       	call   801062e0 <popcli>
8010523f:	89 d8                	mov    %ebx,%eax
80105241:	83 c4 04             	add    $0x4,%esp
80105244:	5b                   	pop    %ebx
80105245:	5d                   	pop    %ebp
80105246:	c3                   	ret    

80105247 <proc_pid>:
80105247:	55                   	push   %ebp
80105248:	89 e5                	mov    %esp,%ebp
8010524a:	83 ec 08             	sub    $0x8,%esp
8010524d:	e8 d1 ff ff ff       	call   80105223 <myproc>
80105252:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80105258:	83 ec 08             	sub    $0x8,%esp
8010525b:	ff 70 08             	pushl  0x8(%eax)
8010525e:	ff 75 08             	pushl  0x8(%ebp)
80105261:	e8 01 ff ff ff       	call   80105167 <get_pid_for_ns>
80105266:	83 c4 10             	add    $0x10,%esp
80105269:	c9                   	leave  
8010526a:	c3                   	ret    

8010526b <userinit>:
8010526b:	55                   	push   %ebp
8010526c:	89 e5                	mov    %esp,%ebp
8010526e:	53                   	push   %ebx
8010526f:	83 ec 04             	sub    $0x4,%esp
80105272:	e8 39 7c 00 00       	call   8010ceb0 <cgroup_root>
80105277:	83 ec 04             	sub    $0x4,%esp
8010527a:	6a 00                	push   $0x0
8010527c:	6a 00                	push   $0x0
8010527e:	50                   	push   %eax
8010527f:	e8 ec 8a 00 00       	call   8010dd70 <cgroup_initialize>
80105284:	e8 ae fd ff ff       	call   80105037 <allocproc>
80105289:	89 c3                	mov    %eax,%ebx
8010528b:	a3 b8 05 12 80       	mov    %eax,0x801205b8
80105290:	e8 9b 44 00 00       	call   80109730 <setupkvm>
80105295:	89 43 04             	mov    %eax,0x4(%ebx)
80105298:	83 c4 10             	add    $0x10,%esp
8010529b:	85 c0                	test   %eax,%eax
8010529d:	75 0d                	jne    801052ac <userinit+0x41>
8010529f:	83 ec 0c             	sub    $0xc,%esp
801052a2:	68 c5 ee 10 80       	push   $0x8010eec5
801052a7:	e8 24 b1 ff ff       	call   801003d0 <panic>
801052ac:	83 ec 04             	sub    $0x4,%esp
801052af:	68 2c 00 00 00       	push   $0x2c
801052b4:	68 60 04 12 80       	push   $0x80120460
801052b9:	50                   	push   %eax
801052ba:	e8 a1 40 00 00       	call   80109360 <inituvm>
801052bf:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
801052c5:	83 c4 0c             	add    $0xc,%esp
801052c8:	6a 4c                	push   $0x4c
801052ca:	6a 00                	push   $0x0
801052cc:	ff 73 38             	pushl  0x38(%ebx)
801052cf:	e8 cc 10 00 00       	call   801063a0 <memset>
801052d4:	8b 43 38             	mov    0x38(%ebx),%eax
801052d7:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
801052dd:	8b 43 38             	mov    0x38(%ebx),%eax
801052e0:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
801052e6:	8b 43 38             	mov    0x38(%ebx),%eax
801052e9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801052ed:	66 89 50 28          	mov    %dx,0x28(%eax)
801052f1:	8b 43 38             	mov    0x38(%ebx),%eax
801052f4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801052f8:	66 89 50 48          	mov    %dx,0x48(%eax)
801052fc:	8b 43 38             	mov    0x38(%ebx),%eax
801052ff:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80105306:	8b 43 38             	mov    0x38(%ebx),%eax
80105309:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80105310:	8b 43 38             	mov    0x38(%ebx),%eax
80105313:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010531a:	8d 83 90 00 00 00    	lea    0x90(%ebx),%eax
80105320:	83 c4 0c             	add    $0xc,%esp
80105323:	6a 10                	push   $0x10
80105325:	68 de ee 10 80       	push   $0x8010eede
8010532a:	50                   	push   %eax
8010532b:	e8 c0 12 00 00       	call   801065f0 <safestrcpy>
80105330:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
80105336:	89 04 24             	mov    %eax,(%esp)
80105339:	e8 f2 d4 ff ff       	call   80102830 <initprocessroot>
8010533e:	89 83 88 00 00 00    	mov    %eax,0x88(%ebx)
80105344:	8d 83 ac 00 00 00    	lea    0xac(%ebx),%eax
8010534a:	83 c4 0c             	add    $0xc,%esp
8010534d:	68 00 02 00 00       	push   $0x200
80105352:	68 e7 ee 10 80       	push   $0x8010eee7
80105357:	50                   	push   %eax
80105358:	e8 93 12 00 00       	call   801065f0 <safestrcpy>
8010535d:	e8 03 f7 ff ff       	call   80104a65 <emptynsproxy>
80105362:	89 83 a0 00 00 00    	mov    %eax,0xa0(%ebx)
80105368:	83 c4 04             	add    $0x4,%esp
8010536b:	ff 70 08             	pushl  0x8(%eax)
8010536e:	e8 1d f3 ff ff       	call   80104690 <pid_ns_next_pid>
80105373:	89 43 10             	mov    %eax,0x10(%ebx)
80105376:	89 43 18             	mov    %eax,0x18(%ebx)
80105379:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
8010537f:	8b 40 08             	mov    0x8(%eax),%eax
80105382:	89 43 14             	mov    %eax,0x14(%ebx)
80105385:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
8010538c:	e8 9f 0e 00 00       	call   80106230 <acquire>
80105391:	e8 1a 7b 00 00       	call   8010ceb0 <cgroup_root>
80105396:	83 c4 08             	add    $0x8,%esp
80105399:	53                   	push   %ebx
8010539a:	50                   	push   %eax
8010539b:	e8 60 7d 00 00       	call   8010d100 <cgroup_insert>
801053a0:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
801053a7:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
801053ae:	e8 9d 0f 00 00       	call   80106350 <release>
801053b3:	83 c4 10             	add    $0x10,%esp
801053b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801053b9:	c9                   	leave  
801053ba:	c3                   	ret    

801053bb <update_protect_mem>:
801053bb:	55                   	push   %ebp
801053bc:	89 e5                	mov    %esp,%ebp
801053be:	56                   	push   %esi
801053bf:	53                   	push   %ebx
801053c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801053c3:	e8 e8 7a 00 00       	call   8010ceb0 <cgroup_root>
801053c8:	39 d8                	cmp    %ebx,%eax
801053ca:	74 5f                	je     8010542b <update_protect_mem+0x70>
801053cc:	80 bb 13 03 00 00 00 	cmpb   $0x0,0x313(%ebx)
801053d3:	74 56                	je     8010542b <update_protect_mem+0x70>
801053d5:	8b 45 0c             	mov    0xc(%ebp),%eax
801053d8:	05 ff 0f 00 00       	add    $0xfff,%eax
801053dd:	c1 f8 0c             	sar    $0xc,%eax
801053e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
801053e3:	8d 91 ff 0f 00 00    	lea    0xfff(%ecx),%edx
801053e9:	c1 fa 0c             	sar    $0xc,%edx
801053ec:	29 d0                	sub    %edx,%eax
801053ee:	8b 8b 3c 03 00 00    	mov    0x33c(%ebx),%ecx
801053f4:	29 c1                	sub    %eax,%ecx
801053f6:	89 8b 3c 03 00 00    	mov    %ecx,0x33c(%ebx)
801053fc:	8b 93 54 03 00 00    	mov    0x354(%ebx),%edx
80105402:	8d b2 ff 0f 00 00    	lea    0xfff(%edx),%esi
80105408:	c1 ee 0c             	shr    $0xc,%esi
8010540b:	29 ce                	sub    %ecx,%esi
8010540d:	85 f6                	test   %esi,%esi
8010540f:	7e 1a                	jle    8010542b <update_protect_mem+0x70>
80105411:	89 f0                	mov    %esi,%eax
80105413:	2b 83 58 03 00 00    	sub    0x358(%ebx),%eax
80105419:	83 ec 0c             	sub    $0xc,%esp
8010541c:	50                   	push   %eax
8010541d:	e8 fe da ff ff       	call   80102f20 <increse_protect_counter>
80105422:	89 b3 58 03 00 00    	mov    %esi,0x358(%ebx)
80105428:	83 c4 10             	add    $0x10,%esp
8010542b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010542e:	5b                   	pop    %ebx
8010542f:	5e                   	pop    %esi
80105430:	5d                   	pop    %ebp
80105431:	c3                   	ret    

80105432 <growproc>:
80105432:	55                   	push   %ebp
80105433:	89 e5                	mov    %esp,%ebp
80105435:	57                   	push   %edi
80105436:	56                   	push   %esi
80105437:	53                   	push   %ebx
80105438:	83 ec 1c             	sub    $0x1c,%esp
8010543b:	8b 75 08             	mov    0x8(%ebp),%esi
8010543e:	e8 e0 fd ff ff       	call   80105223 <myproc>
80105443:	89 c7                	mov    %eax,%edi
80105445:	8b 98 ac 02 00 00    	mov    0x2ac(%eax),%ebx
8010544b:	85 f6                	test   %esi,%esi
8010544d:	7e 1d                	jle    8010546c <growproc+0x3a>
8010544f:	80 bb 13 03 00 00 00 	cmpb   $0x0,0x313(%ebx)
80105456:	74 14                	je     8010546c <growproc+0x3a>
80105458:	89 f0                	mov    %esi,%eax
8010545a:	03 83 38 03 00 00    	add    0x338(%ebx),%eax
80105460:	3b 83 50 03 00 00    	cmp    0x350(%ebx),%eax
80105466:	0f 87 82 00 00 00    	ja     801054ee <growproc+0xbc>
8010546c:	8b 07                	mov    (%edi),%eax
8010546e:	89 c2                	mov    %eax,%edx
80105470:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105473:	85 f6                	test   %esi,%esi
80105475:	7e 19                	jle    80105490 <growproc+0x5e>
80105477:	53                   	push   %ebx
80105478:	01 f0                	add    %esi,%eax
8010547a:	50                   	push   %eax
8010547b:	52                   	push   %edx
8010547c:	ff 77 04             	pushl  0x4(%edi)
8010547f:	e8 9c 40 00 00       	call   80109520 <allocuvm>
80105484:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105487:	83 c4 10             	add    $0x10,%esp
8010548a:	85 c0                	test   %eax,%eax
8010548c:	75 38                	jne    801054c6 <growproc+0x94>
8010548e:	eb 65                	jmp    801054f5 <growproc+0xc3>
80105490:	85 f6                	test   %esi,%esi
80105492:	79 32                	jns    801054c6 <growproc+0x94>
80105494:	83 ec 04             	sub    $0x4,%esp
80105497:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010549a:	89 c8                	mov    %ecx,%eax
8010549c:	01 f0                	add    %esi,%eax
8010549e:	50                   	push   %eax
8010549f:	51                   	push   %ecx
801054a0:	ff 77 04             	pushl  0x4(%edi)
801054a3:	e8 f8 3f 00 00       	call   801094a0 <deallocuvm>
801054a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801054ab:	83 c4 10             	add    $0x10,%esp
801054ae:	85 c0                	test   %eax,%eax
801054b0:	74 4a                	je     801054fc <growproc+0xca>
801054b2:	83 ec 04             	sub    $0x4,%esp
801054b5:	50                   	push   %eax
801054b6:	ff 37                	pushl  (%edi)
801054b8:	ff b7 ac 02 00 00    	pushl  0x2ac(%edi)
801054be:	e8 f8 fe ff ff       	call   801053bb <update_protect_mem>
801054c3:	83 c4 10             	add    $0x10,%esp
801054c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801054c9:	89 07                	mov    %eax,(%edi)
801054cb:	01 b3 38 03 00 00    	add    %esi,0x338(%ebx)
801054d1:	8b 9b 08 03 00 00    	mov    0x308(%ebx),%ebx
801054d7:	85 db                	test   %ebx,%ebx
801054d9:	75 f0                	jne    801054cb <growproc+0x99>
801054db:	83 ec 0c             	sub    $0xc,%esp
801054de:	57                   	push   %edi
801054df:	e8 6c 3d 00 00       	call   80109250 <switchuvm>
801054e4:	83 c4 10             	add    $0x10,%esp
801054e7:	b8 00 00 00 00       	mov    $0x0,%eax
801054ec:	eb 13                	jmp    80105501 <growproc+0xcf>
801054ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054f3:	eb 0c                	jmp    80105501 <growproc+0xcf>
801054f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054fa:	eb 05                	jmp    80105501 <growproc+0xcf>
801054fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105501:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105504:	5b                   	pop    %ebx
80105505:	5e                   	pop    %esi
80105506:	5f                   	pop    %edi
80105507:	5d                   	pop    %ebp
80105508:	c3                   	ret    

80105509 <fork>:
80105509:	55                   	push   %ebp
8010550a:	89 e5                	mov    %esp,%ebp
8010550c:	57                   	push   %edi
8010550d:	56                   	push   %esi
8010550e:	53                   	push   %ebx
8010550f:	83 ec 1c             	sub    $0x1c,%esp
80105512:	e8 0c fd ff ff       	call   80105223 <myproc>
80105517:	89 c3                	mov    %eax,%ebx
80105519:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
8010551f:	85 c0                	test   %eax,%eax
80105521:	74 0a                	je     8010552d <fork+0x24>
80105523:	83 78 40 00          	cmpl   $0x0,0x40(%eax)
80105527:	0f 85 13 02 00 00    	jne    80105740 <fork+0x237>
8010552d:	8b 83 ac 02 00 00    	mov    0x2ac(%ebx),%eax
80105533:	80 b8 0f 03 00 00 00 	cmpb   $0x0,0x30f(%eax)
8010553a:	74 15                	je     80105551 <fork+0x48>
8010553c:	8b 90 04 03 00 00    	mov    0x304(%eax),%edx
80105542:	83 c2 01             	add    $0x1,%edx
80105545:	3b 90 2c 03 00 00    	cmp    0x32c(%eax),%edx
8010554b:	0f 8f f6 01 00 00    	jg     80105747 <fork+0x23e>
80105551:	80 b8 13 03 00 00 00 	cmpb   $0x0,0x313(%eax)
80105558:	74 14                	je     8010556e <fork+0x65>
8010555a:	8b 13                	mov    (%ebx),%edx
8010555c:	03 90 38 03 00 00    	add    0x338(%eax),%edx
80105562:	3b 90 50 03 00 00    	cmp    0x350(%eax),%edx
80105568:	0f 87 e0 01 00 00    	ja     8010574e <fork+0x245>
8010556e:	e8 c4 fa ff ff       	call   80105037 <allocproc>
80105573:	89 c7                	mov    %eax,%edi
80105575:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105578:	85 c0                	test   %eax,%eax
8010557a:	0f 84 d5 01 00 00    	je     80105755 <fork+0x24c>
80105580:	83 ec 08             	sub    $0x8,%esp
80105583:	ff 33                	pushl  (%ebx)
80105585:	ff 73 04             	pushl  0x4(%ebx)
80105588:	e8 73 42 00 00       	call   80109800 <copyuvm>
8010558d:	89 47 04             	mov    %eax,0x4(%edi)
80105590:	83 c4 10             	add    $0x10,%esp
80105593:	85 c0                	test   %eax,%eax
80105595:	75 29                	jne    801055c0 <fork+0xb7>
80105597:	83 ec 0c             	sub    $0xc,%esp
8010559a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010559d:	ff 73 08             	pushl  0x8(%ebx)
801055a0:	e8 5b d7 ff ff       	call   80102d00 <kfree>
801055a5:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801055ac:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801055b3:	83 c4 10             	add    $0x10,%esp
801055b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055bb:	e9 9a 01 00 00       	jmp    8010575a <fork+0x251>
801055c0:	8b 03                	mov    (%ebx),%eax
801055c2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801055c5:	89 07                	mov    %eax,(%edi)
801055c7:	89 5f 34             	mov    %ebx,0x34(%edi)
801055ca:	89 f8                	mov    %edi,%eax
801055cc:	8b 7f 38             	mov    0x38(%edi),%edi
801055cf:	8b 73 38             	mov    0x38(%ebx),%esi
801055d2:	b9 13 00 00 00       	mov    $0x13,%ecx
801055d7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
801055d9:	8b 40 38             	mov    0x38(%eax),%eax
801055dc:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801055e3:	be 00 00 00 00       	mov    $0x0,%esi
801055e8:	eb 1e                	jmp    80105608 <fork+0xff>
801055ea:	8b 44 b3 48          	mov    0x48(%ebx,%esi,4),%eax
801055ee:	85 c0                	test   %eax,%eax
801055f0:	74 13                	je     80105605 <fork+0xfc>
801055f2:	83 ec 0c             	sub    $0xc,%esp
801055f5:	50                   	push   %eax
801055f6:	e8 d5 bf ff ff       	call   801015d0 <filedup>
801055fb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801055fe:	89 44 b1 48          	mov    %eax,0x48(%ecx,%esi,4)
80105602:	83 c4 10             	add    $0x10,%esp
80105605:	83 c6 01             	add    $0x1,%esi
80105608:	83 fe 0f             	cmp    $0xf,%esi
8010560b:	7e dd                	jle    801055ea <fork+0xe1>
8010560d:	83 ec 0c             	sub    $0xc,%esp
80105610:	ff b3 88 00 00 00    	pushl  0x88(%ebx)
80105616:	e8 85 c8 ff ff       	call   80101ea0 <idup>
8010561b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010561e:	89 87 88 00 00 00    	mov    %eax,0x88(%edi)
80105624:	8d 93 ac 00 00 00    	lea    0xac(%ebx),%edx
8010562a:	89 f8                	mov    %edi,%eax
8010562c:	05 ac 00 00 00       	add    $0xac,%eax
80105631:	83 c4 0c             	add    $0xc,%esp
80105634:	68 00 02 00 00       	push   $0x200
80105639:	52                   	push   %edx
8010563a:	50                   	push   %eax
8010563b:	e8 b0 0f 00 00       	call   801065f0 <safestrcpy>
80105640:	83 c4 04             	add    $0x4,%esp
80105643:	ff b3 8c 00 00 00    	pushl  0x8c(%ebx)
80105649:	e8 eb e7 ff ff       	call   80103e39 <mntdup>
8010564e:	89 87 8c 00 00 00    	mov    %eax,0x8c(%edi)
80105654:	8b b3 a4 00 00 00    	mov    0xa4(%ebx),%esi
8010565a:	83 c4 10             	add    $0x10,%esp
8010565d:	85 f6                	test   %esi,%esi
8010565f:	74 1f                	je     80105680 <fork+0x177>
80105661:	83 ec 08             	sub    $0x8,%esp
80105664:	56                   	push   %esi
80105665:	ff b3 a0 00 00 00    	pushl  0xa0(%ebx)
8010566b:	e8 37 f4 ff ff       	call   80104aa7 <namespace_replace_pid_ns>
80105670:	89 87 a0 00 00 00    	mov    %eax,0xa0(%edi)
80105676:	83 c4 10             	add    $0x10,%esp
80105679:	bf 00 00 00 00       	mov    $0x0,%edi
8010567e:	eb 51                	jmp    801056d1 <fork+0x1c8>
80105680:	83 ec 0c             	sub    $0xc,%esp
80105683:	ff b3 a0 00 00 00    	pushl  0xa0(%ebx)
80105689:	e8 a9 f3 ff ff       	call   80104a37 <namespacedup>
8010568e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105691:	89 82 a0 00 00 00    	mov    %eax,0xa0(%edx)
80105697:	8b 70 08             	mov    0x8(%eax),%esi
8010569a:	83 c4 10             	add    $0x10,%esp
8010569d:	eb da                	jmp    80105679 <fork+0x170>
8010569f:	83 ff 03             	cmp    $0x3,%edi
801056a2:	7e 0d                	jle    801056b1 <fork+0x1a8>
801056a4:	83 ec 0c             	sub    $0xc,%esp
801056a7:	68 e9 ee 10 80       	push   $0x8010eee9
801056ac:	e8 1f ad ff ff       	call   801003d0 <panic>
801056b1:	83 ec 0c             	sub    $0xc,%esp
801056b4:	56                   	push   %esi
801056b5:	e8 d6 ef ff ff       	call   80104690 <pid_ns_next_pid>
801056ba:	8d 57 02             	lea    0x2(%edi),%edx
801056bd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801056c0:	89 44 d1 08          	mov    %eax,0x8(%ecx,%edx,8)
801056c4:	89 74 d1 04          	mov    %esi,0x4(%ecx,%edx,8)
801056c8:	83 c7 01             	add    $0x1,%edi
801056cb:	8b 76 04             	mov    0x4(%esi),%esi
801056ce:	83 c4 10             	add    $0x10,%esp
801056d1:	85 f6                	test   %esi,%esi
801056d3:	75 ca                	jne    8010569f <fork+0x196>
801056d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801056d8:	8b 47 18             	mov    0x18(%edi),%eax
801056db:	89 47 10             	mov    %eax,0x10(%edi)
801056de:	8d 93 90 00 00 00    	lea    0x90(%ebx),%edx
801056e4:	89 f8                	mov    %edi,%eax
801056e6:	05 90 00 00 00       	add    $0x90,%eax
801056eb:	83 ec 04             	sub    $0x4,%esp
801056ee:	6a 10                	push   $0x10
801056f0:	52                   	push   %edx
801056f1:	50                   	push   %eax
801056f2:	e8 f9 0e 00 00       	call   801065f0 <safestrcpy>
801056f7:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
801056fd:	83 c4 08             	add    $0x8,%esp
80105700:	ff 70 08             	pushl  0x8(%eax)
80105703:	57                   	push   %edi
80105704:	e8 5e fa ff ff       	call   80105167 <get_pid_for_ns>
80105709:	89 c6                	mov    %eax,%esi
8010570b:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
80105712:	e8 19 0b 00 00       	call   80106230 <acquire>
80105717:	83 c4 08             	add    $0x8,%esp
8010571a:	57                   	push   %edi
8010571b:	ff b3 ac 02 00 00    	pushl  0x2ac(%ebx)
80105721:	e8 da 79 00 00       	call   8010d100 <cgroup_insert>
80105726:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
8010572d:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
80105734:	e8 17 0c 00 00       	call   80106350 <release>
80105739:	83 c4 10             	add    $0x10,%esp
8010573c:	89 f0                	mov    %esi,%eax
8010573e:	eb 1a                	jmp    8010575a <fork+0x251>
80105740:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105745:	eb 13                	jmp    8010575a <fork+0x251>
80105747:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010574c:	eb 0c                	jmp    8010575a <fork+0x251>
8010574e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105753:	eb 05                	jmp    8010575a <fork+0x251>
80105755:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010575a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010575d:	5b                   	pop    %ebx
8010575e:	5e                   	pop    %esi
8010575f:	5f                   	pop    %edi
80105760:	5d                   	pop    %ebp
80105761:	c3                   	ret    

80105762 <kill_proc>:
80105762:	55                   	push   %ebp
80105763:	89 e5                	mov    %esp,%ebp
80105765:	53                   	push   %ebx
80105766:	83 ec 04             	sub    $0x4,%esp
80105769:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010576c:	c7 43 44 01 00 00 00 	movl   $0x1,0x44(%ebx)
80105773:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80105777:	75 07                	jne    80105780 <kill_proc+0x1e>
80105779:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80105780:	8b 45 0c             	mov    0xc(%ebp),%eax
80105783:	89 43 34             	mov    %eax,0x34(%ebx)
80105786:	83 ec 08             	sub    $0x8,%esp
80105789:	53                   	push   %ebx
8010578a:	ff b3 ac 02 00 00    	pushl  0x2ac(%ebx)
80105790:	e8 4b 7a 00 00       	call   8010d1e0 <cgroup_erase>
80105795:	83 c4 0c             	add    $0xc,%esp
80105798:	6a 00                	push   $0x0
8010579a:	ff 33                	pushl  (%ebx)
8010579c:	ff b3 ac 02 00 00    	pushl  0x2ac(%ebx)
801057a2:	e8 14 fc ff ff       	call   801053bb <update_protect_mem>
801057a7:	83 c4 10             	add    $0x10,%esp
801057aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057ad:	c9                   	leave  
801057ae:	c3                   	ret    

801057af <kill_all_pid_ns>:
801057af:	55                   	push   %ebp
801057b0:	89 e5                	mov    %esp,%ebp
801057b2:	57                   	push   %edi
801057b3:	56                   	push   %esi
801057b4:	53                   	push   %ebx
801057b5:	83 ec 0c             	sub    $0xc,%esp
801057b8:	8b 75 08             	mov    0x8(%ebp),%esi
801057bb:	8b 7d 10             	mov    0x10(%ebp),%edi
801057be:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
801057c3:	eb 24                	jmp    801057e9 <kill_all_pid_ns+0x3a>
801057c5:	39 f3                	cmp    %esi,%ebx
801057c7:	74 1a                	je     801057e3 <kill_all_pid_ns+0x34>
801057c9:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
801057cf:	39 78 08             	cmp    %edi,0x8(%eax)
801057d2:	75 0f                	jne    801057e3 <kill_all_pid_ns+0x34>
801057d4:	83 ec 08             	sub    $0x8,%esp
801057d7:	ff 75 0c             	pushl  0xc(%ebp)
801057da:	53                   	push   %ebx
801057db:	e8 82 ff ff ff       	call   80105762 <kill_proc>
801057e0:	83 c4 10             	add    $0x10,%esp
801057e3:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
801057e9:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
801057ef:	72 d4                	jb     801057c5 <kill_all_pid_ns+0x16>
801057f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801057f4:	5b                   	pop    %ebx
801057f5:	5e                   	pop    %esi
801057f6:	5f                   	pop    %edi
801057f7:	5d                   	pop    %ebp
801057f8:	c3                   	ret    

801057f9 <get_pid1_for_ns>:
801057f9:	55                   	push   %ebp
801057fa:	89 e5                	mov    %esp,%ebp
801057fc:	56                   	push   %esi
801057fd:	53                   	push   %ebx
801057fe:	8b 75 08             	mov    0x8(%ebp),%esi
80105801:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
80105806:	eb 15                	jmp    8010581d <get_pid1_for_ns+0x24>
80105808:	56                   	push   %esi
80105809:	53                   	push   %ebx
8010580a:	e8 58 f9 ff ff       	call   80105167 <get_pid_for_ns>
8010580f:	83 c4 08             	add    $0x8,%esp
80105812:	83 f8 01             	cmp    $0x1,%eax
80105815:	74 15                	je     8010582c <get_pid1_for_ns+0x33>
80105817:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
8010581d:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
80105823:	72 e3                	jb     80105808 <get_pid1_for_ns+0xf>
80105825:	b8 00 00 00 00       	mov    $0x0,%eax
8010582a:	eb 02                	jmp    8010582e <get_pid1_for_ns+0x35>
8010582c:	89 d8                	mov    %ebx,%eax
8010582e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105831:	5b                   	pop    %ebx
80105832:	5e                   	pop    %esi
80105833:	5d                   	pop    %ebp
80105834:	c3                   	ret    

80105835 <scheduler>:
80105835:	55                   	push   %ebp
80105836:	89 e5                	mov    %esp,%ebp
80105838:	57                   	push   %edi
80105839:	56                   	push   %esi
8010583a:	53                   	push   %ebx
8010583b:	83 ec 3c             	sub    $0x3c,%esp
8010583e:	e8 69 f9 ff ff       	call   801051ac <mycpu>
80105843:	89 c6                	mov    %eax,%esi
80105845:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
8010584c:	00 00 00 
8010584f:	83 ec 0c             	sub    $0xc,%esp
80105852:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80105855:	50                   	push   %eax
80105856:	e8 65 8b 00 00       	call   8010e3c0 <cpu_account_initialize>
8010585b:	83 c4 10             	add    $0x10,%esp
8010585e:	fb                   	sti    
8010585f:	83 ec 0c             	sub    $0xc,%esp
80105862:	68 80 0b 13 80       	push   $0x80130b80
80105867:	e8 c4 09 00 00       	call   80106230 <acquire>
8010586c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
8010586f:	89 04 24             	mov    %eax,(%esp)
80105872:	e8 79 8b 00 00       	call   8010e3f0 <cpu_account_schedule_start>
80105877:	83 c4 10             	add    $0x10,%esp
8010587a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
80105881:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
80105886:	e9 af 00 00 00       	jmp    8010593a <scheduler+0x105>
8010588b:	83 ec 08             	sub    $0x8,%esp
8010588e:	53                   	push   %ebx
8010588f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80105892:	50                   	push   %eax
80105893:	e8 78 8b 00 00       	call   8010e410 <cpu_account_schedule_proc_update>
80105898:	83 c4 10             	add    $0x10,%esp
8010589b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
8010589f:	0f 85 8f 00 00 00    	jne    80105934 <scheduler+0xff>
801058a5:	83 7b 44 00          	cmpl   $0x0,0x44(%ebx)
801058a9:	75 23                	jne    801058ce <scheduler+0x99>
801058ab:	8b 83 ac 02 00 00    	mov    0x2ac(%ebx),%eax
801058b1:	80 b8 11 03 00 00 00 	cmpb   $0x0,0x311(%eax)
801058b8:	74 0b                	je     801058c5 <scheduler+0x90>
801058ba:	0f b6 16             	movzbl (%esi),%edx
801058bd:	38 90 30 03 00 00    	cmp    %dl,0x330(%eax)
801058c3:	75 6f                	jne    80105934 <scheduler+0xff>
801058c5:	83 b8 34 03 00 00 01 	cmpl   $0x1,0x334(%eax)
801058cc:	74 66                	je     80105934 <scheduler+0xff>
801058ce:	83 ec 08             	sub    $0x8,%esp
801058d1:	53                   	push   %ebx
801058d2:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801058d5:	50                   	push   %eax
801058d6:	e8 95 8b 00 00       	call   8010e470 <cpu_account_schedule_process_decision>
801058db:	83 c4 10             	add    $0x10,%esp
801058de:	85 c0                	test   %eax,%eax
801058e0:	74 52                	je     80105934 <scheduler+0xff>
801058e2:	83 45 c4 01          	addl   $0x1,-0x3c(%ebp)
801058e6:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
801058ec:	83 ec 0c             	sub    $0xc,%esp
801058ef:	53                   	push   %ebx
801058f0:	e8 5b 39 00 00       	call   80109250 <switchuvm>
801058f5:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
801058fc:	83 c4 08             	add    $0x8,%esp
801058ff:	53                   	push   %ebx
80105900:	8d 7d d4             	lea    -0x2c(%ebp),%edi
80105903:	57                   	push   %edi
80105904:	e8 87 8c 00 00       	call   8010e590 <cpu_account_before_process_schedule>
80105909:	83 c4 08             	add    $0x8,%esp
8010590c:	ff 73 3c             	pushl  0x3c(%ebx)
8010590f:	8d 46 04             	lea    0x4(%esi),%eax
80105912:	50                   	push   %eax
80105913:	e8 33 0d 00 00       	call   8010664b <swtch>
80105918:	83 c4 08             	add    $0x8,%esp
8010591b:	53                   	push   %ebx
8010591c:	57                   	push   %edi
8010591d:	e8 8e 8c 00 00       	call   8010e5b0 <cpu_account_after_process_schedule>
80105922:	e8 09 39 00 00       	call   80109230 <switchkvm>
80105927:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
8010592e:	00 00 00 
80105931:	83 c4 10             	add    $0x10,%esp
80105934:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
8010593a:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
80105940:	0f 82 45 ff ff ff    	jb     8010588b <scheduler+0x56>
80105946:	83 ec 0c             	sub    $0xc,%esp
80105949:	68 80 0b 13 80       	push   $0x80130b80
8010594e:	e8 fd 09 00 00       	call   80106350 <release>
80105953:	83 c4 10             	add    $0x10,%esp
80105956:	83 7d c4 00          	cmpl   $0x0,-0x3c(%ebp)
8010595a:	0f 85 fe fe ff ff    	jne    8010585e <scheduler+0x29>
80105960:	83 ec 0c             	sub    $0xc,%esp
80105963:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
80105966:	53                   	push   %ebx
80105967:	e8 c4 8c 00 00       	call   8010e630 <cpu_account_before_hlt>
8010596c:	e8 94 f6 ff ff       	call   80105005 <hlt>
80105971:	89 1c 24             	mov    %ebx,(%esp)
80105974:	e8 c7 8c 00 00       	call   8010e640 <cpu_account_after_hlt>
80105979:	83 c4 10             	add    $0x10,%esp
8010597c:	e9 dd fe ff ff       	jmp    8010585e <scheduler+0x29>

80105981 <sched>:
80105981:	55                   	push   %ebp
80105982:	89 e5                	mov    %esp,%ebp
80105984:	56                   	push   %esi
80105985:	53                   	push   %ebx
80105986:	e8 98 f8 ff ff       	call   80105223 <myproc>
8010598b:	89 c3                	mov    %eax,%ebx
8010598d:	83 ec 0c             	sub    $0xc,%esp
80105990:	68 80 0b 13 80       	push   $0x80130b80
80105995:	e8 16 08 00 00       	call   801061b0 <holding>
8010599a:	83 c4 10             	add    $0x10,%esp
8010599d:	85 c0                	test   %eax,%eax
8010599f:	75 0d                	jne    801059ae <sched+0x2d>
801059a1:	83 ec 0c             	sub    $0xc,%esp
801059a4:	68 f9 ee 10 80       	push   $0x8010eef9
801059a9:	e8 22 aa ff ff       	call   801003d0 <panic>
801059ae:	e8 f9 f7 ff ff       	call   801051ac <mycpu>
801059b3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
801059ba:	74 0d                	je     801059c9 <sched+0x48>
801059bc:	83 ec 0c             	sub    $0xc,%esp
801059bf:	68 0b ef 10 80       	push   $0x8010ef0b
801059c4:	e8 07 aa ff ff       	call   801003d0 <panic>
801059c9:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
801059cd:	75 0d                	jne    801059dc <sched+0x5b>
801059cf:	83 ec 0c             	sub    $0xc,%esp
801059d2:	68 17 ef 10 80       	push   $0x8010ef17
801059d7:	e8 f4 a9 ff ff       	call   801003d0 <panic>
801059dc:	9c                   	pushf  
801059dd:	58                   	pop    %eax
801059de:	f6 c4 02             	test   $0x2,%ah
801059e1:	74 0d                	je     801059f0 <sched+0x6f>
801059e3:	83 ec 0c             	sub    $0xc,%esp
801059e6:	68 25 ef 10 80       	push   $0x8010ef25
801059eb:	e8 e0 a9 ff ff       	call   801003d0 <panic>
801059f0:	e8 b7 f7 ff ff       	call   801051ac <mycpu>
801059f5:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
801059fb:	e8 ac f7 ff ff       	call   801051ac <mycpu>
80105a00:	83 ec 08             	sub    $0x8,%esp
80105a03:	ff 70 04             	pushl  0x4(%eax)
80105a06:	83 c3 3c             	add    $0x3c,%ebx
80105a09:	53                   	push   %ebx
80105a0a:	e8 3c 0c 00 00       	call   8010664b <swtch>
80105a0f:	e8 98 f7 ff ff       	call   801051ac <mycpu>
80105a14:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80105a1a:	83 c4 10             	add    $0x10,%esp
80105a1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105a20:	5b                   	pop    %ebx
80105a21:	5e                   	pop    %esi
80105a22:	5d                   	pop    %ebp
80105a23:	c3                   	ret    

80105a24 <exit>:
80105a24:	55                   	push   %ebp
80105a25:	89 e5                	mov    %esp,%ebp
80105a27:	57                   	push   %edi
80105a28:	56                   	push   %esi
80105a29:	53                   	push   %ebx
80105a2a:	83 ec 1c             	sub    $0x1c,%esp
80105a2d:	e8 f1 f7 ff ff       	call   80105223 <myproc>
80105a32:	89 c3                	mov    %eax,%ebx
80105a34:	8b 45 08             	mov    0x8(%ebp),%eax
80105a37:	89 83 a8 00 00 00    	mov    %eax,0xa8(%ebx)
80105a3d:	3b 1d b8 05 12 80    	cmp    0x801205b8,%ebx
80105a43:	75 2e                	jne    80105a73 <exit+0x4f>
80105a45:	83 ec 0c             	sub    $0xc,%esp
80105a48:	68 39 ef 10 80       	push   $0x8010ef39
80105a4d:	e8 7e a9 ff ff       	call   801003d0 <panic>
80105a52:	8b 44 b3 48          	mov    0x48(%ebx,%esi,4),%eax
80105a56:	85 c0                	test   %eax,%eax
80105a58:	74 14                	je     80105a6e <exit+0x4a>
80105a5a:	83 ec 0c             	sub    $0xc,%esp
80105a5d:	50                   	push   %eax
80105a5e:	e8 bd bb ff ff       	call   80101620 <fileclose>
80105a63:	c7 44 b3 48 00 00 00 	movl   $0x0,0x48(%ebx,%esi,4)
80105a6a:	00 
80105a6b:	83 c4 10             	add    $0x10,%esp
80105a6e:	83 c6 01             	add    $0x1,%esi
80105a71:	eb 05                	jmp    80105a78 <exit+0x54>
80105a73:	be 00 00 00 00       	mov    $0x0,%esi
80105a78:	83 fe 0f             	cmp    $0xf,%esi
80105a7b:	7e d5                	jle    80105a52 <exit+0x2e>
80105a7d:	e8 5e dd ff ff       	call   801037e0 <begin_op>
80105a82:	83 ec 0c             	sub    $0xc,%esp
80105a85:	ff b3 88 00 00 00    	pushl  0x88(%ebx)
80105a8b:	e8 70 c5 ff ff       	call   80102000 <iput>
80105a90:	e8 bb dd ff ff       	call   80103850 <end_op>
80105a95:	83 c4 04             	add    $0x4,%esp
80105a98:	ff b3 8c 00 00 00    	pushl  0x8c(%ebx)
80105a9e:	e8 38 e4 ff ff       	call   80103edb <mntput>
80105aa3:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80105aaa:	00 00 00 
80105aad:	c6 83 ac 00 00 00 00 	movb   $0x0,0xac(%ebx)
80105ab4:	c7 83 88 00 00 00 00 	movl   $0x0,0x88(%ebx)
80105abb:	00 00 00 
80105abe:	8b b3 a0 00 00 00    	mov    0xa0(%ebx),%esi
80105ac4:	8b 46 08             	mov    0x8(%esi),%eax
80105ac7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105aca:	89 04 24             	mov    %eax,(%esp)
80105acd:	e8 27 fd ff ff       	call   801057f9 <get_pid1_for_ns>
80105ad2:	83 c4 10             	add    $0x10,%esp
80105ad5:	89 c7                	mov    %eax,%edi
80105ad7:	85 c0                	test   %eax,%eax
80105ad9:	75 16                	jne    80105af1 <exit+0xcd>
80105adb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105ade:	83 78 40 00          	cmpl   $0x0,0x40(%eax)
80105ae2:	75 0d                	jne    80105af1 <exit+0xcd>
80105ae4:	83 ec 0c             	sub    $0xc,%esp
80105ae7:	68 46 ef 10 80       	push   $0x8010ef46
80105aec:	e8 df a8 ff ff       	call   801003d0 <panic>
80105af1:	83 ec 0c             	sub    $0xc,%esp
80105af4:	56                   	push   %esi
80105af5:	e8 b9 ee ff ff       	call   801049b3 <namespaceleave>
80105afa:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
80105b01:	e8 2a 07 00 00       	call   80106230 <acquire>
80105b06:	8b 43 34             	mov    0x34(%ebx),%eax
80105b09:	e8 fd f4 ff ff       	call   8010500b <wakeup1>
80105b0e:	83 c4 10             	add    $0x10,%esp
80105b11:	83 7b 10 01          	cmpl   $0x1,0x10(%ebx)
80105b15:	75 3c                	jne    80105b53 <exit+0x12f>
80105b17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105b1a:	c7 40 40 01 00 00 00 	movl   $0x1,0x40(%eax)
80105b21:	83 ec 04             	sub    $0x4,%esp
80105b24:	50                   	push   %eax
80105b25:	ff 73 34             	pushl  0x34(%ebx)
80105b28:	53                   	push   %ebx
80105b29:	e8 81 fc ff ff       	call   801057af <kill_all_pid_ns>
80105b2e:	83 c4 10             	add    $0x10,%esp
80105b31:	eb 2d                	jmp    80105b60 <exit+0x13c>
80105b33:	3b 5e 34             	cmp    0x34(%esi),%ebx
80105b36:	75 13                	jne    80105b4b <exit+0x127>
80105b38:	89 7e 34             	mov    %edi,0x34(%esi)
80105b3b:	83 7e 0c 05          	cmpl   $0x5,0xc(%esi)
80105b3f:	75 0a                	jne    80105b4b <exit+0x127>
80105b41:	a1 b8 05 12 80       	mov    0x801205b8,%eax
80105b46:	e8 c0 f4 ff ff       	call   8010500b <wakeup1>
80105b4b:	81 c6 c0 02 00 00    	add    $0x2c0,%esi
80105b51:	eb 05                	jmp    80105b58 <exit+0x134>
80105b53:	be b4 0b 13 80       	mov    $0x80130bb4,%esi
80105b58:	81 fe b4 bb 13 80    	cmp    $0x8013bbb4,%esi
80105b5e:	72 d3                	jb     80105b33 <exit+0x10f>
80105b60:	8b 83 a4 00 00 00    	mov    0xa4(%ebx),%eax
80105b66:	85 c0                	test   %eax,%eax
80105b68:	74 0c                	je     80105b76 <exit+0x152>
80105b6a:	83 ec 0c             	sub    $0xc,%esp
80105b6d:	50                   	push   %eax
80105b6e:	e8 ad e9 ff ff       	call   80104520 <pid_ns_put>
80105b73:	83 c4 10             	add    $0x10,%esp
80105b76:	83 ec 08             	sub    $0x8,%esp
80105b79:	53                   	push   %ebx
80105b7a:	ff b3 ac 02 00 00    	pushl  0x2ac(%ebx)
80105b80:	e8 5b 76 00 00       	call   8010d1e0 <cgroup_erase>
80105b85:	83 c4 0c             	add    $0xc,%esp
80105b88:	6a 00                	push   $0x0
80105b8a:	ff 33                	pushl  (%ebx)
80105b8c:	ff b3 ac 02 00 00    	pushl  0x2ac(%ebx)
80105b92:	e8 24 f8 ff ff       	call   801053bb <update_protect_mem>
80105b97:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
80105b9e:	e8 de fd ff ff       	call   80105981 <sched>
80105ba3:	c7 04 24 5a ef 10 80 	movl   $0x8010ef5a,(%esp)
80105baa:	e8 21 a8 ff ff       	call   801003d0 <panic>

80105baf <yield>:
80105baf:	55                   	push   %ebp
80105bb0:	89 e5                	mov    %esp,%ebp
80105bb2:	83 ec 14             	sub    $0x14,%esp
80105bb5:	68 80 0b 13 80       	push   $0x80130b80
80105bba:	e8 71 06 00 00       	call   80106230 <acquire>
80105bbf:	e8 5f f6 ff ff       	call   80105223 <myproc>
80105bc4:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80105bcb:	e8 b1 fd ff ff       	call   80105981 <sched>
80105bd0:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
80105bd7:	e8 74 07 00 00       	call   80106350 <release>
80105bdc:	83 c4 10             	add    $0x10,%esp
80105bdf:	c9                   	leave  
80105be0:	c3                   	ret    

80105be1 <sleep>:
80105be1:	55                   	push   %ebp
80105be2:	89 e5                	mov    %esp,%ebp
80105be4:	56                   	push   %esi
80105be5:	53                   	push   %ebx
80105be6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80105be9:	e8 35 f6 ff ff       	call   80105223 <myproc>
80105bee:	85 c0                	test   %eax,%eax
80105bf0:	75 0d                	jne    80105bff <sleep+0x1e>
80105bf2:	83 ec 0c             	sub    $0xc,%esp
80105bf5:	68 66 ef 10 80       	push   $0x8010ef66
80105bfa:	e8 d1 a7 ff ff       	call   801003d0 <panic>
80105bff:	89 c6                	mov    %eax,%esi
80105c01:	85 db                	test   %ebx,%ebx
80105c03:	75 0d                	jne    80105c12 <sleep+0x31>
80105c05:	83 ec 0c             	sub    $0xc,%esp
80105c08:	68 6c ef 10 80       	push   $0x8010ef6c
80105c0d:	e8 be a7 ff ff       	call   801003d0 <panic>
80105c12:	81 fb 80 0b 13 80    	cmp    $0x80130b80,%ebx
80105c18:	74 18                	je     80105c32 <sleep+0x51>
80105c1a:	83 ec 0c             	sub    $0xc,%esp
80105c1d:	68 80 0b 13 80       	push   $0x80130b80
80105c22:	e8 09 06 00 00       	call   80106230 <acquire>
80105c27:	89 1c 24             	mov    %ebx,(%esp)
80105c2a:	e8 21 07 00 00       	call   80106350 <release>
80105c2f:	83 c4 10             	add    $0x10,%esp
80105c32:	8b 45 08             	mov    0x8(%ebp),%eax
80105c35:	89 46 40             	mov    %eax,0x40(%esi)
80105c38:	c7 46 0c 02 00 00 00 	movl   $0x2,0xc(%esi)
80105c3f:	e8 3d fd ff ff       	call   80105981 <sched>
80105c44:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
80105c4b:	81 fb 80 0b 13 80    	cmp    $0x80130b80,%ebx
80105c51:	74 18                	je     80105c6b <sleep+0x8a>
80105c53:	83 ec 0c             	sub    $0xc,%esp
80105c56:	68 80 0b 13 80       	push   $0x80130b80
80105c5b:	e8 f0 06 00 00       	call   80106350 <release>
80105c60:	89 1c 24             	mov    %ebx,(%esp)
80105c63:	e8 c8 05 00 00       	call   80106230 <acquire>
80105c68:	83 c4 10             	add    $0x10,%esp
80105c6b:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105c6e:	5b                   	pop    %ebx
80105c6f:	5e                   	pop    %esi
80105c70:	5d                   	pop    %ebp
80105c71:	c3                   	ret    

80105c72 <wait>:
80105c72:	55                   	push   %ebp
80105c73:	89 e5                	mov    %esp,%ebp
80105c75:	57                   	push   %edi
80105c76:	56                   	push   %esi
80105c77:	53                   	push   %ebx
80105c78:	83 ec 0c             	sub    $0xc,%esp
80105c7b:	8b 7d 08             	mov    0x8(%ebp),%edi
80105c7e:	e8 a0 f5 ff ff       	call   80105223 <myproc>
80105c83:	89 c6                	mov    %eax,%esi
80105c85:	83 ec 0c             	sub    $0xc,%esp
80105c88:	68 80 0b 13 80       	push   $0x80130b80
80105c8d:	e8 9e 05 00 00       	call   80106230 <acquire>
80105c92:	83 c4 10             	add    $0x10,%esp
80105c95:	b8 00 00 00 00       	mov    $0x0,%eax
80105c9a:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
80105c9f:	e9 bf 00 00 00       	jmp    80105d63 <wait+0xf1>
80105ca4:	3b 73 34             	cmp    0x34(%ebx),%esi
80105ca7:	0f 85 b0 00 00 00    	jne    80105d5d <wait+0xeb>
80105cad:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80105cb1:	0f 85 a1 00 00 00    	jne    80105d58 <wait+0xe6>
80105cb7:	8b 86 a0 00 00 00    	mov    0xa0(%esi),%eax
80105cbd:	83 ec 08             	sub    $0x8,%esp
80105cc0:	ff 70 08             	pushl  0x8(%eax)
80105cc3:	53                   	push   %ebx
80105cc4:	e8 9e f4 ff ff       	call   80105167 <get_pid_for_ns>
80105cc9:	83 c4 04             	add    $0x4,%esp
80105ccc:	89 c6                	mov    %eax,%esi
80105cce:	ff 73 08             	pushl  0x8(%ebx)
80105cd1:	e8 2a d0 ff ff       	call   80102d00 <kfree>
80105cd6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80105cdd:	83 c4 04             	add    $0x4,%esp
80105ce0:	ff 73 04             	pushl  0x4(%ebx)
80105ce3:	e8 c8 39 00 00       	call   801096b0 <freevm>
80105ce8:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80105cef:	8d 43 14             	lea    0x14(%ebx),%eax
80105cf2:	83 c4 0c             	add    $0xc,%esp
80105cf5:	6a 20                	push   $0x20
80105cf7:	6a 00                	push   $0x0
80105cf9:	50                   	push   %eax
80105cfa:	e8 a1 06 00 00       	call   801063a0 <memset>
80105cff:	c7 83 a4 00 00 00 00 	movl   $0x0,0xa4(%ebx)
80105d06:	00 00 00 
80105d09:	c7 43 34 00 00 00 00 	movl   $0x0,0x34(%ebx)
80105d10:	c6 83 90 00 00 00 00 	movb   $0x0,0x90(%ebx)
80105d17:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
80105d1e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80105d25:	83 c4 10             	add    $0x10,%esp
80105d28:	85 ff                	test   %edi,%edi
80105d2a:	74 0e                	je     80105d3a <wait+0xc8>
80105d2c:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80105d32:	c1 e0 08             	shl    $0x8,%eax
80105d35:	83 c8 7f             	or     $0x7f,%eax
80105d38:	89 07                	mov    %eax,(%edi)
80105d3a:	c7 83 a8 00 00 00 00 	movl   $0x0,0xa8(%ebx)
80105d41:	00 00 00 
80105d44:	83 ec 0c             	sub    $0xc,%esp
80105d47:	68 80 0b 13 80       	push   $0x80130b80
80105d4c:	e8 ff 05 00 00       	call   80106350 <release>
80105d51:	83 c4 10             	add    $0x10,%esp
80105d54:	89 f0                	mov    %esi,%eax
80105d56:	eb 4e                	jmp    80105da6 <wait+0x134>
80105d58:	b8 01 00 00 00       	mov    $0x1,%eax
80105d5d:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
80105d63:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
80105d69:	0f 82 35 ff ff ff    	jb     80105ca4 <wait+0x32>
80105d6f:	85 c0                	test   %eax,%eax
80105d71:	74 06                	je     80105d79 <wait+0x107>
80105d73:	83 7e 44 00          	cmpl   $0x0,0x44(%esi)
80105d77:	74 17                	je     80105d90 <wait+0x11e>
80105d79:	83 ec 0c             	sub    $0xc,%esp
80105d7c:	68 80 0b 13 80       	push   $0x80130b80
80105d81:	e8 ca 05 00 00       	call   80106350 <release>
80105d86:	83 c4 10             	add    $0x10,%esp
80105d89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105d8e:	eb 16                	jmp    80105da6 <wait+0x134>
80105d90:	83 ec 08             	sub    $0x8,%esp
80105d93:	68 80 0b 13 80       	push   $0x80130b80
80105d98:	56                   	push   %esi
80105d99:	e8 43 fe ff ff       	call   80105be1 <sleep>
80105d9e:	83 c4 10             	add    $0x10,%esp
80105da1:	e9 ef fe ff ff       	jmp    80105c95 <wait+0x23>
80105da6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105da9:	5b                   	pop    %ebx
80105daa:	5e                   	pop    %esi
80105dab:	5f                   	pop    %edi
80105dac:	5d                   	pop    %ebp
80105dad:	c3                   	ret    

80105dae <wakeup>:
80105dae:	55                   	push   %ebp
80105daf:	89 e5                	mov    %esp,%ebp
80105db1:	83 ec 14             	sub    $0x14,%esp
80105db4:	68 80 0b 13 80       	push   $0x80130b80
80105db9:	e8 72 04 00 00       	call   80106230 <acquire>
80105dbe:	8b 45 08             	mov    0x8(%ebp),%eax
80105dc1:	e8 45 f2 ff ff       	call   8010500b <wakeup1>
80105dc6:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
80105dcd:	e8 7e 05 00 00       	call   80106350 <release>
80105dd2:	83 c4 10             	add    $0x10,%esp
80105dd5:	c9                   	leave  
80105dd6:	c3                   	ret    

80105dd7 <kill>:
80105dd7:	55                   	push   %ebp
80105dd8:	89 e5                	mov    %esp,%ebp
80105dda:	57                   	push   %edi
80105ddb:	56                   	push   %esi
80105ddc:	53                   	push   %ebx
80105ddd:	83 ec 18             	sub    $0x18,%esp
80105de0:	8b 7d 08             	mov    0x8(%ebp),%edi
80105de3:	68 80 0b 13 80       	push   $0x80130b80
80105de8:	e8 43 04 00 00       	call   80106230 <acquire>
80105ded:	e8 31 f4 ff ff       	call   80105223 <myproc>
80105df2:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80105df8:	8b 70 08             	mov    0x8(%eax),%esi
80105dfb:	83 c4 10             	add    $0x10,%esp
80105dfe:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
80105e03:	eb 39                	jmp    80105e3e <kill+0x67>
80105e05:	83 ec 08             	sub    $0x8,%esp
80105e08:	56                   	push   %esi
80105e09:	53                   	push   %ebx
80105e0a:	e8 58 f3 ff ff       	call   80105167 <get_pid_for_ns>
80105e0f:	83 c4 10             	add    $0x10,%esp
80105e12:	39 f8                	cmp    %edi,%eax
80105e14:	75 22                	jne    80105e38 <kill+0x61>
80105e16:	83 ec 08             	sub    $0x8,%esp
80105e19:	ff 73 34             	pushl  0x34(%ebx)
80105e1c:	53                   	push   %ebx
80105e1d:	e8 40 f9 ff ff       	call   80105762 <kill_proc>
80105e22:	c7 04 24 80 0b 13 80 	movl   $0x80130b80,(%esp)
80105e29:	e8 22 05 00 00       	call   80106350 <release>
80105e2e:	83 c4 10             	add    $0x10,%esp
80105e31:	b8 00 00 00 00       	mov    $0x0,%eax
80105e36:	eb 23                	jmp    80105e5b <kill+0x84>
80105e38:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
80105e3e:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
80105e44:	72 bf                	jb     80105e05 <kill+0x2e>
80105e46:	83 ec 0c             	sub    $0xc,%esp
80105e49:	68 80 0b 13 80       	push   $0x80130b80
80105e4e:	e8 fd 04 00 00       	call   80106350 <release>
80105e53:	83 c4 10             	add    $0x10,%esp
80105e56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e5e:	5b                   	pop    %ebx
80105e5f:	5e                   	pop    %esi
80105e60:	5f                   	pop    %edi
80105e61:	5d                   	pop    %ebp
80105e62:	c3                   	ret    

80105e63 <procdump>:
80105e63:	55                   	push   %ebp
80105e64:	89 e5                	mov    %esp,%ebp
80105e66:	57                   	push   %edi
80105e67:	56                   	push   %esi
80105e68:	53                   	push   %ebx
80105e69:	83 ec 3c             	sub    $0x3c,%esp
80105e6c:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
80105e71:	e9 b1 00 00 00       	jmp    80105f27 <procdump+0xc4>
80105e76:	8b 43 0c             	mov    0xc(%ebx),%eax
80105e79:	85 c0                	test   %eax,%eax
80105e7b:	0f 84 a0 00 00 00    	je     80105f21 <procdump+0xbe>
80105e81:	83 f8 05             	cmp    $0x5,%eax
80105e84:	77 12                	ja     80105e98 <procdump+0x35>
80105e86:	8b 34 85 dc ef 10 80 	mov    -0x7fef1024(,%eax,4),%esi
80105e8d:	85 f6                	test   %esi,%esi
80105e8f:	75 0c                	jne    80105e9d <procdump+0x3a>
80105e91:	be 7d ef 10 80       	mov    $0x8010ef7d,%esi
80105e96:	eb 05                	jmp    80105e9d <procdump+0x3a>
80105e98:	be 7d ef 10 80       	mov    $0x8010ef7d,%esi
80105e9d:	8d bb 90 00 00 00    	lea    0x90(%ebx),%edi
80105ea3:	a1 b8 05 12 80       	mov    0x801205b8,%eax
80105ea8:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
80105eae:	ff 70 08             	pushl  0x8(%eax)
80105eb1:	53                   	push   %ebx
80105eb2:	e8 b0 f2 ff ff       	call   80105167 <get_pid_for_ns>
80105eb7:	83 c4 08             	add    $0x8,%esp
80105eba:	57                   	push   %edi
80105ebb:	56                   	push   %esi
80105ebc:	50                   	push   %eax
80105ebd:	68 81 ef 10 80       	push   $0x8010ef81
80105ec2:	e8 99 a7 ff ff       	call   80100660 <cprintf>
80105ec7:	83 c4 10             	add    $0x10,%esp
80105eca:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80105ece:	75 41                	jne    80105f11 <procdump+0xae>
80105ed0:	8b 43 3c             	mov    0x3c(%ebx),%eax
80105ed3:	8b 40 0c             	mov    0xc(%eax),%eax
80105ed6:	83 c0 08             	add    $0x8,%eax
80105ed9:	83 ec 08             	sub    $0x8,%esp
80105edc:	8d 55 c0             	lea    -0x40(%ebp),%edx
80105edf:	52                   	push   %edx
80105ee0:	50                   	push   %eax
80105ee1:	e8 6a 02 00 00       	call   80106150 <getcallerpcs>
80105ee6:	83 c4 10             	add    $0x10,%esp
80105ee9:	be 00 00 00 00       	mov    $0x0,%esi
80105eee:	eb 14                	jmp    80105f04 <procdump+0xa1>
80105ef0:	83 ec 08             	sub    $0x8,%esp
80105ef3:	50                   	push   %eax
80105ef4:	68 a1 e6 10 80       	push   $0x8010e6a1
80105ef9:	e8 62 a7 ff ff       	call   80100660 <cprintf>
80105efe:	83 c6 01             	add    $0x1,%esi
80105f01:	83 c4 10             	add    $0x10,%esp
80105f04:	83 fe 09             	cmp    $0x9,%esi
80105f07:	7f 08                	jg     80105f11 <procdump+0xae>
80105f09:	8b 44 b5 c0          	mov    -0x40(%ebp,%esi,4),%eax
80105f0d:	85 c0                	test   %eax,%eax
80105f0f:	75 df                	jne    80105ef0 <procdump+0x8d>
80105f11:	83 ec 0c             	sub    $0xc,%esp
80105f14:	68 b3 f3 10 80       	push   $0x8010f3b3
80105f19:	e8 42 a7 ff ff       	call   80100660 <cprintf>
80105f1e:	83 c4 10             	add    $0x10,%esp
80105f21:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
80105f27:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
80105f2d:	0f 82 43 ff ff ff    	jb     80105e76 <procdump+0x13>
80105f33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105f36:	5b                   	pop    %ebx
80105f37:	5e                   	pop    %esi
80105f38:	5f                   	pop    %edi
80105f39:	5d                   	pop    %ebp
80105f3a:	c3                   	ret    

80105f3b <proc_lock>:
80105f3b:	55                   	push   %ebp
80105f3c:	89 e5                	mov    %esp,%ebp
80105f3e:	83 ec 14             	sub    $0x14,%esp
80105f41:	68 80 0b 13 80       	push   $0x80130b80
80105f46:	e8 e5 02 00 00       	call   80106230 <acquire>
80105f4b:	83 c4 10             	add    $0x10,%esp
80105f4e:	c9                   	leave  
80105f4f:	c3                   	ret    

80105f50 <proc_unlock>:
80105f50:	55                   	push   %ebp
80105f51:	89 e5                	mov    %esp,%ebp
80105f53:	83 ec 14             	sub    $0x14,%esp
80105f56:	68 80 0b 13 80       	push   $0x80130b80
80105f5b:	e8 f0 03 00 00       	call   80106350 <release>
80105f60:	83 c4 10             	add    $0x10,%esp
80105f63:	c9                   	leave  
80105f64:	c3                   	ret    

80105f65 <cgroup_move_proc>:
80105f65:	55                   	push   %ebp
80105f66:	89 e5                	mov    %esp,%ebp
80105f68:	57                   	push   %edi
80105f69:	56                   	push   %esi
80105f6a:	53                   	push   %ebx
80105f6b:	83 ec 18             	sub    $0x18,%esp
80105f6e:	8b 75 0c             	mov    0xc(%ebp),%esi
80105f71:	68 80 0b 13 80       	push   $0x80130b80
80105f76:	e8 b5 02 00 00       	call   80106230 <acquire>
80105f7b:	83 c4 10             	add    $0x10,%esp
80105f7e:	bb b4 0b 13 80       	mov    $0x80130bb4,%ebx
80105f83:	eb 48                	jmp    80105fcd <cgroup_move_proc+0x68>
80105f85:	83 ec 0c             	sub    $0xc,%esp
80105f88:	53                   	push   %ebx
80105f89:	e8 b9 f2 ff ff       	call   80105247 <proc_pid>
80105f8e:	83 c4 10             	add    $0x10,%esp
80105f91:	39 f0                	cmp    %esi,%eax
80105f93:	75 32                	jne    80105fc7 <cgroup_move_proc+0x62>
80105f95:	8b 43 0c             	mov    0xc(%ebx),%eax
80105f98:	83 e8 02             	sub    $0x2,%eax
80105f9b:	83 f8 02             	cmp    $0x2,%eax
80105f9e:	77 27                	ja     80105fc7 <cgroup_move_proc+0x62>
80105fa0:	83 ec 08             	sub    $0x8,%esp
80105fa3:	53                   	push   %ebx
80105fa4:	ff 75 08             	pushl  0x8(%ebp)
80105fa7:	e8 f4 6f 00 00       	call   8010cfa0 <unsafe_cgroup_insert>
80105fac:	89 c7                	mov    %eax,%edi
80105fae:	83 c4 10             	add    $0x10,%esp
80105fb1:	85 c0                	test   %eax,%eax
80105fb3:	75 12                	jne    80105fc7 <cgroup_move_proc+0x62>
80105fb5:	83 ec 0c             	sub    $0xc,%esp
80105fb8:	68 80 0b 13 80       	push   $0x80130b80
80105fbd:	e8 8e 03 00 00       	call   80106350 <release>
80105fc2:	83 c4 10             	add    $0x10,%esp
80105fc5:	eb 23                	jmp    80105fea <cgroup_move_proc+0x85>
80105fc7:	81 c3 c0 02 00 00    	add    $0x2c0,%ebx
80105fcd:	81 fb b4 bb 13 80    	cmp    $0x8013bbb4,%ebx
80105fd3:	72 b0                	jb     80105f85 <cgroup_move_proc+0x20>
80105fd5:	83 ec 0c             	sub    $0xc,%esp
80105fd8:	68 80 0b 13 80       	push   $0x80130b80
80105fdd:	e8 6e 03 00 00       	call   80106350 <release>
80105fe2:	83 c4 10             	add    $0x10,%esp
80105fe5:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80105fea:	89 f8                	mov    %edi,%eax
80105fec:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105fef:	5b                   	pop    %ebx
80105ff0:	5e                   	pop    %esi
80105ff1:	5f                   	pop    %edi
80105ff2:	5d                   	pop    %ebp
80105ff3:	c3                   	ret    

80105ff4 <proc_get_cgroup>:
80105ff4:	55                   	push   %ebp
80105ff5:	89 e5                	mov    %esp,%ebp
80105ff7:	83 ec 08             	sub    $0x8,%esp
80105ffa:	e8 24 f2 ff ff       	call   80105223 <myproc>
80105fff:	85 c0                	test   %eax,%eax
80106001:	74 08                	je     8010600b <proc_get_cgroup+0x17>
80106003:	8b 80 ac 02 00 00    	mov    0x2ac(%eax),%eax
80106009:	eb 05                	jmp    80106010 <proc_get_cgroup+0x1c>
8010600b:	b8 00 00 00 00       	mov    $0x0,%eax
80106010:	c9                   	leave  
80106011:	c3                   	ret    
80106012:	66 90                	xchg   %ax,%ax
80106014:	66 90                	xchg   %ax,%ax
80106016:	66 90                	xchg   %ax,%ax
80106018:	66 90                	xchg   %ax,%ax
8010601a:	66 90                	xchg   %ax,%ax
8010601c:	66 90                	xchg   %ax,%ax
8010601e:	66 90                	xchg   %ax,%ax

80106020 <initsleeplock>:
80106020:	55                   	push   %ebp
80106021:	89 e5                	mov    %esp,%ebp
80106023:	53                   	push   %ebx
80106024:	83 ec 0c             	sub    $0xc,%esp
80106027:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010602a:	68 f4 ef 10 80       	push   $0x8010eff4
8010602f:	8d 43 04             	lea    0x4(%ebx),%eax
80106032:	50                   	push   %eax
80106033:	e8 f8 00 00 00       	call   80106130 <initlock>
80106038:	8b 45 0c             	mov    0xc(%ebp),%eax
8010603b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80106041:	83 c4 10             	add    $0x10,%esp
80106044:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010604b:	89 43 38             	mov    %eax,0x38(%ebx)
8010604e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106051:	c9                   	leave  
80106052:	c3                   	ret    
80106053:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106060 <acquiresleep>:
80106060:	55                   	push   %ebp
80106061:	89 e5                	mov    %esp,%ebp
80106063:	56                   	push   %esi
80106064:	53                   	push   %ebx
80106065:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106068:	83 ec 0c             	sub    $0xc,%esp
8010606b:	8d 73 04             	lea    0x4(%ebx),%esi
8010606e:	56                   	push   %esi
8010606f:	e8 bc 01 00 00       	call   80106230 <acquire>
80106074:	8b 13                	mov    (%ebx),%edx
80106076:	83 c4 10             	add    $0x10,%esp
80106079:	85 d2                	test   %edx,%edx
8010607b:	74 16                	je     80106093 <acquiresleep+0x33>
8010607d:	8d 76 00             	lea    0x0(%esi),%esi
80106080:	83 ec 08             	sub    $0x8,%esp
80106083:	56                   	push   %esi
80106084:	53                   	push   %ebx
80106085:	e8 57 fb ff ff       	call   80105be1 <sleep>
8010608a:	8b 03                	mov    (%ebx),%eax
8010608c:	83 c4 10             	add    $0x10,%esp
8010608f:	85 c0                	test   %eax,%eax
80106091:	75 ed                	jne    80106080 <acquiresleep+0x20>
80106093:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80106099:	e8 85 f1 ff ff       	call   80105223 <myproc>
8010609e:	8b 40 10             	mov    0x10(%eax),%eax
801060a1:	89 43 3c             	mov    %eax,0x3c(%ebx)
801060a4:	89 75 08             	mov    %esi,0x8(%ebp)
801060a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801060aa:	5b                   	pop    %ebx
801060ab:	5e                   	pop    %esi
801060ac:	5d                   	pop    %ebp
801060ad:	e9 9e 02 00 00       	jmp    80106350 <release>
801060b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801060b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801060c0 <releasesleep>:
801060c0:	55                   	push   %ebp
801060c1:	89 e5                	mov    %esp,%ebp
801060c3:	56                   	push   %esi
801060c4:	53                   	push   %ebx
801060c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801060c8:	83 ec 0c             	sub    $0xc,%esp
801060cb:	8d 73 04             	lea    0x4(%ebx),%esi
801060ce:	56                   	push   %esi
801060cf:	e8 5c 01 00 00       	call   80106230 <acquire>
801060d4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801060da:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801060e1:	89 1c 24             	mov    %ebx,(%esp)
801060e4:	e8 c5 fc ff ff       	call   80105dae <wakeup>
801060e9:	89 75 08             	mov    %esi,0x8(%ebp)
801060ec:	83 c4 10             	add    $0x10,%esp
801060ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801060f2:	5b                   	pop    %ebx
801060f3:	5e                   	pop    %esi
801060f4:	5d                   	pop    %ebp
801060f5:	e9 56 02 00 00       	jmp    80106350 <release>
801060fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106100 <holdingsleep>:
80106100:	55                   	push   %ebp
80106101:	89 e5                	mov    %esp,%ebp
80106103:	56                   	push   %esi
80106104:	53                   	push   %ebx
80106105:	8b 75 08             	mov    0x8(%ebp),%esi
80106108:	83 ec 0c             	sub    $0xc,%esp
8010610b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010610e:	53                   	push   %ebx
8010610f:	e8 1c 01 00 00       	call   80106230 <acquire>
80106114:	8b 36                	mov    (%esi),%esi
80106116:	89 1c 24             	mov    %ebx,(%esp)
80106119:	e8 32 02 00 00       	call   80106350 <release>
8010611e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106121:	89 f0                	mov    %esi,%eax
80106123:	5b                   	pop    %ebx
80106124:	5e                   	pop    %esi
80106125:	5d                   	pop    %ebp
80106126:	c3                   	ret    
80106127:	66 90                	xchg   %ax,%ax
80106129:	66 90                	xchg   %ax,%ax
8010612b:	66 90                	xchg   %ax,%ax
8010612d:	66 90                	xchg   %ax,%ax
8010612f:	90                   	nop

80106130 <initlock>:
80106130:	55                   	push   %ebp
80106131:	89 e5                	mov    %esp,%ebp
80106133:	8b 45 08             	mov    0x8(%ebp),%eax
80106136:	8b 55 0c             	mov    0xc(%ebp),%edx
80106139:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010613f:	89 50 04             	mov    %edx,0x4(%eax)
80106142:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80106149:	5d                   	pop    %ebp
8010614a:	c3                   	ret    
8010614b:	90                   	nop
8010614c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106150 <getcallerpcs>:
80106150:	55                   	push   %ebp
80106151:	89 e5                	mov    %esp,%ebp
80106153:	53                   	push   %ebx
80106154:	8b 45 08             	mov    0x8(%ebp),%eax
80106157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010615a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010615d:	31 c0                	xor    %eax,%eax
8010615f:	90                   	nop
80106160:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80106166:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010616c:	77 1a                	ja     80106188 <getcallerpcs+0x38>
8010616e:	8b 5a 04             	mov    0x4(%edx),%ebx
80106171:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80106174:	83 c0 01             	add    $0x1,%eax
80106177:	8b 12                	mov    (%edx),%edx
80106179:	83 f8 0a             	cmp    $0xa,%eax
8010617c:	75 e2                	jne    80106160 <getcallerpcs+0x10>
8010617e:	5b                   	pop    %ebx
8010617f:	5d                   	pop    %ebp
80106180:	c3                   	ret    
80106181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106188:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010618f:	83 c0 01             	add    $0x1,%eax
80106192:	83 f8 0a             	cmp    $0xa,%eax
80106195:	74 e7                	je     8010617e <getcallerpcs+0x2e>
80106197:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010619e:	83 c0 01             	add    $0x1,%eax
801061a1:	83 f8 0a             	cmp    $0xa,%eax
801061a4:	75 e2                	jne    80106188 <getcallerpcs+0x38>
801061a6:	eb d6                	jmp    8010617e <getcallerpcs+0x2e>
801061a8:	90                   	nop
801061a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801061b0 <holding>:
801061b0:	55                   	push   %ebp
801061b1:	89 e5                	mov    %esp,%ebp
801061b3:	53                   	push   %ebx
801061b4:	83 ec 04             	sub    $0x4,%esp
801061b7:	8b 55 08             	mov    0x8(%ebp),%edx
801061ba:	8b 02                	mov    (%edx),%eax
801061bc:	85 c0                	test   %eax,%eax
801061be:	75 10                	jne    801061d0 <holding+0x20>
801061c0:	83 c4 04             	add    $0x4,%esp
801061c3:	31 c0                	xor    %eax,%eax
801061c5:	5b                   	pop    %ebx
801061c6:	5d                   	pop    %ebp
801061c7:	c3                   	ret    
801061c8:	90                   	nop
801061c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801061d0:	8b 5a 08             	mov    0x8(%edx),%ebx
801061d3:	e8 d4 ef ff ff       	call   801051ac <mycpu>
801061d8:	39 c3                	cmp    %eax,%ebx
801061da:	0f 94 c0             	sete   %al
801061dd:	83 c4 04             	add    $0x4,%esp
801061e0:	0f b6 c0             	movzbl %al,%eax
801061e3:	5b                   	pop    %ebx
801061e4:	5d                   	pop    %ebp
801061e5:	c3                   	ret    
801061e6:	8d 76 00             	lea    0x0(%esi),%esi
801061e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801061f0 <pushcli>:
801061f0:	55                   	push   %ebp
801061f1:	89 e5                	mov    %esp,%ebp
801061f3:	53                   	push   %ebx
801061f4:	83 ec 04             	sub    $0x4,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801061f7:	9c                   	pushf  
801061f8:	5b                   	pop    %ebx
  asm volatile("cli");
801061f9:	fa                   	cli    
801061fa:	e8 ad ef ff ff       	call   801051ac <mycpu>
801061ff:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80106205:	85 c0                	test   %eax,%eax
80106207:	75 11                	jne    8010621a <pushcli+0x2a>
80106209:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010620f:	e8 98 ef ff ff       	call   801051ac <mycpu>
80106214:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
8010621a:	e8 8d ef ff ff       	call   801051ac <mycpu>
8010621f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80106226:	83 c4 04             	add    $0x4,%esp
80106229:	5b                   	pop    %ebx
8010622a:	5d                   	pop    %ebp
8010622b:	c3                   	ret    
8010622c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106230 <acquire>:
80106230:	55                   	push   %ebp
80106231:	89 e5                	mov    %esp,%ebp
80106233:	56                   	push   %esi
80106234:	53                   	push   %ebx
80106235:	e8 b6 ff ff ff       	call   801061f0 <pushcli>
8010623a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010623d:	8b 03                	mov    (%ebx),%eax
8010623f:	85 c0                	test   %eax,%eax
80106241:	75 7d                	jne    801062c0 <acquire+0x90>
  asm volatile("lock; xchgl %0, %1" :
80106243:	ba 01 00 00 00       	mov    $0x1,%edx
80106248:	eb 09                	jmp    80106253 <acquire+0x23>
8010624a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106250:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106253:	89 d0                	mov    %edx,%eax
80106255:	f0 87 03             	lock xchg %eax,(%ebx)
80106258:	85 c0                	test   %eax,%eax
8010625a:	75 f4                	jne    80106250 <acquire+0x20>
8010625c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80106261:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106264:	e8 43 ef ff ff       	call   801051ac <mycpu>
80106269:	89 ea                	mov    %ebp,%edx
8010626b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
8010626e:	89 43 08             	mov    %eax,0x8(%ebx)
80106271:	31 c0                	xor    %eax,%eax
80106273:	90                   	nop
80106274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106278:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
8010627e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80106284:	77 1a                	ja     801062a0 <acquire+0x70>
80106286:	8b 5a 04             	mov    0x4(%edx),%ebx
80106289:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
8010628c:	83 c0 01             	add    $0x1,%eax
8010628f:	8b 12                	mov    (%edx),%edx
80106291:	83 f8 0a             	cmp    $0xa,%eax
80106294:	75 e2                	jne    80106278 <acquire+0x48>
80106296:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106299:	5b                   	pop    %ebx
8010629a:	5e                   	pop    %esi
8010629b:	5d                   	pop    %ebp
8010629c:	c3                   	ret    
8010629d:	8d 76 00             	lea    0x0(%esi),%esi
801062a0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801062a7:	83 c0 01             	add    $0x1,%eax
801062aa:	83 f8 0a             	cmp    $0xa,%eax
801062ad:	74 e7                	je     80106296 <acquire+0x66>
801062af:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801062b6:	83 c0 01             	add    $0x1,%eax
801062b9:	83 f8 0a             	cmp    $0xa,%eax
801062bc:	75 e2                	jne    801062a0 <acquire+0x70>
801062be:	eb d6                	jmp    80106296 <acquire+0x66>
801062c0:	8b 73 08             	mov    0x8(%ebx),%esi
801062c3:	e8 e4 ee ff ff       	call   801051ac <mycpu>
801062c8:	39 c6                	cmp    %eax,%esi
801062ca:	0f 85 73 ff ff ff    	jne    80106243 <acquire+0x13>
801062d0:	83 ec 0c             	sub    $0xc,%esp
801062d3:	68 ff ef 10 80       	push   $0x8010efff
801062d8:	e8 f3 a0 ff ff       	call   801003d0 <panic>
801062dd:	8d 76 00             	lea    0x0(%esi),%esi

801062e0 <popcli>:
801062e0:	55                   	push   %ebp
801062e1:	89 e5                	mov    %esp,%ebp
801062e3:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801062e6:	9c                   	pushf  
801062e7:	58                   	pop    %eax
801062e8:	f6 c4 02             	test   $0x2,%ah
801062eb:	75 52                	jne    8010633f <popcli+0x5f>
801062ed:	e8 ba ee ff ff       	call   801051ac <mycpu>
801062f2:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
801062f8:	8d 51 ff             	lea    -0x1(%ecx),%edx
801062fb:	85 d2                	test   %edx,%edx
801062fd:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80106303:	78 2d                	js     80106332 <popcli+0x52>
80106305:	e8 a2 ee ff ff       	call   801051ac <mycpu>
8010630a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80106310:	85 d2                	test   %edx,%edx
80106312:	74 0c                	je     80106320 <popcli+0x40>
80106314:	c9                   	leave  
80106315:	c3                   	ret    
80106316:	8d 76 00             	lea    0x0(%esi),%esi
80106319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106320:	e8 87 ee ff ff       	call   801051ac <mycpu>
80106325:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010632b:	85 c0                	test   %eax,%eax
8010632d:	74 e5                	je     80106314 <popcli+0x34>
  asm volatile("sti");
8010632f:	fb                   	sti    
80106330:	c9                   	leave  
80106331:	c3                   	ret    
80106332:	83 ec 0c             	sub    $0xc,%esp
80106335:	68 1e f0 10 80       	push   $0x8010f01e
8010633a:	e8 91 a0 ff ff       	call   801003d0 <panic>
8010633f:	83 ec 0c             	sub    $0xc,%esp
80106342:	68 07 f0 10 80       	push   $0x8010f007
80106347:	e8 84 a0 ff ff       	call   801003d0 <panic>
8010634c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106350 <release>:
80106350:	55                   	push   %ebp
80106351:	89 e5                	mov    %esp,%ebp
80106353:	56                   	push   %esi
80106354:	53                   	push   %ebx
80106355:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106358:	8b 03                	mov    (%ebx),%eax
8010635a:	85 c0                	test   %eax,%eax
8010635c:	75 12                	jne    80106370 <release+0x20>
8010635e:	83 ec 0c             	sub    $0xc,%esp
80106361:	68 25 f0 10 80       	push   $0x8010f025
80106366:	e8 65 a0 ff ff       	call   801003d0 <panic>
8010636b:	90                   	nop
8010636c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106370:	8b 73 08             	mov    0x8(%ebx),%esi
80106373:	e8 34 ee ff ff       	call   801051ac <mycpu>
80106378:	39 c6                	cmp    %eax,%esi
8010637a:	75 e2                	jne    8010635e <release+0xe>
8010637c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80106383:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
8010638a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010638f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80106395:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106398:	5b                   	pop    %ebx
80106399:	5e                   	pop    %esi
8010639a:	5d                   	pop    %ebp
8010639b:	e9 40 ff ff ff       	jmp    801062e0 <popcli>

801063a0 <memset>:
801063a0:	55                   	push   %ebp
801063a1:	89 e5                	mov    %esp,%ebp
801063a3:	57                   	push   %edi
801063a4:	53                   	push   %ebx
801063a5:	8b 55 08             	mov    0x8(%ebp),%edx
801063a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801063ab:	f6 c2 03             	test   $0x3,%dl
801063ae:	75 05                	jne    801063b5 <memset+0x15>
801063b0:	f6 c1 03             	test   $0x3,%cl
801063b3:	74 13                	je     801063c8 <memset+0x28>
  asm volatile("cld; rep stosb" :
801063b5:	89 d7                	mov    %edx,%edi
801063b7:	8b 45 0c             	mov    0xc(%ebp),%eax
801063ba:	fc                   	cld    
801063bb:	f3 aa                	rep stos %al,%es:(%edi)
801063bd:	5b                   	pop    %ebx
801063be:	89 d0                	mov    %edx,%eax
801063c0:	5f                   	pop    %edi
801063c1:	5d                   	pop    %ebp
801063c2:	c3                   	ret    
801063c3:	90                   	nop
801063c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801063c8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
  asm volatile("cld; rep stosl" :
801063cc:	c1 e9 02             	shr    $0x2,%ecx
801063cf:	89 fb                	mov    %edi,%ebx
801063d1:	89 f8                	mov    %edi,%eax
801063d3:	c1 e3 18             	shl    $0x18,%ebx
801063d6:	c1 e0 10             	shl    $0x10,%eax
801063d9:	09 d8                	or     %ebx,%eax
801063db:	09 f8                	or     %edi,%eax
801063dd:	c1 e7 08             	shl    $0x8,%edi
801063e0:	09 f8                	or     %edi,%eax
801063e2:	89 d7                	mov    %edx,%edi
801063e4:	fc                   	cld    
801063e5:	f3 ab                	rep stos %eax,%es:(%edi)
801063e7:	5b                   	pop    %ebx
801063e8:	89 d0                	mov    %edx,%eax
801063ea:	5f                   	pop    %edi
801063eb:	5d                   	pop    %ebp
801063ec:	c3                   	ret    
801063ed:	8d 76 00             	lea    0x0(%esi),%esi

801063f0 <memcmp>:
801063f0:	55                   	push   %ebp
801063f1:	89 e5                	mov    %esp,%ebp
801063f3:	57                   	push   %edi
801063f4:	56                   	push   %esi
801063f5:	8b 45 10             	mov    0x10(%ebp),%eax
801063f8:	53                   	push   %ebx
801063f9:	8b 75 0c             	mov    0xc(%ebp),%esi
801063fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801063ff:	85 c0                	test   %eax,%eax
80106401:	74 29                	je     8010642c <memcmp+0x3c>
80106403:	0f b6 13             	movzbl (%ebx),%edx
80106406:	0f b6 0e             	movzbl (%esi),%ecx
80106409:	38 d1                	cmp    %dl,%cl
8010640b:	75 2b                	jne    80106438 <memcmp+0x48>
8010640d:	8d 78 ff             	lea    -0x1(%eax),%edi
80106410:	31 c0                	xor    %eax,%eax
80106412:	eb 14                	jmp    80106428 <memcmp+0x38>
80106414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106418:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010641d:	83 c0 01             	add    $0x1,%eax
80106420:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80106424:	38 ca                	cmp    %cl,%dl
80106426:	75 10                	jne    80106438 <memcmp+0x48>
80106428:	39 f8                	cmp    %edi,%eax
8010642a:	75 ec                	jne    80106418 <memcmp+0x28>
8010642c:	5b                   	pop    %ebx
8010642d:	31 c0                	xor    %eax,%eax
8010642f:	5e                   	pop    %esi
80106430:	5f                   	pop    %edi
80106431:	5d                   	pop    %ebp
80106432:	c3                   	ret    
80106433:	90                   	nop
80106434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106438:	0f b6 c2             	movzbl %dl,%eax
8010643b:	5b                   	pop    %ebx
8010643c:	29 c8                	sub    %ecx,%eax
8010643e:	5e                   	pop    %esi
8010643f:	5f                   	pop    %edi
80106440:	5d                   	pop    %ebp
80106441:	c3                   	ret    
80106442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106450 <memmove>:
80106450:	55                   	push   %ebp
80106451:	89 e5                	mov    %esp,%ebp
80106453:	56                   	push   %esi
80106454:	53                   	push   %ebx
80106455:	8b 45 08             	mov    0x8(%ebp),%eax
80106458:	8b 75 0c             	mov    0xc(%ebp),%esi
8010645b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010645e:	39 c6                	cmp    %eax,%esi
80106460:	73 2e                	jae    80106490 <memmove+0x40>
80106462:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80106465:	39 c8                	cmp    %ecx,%eax
80106467:	73 27                	jae    80106490 <memmove+0x40>
80106469:	85 db                	test   %ebx,%ebx
8010646b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010646e:	74 17                	je     80106487 <memmove+0x37>
80106470:	29 d9                	sub    %ebx,%ecx
80106472:	89 cb                	mov    %ecx,%ebx
80106474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106478:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010647c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010647f:	83 ea 01             	sub    $0x1,%edx
80106482:	83 fa ff             	cmp    $0xffffffff,%edx
80106485:	75 f1                	jne    80106478 <memmove+0x28>
80106487:	5b                   	pop    %ebx
80106488:	5e                   	pop    %esi
80106489:	5d                   	pop    %ebp
8010648a:	c3                   	ret    
8010648b:	90                   	nop
8010648c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106490:	31 d2                	xor    %edx,%edx
80106492:	85 db                	test   %ebx,%ebx
80106494:	74 f1                	je     80106487 <memmove+0x37>
80106496:	8d 76 00             	lea    0x0(%esi),%esi
80106499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801064a0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801064a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801064a7:	83 c2 01             	add    $0x1,%edx
801064aa:	39 d3                	cmp    %edx,%ebx
801064ac:	75 f2                	jne    801064a0 <memmove+0x50>
801064ae:	5b                   	pop    %ebx
801064af:	5e                   	pop    %esi
801064b0:	5d                   	pop    %ebp
801064b1:	c3                   	ret    
801064b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801064b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801064c0 <memcpy>:
801064c0:	55                   	push   %ebp
801064c1:	89 e5                	mov    %esp,%ebp
801064c3:	5d                   	pop    %ebp
801064c4:	eb 8a                	jmp    80106450 <memmove>
801064c6:	8d 76 00             	lea    0x0(%esi),%esi
801064c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801064d0 <strncmp>:
801064d0:	55                   	push   %ebp
801064d1:	89 e5                	mov    %esp,%ebp
801064d3:	57                   	push   %edi
801064d4:	56                   	push   %esi
801064d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801064d8:	53                   	push   %ebx
801064d9:	8b 7d 08             	mov    0x8(%ebp),%edi
801064dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801064df:	85 c9                	test   %ecx,%ecx
801064e1:	74 37                	je     8010651a <strncmp+0x4a>
801064e3:	0f b6 17             	movzbl (%edi),%edx
801064e6:	0f b6 1e             	movzbl (%esi),%ebx
801064e9:	84 d2                	test   %dl,%dl
801064eb:	74 3f                	je     8010652c <strncmp+0x5c>
801064ed:	38 d3                	cmp    %dl,%bl
801064ef:	75 3b                	jne    8010652c <strncmp+0x5c>
801064f1:	8d 47 01             	lea    0x1(%edi),%eax
801064f4:	01 cf                	add    %ecx,%edi
801064f6:	eb 1b                	jmp    80106513 <strncmp+0x43>
801064f8:	90                   	nop
801064f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106500:	0f b6 10             	movzbl (%eax),%edx
80106503:	84 d2                	test   %dl,%dl
80106505:	74 21                	je     80106528 <strncmp+0x58>
80106507:	0f b6 19             	movzbl (%ecx),%ebx
8010650a:	83 c0 01             	add    $0x1,%eax
8010650d:	89 ce                	mov    %ecx,%esi
8010650f:	38 da                	cmp    %bl,%dl
80106511:	75 19                	jne    8010652c <strncmp+0x5c>
80106513:	39 c7                	cmp    %eax,%edi
80106515:	8d 4e 01             	lea    0x1(%esi),%ecx
80106518:	75 e6                	jne    80106500 <strncmp+0x30>
8010651a:	5b                   	pop    %ebx
8010651b:	31 c0                	xor    %eax,%eax
8010651d:	5e                   	pop    %esi
8010651e:	5f                   	pop    %edi
8010651f:	5d                   	pop    %ebp
80106520:	c3                   	ret    
80106521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106528:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010652c:	0f b6 c2             	movzbl %dl,%eax
8010652f:	29 d8                	sub    %ebx,%eax
80106531:	5b                   	pop    %ebx
80106532:	5e                   	pop    %esi
80106533:	5f                   	pop    %edi
80106534:	5d                   	pop    %ebp
80106535:	c3                   	ret    
80106536:	8d 76 00             	lea    0x0(%esi),%esi
80106539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106540 <strcmp>:
80106540:	55                   	push   %ebp
80106541:	89 e5                	mov    %esp,%ebp
80106543:	56                   	push   %esi
80106544:	53                   	push   %ebx
80106545:	8b 55 08             	mov    0x8(%ebp),%edx
80106548:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010654b:	0f b6 02             	movzbl (%edx),%eax
8010654e:	0f b6 19             	movzbl (%ecx),%ebx
80106551:	84 c0                	test   %al,%al
80106553:	75 1e                	jne    80106573 <strcmp+0x33>
80106555:	eb 29                	jmp    80106580 <strcmp+0x40>
80106557:	89 f6                	mov    %esi,%esi
80106559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106560:	83 c2 01             	add    $0x1,%edx
80106563:	0f b6 02             	movzbl (%edx),%eax
80106566:	8d 71 01             	lea    0x1(%ecx),%esi
80106569:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
8010656d:	84 c0                	test   %al,%al
8010656f:	74 0f                	je     80106580 <strcmp+0x40>
80106571:	89 f1                	mov    %esi,%ecx
80106573:	38 d8                	cmp    %bl,%al
80106575:	74 e9                	je     80106560 <strcmp+0x20>
80106577:	29 d8                	sub    %ebx,%eax
80106579:	5b                   	pop    %ebx
8010657a:	5e                   	pop    %esi
8010657b:	5d                   	pop    %ebp
8010657c:	c3                   	ret    
8010657d:	8d 76 00             	lea    0x0(%esi),%esi
80106580:	31 c0                	xor    %eax,%eax
80106582:	29 d8                	sub    %ebx,%eax
80106584:	5b                   	pop    %ebx
80106585:	5e                   	pop    %esi
80106586:	5d                   	pop    %ebp
80106587:	c3                   	ret    
80106588:	90                   	nop
80106589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106590 <strncpy>:
80106590:	55                   	push   %ebp
80106591:	89 e5                	mov    %esp,%ebp
80106593:	56                   	push   %esi
80106594:	53                   	push   %ebx
80106595:	8b 45 08             	mov    0x8(%ebp),%eax
80106598:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010659b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010659e:	89 c2                	mov    %eax,%edx
801065a0:	eb 19                	jmp    801065bb <strncpy+0x2b>
801065a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801065a8:	83 c3 01             	add    $0x1,%ebx
801065ab:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801065af:	83 c2 01             	add    $0x1,%edx
801065b2:	84 c9                	test   %cl,%cl
801065b4:	88 4a ff             	mov    %cl,-0x1(%edx)
801065b7:	74 09                	je     801065c2 <strncpy+0x32>
801065b9:	89 f1                	mov    %esi,%ecx
801065bb:	85 c9                	test   %ecx,%ecx
801065bd:	8d 71 ff             	lea    -0x1(%ecx),%esi
801065c0:	7f e6                	jg     801065a8 <strncpy+0x18>
801065c2:	31 c9                	xor    %ecx,%ecx
801065c4:	85 f6                	test   %esi,%esi
801065c6:	7e 17                	jle    801065df <strncpy+0x4f>
801065c8:	90                   	nop
801065c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801065d0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801065d4:	89 f3                	mov    %esi,%ebx
801065d6:	83 c1 01             	add    $0x1,%ecx
801065d9:	29 cb                	sub    %ecx,%ebx
801065db:	85 db                	test   %ebx,%ebx
801065dd:	7f f1                	jg     801065d0 <strncpy+0x40>
801065df:	5b                   	pop    %ebx
801065e0:	5e                   	pop    %esi
801065e1:	5d                   	pop    %ebp
801065e2:	c3                   	ret    
801065e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801065e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801065f0 <safestrcpy>:
801065f0:	55                   	push   %ebp
801065f1:	89 e5                	mov    %esp,%ebp
801065f3:	56                   	push   %esi
801065f4:	53                   	push   %ebx
801065f5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801065f8:	8b 45 08             	mov    0x8(%ebp),%eax
801065fb:	8b 55 0c             	mov    0xc(%ebp),%edx
801065fe:	85 c9                	test   %ecx,%ecx
80106600:	7e 26                	jle    80106628 <safestrcpy+0x38>
80106602:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80106606:	89 c1                	mov    %eax,%ecx
80106608:	eb 17                	jmp    80106621 <safestrcpy+0x31>
8010660a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106610:	83 c2 01             	add    $0x1,%edx
80106613:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80106617:	83 c1 01             	add    $0x1,%ecx
8010661a:	84 db                	test   %bl,%bl
8010661c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010661f:	74 04                	je     80106625 <safestrcpy+0x35>
80106621:	39 f2                	cmp    %esi,%edx
80106623:	75 eb                	jne    80106610 <safestrcpy+0x20>
80106625:	c6 01 00             	movb   $0x0,(%ecx)
80106628:	5b                   	pop    %ebx
80106629:	5e                   	pop    %esi
8010662a:	5d                   	pop    %ebp
8010662b:	c3                   	ret    
8010662c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106630 <strlen>:
80106630:	55                   	push   %ebp
80106631:	31 c0                	xor    %eax,%eax
80106633:	89 e5                	mov    %esp,%ebp
80106635:	8b 55 08             	mov    0x8(%ebp),%edx
80106638:	80 3a 00             	cmpb   $0x0,(%edx)
8010663b:	74 0c                	je     80106649 <strlen+0x19>
8010663d:	8d 76 00             	lea    0x0(%esi),%esi
80106640:	83 c0 01             	add    $0x1,%eax
80106643:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80106647:	75 f7                	jne    80106640 <strlen+0x10>
80106649:	5d                   	pop    %ebp
8010664a:	c3                   	ret    

8010664b <swtch>:
8010664b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010664f:	8b 54 24 08          	mov    0x8(%esp),%edx
80106653:	55                   	push   %ebp
80106654:	53                   	push   %ebx
80106655:	56                   	push   %esi
80106656:	57                   	push   %edi
80106657:	89 20                	mov    %esp,(%eax)
80106659:	89 d4                	mov    %edx,%esp
8010665b:	5f                   	pop    %edi
8010665c:	5e                   	pop    %esi
8010665d:	5b                   	pop    %ebx
8010665e:	5d                   	pop    %ebp
8010665f:	c3                   	ret    

80106660 <fetchint>:
80106660:	55                   	push   %ebp
80106661:	89 e5                	mov    %esp,%ebp
80106663:	53                   	push   %ebx
80106664:	83 ec 04             	sub    $0x4,%esp
80106667:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010666a:	e8 b4 eb ff ff       	call   80105223 <myproc>
8010666f:	8b 00                	mov    (%eax),%eax
80106671:	39 d8                	cmp    %ebx,%eax
80106673:	76 1b                	jbe    80106690 <fetchint+0x30>
80106675:	8d 53 04             	lea    0x4(%ebx),%edx
80106678:	39 d0                	cmp    %edx,%eax
8010667a:	72 14                	jb     80106690 <fetchint+0x30>
8010667c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010667f:	8b 13                	mov    (%ebx),%edx
80106681:	89 10                	mov    %edx,(%eax)
80106683:	31 c0                	xor    %eax,%eax
80106685:	83 c4 04             	add    $0x4,%esp
80106688:	5b                   	pop    %ebx
80106689:	5d                   	pop    %ebp
8010668a:	c3                   	ret    
8010668b:	90                   	nop
8010668c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106695:	eb ee                	jmp    80106685 <fetchint+0x25>
80106697:	89 f6                	mov    %esi,%esi
80106699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801066a0 <fetchstr>:
801066a0:	55                   	push   %ebp
801066a1:	89 e5                	mov    %esp,%ebp
801066a3:	53                   	push   %ebx
801066a4:	83 ec 04             	sub    $0x4,%esp
801066a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801066aa:	e8 74 eb ff ff       	call   80105223 <myproc>
801066af:	39 18                	cmp    %ebx,(%eax)
801066b1:	76 29                	jbe    801066dc <fetchstr+0x3c>
801066b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801066b6:	89 da                	mov    %ebx,%edx
801066b8:	89 19                	mov    %ebx,(%ecx)
801066ba:	8b 00                	mov    (%eax),%eax
801066bc:	39 c3                	cmp    %eax,%ebx
801066be:	73 1c                	jae    801066dc <fetchstr+0x3c>
801066c0:	80 3b 00             	cmpb   $0x0,(%ebx)
801066c3:	75 10                	jne    801066d5 <fetchstr+0x35>
801066c5:	eb 29                	jmp    801066f0 <fetchstr+0x50>
801066c7:	89 f6                	mov    %esi,%esi
801066c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801066d0:	80 3a 00             	cmpb   $0x0,(%edx)
801066d3:	74 1b                	je     801066f0 <fetchstr+0x50>
801066d5:	83 c2 01             	add    $0x1,%edx
801066d8:	39 d0                	cmp    %edx,%eax
801066da:	77 f4                	ja     801066d0 <fetchstr+0x30>
801066dc:	83 c4 04             	add    $0x4,%esp
801066df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801066e4:	5b                   	pop    %ebx
801066e5:	5d                   	pop    %ebp
801066e6:	c3                   	ret    
801066e7:	89 f6                	mov    %esi,%esi
801066e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801066f0:	83 c4 04             	add    $0x4,%esp
801066f3:	89 d0                	mov    %edx,%eax
801066f5:	29 d8                	sub    %ebx,%eax
801066f7:	5b                   	pop    %ebx
801066f8:	5d                   	pop    %ebp
801066f9:	c3                   	ret    
801066fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106700 <argint>:
80106700:	55                   	push   %ebp
80106701:	89 e5                	mov    %esp,%ebp
80106703:	56                   	push   %esi
80106704:	53                   	push   %ebx
80106705:	e8 19 eb ff ff       	call   80105223 <myproc>
8010670a:	8b 40 38             	mov    0x38(%eax),%eax
8010670d:	8b 55 08             	mov    0x8(%ebp),%edx
80106710:	8b 40 44             	mov    0x44(%eax),%eax
80106713:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80106716:	e8 08 eb ff ff       	call   80105223 <myproc>
8010671b:	8b 00                	mov    (%eax),%eax
8010671d:	8d 73 04             	lea    0x4(%ebx),%esi
80106720:	39 c6                	cmp    %eax,%esi
80106722:	73 1c                	jae    80106740 <argint+0x40>
80106724:	8d 53 08             	lea    0x8(%ebx),%edx
80106727:	39 d0                	cmp    %edx,%eax
80106729:	72 15                	jb     80106740 <argint+0x40>
8010672b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010672e:	8b 53 04             	mov    0x4(%ebx),%edx
80106731:	89 10                	mov    %edx,(%eax)
80106733:	31 c0                	xor    %eax,%eax
80106735:	5b                   	pop    %ebx
80106736:	5e                   	pop    %esi
80106737:	5d                   	pop    %ebp
80106738:	c3                   	ret    
80106739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106740:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106745:	eb ee                	jmp    80106735 <argint+0x35>
80106747:	89 f6                	mov    %esi,%esi
80106749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106750 <argptr>:
80106750:	55                   	push   %ebp
80106751:	89 e5                	mov    %esp,%ebp
80106753:	56                   	push   %esi
80106754:	53                   	push   %ebx
80106755:	83 ec 10             	sub    $0x10,%esp
80106758:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010675b:	e8 c3 ea ff ff       	call   80105223 <myproc>
80106760:	89 c6                	mov    %eax,%esi
80106762:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106765:	83 ec 08             	sub    $0x8,%esp
80106768:	50                   	push   %eax
80106769:	ff 75 08             	pushl  0x8(%ebp)
8010676c:	e8 8f ff ff ff       	call   80106700 <argint>
80106771:	c1 e8 1f             	shr    $0x1f,%eax
80106774:	83 c4 10             	add    $0x10,%esp
80106777:	84 c0                	test   %al,%al
80106779:	75 2d                	jne    801067a8 <argptr+0x58>
8010677b:	89 d8                	mov    %ebx,%eax
8010677d:	c1 e8 1f             	shr    $0x1f,%eax
80106780:	84 c0                	test   %al,%al
80106782:	75 24                	jne    801067a8 <argptr+0x58>
80106784:	8b 16                	mov    (%esi),%edx
80106786:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106789:	39 c2                	cmp    %eax,%edx
8010678b:	76 1b                	jbe    801067a8 <argptr+0x58>
8010678d:	01 c3                	add    %eax,%ebx
8010678f:	39 da                	cmp    %ebx,%edx
80106791:	72 15                	jb     801067a8 <argptr+0x58>
80106793:	8b 55 0c             	mov    0xc(%ebp),%edx
80106796:	89 02                	mov    %eax,(%edx)
80106798:	31 c0                	xor    %eax,%eax
8010679a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010679d:	5b                   	pop    %ebx
8010679e:	5e                   	pop    %esi
8010679f:	5d                   	pop    %ebp
801067a0:	c3                   	ret    
801067a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801067a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801067ad:	eb eb                	jmp    8010679a <argptr+0x4a>
801067af:	90                   	nop

801067b0 <argstr>:
801067b0:	55                   	push   %ebp
801067b1:	89 e5                	mov    %esp,%ebp
801067b3:	83 ec 20             	sub    $0x20,%esp
801067b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801067b9:	50                   	push   %eax
801067ba:	ff 75 08             	pushl  0x8(%ebp)
801067bd:	e8 3e ff ff ff       	call   80106700 <argint>
801067c2:	83 c4 10             	add    $0x10,%esp
801067c5:	85 c0                	test   %eax,%eax
801067c7:	78 17                	js     801067e0 <argstr+0x30>
801067c9:	83 ec 08             	sub    $0x8,%esp
801067cc:	ff 75 0c             	pushl  0xc(%ebp)
801067cf:	ff 75 f4             	pushl  -0xc(%ebp)
801067d2:	e8 c9 fe ff ff       	call   801066a0 <fetchstr>
801067d7:	83 c4 10             	add    $0x10,%esp
801067da:	c9                   	leave  
801067db:	c3                   	ret    
801067dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801067e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801067e5:	c9                   	leave  
801067e6:	c3                   	ret    
801067e7:	89 f6                	mov    %esi,%esi
801067e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801067f0 <syscall>:
801067f0:	55                   	push   %ebp
801067f1:	89 e5                	mov    %esp,%ebp
801067f3:	56                   	push   %esi
801067f4:	53                   	push   %ebx
801067f5:	e8 29 ea ff ff       	call   80105223 <myproc>
801067fa:	8b 70 38             	mov    0x38(%eax),%esi
801067fd:	89 c3                	mov    %eax,%ebx
801067ff:	8b 46 1c             	mov    0x1c(%esi),%eax
80106802:	8d 50 ff             	lea    -0x1(%eax),%edx
80106805:	83 fa 1f             	cmp    $0x1f,%edx
80106808:	77 1e                	ja     80106828 <syscall+0x38>
8010680a:	8b 14 85 60 f0 10 80 	mov    -0x7fef0fa0(,%eax,4),%edx
80106811:	85 d2                	test   %edx,%edx
80106813:	74 13                	je     80106828 <syscall+0x38>
80106815:	ff d2                	call   *%edx
80106817:	89 46 1c             	mov    %eax,0x1c(%esi)
8010681a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010681d:	5b                   	pop    %ebx
8010681e:	5e                   	pop    %esi
8010681f:	5d                   	pop    %ebp
80106820:	c3                   	ret    
80106821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106828:	50                   	push   %eax
80106829:	8d 83 90 00 00 00    	lea    0x90(%ebx),%eax
8010682f:	50                   	push   %eax
80106830:	ff 73 10             	pushl  0x10(%ebx)
80106833:	68 2d f0 10 80       	push   $0x8010f02d
80106838:	e8 23 9e ff ff       	call   80100660 <cprintf>
8010683d:	8b 43 38             	mov    0x38(%ebx),%eax
80106840:	83 c4 10             	add    $0x10,%esp
80106843:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
8010684a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010684d:	5b                   	pop    %ebx
8010684e:	5e                   	pop    %esi
8010684f:	5d                   	pop    %ebp
80106850:	c3                   	ret    
80106851:	66 90                	xchg   %ax,%ax
80106853:	66 90                	xchg   %ax,%ax
80106855:	66 90                	xchg   %ax,%ax
80106857:	66 90                	xchg   %ax,%ax
80106859:	66 90                	xchg   %ax,%ax
8010685b:	66 90                	xchg   %ax,%ax
8010685d:	66 90                	xchg   %ax,%ax
8010685f:	90                   	nop

80106860 <createmount>:
80106860:	55                   	push   %ebp
80106861:	89 e5                	mov    %esp,%ebp
80106863:	57                   	push   %edi
80106864:	56                   	push   %esi
80106865:	53                   	push   %ebx
80106866:	8d 75 da             	lea    -0x26(%ebp),%esi
80106869:	83 ec 40             	sub    $0x40,%esp
8010686c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010686f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80106872:	ff 75 0c             	pushl  0xc(%ebp)
80106875:	56                   	push   %esi
80106876:	50                   	push   %eax
80106877:	89 55 c4             	mov    %edx,-0x3c(%ebp)
8010687a:	89 4d bc             	mov    %ecx,-0x44(%ebp)
8010687d:	e8 5e c0 ff ff       	call   801028e0 <nameiparentmount>
80106882:	83 c4 10             	add    $0x10,%esp
80106885:	85 c0                	test   %eax,%eax
80106887:	0f 84 fb 00 00 00    	je     80106988 <createmount+0x128>
8010688d:	83 ec 0c             	sub    $0xc,%esp
80106890:	89 c3                	mov    %eax,%ebx
80106892:	50                   	push   %eax
80106893:	e8 38 b6 ff ff       	call   80101ed0 <ilock>
80106898:	8d 45 d4             	lea    -0x2c(%ebp),%eax
8010689b:	83 c4 0c             	add    $0xc,%esp
8010689e:	50                   	push   %eax
8010689f:	56                   	push   %esi
801068a0:	53                   	push   %ebx
801068a1:	e8 7a bb ff ff       	call   80102420 <dirlookup>
801068a6:	83 c4 10             	add    $0x10,%esp
801068a9:	85 c0                	test   %eax,%eax
801068ab:	89 c7                	mov    %eax,%edi
801068ad:	74 59                	je     80106908 <createmount+0xa8>
801068af:	83 ec 0c             	sub    $0xc,%esp
801068b2:	53                   	push   %ebx
801068b3:	e8 b8 b8 ff ff       	call   80102170 <iunlockput>
801068b8:	89 3c 24             	mov    %edi,(%esp)
801068bb:	e8 10 b6 ff ff       	call   80101ed0 <ilock>
801068c0:	83 c4 10             	add    $0x10,%esp
801068c3:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
801068c8:	75 16                	jne    801068e0 <createmount+0x80>
801068ca:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
801068cf:	89 f8                	mov    %edi,%eax
801068d1:	75 0d                	jne    801068e0 <createmount+0x80>
801068d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068d6:	5b                   	pop    %ebx
801068d7:	5e                   	pop    %esi
801068d8:	5f                   	pop    %edi
801068d9:	5d                   	pop    %ebp
801068da:	c3                   	ret    
801068db:	90                   	nop
801068dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801068e0:	83 ec 0c             	sub    $0xc,%esp
801068e3:	57                   	push   %edi
801068e4:	e8 87 b8 ff ff       	call   80102170 <iunlockput>
801068e9:	8b 45 0c             	mov    0xc(%ebp),%eax
801068ec:	5a                   	pop    %edx
801068ed:	ff 30                	pushl  (%eax)
801068ef:	e8 e7 d5 ff ff       	call   80103edb <mntput>
801068f4:	83 c4 10             	add    $0x10,%esp
801068f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068fa:	31 c0                	xor    %eax,%eax
801068fc:	5b                   	pop    %ebx
801068fd:	5e                   	pop    %esi
801068fe:	5f                   	pop    %edi
801068ff:	5d                   	pop    %ebp
80106900:	c3                   	ret    
80106901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106908:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
8010690c:	83 ec 08             	sub    $0x8,%esp
8010690f:	50                   	push   %eax
80106910:	ff 33                	pushl  (%ebx)
80106912:	e8 29 b4 ff ff       	call   80101d40 <ialloc>
80106917:	83 c4 10             	add    $0x10,%esp
8010691a:	85 c0                	test   %eax,%eax
8010691c:	89 c7                	mov    %eax,%edi
8010691e:	0f 84 c4 00 00 00    	je     801069e8 <createmount+0x188>
80106924:	83 ec 0c             	sub    $0xc,%esp
80106927:	50                   	push   %eax
80106928:	e8 a3 b5 ff ff       	call   80101ed0 <ilock>
8010692d:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80106931:	66 89 47 52          	mov    %ax,0x52(%edi)
80106935:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80106939:	66 89 47 54          	mov    %ax,0x54(%edi)
8010693d:	b8 01 00 00 00       	mov    $0x1,%eax
80106942:	66 89 47 56          	mov    %ax,0x56(%edi)
80106946:	89 3c 24             	mov    %edi,(%esp)
80106949:	e8 c2 b4 ff ff       	call   80101e10 <iupdate>
8010694e:	83 c4 10             	add    $0x10,%esp
80106951:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80106956:	74 38                	je     80106990 <createmount+0x130>
80106958:	83 ec 04             	sub    $0x4,%esp
8010695b:	ff 77 04             	pushl  0x4(%edi)
8010695e:	56                   	push   %esi
8010695f:	53                   	push   %ebx
80106960:	e8 0b be ff ff       	call   80102770 <dirlink>
80106965:	83 c4 10             	add    $0x10,%esp
80106968:	85 c0                	test   %eax,%eax
8010696a:	78 6f                	js     801069db <createmount+0x17b>
8010696c:	83 ec 0c             	sub    $0xc,%esp
8010696f:	53                   	push   %ebx
80106970:	e8 fb b7 ff ff       	call   80102170 <iunlockput>
80106975:	83 c4 10             	add    $0x10,%esp
80106978:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010697b:	89 f8                	mov    %edi,%eax
8010697d:	5b                   	pop    %ebx
8010697e:	5e                   	pop    %esi
8010697f:	5f                   	pop    %edi
80106980:	5d                   	pop    %ebp
80106981:	c3                   	ret    
80106982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106988:	31 c0                	xor    %eax,%eax
8010698a:	e9 44 ff ff ff       	jmp    801068d3 <createmount+0x73>
8010698f:	90                   	nop
80106990:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80106995:	83 ec 0c             	sub    $0xc,%esp
80106998:	53                   	push   %ebx
80106999:	e8 72 b4 ff ff       	call   80101e10 <iupdate>
8010699e:	83 c4 0c             	add    $0xc,%esp
801069a1:	ff 77 04             	pushl  0x4(%edi)
801069a4:	68 d1 e8 10 80       	push   $0x8010e8d1
801069a9:	57                   	push   %edi
801069aa:	e8 c1 bd ff ff       	call   80102770 <dirlink>
801069af:	83 c4 10             	add    $0x10,%esp
801069b2:	85 c0                	test   %eax,%eax
801069b4:	78 18                	js     801069ce <createmount+0x16e>
801069b6:	83 ec 04             	sub    $0x4,%esp
801069b9:	ff 73 04             	pushl  0x4(%ebx)
801069bc:	68 d0 e8 10 80       	push   $0x8010e8d0
801069c1:	57                   	push   %edi
801069c2:	e8 a9 bd ff ff       	call   80102770 <dirlink>
801069c7:	83 c4 10             	add    $0x10,%esp
801069ca:	85 c0                	test   %eax,%eax
801069cc:	79 8a                	jns    80106958 <createmount+0xf8>
801069ce:	83 ec 0c             	sub    $0xc,%esp
801069d1:	68 f3 f0 10 80       	push   $0x8010f0f3
801069d6:	e8 f5 99 ff ff       	call   801003d0 <panic>
801069db:	83 ec 0c             	sub    $0xc,%esp
801069de:	68 ff f0 10 80       	push   $0x8010f0ff
801069e3:	e8 e8 99 ff ff       	call   801003d0 <panic>
801069e8:	83 ec 0c             	sub    $0xc,%esp
801069eb:	68 e4 f0 10 80       	push   $0x8010f0e4
801069f0:	e8 db 99 ff ff       	call   801003d0 <panic>
801069f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801069f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a00 <argfd.constprop.0>:
80106a00:	55                   	push   %ebp
80106a01:	89 e5                	mov    %esp,%ebp
80106a03:	56                   	push   %esi
80106a04:	53                   	push   %ebx
80106a05:	89 c6                	mov    %eax,%esi
80106a07:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106a0a:	89 d3                	mov    %edx,%ebx
80106a0c:	83 ec 18             	sub    $0x18,%esp
80106a0f:	50                   	push   %eax
80106a10:	6a 00                	push   $0x0
80106a12:	e8 e9 fc ff ff       	call   80106700 <argint>
80106a17:	83 c4 10             	add    $0x10,%esp
80106a1a:	85 c0                	test   %eax,%eax
80106a1c:	78 32                	js     80106a50 <argfd.constprop.0+0x50>
80106a1e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80106a22:	77 2c                	ja     80106a50 <argfd.constprop.0+0x50>
80106a24:	e8 fa e7 ff ff       	call   80105223 <myproc>
80106a29:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106a2c:	8b 44 90 48          	mov    0x48(%eax,%edx,4),%eax
80106a30:	85 c0                	test   %eax,%eax
80106a32:	74 1c                	je     80106a50 <argfd.constprop.0+0x50>
80106a34:	85 f6                	test   %esi,%esi
80106a36:	74 02                	je     80106a3a <argfd.constprop.0+0x3a>
80106a38:	89 16                	mov    %edx,(%esi)
80106a3a:	85 db                	test   %ebx,%ebx
80106a3c:	74 22                	je     80106a60 <argfd.constprop.0+0x60>
80106a3e:	89 03                	mov    %eax,(%ebx)
80106a40:	31 c0                	xor    %eax,%eax
80106a42:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106a45:	5b                   	pop    %ebx
80106a46:	5e                   	pop    %esi
80106a47:	5d                   	pop    %ebp
80106a48:	c3                   	ret    
80106a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a50:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106a53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106a58:	5b                   	pop    %ebx
80106a59:	5e                   	pop    %esi
80106a5a:	5d                   	pop    %ebp
80106a5b:	c3                   	ret    
80106a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106a60:	31 c0                	xor    %eax,%eax
80106a62:	eb de                	jmp    80106a42 <argfd.constprop.0+0x42>
80106a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106a70 <sys_dup>:
80106a70:	55                   	push   %ebp
80106a71:	31 c0                	xor    %eax,%eax
80106a73:	89 e5                	mov    %esp,%ebp
80106a75:	56                   	push   %esi
80106a76:	53                   	push   %ebx
80106a77:	8d 55 f4             	lea    -0xc(%ebp),%edx
80106a7a:	83 ec 10             	sub    $0x10,%esp
80106a7d:	e8 7e ff ff ff       	call   80106a00 <argfd.constprop.0>
80106a82:	85 c0                	test   %eax,%eax
80106a84:	78 1a                	js     80106aa0 <sys_dup+0x30>
80106a86:	31 db                	xor    %ebx,%ebx
80106a88:	8b 75 f4             	mov    -0xc(%ebp),%esi
80106a8b:	e8 93 e7 ff ff       	call   80105223 <myproc>
80106a90:	8b 54 98 48          	mov    0x48(%eax,%ebx,4),%edx
80106a94:	85 d2                	test   %edx,%edx
80106a96:	74 18                	je     80106ab0 <sys_dup+0x40>
80106a98:	83 c3 01             	add    $0x1,%ebx
80106a9b:	83 fb 10             	cmp    $0x10,%ebx
80106a9e:	75 f0                	jne    80106a90 <sys_dup+0x20>
80106aa0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106aa3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106aa8:	5b                   	pop    %ebx
80106aa9:	5e                   	pop    %esi
80106aaa:	5d                   	pop    %ebp
80106aab:	c3                   	ret    
80106aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ab0:	89 74 98 48          	mov    %esi,0x48(%eax,%ebx,4)
80106ab4:	83 ec 0c             	sub    $0xc,%esp
80106ab7:	ff 75 f4             	pushl  -0xc(%ebp)
80106aba:	e8 11 ab ff ff       	call   801015d0 <filedup>
80106abf:	83 c4 10             	add    $0x10,%esp
80106ac2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ac5:	89 d8                	mov    %ebx,%eax
80106ac7:	5b                   	pop    %ebx
80106ac8:	5e                   	pop    %esi
80106ac9:	5d                   	pop    %ebp
80106aca:	c3                   	ret    
80106acb:	90                   	nop
80106acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ad0 <sys_read>:
80106ad0:	55                   	push   %ebp
80106ad1:	31 c0                	xor    %eax,%eax
80106ad3:	89 e5                	mov    %esp,%ebp
80106ad5:	83 ec 18             	sub    $0x18,%esp
80106ad8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80106adb:	e8 20 ff ff ff       	call   80106a00 <argfd.constprop.0>
80106ae0:	85 c0                	test   %eax,%eax
80106ae2:	0f 88 88 00 00 00    	js     80106b70 <sys_read+0xa0>
80106ae8:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106aeb:	83 ec 08             	sub    $0x8,%esp
80106aee:	50                   	push   %eax
80106aef:	6a 02                	push   $0x2
80106af1:	e8 0a fc ff ff       	call   80106700 <argint>
80106af6:	83 c4 10             	add    $0x10,%esp
80106af9:	85 c0                	test   %eax,%eax
80106afb:	78 73                	js     80106b70 <sys_read+0xa0>
80106afd:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106b00:	83 ec 04             	sub    $0x4,%esp
80106b03:	ff 75 f0             	pushl  -0x10(%ebp)
80106b06:	50                   	push   %eax
80106b07:	6a 01                	push   $0x1
80106b09:	e8 42 fc ff ff       	call   80106750 <argptr>
80106b0e:	83 c4 10             	add    $0x10,%esp
80106b11:	85 c0                	test   %eax,%eax
80106b13:	78 5b                	js     80106b70 <sys_read+0xa0>
80106b15:	8b 45 ec             	mov    -0x14(%ebp),%eax
80106b18:	83 38 03             	cmpl   $0x3,(%eax)
80106b1b:	74 1b                	je     80106b38 <sys_read+0x68>
80106b1d:	83 ec 04             	sub    $0x4,%esp
80106b20:	ff 75 f0             	pushl  -0x10(%ebp)
80106b23:	ff 75 f4             	pushl  -0xc(%ebp)
80106b26:	50                   	push   %eax
80106b27:	e8 24 ac ff ff       	call   80101750 <fileread>
80106b2c:	83 c4 10             	add    $0x10,%esp
80106b2f:	c9                   	leave  
80106b30:	c3                   	ret    
80106b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b38:	80 78 14 00          	cmpb   $0x0,0x14(%eax)
80106b3c:	75 1a                	jne    80106b58 <sys_read+0x88>
80106b3e:	ff 75 f0             	pushl  -0x10(%ebp)
80106b41:	ff 75 f4             	pushl  -0xc(%ebp)
80106b44:	50                   	push   %eax
80106b45:	6a 01                	push   $0x1
80106b47:	e8 94 6b 00 00       	call   8010d6e0 <cg_read>
80106b4c:	83 c4 10             	add    $0x10,%esp
80106b4f:	c9                   	leave  
80106b50:	c3                   	ret    
80106b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b58:	ff 75 f0             	pushl  -0x10(%ebp)
80106b5b:	ff 75 f4             	pushl  -0xc(%ebp)
80106b5e:	50                   	push   %eax
80106b5f:	6a 00                	push   $0x0
80106b61:	e8 7a 6b 00 00       	call   8010d6e0 <cg_read>
80106b66:	83 c4 10             	add    $0x10,%esp
80106b69:	c9                   	leave  
80106b6a:	c3                   	ret    
80106b6b:	90                   	nop
80106b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106b75:	c9                   	leave  
80106b76:	c3                   	ret    
80106b77:	89 f6                	mov    %esi,%esi
80106b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b80 <sys_write>:
80106b80:	55                   	push   %ebp
80106b81:	31 c0                	xor    %eax,%eax
80106b83:	89 e5                	mov    %esp,%ebp
80106b85:	83 ec 18             	sub    $0x18,%esp
80106b88:	8d 55 ec             	lea    -0x14(%ebp),%edx
80106b8b:	e8 70 fe ff ff       	call   80106a00 <argfd.constprop.0>
80106b90:	85 c0                	test   %eax,%eax
80106b92:	78 64                	js     80106bf8 <sys_write+0x78>
80106b94:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106b97:	83 ec 08             	sub    $0x8,%esp
80106b9a:	50                   	push   %eax
80106b9b:	6a 02                	push   $0x2
80106b9d:	e8 5e fb ff ff       	call   80106700 <argint>
80106ba2:	83 c4 10             	add    $0x10,%esp
80106ba5:	85 c0                	test   %eax,%eax
80106ba7:	78 4f                	js     80106bf8 <sys_write+0x78>
80106ba9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106bac:	83 ec 04             	sub    $0x4,%esp
80106baf:	ff 75 f0             	pushl  -0x10(%ebp)
80106bb2:	50                   	push   %eax
80106bb3:	6a 01                	push   $0x1
80106bb5:	e8 96 fb ff ff       	call   80106750 <argptr>
80106bba:	83 c4 10             	add    $0x10,%esp
80106bbd:	85 c0                	test   %eax,%eax
80106bbf:	78 37                	js     80106bf8 <sys_write+0x78>
80106bc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
80106bc4:	83 38 03             	cmpl   $0x3,(%eax)
80106bc7:	74 17                	je     80106be0 <sys_write+0x60>
80106bc9:	83 ec 04             	sub    $0x4,%esp
80106bcc:	ff 75 f0             	pushl  -0x10(%ebp)
80106bcf:	ff 75 f4             	pushl  -0xc(%ebp)
80106bd2:	50                   	push   %eax
80106bd3:	e8 08 ac ff ff       	call   801017e0 <filewrite>
80106bd8:	83 c4 10             	add    $0x10,%esp
80106bdb:	c9                   	leave  
80106bdc:	c3                   	ret    
80106bdd:	8d 76 00             	lea    0x0(%esi),%esi
80106be0:	83 ec 04             	sub    $0x4,%esp
80106be3:	ff 75 f0             	pushl  -0x10(%ebp)
80106be6:	ff 75 f4             	pushl  -0xc(%ebp)
80106be9:	50                   	push   %eax
80106bea:	e8 31 6b 00 00       	call   8010d720 <cg_write>
80106bef:	83 c4 10             	add    $0x10,%esp
80106bf2:	c9                   	leave  
80106bf3:	c3                   	ret    
80106bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106bf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106bfd:	c9                   	leave  
80106bfe:	c3                   	ret    
80106bff:	90                   	nop

80106c00 <sys_close>:
80106c00:	55                   	push   %ebp
80106c01:	89 e5                	mov    %esp,%ebp
80106c03:	83 ec 18             	sub    $0x18,%esp
80106c06:	8d 55 f4             	lea    -0xc(%ebp),%edx
80106c09:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106c0c:	e8 ef fd ff ff       	call   80106a00 <argfd.constprop.0>
80106c11:	85 c0                	test   %eax,%eax
80106c13:	78 3b                	js     80106c50 <sys_close+0x50>
80106c15:	e8 09 e6 ff ff       	call   80105223 <myproc>
80106c1a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80106c1d:	c7 44 90 48 00 00 00 	movl   $0x0,0x48(%eax,%edx,4)
80106c24:	00 
80106c25:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106c28:	83 38 03             	cmpl   $0x3,(%eax)
80106c2b:	74 13                	je     80106c40 <sys_close+0x40>
80106c2d:	83 ec 0c             	sub    $0xc,%esp
80106c30:	50                   	push   %eax
80106c31:	e8 ea a9 ff ff       	call   80101620 <fileclose>
80106c36:	83 c4 10             	add    $0x10,%esp
80106c39:	31 c0                	xor    %eax,%eax
80106c3b:	c9                   	leave  
80106c3c:	c3                   	ret    
80106c3d:	8d 76 00             	lea    0x0(%esi),%esi
80106c40:	83 ec 0c             	sub    $0xc,%esp
80106c43:	50                   	push   %eax
80106c44:	e8 17 6b 00 00       	call   8010d760 <cg_close>
80106c49:	83 c4 10             	add    $0x10,%esp
80106c4c:	31 c0                	xor    %eax,%eax
80106c4e:	c9                   	leave  
80106c4f:	c3                   	ret    
80106c50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106c55:	c9                   	leave  
80106c56:	c3                   	ret    
80106c57:	89 f6                	mov    %esi,%esi
80106c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c60 <sys_fstat>:
80106c60:	55                   	push   %ebp
80106c61:	31 c0                	xor    %eax,%eax
80106c63:	89 e5                	mov    %esp,%ebp
80106c65:	83 ec 18             	sub    $0x18,%esp
80106c68:	8d 55 f0             	lea    -0x10(%ebp),%edx
80106c6b:	e8 90 fd ff ff       	call   80106a00 <argfd.constprop.0>
80106c70:	85 c0                	test   %eax,%eax
80106c72:	78 4c                	js     80106cc0 <sys_fstat+0x60>
80106c74:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106c77:	83 ec 04             	sub    $0x4,%esp
80106c7a:	6a 14                	push   $0x14
80106c7c:	50                   	push   %eax
80106c7d:	6a 01                	push   $0x1
80106c7f:	e8 cc fa ff ff       	call   80106750 <argptr>
80106c84:	83 c4 10             	add    $0x10,%esp
80106c87:	85 c0                	test   %eax,%eax
80106c89:	78 35                	js     80106cc0 <sys_fstat+0x60>
80106c8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80106c8e:	83 38 03             	cmpl   $0x3,(%eax)
80106c91:	74 15                	je     80106ca8 <sys_fstat+0x48>
80106c93:	83 ec 08             	sub    $0x8,%esp
80106c96:	ff 75 f4             	pushl  -0xc(%ebp)
80106c99:	50                   	push   %eax
80106c9a:	e8 61 aa ff ff       	call   80101700 <filestat>
80106c9f:	83 c4 10             	add    $0x10,%esp
80106ca2:	c9                   	leave  
80106ca3:	c3                   	ret    
80106ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ca8:	83 ec 08             	sub    $0x8,%esp
80106cab:	ff 75 f4             	pushl  -0xc(%ebp)
80106cae:	50                   	push   %eax
80106caf:	e8 dc 6a 00 00       	call   8010d790 <cg_stat>
80106cb4:	83 c4 10             	add    $0x10,%esp
80106cb7:	c9                   	leave  
80106cb8:	c3                   	ret    
80106cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106cc5:	c9                   	leave  
80106cc6:	c3                   	ret    
80106cc7:	89 f6                	mov    %esi,%esi
80106cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cd0 <sys_link>:
80106cd0:	55                   	push   %ebp
80106cd1:	89 e5                	mov    %esp,%ebp
80106cd3:	57                   	push   %edi
80106cd4:	56                   	push   %esi
80106cd5:	53                   	push   %ebx
80106cd6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80106cd9:	83 ec 34             	sub    $0x34,%esp
80106cdc:	50                   	push   %eax
80106cdd:	6a 00                	push   $0x0
80106cdf:	e8 cc fa ff ff       	call   801067b0 <argstr>
80106ce4:	83 c4 10             	add    $0x10,%esp
80106ce7:	85 c0                	test   %eax,%eax
80106ce9:	0f 88 fb 00 00 00    	js     80106dea <sys_link+0x11a>
80106cef:	8d 45 d0             	lea    -0x30(%ebp),%eax
80106cf2:	83 ec 08             	sub    $0x8,%esp
80106cf5:	50                   	push   %eax
80106cf6:	6a 01                	push   $0x1
80106cf8:	e8 b3 fa ff ff       	call   801067b0 <argstr>
80106cfd:	83 c4 10             	add    $0x10,%esp
80106d00:	85 c0                	test   %eax,%eax
80106d02:	0f 88 e2 00 00 00    	js     80106dea <sys_link+0x11a>
80106d08:	e8 d3 ca ff ff       	call   801037e0 <begin_op>
80106d0d:	83 ec 0c             	sub    $0xc,%esp
80106d10:	ff 75 d4             	pushl  -0x2c(%ebp)
80106d13:	e8 48 bb ff ff       	call   80102860 <namei>
80106d18:	83 c4 10             	add    $0x10,%esp
80106d1b:	85 c0                	test   %eax,%eax
80106d1d:	89 c3                	mov    %eax,%ebx
80106d1f:	0f 84 f3 00 00 00    	je     80106e18 <sys_link+0x148>
80106d25:	83 ec 0c             	sub    $0xc,%esp
80106d28:	50                   	push   %eax
80106d29:	e8 a2 b1 ff ff       	call   80101ed0 <ilock>
80106d2e:	83 c4 10             	add    $0x10,%esp
80106d31:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80106d36:	0f 84 c4 00 00 00    	je     80106e00 <sys_link+0x130>
80106d3c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80106d41:	83 ec 0c             	sub    $0xc,%esp
80106d44:	8d 7d da             	lea    -0x26(%ebp),%edi
80106d47:	53                   	push   %ebx
80106d48:	e8 c3 b0 ff ff       	call   80101e10 <iupdate>
80106d4d:	89 1c 24             	mov    %ebx,(%esp)
80106d50:	e8 5b b2 ff ff       	call   80101fb0 <iunlock>
80106d55:	58                   	pop    %eax
80106d56:	5a                   	pop    %edx
80106d57:	57                   	push   %edi
80106d58:	ff 75 d0             	pushl  -0x30(%ebp)
80106d5b:	e8 40 bb ff ff       	call   801028a0 <nameiparent>
80106d60:	83 c4 10             	add    $0x10,%esp
80106d63:	85 c0                	test   %eax,%eax
80106d65:	89 c6                	mov    %eax,%esi
80106d67:	74 5b                	je     80106dc4 <sys_link+0xf4>
80106d69:	83 ec 0c             	sub    $0xc,%esp
80106d6c:	50                   	push   %eax
80106d6d:	e8 5e b1 ff ff       	call   80101ed0 <ilock>
80106d72:	83 c4 10             	add    $0x10,%esp
80106d75:	8b 03                	mov    (%ebx),%eax
80106d77:	39 06                	cmp    %eax,(%esi)
80106d79:	75 3d                	jne    80106db8 <sys_link+0xe8>
80106d7b:	83 ec 04             	sub    $0x4,%esp
80106d7e:	ff 73 04             	pushl  0x4(%ebx)
80106d81:	57                   	push   %edi
80106d82:	56                   	push   %esi
80106d83:	e8 e8 b9 ff ff       	call   80102770 <dirlink>
80106d88:	83 c4 10             	add    $0x10,%esp
80106d8b:	85 c0                	test   %eax,%eax
80106d8d:	78 29                	js     80106db8 <sys_link+0xe8>
80106d8f:	83 ec 0c             	sub    $0xc,%esp
80106d92:	56                   	push   %esi
80106d93:	e8 d8 b3 ff ff       	call   80102170 <iunlockput>
80106d98:	89 1c 24             	mov    %ebx,(%esp)
80106d9b:	e8 60 b2 ff ff       	call   80102000 <iput>
80106da0:	e8 ab ca ff ff       	call   80103850 <end_op>
80106da5:	83 c4 10             	add    $0x10,%esp
80106da8:	31 c0                	xor    %eax,%eax
80106daa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dad:	5b                   	pop    %ebx
80106dae:	5e                   	pop    %esi
80106daf:	5f                   	pop    %edi
80106db0:	5d                   	pop    %ebp
80106db1:	c3                   	ret    
80106db2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106db8:	83 ec 0c             	sub    $0xc,%esp
80106dbb:	56                   	push   %esi
80106dbc:	e8 af b3 ff ff       	call   80102170 <iunlockput>
80106dc1:	83 c4 10             	add    $0x10,%esp
80106dc4:	83 ec 0c             	sub    $0xc,%esp
80106dc7:	53                   	push   %ebx
80106dc8:	e8 03 b1 ff ff       	call   80101ed0 <ilock>
80106dcd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80106dd2:	89 1c 24             	mov    %ebx,(%esp)
80106dd5:	e8 36 b0 ff ff       	call   80101e10 <iupdate>
80106dda:	89 1c 24             	mov    %ebx,(%esp)
80106ddd:	e8 8e b3 ff ff       	call   80102170 <iunlockput>
80106de2:	e8 69 ca ff ff       	call   80103850 <end_op>
80106de7:	83 c4 10             	add    $0x10,%esp
80106dea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ded:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106df2:	5b                   	pop    %ebx
80106df3:	5e                   	pop    %esi
80106df4:	5f                   	pop    %edi
80106df5:	5d                   	pop    %ebp
80106df6:	c3                   	ret    
80106df7:	89 f6                	mov    %esi,%esi
80106df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106e00:	83 ec 0c             	sub    $0xc,%esp
80106e03:	53                   	push   %ebx
80106e04:	e8 67 b3 ff ff       	call   80102170 <iunlockput>
80106e09:	e8 42 ca ff ff       	call   80103850 <end_op>
80106e0e:	83 c4 10             	add    $0x10,%esp
80106e11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106e16:	eb 92                	jmp    80106daa <sys_link+0xda>
80106e18:	e8 33 ca ff ff       	call   80103850 <end_op>
80106e1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106e22:	eb 86                	jmp    80106daa <sys_link+0xda>
80106e24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e30 <sys_unlink>:
80106e30:	55                   	push   %ebp
80106e31:	89 e5                	mov    %esp,%ebp
80106e33:	57                   	push   %edi
80106e34:	56                   	push   %esi
80106e35:	53                   	push   %ebx
80106e36:	8d 45 c0             	lea    -0x40(%ebp),%eax
80106e39:	83 ec 44             	sub    $0x44,%esp
80106e3c:	50                   	push   %eax
80106e3d:	6a 00                	push   $0x0
80106e3f:	e8 6c f9 ff ff       	call   801067b0 <argstr>
80106e44:	83 c4 10             	add    $0x10,%esp
80106e47:	85 c0                	test   %eax,%eax
80106e49:	0f 88 41 01 00 00    	js     80106f90 <sys_unlink+0x160>
80106e4f:	e8 8c c9 ff ff       	call   801037e0 <begin_op>
80106e54:	83 ec 08             	sub    $0x8,%esp
80106e57:	68 0f f1 10 80       	push   $0x8010f10f
80106e5c:	ff 75 c0             	pushl  -0x40(%ebp)
80106e5f:	e8 dc 6d 00 00       	call   8010dc40 <cgroup_delete>
80106e64:	83 c4 10             	add    $0x10,%esp
80106e67:	83 f8 ff             	cmp    $0xffffffff,%eax
80106e6a:	74 1c                	je     80106e88 <sys_unlink+0x58>
80106e6c:	83 f8 fe             	cmp    $0xfffffffe,%eax
80106e6f:	0f 84 9b 01 00 00    	je     80107010 <sys_unlink+0x1e0>
80106e75:	e8 d6 c9 ff ff       	call   80103850 <end_op>
80106e7a:	31 c0                	xor    %eax,%eax
80106e7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e7f:	5b                   	pop    %ebx
80106e80:	5e                   	pop    %esi
80106e81:	5f                   	pop    %edi
80106e82:	5d                   	pop    %ebp
80106e83:	c3                   	ret    
80106e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e88:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80106e8b:	83 ec 08             	sub    $0x8,%esp
80106e8e:	53                   	push   %ebx
80106e8f:	ff 75 c0             	pushl  -0x40(%ebp)
80106e92:	e8 09 ba ff ff       	call   801028a0 <nameiparent>
80106e97:	83 c4 10             	add    $0x10,%esp
80106e9a:	85 c0                	test   %eax,%eax
80106e9c:	89 c6                	mov    %eax,%esi
80106e9e:	0f 84 6c 01 00 00    	je     80107010 <sys_unlink+0x1e0>
80106ea4:	83 ec 0c             	sub    $0xc,%esp
80106ea7:	50                   	push   %eax
80106ea8:	e8 23 b0 ff ff       	call   80101ed0 <ilock>
80106ead:	58                   	pop    %eax
80106eae:	5a                   	pop    %edx
80106eaf:	68 d1 e8 10 80       	push   $0x8010e8d1
80106eb4:	53                   	push   %ebx
80106eb5:	e8 46 b5 ff ff       	call   80102400 <namecmp>
80106eba:	83 c4 10             	add    $0x10,%esp
80106ebd:	85 c0                	test   %eax,%eax
80106ebf:	0f 84 27 01 00 00    	je     80106fec <sys_unlink+0x1bc>
80106ec5:	83 ec 08             	sub    $0x8,%esp
80106ec8:	68 d0 e8 10 80       	push   $0x8010e8d0
80106ecd:	53                   	push   %ebx
80106ece:	e8 2d b5 ff ff       	call   80102400 <namecmp>
80106ed3:	83 c4 10             	add    $0x10,%esp
80106ed6:	85 c0                	test   %eax,%eax
80106ed8:	0f 84 0e 01 00 00    	je     80106fec <sys_unlink+0x1bc>
80106ede:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80106ee1:	83 ec 04             	sub    $0x4,%esp
80106ee4:	50                   	push   %eax
80106ee5:	53                   	push   %ebx
80106ee6:	56                   	push   %esi
80106ee7:	e8 34 b5 ff ff       	call   80102420 <dirlookup>
80106eec:	83 c4 10             	add    $0x10,%esp
80106eef:	85 c0                	test   %eax,%eax
80106ef1:	89 c3                	mov    %eax,%ebx
80106ef3:	0f 84 f3 00 00 00    	je     80106fec <sys_unlink+0x1bc>
80106ef9:	83 ec 0c             	sub    $0xc,%esp
80106efc:	50                   	push   %eax
80106efd:	e8 ce af ff ff       	call   80101ed0 <ilock>
80106f02:	83 c4 10             	add    $0x10,%esp
80106f05:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80106f0a:	0f 8e 33 01 00 00    	jle    80107043 <sys_unlink+0x213>
80106f10:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80106f15:	0f 84 85 00 00 00    	je     80106fa0 <sys_unlink+0x170>
80106f1b:	83 ec 0c             	sub    $0xc,%esp
80106f1e:	53                   	push   %ebx
80106f1f:	e8 0c a2 ff ff       	call   80101130 <doesbackdevice>
80106f24:	83 c4 10             	add    $0x10,%esp
80106f27:	83 f8 01             	cmp    $0x1,%eax
80106f2a:	0f 84 b0 00 00 00    	je     80106fe0 <sys_unlink+0x1b0>
80106f30:	8d 7d d8             	lea    -0x28(%ebp),%edi
80106f33:	83 ec 04             	sub    $0x4,%esp
80106f36:	6a 10                	push   $0x10
80106f38:	6a 00                	push   $0x0
80106f3a:	57                   	push   %edi
80106f3b:	e8 60 f4 ff ff       	call   801063a0 <memset>
80106f40:	6a 10                	push   $0x10
80106f42:	ff 75 c4             	pushl  -0x3c(%ebp)
80106f45:	57                   	push   %edi
80106f46:	56                   	push   %esi
80106f47:	e8 84 b3 ff ff       	call   801022d0 <writei>
80106f4c:	83 c4 20             	add    $0x20,%esp
80106f4f:	83 f8 10             	cmp    $0x10,%eax
80106f52:	0f 85 f8 00 00 00    	jne    80107050 <sys_unlink+0x220>
80106f58:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80106f5d:	0f 84 bd 00 00 00    	je     80107020 <sys_unlink+0x1f0>
80106f63:	83 ec 0c             	sub    $0xc,%esp
80106f66:	56                   	push   %esi
80106f67:	e8 04 b2 ff ff       	call   80102170 <iunlockput>
80106f6c:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80106f71:	89 1c 24             	mov    %ebx,(%esp)
80106f74:	e8 97 ae ff ff       	call   80101e10 <iupdate>
80106f79:	89 1c 24             	mov    %ebx,(%esp)
80106f7c:	e8 ef b1 ff ff       	call   80102170 <iunlockput>
80106f81:	83 c4 10             	add    $0x10,%esp
80106f84:	e9 ec fe ff ff       	jmp    80106e75 <sys_unlink+0x45>
80106f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f95:	e9 e2 fe ff ff       	jmp    80106e7c <sys_unlink+0x4c>
80106f9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106fa0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80106fa4:	0f 86 71 ff ff ff    	jbe    80106f1b <sys_unlink+0xeb>
80106faa:	bf 20 00 00 00       	mov    $0x20,%edi
80106faf:	eb 13                	jmp    80106fc4 <sys_unlink+0x194>
80106fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fb8:	83 c7 10             	add    $0x10,%edi
80106fbb:	3b 7b 58             	cmp    0x58(%ebx),%edi
80106fbe:	0f 83 57 ff ff ff    	jae    80106f1b <sys_unlink+0xeb>
80106fc4:	8d 45 d8             	lea    -0x28(%ebp),%eax
80106fc7:	6a 10                	push   $0x10
80106fc9:	57                   	push   %edi
80106fca:	50                   	push   %eax
80106fcb:	53                   	push   %ebx
80106fcc:	e8 ef b1 ff ff       	call   801021c0 <readi>
80106fd1:	83 c4 10             	add    $0x10,%esp
80106fd4:	83 f8 10             	cmp    $0x10,%eax
80106fd7:	75 5d                	jne    80107036 <sys_unlink+0x206>
80106fd9:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80106fde:	74 d8                	je     80106fb8 <sys_unlink+0x188>
80106fe0:	83 ec 0c             	sub    $0xc,%esp
80106fe3:	53                   	push   %ebx
80106fe4:	e8 87 b1 ff ff       	call   80102170 <iunlockput>
80106fe9:	83 c4 10             	add    $0x10,%esp
80106fec:	83 ec 0c             	sub    $0xc,%esp
80106fef:	56                   	push   %esi
80106ff0:	e8 7b b1 ff ff       	call   80102170 <iunlockput>
80106ff5:	e8 56 c8 ff ff       	call   80103850 <end_op>
80106ffa:	83 c4 10             	add    $0x10,%esp
80106ffd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107002:	e9 75 fe ff ff       	jmp    80106e7c <sys_unlink+0x4c>
80107007:	89 f6                	mov    %esi,%esi
80107009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107010:	e8 3b c8 ff ff       	call   80103850 <end_op>
80107015:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010701a:	e9 5d fe ff ff       	jmp    80106e7c <sys_unlink+0x4c>
8010701f:	90                   	nop
80107020:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
80107025:	83 ec 0c             	sub    $0xc,%esp
80107028:	56                   	push   %esi
80107029:	e8 e2 ad ff ff       	call   80101e10 <iupdate>
8010702e:	83 c4 10             	add    $0x10,%esp
80107031:	e9 2d ff ff ff       	jmp    80106f63 <sys_unlink+0x133>
80107036:	83 ec 0c             	sub    $0xc,%esp
80107039:	68 28 f1 10 80       	push   $0x8010f128
8010703e:	e8 8d 93 ff ff       	call   801003d0 <panic>
80107043:	83 ec 0c             	sub    $0xc,%esp
80107046:	68 16 f1 10 80       	push   $0x8010f116
8010704b:	e8 80 93 ff ff       	call   801003d0 <panic>
80107050:	83 ec 0c             	sub    $0xc,%esp
80107053:	68 3a f1 10 80       	push   $0x8010f13a
80107058:	e8 73 93 ff ff       	call   801003d0 <panic>
8010705d:	8d 76 00             	lea    0x0(%esi),%esi

80107060 <sys_open>:
80107060:	55                   	push   %ebp
80107061:	89 e5                	mov    %esp,%ebp
80107063:	57                   	push   %edi
80107064:	56                   	push   %esi
80107065:	53                   	push   %ebx
80107066:	8d 45 dc             	lea    -0x24(%ebp),%eax
80107069:	83 ec 24             	sub    $0x24,%esp
8010706c:	50                   	push   %eax
8010706d:	6a 00                	push   $0x0
8010706f:	e8 3c f7 ff ff       	call   801067b0 <argstr>
80107074:	83 c4 10             	add    $0x10,%esp
80107077:	85 c0                	test   %eax,%eax
80107079:	0f 88 bb 00 00 00    	js     8010713a <sys_open+0xda>
8010707f:	8d 45 e0             	lea    -0x20(%ebp),%eax
80107082:	83 ec 08             	sub    $0x8,%esp
80107085:	50                   	push   %eax
80107086:	6a 01                	push   $0x1
80107088:	e8 73 f6 ff ff       	call   80106700 <argint>
8010708d:	83 c4 10             	add    $0x10,%esp
80107090:	85 c0                	test   %eax,%eax
80107092:	0f 88 a2 00 00 00    	js     8010713a <sys_open+0xda>
80107098:	e8 43 c7 ff ff       	call   801037e0 <begin_op>
8010709d:	83 ec 08             	sub    $0x8,%esp
801070a0:	ff 75 e0             	pushl  -0x20(%ebp)
801070a3:	ff 75 dc             	pushl  -0x24(%ebp)
801070a6:	e8 95 65 00 00       	call   8010d640 <cg_sys_open>
801070ab:	83 c4 10             	add    $0x10,%esp
801070ae:	85 c0                	test   %eax,%eax
801070b0:	89 c3                	mov    %eax,%ebx
801070b2:	0f 89 28 01 00 00    	jns    801071e0 <sys_open+0x180>
801070b8:	f6 45 e1 02          	testb  $0x2,-0x1f(%ebp)
801070bc:	0f 84 8e 00 00 00    	je     80107150 <sys_open+0xf0>
801070c2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801070c5:	83 ec 08             	sub    $0x8,%esp
801070c8:	31 c9                	xor    %ecx,%ecx
801070ca:	ba 02 00 00 00       	mov    $0x2,%edx
801070cf:	50                   	push   %eax
801070d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
801070d3:	6a 00                	push   $0x0
801070d5:	e8 86 f7 ff ff       	call   80106860 <createmount>
801070da:	83 c4 10             	add    $0x10,%esp
801070dd:	85 c0                	test   %eax,%eax
801070df:	89 c6                	mov    %eax,%esi
801070e1:	0f 84 08 01 00 00    	je     801071ef <sys_open+0x18f>
801070e7:	e8 74 a4 ff ff       	call   80101560 <filealloc>
801070ec:	85 c0                	test   %eax,%eax
801070ee:	89 c7                	mov    %eax,%edi
801070f0:	74 2e                	je     80107120 <sys_open+0xc0>
801070f2:	31 db                	xor    %ebx,%ebx
801070f4:	e8 2a e1 ff ff       	call   80105223 <myproc>
801070f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107100:	8b 54 98 48          	mov    0x48(%eax,%ebx,4),%edx
80107104:	85 d2                	test   %edx,%edx
80107106:	0f 84 84 00 00 00    	je     80107190 <sys_open+0x130>
8010710c:	83 c3 01             	add    $0x1,%ebx
8010710f:	83 fb 10             	cmp    $0x10,%ebx
80107112:	75 ec                	jne    80107100 <sys_open+0xa0>
80107114:	83 ec 0c             	sub    $0xc,%esp
80107117:	57                   	push   %edi
80107118:	e8 03 a5 ff ff       	call   80101620 <fileclose>
8010711d:	83 c4 10             	add    $0x10,%esp
80107120:	83 ec 0c             	sub    $0xc,%esp
80107123:	56                   	push   %esi
80107124:	e8 47 b0 ff ff       	call   80102170 <iunlockput>
80107129:	58                   	pop    %eax
8010712a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010712d:	e8 a9 cd ff ff       	call   80103edb <mntput>
80107132:	e8 19 c7 ff ff       	call   80103850 <end_op>
80107137:	83 c4 10             	add    $0x10,%esp
8010713a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010713d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107142:	5b                   	pop    %ebx
80107143:	5e                   	pop    %esi
80107144:	5f                   	pop    %edi
80107145:	5d                   	pop    %ebp
80107146:	c3                   	ret    
80107147:	89 f6                	mov    %esi,%esi
80107149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107150:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80107153:	83 ec 08             	sub    $0x8,%esp
80107156:	50                   	push   %eax
80107157:	ff 75 dc             	pushl  -0x24(%ebp)
8010715a:	e8 a1 b7 ff ff       	call   80102900 <nameimount>
8010715f:	83 c4 10             	add    $0x10,%esp
80107162:	85 c0                	test   %eax,%eax
80107164:	89 c6                	mov    %eax,%esi
80107166:	0f 84 83 00 00 00    	je     801071ef <sys_open+0x18f>
8010716c:	83 ec 0c             	sub    $0xc,%esp
8010716f:	50                   	push   %eax
80107170:	e8 5b ad ff ff       	call   80101ed0 <ilock>
80107175:	83 c4 10             	add    $0x10,%esp
80107178:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
8010717d:	0f 85 64 ff ff ff    	jne    801070e7 <sys_open+0x87>
80107183:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80107186:	85 c9                	test   %ecx,%ecx
80107188:	0f 84 59 ff ff ff    	je     801070e7 <sys_open+0x87>
8010718e:	eb 90                	jmp    80107120 <sys_open+0xc0>
80107190:	83 ec 0c             	sub    $0xc,%esp
80107193:	89 7c 98 48          	mov    %edi,0x48(%eax,%ebx,4)
80107197:	56                   	push   %esi
80107198:	e8 13 ae ff ff       	call   80101fb0 <iunlock>
8010719d:	e8 ae c6 ff ff       	call   80103850 <end_op>
801071a2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801071a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801071ab:	83 c4 10             	add    $0x10,%esp
801071ae:	8b 55 e0             	mov    -0x20(%ebp),%edx
801071b1:	89 77 10             	mov    %esi,0x10(%edi)
801071b4:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
801071bb:	89 47 14             	mov    %eax,0x14(%edi)
801071be:	89 d0                	mov    %edx,%eax
801071c0:	83 e0 01             	and    $0x1,%eax
801071c3:	83 f0 01             	xor    $0x1,%eax
801071c6:	83 e2 03             	and    $0x3,%edx
801071c9:	88 47 08             	mov    %al,0x8(%edi)
801071cc:	0f 95 47 09          	setne  0x9(%edi)
801071d0:	89 d8                	mov    %ebx,%eax
801071d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071d5:	5b                   	pop    %ebx
801071d6:	5e                   	pop    %esi
801071d7:	5f                   	pop    %edi
801071d8:	5d                   	pop    %ebp
801071d9:	c3                   	ret    
801071da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801071e0:	e8 6b c6 ff ff       	call   80103850 <end_op>
801071e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071e8:	89 d8                	mov    %ebx,%eax
801071ea:	5b                   	pop    %ebx
801071eb:	5e                   	pop    %esi
801071ec:	5f                   	pop    %edi
801071ed:	5d                   	pop    %ebp
801071ee:	c3                   	ret    
801071ef:	e8 5c c6 ff ff       	call   80103850 <end_op>
801071f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801071f9:	eb d7                	jmp    801071d2 <sys_open+0x172>
801071fb:	90                   	nop
801071fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107200 <sys_mkdir>:
80107200:	55                   	push   %ebp
80107201:	89 e5                	mov    %esp,%ebp
80107203:	53                   	push   %ebx
80107204:	83 ec 14             	sub    $0x14,%esp
80107207:	e8 d4 c5 ff ff       	call   801037e0 <begin_op>
8010720c:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010720f:	83 ec 08             	sub    $0x8,%esp
80107212:	50                   	push   %eax
80107213:	6a 00                	push   $0x0
80107215:	e8 96 f5 ff ff       	call   801067b0 <argstr>
8010721a:	83 c4 10             	add    $0x10,%esp
8010721d:	85 c0                	test   %eax,%eax
8010721f:	0f 88 9b 00 00 00    	js     801072c0 <sys_mkdir+0xc0>
80107225:	83 ec 0c             	sub    $0xc,%esp
80107228:	ff 75 f0             	pushl  -0x10(%ebp)
8010722b:	e8 a0 61 00 00       	call   8010d3d0 <get_cgroup_by_path>
80107230:	83 c4 10             	add    $0x10,%esp
80107233:	85 c0                	test   %eax,%eax
80107235:	75 21                	jne    80107258 <sys_mkdir+0x58>
80107237:	83 ec 0c             	sub    $0xc,%esp
8010723a:	ff 75 f0             	pushl  -0x10(%ebp)
8010723d:	e8 6e 6d 00 00       	call   8010dfb0 <cgroup_create>
80107242:	83 c4 10             	add    $0x10,%esp
80107245:	85 c0                	test   %eax,%eax
80107247:	74 37                	je     80107280 <sys_mkdir+0x80>
80107249:	e8 02 c6 ff ff       	call   80103850 <end_op>
8010724e:	31 c0                	xor    %eax,%eax
80107250:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107253:	c9                   	leave  
80107254:	c3                   	ret    
80107255:	8d 76 00             	lea    0x0(%esi),%esi
80107258:	83 ec 0c             	sub    $0xc,%esp
8010725b:	68 49 f1 10 80       	push   $0x8010f149
80107260:	e8 fb 93 ff ff       	call   80100660 <cprintf>
80107265:	e8 e6 c5 ff ff       	call   80103850 <end_op>
8010726a:	83 c4 10             	add    $0x10,%esp
8010726d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107272:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107275:	c9                   	leave  
80107276:	c3                   	ret    
80107277:	89 f6                	mov    %esi,%esi
80107279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107280:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107283:	83 ec 08             	sub    $0x8,%esp
80107286:	31 c9                	xor    %ecx,%ecx
80107288:	ba 01 00 00 00       	mov    $0x1,%edx
8010728d:	50                   	push   %eax
8010728e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107291:	6a 00                	push   $0x0
80107293:	e8 c8 f5 ff ff       	call   80106860 <createmount>
80107298:	83 c4 10             	add    $0x10,%esp
8010729b:	85 c0                	test   %eax,%eax
8010729d:	89 c3                	mov    %eax,%ebx
8010729f:	74 1f                	je     801072c0 <sys_mkdir+0xc0>
801072a1:	83 ec 0c             	sub    $0xc,%esp
801072a4:	ff 75 f4             	pushl  -0xc(%ebp)
801072a7:	e8 2f cc ff ff       	call   80103edb <mntput>
801072ac:	89 1c 24             	mov    %ebx,(%esp)
801072af:	e8 bc ae ff ff       	call   80102170 <iunlockput>
801072b4:	83 c4 10             	add    $0x10,%esp
801072b7:	eb 90                	jmp    80107249 <sys_mkdir+0x49>
801072b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801072c0:	e8 8b c5 ff ff       	call   80103850 <end_op>
801072c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801072ca:	eb 84                	jmp    80107250 <sys_mkdir+0x50>
801072cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801072d0 <sys_mknod>:
801072d0:	55                   	push   %ebp
801072d1:	89 e5                	mov    %esp,%ebp
801072d3:	53                   	push   %ebx
801072d4:	83 ec 14             	sub    $0x14,%esp
801072d7:	e8 04 c5 ff ff       	call   801037e0 <begin_op>
801072dc:	8d 45 e8             	lea    -0x18(%ebp),%eax
801072df:	83 ec 08             	sub    $0x8,%esp
801072e2:	50                   	push   %eax
801072e3:	6a 00                	push   $0x0
801072e5:	e8 c6 f4 ff ff       	call   801067b0 <argstr>
801072ea:	83 c4 10             	add    $0x10,%esp
801072ed:	85 c0                	test   %eax,%eax
801072ef:	78 77                	js     80107368 <sys_mknod+0x98>
801072f1:	8d 45 ec             	lea    -0x14(%ebp),%eax
801072f4:	83 ec 08             	sub    $0x8,%esp
801072f7:	50                   	push   %eax
801072f8:	6a 01                	push   $0x1
801072fa:	e8 01 f4 ff ff       	call   80106700 <argint>
801072ff:	83 c4 10             	add    $0x10,%esp
80107302:	85 c0                	test   %eax,%eax
80107304:	78 62                	js     80107368 <sys_mknod+0x98>
80107306:	8d 45 f0             	lea    -0x10(%ebp),%eax
80107309:	83 ec 08             	sub    $0x8,%esp
8010730c:	50                   	push   %eax
8010730d:	6a 02                	push   $0x2
8010730f:	e8 ec f3 ff ff       	call   80106700 <argint>
80107314:	83 c4 10             	add    $0x10,%esp
80107317:	85 c0                	test   %eax,%eax
80107319:	78 4d                	js     80107368 <sys_mknod+0x98>
8010731b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010731e:	83 ec 08             	sub    $0x8,%esp
80107321:	0f bf 4d ec          	movswl -0x14(%ebp),%ecx
80107325:	ba 03 00 00 00       	mov    $0x3,%edx
8010732a:	50                   	push   %eax
8010732b:	0f bf 45 f0          	movswl -0x10(%ebp),%eax
8010732f:	50                   	push   %eax
80107330:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107333:	e8 28 f5 ff ff       	call   80106860 <createmount>
80107338:	83 c4 10             	add    $0x10,%esp
8010733b:	85 c0                	test   %eax,%eax
8010733d:	89 c3                	mov    %eax,%ebx
8010733f:	74 27                	je     80107368 <sys_mknod+0x98>
80107341:	83 ec 0c             	sub    $0xc,%esp
80107344:	ff 75 f4             	pushl  -0xc(%ebp)
80107347:	e8 8f cb ff ff       	call   80103edb <mntput>
8010734c:	89 1c 24             	mov    %ebx,(%esp)
8010734f:	e8 1c ae ff ff       	call   80102170 <iunlockput>
80107354:	e8 f7 c4 ff ff       	call   80103850 <end_op>
80107359:	83 c4 10             	add    $0x10,%esp
8010735c:	31 c0                	xor    %eax,%eax
8010735e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107361:	c9                   	leave  
80107362:	c3                   	ret    
80107363:	90                   	nop
80107364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107368:	e8 e3 c4 ff ff       	call   80103850 <end_op>
8010736d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107372:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107375:	c9                   	leave  
80107376:	c3                   	ret    
80107377:	89 f6                	mov    %esi,%esi
80107379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107380 <sys_chdir>:
80107380:	55                   	push   %ebp
80107381:	89 e5                	mov    %esp,%ebp
80107383:	56                   	push   %esi
80107384:	53                   	push   %ebx
80107385:	83 ec 10             	sub    $0x10,%esp
80107388:	e8 96 de ff ff       	call   80105223 <myproc>
8010738d:	89 c3                	mov    %eax,%ebx
8010738f:	e8 4c c4 ff ff       	call   801037e0 <begin_op>
80107394:	8d 45 f0             	lea    -0x10(%ebp),%eax
80107397:	83 ec 08             	sub    $0x8,%esp
8010739a:	50                   	push   %eax
8010739b:	6a 00                	push   $0x0
8010739d:	e8 0e f4 ff ff       	call   801067b0 <argstr>
801073a2:	83 c4 10             	add    $0x10,%esp
801073a5:	85 c0                	test   %eax,%eax
801073a7:	0f 88 03 01 00 00    	js     801074b0 <sys_chdir+0x130>
801073ad:	83 ec 0c             	sub    $0xc,%esp
801073b0:	ff 75 f0             	pushl  -0x10(%ebp)
801073b3:	e8 18 60 00 00       	call   8010d3d0 <get_cgroup_by_path>
801073b8:	83 c4 10             	add    $0x10,%esp
801073bb:	85 c0                	test   %eax,%eax
801073bd:	89 c6                	mov    %eax,%esi
801073bf:	74 2f                	je     801073f0 <sys_chdir+0x70>
801073c1:	e8 8a c4 ff ff       	call   80103850 <end_op>
801073c6:	81 c3 ac 00 00 00    	add    $0xac,%ebx
801073cc:	83 ec 04             	sub    $0x4,%esp
801073cf:	68 00 02 00 00       	push   $0x200
801073d4:	56                   	push   %esi
801073d5:	53                   	push   %ebx
801073d6:	e8 15 f2 ff ff       	call   801065f0 <safestrcpy>
801073db:	83 c4 10             	add    $0x10,%esp
801073de:	31 c0                	xor    %eax,%eax
801073e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801073e3:	5b                   	pop    %ebx
801073e4:	5e                   	pop    %esi
801073e5:	5d                   	pop    %ebp
801073e6:	c3                   	ret    
801073e7:	89 f6                	mov    %esi,%esi
801073e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801073f0:	8d 45 f4             	lea    -0xc(%ebp),%eax
801073f3:	83 ec 08             	sub    $0x8,%esp
801073f6:	50                   	push   %eax
801073f7:	ff 75 f0             	pushl  -0x10(%ebp)
801073fa:	e8 01 b5 ff ff       	call   80102900 <nameimount>
801073ff:	83 c4 10             	add    $0x10,%esp
80107402:	85 c0                	test   %eax,%eax
80107404:	89 c6                	mov    %eax,%esi
80107406:	0f 84 a4 00 00 00    	je     801074b0 <sys_chdir+0x130>
8010740c:	83 ec 0c             	sub    $0xc,%esp
8010740f:	50                   	push   %eax
80107410:	e8 bb aa ff ff       	call   80101ed0 <ilock>
80107415:	83 c4 10             	add    $0x10,%esp
80107418:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
8010741d:	75 71                	jne    80107490 <sys_chdir+0x110>
8010741f:	83 ec 0c             	sub    $0xc,%esp
80107422:	56                   	push   %esi
80107423:	e8 88 ab ff ff       	call   80101fb0 <iunlock>
80107428:	8b 83 88 00 00 00    	mov    0x88(%ebx),%eax
8010742e:	83 c4 10             	add    $0x10,%esp
80107431:	85 c0                	test   %eax,%eax
80107433:	74 0c                	je     80107441 <sys_chdir+0xc1>
80107435:	83 ec 0c             	sub    $0xc,%esp
80107438:	50                   	push   %eax
80107439:	e8 c2 ab ff ff       	call   80102000 <iput>
8010743e:	83 c4 10             	add    $0x10,%esp
80107441:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80107447:	85 c0                	test   %eax,%eax
80107449:	74 0c                	je     80107457 <sys_chdir+0xd7>
8010744b:	83 ec 0c             	sub    $0xc,%esp
8010744e:	50                   	push   %eax
8010744f:	e8 87 ca ff ff       	call   80103edb <mntput>
80107454:	83 c4 10             	add    $0x10,%esp
80107457:	e8 f4 c3 ff ff       	call   80103850 <end_op>
8010745c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010745f:	89 b3 88 00 00 00    	mov    %esi,0x88(%ebx)
80107465:	83 ec 08             	sub    $0x8,%esp
80107468:	81 c3 ac 00 00 00    	add    $0xac,%ebx
8010746e:	89 43 e0             	mov    %eax,-0x20(%ebx)
80107471:	ff 75 f0             	pushl  -0x10(%ebp)
80107474:	53                   	push   %ebx
80107475:	e8 06 58 00 00       	call   8010cc80 <format_path>
8010747a:	83 c4 10             	add    $0x10,%esp
8010747d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107480:	31 c0                	xor    %eax,%eax
80107482:	5b                   	pop    %ebx
80107483:	5e                   	pop    %esi
80107484:	5d                   	pop    %ebp
80107485:	c3                   	ret    
80107486:	8d 76 00             	lea    0x0(%esi),%esi
80107489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107490:	83 ec 0c             	sub    $0xc,%esp
80107493:	56                   	push   %esi
80107494:	e8 d7 ac ff ff       	call   80102170 <iunlockput>
80107499:	e8 b2 c3 ff ff       	call   80103850 <end_op>
8010749e:	83 c4 10             	add    $0x10,%esp
801074a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801074a6:	e9 35 ff ff ff       	jmp    801073e0 <sys_chdir+0x60>
801074ab:	90                   	nop
801074ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801074b0:	e8 9b c3 ff ff       	call   80103850 <end_op>
801074b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801074ba:	e9 21 ff ff ff       	jmp    801073e0 <sys_chdir+0x60>
801074bf:	90                   	nop

801074c0 <sys_exec>:
801074c0:	55                   	push   %ebp
801074c1:	89 e5                	mov    %esp,%ebp
801074c3:	57                   	push   %edi
801074c4:	56                   	push   %esi
801074c5:	53                   	push   %ebx
801074c6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801074cc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
801074d2:	50                   	push   %eax
801074d3:	6a 00                	push   $0x0
801074d5:	e8 d6 f2 ff ff       	call   801067b0 <argstr>
801074da:	83 c4 10             	add    $0x10,%esp
801074dd:	85 c0                	test   %eax,%eax
801074df:	78 7f                	js     80107560 <sys_exec+0xa0>
801074e1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801074e7:	83 ec 08             	sub    $0x8,%esp
801074ea:	50                   	push   %eax
801074eb:	6a 01                	push   $0x1
801074ed:	e8 0e f2 ff ff       	call   80106700 <argint>
801074f2:	83 c4 10             	add    $0x10,%esp
801074f5:	85 c0                	test   %eax,%eax
801074f7:	78 67                	js     80107560 <sys_exec+0xa0>
801074f9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801074ff:	83 ec 04             	sub    $0x4,%esp
80107502:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80107508:	68 80 00 00 00       	push   $0x80
8010750d:	6a 00                	push   $0x0
8010750f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80107515:	50                   	push   %eax
80107516:	31 db                	xor    %ebx,%ebx
80107518:	e8 83 ee ff ff       	call   801063a0 <memset>
8010751d:	83 c4 10             	add    $0x10,%esp
80107520:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80107526:	83 ec 08             	sub    $0x8,%esp
80107529:	57                   	push   %edi
8010752a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010752d:	50                   	push   %eax
8010752e:	e8 2d f1 ff ff       	call   80106660 <fetchint>
80107533:	83 c4 10             	add    $0x10,%esp
80107536:	85 c0                	test   %eax,%eax
80107538:	78 26                	js     80107560 <sys_exec+0xa0>
8010753a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80107540:	85 c0                	test   %eax,%eax
80107542:	74 2c                	je     80107570 <sys_exec+0xb0>
80107544:	83 ec 08             	sub    $0x8,%esp
80107547:	56                   	push   %esi
80107548:	50                   	push   %eax
80107549:	e8 52 f1 ff ff       	call   801066a0 <fetchstr>
8010754e:	83 c4 10             	add    $0x10,%esp
80107551:	85 c0                	test   %eax,%eax
80107553:	78 0b                	js     80107560 <sys_exec+0xa0>
80107555:	83 c3 01             	add    $0x1,%ebx
80107558:	83 c6 04             	add    $0x4,%esi
8010755b:	83 fb 20             	cmp    $0x20,%ebx
8010755e:	75 c0                	jne    80107520 <sys_exec+0x60>
80107560:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107563:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107568:	5b                   	pop    %ebx
80107569:	5e                   	pop    %esi
8010756a:	5f                   	pop    %edi
8010756b:	5d                   	pop    %ebp
8010756c:	c3                   	ret    
8010756d:	8d 76 00             	lea    0x0(%esi),%esi
80107570:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80107576:	83 ec 08             	sub    $0x8,%esp
80107579:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80107580:	00 00 00 00 
80107584:	50                   	push   %eax
80107585:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010758b:	e8 10 9c ff ff       	call   801011a0 <exec>
80107590:	83 c4 10             	add    $0x10,%esp
80107593:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107596:	5b                   	pop    %ebx
80107597:	5e                   	pop    %esi
80107598:	5f                   	pop    %edi
80107599:	5d                   	pop    %ebp
8010759a:	c3                   	ret    
8010759b:	90                   	nop
8010759c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801075a0 <sys_pipe>:
801075a0:	55                   	push   %ebp
801075a1:	89 e5                	mov    %esp,%ebp
801075a3:	57                   	push   %edi
801075a4:	56                   	push   %esi
801075a5:	53                   	push   %ebx
801075a6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801075a9:	83 ec 20             	sub    $0x20,%esp
801075ac:	6a 08                	push   $0x8
801075ae:	50                   	push   %eax
801075af:	6a 00                	push   $0x0
801075b1:	e8 9a f1 ff ff       	call   80106750 <argptr>
801075b6:	83 c4 10             	add    $0x10,%esp
801075b9:	85 c0                	test   %eax,%eax
801075bb:	78 4a                	js     80107607 <sys_pipe+0x67>
801075bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801075c0:	83 ec 08             	sub    $0x8,%esp
801075c3:	50                   	push   %eax
801075c4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801075c7:	50                   	push   %eax
801075c8:	e8 83 d6 ff ff       	call   80104c50 <pipealloc>
801075cd:	83 c4 10             	add    $0x10,%esp
801075d0:	85 c0                	test   %eax,%eax
801075d2:	78 33                	js     80107607 <sys_pipe+0x67>
801075d4:	31 db                	xor    %ebx,%ebx
801075d6:	8b 7d e0             	mov    -0x20(%ebp),%edi
801075d9:	e8 45 dc ff ff       	call   80105223 <myproc>
801075de:	66 90                	xchg   %ax,%ax
801075e0:	8b 74 98 48          	mov    0x48(%eax,%ebx,4),%esi
801075e4:	85 f6                	test   %esi,%esi
801075e6:	74 30                	je     80107618 <sys_pipe+0x78>
801075e8:	83 c3 01             	add    $0x1,%ebx
801075eb:	83 fb 10             	cmp    $0x10,%ebx
801075ee:	75 f0                	jne    801075e0 <sys_pipe+0x40>
801075f0:	83 ec 0c             	sub    $0xc,%esp
801075f3:	ff 75 e0             	pushl  -0x20(%ebp)
801075f6:	e8 25 a0 ff ff       	call   80101620 <fileclose>
801075fb:	58                   	pop    %eax
801075fc:	ff 75 e4             	pushl  -0x1c(%ebp)
801075ff:	e8 1c a0 ff ff       	call   80101620 <fileclose>
80107604:	83 c4 10             	add    $0x10,%esp
80107607:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010760a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010760f:	5b                   	pop    %ebx
80107610:	5e                   	pop    %esi
80107611:	5f                   	pop    %edi
80107612:	5d                   	pop    %ebp
80107613:	c3                   	ret    
80107614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107618:	8d 73 10             	lea    0x10(%ebx),%esi
8010761b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
8010761f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80107622:	e8 fc db ff ff       	call   80105223 <myproc>
80107627:	31 d2                	xor    %edx,%edx
80107629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107630:	8b 4c 90 48          	mov    0x48(%eax,%edx,4),%ecx
80107634:	85 c9                	test   %ecx,%ecx
80107636:	74 18                	je     80107650 <sys_pipe+0xb0>
80107638:	83 c2 01             	add    $0x1,%edx
8010763b:	83 fa 10             	cmp    $0x10,%edx
8010763e:	75 f0                	jne    80107630 <sys_pipe+0x90>
80107640:	e8 de db ff ff       	call   80105223 <myproc>
80107645:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010764c:	00 
8010764d:	eb a1                	jmp    801075f0 <sys_pipe+0x50>
8010764f:	90                   	nop
80107650:	89 7c 90 48          	mov    %edi,0x48(%eax,%edx,4)
80107654:	8b 45 dc             	mov    -0x24(%ebp),%eax
80107657:	89 18                	mov    %ebx,(%eax)
80107659:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010765c:	89 50 04             	mov    %edx,0x4(%eax)
8010765f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107662:	31 c0                	xor    %eax,%eax
80107664:	5b                   	pop    %ebx
80107665:	5e                   	pop    %esi
80107666:	5f                   	pop    %edi
80107667:	5d                   	pop    %ebp
80107668:	c3                   	ret    
80107669:	66 90                	xchg   %ax,%ax
8010766b:	66 90                	xchg   %ax,%ax
8010766d:	66 90                	xchg   %ax,%ax
8010766f:	90                   	nop

80107670 <sys_mount>:
80107670:	55                   	push   %ebp
80107671:	89 e5                	mov    %esp,%ebp
80107673:	57                   	push   %edi
80107674:	56                   	push   %esi
80107675:	53                   	push   %ebx
80107676:	8d 45 d8             	lea    -0x28(%ebp),%eax
80107679:	83 ec 24             	sub    $0x24,%esp
8010767c:	50                   	push   %eax
8010767d:	6a 02                	push   $0x2
8010767f:	e8 2c f1 ff ff       	call   801067b0 <argstr>
80107684:	83 c4 10             	add    $0x10,%esp
80107687:	85 c0                	test   %eax,%eax
80107689:	0f 88 89 01 00 00    	js     80107818 <sys_mount+0x1a8>
8010768f:	83 ec 08             	sub    $0x8,%esp
80107692:	68 69 f1 10 80       	push   $0x8010f169
80107697:	ff 75 d8             	pushl  -0x28(%ebp)
8010769a:	e8 a1 ee ff ff       	call   80106540 <strcmp>
8010769f:	83 c4 10             	add    $0x10,%esp
801076a2:	85 c0                	test   %eax,%eax
801076a4:	89 c3                	mov    %eax,%ebx
801076a6:	0f 84 e4 00 00 00    	je     80107790 <sys_mount+0x120>
801076ac:	8d 45 dc             	lea    -0x24(%ebp),%eax
801076af:	83 ec 08             	sub    $0x8,%esp
801076b2:	50                   	push   %eax
801076b3:	6a 00                	push   $0x0
801076b5:	e8 f6 f0 ff ff       	call   801067b0 <argstr>
801076ba:	83 c4 10             	add    $0x10,%esp
801076bd:	85 c0                	test   %eax,%eax
801076bf:	0f 88 53 01 00 00    	js     80107818 <sys_mount+0x1a8>
801076c5:	8d 45 e0             	lea    -0x20(%ebp),%eax
801076c8:	83 ec 08             	sub    $0x8,%esp
801076cb:	50                   	push   %eax
801076cc:	6a 01                	push   $0x1
801076ce:	e8 dd f0 ff ff       	call   801067b0 <argstr>
801076d3:	83 c4 10             	add    $0x10,%esp
801076d6:	85 c0                	test   %eax,%eax
801076d8:	0f 88 3a 01 00 00    	js     80107818 <sys_mount+0x1a8>
801076de:	e8 fd c0 ff ff       	call   801037e0 <begin_op>
801076e3:	83 ec 0c             	sub    $0xc,%esp
801076e6:	ff 75 dc             	pushl  -0x24(%ebp)
801076e9:	e8 72 b1 ff ff       	call   80102860 <namei>
801076ee:	83 c4 10             	add    $0x10,%esp
801076f1:	85 c0                	test   %eax,%eax
801076f3:	89 c7                	mov    %eax,%edi
801076f5:	0f 84 bf 01 00 00    	je     801078ba <sys_mount+0x24a>
801076fb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801076fe:	83 ec 08             	sub    $0x8,%esp
80107701:	50                   	push   %eax
80107702:	ff 75 e0             	pushl  -0x20(%ebp)
80107705:	e8 f6 b1 ff ff       	call   80102900 <nameimount>
8010770a:	83 c4 10             	add    $0x10,%esp
8010770d:	85 c0                	test   %eax,%eax
8010770f:	89 c6                	mov    %eax,%esi
80107711:	0f 84 e1 01 00 00    	je     801078f8 <sys_mount+0x288>
80107717:	83 78 04 01          	cmpl   $0x1,0x4(%eax)
8010771b:	0f 84 86 01 00 00    	je     801078a7 <sys_mount+0x237>
80107721:	83 ec 0c             	sub    $0xc,%esp
80107724:	57                   	push   %edi
80107725:	e8 a6 a7 ff ff       	call   80101ed0 <ilock>
8010772a:	89 34 24             	mov    %esi,(%esp)
8010772d:	e8 9e a7 ff ff       	call   80101ed0 <ilock>
80107732:	83 c4 10             	add    $0x10,%esp
80107735:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
8010773a:	0f 85 18 01 00 00    	jne    80107858 <sys_mount+0x1e8>
80107740:	83 ec 04             	sub    $0x4,%esp
80107743:	ff 75 e4             	pushl  -0x1c(%ebp)
80107746:	57                   	push   %edi
80107747:	56                   	push   %esi
80107748:	e8 bf c7 ff ff       	call   80103f0c <mount>
8010774d:	89 c3                	mov    %eax,%ebx
8010774f:	89 34 24             	mov    %esi,(%esp)
80107752:	e8 59 a8 ff ff       	call   80101fb0 <iunlock>
80107757:	83 c4 10             	add    $0x10,%esp
8010775a:	85 db                	test   %ebx,%ebx
8010775c:	0f 85 de 00 00 00    	jne    80107840 <sys_mount+0x1d0>
80107762:	83 ec 0c             	sub    $0xc,%esp
80107765:	57                   	push   %edi
80107766:	e8 05 aa ff ff       	call   80102170 <iunlockput>
8010776b:	58                   	pop    %eax
8010776c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010776f:	e8 67 c7 ff ff       	call   80103edb <mntput>
80107774:	e8 d7 c0 ff ff       	call   80103850 <end_op>
80107779:	83 c4 10             	add    $0x10,%esp
8010777c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010777f:	89 d8                	mov    %ebx,%eax
80107781:	5b                   	pop    %ebx
80107782:	5e                   	pop    %esi
80107783:	5f                   	pop    %edi
80107784:	5d                   	pop    %ebp
80107785:	c3                   	ret    
80107786:	8d 76 00             	lea    0x0(%esi),%esi
80107789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107790:	8d 45 dc             	lea    -0x24(%ebp),%eax
80107793:	83 ec 08             	sub    $0x8,%esp
80107796:	50                   	push   %eax
80107797:	6a 00                	push   $0x0
80107799:	e8 12 f0 ff ff       	call   801067b0 <argstr>
8010779e:	83 c4 10             	add    $0x10,%esp
801077a1:	85 c0                	test   %eax,%eax
801077a3:	78 73                	js     80107818 <sys_mount+0x1a8>
801077a5:	8d 45 e0             	lea    -0x20(%ebp),%eax
801077a8:	83 ec 08             	sub    $0x8,%esp
801077ab:	50                   	push   %eax
801077ac:	6a 01                	push   $0x1
801077ae:	e8 fd ef ff ff       	call   801067b0 <argstr>
801077b3:	83 c4 10             	add    $0x10,%esp
801077b6:	85 c0                	test   %eax,%eax
801077b8:	78 5e                	js     80107818 <sys_mount+0x1a8>
801077ba:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801077bd:	85 c9                	test   %ecx,%ecx
801077bf:	75 57                	jne    80107818 <sys_mount+0x1a8>
801077c1:	e8 1a c0 ff ff       	call   801037e0 <begin_op>
801077c6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801077c9:	83 ec 08             	sub    $0x8,%esp
801077cc:	50                   	push   %eax
801077cd:	ff 75 e0             	pushl  -0x20(%ebp)
801077d0:	e8 2b b1 ff ff       	call   80102900 <nameimount>
801077d5:	83 c4 10             	add    $0x10,%esp
801077d8:	85 c0                	test   %eax,%eax
801077da:	0f 84 f9 00 00 00    	je     801078d9 <sys_mount+0x269>
801077e0:	e8 cb 56 00 00       	call   8010ceb0 <cgroup_root>
801077e5:	80 38 00             	cmpb   $0x0,(%eax)
801077e8:	0f 85 9a 00 00 00    	jne    80107888 <sys_mount+0x218>
801077ee:	8b 75 e0             	mov    -0x20(%ebp),%esi
801077f1:	e8 ba 56 00 00       	call   8010ceb0 <cgroup_root>
801077f6:	83 ec 08             	sub    $0x8,%esp
801077f9:	56                   	push   %esi
801077fa:	50                   	push   %eax
801077fb:	e8 90 5b 00 00       	call   8010d390 <set_cgroup_dir_path>
80107800:	e8 4b c0 ff ff       	call   80103850 <end_op>
80107805:	83 c4 10             	add    $0x10,%esp
80107808:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010780b:	89 d8                	mov    %ebx,%eax
8010780d:	5b                   	pop    %ebx
8010780e:	5e                   	pop    %esi
8010780f:	5f                   	pop    %edi
80107810:	5d                   	pop    %ebp
80107811:	c3                   	ret    
80107812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107818:	83 ec 0c             	sub    $0xc,%esp
8010781b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80107820:	68 60 f1 10 80       	push   $0x8010f160
80107825:	e8 36 8e ff ff       	call   80100660 <cprintf>
8010782a:	83 c4 10             	add    $0x10,%esp
8010782d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107830:	89 d8                	mov    %ebx,%eax
80107832:	5b                   	pop    %ebx
80107833:	5e                   	pop    %esi
80107834:	5f                   	pop    %edi
80107835:	5d                   	pop    %ebp
80107836:	c3                   	ret    
80107837:	89 f6                	mov    %esi,%esi
80107839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107840:	83 ec 0c             	sub    $0xc,%esp
80107843:	56                   	push   %esi
80107844:	e8 b7 a7 ff ff       	call   80102000 <iput>
80107849:	83 c4 10             	add    $0x10,%esp
8010784c:	e9 11 ff ff ff       	jmp    80107762 <sys_mount+0xf2>
80107851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107858:	83 ec 0c             	sub    $0xc,%esp
8010785b:	57                   	push   %edi
8010785c:	e8 0f a9 ff ff       	call   80102170 <iunlockput>
80107861:	89 34 24             	mov    %esi,(%esp)
80107864:	e8 07 a9 ff ff       	call   80102170 <iunlockput>
80107869:	5a                   	pop    %edx
8010786a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010786d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80107872:	e8 64 c6 ff ff       	call   80103edb <mntput>
80107877:	e8 d4 bf ff ff       	call   80103850 <end_op>
8010787c:	83 c4 10             	add    $0x10,%esp
8010787f:	e9 f8 fe ff ff       	jmp    8010777c <sys_mount+0x10c>
80107884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107888:	83 ec 0c             	sub    $0xc,%esp
8010788b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80107890:	68 b0 f1 10 80       	push   $0x8010f1b0
80107895:	e8 c6 8d ff ff       	call   80100660 <cprintf>
8010789a:	e8 b1 bf ff ff       	call   80103850 <end_op>
8010789f:	83 c4 10             	add    $0x10,%esp
801078a2:	e9 d5 fe ff ff       	jmp    8010777c <sys_mount+0x10c>
801078a7:	83 ec 0c             	sub    $0xc,%esp
801078aa:	57                   	push   %edi
801078ab:	e8 50 a7 ff ff       	call   80102000 <iput>
801078b0:	89 34 24             	mov    %esi,(%esp)
801078b3:	e8 48 a7 ff ff       	call   80102000 <iput>
801078b8:	eb af                	jmp    80107869 <sys_mount+0x1f9>
801078ba:	83 ec 0c             	sub    $0xc,%esp
801078bd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801078c2:	68 80 f1 10 80       	push   $0x8010f180
801078c7:	e8 94 8d ff ff       	call   80100660 <cprintf>
801078cc:	e8 7f bf ff ff       	call   80103850 <end_op>
801078d1:	83 c4 10             	add    $0x10,%esp
801078d4:	e9 a3 fe ff ff       	jmp    8010777c <sys_mount+0x10c>
801078d9:	83 ec 0c             	sub    $0xc,%esp
801078dc:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801078e1:	68 70 f1 10 80       	push   $0x8010f170
801078e6:	e8 75 8d ff ff       	call   80100660 <cprintf>
801078eb:	e8 60 bf ff ff       	call   80103850 <end_op>
801078f0:	83 c4 10             	add    $0x10,%esp
801078f3:	e9 84 fe ff ff       	jmp    8010777c <sys_mount+0x10c>
801078f8:	83 ec 0c             	sub    $0xc,%esp
801078fb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80107900:	57                   	push   %edi
80107901:	e8 fa a6 ff ff       	call   80102000 <iput>
80107906:	e8 45 bf ff ff       	call   80103850 <end_op>
8010790b:	83 c4 10             	add    $0x10,%esp
8010790e:	e9 69 fe ff ff       	jmp    8010777c <sys_mount+0x10c>
80107913:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107920 <sys_umount>:
80107920:	55                   	push   %ebp
80107921:	89 e5                	mov    %esp,%ebp
80107923:	53                   	push   %ebx
80107924:	8d 45 f0             	lea    -0x10(%ebp),%eax
80107927:	83 ec 1c             	sub    $0x1c,%esp
8010792a:	50                   	push   %eax
8010792b:	6a 00                	push   $0x0
8010792d:	e8 7e ee ff ff       	call   801067b0 <argstr>
80107932:	83 c4 10             	add    $0x10,%esp
80107935:	85 c0                	test   %eax,%eax
80107937:	0f 88 b3 00 00 00    	js     801079f0 <sys_umount+0xd0>
8010793d:	e8 9e be ff ff       	call   801037e0 <begin_op>
80107942:	83 ec 08             	sub    $0x8,%esp
80107945:	68 91 f1 10 80       	push   $0x8010f191
8010794a:	ff 75 f0             	pushl  -0x10(%ebp)
8010794d:	e8 ee 62 00 00       	call   8010dc40 <cgroup_delete>
80107952:	83 c4 10             	add    $0x10,%esp
80107955:	83 f8 ff             	cmp    $0xffffffff,%eax
80107958:	89 c3                	mov    %eax,%ebx
8010795a:	74 1c                	je     80107978 <sys_umount+0x58>
8010795c:	83 f8 fe             	cmp    $0xfffffffe,%eax
8010795f:	0f 84 ab 00 00 00    	je     80107a10 <sys_umount+0xf0>
80107965:	e8 e6 be ff ff       	call   80103850 <end_op>
8010796a:	89 d8                	mov    %ebx,%eax
8010796c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010796f:	c9                   	leave  
80107970:	c3                   	ret    
80107971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107978:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010797b:	83 ec 08             	sub    $0x8,%esp
8010797e:	50                   	push   %eax
8010797f:	ff 75 f0             	pushl  -0x10(%ebp)
80107982:	e8 79 af ff ff       	call   80102900 <nameimount>
80107987:	83 c4 10             	add    $0x10,%esp
8010798a:	85 c0                	test   %eax,%eax
8010798c:	0f 84 9d 00 00 00    	je     80107a2f <sys_umount+0x10f>
80107992:	83 78 04 01          	cmpl   $0x1,0x4(%eax)
80107996:	74 28                	je     801079c0 <sys_umount+0xa0>
80107998:	83 ec 0c             	sub    $0xc,%esp
8010799b:	50                   	push   %eax
8010799c:	e8 5f a6 ff ff       	call   80102000 <iput>
801079a1:	5a                   	pop    %edx
801079a2:	ff 75 f4             	pushl  -0xc(%ebp)
801079a5:	e8 31 c5 ff ff       	call   80103edb <mntput>
801079aa:	e8 a1 be ff ff       	call   80103850 <end_op>
801079af:	83 c4 10             	add    $0x10,%esp
801079b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801079b7:	eb b3                	jmp    8010796c <sys_umount+0x4c>
801079b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801079c0:	83 ec 0c             	sub    $0xc,%esp
801079c3:	50                   	push   %eax
801079c4:	e8 37 a6 ff ff       	call   80102000 <iput>
801079c9:	58                   	pop    %eax
801079ca:	ff 75 f4             	pushl  -0xc(%ebp)
801079cd:	e8 40 c6 ff ff       	call   80104012 <umount>
801079d2:	83 c4 10             	add    $0x10,%esp
801079d5:	85 c0                	test   %eax,%eax
801079d7:	89 c3                	mov    %eax,%ebx
801079d9:	74 8a                	je     80107965 <sys_umount+0x45>
801079db:	83 ec 0c             	sub    $0xc,%esp
801079de:	ff 75 f4             	pushl  -0xc(%ebp)
801079e1:	e8 f5 c4 ff ff       	call   80103edb <mntput>
801079e6:	83 c4 10             	add    $0x10,%esp
801079e9:	e9 77 ff ff ff       	jmp    80107965 <sys_umount+0x45>
801079ee:	66 90                	xchg   %ax,%ax
801079f0:	83 ec 0c             	sub    $0xc,%esp
801079f3:	68 60 f1 10 80       	push   $0x8010f160
801079f8:	e8 63 8c ff ff       	call   80100660 <cprintf>
801079fd:	83 c4 10             	add    $0x10,%esp
80107a00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107a05:	e9 62 ff ff ff       	jmp    8010796c <sys_umount+0x4c>
80107a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107a10:	e8 3b be ff ff       	call   80103850 <end_op>
80107a15:	83 ec 0c             	sub    $0xc,%esp
80107a18:	68 98 f1 10 80       	push   $0x8010f198
80107a1d:	e8 3e 8c ff ff       	call   80100660 <cprintf>
80107a22:	83 c4 10             	add    $0x10,%esp
80107a25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107a2a:	e9 3d ff ff ff       	jmp    8010796c <sys_umount+0x4c>
80107a2f:	e8 1c be ff ff       	call   80103850 <end_op>
80107a34:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107a39:	e9 2e ff ff ff       	jmp    8010796c <sys_umount+0x4c>
80107a3e:	66 90                	xchg   %ax,%ax

80107a40 <sys_printmounts>:
80107a40:	55                   	push   %ebp
80107a41:	89 e5                	mov    %esp,%ebp
80107a43:	83 ec 08             	sub    $0x8,%esp
80107a46:	e8 db c7 ff ff       	call   80104226 <printmounts>
80107a4b:	31 c0                	xor    %eax,%eax
80107a4d:	c9                   	leave  
80107a4e:	c3                   	ret    
80107a4f:	90                   	nop

80107a50 <sys_printdevices>:
80107a50:	55                   	push   %ebp
80107a51:	89 e5                	mov    %esp,%ebp
80107a53:	83 ec 08             	sub    $0x8,%esp
80107a56:	e8 e5 95 ff ff       	call   80101040 <printdevices>
80107a5b:	31 c0                	xor    %eax,%eax
80107a5d:	c9                   	leave  
80107a5e:	c3                   	ret    
80107a5f:	90                   	nop

80107a60 <sys_unshare>:
80107a60:	55                   	push   %ebp
80107a61:	89 e5                	mov    %esp,%ebp
80107a63:	83 ec 20             	sub    $0x20,%esp
80107a66:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107a69:	50                   	push   %eax
80107a6a:	6a 00                	push   $0x0
80107a6c:	e8 8f ec ff ff       	call   80106700 <argint>
80107a71:	83 c4 10             	add    $0x10,%esp
80107a74:	85 c0                	test   %eax,%eax
80107a76:	78 18                	js     80107a90 <sys_unshare+0x30>
80107a78:	83 ec 0c             	sub    $0xc,%esp
80107a7b:	ff 75 f4             	pushl  -0xc(%ebp)
80107a7e:	e8 58 d0 ff ff       	call   80104adb <unshare>
80107a83:	83 c4 10             	add    $0x10,%esp
80107a86:	c9                   	leave  
80107a87:	c3                   	ret    
80107a88:	90                   	nop
80107a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107a90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107a95:	c9                   	leave  
80107a96:	c3                   	ret    
80107a97:	66 90                	xchg   %ax,%ax
80107a99:	66 90                	xchg   %ax,%ax
80107a9b:	66 90                	xchg   %ax,%ax
80107a9d:	66 90                	xchg   %ax,%ax
80107a9f:	90                   	nop

80107aa0 <sys_fork>:
80107aa0:	55                   	push   %ebp
80107aa1:	89 e5                	mov    %esp,%ebp
80107aa3:	5d                   	pop    %ebp
80107aa4:	e9 60 da ff ff       	jmp    80105509 <fork>
80107aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107ab0 <sys_exit>:
80107ab0:	55                   	push   %ebp
80107ab1:	89 e5                	mov    %esp,%ebp
80107ab3:	83 ec 20             	sub    $0x20,%esp
80107ab6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107ab9:	50                   	push   %eax
80107aba:	6a 00                	push   $0x0
80107abc:	e8 3f ec ff ff       	call   80106700 <argint>
80107ac1:	83 c4 10             	add    $0x10,%esp
80107ac4:	85 c0                	test   %eax,%eax
80107ac6:	78 18                	js     80107ae0 <sys_exit+0x30>
80107ac8:	83 ec 0c             	sub    $0xc,%esp
80107acb:	ff 75 f4             	pushl  -0xc(%ebp)
80107ace:	e8 51 df ff ff       	call   80105a24 <exit>
80107ad3:	83 c4 10             	add    $0x10,%esp
80107ad6:	31 c0                	xor    %eax,%eax
80107ad8:	c9                   	leave  
80107ad9:	c3                   	ret    
80107ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107ae0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107ae5:	c9                   	leave  
80107ae6:	c3                   	ret    
80107ae7:	89 f6                	mov    %esi,%esi
80107ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107af0 <sys_wait>:
80107af0:	55                   	push   %ebp
80107af1:	89 e5                	mov    %esp,%ebp
80107af3:	83 ec 1c             	sub    $0x1c,%esp
80107af6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107af9:	6a 04                	push   $0x4
80107afb:	50                   	push   %eax
80107afc:	6a 00                	push   $0x0
80107afe:	e8 4d ec ff ff       	call   80106750 <argptr>
80107b03:	83 c4 10             	add    $0x10,%esp
80107b06:	85 c0                	test   %eax,%eax
80107b08:	78 16                	js     80107b20 <sys_wait+0x30>
80107b0a:	83 ec 0c             	sub    $0xc,%esp
80107b0d:	ff 75 f4             	pushl  -0xc(%ebp)
80107b10:	e8 5d e1 ff ff       	call   80105c72 <wait>
80107b15:	83 c4 10             	add    $0x10,%esp
80107b18:	c9                   	leave  
80107b19:	c3                   	ret    
80107b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107b20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107b25:	c9                   	leave  
80107b26:	c3                   	ret    
80107b27:	89 f6                	mov    %esi,%esi
80107b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107b30 <sys_kill>:
80107b30:	55                   	push   %ebp
80107b31:	89 e5                	mov    %esp,%ebp
80107b33:	83 ec 20             	sub    $0x20,%esp
80107b36:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107b39:	50                   	push   %eax
80107b3a:	6a 00                	push   $0x0
80107b3c:	e8 bf eb ff ff       	call   80106700 <argint>
80107b41:	83 c4 10             	add    $0x10,%esp
80107b44:	85 c0                	test   %eax,%eax
80107b46:	78 18                	js     80107b60 <sys_kill+0x30>
80107b48:	83 ec 0c             	sub    $0xc,%esp
80107b4b:	ff 75 f4             	pushl  -0xc(%ebp)
80107b4e:	e8 84 e2 ff ff       	call   80105dd7 <kill>
80107b53:	83 c4 10             	add    $0x10,%esp
80107b56:	c9                   	leave  
80107b57:	c3                   	ret    
80107b58:	90                   	nop
80107b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107b65:	c9                   	leave  
80107b66:	c3                   	ret    
80107b67:	89 f6                	mov    %esi,%esi
80107b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107b70 <sys_getpid>:
80107b70:	55                   	push   %ebp
80107b71:	89 e5                	mov    %esp,%ebp
80107b73:	83 ec 08             	sub    $0x8,%esp
80107b76:	e8 a8 d6 ff ff       	call   80105223 <myproc>
80107b7b:	8b 40 10             	mov    0x10(%eax),%eax
80107b7e:	c9                   	leave  
80107b7f:	c3                   	ret    

80107b80 <sys_sbrk>:
80107b80:	55                   	push   %ebp
80107b81:	89 e5                	mov    %esp,%ebp
80107b83:	53                   	push   %ebx
80107b84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107b87:	83 ec 1c             	sub    $0x1c,%esp
80107b8a:	50                   	push   %eax
80107b8b:	6a 00                	push   $0x0
80107b8d:	e8 6e eb ff ff       	call   80106700 <argint>
80107b92:	83 c4 10             	add    $0x10,%esp
80107b95:	85 c0                	test   %eax,%eax
80107b97:	78 27                	js     80107bc0 <sys_sbrk+0x40>
80107b99:	e8 85 d6 ff ff       	call   80105223 <myproc>
80107b9e:	83 ec 0c             	sub    $0xc,%esp
80107ba1:	8b 18                	mov    (%eax),%ebx
80107ba3:	ff 75 f4             	pushl  -0xc(%ebp)
80107ba6:	e8 87 d8 ff ff       	call   80105432 <growproc>
80107bab:	83 c4 10             	add    $0x10,%esp
80107bae:	85 c0                	test   %eax,%eax
80107bb0:	78 0e                	js     80107bc0 <sys_sbrk+0x40>
80107bb2:	89 d8                	mov    %ebx,%eax
80107bb4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107bb7:	c9                   	leave  
80107bb8:	c3                   	ret    
80107bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107bc5:	eb ed                	jmp    80107bb4 <sys_sbrk+0x34>
80107bc7:	89 f6                	mov    %esi,%esi
80107bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107bd0 <sys_sleep>:
80107bd0:	55                   	push   %ebp
80107bd1:	89 e5                	mov    %esp,%ebp
80107bd3:	53                   	push   %ebx
80107bd4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107bd7:	83 ec 1c             	sub    $0x1c,%esp
80107bda:	50                   	push   %eax
80107bdb:	6a 00                	push   $0x0
80107bdd:	e8 1e eb ff ff       	call   80106700 <argint>
80107be2:	83 c4 10             	add    $0x10,%esp
80107be5:	85 c0                	test   %eax,%eax
80107be7:	0f 88 8a 00 00 00    	js     80107c77 <sys_sleep+0xa7>
80107bed:	83 ec 0c             	sub    $0xc,%esp
80107bf0:	68 c0 bb 13 80       	push   $0x8013bbc0
80107bf5:	e8 36 e6 ff ff       	call   80106230 <acquire>
80107bfa:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107bfd:	83 c4 10             	add    $0x10,%esp
80107c00:	8b 1d 00 c4 13 80    	mov    0x8013c400,%ebx
80107c06:	85 d2                	test   %edx,%edx
80107c08:	75 27                	jne    80107c31 <sys_sleep+0x61>
80107c0a:	eb 54                	jmp    80107c60 <sys_sleep+0x90>
80107c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107c10:	83 ec 08             	sub    $0x8,%esp
80107c13:	68 c0 bb 13 80       	push   $0x8013bbc0
80107c18:	68 00 c4 13 80       	push   $0x8013c400
80107c1d:	e8 bf df ff ff       	call   80105be1 <sleep>
80107c22:	a1 00 c4 13 80       	mov    0x8013c400,%eax
80107c27:	83 c4 10             	add    $0x10,%esp
80107c2a:	29 d8                	sub    %ebx,%eax
80107c2c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80107c2f:	73 2f                	jae    80107c60 <sys_sleep+0x90>
80107c31:	e8 ed d5 ff ff       	call   80105223 <myproc>
80107c36:	8b 40 44             	mov    0x44(%eax),%eax
80107c39:	85 c0                	test   %eax,%eax
80107c3b:	74 d3                	je     80107c10 <sys_sleep+0x40>
80107c3d:	83 ec 0c             	sub    $0xc,%esp
80107c40:	68 c0 bb 13 80       	push   $0x8013bbc0
80107c45:	e8 06 e7 ff ff       	call   80106350 <release>
80107c4a:	83 c4 10             	add    $0x10,%esp
80107c4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107c52:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107c55:	c9                   	leave  
80107c56:	c3                   	ret    
80107c57:	89 f6                	mov    %esi,%esi
80107c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107c60:	83 ec 0c             	sub    $0xc,%esp
80107c63:	68 c0 bb 13 80       	push   $0x8013bbc0
80107c68:	e8 e3 e6 ff ff       	call   80106350 <release>
80107c6d:	83 c4 10             	add    $0x10,%esp
80107c70:	31 c0                	xor    %eax,%eax
80107c72:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107c75:	c9                   	leave  
80107c76:	c3                   	ret    
80107c77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107c7c:	eb d4                	jmp    80107c52 <sys_sleep+0x82>
80107c7e:	66 90                	xchg   %ax,%ax

80107c80 <sys_usleep>:
80107c80:	55                   	push   %ebp
80107c81:	89 e5                	mov    %esp,%ebp
80107c83:	57                   	push   %edi
80107c84:	56                   	push   %esi
80107c85:	53                   	push   %ebx
80107c86:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80107c89:	83 ec 24             	sub    $0x24,%esp
80107c8c:	50                   	push   %eax
80107c8d:	6a 00                	push   $0x0
80107c8f:	e8 6c ea ff ff       	call   80106700 <argint>
80107c94:	83 c4 10             	add    $0x10,%esp
80107c97:	85 c0                	test   %eax,%eax
80107c99:	0f 88 9e 00 00 00    	js     80107d3d <sys_usleep+0xbd>
80107c9f:	e8 9c 21 00 00       	call   80109e40 <steady_clock_now>
80107ca4:	83 ec 0c             	sub    $0xc,%esp
80107ca7:	89 c3                	mov    %eax,%ebx
80107ca9:	31 ff                	xor    %edi,%edi
80107cab:	68 c0 bb 13 80       	push   $0x8013bbc0
80107cb0:	89 de                	mov    %ebx,%esi
80107cb2:	e8 79 e5 ff ff       	call   80106230 <acquire>
80107cb7:	83 c4 10             	add    $0x10,%esp
80107cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107cc0:	e8 7b 21 00 00       	call   80109e40 <steady_clock_now>
80107cc5:	29 f0                	sub    %esi,%eax
80107cc7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80107cca:	19 fa                	sbb    %edi,%edx
80107ccc:	83 fa 00             	cmp    $0x0,%edx
80107ccf:	76 1f                	jbe    80107cf0 <sys_usleep+0x70>
80107cd1:	83 ec 0c             	sub    $0xc,%esp
80107cd4:	68 c0 bb 13 80       	push   $0x8013bbc0
80107cd9:	e8 72 e6 ff ff       	call   80106350 <release>
80107cde:	83 c4 10             	add    $0x10,%esp
80107ce1:	31 c0                	xor    %eax,%eax
80107ce3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107ce6:	5b                   	pop    %ebx
80107ce7:	5e                   	pop    %esi
80107ce8:	5f                   	pop    %edi
80107ce9:	5d                   	pop    %ebp
80107cea:	c3                   	ret    
80107ceb:	90                   	nop
80107cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107cf0:	39 c8                	cmp    %ecx,%eax
80107cf2:	73 dd                	jae    80107cd1 <sys_usleep+0x51>
80107cf4:	e8 2a d5 ff ff       	call   80105223 <myproc>
80107cf9:	8b 40 44             	mov    0x44(%eax),%eax
80107cfc:	85 c0                	test   %eax,%eax
80107cfe:	75 20                	jne    80107d20 <sys_usleep+0xa0>
80107d00:	83 ec 08             	sub    $0x8,%esp
80107d03:	68 c0 bb 13 80       	push   $0x8013bbc0
80107d08:	68 00 c4 13 80       	push   $0x8013c400
80107d0d:	e8 cf de ff ff       	call   80105be1 <sleep>
80107d12:	83 c4 10             	add    $0x10,%esp
80107d15:	eb a9                	jmp    80107cc0 <sys_usleep+0x40>
80107d17:	89 f6                	mov    %esi,%esi
80107d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107d20:	83 ec 0c             	sub    $0xc,%esp
80107d23:	68 c0 bb 13 80       	push   $0x8013bbc0
80107d28:	e8 23 e6 ff ff       	call   80106350 <release>
80107d2d:	83 c4 10             	add    $0x10,%esp
80107d30:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107d33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107d38:	5b                   	pop    %ebx
80107d39:	5e                   	pop    %esi
80107d3a:	5f                   	pop    %edi
80107d3b:	5d                   	pop    %ebp
80107d3c:	c3                   	ret    
80107d3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107d42:	eb 9f                	jmp    80107ce3 <sys_usleep+0x63>
80107d44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107d4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107d50 <sys_ioctl>:
80107d50:	55                   	push   %ebp
80107d51:	89 e5                	mov    %esp,%ebp
80107d53:	56                   	push   %esi
80107d54:	53                   	push   %ebx
80107d55:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80107d58:	83 ec 18             	sub    $0x18,%esp
80107d5b:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
80107d62:	53                   	push   %ebx
80107d63:	6a 00                	push   $0x0
80107d65:	e8 96 e9 ff ff       	call   80106700 <argint>
80107d6a:	83 c4 10             	add    $0x10,%esp
80107d6d:	85 c0                	test   %eax,%eax
80107d6f:	0f 88 1b 01 00 00    	js     80107e90 <sys_ioctl+0x140>
80107d75:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80107d79:	0f 87 11 01 00 00    	ja     80107e90 <sys_ioctl+0x140>
80107d7f:	e8 9f d4 ff ff       	call   80105223 <myproc>
80107d84:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107d87:	8b 74 90 48          	mov    0x48(%eax,%edx,4),%esi
80107d8b:	85 f6                	test   %esi,%esi
80107d8d:	0f 84 fd 00 00 00    	je     80107e90 <sys_ioctl+0x140>
80107d93:	8d 45 f0             	lea    -0x10(%ebp),%eax
80107d96:	83 ec 08             	sub    $0x8,%esp
80107d99:	50                   	push   %eax
80107d9a:	6a 01                	push   $0x1
80107d9c:	e8 5f e9 ff ff       	call   80106700 <argint>
80107da1:	83 c4 10             	add    $0x10,%esp
80107da4:	85 c0                	test   %eax,%eax
80107da6:	0f 88 e4 00 00 00    	js     80107e90 <sys_ioctl+0x140>
80107dac:	83 ec 08             	sub    $0x8,%esp
80107daf:	53                   	push   %ebx
80107db0:	6a 02                	push   $0x2
80107db2:	e8 49 e9 ff ff       	call   80106700 <argint>
80107db7:	83 c4 10             	add    $0x10,%esp
80107dba:	85 c0                	test   %eax,%eax
80107dbc:	0f 88 ce 00 00 00    	js     80107e90 <sys_ioctl+0x140>
80107dc2:	f7 45 f4 30 30 00 00 	testl  $0x3030,-0xc(%ebp)
80107dc9:	0f 84 c1 00 00 00    	je     80107e90 <sys_ioctl+0x140>
80107dcf:	8b 5e 10             	mov    0x10(%esi),%ebx
80107dd2:	66 83 7b 54 00       	cmpw   $0x0,0x54(%ebx)
80107dd7:	0f 84 b3 00 00 00    	je     80107e90 <sys_ioctl+0x140>
80107ddd:	83 ec 0c             	sub    $0xc,%esp
80107de0:	53                   	push   %ebx
80107de1:	e8 ea a0 ff ff       	call   80101ed0 <ilock>
80107de6:	83 c4 10             	add    $0x10,%esp
80107de9:	66 83 7b 50 03       	cmpw   $0x3,0x50(%ebx)
80107dee:	0f 85 14 01 00 00    	jne    80107f08 <sys_ioctl+0x1b8>
80107df4:	66 83 7b 52 09       	cmpw   $0x9,0x52(%ebx)
80107df9:	0f 8f 09 01 00 00    	jg     80107f08 <sys_ioctl+0x1b8>
80107dff:	66 83 7b 54 03       	cmpw   $0x3,0x54(%ebx)
80107e04:	0f 8f fe 00 00 00    	jg     80107f08 <sys_ioctl+0x1b8>
80107e0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107e0d:	83 f8 02             	cmp    $0x2,%eax
80107e10:	0f 84 ca 00 00 00    	je     80107ee0 <sys_ioctl+0x190>
80107e16:	7e 38                	jle    80107e50 <sys_ioctl+0x100>
80107e18:	3d e9 03 00 00       	cmp    $0x3e9,%eax
80107e1d:	0f 84 9d 00 00 00    	je     80107ec0 <sys_ioctl+0x170>
80107e23:	3d ea 03 00 00       	cmp    $0x3ea,%eax
80107e28:	75 76                	jne    80107ea0 <sys_ioctl+0x150>
80107e2a:	e8 0c e1 ff ff       	call   80105f3b <proc_lock>
80107e2f:	e8 ef d3 ff ff       	call   80105223 <myproc>
80107e34:	8b 98 b8 02 00 00    	mov    0x2b8(%eax),%ebx
80107e3a:	e8 11 e1 ff ff       	call   80105f50 <proc_unlock>
80107e3f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107e42:	89 d8                	mov    %ebx,%eax
80107e44:	5b                   	pop    %ebx
80107e45:	5e                   	pop    %esi
80107e46:	5d                   	pop    %ebp
80107e47:	c3                   	ret    
80107e48:	90                   	nop
80107e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107e50:	83 f8 01             	cmp    $0x1,%eax
80107e53:	75 4b                	jne    80107ea0 <sys_ioctl+0x150>
80107e55:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107e58:	f6 c4 20             	test   $0x20,%ah
80107e5b:	0f 85 bf 00 00 00    	jne    80107f20 <sys_ioctl+0x1d0>
80107e61:	f6 c4 10             	test   $0x10,%ah
80107e64:	0f 85 fe 00 00 00    	jne    80107f68 <sys_ioctl+0x218>
80107e6a:	a8 10                	test   $0x10,%al
80107e6c:	0f 85 de 00 00 00    	jne    80107f50 <sys_ioctl+0x200>
80107e72:	a8 20                	test   $0x20,%al
80107e74:	0f 85 be 00 00 00    	jne    80107f38 <sys_ioctl+0x1e8>
80107e7a:	83 ec 0c             	sub    $0xc,%esp
80107e7d:	53                   	push   %ebx
80107e7e:	e8 2d a1 ff ff       	call   80101fb0 <iunlock>
80107e83:	83 c4 10             	add    $0x10,%esp
80107e86:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107e89:	31 c0                	xor    %eax,%eax
80107e8b:	5b                   	pop    %ebx
80107e8c:	5e                   	pop    %esi
80107e8d:	5d                   	pop    %ebp
80107e8e:	c3                   	ret    
80107e8f:	90                   	nop
80107e90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107e95:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107e98:	5b                   	pop    %ebx
80107e99:	5e                   	pop    %esi
80107e9a:	5d                   	pop    %ebp
80107e9b:	c3                   	ret    
80107e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107ea0:	83 ec 0c             	sub    $0xc,%esp
80107ea3:	53                   	push   %ebx
80107ea4:	e8 07 a1 ff ff       	call   80101fb0 <iunlock>
80107ea9:	83 c4 10             	add    $0x10,%esp
80107eac:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107eaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107eb4:	5b                   	pop    %ebx
80107eb5:	5e                   	pop    %esi
80107eb6:	5d                   	pop    %ebp
80107eb7:	c3                   	ret    
80107eb8:	90                   	nop
80107eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107ec0:	e8 76 e0 ff ff       	call   80105f3b <proc_lock>
80107ec5:	e8 59 d3 ff ff       	call   80105223 <myproc>
80107eca:	8b 98 b0 02 00 00    	mov    0x2b0(%eax),%ebx
80107ed0:	e8 7b e0 ff ff       	call   80105f50 <proc_unlock>
80107ed5:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107ed8:	89 d8                	mov    %ebx,%eax
80107eda:	5b                   	pop    %ebx
80107edb:	5e                   	pop    %esi
80107edc:	5d                   	pop    %ebp
80107edd:	c3                   	ret    
80107ede:	66 90                	xchg   %ax,%ax
80107ee0:	83 ec 08             	sub    $0x8,%esp
80107ee3:	ff 75 f4             	pushl  -0xc(%ebp)
80107ee6:	53                   	push   %ebx
80107ee7:	e8 f4 8e ff ff       	call   80100de0 <tty_gets>
80107eec:	89 1c 24             	mov    %ebx,(%esp)
80107eef:	89 c6                	mov    %eax,%esi
80107ef1:	e8 ba a0 ff ff       	call   80101fb0 <iunlock>
80107ef6:	83 c4 10             	add    $0x10,%esp
80107ef9:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107efc:	89 f0                	mov    %esi,%eax
80107efe:	5b                   	pop    %ebx
80107eff:	5e                   	pop    %esi
80107f00:	5d                   	pop    %ebp
80107f01:	c3                   	ret    
80107f02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107f08:	83 ec 0c             	sub    $0xc,%esp
80107f0b:	53                   	push   %ebx
80107f0c:	e8 5f a2 ff ff       	call   80102170 <iunlockput>
80107f11:	83 c4 10             	add    $0x10,%esp
80107f14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107f19:	e9 77 ff ff ff       	jmp    80107e95 <sys_ioctl+0x145>
80107f1e:	66 90                	xchg   %ax,%ax
80107f20:	83 ec 0c             	sub    $0xc,%esp
80107f23:	53                   	push   %ebx
80107f24:	e8 97 8d ff ff       	call   80100cc0 <tty_disconnect>
80107f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107f2c:	83 c4 10             	add    $0x10,%esp
80107f2f:	e9 2d ff ff ff       	jmp    80107e61 <sys_ioctl+0x111>
80107f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107f38:	83 ec 0c             	sub    $0xc,%esp
80107f3b:	53                   	push   %ebx
80107f3c:	e8 7f 8e ff ff       	call   80100dc0 <tty_detach>
80107f41:	83 c4 10             	add    $0x10,%esp
80107f44:	e9 31 ff ff ff       	jmp    80107e7a <sys_ioctl+0x12a>
80107f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107f50:	83 ec 0c             	sub    $0xc,%esp
80107f53:	53                   	push   %ebx
80107f54:	e8 27 8e ff ff       	call   80100d80 <tty_attach>
80107f59:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107f5c:	83 c4 10             	add    $0x10,%esp
80107f5f:	e9 0e ff ff ff       	jmp    80107e72 <sys_ioctl+0x122>
80107f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107f68:	83 ec 0c             	sub    $0xc,%esp
80107f6b:	53                   	push   %ebx
80107f6c:	e8 9f 8d ff ff       	call   80100d10 <tty_connect>
80107f71:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107f74:	83 c4 10             	add    $0x10,%esp
80107f77:	e9 ee fe ff ff       	jmp    80107e6a <sys_ioctl+0x11a>
80107f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107f80 <sys_uptime>:
80107f80:	55                   	push   %ebp
80107f81:	89 e5                	mov    %esp,%ebp
80107f83:	53                   	push   %ebx
80107f84:	83 ec 10             	sub    $0x10,%esp
80107f87:	68 c0 bb 13 80       	push   $0x8013bbc0
80107f8c:	e8 9f e2 ff ff       	call   80106230 <acquire>
80107f91:	8b 1d 00 c4 13 80    	mov    0x8013c400,%ebx
80107f97:	c7 04 24 c0 bb 13 80 	movl   $0x8013bbc0,(%esp)
80107f9e:	e8 ad e3 ff ff       	call   80106350 <release>
80107fa3:	89 d8                	mov    %ebx,%eax
80107fa5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107fa8:	c9                   	leave  
80107fa9:	c3                   	ret    
80107faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107fb0 <sys_getppid>:
80107fb0:	55                   	push   %ebp
80107fb1:	89 e5                	mov    %esp,%ebp
80107fb3:	83 ec 08             	sub    $0x8,%esp
80107fb6:	e8 68 d2 ff ff       	call   80105223 <myproc>
80107fbb:	8b 40 34             	mov    0x34(%eax),%eax
80107fbe:	8b 40 10             	mov    0x10(%eax),%eax
80107fc1:	c9                   	leave  
80107fc2:	c3                   	ret    
80107fc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107fd0 <sys_getcpu>:
80107fd0:	55                   	push   %ebp
80107fd1:	89 e5                	mov    %esp,%ebp
80107fd3:	83 ec 08             	sub    $0x8,%esp
  asm volatile("cli");
80107fd6:	fa                   	cli    
80107fd7:	e8 2c d2 ff ff       	call   80105208 <cpuid>
  asm volatile("sti");
80107fdc:	fb                   	sti    
80107fdd:	c9                   	leave  
80107fde:	c3                   	ret    
80107fdf:	90                   	nop

80107fe0 <sys_getmem>:
80107fe0:	55                   	push   %ebp
80107fe1:	89 e5                	mov    %esp,%ebp
80107fe3:	83 ec 08             	sub    $0x8,%esp
80107fe6:	e8 38 d2 ff ff       	call   80105223 <myproc>
80107feb:	8b 00                	mov    (%eax),%eax
80107fed:	c9                   	leave  
80107fee:	c3                   	ret    
80107fef:	90                   	nop

80107ff0 <sys_kmemtest>:
80107ff0:	55                   	push   %ebp
80107ff1:	89 e5                	mov    %esp,%ebp
80107ff3:	5d                   	pop    %ebp
80107ff4:	e9 77 b0 ff ff       	jmp    80103070 <kmemtest>

80107ff9 <alltraps>:
80107ff9:	1e                   	push   %ds
80107ffa:	06                   	push   %es
80107ffb:	0f a0                	push   %fs
80107ffd:	0f a8                	push   %gs
80107fff:	60                   	pusha  
80108000:	66 b8 10 00          	mov    $0x10,%ax
80108004:	8e d8                	mov    %eax,%ds
80108006:	8e c0                	mov    %eax,%es
80108008:	54                   	push   %esp
80108009:	e8 e2 00 00 00       	call   801080f0 <trap>
8010800e:	83 c4 04             	add    $0x4,%esp

80108011 <trapret>:
80108011:	61                   	popa   
80108012:	0f a9                	pop    %gs
80108014:	0f a1                	pop    %fs
80108016:	07                   	pop    %es
80108017:	1f                   	pop    %ds
80108018:	83 c4 08             	add    $0x8,%esp
8010801b:	cf                   	iret   
8010801c:	66 90                	xchg   %ax,%ax
8010801e:	66 90                	xchg   %ax,%ax

80108020 <tvinit>:
80108020:	31 c0                	xor    %eax,%eax
80108022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80108028:	8b 14 85 04 00 12 80 	mov    -0x7fedfffc(,%eax,4),%edx
8010802f:	b9 08 00 00 00       	mov    $0x8,%ecx
80108034:	c6 04 c5 04 bc 13 80 	movb   $0x0,-0x7fec43fc(,%eax,8)
8010803b:	00 
8010803c:	66 89 0c c5 02 bc 13 	mov    %cx,-0x7fec43fe(,%eax,8)
80108043:	80 
80108044:	c6 04 c5 05 bc 13 80 	movb   $0x8e,-0x7fec43fb(,%eax,8)
8010804b:	8e 
8010804c:	66 89 14 c5 00 bc 13 	mov    %dx,-0x7fec4400(,%eax,8)
80108053:	80 
80108054:	c1 ea 10             	shr    $0x10,%edx
80108057:	66 89 14 c5 06 bc 13 	mov    %dx,-0x7fec43fa(,%eax,8)
8010805e:	80 
8010805f:	83 c0 01             	add    $0x1,%eax
80108062:	3d 00 01 00 00       	cmp    $0x100,%eax
80108067:	75 bf                	jne    80108028 <tvinit+0x8>
80108069:	55                   	push   %ebp
8010806a:	ba 08 00 00 00       	mov    $0x8,%edx
8010806f:	89 e5                	mov    %esp,%ebp
80108071:	83 ec 10             	sub    $0x10,%esp
80108074:	a1 04 01 12 80       	mov    0x80120104,%eax
80108079:	68 d3 f1 10 80       	push   $0x8010f1d3
8010807e:	68 c0 bb 13 80       	push   $0x8013bbc0
80108083:	66 89 15 02 be 13 80 	mov    %dx,0x8013be02
8010808a:	c6 05 04 be 13 80 00 	movb   $0x0,0x8013be04
80108091:	66 a3 00 be 13 80    	mov    %ax,0x8013be00
80108097:	c1 e8 10             	shr    $0x10,%eax
8010809a:	c6 05 05 be 13 80 ef 	movb   $0xef,0x8013be05
801080a1:	66 a3 06 be 13 80    	mov    %ax,0x8013be06
801080a7:	e8 84 e0 ff ff       	call   80106130 <initlock>
801080ac:	83 c4 10             	add    $0x10,%esp
801080af:	c9                   	leave  
801080b0:	c3                   	ret    
801080b1:	eb 0d                	jmp    801080c0 <idtinit>
801080b3:	90                   	nop
801080b4:	90                   	nop
801080b5:	90                   	nop
801080b6:	90                   	nop
801080b7:	90                   	nop
801080b8:	90                   	nop
801080b9:	90                   	nop
801080ba:	90                   	nop
801080bb:	90                   	nop
801080bc:	90                   	nop
801080bd:	90                   	nop
801080be:	90                   	nop
801080bf:	90                   	nop

801080c0 <idtinit>:
801080c0:	55                   	push   %ebp
  pd[0] = size-1;
801080c1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801080c6:	89 e5                	mov    %esp,%ebp
801080c8:	83 ec 10             	sub    $0x10,%esp
801080cb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
801080cf:	b8 00 bc 13 80       	mov    $0x8013bc00,%eax
801080d4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
801080d8:	c1 e8 10             	shr    $0x10,%eax
801080db:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
801080df:	8d 45 fa             	lea    -0x6(%ebp),%eax
801080e2:	0f 01 18             	lidtl  (%eax)
801080e5:	c9                   	leave  
801080e6:	c3                   	ret    
801080e7:	89 f6                	mov    %esi,%esi
801080e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801080f0 <trap>:
801080f0:	55                   	push   %ebp
801080f1:	89 e5                	mov    %esp,%ebp
801080f3:	57                   	push   %edi
801080f4:	56                   	push   %esi
801080f5:	53                   	push   %ebx
801080f6:	83 ec 1c             	sub    $0x1c,%esp
801080f9:	8b 7d 08             	mov    0x8(%ebp),%edi
801080fc:	8b 47 30             	mov    0x30(%edi),%eax
801080ff:	83 f8 40             	cmp    $0x40,%eax
80108102:	0f 84 a8 01 00 00    	je     801082b0 <trap+0x1c0>
80108108:	83 e8 20             	sub    $0x20,%eax
8010810b:	83 f8 1f             	cmp    $0x1f,%eax
8010810e:	77 10                	ja     80108120 <trap+0x30>
80108110:	ff 24 85 7c f2 10 80 	jmp    *-0x7fef0d84(,%eax,4)
80108117:	89 f6                	mov    %esi,%esi
80108119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80108120:	e8 fe d0 ff ff       	call   80105223 <myproc>
80108125:	85 c0                	test   %eax,%eax
80108127:	0f 84 21 02 00 00    	je     8010834e <trap+0x25e>
8010812d:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80108131:	0f 84 17 02 00 00    	je     8010834e <trap+0x25e>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80108137:	0f 20 d1             	mov    %cr2,%ecx
8010813a:	8b 57 38             	mov    0x38(%edi),%edx
8010813d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80108140:	89 55 dc             	mov    %edx,-0x24(%ebp)
80108143:	e8 c0 d0 ff ff       	call   80105208 <cpuid>
80108148:	8b 77 34             	mov    0x34(%edi),%esi
8010814b:	8b 5f 30             	mov    0x30(%edi),%ebx
8010814e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80108151:	e8 cd d0 ff ff       	call   80105223 <myproc>
80108156:	89 45 e0             	mov    %eax,-0x20(%ebp)
80108159:	e8 c5 d0 ff ff       	call   80105223 <myproc>
8010815e:	8b 55 dc             	mov    -0x24(%ebp),%edx
80108161:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80108164:	51                   	push   %ecx
80108165:	52                   	push   %edx
80108166:	8b 55 e0             	mov    -0x20(%ebp),%edx
80108169:	ff 75 e4             	pushl  -0x1c(%ebp)
8010816c:	56                   	push   %esi
8010816d:	53                   	push   %ebx
8010816e:	81 c2 90 00 00 00    	add    $0x90,%edx
80108174:	52                   	push   %edx
80108175:	ff 70 10             	pushl  0x10(%eax)
80108178:	68 38 f2 10 80       	push   $0x8010f238
8010817d:	e8 de 84 ff ff       	call   80100660 <cprintf>
80108182:	83 c4 20             	add    $0x20,%esp
80108185:	83 7f 30 0e          	cmpl   $0xe,0x30(%edi)
80108189:	0f 84 a9 01 00 00    	je     80108338 <trap+0x248>
8010818f:	e8 8f d0 ff ff       	call   80105223 <myproc>
80108194:	c7 40 44 01 00 00 00 	movl   $0x1,0x44(%eax)
8010819b:	90                   	nop
8010819c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801081a0:	e8 7e d0 ff ff       	call   80105223 <myproc>
801081a5:	85 c0                	test   %eax,%eax
801081a7:	74 0c                	je     801081b5 <trap+0xc5>
801081a9:	e8 75 d0 ff ff       	call   80105223 <myproc>
801081ae:	8b 50 44             	mov    0x44(%eax),%edx
801081b1:	85 d2                	test   %edx,%edx
801081b3:	75 4b                	jne    80108200 <trap+0x110>
801081b5:	e8 69 d0 ff ff       	call   80105223 <myproc>
801081ba:	85 c0                	test   %eax,%eax
801081bc:	74 0b                	je     801081c9 <trap+0xd9>
801081be:	e8 60 d0 ff ff       	call   80105223 <myproc>
801081c3:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801081c7:	74 57                	je     80108220 <trap+0x130>
801081c9:	e8 55 d0 ff ff       	call   80105223 <myproc>
801081ce:	85 c0                	test   %eax,%eax
801081d0:	74 1d                	je     801081ef <trap+0xff>
801081d2:	e8 4c d0 ff ff       	call   80105223 <myproc>
801081d7:	8b 40 44             	mov    0x44(%eax),%eax
801081da:	85 c0                	test   %eax,%eax
801081dc:	74 11                	je     801081ef <trap+0xff>
801081de:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801081e2:	83 e0 03             	and    $0x3,%eax
801081e5:	66 83 f8 03          	cmp    $0x3,%ax
801081e9:	0f 84 ea 00 00 00    	je     801082d9 <trap+0x1e9>
801081ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
801081f2:	5b                   	pop    %ebx
801081f3:	5e                   	pop    %esi
801081f4:	5f                   	pop    %edi
801081f5:	5d                   	pop    %ebp
801081f6:	c3                   	ret    
801081f7:	89 f6                	mov    %esi,%esi
801081f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80108200:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80108204:	83 e0 03             	and    $0x3,%eax
80108207:	66 83 f8 03          	cmp    $0x3,%ax
8010820b:	75 a8                	jne    801081b5 <trap+0xc5>
8010820d:	83 ec 0c             	sub    $0xc,%esp
80108210:	6a 00                	push   $0x0
80108212:	e8 0d d8 ff ff       	call   80105a24 <exit>
80108217:	83 c4 10             	add    $0x10,%esp
8010821a:	eb 99                	jmp    801081b5 <trap+0xc5>
8010821c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80108220:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80108224:	75 a3                	jne    801081c9 <trap+0xd9>
80108226:	e8 84 d9 ff ff       	call   80105baf <yield>
8010822b:	eb 9c                	jmp    801081c9 <trap+0xd9>
8010822d:	8d 76 00             	lea    0x0(%esi),%esi
80108230:	e8 d3 cf ff ff       	call   80105208 <cpuid>
80108235:	85 c0                	test   %eax,%eax
80108237:	0f 84 c3 00 00 00    	je     80108300 <trap+0x210>
8010823d:	e8 4e b1 ff ff       	call   80103390 <lapiceoi>
80108242:	e9 59 ff ff ff       	jmp    801081a0 <trap+0xb0>
80108247:	89 f6                	mov    %esi,%esi
80108249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80108250:	e8 fb af ff ff       	call   80103250 <kbdintr>
80108255:	e8 36 b1 ff ff       	call   80103390 <lapiceoi>
8010825a:	e9 41 ff ff ff       	jmp    801081a0 <trap+0xb0>
8010825f:	90                   	nop
80108260:	e8 8b 02 00 00       	call   801084f0 <uartintr>
80108265:	e8 26 b1 ff ff       	call   80103390 <lapiceoi>
8010826a:	e9 31 ff ff ff       	jmp    801081a0 <trap+0xb0>
8010826f:	90                   	nop
80108270:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80108274:	8b 77 38             	mov    0x38(%edi),%esi
80108277:	e8 8c cf ff ff       	call   80105208 <cpuid>
8010827c:	56                   	push   %esi
8010827d:	53                   	push   %ebx
8010827e:	50                   	push   %eax
8010827f:	68 e0 f1 10 80       	push   $0x8010f1e0
80108284:	e8 d7 83 ff ff       	call   80100660 <cprintf>
80108289:	e8 02 b1 ff ff       	call   80103390 <lapiceoi>
8010828e:	83 c4 10             	add    $0x10,%esp
80108291:	e9 0a ff ff ff       	jmp    801081a0 <trap+0xb0>
80108296:	8d 76 00             	lea    0x0(%esi),%esi
80108299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801082a0:	e8 cb a7 ff ff       	call   80102a70 <ideintr>
801082a5:	eb 96                	jmp    8010823d <trap+0x14d>
801082a7:	89 f6                	mov    %esi,%esi
801082a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801082b0:	e8 6e cf ff ff       	call   80105223 <myproc>
801082b5:	8b 58 44             	mov    0x44(%eax),%ebx
801082b8:	85 db                	test   %ebx,%ebx
801082ba:	75 34                	jne    801082f0 <trap+0x200>
801082bc:	e8 62 cf ff ff       	call   80105223 <myproc>
801082c1:	89 78 38             	mov    %edi,0x38(%eax)
801082c4:	e8 27 e5 ff ff       	call   801067f0 <syscall>
801082c9:	e8 55 cf ff ff       	call   80105223 <myproc>
801082ce:	8b 48 44             	mov    0x44(%eax),%ecx
801082d1:	85 c9                	test   %ecx,%ecx
801082d3:	0f 84 16 ff ff ff    	je     801081ef <trap+0xff>
801082d9:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
801082e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801082e3:	5b                   	pop    %ebx
801082e4:	5e                   	pop    %esi
801082e5:	5f                   	pop    %edi
801082e6:	5d                   	pop    %ebp
801082e7:	e9 38 d7 ff ff       	jmp    80105a24 <exit>
801082ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801082f0:	83 ec 0c             	sub    $0xc,%esp
801082f3:	6a 00                	push   $0x0
801082f5:	e8 2a d7 ff ff       	call   80105a24 <exit>
801082fa:	83 c4 10             	add    $0x10,%esp
801082fd:	eb bd                	jmp    801082bc <trap+0x1cc>
801082ff:	90                   	nop
80108300:	83 ec 0c             	sub    $0xc,%esp
80108303:	68 c0 bb 13 80       	push   $0x8013bbc0
80108308:	e8 23 df ff ff       	call   80106230 <acquire>
8010830d:	c7 04 24 00 c4 13 80 	movl   $0x8013c400,(%esp)
80108314:	83 05 00 c4 13 80 01 	addl   $0x1,0x8013c400
8010831b:	e8 8e da ff ff       	call   80105dae <wakeup>
80108320:	c7 04 24 c0 bb 13 80 	movl   $0x8013bbc0,(%esp)
80108327:	e8 24 e0 ff ff       	call   80106350 <release>
8010832c:	83 c4 10             	add    $0x10,%esp
8010832f:	e9 09 ff ff ff       	jmp    8010823d <trap+0x14d>
80108334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80108338:	e8 b7 dc ff ff       	call   80105ff4 <proc_get_cgroup>
8010833d:	83 ec 0c             	sub    $0xc,%esp
80108340:	50                   	push   %eax
80108341:	e8 1a 60 00 00       	call   8010e360 <cgroup_mem_stat_pgfault_incr>
80108346:	83 c4 10             	add    $0x10,%esp
80108349:	e9 41 fe ff ff       	jmp    8010818f <trap+0x9f>
8010834e:	0f 20 d6             	mov    %cr2,%esi
80108351:	8b 5f 38             	mov    0x38(%edi),%ebx
80108354:	e8 af ce ff ff       	call   80105208 <cpuid>
80108359:	83 ec 0c             	sub    $0xc,%esp
8010835c:	56                   	push   %esi
8010835d:	53                   	push   %ebx
8010835e:	50                   	push   %eax
8010835f:	ff 77 30             	pushl  0x30(%edi)
80108362:	68 04 f2 10 80       	push   $0x8010f204
80108367:	e8 f4 82 ff ff       	call   80100660 <cprintf>
8010836c:	83 c4 14             	add    $0x14,%esp
8010836f:	68 d8 f1 10 80       	push   $0x8010f1d8
80108374:	e8 57 80 ff ff       	call   801003d0 <panic>
80108379:	66 90                	xchg   %ax,%ax
8010837b:	66 90                	xchg   %ax,%ax
8010837d:	66 90                	xchg   %ax,%ax
8010837f:	90                   	nop

80108380 <uartgetc>:
80108380:	a1 bc 05 12 80       	mov    0x801205bc,%eax
80108385:	55                   	push   %ebp
80108386:	89 e5                	mov    %esp,%ebp
80108388:	85 c0                	test   %eax,%eax
8010838a:	74 1c                	je     801083a8 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010838c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80108391:	ec                   	in     (%dx),%al
80108392:	a8 01                	test   $0x1,%al
80108394:	74 12                	je     801083a8 <uartgetc+0x28>
80108396:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010839b:	ec                   	in     (%dx),%al
8010839c:	0f b6 c0             	movzbl %al,%eax
8010839f:	5d                   	pop    %ebp
801083a0:	c3                   	ret    
801083a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801083a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801083ad:	5d                   	pop    %ebp
801083ae:	c3                   	ret    
801083af:	90                   	nop

801083b0 <uartputc.part.0>:
801083b0:	55                   	push   %ebp
801083b1:	89 e5                	mov    %esp,%ebp
801083b3:	57                   	push   %edi
801083b4:	56                   	push   %esi
801083b5:	53                   	push   %ebx
801083b6:	89 c7                	mov    %eax,%edi
801083b8:	bb 80 00 00 00       	mov    $0x80,%ebx
801083bd:	be fd 03 00 00       	mov    $0x3fd,%esi
801083c2:	83 ec 0c             	sub    $0xc,%esp
801083c5:	eb 1b                	jmp    801083e2 <uartputc.part.0+0x32>
801083c7:	89 f6                	mov    %esi,%esi
801083c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801083d0:	83 ec 0c             	sub    $0xc,%esp
801083d3:	6a 0a                	push   $0xa
801083d5:	e8 d6 af ff ff       	call   801033b0 <microdelay>
801083da:	83 c4 10             	add    $0x10,%esp
801083dd:	83 eb 01             	sub    $0x1,%ebx
801083e0:	74 07                	je     801083e9 <uartputc.part.0+0x39>
801083e2:	89 f2                	mov    %esi,%edx
801083e4:	ec                   	in     (%dx),%al
801083e5:	a8 20                	test   $0x20,%al
801083e7:	74 e7                	je     801083d0 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801083e9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801083ee:	89 f8                	mov    %edi,%eax
801083f0:	ee                   	out    %al,(%dx)
801083f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801083f4:	5b                   	pop    %ebx
801083f5:	5e                   	pop    %esi
801083f6:	5f                   	pop    %edi
801083f7:	5d                   	pop    %ebp
801083f8:	c3                   	ret    
801083f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80108400 <uartinit>:
80108400:	55                   	push   %ebp
80108401:	31 c9                	xor    %ecx,%ecx
80108403:	89 c8                	mov    %ecx,%eax
80108405:	89 e5                	mov    %esp,%ebp
80108407:	57                   	push   %edi
80108408:	56                   	push   %esi
80108409:	53                   	push   %ebx
8010840a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
8010840f:	89 da                	mov    %ebx,%edx
80108411:	83 ec 0c             	sub    $0xc,%esp
80108414:	ee                   	out    %al,(%dx)
80108415:	bf fb 03 00 00       	mov    $0x3fb,%edi
8010841a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
8010841f:	89 fa                	mov    %edi,%edx
80108421:	ee                   	out    %al,(%dx)
80108422:	b8 0c 00 00 00       	mov    $0xc,%eax
80108427:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010842c:	ee                   	out    %al,(%dx)
8010842d:	be f9 03 00 00       	mov    $0x3f9,%esi
80108432:	89 c8                	mov    %ecx,%eax
80108434:	89 f2                	mov    %esi,%edx
80108436:	ee                   	out    %al,(%dx)
80108437:	b8 03 00 00 00       	mov    $0x3,%eax
8010843c:	89 fa                	mov    %edi,%edx
8010843e:	ee                   	out    %al,(%dx)
8010843f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80108444:	89 c8                	mov    %ecx,%eax
80108446:	ee                   	out    %al,(%dx)
80108447:	b8 01 00 00 00       	mov    $0x1,%eax
8010844c:	89 f2                	mov    %esi,%edx
8010844e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010844f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80108454:	ec                   	in     (%dx),%al
80108455:	3c ff                	cmp    $0xff,%al
80108457:	74 5a                	je     801084b3 <uartinit+0xb3>
80108459:	c7 05 bc 05 12 80 01 	movl   $0x1,0x801205bc
80108460:	00 00 00 
80108463:	89 da                	mov    %ebx,%edx
80108465:	ec                   	in     (%dx),%al
80108466:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010846b:	ec                   	in     (%dx),%al
8010846c:	83 ec 08             	sub    $0x8,%esp
8010846f:	bb fc f2 10 80       	mov    $0x8010f2fc,%ebx
80108474:	6a 00                	push   $0x0
80108476:	6a 04                	push   $0x4
80108478:	e8 43 a8 ff ff       	call   80102cc0 <ioapicenable>
8010847d:	83 c4 10             	add    $0x10,%esp
80108480:	b8 78 00 00 00       	mov    $0x78,%eax
80108485:	eb 13                	jmp    8010849a <uartinit+0x9a>
80108487:	89 f6                	mov    %esi,%esi
80108489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80108490:	83 c3 01             	add    $0x1,%ebx
80108493:	0f be 03             	movsbl (%ebx),%eax
80108496:	84 c0                	test   %al,%al
80108498:	74 19                	je     801084b3 <uartinit+0xb3>
8010849a:	8b 15 bc 05 12 80    	mov    0x801205bc,%edx
801084a0:	85 d2                	test   %edx,%edx
801084a2:	74 ec                	je     80108490 <uartinit+0x90>
801084a4:	83 c3 01             	add    $0x1,%ebx
801084a7:	e8 04 ff ff ff       	call   801083b0 <uartputc.part.0>
801084ac:	0f be 03             	movsbl (%ebx),%eax
801084af:	84 c0                	test   %al,%al
801084b1:	75 e7                	jne    8010849a <uartinit+0x9a>
801084b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801084b6:	5b                   	pop    %ebx
801084b7:	5e                   	pop    %esi
801084b8:	5f                   	pop    %edi
801084b9:	5d                   	pop    %ebp
801084ba:	c3                   	ret    
801084bb:	90                   	nop
801084bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801084c0 <uartputc>:
801084c0:	8b 15 bc 05 12 80    	mov    0x801205bc,%edx
801084c6:	55                   	push   %ebp
801084c7:	89 e5                	mov    %esp,%ebp
801084c9:	85 d2                	test   %edx,%edx
801084cb:	8b 45 08             	mov    0x8(%ebp),%eax
801084ce:	74 10                	je     801084e0 <uartputc+0x20>
801084d0:	5d                   	pop    %ebp
801084d1:	e9 da fe ff ff       	jmp    801083b0 <uartputc.part.0>
801084d6:	8d 76 00             	lea    0x0(%esi),%esi
801084d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801084e0:	5d                   	pop    %ebp
801084e1:	c3                   	ret    
801084e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801084e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801084f0 <uartintr>:
801084f0:	55                   	push   %ebp
801084f1:	89 e5                	mov    %esp,%ebp
801084f3:	83 ec 14             	sub    $0x14,%esp
801084f6:	68 80 83 10 80       	push   $0x80108380
801084fb:	e8 40 83 ff ff       	call   80100840 <consoleintr>
80108500:	83 c4 10             	add    $0x10,%esp
80108503:	c9                   	leave  
80108504:	c3                   	ret    

80108505 <vector0>:
80108505:	6a 00                	push   $0x0
80108507:	6a 00                	push   $0x0
80108509:	e9 eb fa ff ff       	jmp    80107ff9 <alltraps>

8010850e <vector1>:
8010850e:	6a 00                	push   $0x0
80108510:	6a 01                	push   $0x1
80108512:	e9 e2 fa ff ff       	jmp    80107ff9 <alltraps>

80108517 <vector2>:
80108517:	6a 00                	push   $0x0
80108519:	6a 02                	push   $0x2
8010851b:	e9 d9 fa ff ff       	jmp    80107ff9 <alltraps>

80108520 <vector3>:
80108520:	6a 00                	push   $0x0
80108522:	6a 03                	push   $0x3
80108524:	e9 d0 fa ff ff       	jmp    80107ff9 <alltraps>

80108529 <vector4>:
80108529:	6a 00                	push   $0x0
8010852b:	6a 04                	push   $0x4
8010852d:	e9 c7 fa ff ff       	jmp    80107ff9 <alltraps>

80108532 <vector5>:
80108532:	6a 00                	push   $0x0
80108534:	6a 05                	push   $0x5
80108536:	e9 be fa ff ff       	jmp    80107ff9 <alltraps>

8010853b <vector6>:
8010853b:	6a 00                	push   $0x0
8010853d:	6a 06                	push   $0x6
8010853f:	e9 b5 fa ff ff       	jmp    80107ff9 <alltraps>

80108544 <vector7>:
80108544:	6a 00                	push   $0x0
80108546:	6a 07                	push   $0x7
80108548:	e9 ac fa ff ff       	jmp    80107ff9 <alltraps>

8010854d <vector8>:
8010854d:	6a 08                	push   $0x8
8010854f:	e9 a5 fa ff ff       	jmp    80107ff9 <alltraps>

80108554 <vector9>:
80108554:	6a 00                	push   $0x0
80108556:	6a 09                	push   $0x9
80108558:	e9 9c fa ff ff       	jmp    80107ff9 <alltraps>

8010855d <vector10>:
8010855d:	6a 0a                	push   $0xa
8010855f:	e9 95 fa ff ff       	jmp    80107ff9 <alltraps>

80108564 <vector11>:
80108564:	6a 0b                	push   $0xb
80108566:	e9 8e fa ff ff       	jmp    80107ff9 <alltraps>

8010856b <vector12>:
8010856b:	6a 0c                	push   $0xc
8010856d:	e9 87 fa ff ff       	jmp    80107ff9 <alltraps>

80108572 <vector13>:
80108572:	6a 0d                	push   $0xd
80108574:	e9 80 fa ff ff       	jmp    80107ff9 <alltraps>

80108579 <vector14>:
80108579:	6a 0e                	push   $0xe
8010857b:	e9 79 fa ff ff       	jmp    80107ff9 <alltraps>

80108580 <vector15>:
80108580:	6a 00                	push   $0x0
80108582:	6a 0f                	push   $0xf
80108584:	e9 70 fa ff ff       	jmp    80107ff9 <alltraps>

80108589 <vector16>:
80108589:	6a 00                	push   $0x0
8010858b:	6a 10                	push   $0x10
8010858d:	e9 67 fa ff ff       	jmp    80107ff9 <alltraps>

80108592 <vector17>:
80108592:	6a 11                	push   $0x11
80108594:	e9 60 fa ff ff       	jmp    80107ff9 <alltraps>

80108599 <vector18>:
80108599:	6a 00                	push   $0x0
8010859b:	6a 12                	push   $0x12
8010859d:	e9 57 fa ff ff       	jmp    80107ff9 <alltraps>

801085a2 <vector19>:
801085a2:	6a 00                	push   $0x0
801085a4:	6a 13                	push   $0x13
801085a6:	e9 4e fa ff ff       	jmp    80107ff9 <alltraps>

801085ab <vector20>:
801085ab:	6a 00                	push   $0x0
801085ad:	6a 14                	push   $0x14
801085af:	e9 45 fa ff ff       	jmp    80107ff9 <alltraps>

801085b4 <vector21>:
801085b4:	6a 00                	push   $0x0
801085b6:	6a 15                	push   $0x15
801085b8:	e9 3c fa ff ff       	jmp    80107ff9 <alltraps>

801085bd <vector22>:
801085bd:	6a 00                	push   $0x0
801085bf:	6a 16                	push   $0x16
801085c1:	e9 33 fa ff ff       	jmp    80107ff9 <alltraps>

801085c6 <vector23>:
801085c6:	6a 00                	push   $0x0
801085c8:	6a 17                	push   $0x17
801085ca:	e9 2a fa ff ff       	jmp    80107ff9 <alltraps>

801085cf <vector24>:
801085cf:	6a 00                	push   $0x0
801085d1:	6a 18                	push   $0x18
801085d3:	e9 21 fa ff ff       	jmp    80107ff9 <alltraps>

801085d8 <vector25>:
801085d8:	6a 00                	push   $0x0
801085da:	6a 19                	push   $0x19
801085dc:	e9 18 fa ff ff       	jmp    80107ff9 <alltraps>

801085e1 <vector26>:
801085e1:	6a 00                	push   $0x0
801085e3:	6a 1a                	push   $0x1a
801085e5:	e9 0f fa ff ff       	jmp    80107ff9 <alltraps>

801085ea <vector27>:
801085ea:	6a 00                	push   $0x0
801085ec:	6a 1b                	push   $0x1b
801085ee:	e9 06 fa ff ff       	jmp    80107ff9 <alltraps>

801085f3 <vector28>:
801085f3:	6a 00                	push   $0x0
801085f5:	6a 1c                	push   $0x1c
801085f7:	e9 fd f9 ff ff       	jmp    80107ff9 <alltraps>

801085fc <vector29>:
801085fc:	6a 00                	push   $0x0
801085fe:	6a 1d                	push   $0x1d
80108600:	e9 f4 f9 ff ff       	jmp    80107ff9 <alltraps>

80108605 <vector30>:
80108605:	6a 00                	push   $0x0
80108607:	6a 1e                	push   $0x1e
80108609:	e9 eb f9 ff ff       	jmp    80107ff9 <alltraps>

8010860e <vector31>:
8010860e:	6a 00                	push   $0x0
80108610:	6a 1f                	push   $0x1f
80108612:	e9 e2 f9 ff ff       	jmp    80107ff9 <alltraps>

80108617 <vector32>:
80108617:	6a 00                	push   $0x0
80108619:	6a 20                	push   $0x20
8010861b:	e9 d9 f9 ff ff       	jmp    80107ff9 <alltraps>

80108620 <vector33>:
80108620:	6a 00                	push   $0x0
80108622:	6a 21                	push   $0x21
80108624:	e9 d0 f9 ff ff       	jmp    80107ff9 <alltraps>

80108629 <vector34>:
80108629:	6a 00                	push   $0x0
8010862b:	6a 22                	push   $0x22
8010862d:	e9 c7 f9 ff ff       	jmp    80107ff9 <alltraps>

80108632 <vector35>:
80108632:	6a 00                	push   $0x0
80108634:	6a 23                	push   $0x23
80108636:	e9 be f9 ff ff       	jmp    80107ff9 <alltraps>

8010863b <vector36>:
8010863b:	6a 00                	push   $0x0
8010863d:	6a 24                	push   $0x24
8010863f:	e9 b5 f9 ff ff       	jmp    80107ff9 <alltraps>

80108644 <vector37>:
80108644:	6a 00                	push   $0x0
80108646:	6a 25                	push   $0x25
80108648:	e9 ac f9 ff ff       	jmp    80107ff9 <alltraps>

8010864d <vector38>:
8010864d:	6a 00                	push   $0x0
8010864f:	6a 26                	push   $0x26
80108651:	e9 a3 f9 ff ff       	jmp    80107ff9 <alltraps>

80108656 <vector39>:
80108656:	6a 00                	push   $0x0
80108658:	6a 27                	push   $0x27
8010865a:	e9 9a f9 ff ff       	jmp    80107ff9 <alltraps>

8010865f <vector40>:
8010865f:	6a 00                	push   $0x0
80108661:	6a 28                	push   $0x28
80108663:	e9 91 f9 ff ff       	jmp    80107ff9 <alltraps>

80108668 <vector41>:
80108668:	6a 00                	push   $0x0
8010866a:	6a 29                	push   $0x29
8010866c:	e9 88 f9 ff ff       	jmp    80107ff9 <alltraps>

80108671 <vector42>:
80108671:	6a 00                	push   $0x0
80108673:	6a 2a                	push   $0x2a
80108675:	e9 7f f9 ff ff       	jmp    80107ff9 <alltraps>

8010867a <vector43>:
8010867a:	6a 00                	push   $0x0
8010867c:	6a 2b                	push   $0x2b
8010867e:	e9 76 f9 ff ff       	jmp    80107ff9 <alltraps>

80108683 <vector44>:
80108683:	6a 00                	push   $0x0
80108685:	6a 2c                	push   $0x2c
80108687:	e9 6d f9 ff ff       	jmp    80107ff9 <alltraps>

8010868c <vector45>:
8010868c:	6a 00                	push   $0x0
8010868e:	6a 2d                	push   $0x2d
80108690:	e9 64 f9 ff ff       	jmp    80107ff9 <alltraps>

80108695 <vector46>:
80108695:	6a 00                	push   $0x0
80108697:	6a 2e                	push   $0x2e
80108699:	e9 5b f9 ff ff       	jmp    80107ff9 <alltraps>

8010869e <vector47>:
8010869e:	6a 00                	push   $0x0
801086a0:	6a 2f                	push   $0x2f
801086a2:	e9 52 f9 ff ff       	jmp    80107ff9 <alltraps>

801086a7 <vector48>:
801086a7:	6a 00                	push   $0x0
801086a9:	6a 30                	push   $0x30
801086ab:	e9 49 f9 ff ff       	jmp    80107ff9 <alltraps>

801086b0 <vector49>:
801086b0:	6a 00                	push   $0x0
801086b2:	6a 31                	push   $0x31
801086b4:	e9 40 f9 ff ff       	jmp    80107ff9 <alltraps>

801086b9 <vector50>:
801086b9:	6a 00                	push   $0x0
801086bb:	6a 32                	push   $0x32
801086bd:	e9 37 f9 ff ff       	jmp    80107ff9 <alltraps>

801086c2 <vector51>:
801086c2:	6a 00                	push   $0x0
801086c4:	6a 33                	push   $0x33
801086c6:	e9 2e f9 ff ff       	jmp    80107ff9 <alltraps>

801086cb <vector52>:
801086cb:	6a 00                	push   $0x0
801086cd:	6a 34                	push   $0x34
801086cf:	e9 25 f9 ff ff       	jmp    80107ff9 <alltraps>

801086d4 <vector53>:
801086d4:	6a 00                	push   $0x0
801086d6:	6a 35                	push   $0x35
801086d8:	e9 1c f9 ff ff       	jmp    80107ff9 <alltraps>

801086dd <vector54>:
801086dd:	6a 00                	push   $0x0
801086df:	6a 36                	push   $0x36
801086e1:	e9 13 f9 ff ff       	jmp    80107ff9 <alltraps>

801086e6 <vector55>:
801086e6:	6a 00                	push   $0x0
801086e8:	6a 37                	push   $0x37
801086ea:	e9 0a f9 ff ff       	jmp    80107ff9 <alltraps>

801086ef <vector56>:
801086ef:	6a 00                	push   $0x0
801086f1:	6a 38                	push   $0x38
801086f3:	e9 01 f9 ff ff       	jmp    80107ff9 <alltraps>

801086f8 <vector57>:
801086f8:	6a 00                	push   $0x0
801086fa:	6a 39                	push   $0x39
801086fc:	e9 f8 f8 ff ff       	jmp    80107ff9 <alltraps>

80108701 <vector58>:
80108701:	6a 00                	push   $0x0
80108703:	6a 3a                	push   $0x3a
80108705:	e9 ef f8 ff ff       	jmp    80107ff9 <alltraps>

8010870a <vector59>:
8010870a:	6a 00                	push   $0x0
8010870c:	6a 3b                	push   $0x3b
8010870e:	e9 e6 f8 ff ff       	jmp    80107ff9 <alltraps>

80108713 <vector60>:
80108713:	6a 00                	push   $0x0
80108715:	6a 3c                	push   $0x3c
80108717:	e9 dd f8 ff ff       	jmp    80107ff9 <alltraps>

8010871c <vector61>:
8010871c:	6a 00                	push   $0x0
8010871e:	6a 3d                	push   $0x3d
80108720:	e9 d4 f8 ff ff       	jmp    80107ff9 <alltraps>

80108725 <vector62>:
80108725:	6a 00                	push   $0x0
80108727:	6a 3e                	push   $0x3e
80108729:	e9 cb f8 ff ff       	jmp    80107ff9 <alltraps>

8010872e <vector63>:
8010872e:	6a 00                	push   $0x0
80108730:	6a 3f                	push   $0x3f
80108732:	e9 c2 f8 ff ff       	jmp    80107ff9 <alltraps>

80108737 <vector64>:
80108737:	6a 00                	push   $0x0
80108739:	6a 40                	push   $0x40
8010873b:	e9 b9 f8 ff ff       	jmp    80107ff9 <alltraps>

80108740 <vector65>:
80108740:	6a 00                	push   $0x0
80108742:	6a 41                	push   $0x41
80108744:	e9 b0 f8 ff ff       	jmp    80107ff9 <alltraps>

80108749 <vector66>:
80108749:	6a 00                	push   $0x0
8010874b:	6a 42                	push   $0x42
8010874d:	e9 a7 f8 ff ff       	jmp    80107ff9 <alltraps>

80108752 <vector67>:
80108752:	6a 00                	push   $0x0
80108754:	6a 43                	push   $0x43
80108756:	e9 9e f8 ff ff       	jmp    80107ff9 <alltraps>

8010875b <vector68>:
8010875b:	6a 00                	push   $0x0
8010875d:	6a 44                	push   $0x44
8010875f:	e9 95 f8 ff ff       	jmp    80107ff9 <alltraps>

80108764 <vector69>:
80108764:	6a 00                	push   $0x0
80108766:	6a 45                	push   $0x45
80108768:	e9 8c f8 ff ff       	jmp    80107ff9 <alltraps>

8010876d <vector70>:
8010876d:	6a 00                	push   $0x0
8010876f:	6a 46                	push   $0x46
80108771:	e9 83 f8 ff ff       	jmp    80107ff9 <alltraps>

80108776 <vector71>:
80108776:	6a 00                	push   $0x0
80108778:	6a 47                	push   $0x47
8010877a:	e9 7a f8 ff ff       	jmp    80107ff9 <alltraps>

8010877f <vector72>:
8010877f:	6a 00                	push   $0x0
80108781:	6a 48                	push   $0x48
80108783:	e9 71 f8 ff ff       	jmp    80107ff9 <alltraps>

80108788 <vector73>:
80108788:	6a 00                	push   $0x0
8010878a:	6a 49                	push   $0x49
8010878c:	e9 68 f8 ff ff       	jmp    80107ff9 <alltraps>

80108791 <vector74>:
80108791:	6a 00                	push   $0x0
80108793:	6a 4a                	push   $0x4a
80108795:	e9 5f f8 ff ff       	jmp    80107ff9 <alltraps>

8010879a <vector75>:
8010879a:	6a 00                	push   $0x0
8010879c:	6a 4b                	push   $0x4b
8010879e:	e9 56 f8 ff ff       	jmp    80107ff9 <alltraps>

801087a3 <vector76>:
801087a3:	6a 00                	push   $0x0
801087a5:	6a 4c                	push   $0x4c
801087a7:	e9 4d f8 ff ff       	jmp    80107ff9 <alltraps>

801087ac <vector77>:
801087ac:	6a 00                	push   $0x0
801087ae:	6a 4d                	push   $0x4d
801087b0:	e9 44 f8 ff ff       	jmp    80107ff9 <alltraps>

801087b5 <vector78>:
801087b5:	6a 00                	push   $0x0
801087b7:	6a 4e                	push   $0x4e
801087b9:	e9 3b f8 ff ff       	jmp    80107ff9 <alltraps>

801087be <vector79>:
801087be:	6a 00                	push   $0x0
801087c0:	6a 4f                	push   $0x4f
801087c2:	e9 32 f8 ff ff       	jmp    80107ff9 <alltraps>

801087c7 <vector80>:
801087c7:	6a 00                	push   $0x0
801087c9:	6a 50                	push   $0x50
801087cb:	e9 29 f8 ff ff       	jmp    80107ff9 <alltraps>

801087d0 <vector81>:
801087d0:	6a 00                	push   $0x0
801087d2:	6a 51                	push   $0x51
801087d4:	e9 20 f8 ff ff       	jmp    80107ff9 <alltraps>

801087d9 <vector82>:
801087d9:	6a 00                	push   $0x0
801087db:	6a 52                	push   $0x52
801087dd:	e9 17 f8 ff ff       	jmp    80107ff9 <alltraps>

801087e2 <vector83>:
801087e2:	6a 00                	push   $0x0
801087e4:	6a 53                	push   $0x53
801087e6:	e9 0e f8 ff ff       	jmp    80107ff9 <alltraps>

801087eb <vector84>:
801087eb:	6a 00                	push   $0x0
801087ed:	6a 54                	push   $0x54
801087ef:	e9 05 f8 ff ff       	jmp    80107ff9 <alltraps>

801087f4 <vector85>:
801087f4:	6a 00                	push   $0x0
801087f6:	6a 55                	push   $0x55
801087f8:	e9 fc f7 ff ff       	jmp    80107ff9 <alltraps>

801087fd <vector86>:
801087fd:	6a 00                	push   $0x0
801087ff:	6a 56                	push   $0x56
80108801:	e9 f3 f7 ff ff       	jmp    80107ff9 <alltraps>

80108806 <vector87>:
80108806:	6a 00                	push   $0x0
80108808:	6a 57                	push   $0x57
8010880a:	e9 ea f7 ff ff       	jmp    80107ff9 <alltraps>

8010880f <vector88>:
8010880f:	6a 00                	push   $0x0
80108811:	6a 58                	push   $0x58
80108813:	e9 e1 f7 ff ff       	jmp    80107ff9 <alltraps>

80108818 <vector89>:
80108818:	6a 00                	push   $0x0
8010881a:	6a 59                	push   $0x59
8010881c:	e9 d8 f7 ff ff       	jmp    80107ff9 <alltraps>

80108821 <vector90>:
80108821:	6a 00                	push   $0x0
80108823:	6a 5a                	push   $0x5a
80108825:	e9 cf f7 ff ff       	jmp    80107ff9 <alltraps>

8010882a <vector91>:
8010882a:	6a 00                	push   $0x0
8010882c:	6a 5b                	push   $0x5b
8010882e:	e9 c6 f7 ff ff       	jmp    80107ff9 <alltraps>

80108833 <vector92>:
80108833:	6a 00                	push   $0x0
80108835:	6a 5c                	push   $0x5c
80108837:	e9 bd f7 ff ff       	jmp    80107ff9 <alltraps>

8010883c <vector93>:
8010883c:	6a 00                	push   $0x0
8010883e:	6a 5d                	push   $0x5d
80108840:	e9 b4 f7 ff ff       	jmp    80107ff9 <alltraps>

80108845 <vector94>:
80108845:	6a 00                	push   $0x0
80108847:	6a 5e                	push   $0x5e
80108849:	e9 ab f7 ff ff       	jmp    80107ff9 <alltraps>

8010884e <vector95>:
8010884e:	6a 00                	push   $0x0
80108850:	6a 5f                	push   $0x5f
80108852:	e9 a2 f7 ff ff       	jmp    80107ff9 <alltraps>

80108857 <vector96>:
80108857:	6a 00                	push   $0x0
80108859:	6a 60                	push   $0x60
8010885b:	e9 99 f7 ff ff       	jmp    80107ff9 <alltraps>

80108860 <vector97>:
80108860:	6a 00                	push   $0x0
80108862:	6a 61                	push   $0x61
80108864:	e9 90 f7 ff ff       	jmp    80107ff9 <alltraps>

80108869 <vector98>:
80108869:	6a 00                	push   $0x0
8010886b:	6a 62                	push   $0x62
8010886d:	e9 87 f7 ff ff       	jmp    80107ff9 <alltraps>

80108872 <vector99>:
80108872:	6a 00                	push   $0x0
80108874:	6a 63                	push   $0x63
80108876:	e9 7e f7 ff ff       	jmp    80107ff9 <alltraps>

8010887b <vector100>:
8010887b:	6a 00                	push   $0x0
8010887d:	6a 64                	push   $0x64
8010887f:	e9 75 f7 ff ff       	jmp    80107ff9 <alltraps>

80108884 <vector101>:
80108884:	6a 00                	push   $0x0
80108886:	6a 65                	push   $0x65
80108888:	e9 6c f7 ff ff       	jmp    80107ff9 <alltraps>

8010888d <vector102>:
8010888d:	6a 00                	push   $0x0
8010888f:	6a 66                	push   $0x66
80108891:	e9 63 f7 ff ff       	jmp    80107ff9 <alltraps>

80108896 <vector103>:
80108896:	6a 00                	push   $0x0
80108898:	6a 67                	push   $0x67
8010889a:	e9 5a f7 ff ff       	jmp    80107ff9 <alltraps>

8010889f <vector104>:
8010889f:	6a 00                	push   $0x0
801088a1:	6a 68                	push   $0x68
801088a3:	e9 51 f7 ff ff       	jmp    80107ff9 <alltraps>

801088a8 <vector105>:
801088a8:	6a 00                	push   $0x0
801088aa:	6a 69                	push   $0x69
801088ac:	e9 48 f7 ff ff       	jmp    80107ff9 <alltraps>

801088b1 <vector106>:
801088b1:	6a 00                	push   $0x0
801088b3:	6a 6a                	push   $0x6a
801088b5:	e9 3f f7 ff ff       	jmp    80107ff9 <alltraps>

801088ba <vector107>:
801088ba:	6a 00                	push   $0x0
801088bc:	6a 6b                	push   $0x6b
801088be:	e9 36 f7 ff ff       	jmp    80107ff9 <alltraps>

801088c3 <vector108>:
801088c3:	6a 00                	push   $0x0
801088c5:	6a 6c                	push   $0x6c
801088c7:	e9 2d f7 ff ff       	jmp    80107ff9 <alltraps>

801088cc <vector109>:
801088cc:	6a 00                	push   $0x0
801088ce:	6a 6d                	push   $0x6d
801088d0:	e9 24 f7 ff ff       	jmp    80107ff9 <alltraps>

801088d5 <vector110>:
801088d5:	6a 00                	push   $0x0
801088d7:	6a 6e                	push   $0x6e
801088d9:	e9 1b f7 ff ff       	jmp    80107ff9 <alltraps>

801088de <vector111>:
801088de:	6a 00                	push   $0x0
801088e0:	6a 6f                	push   $0x6f
801088e2:	e9 12 f7 ff ff       	jmp    80107ff9 <alltraps>

801088e7 <vector112>:
801088e7:	6a 00                	push   $0x0
801088e9:	6a 70                	push   $0x70
801088eb:	e9 09 f7 ff ff       	jmp    80107ff9 <alltraps>

801088f0 <vector113>:
801088f0:	6a 00                	push   $0x0
801088f2:	6a 71                	push   $0x71
801088f4:	e9 00 f7 ff ff       	jmp    80107ff9 <alltraps>

801088f9 <vector114>:
801088f9:	6a 00                	push   $0x0
801088fb:	6a 72                	push   $0x72
801088fd:	e9 f7 f6 ff ff       	jmp    80107ff9 <alltraps>

80108902 <vector115>:
80108902:	6a 00                	push   $0x0
80108904:	6a 73                	push   $0x73
80108906:	e9 ee f6 ff ff       	jmp    80107ff9 <alltraps>

8010890b <vector116>:
8010890b:	6a 00                	push   $0x0
8010890d:	6a 74                	push   $0x74
8010890f:	e9 e5 f6 ff ff       	jmp    80107ff9 <alltraps>

80108914 <vector117>:
80108914:	6a 00                	push   $0x0
80108916:	6a 75                	push   $0x75
80108918:	e9 dc f6 ff ff       	jmp    80107ff9 <alltraps>

8010891d <vector118>:
8010891d:	6a 00                	push   $0x0
8010891f:	6a 76                	push   $0x76
80108921:	e9 d3 f6 ff ff       	jmp    80107ff9 <alltraps>

80108926 <vector119>:
80108926:	6a 00                	push   $0x0
80108928:	6a 77                	push   $0x77
8010892a:	e9 ca f6 ff ff       	jmp    80107ff9 <alltraps>

8010892f <vector120>:
8010892f:	6a 00                	push   $0x0
80108931:	6a 78                	push   $0x78
80108933:	e9 c1 f6 ff ff       	jmp    80107ff9 <alltraps>

80108938 <vector121>:
80108938:	6a 00                	push   $0x0
8010893a:	6a 79                	push   $0x79
8010893c:	e9 b8 f6 ff ff       	jmp    80107ff9 <alltraps>

80108941 <vector122>:
80108941:	6a 00                	push   $0x0
80108943:	6a 7a                	push   $0x7a
80108945:	e9 af f6 ff ff       	jmp    80107ff9 <alltraps>

8010894a <vector123>:
8010894a:	6a 00                	push   $0x0
8010894c:	6a 7b                	push   $0x7b
8010894e:	e9 a6 f6 ff ff       	jmp    80107ff9 <alltraps>

80108953 <vector124>:
80108953:	6a 00                	push   $0x0
80108955:	6a 7c                	push   $0x7c
80108957:	e9 9d f6 ff ff       	jmp    80107ff9 <alltraps>

8010895c <vector125>:
8010895c:	6a 00                	push   $0x0
8010895e:	6a 7d                	push   $0x7d
80108960:	e9 94 f6 ff ff       	jmp    80107ff9 <alltraps>

80108965 <vector126>:
80108965:	6a 00                	push   $0x0
80108967:	6a 7e                	push   $0x7e
80108969:	e9 8b f6 ff ff       	jmp    80107ff9 <alltraps>

8010896e <vector127>:
8010896e:	6a 00                	push   $0x0
80108970:	6a 7f                	push   $0x7f
80108972:	e9 82 f6 ff ff       	jmp    80107ff9 <alltraps>

80108977 <vector128>:
80108977:	6a 00                	push   $0x0
80108979:	68 80 00 00 00       	push   $0x80
8010897e:	e9 76 f6 ff ff       	jmp    80107ff9 <alltraps>

80108983 <vector129>:
80108983:	6a 00                	push   $0x0
80108985:	68 81 00 00 00       	push   $0x81
8010898a:	e9 6a f6 ff ff       	jmp    80107ff9 <alltraps>

8010898f <vector130>:
8010898f:	6a 00                	push   $0x0
80108991:	68 82 00 00 00       	push   $0x82
80108996:	e9 5e f6 ff ff       	jmp    80107ff9 <alltraps>

8010899b <vector131>:
8010899b:	6a 00                	push   $0x0
8010899d:	68 83 00 00 00       	push   $0x83
801089a2:	e9 52 f6 ff ff       	jmp    80107ff9 <alltraps>

801089a7 <vector132>:
801089a7:	6a 00                	push   $0x0
801089a9:	68 84 00 00 00       	push   $0x84
801089ae:	e9 46 f6 ff ff       	jmp    80107ff9 <alltraps>

801089b3 <vector133>:
801089b3:	6a 00                	push   $0x0
801089b5:	68 85 00 00 00       	push   $0x85
801089ba:	e9 3a f6 ff ff       	jmp    80107ff9 <alltraps>

801089bf <vector134>:
801089bf:	6a 00                	push   $0x0
801089c1:	68 86 00 00 00       	push   $0x86
801089c6:	e9 2e f6 ff ff       	jmp    80107ff9 <alltraps>

801089cb <vector135>:
801089cb:	6a 00                	push   $0x0
801089cd:	68 87 00 00 00       	push   $0x87
801089d2:	e9 22 f6 ff ff       	jmp    80107ff9 <alltraps>

801089d7 <vector136>:
801089d7:	6a 00                	push   $0x0
801089d9:	68 88 00 00 00       	push   $0x88
801089de:	e9 16 f6 ff ff       	jmp    80107ff9 <alltraps>

801089e3 <vector137>:
801089e3:	6a 00                	push   $0x0
801089e5:	68 89 00 00 00       	push   $0x89
801089ea:	e9 0a f6 ff ff       	jmp    80107ff9 <alltraps>

801089ef <vector138>:
801089ef:	6a 00                	push   $0x0
801089f1:	68 8a 00 00 00       	push   $0x8a
801089f6:	e9 fe f5 ff ff       	jmp    80107ff9 <alltraps>

801089fb <vector139>:
801089fb:	6a 00                	push   $0x0
801089fd:	68 8b 00 00 00       	push   $0x8b
80108a02:	e9 f2 f5 ff ff       	jmp    80107ff9 <alltraps>

80108a07 <vector140>:
80108a07:	6a 00                	push   $0x0
80108a09:	68 8c 00 00 00       	push   $0x8c
80108a0e:	e9 e6 f5 ff ff       	jmp    80107ff9 <alltraps>

80108a13 <vector141>:
80108a13:	6a 00                	push   $0x0
80108a15:	68 8d 00 00 00       	push   $0x8d
80108a1a:	e9 da f5 ff ff       	jmp    80107ff9 <alltraps>

80108a1f <vector142>:
80108a1f:	6a 00                	push   $0x0
80108a21:	68 8e 00 00 00       	push   $0x8e
80108a26:	e9 ce f5 ff ff       	jmp    80107ff9 <alltraps>

80108a2b <vector143>:
80108a2b:	6a 00                	push   $0x0
80108a2d:	68 8f 00 00 00       	push   $0x8f
80108a32:	e9 c2 f5 ff ff       	jmp    80107ff9 <alltraps>

80108a37 <vector144>:
80108a37:	6a 00                	push   $0x0
80108a39:	68 90 00 00 00       	push   $0x90
80108a3e:	e9 b6 f5 ff ff       	jmp    80107ff9 <alltraps>

80108a43 <vector145>:
80108a43:	6a 00                	push   $0x0
80108a45:	68 91 00 00 00       	push   $0x91
80108a4a:	e9 aa f5 ff ff       	jmp    80107ff9 <alltraps>

80108a4f <vector146>:
80108a4f:	6a 00                	push   $0x0
80108a51:	68 92 00 00 00       	push   $0x92
80108a56:	e9 9e f5 ff ff       	jmp    80107ff9 <alltraps>

80108a5b <vector147>:
80108a5b:	6a 00                	push   $0x0
80108a5d:	68 93 00 00 00       	push   $0x93
80108a62:	e9 92 f5 ff ff       	jmp    80107ff9 <alltraps>

80108a67 <vector148>:
80108a67:	6a 00                	push   $0x0
80108a69:	68 94 00 00 00       	push   $0x94
80108a6e:	e9 86 f5 ff ff       	jmp    80107ff9 <alltraps>

80108a73 <vector149>:
80108a73:	6a 00                	push   $0x0
80108a75:	68 95 00 00 00       	push   $0x95
80108a7a:	e9 7a f5 ff ff       	jmp    80107ff9 <alltraps>

80108a7f <vector150>:
80108a7f:	6a 00                	push   $0x0
80108a81:	68 96 00 00 00       	push   $0x96
80108a86:	e9 6e f5 ff ff       	jmp    80107ff9 <alltraps>

80108a8b <vector151>:
80108a8b:	6a 00                	push   $0x0
80108a8d:	68 97 00 00 00       	push   $0x97
80108a92:	e9 62 f5 ff ff       	jmp    80107ff9 <alltraps>

80108a97 <vector152>:
80108a97:	6a 00                	push   $0x0
80108a99:	68 98 00 00 00       	push   $0x98
80108a9e:	e9 56 f5 ff ff       	jmp    80107ff9 <alltraps>

80108aa3 <vector153>:
80108aa3:	6a 00                	push   $0x0
80108aa5:	68 99 00 00 00       	push   $0x99
80108aaa:	e9 4a f5 ff ff       	jmp    80107ff9 <alltraps>

80108aaf <vector154>:
80108aaf:	6a 00                	push   $0x0
80108ab1:	68 9a 00 00 00       	push   $0x9a
80108ab6:	e9 3e f5 ff ff       	jmp    80107ff9 <alltraps>

80108abb <vector155>:
80108abb:	6a 00                	push   $0x0
80108abd:	68 9b 00 00 00       	push   $0x9b
80108ac2:	e9 32 f5 ff ff       	jmp    80107ff9 <alltraps>

80108ac7 <vector156>:
80108ac7:	6a 00                	push   $0x0
80108ac9:	68 9c 00 00 00       	push   $0x9c
80108ace:	e9 26 f5 ff ff       	jmp    80107ff9 <alltraps>

80108ad3 <vector157>:
80108ad3:	6a 00                	push   $0x0
80108ad5:	68 9d 00 00 00       	push   $0x9d
80108ada:	e9 1a f5 ff ff       	jmp    80107ff9 <alltraps>

80108adf <vector158>:
80108adf:	6a 00                	push   $0x0
80108ae1:	68 9e 00 00 00       	push   $0x9e
80108ae6:	e9 0e f5 ff ff       	jmp    80107ff9 <alltraps>

80108aeb <vector159>:
80108aeb:	6a 00                	push   $0x0
80108aed:	68 9f 00 00 00       	push   $0x9f
80108af2:	e9 02 f5 ff ff       	jmp    80107ff9 <alltraps>

80108af7 <vector160>:
80108af7:	6a 00                	push   $0x0
80108af9:	68 a0 00 00 00       	push   $0xa0
80108afe:	e9 f6 f4 ff ff       	jmp    80107ff9 <alltraps>

80108b03 <vector161>:
80108b03:	6a 00                	push   $0x0
80108b05:	68 a1 00 00 00       	push   $0xa1
80108b0a:	e9 ea f4 ff ff       	jmp    80107ff9 <alltraps>

80108b0f <vector162>:
80108b0f:	6a 00                	push   $0x0
80108b11:	68 a2 00 00 00       	push   $0xa2
80108b16:	e9 de f4 ff ff       	jmp    80107ff9 <alltraps>

80108b1b <vector163>:
80108b1b:	6a 00                	push   $0x0
80108b1d:	68 a3 00 00 00       	push   $0xa3
80108b22:	e9 d2 f4 ff ff       	jmp    80107ff9 <alltraps>

80108b27 <vector164>:
80108b27:	6a 00                	push   $0x0
80108b29:	68 a4 00 00 00       	push   $0xa4
80108b2e:	e9 c6 f4 ff ff       	jmp    80107ff9 <alltraps>

80108b33 <vector165>:
80108b33:	6a 00                	push   $0x0
80108b35:	68 a5 00 00 00       	push   $0xa5
80108b3a:	e9 ba f4 ff ff       	jmp    80107ff9 <alltraps>

80108b3f <vector166>:
80108b3f:	6a 00                	push   $0x0
80108b41:	68 a6 00 00 00       	push   $0xa6
80108b46:	e9 ae f4 ff ff       	jmp    80107ff9 <alltraps>

80108b4b <vector167>:
80108b4b:	6a 00                	push   $0x0
80108b4d:	68 a7 00 00 00       	push   $0xa7
80108b52:	e9 a2 f4 ff ff       	jmp    80107ff9 <alltraps>

80108b57 <vector168>:
80108b57:	6a 00                	push   $0x0
80108b59:	68 a8 00 00 00       	push   $0xa8
80108b5e:	e9 96 f4 ff ff       	jmp    80107ff9 <alltraps>

80108b63 <vector169>:
80108b63:	6a 00                	push   $0x0
80108b65:	68 a9 00 00 00       	push   $0xa9
80108b6a:	e9 8a f4 ff ff       	jmp    80107ff9 <alltraps>

80108b6f <vector170>:
80108b6f:	6a 00                	push   $0x0
80108b71:	68 aa 00 00 00       	push   $0xaa
80108b76:	e9 7e f4 ff ff       	jmp    80107ff9 <alltraps>

80108b7b <vector171>:
80108b7b:	6a 00                	push   $0x0
80108b7d:	68 ab 00 00 00       	push   $0xab
80108b82:	e9 72 f4 ff ff       	jmp    80107ff9 <alltraps>

80108b87 <vector172>:
80108b87:	6a 00                	push   $0x0
80108b89:	68 ac 00 00 00       	push   $0xac
80108b8e:	e9 66 f4 ff ff       	jmp    80107ff9 <alltraps>

80108b93 <vector173>:
80108b93:	6a 00                	push   $0x0
80108b95:	68 ad 00 00 00       	push   $0xad
80108b9a:	e9 5a f4 ff ff       	jmp    80107ff9 <alltraps>

80108b9f <vector174>:
80108b9f:	6a 00                	push   $0x0
80108ba1:	68 ae 00 00 00       	push   $0xae
80108ba6:	e9 4e f4 ff ff       	jmp    80107ff9 <alltraps>

80108bab <vector175>:
80108bab:	6a 00                	push   $0x0
80108bad:	68 af 00 00 00       	push   $0xaf
80108bb2:	e9 42 f4 ff ff       	jmp    80107ff9 <alltraps>

80108bb7 <vector176>:
80108bb7:	6a 00                	push   $0x0
80108bb9:	68 b0 00 00 00       	push   $0xb0
80108bbe:	e9 36 f4 ff ff       	jmp    80107ff9 <alltraps>

80108bc3 <vector177>:
80108bc3:	6a 00                	push   $0x0
80108bc5:	68 b1 00 00 00       	push   $0xb1
80108bca:	e9 2a f4 ff ff       	jmp    80107ff9 <alltraps>

80108bcf <vector178>:
80108bcf:	6a 00                	push   $0x0
80108bd1:	68 b2 00 00 00       	push   $0xb2
80108bd6:	e9 1e f4 ff ff       	jmp    80107ff9 <alltraps>

80108bdb <vector179>:
80108bdb:	6a 00                	push   $0x0
80108bdd:	68 b3 00 00 00       	push   $0xb3
80108be2:	e9 12 f4 ff ff       	jmp    80107ff9 <alltraps>

80108be7 <vector180>:
80108be7:	6a 00                	push   $0x0
80108be9:	68 b4 00 00 00       	push   $0xb4
80108bee:	e9 06 f4 ff ff       	jmp    80107ff9 <alltraps>

80108bf3 <vector181>:
80108bf3:	6a 00                	push   $0x0
80108bf5:	68 b5 00 00 00       	push   $0xb5
80108bfa:	e9 fa f3 ff ff       	jmp    80107ff9 <alltraps>

80108bff <vector182>:
80108bff:	6a 00                	push   $0x0
80108c01:	68 b6 00 00 00       	push   $0xb6
80108c06:	e9 ee f3 ff ff       	jmp    80107ff9 <alltraps>

80108c0b <vector183>:
80108c0b:	6a 00                	push   $0x0
80108c0d:	68 b7 00 00 00       	push   $0xb7
80108c12:	e9 e2 f3 ff ff       	jmp    80107ff9 <alltraps>

80108c17 <vector184>:
80108c17:	6a 00                	push   $0x0
80108c19:	68 b8 00 00 00       	push   $0xb8
80108c1e:	e9 d6 f3 ff ff       	jmp    80107ff9 <alltraps>

80108c23 <vector185>:
80108c23:	6a 00                	push   $0x0
80108c25:	68 b9 00 00 00       	push   $0xb9
80108c2a:	e9 ca f3 ff ff       	jmp    80107ff9 <alltraps>

80108c2f <vector186>:
80108c2f:	6a 00                	push   $0x0
80108c31:	68 ba 00 00 00       	push   $0xba
80108c36:	e9 be f3 ff ff       	jmp    80107ff9 <alltraps>

80108c3b <vector187>:
80108c3b:	6a 00                	push   $0x0
80108c3d:	68 bb 00 00 00       	push   $0xbb
80108c42:	e9 b2 f3 ff ff       	jmp    80107ff9 <alltraps>

80108c47 <vector188>:
80108c47:	6a 00                	push   $0x0
80108c49:	68 bc 00 00 00       	push   $0xbc
80108c4e:	e9 a6 f3 ff ff       	jmp    80107ff9 <alltraps>

80108c53 <vector189>:
80108c53:	6a 00                	push   $0x0
80108c55:	68 bd 00 00 00       	push   $0xbd
80108c5a:	e9 9a f3 ff ff       	jmp    80107ff9 <alltraps>

80108c5f <vector190>:
80108c5f:	6a 00                	push   $0x0
80108c61:	68 be 00 00 00       	push   $0xbe
80108c66:	e9 8e f3 ff ff       	jmp    80107ff9 <alltraps>

80108c6b <vector191>:
80108c6b:	6a 00                	push   $0x0
80108c6d:	68 bf 00 00 00       	push   $0xbf
80108c72:	e9 82 f3 ff ff       	jmp    80107ff9 <alltraps>

80108c77 <vector192>:
80108c77:	6a 00                	push   $0x0
80108c79:	68 c0 00 00 00       	push   $0xc0
80108c7e:	e9 76 f3 ff ff       	jmp    80107ff9 <alltraps>

80108c83 <vector193>:
80108c83:	6a 00                	push   $0x0
80108c85:	68 c1 00 00 00       	push   $0xc1
80108c8a:	e9 6a f3 ff ff       	jmp    80107ff9 <alltraps>

80108c8f <vector194>:
80108c8f:	6a 00                	push   $0x0
80108c91:	68 c2 00 00 00       	push   $0xc2
80108c96:	e9 5e f3 ff ff       	jmp    80107ff9 <alltraps>

80108c9b <vector195>:
80108c9b:	6a 00                	push   $0x0
80108c9d:	68 c3 00 00 00       	push   $0xc3
80108ca2:	e9 52 f3 ff ff       	jmp    80107ff9 <alltraps>

80108ca7 <vector196>:
80108ca7:	6a 00                	push   $0x0
80108ca9:	68 c4 00 00 00       	push   $0xc4
80108cae:	e9 46 f3 ff ff       	jmp    80107ff9 <alltraps>

80108cb3 <vector197>:
80108cb3:	6a 00                	push   $0x0
80108cb5:	68 c5 00 00 00       	push   $0xc5
80108cba:	e9 3a f3 ff ff       	jmp    80107ff9 <alltraps>

80108cbf <vector198>:
80108cbf:	6a 00                	push   $0x0
80108cc1:	68 c6 00 00 00       	push   $0xc6
80108cc6:	e9 2e f3 ff ff       	jmp    80107ff9 <alltraps>

80108ccb <vector199>:
80108ccb:	6a 00                	push   $0x0
80108ccd:	68 c7 00 00 00       	push   $0xc7
80108cd2:	e9 22 f3 ff ff       	jmp    80107ff9 <alltraps>

80108cd7 <vector200>:
80108cd7:	6a 00                	push   $0x0
80108cd9:	68 c8 00 00 00       	push   $0xc8
80108cde:	e9 16 f3 ff ff       	jmp    80107ff9 <alltraps>

80108ce3 <vector201>:
80108ce3:	6a 00                	push   $0x0
80108ce5:	68 c9 00 00 00       	push   $0xc9
80108cea:	e9 0a f3 ff ff       	jmp    80107ff9 <alltraps>

80108cef <vector202>:
80108cef:	6a 00                	push   $0x0
80108cf1:	68 ca 00 00 00       	push   $0xca
80108cf6:	e9 fe f2 ff ff       	jmp    80107ff9 <alltraps>

80108cfb <vector203>:
80108cfb:	6a 00                	push   $0x0
80108cfd:	68 cb 00 00 00       	push   $0xcb
80108d02:	e9 f2 f2 ff ff       	jmp    80107ff9 <alltraps>

80108d07 <vector204>:
80108d07:	6a 00                	push   $0x0
80108d09:	68 cc 00 00 00       	push   $0xcc
80108d0e:	e9 e6 f2 ff ff       	jmp    80107ff9 <alltraps>

80108d13 <vector205>:
80108d13:	6a 00                	push   $0x0
80108d15:	68 cd 00 00 00       	push   $0xcd
80108d1a:	e9 da f2 ff ff       	jmp    80107ff9 <alltraps>

80108d1f <vector206>:
80108d1f:	6a 00                	push   $0x0
80108d21:	68 ce 00 00 00       	push   $0xce
80108d26:	e9 ce f2 ff ff       	jmp    80107ff9 <alltraps>

80108d2b <vector207>:
80108d2b:	6a 00                	push   $0x0
80108d2d:	68 cf 00 00 00       	push   $0xcf
80108d32:	e9 c2 f2 ff ff       	jmp    80107ff9 <alltraps>

80108d37 <vector208>:
80108d37:	6a 00                	push   $0x0
80108d39:	68 d0 00 00 00       	push   $0xd0
80108d3e:	e9 b6 f2 ff ff       	jmp    80107ff9 <alltraps>

80108d43 <vector209>:
80108d43:	6a 00                	push   $0x0
80108d45:	68 d1 00 00 00       	push   $0xd1
80108d4a:	e9 aa f2 ff ff       	jmp    80107ff9 <alltraps>

80108d4f <vector210>:
80108d4f:	6a 00                	push   $0x0
80108d51:	68 d2 00 00 00       	push   $0xd2
80108d56:	e9 9e f2 ff ff       	jmp    80107ff9 <alltraps>

80108d5b <vector211>:
80108d5b:	6a 00                	push   $0x0
80108d5d:	68 d3 00 00 00       	push   $0xd3
80108d62:	e9 92 f2 ff ff       	jmp    80107ff9 <alltraps>

80108d67 <vector212>:
80108d67:	6a 00                	push   $0x0
80108d69:	68 d4 00 00 00       	push   $0xd4
80108d6e:	e9 86 f2 ff ff       	jmp    80107ff9 <alltraps>

80108d73 <vector213>:
80108d73:	6a 00                	push   $0x0
80108d75:	68 d5 00 00 00       	push   $0xd5
80108d7a:	e9 7a f2 ff ff       	jmp    80107ff9 <alltraps>

80108d7f <vector214>:
80108d7f:	6a 00                	push   $0x0
80108d81:	68 d6 00 00 00       	push   $0xd6
80108d86:	e9 6e f2 ff ff       	jmp    80107ff9 <alltraps>

80108d8b <vector215>:
80108d8b:	6a 00                	push   $0x0
80108d8d:	68 d7 00 00 00       	push   $0xd7
80108d92:	e9 62 f2 ff ff       	jmp    80107ff9 <alltraps>

80108d97 <vector216>:
80108d97:	6a 00                	push   $0x0
80108d99:	68 d8 00 00 00       	push   $0xd8
80108d9e:	e9 56 f2 ff ff       	jmp    80107ff9 <alltraps>

80108da3 <vector217>:
80108da3:	6a 00                	push   $0x0
80108da5:	68 d9 00 00 00       	push   $0xd9
80108daa:	e9 4a f2 ff ff       	jmp    80107ff9 <alltraps>

80108daf <vector218>:
80108daf:	6a 00                	push   $0x0
80108db1:	68 da 00 00 00       	push   $0xda
80108db6:	e9 3e f2 ff ff       	jmp    80107ff9 <alltraps>

80108dbb <vector219>:
80108dbb:	6a 00                	push   $0x0
80108dbd:	68 db 00 00 00       	push   $0xdb
80108dc2:	e9 32 f2 ff ff       	jmp    80107ff9 <alltraps>

80108dc7 <vector220>:
80108dc7:	6a 00                	push   $0x0
80108dc9:	68 dc 00 00 00       	push   $0xdc
80108dce:	e9 26 f2 ff ff       	jmp    80107ff9 <alltraps>

80108dd3 <vector221>:
80108dd3:	6a 00                	push   $0x0
80108dd5:	68 dd 00 00 00       	push   $0xdd
80108dda:	e9 1a f2 ff ff       	jmp    80107ff9 <alltraps>

80108ddf <vector222>:
80108ddf:	6a 00                	push   $0x0
80108de1:	68 de 00 00 00       	push   $0xde
80108de6:	e9 0e f2 ff ff       	jmp    80107ff9 <alltraps>

80108deb <vector223>:
80108deb:	6a 00                	push   $0x0
80108ded:	68 df 00 00 00       	push   $0xdf
80108df2:	e9 02 f2 ff ff       	jmp    80107ff9 <alltraps>

80108df7 <vector224>:
80108df7:	6a 00                	push   $0x0
80108df9:	68 e0 00 00 00       	push   $0xe0
80108dfe:	e9 f6 f1 ff ff       	jmp    80107ff9 <alltraps>

80108e03 <vector225>:
80108e03:	6a 00                	push   $0x0
80108e05:	68 e1 00 00 00       	push   $0xe1
80108e0a:	e9 ea f1 ff ff       	jmp    80107ff9 <alltraps>

80108e0f <vector226>:
80108e0f:	6a 00                	push   $0x0
80108e11:	68 e2 00 00 00       	push   $0xe2
80108e16:	e9 de f1 ff ff       	jmp    80107ff9 <alltraps>

80108e1b <vector227>:
80108e1b:	6a 00                	push   $0x0
80108e1d:	68 e3 00 00 00       	push   $0xe3
80108e22:	e9 d2 f1 ff ff       	jmp    80107ff9 <alltraps>

80108e27 <vector228>:
80108e27:	6a 00                	push   $0x0
80108e29:	68 e4 00 00 00       	push   $0xe4
80108e2e:	e9 c6 f1 ff ff       	jmp    80107ff9 <alltraps>

80108e33 <vector229>:
80108e33:	6a 00                	push   $0x0
80108e35:	68 e5 00 00 00       	push   $0xe5
80108e3a:	e9 ba f1 ff ff       	jmp    80107ff9 <alltraps>

80108e3f <vector230>:
80108e3f:	6a 00                	push   $0x0
80108e41:	68 e6 00 00 00       	push   $0xe6
80108e46:	e9 ae f1 ff ff       	jmp    80107ff9 <alltraps>

80108e4b <vector231>:
80108e4b:	6a 00                	push   $0x0
80108e4d:	68 e7 00 00 00       	push   $0xe7
80108e52:	e9 a2 f1 ff ff       	jmp    80107ff9 <alltraps>

80108e57 <vector232>:
80108e57:	6a 00                	push   $0x0
80108e59:	68 e8 00 00 00       	push   $0xe8
80108e5e:	e9 96 f1 ff ff       	jmp    80107ff9 <alltraps>

80108e63 <vector233>:
80108e63:	6a 00                	push   $0x0
80108e65:	68 e9 00 00 00       	push   $0xe9
80108e6a:	e9 8a f1 ff ff       	jmp    80107ff9 <alltraps>

80108e6f <vector234>:
80108e6f:	6a 00                	push   $0x0
80108e71:	68 ea 00 00 00       	push   $0xea
80108e76:	e9 7e f1 ff ff       	jmp    80107ff9 <alltraps>

80108e7b <vector235>:
80108e7b:	6a 00                	push   $0x0
80108e7d:	68 eb 00 00 00       	push   $0xeb
80108e82:	e9 72 f1 ff ff       	jmp    80107ff9 <alltraps>

80108e87 <vector236>:
80108e87:	6a 00                	push   $0x0
80108e89:	68 ec 00 00 00       	push   $0xec
80108e8e:	e9 66 f1 ff ff       	jmp    80107ff9 <alltraps>

80108e93 <vector237>:
80108e93:	6a 00                	push   $0x0
80108e95:	68 ed 00 00 00       	push   $0xed
80108e9a:	e9 5a f1 ff ff       	jmp    80107ff9 <alltraps>

80108e9f <vector238>:
80108e9f:	6a 00                	push   $0x0
80108ea1:	68 ee 00 00 00       	push   $0xee
80108ea6:	e9 4e f1 ff ff       	jmp    80107ff9 <alltraps>

80108eab <vector239>:
80108eab:	6a 00                	push   $0x0
80108ead:	68 ef 00 00 00       	push   $0xef
80108eb2:	e9 42 f1 ff ff       	jmp    80107ff9 <alltraps>

80108eb7 <vector240>:
80108eb7:	6a 00                	push   $0x0
80108eb9:	68 f0 00 00 00       	push   $0xf0
80108ebe:	e9 36 f1 ff ff       	jmp    80107ff9 <alltraps>

80108ec3 <vector241>:
80108ec3:	6a 00                	push   $0x0
80108ec5:	68 f1 00 00 00       	push   $0xf1
80108eca:	e9 2a f1 ff ff       	jmp    80107ff9 <alltraps>

80108ecf <vector242>:
80108ecf:	6a 00                	push   $0x0
80108ed1:	68 f2 00 00 00       	push   $0xf2
80108ed6:	e9 1e f1 ff ff       	jmp    80107ff9 <alltraps>

80108edb <vector243>:
80108edb:	6a 00                	push   $0x0
80108edd:	68 f3 00 00 00       	push   $0xf3
80108ee2:	e9 12 f1 ff ff       	jmp    80107ff9 <alltraps>

80108ee7 <vector244>:
80108ee7:	6a 00                	push   $0x0
80108ee9:	68 f4 00 00 00       	push   $0xf4
80108eee:	e9 06 f1 ff ff       	jmp    80107ff9 <alltraps>

80108ef3 <vector245>:
80108ef3:	6a 00                	push   $0x0
80108ef5:	68 f5 00 00 00       	push   $0xf5
80108efa:	e9 fa f0 ff ff       	jmp    80107ff9 <alltraps>

80108eff <vector246>:
80108eff:	6a 00                	push   $0x0
80108f01:	68 f6 00 00 00       	push   $0xf6
80108f06:	e9 ee f0 ff ff       	jmp    80107ff9 <alltraps>

80108f0b <vector247>:
80108f0b:	6a 00                	push   $0x0
80108f0d:	68 f7 00 00 00       	push   $0xf7
80108f12:	e9 e2 f0 ff ff       	jmp    80107ff9 <alltraps>

80108f17 <vector248>:
80108f17:	6a 00                	push   $0x0
80108f19:	68 f8 00 00 00       	push   $0xf8
80108f1e:	e9 d6 f0 ff ff       	jmp    80107ff9 <alltraps>

80108f23 <vector249>:
80108f23:	6a 00                	push   $0x0
80108f25:	68 f9 00 00 00       	push   $0xf9
80108f2a:	e9 ca f0 ff ff       	jmp    80107ff9 <alltraps>

80108f2f <vector250>:
80108f2f:	6a 00                	push   $0x0
80108f31:	68 fa 00 00 00       	push   $0xfa
80108f36:	e9 be f0 ff ff       	jmp    80107ff9 <alltraps>

80108f3b <vector251>:
80108f3b:	6a 00                	push   $0x0
80108f3d:	68 fb 00 00 00       	push   $0xfb
80108f42:	e9 b2 f0 ff ff       	jmp    80107ff9 <alltraps>

80108f47 <vector252>:
80108f47:	6a 00                	push   $0x0
80108f49:	68 fc 00 00 00       	push   $0xfc
80108f4e:	e9 a6 f0 ff ff       	jmp    80107ff9 <alltraps>

80108f53 <vector253>:
80108f53:	6a 00                	push   $0x0
80108f55:	68 fd 00 00 00       	push   $0xfd
80108f5a:	e9 9a f0 ff ff       	jmp    80107ff9 <alltraps>

80108f5f <vector254>:
80108f5f:	6a 00                	push   $0x0
80108f61:	68 fe 00 00 00       	push   $0xfe
80108f66:	e9 8e f0 ff ff       	jmp    80107ff9 <alltraps>

80108f6b <vector255>:
80108f6b:	6a 00                	push   $0x0
80108f6d:	68 ff 00 00 00       	push   $0xff
80108f72:	e9 82 f0 ff ff       	jmp    80107ff9 <alltraps>
80108f77:	66 90                	xchg   %ax,%ax
80108f79:	66 90                	xchg   %ax,%ax
80108f7b:	66 90                	xchg   %ax,%ax
80108f7d:	66 90                	xchg   %ax,%ax
80108f7f:	90                   	nop

80108f80 <walkpgdir>:
80108f80:	55                   	push   %ebp
80108f81:	89 e5                	mov    %esp,%ebp
80108f83:	57                   	push   %edi
80108f84:	56                   	push   %esi
80108f85:	53                   	push   %ebx
80108f86:	89 d3                	mov    %edx,%ebx
80108f88:	c1 ea 16             	shr    $0x16,%edx
80108f8b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80108f8e:	83 ec 0c             	sub    $0xc,%esp
80108f91:	8b 07                	mov    (%edi),%eax
80108f93:	a8 01                	test   $0x1,%al
80108f95:	74 29                	je     80108fc0 <walkpgdir+0x40>
80108f97:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108f9c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80108fa2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108fa5:	c1 eb 0a             	shr    $0xa,%ebx
80108fa8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
80108fae:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
80108fb1:	5b                   	pop    %ebx
80108fb2:	5e                   	pop    %esi
80108fb3:	5f                   	pop    %edi
80108fb4:	5d                   	pop    %ebp
80108fb5:	c3                   	ret    
80108fb6:	8d 76 00             	lea    0x0(%esi),%esi
80108fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80108fc0:	85 c9                	test   %ecx,%ecx
80108fc2:	74 2c                	je     80108ff0 <walkpgdir+0x70>
80108fc4:	e8 07 a0 ff ff       	call   80102fd0 <kalloc>
80108fc9:	85 c0                	test   %eax,%eax
80108fcb:	89 c6                	mov    %eax,%esi
80108fcd:	74 21                	je     80108ff0 <walkpgdir+0x70>
80108fcf:	83 ec 04             	sub    $0x4,%esp
80108fd2:	68 00 10 00 00       	push   $0x1000
80108fd7:	6a 00                	push   $0x0
80108fd9:	50                   	push   %eax
80108fda:	e8 c1 d3 ff ff       	call   801063a0 <memset>
80108fdf:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80108fe5:	83 c4 10             	add    $0x10,%esp
80108fe8:	83 c8 07             	or     $0x7,%eax
80108feb:	89 07                	mov    %eax,(%edi)
80108fed:	eb b3                	jmp    80108fa2 <walkpgdir+0x22>
80108fef:	90                   	nop
80108ff0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108ff3:	31 c0                	xor    %eax,%eax
80108ff5:	5b                   	pop    %ebx
80108ff6:	5e                   	pop    %esi
80108ff7:	5f                   	pop    %edi
80108ff8:	5d                   	pop    %ebp
80108ff9:	c3                   	ret    
80108ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80109000 <mappages>:
80109000:	55                   	push   %ebp
80109001:	89 e5                	mov    %esp,%ebp
80109003:	57                   	push   %edi
80109004:	56                   	push   %esi
80109005:	53                   	push   %ebx
80109006:	89 d3                	mov    %edx,%ebx
80109008:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010900e:	83 ec 1c             	sub    $0x1c,%esp
80109011:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80109014:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80109018:	8b 7d 08             	mov    0x8(%ebp),%edi
8010901b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80109020:	89 45 e0             	mov    %eax,-0x20(%ebp)
80109023:	8b 45 0c             	mov    0xc(%ebp),%eax
80109026:	29 df                	sub    %ebx,%edi
80109028:	83 c8 01             	or     $0x1,%eax
8010902b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010902e:	eb 15                	jmp    80109045 <mappages+0x45>
80109030:	f6 00 01             	testb  $0x1,(%eax)
80109033:	75 45                	jne    8010907a <mappages+0x7a>
80109035:	0b 75 dc             	or     -0x24(%ebp),%esi
80109038:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
8010903b:	89 30                	mov    %esi,(%eax)
8010903d:	74 31                	je     80109070 <mappages+0x70>
8010903f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80109045:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80109048:	b9 01 00 00 00       	mov    $0x1,%ecx
8010904d:	89 da                	mov    %ebx,%edx
8010904f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80109052:	e8 29 ff ff ff       	call   80108f80 <walkpgdir>
80109057:	85 c0                	test   %eax,%eax
80109059:	75 d5                	jne    80109030 <mappages+0x30>
8010905b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010905e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80109063:	5b                   	pop    %ebx
80109064:	5e                   	pop    %esi
80109065:	5f                   	pop    %edi
80109066:	5d                   	pop    %ebp
80109067:	c3                   	ret    
80109068:	90                   	nop
80109069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109070:	8d 65 f4             	lea    -0xc(%ebp),%esp
80109073:	31 c0                	xor    %eax,%eax
80109075:	5b                   	pop    %ebx
80109076:	5e                   	pop    %esi
80109077:	5f                   	pop    %edi
80109078:	5d                   	pop    %ebp
80109079:	c3                   	ret    
8010907a:	83 ec 0c             	sub    $0xc,%esp
8010907d:	68 04 f3 10 80       	push   $0x8010f304
80109082:	e8 49 73 ff ff       	call   801003d0 <panic>
80109087:	89 f6                	mov    %esi,%esi
80109089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80109090 <deallocuvm.part.0>:
80109090:	55                   	push   %ebp
80109091:	89 e5                	mov    %esp,%ebp
80109093:	57                   	push   %edi
80109094:	56                   	push   %esi
80109095:	53                   	push   %ebx
80109096:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010909c:	89 c7                	mov    %eax,%edi
8010909e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801090a4:	83 ec 1c             	sub    $0x1c,%esp
801090a7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801090aa:	39 d3                	cmp    %edx,%ebx
801090ac:	73 66                	jae    80109114 <deallocuvm.part.0+0x84>
801090ae:	89 d6                	mov    %edx,%esi
801090b0:	eb 3d                	jmp    801090ef <deallocuvm.part.0+0x5f>
801090b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801090b8:	8b 10                	mov    (%eax),%edx
801090ba:	f6 c2 01             	test   $0x1,%dl
801090bd:	74 26                	je     801090e5 <deallocuvm.part.0+0x55>
801090bf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801090c5:	74 58                	je     8010911f <deallocuvm.part.0+0x8f>
801090c7:	83 ec 0c             	sub    $0xc,%esp
801090ca:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801090d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801090d3:	52                   	push   %edx
801090d4:	e8 27 9c ff ff       	call   80102d00 <kfree>
801090d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801090dc:	83 c4 10             	add    $0x10,%esp
801090df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801090e5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801090eb:	39 f3                	cmp    %esi,%ebx
801090ed:	73 25                	jae    80109114 <deallocuvm.part.0+0x84>
801090ef:	31 c9                	xor    %ecx,%ecx
801090f1:	89 da                	mov    %ebx,%edx
801090f3:	89 f8                	mov    %edi,%eax
801090f5:	e8 86 fe ff ff       	call   80108f80 <walkpgdir>
801090fa:	85 c0                	test   %eax,%eax
801090fc:	75 ba                	jne    801090b8 <deallocuvm.part.0+0x28>
801090fe:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80109104:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
8010910a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80109110:	39 f3                	cmp    %esi,%ebx
80109112:	72 db                	jb     801090ef <deallocuvm.part.0+0x5f>
80109114:	8b 45 e0             	mov    -0x20(%ebp),%eax
80109117:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010911a:	5b                   	pop    %ebx
8010911b:	5e                   	pop    %esi
8010911c:	5f                   	pop    %edi
8010911d:	5d                   	pop    %ebp
8010911e:	c3                   	ret    
8010911f:	83 ec 0c             	sub    $0xc,%esp
80109122:	68 ce e9 10 80       	push   $0x8010e9ce
80109127:	e8 a4 72 ff ff       	call   801003d0 <panic>
8010912c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80109130 <seginit>:
80109130:	55                   	push   %ebp
80109131:	89 e5                	mov    %esp,%ebp
80109133:	83 ec 18             	sub    $0x18,%esp
80109136:	e8 cd c0 ff ff       	call   80105208 <cpuid>
8010913b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80109141:	31 c9                	xor    %ecx,%ecx
80109143:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80109148:	66 89 90 78 05 13 80 	mov    %dx,-0x7fecfa88(%eax)
8010914f:	66 89 88 7a 05 13 80 	mov    %cx,-0x7fecfa86(%eax)
80109156:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010915b:	31 c9                	xor    %ecx,%ecx
8010915d:	66 89 90 80 05 13 80 	mov    %dx,-0x7fecfa80(%eax)
80109164:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80109169:	66 89 88 82 05 13 80 	mov    %cx,-0x7fecfa7e(%eax)
80109170:	31 c9                	xor    %ecx,%ecx
80109172:	66 89 90 88 05 13 80 	mov    %dx,-0x7fecfa78(%eax)
80109179:	66 89 88 8a 05 13 80 	mov    %cx,-0x7fecfa76(%eax)
80109180:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80109185:	31 c9                	xor    %ecx,%ecx
80109187:	66 89 90 90 05 13 80 	mov    %dx,-0x7fecfa70(%eax)
8010918e:	c6 80 7c 05 13 80 00 	movb   $0x0,-0x7fecfa84(%eax)
  pd[0] = size-1;
80109195:	ba 2f 00 00 00       	mov    $0x2f,%edx
8010919a:	c6 80 7d 05 13 80 9a 	movb   $0x9a,-0x7fecfa83(%eax)
801091a1:	c6 80 7e 05 13 80 cf 	movb   $0xcf,-0x7fecfa82(%eax)
801091a8:	c6 80 7f 05 13 80 00 	movb   $0x0,-0x7fecfa81(%eax)
801091af:	c6 80 84 05 13 80 00 	movb   $0x0,-0x7fecfa7c(%eax)
801091b6:	c6 80 85 05 13 80 92 	movb   $0x92,-0x7fecfa7b(%eax)
801091bd:	c6 80 86 05 13 80 cf 	movb   $0xcf,-0x7fecfa7a(%eax)
801091c4:	c6 80 87 05 13 80 00 	movb   $0x0,-0x7fecfa79(%eax)
801091cb:	c6 80 8c 05 13 80 00 	movb   $0x0,-0x7fecfa74(%eax)
801091d2:	c6 80 8d 05 13 80 fa 	movb   $0xfa,-0x7fecfa73(%eax)
801091d9:	c6 80 8e 05 13 80 cf 	movb   $0xcf,-0x7fecfa72(%eax)
801091e0:	c6 80 8f 05 13 80 00 	movb   $0x0,-0x7fecfa71(%eax)
801091e7:	66 89 88 92 05 13 80 	mov    %cx,-0x7fecfa6e(%eax)
801091ee:	c6 80 94 05 13 80 00 	movb   $0x0,-0x7fecfa6c(%eax)
801091f5:	c6 80 95 05 13 80 f2 	movb   $0xf2,-0x7fecfa6b(%eax)
801091fc:	c6 80 96 05 13 80 cf 	movb   $0xcf,-0x7fecfa6a(%eax)
80109203:	c6 80 97 05 13 80 00 	movb   $0x0,-0x7fecfa69(%eax)
8010920a:	05 70 05 13 80       	add    $0x80130570,%eax
8010920f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80109213:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80109217:	c1 e8 10             	shr    $0x10,%eax
8010921a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
8010921e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80109221:	0f 01 10             	lgdtl  (%eax)
80109224:	c9                   	leave  
80109225:	c3                   	ret    
80109226:	8d 76 00             	lea    0x0(%esi),%esi
80109229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80109230 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80109230:	a1 04 c4 13 80       	mov    0x8013c404,%eax
80109235:	55                   	push   %ebp
80109236:	89 e5                	mov    %esp,%ebp
80109238:	05 00 00 00 80       	add    $0x80000000,%eax
8010923d:	0f 22 d8             	mov    %eax,%cr3
80109240:	5d                   	pop    %ebp
80109241:	c3                   	ret    
80109242:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80109250 <switchuvm>:
80109250:	55                   	push   %ebp
80109251:	89 e5                	mov    %esp,%ebp
80109253:	57                   	push   %edi
80109254:	56                   	push   %esi
80109255:	53                   	push   %ebx
80109256:	83 ec 1c             	sub    $0x1c,%esp
80109259:	8b 75 08             	mov    0x8(%ebp),%esi
8010925c:	85 f6                	test   %esi,%esi
8010925e:	0f 84 cd 00 00 00    	je     80109331 <switchuvm+0xe1>
80109264:	8b 46 08             	mov    0x8(%esi),%eax
80109267:	85 c0                	test   %eax,%eax
80109269:	0f 84 dc 00 00 00    	je     8010934b <switchuvm+0xfb>
8010926f:	8b 7e 04             	mov    0x4(%esi),%edi
80109272:	85 ff                	test   %edi,%edi
80109274:	0f 84 c4 00 00 00    	je     8010933e <switchuvm+0xee>
8010927a:	e8 71 cf ff ff       	call   801061f0 <pushcli>
8010927f:	e8 28 bf ff ff       	call   801051ac <mycpu>
80109284:	89 c3                	mov    %eax,%ebx
80109286:	e8 21 bf ff ff       	call   801051ac <mycpu>
8010928b:	89 c7                	mov    %eax,%edi
8010928d:	e8 1a bf ff ff       	call   801051ac <mycpu>
80109292:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80109295:	83 c7 08             	add    $0x8,%edi
80109298:	e8 0f bf ff ff       	call   801051ac <mycpu>
8010929d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801092a0:	83 c0 08             	add    $0x8,%eax
801092a3:	ba 67 00 00 00       	mov    $0x67,%edx
801092a8:	c1 e8 18             	shr    $0x18,%eax
801092ab:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
801092b2:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
801092b9:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
801092c0:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
801092c7:	83 c1 08             	add    $0x8,%ecx
801092ca:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
801092d0:	c1 e9 10             	shr    $0x10,%ecx
801092d3:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
801092d9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801092de:	e8 c9 be ff ff       	call   801051ac <mycpu>
801092e3:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
801092ea:	e8 bd be ff ff       	call   801051ac <mycpu>
801092ef:	b9 10 00 00 00       	mov    $0x10,%ecx
801092f4:	66 89 48 10          	mov    %cx,0x10(%eax)
801092f8:	e8 af be ff ff       	call   801051ac <mycpu>
801092fd:	8b 56 08             	mov    0x8(%esi),%edx
80109300:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80109306:	89 48 0c             	mov    %ecx,0xc(%eax)
80109309:	e8 9e be ff ff       	call   801051ac <mycpu>
8010930e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80109312:	b8 28 00 00 00       	mov    $0x28,%eax
80109317:	0f 00 d8             	ltr    %ax
  asm volatile("movl %0,%%cr3" : : "r" (val));
8010931a:	8b 46 04             	mov    0x4(%esi),%eax
8010931d:	05 00 00 00 80       	add    $0x80000000,%eax
80109322:	0f 22 d8             	mov    %eax,%cr3
80109325:	8d 65 f4             	lea    -0xc(%ebp),%esp
80109328:	5b                   	pop    %ebx
80109329:	5e                   	pop    %esi
8010932a:	5f                   	pop    %edi
8010932b:	5d                   	pop    %ebp
8010932c:	e9 af cf ff ff       	jmp    801062e0 <popcli>
80109331:	83 ec 0c             	sub    $0xc,%esp
80109334:	68 0a f3 10 80       	push   $0x8010f30a
80109339:	e8 92 70 ff ff       	call   801003d0 <panic>
8010933e:	83 ec 0c             	sub    $0xc,%esp
80109341:	68 35 f3 10 80       	push   $0x8010f335
80109346:	e8 85 70 ff ff       	call   801003d0 <panic>
8010934b:	83 ec 0c             	sub    $0xc,%esp
8010934e:	68 20 f3 10 80       	push   $0x8010f320
80109353:	e8 78 70 ff ff       	call   801003d0 <panic>
80109358:	90                   	nop
80109359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80109360 <inituvm>:
80109360:	55                   	push   %ebp
80109361:	89 e5                	mov    %esp,%ebp
80109363:	57                   	push   %edi
80109364:	56                   	push   %esi
80109365:	53                   	push   %ebx
80109366:	83 ec 1c             	sub    $0x1c,%esp
80109369:	8b 75 10             	mov    0x10(%ebp),%esi
8010936c:	8b 45 08             	mov    0x8(%ebp),%eax
8010936f:	8b 7d 0c             	mov    0xc(%ebp),%edi
80109372:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80109378:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010937b:	77 49                	ja     801093c6 <inituvm+0x66>
8010937d:	e8 4e 9c ff ff       	call   80102fd0 <kalloc>
80109382:	83 ec 04             	sub    $0x4,%esp
80109385:	89 c3                	mov    %eax,%ebx
80109387:	68 00 10 00 00       	push   $0x1000
8010938c:	6a 00                	push   $0x0
8010938e:	50                   	push   %eax
8010938f:	e8 0c d0 ff ff       	call   801063a0 <memset>
80109394:	58                   	pop    %eax
80109395:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010939b:	b9 00 10 00 00       	mov    $0x1000,%ecx
801093a0:	5a                   	pop    %edx
801093a1:	6a 06                	push   $0x6
801093a3:	50                   	push   %eax
801093a4:	31 d2                	xor    %edx,%edx
801093a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801093a9:	e8 52 fc ff ff       	call   80109000 <mappages>
801093ae:	89 75 10             	mov    %esi,0x10(%ebp)
801093b1:	89 7d 0c             	mov    %edi,0xc(%ebp)
801093b4:	83 c4 10             	add    $0x10,%esp
801093b7:	89 5d 08             	mov    %ebx,0x8(%ebp)
801093ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801093bd:	5b                   	pop    %ebx
801093be:	5e                   	pop    %esi
801093bf:	5f                   	pop    %edi
801093c0:	5d                   	pop    %ebp
801093c1:	e9 8a d0 ff ff       	jmp    80106450 <memmove>
801093c6:	83 ec 0c             	sub    $0xc,%esp
801093c9:	68 49 f3 10 80       	push   $0x8010f349
801093ce:	e8 fd 6f ff ff       	call   801003d0 <panic>
801093d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801093d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801093e0 <loaduvm>:
801093e0:	55                   	push   %ebp
801093e1:	89 e5                	mov    %esp,%ebp
801093e3:	57                   	push   %edi
801093e4:	56                   	push   %esi
801093e5:	53                   	push   %ebx
801093e6:	83 ec 0c             	sub    $0xc,%esp
801093e9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
801093f0:	0f 85 91 00 00 00    	jne    80109487 <loaduvm+0xa7>
801093f6:	8b 75 18             	mov    0x18(%ebp),%esi
801093f9:	31 db                	xor    %ebx,%ebx
801093fb:	85 f6                	test   %esi,%esi
801093fd:	75 1a                	jne    80109419 <loaduvm+0x39>
801093ff:	eb 6f                	jmp    80109470 <loaduvm+0x90>
80109401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109408:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010940e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80109414:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80109417:	76 57                	jbe    80109470 <loaduvm+0x90>
80109419:	8b 55 0c             	mov    0xc(%ebp),%edx
8010941c:	8b 45 08             	mov    0x8(%ebp),%eax
8010941f:	31 c9                	xor    %ecx,%ecx
80109421:	01 da                	add    %ebx,%edx
80109423:	e8 58 fb ff ff       	call   80108f80 <walkpgdir>
80109428:	85 c0                	test   %eax,%eax
8010942a:	74 4e                	je     8010947a <loaduvm+0x9a>
8010942c:	8b 00                	mov    (%eax),%eax
8010942e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80109431:	bf 00 10 00 00       	mov    $0x1000,%edi
80109436:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010943b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80109441:	0f 46 fe             	cmovbe %esi,%edi
80109444:	01 d9                	add    %ebx,%ecx
80109446:	05 00 00 00 80       	add    $0x80000000,%eax
8010944b:	57                   	push   %edi
8010944c:	51                   	push   %ecx
8010944d:	50                   	push   %eax
8010944e:	ff 75 10             	pushl  0x10(%ebp)
80109451:	e8 6a 8d ff ff       	call   801021c0 <readi>
80109456:	83 c4 10             	add    $0x10,%esp
80109459:	39 c7                	cmp    %eax,%edi
8010945b:	74 ab                	je     80109408 <loaduvm+0x28>
8010945d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80109460:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80109465:	5b                   	pop    %ebx
80109466:	5e                   	pop    %esi
80109467:	5f                   	pop    %edi
80109468:	5d                   	pop    %ebp
80109469:	c3                   	ret    
8010946a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80109470:	8d 65 f4             	lea    -0xc(%ebp),%esp
80109473:	31 c0                	xor    %eax,%eax
80109475:	5b                   	pop    %ebx
80109476:	5e                   	pop    %esi
80109477:	5f                   	pop    %edi
80109478:	5d                   	pop    %ebp
80109479:	c3                   	ret    
8010947a:	83 ec 0c             	sub    $0xc,%esp
8010947d:	68 63 f3 10 80       	push   $0x8010f363
80109482:	e8 49 6f ff ff       	call   801003d0 <panic>
80109487:	83 ec 0c             	sub    $0xc,%esp
8010948a:	68 04 f4 10 80       	push   $0x8010f404
8010948f:	e8 3c 6f ff ff       	call   801003d0 <panic>
80109494:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010949a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801094a0 <deallocuvm>:
801094a0:	55                   	push   %ebp
801094a1:	89 e5                	mov    %esp,%ebp
801094a3:	8b 55 0c             	mov    0xc(%ebp),%edx
801094a6:	8b 4d 10             	mov    0x10(%ebp),%ecx
801094a9:	8b 45 08             	mov    0x8(%ebp),%eax
801094ac:	39 d1                	cmp    %edx,%ecx
801094ae:	73 10                	jae    801094c0 <deallocuvm+0x20>
801094b0:	5d                   	pop    %ebp
801094b1:	e9 da fb ff ff       	jmp    80109090 <deallocuvm.part.0>
801094b6:	8d 76 00             	lea    0x0(%esi),%esi
801094b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801094c0:	89 d0                	mov    %edx,%eax
801094c2:	5d                   	pop    %ebp
801094c3:	c3                   	ret    
801094c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801094ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801094d0 <dec_protect_mem>:
801094d0:	55                   	push   %ebp
801094d1:	89 e5                	mov    %esp,%ebp
801094d3:	53                   	push   %ebx
801094d4:	83 ec 04             	sub    $0x4,%esp
801094d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801094da:	e8 d1 39 00 00       	call   8010ceb0 <cgroup_root>
801094df:	39 d8                	cmp    %ebx,%eax
801094e1:	b8 01 00 00 00       	mov    $0x1,%eax
801094e6:	74 13                	je     801094fb <dec_protect_mem+0x2b>
801094e8:	80 bb 13 03 00 00 00 	cmpb   $0x0,0x313(%ebx)
801094ef:	74 0a                	je     801094fb <dec_protect_mem+0x2b>
801094f1:	8b 93 58 03 00 00    	mov    0x358(%ebx),%edx
801094f7:	85 d2                	test   %edx,%edx
801094f9:	75 05                	jne    80109500 <dec_protect_mem+0x30>
801094fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801094fe:	c9                   	leave  
801094ff:	c3                   	ret    
80109500:	83 ec 0c             	sub    $0xc,%esp
80109503:	6a 01                	push   $0x1
80109505:	e8 b6 99 ff ff       	call   80102ec0 <decrese_protect_counter>
8010950a:	83 ab 58 03 00 00 01 	subl   $0x1,0x358(%ebx)
80109511:	83 c4 10             	add    $0x10,%esp
80109514:	31 c0                	xor    %eax,%eax
80109516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80109519:	c9                   	leave  
8010951a:	c3                   	ret    
8010951b:	90                   	nop
8010951c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80109520 <allocuvm>:
80109520:	55                   	push   %ebp
80109521:	89 e5                	mov    %esp,%ebp
80109523:	57                   	push   %edi
80109524:	56                   	push   %esi
80109525:	53                   	push   %ebx
80109526:	83 ec 1c             	sub    $0x1c,%esp
80109529:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010952c:	85 c9                	test   %ecx,%ecx
8010952e:	0f 88 e4 00 00 00    	js     80109618 <allocuvm+0xf8>
80109534:	8b 45 0c             	mov    0xc(%ebp),%eax
80109537:	39 45 10             	cmp    %eax,0x10(%ebp)
8010953a:	0f 82 cb 00 00 00    	jb     8010960b <allocuvm+0xeb>
80109540:	8b 45 0c             	mov    0xc(%ebp),%eax
80109543:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80109549:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010954f:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80109552:	0f 86 1f 01 00 00    	jbe    80109677 <allocuvm+0x157>
80109558:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010955f:	31 ff                	xor    %edi,%edi
80109561:	eb 4d                	jmp    801095b0 <allocuvm+0x90>
80109563:	90                   	nop
80109564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109568:	83 ec 04             	sub    $0x4,%esp
8010956b:	68 00 10 00 00       	push   $0x1000
80109570:	6a 00                	push   $0x0
80109572:	50                   	push   %eax
80109573:	e8 28 ce ff ff       	call   801063a0 <memset>
80109578:	58                   	pop    %eax
80109579:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010957f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80109584:	5a                   	pop    %edx
80109585:	6a 06                	push   $0x6
80109587:	50                   	push   %eax
80109588:	89 da                	mov    %ebx,%edx
8010958a:	8b 45 08             	mov    0x8(%ebp),%eax
8010958d:	e8 6e fa ff ff       	call   80109000 <mappages>
80109592:	83 c4 10             	add    $0x10,%esp
80109595:	85 c0                	test   %eax,%eax
80109597:	0f 88 8b 00 00 00    	js     80109628 <allocuvm+0x108>
8010959d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801095a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801095a7:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801095aa:	0f 86 b0 00 00 00    	jbe    80109660 <allocuvm+0x140>
801095b0:	83 ec 0c             	sub    $0xc,%esp
801095b3:	ff 75 14             	pushl  0x14(%ebp)
801095b6:	e8 15 ff ff ff       	call   801094d0 <dec_protect_mem>
801095bb:	83 c4 10             	add    $0x10,%esp
801095be:	83 f8 01             	cmp    $0x1,%eax
801095c1:	83 d7 00             	adc    $0x0,%edi
801095c4:	e8 07 9a ff ff       	call   80102fd0 <kalloc>
801095c9:	85 c0                	test   %eax,%eax
801095cb:	89 c6                	mov    %eax,%esi
801095cd:	75 99                	jne    80109568 <allocuvm+0x48>
801095cf:	83 ec 0c             	sub    $0xc,%esp
801095d2:	68 81 f3 10 80       	push   $0x8010f381
801095d7:	e8 84 70 ff ff       	call   80100660 <cprintf>
801095dc:	83 c4 10             	add    $0x10,%esp
801095df:	8b 45 0c             	mov    0xc(%ebp),%eax
801095e2:	39 45 10             	cmp    %eax,0x10(%ebp)
801095e5:	76 0d                	jbe    801095f4 <allocuvm+0xd4>
801095e7:	89 c1                	mov    %eax,%ecx
801095e9:	8b 55 10             	mov    0x10(%ebp),%edx
801095ec:	8b 45 08             	mov    0x8(%ebp),%eax
801095ef:	e8 9c fa ff ff       	call   80109090 <deallocuvm.part.0>
801095f4:	83 ec 0c             	sub    $0xc,%esp
801095f7:	57                   	push   %edi
801095f8:	e8 23 99 ff ff       	call   80102f20 <increse_protect_counter>
801095fd:	8b 45 14             	mov    0x14(%ebp),%eax
80109600:	83 c4 10             	add    $0x10,%esp
80109603:	01 b8 58 03 00 00    	add    %edi,0x358(%eax)
80109609:	31 c0                	xor    %eax,%eax
8010960b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010960e:	5b                   	pop    %ebx
8010960f:	5e                   	pop    %esi
80109610:	5f                   	pop    %edi
80109611:	5d                   	pop    %ebp
80109612:	c3                   	ret    
80109613:	90                   	nop
80109614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109618:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010961b:	31 c0                	xor    %eax,%eax
8010961d:	5b                   	pop    %ebx
8010961e:	5e                   	pop    %esi
8010961f:	5f                   	pop    %edi
80109620:	5d                   	pop    %ebp
80109621:	c3                   	ret    
80109622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80109628:	83 ec 0c             	sub    $0xc,%esp
8010962b:	68 99 f3 10 80       	push   $0x8010f399
80109630:	e8 2b 70 ff ff       	call   80100660 <cprintf>
80109635:	83 c4 10             	add    $0x10,%esp
80109638:	8b 45 0c             	mov    0xc(%ebp),%eax
8010963b:	39 45 10             	cmp    %eax,0x10(%ebp)
8010963e:	76 0d                	jbe    8010964d <allocuvm+0x12d>
80109640:	89 c1                	mov    %eax,%ecx
80109642:	8b 55 10             	mov    0x10(%ebp),%edx
80109645:	8b 45 08             	mov    0x8(%ebp),%eax
80109648:	e8 43 fa ff ff       	call   80109090 <deallocuvm.part.0>
8010964d:	83 ec 0c             	sub    $0xc,%esp
80109650:	56                   	push   %esi
80109651:	e8 aa 96 ff ff       	call   80102d00 <kfree>
80109656:	89 3c 24             	mov    %edi,(%esp)
80109659:	eb 9d                	jmp    801095f8 <allocuvm+0xd8>
8010965b:	90                   	nop
8010965c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109660:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80109663:	8b 55 14             	mov    0x14(%ebp),%edx
80109666:	01 82 3c 03 00 00    	add    %eax,0x33c(%edx)
8010966c:	8b 45 10             	mov    0x10(%ebp),%eax
8010966f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80109672:	5b                   	pop    %ebx
80109673:	5e                   	pop    %esi
80109674:	5f                   	pop    %edi
80109675:	5d                   	pop    %ebp
80109676:	c3                   	ret    
80109677:	31 c0                	xor    %eax,%eax
80109679:	eb e8                	jmp    80109663 <allocuvm+0x143>
8010967b:	90                   	nop
8010967c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80109680 <inc_protect_mem>:
80109680:	55                   	push   %ebp
80109681:	89 e5                	mov    %esp,%ebp
80109683:	56                   	push   %esi
80109684:	53                   	push   %ebx
80109685:	8b 75 0c             	mov    0xc(%ebp),%esi
80109688:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010968b:	83 ec 0c             	sub    $0xc,%esp
8010968e:	56                   	push   %esi
8010968f:	e8 8c 98 ff ff       	call   80102f20 <increse_protect_counter>
80109694:	01 b3 58 03 00 00    	add    %esi,0x358(%ebx)
8010969a:	83 c4 10             	add    $0x10,%esp
8010969d:	8d 65 f8             	lea    -0x8(%ebp),%esp
801096a0:	5b                   	pop    %ebx
801096a1:	5e                   	pop    %esi
801096a2:	5d                   	pop    %ebp
801096a3:	c3                   	ret    
801096a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801096aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801096b0 <freevm>:
801096b0:	55                   	push   %ebp
801096b1:	89 e5                	mov    %esp,%ebp
801096b3:	57                   	push   %edi
801096b4:	56                   	push   %esi
801096b5:	53                   	push   %ebx
801096b6:	83 ec 0c             	sub    $0xc,%esp
801096b9:	8b 75 08             	mov    0x8(%ebp),%esi
801096bc:	85 f6                	test   %esi,%esi
801096be:	74 59                	je     80109719 <freevm+0x69>
801096c0:	31 c9                	xor    %ecx,%ecx
801096c2:	ba 00 00 00 80       	mov    $0x80000000,%edx
801096c7:	89 f0                	mov    %esi,%eax
801096c9:	e8 c2 f9 ff ff       	call   80109090 <deallocuvm.part.0>
801096ce:	89 f3                	mov    %esi,%ebx
801096d0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
801096d6:	eb 0f                	jmp    801096e7 <freevm+0x37>
801096d8:	90                   	nop
801096d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801096e0:	83 c3 04             	add    $0x4,%ebx
801096e3:	39 fb                	cmp    %edi,%ebx
801096e5:	74 23                	je     8010970a <freevm+0x5a>
801096e7:	8b 03                	mov    (%ebx),%eax
801096e9:	a8 01                	test   $0x1,%al
801096eb:	74 f3                	je     801096e0 <freevm+0x30>
801096ed:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801096f2:	83 ec 0c             	sub    $0xc,%esp
801096f5:	83 c3 04             	add    $0x4,%ebx
801096f8:	05 00 00 00 80       	add    $0x80000000,%eax
801096fd:	50                   	push   %eax
801096fe:	e8 fd 95 ff ff       	call   80102d00 <kfree>
80109703:	83 c4 10             	add    $0x10,%esp
80109706:	39 fb                	cmp    %edi,%ebx
80109708:	75 dd                	jne    801096e7 <freevm+0x37>
8010970a:	89 75 08             	mov    %esi,0x8(%ebp)
8010970d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80109710:	5b                   	pop    %ebx
80109711:	5e                   	pop    %esi
80109712:	5f                   	pop    %edi
80109713:	5d                   	pop    %ebp
80109714:	e9 e7 95 ff ff       	jmp    80102d00 <kfree>
80109719:	83 ec 0c             	sub    $0xc,%esp
8010971c:	68 b5 f3 10 80       	push   $0x8010f3b5
80109721:	e8 aa 6c ff ff       	call   801003d0 <panic>
80109726:	8d 76 00             	lea    0x0(%esi),%esi
80109729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80109730 <setupkvm>:
80109730:	55                   	push   %ebp
80109731:	89 e5                	mov    %esp,%ebp
80109733:	56                   	push   %esi
80109734:	53                   	push   %ebx
80109735:	e8 96 98 ff ff       	call   80102fd0 <kalloc>
8010973a:	85 c0                	test   %eax,%eax
8010973c:	74 6a                	je     801097a8 <setupkvm+0x78>
8010973e:	83 ec 04             	sub    $0x4,%esp
80109741:	89 c6                	mov    %eax,%esi
80109743:	bb 20 04 12 80       	mov    $0x80120420,%ebx
80109748:	68 00 10 00 00       	push   $0x1000
8010974d:	6a 00                	push   $0x0
8010974f:	50                   	push   %eax
80109750:	e8 4b cc ff ff       	call   801063a0 <memset>
80109755:	83 c4 10             	add    $0x10,%esp
80109758:	8b 43 04             	mov    0x4(%ebx),%eax
8010975b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010975e:	83 ec 08             	sub    $0x8,%esp
80109761:	8b 13                	mov    (%ebx),%edx
80109763:	ff 73 0c             	pushl  0xc(%ebx)
80109766:	50                   	push   %eax
80109767:	29 c1                	sub    %eax,%ecx
80109769:	89 f0                	mov    %esi,%eax
8010976b:	e8 90 f8 ff ff       	call   80109000 <mappages>
80109770:	83 c4 10             	add    $0x10,%esp
80109773:	85 c0                	test   %eax,%eax
80109775:	78 19                	js     80109790 <setupkvm+0x60>
80109777:	83 c3 10             	add    $0x10,%ebx
8010977a:	81 fb 60 04 12 80    	cmp    $0x80120460,%ebx
80109780:	75 d6                	jne    80109758 <setupkvm+0x28>
80109782:	89 f0                	mov    %esi,%eax
80109784:	8d 65 f8             	lea    -0x8(%ebp),%esp
80109787:	5b                   	pop    %ebx
80109788:	5e                   	pop    %esi
80109789:	5d                   	pop    %ebp
8010978a:	c3                   	ret    
8010978b:	90                   	nop
8010978c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109790:	83 ec 0c             	sub    $0xc,%esp
80109793:	56                   	push   %esi
80109794:	e8 17 ff ff ff       	call   801096b0 <freevm>
80109799:	83 c4 10             	add    $0x10,%esp
8010979c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010979f:	31 c0                	xor    %eax,%eax
801097a1:	5b                   	pop    %ebx
801097a2:	5e                   	pop    %esi
801097a3:	5d                   	pop    %ebp
801097a4:	c3                   	ret    
801097a5:	8d 76 00             	lea    0x0(%esi),%esi
801097a8:	31 c0                	xor    %eax,%eax
801097aa:	eb d8                	jmp    80109784 <setupkvm+0x54>
801097ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801097b0 <kvmalloc>:
801097b0:	55                   	push   %ebp
801097b1:	89 e5                	mov    %esp,%ebp
801097b3:	83 ec 08             	sub    $0x8,%esp
801097b6:	e8 75 ff ff ff       	call   80109730 <setupkvm>
801097bb:	a3 04 c4 13 80       	mov    %eax,0x8013c404
801097c0:	05 00 00 00 80       	add    $0x80000000,%eax
801097c5:	0f 22 d8             	mov    %eax,%cr3
801097c8:	c9                   	leave  
801097c9:	c3                   	ret    
801097ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801097d0 <clearpteu>:
801097d0:	55                   	push   %ebp
801097d1:	31 c9                	xor    %ecx,%ecx
801097d3:	89 e5                	mov    %esp,%ebp
801097d5:	83 ec 08             	sub    $0x8,%esp
801097d8:	8b 55 0c             	mov    0xc(%ebp),%edx
801097db:	8b 45 08             	mov    0x8(%ebp),%eax
801097de:	e8 9d f7 ff ff       	call   80108f80 <walkpgdir>
801097e3:	85 c0                	test   %eax,%eax
801097e5:	74 05                	je     801097ec <clearpteu+0x1c>
801097e7:	83 20 fb             	andl   $0xfffffffb,(%eax)
801097ea:	c9                   	leave  
801097eb:	c3                   	ret    
801097ec:	83 ec 0c             	sub    $0xc,%esp
801097ef:	68 c6 f3 10 80       	push   $0x8010f3c6
801097f4:	e8 d7 6b ff ff       	call   801003d0 <panic>
801097f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80109800 <copyuvm>:
80109800:	55                   	push   %ebp
80109801:	89 e5                	mov    %esp,%ebp
80109803:	57                   	push   %edi
80109804:	56                   	push   %esi
80109805:	53                   	push   %ebx
80109806:	83 ec 1c             	sub    $0x1c,%esp
80109809:	e8 22 ff ff ff       	call   80109730 <setupkvm>
8010980e:	85 c0                	test   %eax,%eax
80109810:	89 45 e0             	mov    %eax,-0x20(%ebp)
80109813:	0f 84 b2 00 00 00    	je     801098cb <copyuvm+0xcb>
80109819:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010981c:	85 c9                	test   %ecx,%ecx
8010981e:	0f 84 9c 00 00 00    	je     801098c0 <copyuvm+0xc0>
80109824:	31 f6                	xor    %esi,%esi
80109826:	eb 4a                	jmp    80109872 <copyuvm+0x72>
80109828:	90                   	nop
80109829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109830:	83 ec 04             	sub    $0x4,%esp
80109833:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80109839:	68 00 10 00 00       	push   $0x1000
8010983e:	57                   	push   %edi
8010983f:	50                   	push   %eax
80109840:	e8 0b cc ff ff       	call   80106450 <memmove>
80109845:	58                   	pop    %eax
80109846:	5a                   	pop    %edx
80109847:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
8010984d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80109850:	ff 75 e4             	pushl  -0x1c(%ebp)
80109853:	b9 00 10 00 00       	mov    $0x1000,%ecx
80109858:	52                   	push   %edx
80109859:	89 f2                	mov    %esi,%edx
8010985b:	e8 a0 f7 ff ff       	call   80109000 <mappages>
80109860:	83 c4 10             	add    $0x10,%esp
80109863:	85 c0                	test   %eax,%eax
80109865:	78 3e                	js     801098a5 <copyuvm+0xa5>
80109867:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010986d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80109870:	76 4e                	jbe    801098c0 <copyuvm+0xc0>
80109872:	8b 45 08             	mov    0x8(%ebp),%eax
80109875:	31 c9                	xor    %ecx,%ecx
80109877:	89 f2                	mov    %esi,%edx
80109879:	e8 02 f7 ff ff       	call   80108f80 <walkpgdir>
8010987e:	85 c0                	test   %eax,%eax
80109880:	74 5a                	je     801098dc <copyuvm+0xdc>
80109882:	8b 18                	mov    (%eax),%ebx
80109884:	f6 c3 01             	test   $0x1,%bl
80109887:	74 46                	je     801098cf <copyuvm+0xcf>
80109889:	89 df                	mov    %ebx,%edi
8010988b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80109891:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80109894:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
8010989a:	e8 31 97 ff ff       	call   80102fd0 <kalloc>
8010989f:	85 c0                	test   %eax,%eax
801098a1:	89 c3                	mov    %eax,%ebx
801098a3:	75 8b                	jne    80109830 <copyuvm+0x30>
801098a5:	83 ec 0c             	sub    $0xc,%esp
801098a8:	ff 75 e0             	pushl  -0x20(%ebp)
801098ab:	e8 00 fe ff ff       	call   801096b0 <freevm>
801098b0:	83 c4 10             	add    $0x10,%esp
801098b3:	31 c0                	xor    %eax,%eax
801098b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801098b8:	5b                   	pop    %ebx
801098b9:	5e                   	pop    %esi
801098ba:	5f                   	pop    %edi
801098bb:	5d                   	pop    %ebp
801098bc:	c3                   	ret    
801098bd:	8d 76 00             	lea    0x0(%esi),%esi
801098c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
801098c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801098c6:	5b                   	pop    %ebx
801098c7:	5e                   	pop    %esi
801098c8:	5f                   	pop    %edi
801098c9:	5d                   	pop    %ebp
801098ca:	c3                   	ret    
801098cb:	31 c0                	xor    %eax,%eax
801098cd:	eb e6                	jmp    801098b5 <copyuvm+0xb5>
801098cf:	83 ec 0c             	sub    $0xc,%esp
801098d2:	68 ea f3 10 80       	push   $0x8010f3ea
801098d7:	e8 f4 6a ff ff       	call   801003d0 <panic>
801098dc:	83 ec 0c             	sub    $0xc,%esp
801098df:	68 d0 f3 10 80       	push   $0x8010f3d0
801098e4:	e8 e7 6a ff ff       	call   801003d0 <panic>
801098e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801098f0 <uva2ka>:
801098f0:	55                   	push   %ebp
801098f1:	31 c9                	xor    %ecx,%ecx
801098f3:	89 e5                	mov    %esp,%ebp
801098f5:	83 ec 08             	sub    $0x8,%esp
801098f8:	8b 55 0c             	mov    0xc(%ebp),%edx
801098fb:	8b 45 08             	mov    0x8(%ebp),%eax
801098fe:	e8 7d f6 ff ff       	call   80108f80 <walkpgdir>
80109903:	8b 00                	mov    (%eax),%eax
80109905:	89 c2                	mov    %eax,%edx
80109907:	83 e2 05             	and    $0x5,%edx
8010990a:	83 fa 05             	cmp    $0x5,%edx
8010990d:	75 11                	jne    80109920 <uva2ka+0x30>
8010990f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80109914:	c9                   	leave  
80109915:	05 00 00 00 80       	add    $0x80000000,%eax
8010991a:	c3                   	ret    
8010991b:	90                   	nop
8010991c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109920:	31 c0                	xor    %eax,%eax
80109922:	c9                   	leave  
80109923:	c3                   	ret    
80109924:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010992a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80109930 <copyout>:
80109930:	55                   	push   %ebp
80109931:	89 e5                	mov    %esp,%ebp
80109933:	57                   	push   %edi
80109934:	56                   	push   %esi
80109935:	53                   	push   %ebx
80109936:	83 ec 1c             	sub    $0x1c,%esp
80109939:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010993c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010993f:	8b 7d 10             	mov    0x10(%ebp),%edi
80109942:	85 db                	test   %ebx,%ebx
80109944:	75 40                	jne    80109986 <copyout+0x56>
80109946:	eb 70                	jmp    801099b8 <copyout+0x88>
80109948:	90                   	nop
80109949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109950:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80109953:	89 f1                	mov    %esi,%ecx
80109955:	29 d1                	sub    %edx,%ecx
80109957:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010995d:	39 d9                	cmp    %ebx,%ecx
8010995f:	0f 47 cb             	cmova  %ebx,%ecx
80109962:	29 f2                	sub    %esi,%edx
80109964:	83 ec 04             	sub    $0x4,%esp
80109967:	01 d0                	add    %edx,%eax
80109969:	51                   	push   %ecx
8010996a:	57                   	push   %edi
8010996b:	50                   	push   %eax
8010996c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010996f:	e8 dc ca ff ff       	call   80106450 <memmove>
80109974:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80109977:	83 c4 10             	add    $0x10,%esp
8010997a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80109980:	01 cf                	add    %ecx,%edi
80109982:	29 cb                	sub    %ecx,%ebx
80109984:	74 32                	je     801099b8 <copyout+0x88>
80109986:	89 d6                	mov    %edx,%esi
80109988:	83 ec 08             	sub    $0x8,%esp
8010998b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010998e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80109994:	56                   	push   %esi
80109995:	ff 75 08             	pushl  0x8(%ebp)
80109998:	e8 53 ff ff ff       	call   801098f0 <uva2ka>
8010999d:	83 c4 10             	add    $0x10,%esp
801099a0:	85 c0                	test   %eax,%eax
801099a2:	75 ac                	jne    80109950 <copyout+0x20>
801099a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801099a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801099ac:	5b                   	pop    %ebx
801099ad:	5e                   	pop    %esi
801099ae:	5f                   	pop    %edi
801099af:	5d                   	pop    %ebp
801099b0:	c3                   	ret    
801099b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801099b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801099bb:	31 c0                	xor    %eax,%eax
801099bd:	5b                   	pop    %ebx
801099be:	5e                   	pop    %esi
801099bf:	5f                   	pop    %edi
801099c0:	5d                   	pop    %ebp
801099c1:	c3                   	ret    
801099c2:	66 90                	xchg   %ax,%ax
801099c4:	66 90                	xchg   %ax,%ax
801099c6:	66 90                	xchg   %ax,%ax
801099c8:	66 90                	xchg   %ax,%ax
801099ca:	66 90                	xchg   %ax,%ax
801099cc:	66 90                	xchg   %ax,%ax
801099ce:	66 90                	xchg   %ax,%ax

801099d0 <__udivmoddi4>:
801099d0:	55                   	push   %ebp
801099d1:	89 e5                	mov    %esp,%ebp
801099d3:	57                   	push   %edi
801099d4:	56                   	push   %esi
801099d5:	53                   	push   %ebx
801099d6:	83 ec 3c             	sub    $0x3c,%esp
801099d9:	8b 45 0c             	mov    0xc(%ebp),%eax
801099dc:	8b 55 14             	mov    0x14(%ebp),%edx
801099df:	8b 7d 08             	mov    0x8(%ebp),%edi
801099e2:	89 c3                	mov    %eax,%ebx
801099e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801099e7:	8b 45 10             	mov    0x10(%ebp),%eax
801099ea:	85 db                	test   %ebx,%ebx
801099ec:	89 d1                	mov    %edx,%ecx
801099ee:	89 55 dc             	mov    %edx,-0x24(%ebp)
801099f1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801099f4:	89 45 d8             	mov    %eax,-0x28(%ebp)
801099f7:	75 3f                	jne    80109a38 <__udivmoddi4+0x68>
801099f9:	85 d2                	test   %edx,%edx
801099fb:	0f 85 ef 00 00 00    	jne    80109af0 <__udivmoddi4+0x120>
80109a01:	8b 45 18             	mov    0x18(%ebp),%eax
80109a04:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80109a07:	89 f9                	mov    %edi,%ecx
80109a09:	85 c0                	test   %eax,%eax
80109a0b:	74 17                	je     80109a24 <__udivmoddi4+0x54>
80109a0d:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80109a10:	89 f8                	mov    %edi,%eax
80109a12:	31 d2                	xor    %edx,%edx
80109a14:	89 f9                	mov    %edi,%ecx
80109a16:	f7 f3                	div    %ebx
80109a18:	8b 45 18             	mov    0x18(%ebp),%eax
80109a1b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
80109a22:	89 10                	mov    %edx,(%eax)
80109a24:	83 c4 3c             	add    $0x3c,%esp
80109a27:	89 c8                	mov    %ecx,%eax
80109a29:	31 d2                	xor    %edx,%edx
80109a2b:	f7 f3                	div    %ebx
80109a2d:	5b                   	pop    %ebx
80109a2e:	31 d2                	xor    %edx,%edx
80109a30:	5e                   	pop    %esi
80109a31:	5f                   	pop    %edi
80109a32:	5d                   	pop    %ebp
80109a33:	c3                   	ret    
80109a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109a38:	8b 55 d8             	mov    -0x28(%ebp),%edx
80109a3b:	85 c0                	test   %eax,%eax
80109a3d:	89 de                	mov    %ebx,%esi
80109a3f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80109a42:	75 3c                	jne    80109a80 <__udivmoddi4+0xb0>
80109a44:	85 c9                	test   %ecx,%ecx
80109a46:	0f 84 d4 00 00 00    	je     80109b20 <__udivmoddi4+0x150>
80109a4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
80109a4f:	85 c0                	test   %eax,%eax
80109a51:	0f 85 c9 02 00 00    	jne    80109d20 <__udivmoddi4+0x350>
80109a57:	8b 75 18             	mov    0x18(%ebp),%esi
80109a5a:	85 f6                	test   %esi,%esi
80109a5c:	74 12                	je     80109a70 <__udivmoddi4+0xa0>
80109a5e:	89 d8                	mov    %ebx,%eax
80109a60:	31 d2                	xor    %edx,%edx
80109a62:	f7 f1                	div    %ecx
80109a64:	8b 45 18             	mov    0x18(%ebp),%eax
80109a67:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80109a6d:	89 50 04             	mov    %edx,0x4(%eax)
80109a70:	89 d8                	mov    %ebx,%eax
80109a72:	31 d2                	xor    %edx,%edx
80109a74:	f7 f1                	div    %ecx
80109a76:	31 d2                	xor    %edx,%edx
80109a78:	e9 91 00 00 00       	jmp    80109b0e <__udivmoddi4+0x13e>
80109a7d:	8d 76 00             	lea    0x0(%esi),%esi
80109a80:	85 c9                	test   %ecx,%ecx
80109a82:	89 c8                	mov    %ecx,%eax
80109a84:	0f 85 c6 00 00 00    	jne    80109b50 <__udivmoddi4+0x180>
80109a8a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80109a8d:	8d 51 ff             	lea    -0x1(%ecx),%edx
80109a90:	85 d1                	test   %edx,%ecx
80109a92:	0f 85 48 01 00 00    	jne    80109be0 <__udivmoddi4+0x210>
80109a98:	8b 75 18             	mov    0x18(%ebp),%esi
80109a9b:	85 f6                	test   %esi,%esi
80109a9d:	74 0f                	je     80109aae <__udivmoddi4+0xde>
80109a9f:	23 55 e0             	and    -0x20(%ebp),%edx
80109aa2:	8b 45 18             	mov    0x18(%ebp),%eax
80109aa5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
80109aac:	89 10                	mov    %edx,(%eax)
80109aae:	89 f8                	mov    %edi,%eax
80109ab0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80109ab3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
80109ab6:	83 ff 01             	cmp    $0x1,%edi
80109ab9:	74 53                	je     80109b0e <__udivmoddi4+0x13e>
80109abb:	31 f6                	xor    %esi,%esi
80109abd:	89 d8                	mov    %ebx,%eax
80109abf:	f3 0f bc f7          	tzcnt  %edi,%esi
80109ac3:	8b 7d e0             	mov    -0x20(%ebp),%edi
80109ac6:	89 f1                	mov    %esi,%ecx
80109ac8:	d3 e8                	shr    %cl,%eax
80109aca:	b9 20 00 00 00       	mov    $0x20,%ecx
80109acf:	89 45 bc             	mov    %eax,-0x44(%ebp)
80109ad2:	29 f1                	sub    %esi,%ecx
80109ad4:	89 d8                	mov    %ebx,%eax
80109ad6:	d3 e0                	shl    %cl,%eax
80109ad8:	89 f1                	mov    %esi,%ecx
80109ada:	8b 55 bc             	mov    -0x44(%ebp),%edx
80109add:	d3 ef                	shr    %cl,%edi
80109adf:	09 f8                	or     %edi,%eax
80109ae1:	89 45 b8             	mov    %eax,-0x48(%ebp)
80109ae4:	8b 45 b8             	mov    -0x48(%ebp),%eax
80109ae7:	eb 25                	jmp    80109b0e <__udivmoddi4+0x13e>
80109ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109af0:	8b 45 18             	mov    0x18(%ebp),%eax
80109af3:	85 c0                	test   %eax,%eax
80109af5:	0f 84 bc 00 00 00    	je     80109bb7 <__udivmoddi4+0x1e7>
80109afb:	8b 45 18             	mov    0x18(%ebp),%eax
80109afe:	8b 7d e0             	mov    -0x20(%ebp),%edi
80109b01:	31 d2                	xor    %edx,%edx
80109b03:	89 38                	mov    %edi,(%eax)
80109b05:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
80109b0c:	31 c0                	xor    %eax,%eax
80109b0e:	83 c4 3c             	add    $0x3c,%esp
80109b11:	5b                   	pop    %ebx
80109b12:	5e                   	pop    %esi
80109b13:	5f                   	pop    %edi
80109b14:	5d                   	pop    %ebp
80109b15:	c3                   	ret    
80109b16:	8d 76 00             	lea    0x0(%esi),%esi
80109b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80109b20:	8b 45 18             	mov    0x18(%ebp),%eax
80109b23:	85 c0                	test   %eax,%eax
80109b25:	74 12                	je     80109b39 <__udivmoddi4+0x169>
80109b27:	89 d8                	mov    %ebx,%eax
80109b29:	31 d2                	xor    %edx,%edx
80109b2b:	f7 f1                	div    %ecx
80109b2d:	8b 45 18             	mov    0x18(%ebp),%eax
80109b30:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
80109b37:	89 10                	mov    %edx,(%eax)
80109b39:	83 c4 3c             	add    $0x3c,%esp
80109b3c:	89 d8                	mov    %ebx,%eax
80109b3e:	31 c9                	xor    %ecx,%ecx
80109b40:	31 d2                	xor    %edx,%edx
80109b42:	5b                   	pop    %ebx
80109b43:	f7 f1                	div    %ecx
80109b45:	5e                   	pop    %esi
80109b46:	31 d2                	xor    %edx,%edx
80109b48:	5f                   	pop    %edi
80109b49:	5d                   	pop    %ebp
80109b4a:	c3                   	ret    
80109b4b:	90                   	nop
80109b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109b50:	0f bd c9             	bsr    %ecx,%ecx
80109b53:	0f bd c3             	bsr    %ebx,%eax
80109b56:	83 f1 1f             	xor    $0x1f,%ecx
80109b59:	83 f0 1f             	xor    $0x1f,%eax
80109b5c:	29 c1                	sub    %eax,%ecx
80109b5e:	83 f9 1f             	cmp    $0x1f,%ecx
80109b61:	77 4d                	ja     80109bb0 <__udivmoddi4+0x1e0>
80109b63:	8d 41 01             	lea    0x1(%ecx),%eax
80109b66:	83 f8 20             	cmp    $0x20,%eax
80109b69:	89 45 cc             	mov    %eax,-0x34(%ebp)
80109b6c:	0f 84 26 02 00 00    	je     80109d98 <__udivmoddi4+0x3c8>
80109b72:	8b 45 cc             	mov    -0x34(%ebp),%eax
80109b75:	8b 7d e0             	mov    -0x20(%ebp),%edi
80109b78:	ba 20 00 00 00       	mov    $0x20,%edx
80109b7d:	29 c2                	sub    %eax,%edx
80109b7f:	89 fb                	mov    %edi,%ebx
80109b81:	89 d1                	mov    %edx,%ecx
80109b83:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80109b86:	89 f2                	mov    %esi,%edx
80109b88:	d3 e3                	shl    %cl,%ebx
80109b8a:	89 c1                	mov    %eax,%ecx
80109b8c:	d3 ea                	shr    %cl,%edx
80109b8e:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
80109b92:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80109b99:	89 d0                	mov    %edx,%eax
80109b9b:	89 fa                	mov    %edi,%edx
80109b9d:	d3 e6                	shl    %cl,%esi
80109b9f:	0f b6 4d cc          	movzbl -0x34(%ebp),%ecx
80109ba3:	d3 ea                	shr    %cl,%edx
80109ba5:	09 d6                	or     %edx,%esi
80109ba7:	e9 94 00 00 00       	jmp    80109c40 <__udivmoddi4+0x270>
80109bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109bb0:	8b 45 18             	mov    0x18(%ebp),%eax
80109bb3:	85 c0                	test   %eax,%eax
80109bb5:	75 0c                	jne    80109bc3 <__udivmoddi4+0x1f3>
80109bb7:	83 c4 3c             	add    $0x3c,%esp
80109bba:	31 c0                	xor    %eax,%eax
80109bbc:	31 d2                	xor    %edx,%edx
80109bbe:	5b                   	pop    %ebx
80109bbf:	5e                   	pop    %esi
80109bc0:	5f                   	pop    %edi
80109bc1:	5d                   	pop    %ebp
80109bc2:	c3                   	ret    
80109bc3:	8b 45 18             	mov    0x18(%ebp),%eax
80109bc6:	31 d2                	xor    %edx,%edx
80109bc8:	89 38                	mov    %edi,(%eax)
80109bca:	8b 7d d4             	mov    -0x2c(%ebp),%edi
80109bcd:	89 78 04             	mov    %edi,0x4(%eax)
80109bd0:	31 c0                	xor    %eax,%eax
80109bd2:	e9 37 ff ff ff       	jmp    80109b0e <__udivmoddi4+0x13e>
80109bd7:	89 f6                	mov    %esi,%esi
80109bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80109be0:	0f bd 4d e4          	bsr    -0x1c(%ebp),%ecx
80109be4:	0f bd d3             	bsr    %ebx,%edx
80109be7:	83 f2 1f             	xor    $0x1f,%edx
80109bea:	83 f1 1f             	xor    $0x1f,%ecx
80109bed:	89 cb                	mov    %ecx,%ebx
80109bef:	29 d3                	sub    %edx,%ebx
80109bf1:	8d 4b 21             	lea    0x21(%ebx),%ecx
80109bf4:	83 f9 20             	cmp    $0x20,%ecx
80109bf7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80109bfa:	0f 84 b0 01 00 00    	je     80109db0 <__udivmoddi4+0x3e0>
80109c00:	8b 7d cc             	mov    -0x34(%ebp),%edi
80109c03:	83 ff 1f             	cmp    $0x1f,%edi
80109c06:	0f 87 b4 01 00 00    	ja     80109dc0 <__udivmoddi4+0x3f0>
80109c0c:	b8 20 00 00 00       	mov    $0x20,%eax
80109c11:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80109c14:	89 f2                	mov    %esi,%edx
80109c16:	29 f8                	sub    %edi,%eax
80109c18:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80109c1f:	89 c1                	mov    %eax,%ecx
80109c21:	d3 e3                	shl    %cl,%ebx
80109c23:	89 f9                	mov    %edi,%ecx
80109c25:	d3 ea                	shr    %cl,%edx
80109c27:	89 c1                	mov    %eax,%ecx
80109c29:	8b 45 e0             	mov    -0x20(%ebp),%eax
80109c2c:	d3 e6                	shl    %cl,%esi
80109c2e:	89 f9                	mov    %edi,%ecx
80109c30:	d3 e8                	shr    %cl,%eax
80109c32:	09 c6                	or     %eax,%esi
80109c34:	89 d0                	mov    %edx,%eax
80109c36:	8d 76 00             	lea    0x0(%esi),%esi
80109c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80109c40:	8b 55 d8             	mov    -0x28(%ebp),%edx
80109c43:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80109c46:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80109c4d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
80109c50:	83 c2 ff             	add    $0xffffffff,%edx
80109c53:	83 d1 ff             	adc    $0xffffffff,%ecx
80109c56:	89 55 c0             	mov    %edx,-0x40(%ebp)
80109c59:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
80109c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109c60:	89 f7                	mov    %esi,%edi
80109c62:	8d 14 36             	lea    (%esi,%esi,1),%edx
80109c65:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80109c68:	c1 ef 1f             	shr    $0x1f,%edi
80109c6b:	01 c0                	add    %eax,%eax
80109c6d:	89 7d d0             	mov    %edi,-0x30(%ebp)
80109c70:	8b 7d d4             	mov    -0x2c(%ebp),%edi
80109c73:	89 fe                	mov    %edi,%esi
80109c75:	01 ff                	add    %edi,%edi
80109c77:	c1 ee 1f             	shr    $0x1f,%esi
80109c7a:	89 f1                	mov    %esi,%ecx
80109c7c:	89 de                	mov    %ebx,%esi
80109c7e:	09 d1                	or     %edx,%ecx
80109c80:	8b 55 d0             	mov    -0x30(%ebp),%edx
80109c83:	c1 ee 1f             	shr    $0x1f,%esi
80109c86:	09 f7                	or     %esi,%edi
80109c88:	89 de                	mov    %ebx,%esi
80109c8a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80109c8d:	89 7d d4             	mov    %edi,-0x2c(%ebp)
80109c90:	01 f6                	add    %esi,%esi
80109c92:	09 c2                	or     %eax,%edx
80109c94:	8b 45 c0             	mov    -0x40(%ebp),%eax
80109c97:	89 d7                	mov    %edx,%edi
80109c99:	8b 55 c4             	mov    -0x3c(%ebp),%edx
80109c9c:	09 f3                	or     %esi,%ebx
80109c9e:	89 ce                	mov    %ecx,%esi
80109ca0:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80109ca3:	29 c8                	sub    %ecx,%eax
80109ca5:	19 fa                	sbb    %edi,%edx
80109ca7:	89 d0                	mov    %edx,%eax
80109ca9:	8b 55 d8             	mov    -0x28(%ebp),%edx
80109cac:	c1 f8 1f             	sar    $0x1f,%eax
80109caf:	89 c1                	mov    %eax,%ecx
80109cb1:	83 e1 01             	and    $0x1,%ecx
80109cb4:	89 d3                	mov    %edx,%ebx
80109cb6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80109cb9:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80109cbc:	21 c3                	and    %eax,%ebx
80109cbe:	89 5d e8             	mov    %ebx,-0x18(%ebp)
80109cc1:	21 c8                	and    %ecx,%eax
80109cc3:	2b 75 e8             	sub    -0x18(%ebp),%esi
80109cc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
80109cc9:	1b 7d ec             	sbb    -0x14(%ebp),%edi
80109ccc:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
80109cd0:	89 f8                	mov    %edi,%eax
80109cd2:	75 8c                	jne    80109c60 <__udivmoddi4+0x290>
80109cd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80109cd7:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
80109cda:	89 7d ec             	mov    %edi,-0x14(%ebp)
80109cdd:	8b 7d e0             	mov    -0x20(%ebp),%edi
80109ce0:	89 75 e8             	mov    %esi,-0x18(%ebp)
80109ce3:	89 45 b8             	mov    %eax,-0x48(%ebp)
80109ce6:	89 5d bc             	mov    %ebx,-0x44(%ebp)
80109ce9:	8b 4d b8             	mov    -0x48(%ebp),%ecx
80109cec:	8b 5d bc             	mov    -0x44(%ebp),%ebx
80109cef:	0f a4 cb 01          	shld   $0x1,%ecx,%ebx
80109cf3:	01 c9                	add    %ecx,%ecx
80109cf5:	09 cf                	or     %ecx,%edi
80109cf7:	8b 4d 18             	mov    0x18(%ebp),%ecx
80109cfa:	89 da                	mov    %ebx,%edx
80109cfc:	89 f8                	mov    %edi,%eax
80109cfe:	85 c9                	test   %ecx,%ecx
80109d00:	0f 84 08 fe ff ff    	je     80109b0e <__udivmoddi4+0x13e>
80109d06:	8b 7d 18             	mov    0x18(%ebp),%edi
80109d09:	8b 5d e8             	mov    -0x18(%ebp),%ebx
80109d0c:	8b 75 ec             	mov    -0x14(%ebp),%esi
80109d0f:	89 1f                	mov    %ebx,(%edi)
80109d11:	89 77 04             	mov    %esi,0x4(%edi)
80109d14:	83 c4 3c             	add    $0x3c,%esp
80109d17:	5b                   	pop    %ebx
80109d18:	5e                   	pop    %esi
80109d19:	5f                   	pop    %edi
80109d1a:	5d                   	pop    %ebp
80109d1b:	c3                   	ret    
80109d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109d20:	8d 41 ff             	lea    -0x1(%ecx),%eax
80109d23:	85 c1                	test   %eax,%ecx
80109d25:	75 29                	jne    80109d50 <__udivmoddi4+0x380>
80109d27:	8b 55 18             	mov    0x18(%ebp),%edx
80109d2a:	85 d2                	test   %edx,%edx
80109d2c:	74 0a                	je     80109d38 <__udivmoddi4+0x368>
80109d2e:	8b 55 18             	mov    0x18(%ebp),%edx
80109d31:	21 d8                	and    %ebx,%eax
80109d33:	89 3a                	mov    %edi,(%edx)
80109d35:	89 42 04             	mov    %eax,0x4(%edx)
80109d38:	f3 0f bc c9          	tzcnt  %ecx,%ecx
80109d3c:	89 d8                	mov    %ebx,%eax
80109d3e:	31 d2                	xor    %edx,%edx
80109d40:	d3 e8                	shr    %cl,%eax
80109d42:	e9 c7 fd ff ff       	jmp    80109b0e <__udivmoddi4+0x13e>
80109d47:	89 f6                	mov    %esi,%esi
80109d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80109d50:	0f bd c9             	bsr    %ecx,%ecx
80109d53:	0f bd c3             	bsr    %ebx,%eax
80109d56:	83 f1 1f             	xor    $0x1f,%ecx
80109d59:	83 f0 1f             	xor    $0x1f,%eax
80109d5c:	29 c1                	sub    %eax,%ecx
80109d5e:	83 f9 1e             	cmp    $0x1e,%ecx
80109d61:	0f 87 49 fe ff ff    	ja     80109bb0 <__udivmoddi4+0x1e0>
80109d67:	8d 41 01             	lea    0x1(%ecx),%eax
80109d6a:	ba 20 00 00 00       	mov    $0x20,%edx
80109d6f:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80109d72:	29 c2                	sub    %eax,%edx
80109d74:	89 c7                	mov    %eax,%edi
80109d76:	89 45 cc             	mov    %eax,-0x34(%ebp)
80109d79:	89 d1                	mov    %edx,%ecx
80109d7b:	89 f0                	mov    %esi,%eax
80109d7d:	d3 e3                	shl    %cl,%ebx
80109d7f:	89 f9                	mov    %edi,%ecx
80109d81:	d3 e8                	shr    %cl,%eax
80109d83:	89 d1                	mov    %edx,%ecx
80109d85:	8b 55 e0             	mov    -0x20(%ebp),%edx
80109d88:	d3 e6                	shl    %cl,%esi
80109d8a:	89 f9                	mov    %edi,%ecx
80109d8c:	d3 ea                	shr    %cl,%edx
80109d8e:	09 d6                	or     %edx,%esi
80109d90:	e9 ab fe ff ff       	jmp    80109c40 <__udivmoddi4+0x270>
80109d95:	8d 76 00             	lea    0x0(%esi),%esi
80109d98:	89 fb                	mov    %edi,%ebx
80109d9a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80109da1:	31 c0                	xor    %eax,%eax
80109da3:	e9 98 fe ff ff       	jmp    80109c40 <__udivmoddi4+0x270>
80109da8:	90                   	nop
80109da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109db0:	89 fb                	mov    %edi,%ebx
80109db2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80109db9:	e9 82 fe ff ff       	jmp    80109c40 <__udivmoddi4+0x270>
80109dbe:	66 90                	xchg   %ax,%ax
80109dc0:	b9 40 00 00 00       	mov    $0x40,%ecx
80109dc5:	2b 4d cc             	sub    -0x34(%ebp),%ecx
80109dc8:	8b 7d e0             	mov    -0x20(%ebp),%edi
80109dcb:	8d 53 01             	lea    0x1(%ebx),%edx
80109dce:	89 f3                	mov    %esi,%ebx
80109dd0:	d3 e7                	shl    %cl,%edi
80109dd2:	d3 e3                	shl    %cl,%ebx
80109dd4:	89 d1                	mov    %edx,%ecx
80109dd6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80109dd9:	8b 7d e0             	mov    -0x20(%ebp),%edi
80109ddc:	d3 ee                	shr    %cl,%esi
80109dde:	d3 ef                	shr    %cl,%edi
80109de0:	09 fb                	or     %edi,%ebx
80109de2:	e9 59 fe ff ff       	jmp    80109c40 <__udivmoddi4+0x270>
80109de7:	89 f6                	mov    %esi,%esi
80109de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80109df0 <__udivdi3>:
80109df0:	55                   	push   %ebp
80109df1:	89 e5                	mov    %esp,%ebp
80109df3:	83 ec 04             	sub    $0x4,%esp
80109df6:	6a 00                	push   $0x0
80109df8:	ff 75 14             	pushl  0x14(%ebp)
80109dfb:	ff 75 10             	pushl  0x10(%ebp)
80109dfe:	ff 75 0c             	pushl  0xc(%ebp)
80109e01:	ff 75 08             	pushl  0x8(%ebp)
80109e04:	e8 c7 fb ff ff       	call   801099d0 <__udivmoddi4>
80109e09:	c9                   	leave  
80109e0a:	c3                   	ret    
80109e0b:	90                   	nop
80109e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80109e10 <__umoddi3>:
80109e10:	55                   	push   %ebp
80109e11:	89 e5                	mov    %esp,%ebp
80109e13:	83 ec 14             	sub    $0x14,%esp
80109e16:	8d 45 f8             	lea    -0x8(%ebp),%eax
80109e19:	50                   	push   %eax
80109e1a:	ff 75 14             	pushl  0x14(%ebp)
80109e1d:	ff 75 10             	pushl  0x10(%ebp)
80109e20:	ff 75 0c             	pushl  0xc(%ebp)
80109e23:	ff 75 08             	pushl  0x8(%ebp)
80109e26:	e8 a5 fb ff ff       	call   801099d0 <__udivmoddi4>
80109e2b:	8b 45 f8             	mov    -0x8(%ebp),%eax
80109e2e:	8b 55 fc             	mov    -0x4(%ebp),%edx
80109e31:	c9                   	leave  
80109e32:	c3                   	ret    
80109e33:	66 90                	xchg   %ax,%ax
80109e35:	66 90                	xchg   %ax,%ax
80109e37:	66 90                	xchg   %ax,%ax
80109e39:	66 90                	xchg   %ax,%ax
80109e3b:	66 90                	xchg   %ax,%ax
80109e3d:	66 90                	xchg   %ax,%ax
80109e3f:	90                   	nop

80109e40 <steady_clock_now>:
80109e40:	55                   	push   %ebp
80109e41:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80109e46:	0f 31                	rdtsc  
80109e48:	89 e5                	mov    %esp,%ebp
80109e4a:	57                   	push   %edi
80109e4b:	56                   	push   %esi
80109e4c:	69 f2 e8 03 00 00    	imul   $0x3e8,%edx,%esi
80109e52:	53                   	push   %ebx
80109e53:	f7 e1                	mul    %ecx
80109e55:	83 ec 0c             	sub    $0xc,%esp
80109e58:	6a 00                	push   $0x0
80109e5a:	68 98 0e 31 00       	push   $0x310e98
80109e5f:	01 f2                	add    %esi,%edx
80109e61:	52                   	push   %edx
80109e62:	50                   	push   %eax
80109e63:	e8 88 ff ff ff       	call   80109df0 <__udivdi3>
80109e68:	83 c4 10             	add    $0x10,%esp
80109e6b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80109e6e:	5b                   	pop    %ebx
80109e6f:	5e                   	pop    %esi
80109e70:	5f                   	pop    %edi
80109e71:	5d                   	pop    %ebp
80109e72:	c3                   	ret    
80109e73:	66 90                	xchg   %ax,%ax
80109e75:	66 90                	xchg   %ax,%ax
80109e77:	66 90                	xchg   %ax,%ax
80109e79:	66 90                	xchg   %ax,%ax
80109e7b:	66 90                	xchg   %ax,%ax
80109e7d:	66 90                	xchg   %ax,%ax
80109e7f:	90                   	nop

80109e80 <atoi>:
80109e80:	55                   	push   %ebp
80109e81:	89 e5                	mov    %esp,%ebp
80109e83:	53                   	push   %ebx
80109e84:	8b 4d 08             	mov    0x8(%ebp),%ecx
80109e87:	0f be 11             	movsbl (%ecx),%edx
80109e8a:	84 d2                	test   %dl,%dl
80109e8c:	74 3a                	je     80109ec8 <atoi+0x48>
80109e8e:	8d 42 d0             	lea    -0x30(%edx),%eax
80109e91:	3c 09                	cmp    $0x9,%al
80109e93:	77 2b                	ja     80109ec0 <atoi+0x40>
80109e95:	83 c1 01             	add    $0x1,%ecx
80109e98:	31 c0                	xor    %eax,%eax
80109e9a:	eb 0f                	jmp    80109eab <atoi+0x2b>
80109e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109ea0:	8d 5a d0             	lea    -0x30(%edx),%ebx
80109ea3:	83 c1 01             	add    $0x1,%ecx
80109ea6:	80 fb 09             	cmp    $0x9,%bl
80109ea9:	77 15                	ja     80109ec0 <atoi+0x40>
80109eab:	8d 04 80             	lea    (%eax,%eax,4),%eax
80109eae:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
80109eb2:	0f be 11             	movsbl (%ecx),%edx
80109eb5:	84 d2                	test   %dl,%dl
80109eb7:	75 e7                	jne    80109ea0 <atoi+0x20>
80109eb9:	5b                   	pop    %ebx
80109eba:	5d                   	pop    %ebp
80109ebb:	c3                   	ret    
80109ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80109ec0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80109ec5:	5b                   	pop    %ebx
80109ec6:	5d                   	pop    %ebp
80109ec7:	c3                   	ret    
80109ec8:	31 c0                	xor    %eax,%eax
80109eca:	eb ed                	jmp    80109eb9 <atoi+0x39>
80109ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80109ed0 <itoa>:
80109ed0:	55                   	push   %ebp
80109ed1:	89 e5                	mov    %esp,%ebp
80109ed3:	57                   	push   %edi
80109ed4:	56                   	push   %esi
80109ed5:	53                   	push   %ebx
80109ed6:	83 ec 04             	sub    $0x4,%esp
80109ed9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80109edc:	83 f9 00             	cmp    $0x0,%ecx
80109edf:	7e 76                	jle    80109f57 <itoa+0x87>
80109ee1:	89 cb                	mov    %ecx,%ebx
80109ee3:	31 f6                	xor    %esi,%esi
80109ee5:	bf 67 66 66 66       	mov    $0x66666667,%edi
80109eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80109ef0:	89 d8                	mov    %ebx,%eax
80109ef2:	c1 fb 1f             	sar    $0x1f,%ebx
80109ef5:	83 c6 01             	add    $0x1,%esi
80109ef8:	f7 ef                	imul   %edi
80109efa:	c1 fa 02             	sar    $0x2,%edx
80109efd:	29 da                	sub    %ebx,%edx
80109eff:	89 d3                	mov    %edx,%ebx
80109f01:	75 ed                	jne    80109ef0 <itoa+0x20>
80109f03:	89 f3                	mov    %esi,%ebx
80109f05:	89 75 f0             	mov    %esi,-0x10(%ebp)
80109f08:	bf 67 66 66 66       	mov    $0x66666667,%edi
80109f0d:	8b 75 08             	mov    0x8(%ebp),%esi
80109f10:	eb 0a                	jmp    80109f1c <itoa+0x4c>
80109f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80109f18:	85 db                	test   %ebx,%ebx
80109f1a:	7e 25                	jle    80109f41 <itoa+0x71>
80109f1c:	89 c8                	mov    %ecx,%eax
80109f1e:	f7 ef                	imul   %edi
80109f20:	89 c8                	mov    %ecx,%eax
80109f22:	c1 f8 1f             	sar    $0x1f,%eax
80109f25:	c1 fa 02             	sar    $0x2,%edx
80109f28:	29 c2                	sub    %eax,%edx
80109f2a:	8d 04 92             	lea    (%edx,%edx,4),%eax
80109f2d:	01 c0                	add    %eax,%eax
80109f2f:	29 c1                	sub    %eax,%ecx
80109f31:	83 c1 30             	add    $0x30,%ecx
80109f34:	88 4c 1e ff          	mov    %cl,-0x1(%esi,%ebx,1)
80109f38:	83 eb 01             	sub    $0x1,%ebx
80109f3b:	85 d2                	test   %edx,%edx
80109f3d:	89 d1                	mov    %edx,%ecx
80109f3f:	7f d7                	jg     80109f18 <itoa+0x48>
80109f41:	8b 75 f0             	mov    -0x10(%ebp),%esi
80109f44:	89 f0                	mov    %esi,%eax
80109f46:	8b 7d 08             	mov    0x8(%ebp),%edi
80109f49:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
80109f4d:	83 c4 04             	add    $0x4,%esp
80109f50:	89 f0                	mov    %esi,%eax
80109f52:	5b                   	pop    %ebx
80109f53:	5e                   	pop    %esi
80109f54:	5f                   	pop    %edi
80109f55:	5d                   	pop    %ebp
80109f56:	c3                   	ret    
80109f57:	75 12                	jne    80109f6b <itoa+0x9b>
80109f59:	8b 45 08             	mov    0x8(%ebp),%eax
80109f5c:	be 01 00 00 00       	mov    $0x1,%esi
80109f61:	c6 00 30             	movb   $0x30,(%eax)
80109f64:	b8 01 00 00 00       	mov    $0x1,%eax
80109f69:	eb db                	jmp    80109f46 <itoa+0x76>
80109f6b:	31 c0                	xor    %eax,%eax
80109f6d:	31 f6                	xor    %esi,%esi
80109f6f:	eb d5                	jmp    80109f46 <itoa+0x76>
80109f71:	eb 0d                	jmp    80109f80 <utoa>
80109f73:	90                   	nop
80109f74:	90                   	nop
80109f75:	90                   	nop
80109f76:	90                   	nop
80109f77:	90                   	nop
80109f78:	90                   	nop
80109f79:	90                   	nop
80109f7a:	90                   	nop
80109f7b:	90                   	nop
80109f7c:	90                   	nop
80109f7d:	90                   	nop
80109f7e:	90                   	nop
80109f7f:	90                   	nop

80109f80 <utoa>:
80109f80:	55                   	push   %ebp
80109f81:	89 e5                	mov    %esp,%ebp
80109f83:	57                   	push   %edi
80109f84:	56                   	push   %esi
80109f85:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80109f88:	53                   	push   %ebx
80109f89:	8b 7d 08             	mov    0x8(%ebp),%edi
80109f8c:	85 c9                	test   %ecx,%ecx
80109f8e:	74 5a                	je     80109fea <utoa+0x6a>
80109f90:	89 ca                	mov    %ecx,%edx
80109f92:	31 f6                	xor    %esi,%esi
80109f94:	bb cd cc cc cc       	mov    $0xcccccccd,%ebx
80109f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80109fa0:	89 d0                	mov    %edx,%eax
80109fa2:	83 c6 01             	add    $0x1,%esi
80109fa5:	f7 e3                	mul    %ebx
80109fa7:	c1 ea 03             	shr    $0x3,%edx
80109faa:	85 d2                	test   %edx,%edx
80109fac:	75 f2                	jne    80109fa0 <utoa+0x20>
80109fae:	89 f3                	mov    %esi,%ebx
80109fb0:	eb 0a                	jmp    80109fbc <utoa+0x3c>
80109fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80109fb8:	85 db                	test   %ebx,%ebx
80109fba:	7e 21                	jle    80109fdd <utoa+0x5d>
80109fbc:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
80109fc1:	f7 e1                	mul    %ecx
80109fc3:	c1 ea 03             	shr    $0x3,%edx
80109fc6:	8d 04 92             	lea    (%edx,%edx,4),%eax
80109fc9:	01 c0                	add    %eax,%eax
80109fcb:	29 c1                	sub    %eax,%ecx
80109fcd:	83 c1 30             	add    $0x30,%ecx
80109fd0:	88 4c 1f ff          	mov    %cl,-0x1(%edi,%ebx,1)
80109fd4:	83 eb 01             	sub    $0x1,%ebx
80109fd7:	85 d2                	test   %edx,%edx
80109fd9:	89 d1                	mov    %edx,%ecx
80109fdb:	75 db                	jne    80109fb8 <utoa+0x38>
80109fdd:	89 f0                	mov    %esi,%eax
80109fdf:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
80109fe3:	89 f0                	mov    %esi,%eax
80109fe5:	5b                   	pop    %ebx
80109fe6:	5e                   	pop    %esi
80109fe7:	5f                   	pop    %edi
80109fe8:	5d                   	pop    %ebp
80109fe9:	c3                   	ret    
80109fea:	b8 01 00 00 00       	mov    $0x1,%eax
80109fef:	be 01 00 00 00       	mov    $0x1,%esi
80109ff4:	c6 07 30             	movb   $0x30,(%edi)
80109ff7:	c6 04 07 00          	movb   $0x0,(%edi,%eax,1)
80109ffb:	89 f0                	mov    %esi,%eax
80109ffd:	5b                   	pop    %ebx
80109ffe:	5e                   	pop    %esi
80109fff:	5f                   	pop    %edi
8010a000:	5d                   	pop    %ebp
8010a001:	c3                   	ret    
8010a002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010a009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010a010 <intlen>:
8010a010:	55                   	push   %ebp
8010a011:	89 e5                	mov    %esp,%ebp
8010a013:	56                   	push   %esi
8010a014:	53                   	push   %ebx
8010a015:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010a018:	bb 01 00 00 00       	mov    $0x1,%ebx
8010a01d:	8d 41 09             	lea    0x9(%ecx),%eax
8010a020:	83 f8 12             	cmp    $0x12,%eax
8010a023:	76 24                	jbe    8010a049 <intlen+0x39>
8010a025:	be 67 66 66 66       	mov    $0x66666667,%esi
8010a02a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010a030:	89 c8                	mov    %ecx,%eax
8010a032:	c1 f9 1f             	sar    $0x1f,%ecx
8010a035:	83 c3 01             	add    $0x1,%ebx
8010a038:	f7 ee                	imul   %esi
8010a03a:	c1 fa 02             	sar    $0x2,%edx
8010a03d:	29 ca                	sub    %ecx,%edx
8010a03f:	8d 42 09             	lea    0x9(%edx),%eax
8010a042:	89 d1                	mov    %edx,%ecx
8010a044:	83 f8 12             	cmp    $0x12,%eax
8010a047:	77 e7                	ja     8010a030 <intlen+0x20>
8010a049:	89 d8                	mov    %ebx,%eax
8010a04b:	5b                   	pop    %ebx
8010a04c:	5e                   	pop    %esi
8010a04d:	5d                   	pop    %ebp
8010a04e:	c3                   	ret    
8010a04f:	90                   	nop

8010a050 <get_file_name_constant>:
8010a050:	55                   	push   %ebp
8010a051:	89 e5                	mov    %esp,%ebp
8010a053:	53                   	push   %ebx
8010a054:	89 c3                	mov    %eax,%ebx
8010a056:	83 ec 0c             	sub    $0xc,%esp
8010a059:	68 27 f4 10 80       	push   $0x8010f427
8010a05e:	50                   	push   %eax
8010a05f:	e8 dc c4 ff ff       	call   80106540 <strcmp>
8010a064:	83 c4 10             	add    $0x10,%esp
8010a067:	85 c0                	test   %eax,%eax
8010a069:	75 0d                	jne    8010a078 <get_file_name_constant+0x28>
8010a06b:	b8 01 00 00 00       	mov    $0x1,%eax
8010a070:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010a073:	c9                   	leave  
8010a074:	c3                   	ret    
8010a075:	8d 76 00             	lea    0x0(%esi),%esi
8010a078:	83 ec 08             	sub    $0x8,%esp
8010a07b:	68 34 f4 10 80       	push   $0x8010f434
8010a080:	53                   	push   %ebx
8010a081:	e8 ba c4 ff ff       	call   80106540 <strcmp>
8010a086:	89 c2                	mov    %eax,%edx
8010a088:	83 c4 10             	add    $0x10,%esp
8010a08b:	b8 02 00 00 00       	mov    $0x2,%eax
8010a090:	85 d2                	test   %edx,%edx
8010a092:	74 dc                	je     8010a070 <get_file_name_constant+0x20>
8010a094:	83 ec 08             	sub    $0x8,%esp
8010a097:	68 4b f4 10 80       	push   $0x8010f44b
8010a09c:	53                   	push   %ebx
8010a09d:	e8 9e c4 ff ff       	call   80106540 <strcmp>
8010a0a2:	89 c2                	mov    %eax,%edx
8010a0a4:	83 c4 10             	add    $0x10,%esp
8010a0a7:	b8 03 00 00 00       	mov    $0x3,%eax
8010a0ac:	85 d2                	test   %edx,%edx
8010a0ae:	74 c0                	je     8010a070 <get_file_name_constant+0x20>
8010a0b0:	83 ec 08             	sub    $0x8,%esp
8010a0b3:	68 62 f4 10 80       	push   $0x8010f462
8010a0b8:	53                   	push   %ebx
8010a0b9:	e8 82 c4 ff ff       	call   80106540 <strcmp>
8010a0be:	89 c2                	mov    %eax,%edx
8010a0c0:	83 c4 10             	add    $0x10,%esp
8010a0c3:	b8 04 00 00 00       	mov    $0x4,%eax
8010a0c8:	85 d2                	test   %edx,%edx
8010a0ca:	74 a4                	je     8010a070 <get_file_name_constant+0x20>
8010a0cc:	83 ec 08             	sub    $0x8,%esp
8010a0cf:	68 73 f4 10 80       	push   $0x8010f473
8010a0d4:	53                   	push   %ebx
8010a0d5:	e8 66 c4 ff ff       	call   80106540 <strcmp>
8010a0da:	89 c2                	mov    %eax,%edx
8010a0dc:	83 c4 10             	add    $0x10,%esp
8010a0df:	b8 0d 00 00 00       	mov    $0xd,%eax
8010a0e4:	85 d2                	test   %edx,%edx
8010a0e6:	74 88                	je     8010a070 <get_file_name_constant+0x20>
8010a0e8:	50                   	push   %eax
8010a0e9:	50                   	push   %eax
8010a0ea:	68 86 f4 10 80       	push   $0x8010f486
8010a0ef:	53                   	push   %ebx
8010a0f0:	e8 4b c4 ff ff       	call   80106540 <strcmp>
8010a0f5:	89 c2                	mov    %eax,%edx
8010a0f7:	83 c4 10             	add    $0x10,%esp
8010a0fa:	b8 0e 00 00 00       	mov    $0xe,%eax
8010a0ff:	85 d2                	test   %edx,%edx
8010a101:	0f 84 69 ff ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a107:	50                   	push   %eax
8010a108:	50                   	push   %eax
8010a109:	68 94 f4 10 80       	push   $0x8010f494
8010a10e:	53                   	push   %ebx
8010a10f:	e8 2c c4 ff ff       	call   80106540 <strcmp>
8010a114:	89 c2                	mov    %eax,%edx
8010a116:	83 c4 10             	add    $0x10,%esp
8010a119:	b8 0f 00 00 00       	mov    $0xf,%eax
8010a11e:	85 d2                	test   %edx,%edx
8010a120:	0f 84 4a ff ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a126:	51                   	push   %ecx
8010a127:	51                   	push   %ecx
8010a128:	68 a0 f4 10 80       	push   $0x8010f4a0
8010a12d:	53                   	push   %ebx
8010a12e:	e8 0d c4 ff ff       	call   80106540 <strcmp>
8010a133:	89 c2                	mov    %eax,%edx
8010a135:	83 c4 10             	add    $0x10,%esp
8010a138:	b8 05 00 00 00       	mov    $0x5,%eax
8010a13d:	85 d2                	test   %edx,%edx
8010a13f:	0f 84 2b ff ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a145:	52                   	push   %edx
8010a146:	52                   	push   %edx
8010a147:	68 ab f4 10 80       	push   $0x8010f4ab
8010a14c:	53                   	push   %ebx
8010a14d:	e8 ee c3 ff ff       	call   80106540 <strcmp>
8010a152:	89 c2                	mov    %eax,%edx
8010a154:	83 c4 10             	add    $0x10,%esp
8010a157:	b8 06 00 00 00       	mov    $0x6,%eax
8010a15c:	85 d2                	test   %edx,%edx
8010a15e:	0f 84 0c ff ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a164:	50                   	push   %eax
8010a165:	50                   	push   %eax
8010a166:	68 b3 f4 10 80       	push   $0x8010f4b3
8010a16b:	53                   	push   %ebx
8010a16c:	e8 cf c3 ff ff       	call   80106540 <strcmp>
8010a171:	89 c2                	mov    %eax,%edx
8010a173:	83 c4 10             	add    $0x10,%esp
8010a176:	b8 10 00 00 00       	mov    $0x10,%eax
8010a17b:	85 d2                	test   %edx,%edx
8010a17d:	0f 84 ed fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a183:	50                   	push   %eax
8010a184:	50                   	push   %eax
8010a185:	68 bc f4 10 80       	push   $0x8010f4bc
8010a18a:	53                   	push   %ebx
8010a18b:	e8 b0 c3 ff ff       	call   80106540 <strcmp>
8010a190:	89 c2                	mov    %eax,%edx
8010a192:	83 c4 10             	add    $0x10,%esp
8010a195:	b8 07 00 00 00       	mov    $0x7,%eax
8010a19a:	85 d2                	test   %edx,%edx
8010a19c:	0f 84 ce fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a1a2:	50                   	push   %eax
8010a1a3:	50                   	push   %eax
8010a1a4:	68 c4 f4 10 80       	push   $0x8010f4c4
8010a1a9:	53                   	push   %ebx
8010a1aa:	e8 91 c3 ff ff       	call   80106540 <strcmp>
8010a1af:	89 c2                	mov    %eax,%edx
8010a1b1:	83 c4 10             	add    $0x10,%esp
8010a1b4:	b8 11 00 00 00       	mov    $0x11,%eax
8010a1b9:	85 d2                	test   %edx,%edx
8010a1bb:	0f 84 af fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a1c1:	50                   	push   %eax
8010a1c2:	50                   	push   %eax
8010a1c3:	68 d0 f4 10 80       	push   $0x8010f4d0
8010a1c8:	53                   	push   %ebx
8010a1c9:	e8 72 c3 ff ff       	call   80106540 <strcmp>
8010a1ce:	89 c2                	mov    %eax,%edx
8010a1d0:	83 c4 10             	add    $0x10,%esp
8010a1d3:	b8 08 00 00 00       	mov    $0x8,%eax
8010a1d8:	85 d2                	test   %edx,%edx
8010a1da:	0f 84 90 fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a1e0:	50                   	push   %eax
8010a1e1:	50                   	push   %eax
8010a1e2:	68 dc f4 10 80       	push   $0x8010f4dc
8010a1e7:	53                   	push   %ebx
8010a1e8:	e8 53 c3 ff ff       	call   80106540 <strcmp>
8010a1ed:	89 c2                	mov    %eax,%edx
8010a1ef:	83 c4 10             	add    $0x10,%esp
8010a1f2:	b8 09 00 00 00       	mov    $0x9,%eax
8010a1f7:	85 d2                	test   %edx,%edx
8010a1f9:	0f 84 71 fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a1ff:	50                   	push   %eax
8010a200:	50                   	push   %eax
8010a201:	68 ea f4 10 80       	push   $0x8010f4ea
8010a206:	53                   	push   %ebx
8010a207:	e8 34 c3 ff ff       	call   80106540 <strcmp>
8010a20c:	89 c2                	mov    %eax,%edx
8010a20e:	83 c4 10             	add    $0x10,%esp
8010a211:	b8 12 00 00 00       	mov    $0x12,%eax
8010a216:	85 d2                	test   %edx,%edx
8010a218:	0f 84 52 fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a21e:	51                   	push   %ecx
8010a21f:	51                   	push   %ecx
8010a220:	68 f9 f4 10 80       	push   $0x8010f4f9
8010a225:	53                   	push   %ebx
8010a226:	e8 15 c3 ff ff       	call   80106540 <strcmp>
8010a22b:	89 c2                	mov    %eax,%edx
8010a22d:	83 c4 10             	add    $0x10,%esp
8010a230:	b8 0a 00 00 00       	mov    $0xa,%eax
8010a235:	85 d2                	test   %edx,%edx
8010a237:	0f 84 33 fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a23d:	52                   	push   %edx
8010a23e:	52                   	push   %edx
8010a23f:	68 04 f5 10 80       	push   $0x8010f504
8010a244:	53                   	push   %ebx
8010a245:	e8 f6 c2 ff ff       	call   80106540 <strcmp>
8010a24a:	89 c2                	mov    %eax,%edx
8010a24c:	83 c4 10             	add    $0x10,%esp
8010a24f:	b8 0b 00 00 00       	mov    $0xb,%eax
8010a254:	85 d2                	test   %edx,%edx
8010a256:	0f 84 14 fe ff ff    	je     8010a070 <get_file_name_constant+0x20>
8010a25c:	50                   	push   %eax
8010a25d:	50                   	push   %eax
8010a25e:	68 0f f5 10 80       	push   $0x8010f50f
8010a263:	53                   	push   %ebx
8010a264:	e8 d7 c2 ff ff       	call   80106540 <strcmp>
8010a269:	83 c4 10             	add    $0x10,%esp
8010a26c:	83 f8 01             	cmp    $0x1,%eax
8010a26f:	19 c0                	sbb    %eax,%eax
8010a271:	83 e0 14             	and    $0x14,%eax
8010a274:	83 e8 01             	sub    $0x1,%eax
8010a277:	e9 f4 fd ff ff       	jmp    8010a070 <get_file_name_constant+0x20>
8010a27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

8010a280 <read_file_mem_max.isra.14>:
8010a280:	55                   	push   %ebp
8010a281:	89 e5                	mov    %esp,%ebp
8010a283:	57                   	push   %edi
8010a284:	56                   	push   %esi
8010a285:	53                   	push   %ebx
8010a286:	8d 5d de             	lea    -0x22(%ebp),%ebx
8010a289:	89 c7                	mov    %eax,%edi
8010a28b:	31 c0                	xor    %eax,%eax
8010a28d:	83 ec 34             	sub    $0x34,%esp
8010a290:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
8010a293:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
8010a29a:	52                   	push   %edx
8010a29b:	53                   	push   %ebx
8010a29c:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
8010a2a3:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
8010a2a7:	e8 d4 fc ff ff       	call   80109f80 <utoa>
8010a2ac:	89 1c 24             	mov    %ebx,(%esp)
8010a2af:	e8 7c c3 ff ff       	call   80106630 <strlen>
8010a2b4:	83 c4 0c             	add    $0xc,%esp
8010a2b7:	89 c6                	mov    %eax,%esi
8010a2b9:	50                   	push   %eax
8010a2ba:	53                   	push   %ebx
8010a2bb:	8d 9e c0 05 12 80    	lea    -0x7fedfa40(%esi),%ebx
8010a2c1:	68 c0 05 12 80       	push   $0x801205c0
8010a2c6:	e8 c5 c2 ff ff       	call   80106590 <strncpy>
8010a2cb:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010a2d2:	e8 59 c3 ff ff       	call   80106630 <strlen>
8010a2d7:	83 c4 0c             	add    $0xc,%esp
8010a2da:	89 c6                	mov    %eax,%esi
8010a2dc:	50                   	push   %eax
8010a2dd:	68 b3 f3 10 80       	push   $0x8010f3b3
8010a2e2:	53                   	push   %ebx
8010a2e3:	01 f3                	add    %esi,%ebx
8010a2e5:	81 eb c0 05 12 80    	sub    $0x801205c0,%ebx
8010a2eb:	e8 a0 c2 ff ff       	call   80106590 <strncpy>
8010a2f0:	8b 3f                	mov    (%edi),%edi
8010a2f2:	83 c4 10             	add    $0x10,%esp
8010a2f5:	39 fb                	cmp    %edi,%ebx
8010a2f7:	74 47                	je     8010a340 <read_file_mem_max.isra.14+0xc0>
8010a2f9:	29 fb                	sub    %edi,%ebx
8010a2fb:	3b 5d 08             	cmp    0x8(%ebp),%ebx
8010a2fe:	0f 47 5d 08          	cmova  0x8(%ebp),%ebx
8010a302:	85 db                	test   %ebx,%ebx
8010a304:	89 de                	mov    %ebx,%esi
8010a306:	7e 38                	jle    8010a340 <read_file_mem_max.isra.14+0xc0>
8010a308:	0f b6 97 c0 05 12 80 	movzbl -0x7fedfa40(%edi),%edx
8010a30f:	31 c0                	xor    %eax,%eax
8010a311:	84 d2                	test   %dl,%dl
8010a313:	74 21                	je     8010a336 <read_file_mem_max.isra.14+0xb6>
8010a315:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
8010a318:	eb 12                	jmp    8010a32c <read_file_mem_max.isra.14+0xac>
8010a31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010a320:	0f b6 94 07 c0 05 12 	movzbl -0x7fedfa40(%edi,%eax,1),%edx
8010a327:	80 
8010a328:	84 d2                	test   %dl,%dl
8010a32a:	74 0a                	je     8010a336 <read_file_mem_max.isra.14+0xb6>
8010a32c:	88 14 01             	mov    %dl,(%ecx,%eax,1)
8010a32f:	83 c0 01             	add    $0x1,%eax
8010a332:	39 c6                	cmp    %eax,%esi
8010a334:	75 ea                	jne    8010a320 <read_file_mem_max.isra.14+0xa0>
8010a336:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010a339:	5b                   	pop    %ebx
8010a33a:	5e                   	pop    %esi
8010a33b:	5f                   	pop    %edi
8010a33c:	5d                   	pop    %ebp
8010a33d:	c3                   	ret    
8010a33e:	66 90                	xchg   %ax,%ax
8010a340:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010a343:	31 c0                	xor    %eax,%eax
8010a345:	5b                   	pop    %ebx
8010a346:	5e                   	pop    %esi
8010a347:	5f                   	pop    %edi
8010a348:	5d                   	pop    %ebp
8010a349:	c3                   	ret    
8010a34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

8010a350 <unsafe_cg_open>:
8010a350:	55                   	push   %ebp
8010a351:	89 e5                	mov    %esp,%ebp
8010a353:	57                   	push   %edi
8010a354:	56                   	push   %esi
8010a355:	53                   	push   %ebx
8010a356:	83 ec 1c             	sub    $0x1c,%esp
8010a359:	8b 45 08             	mov    0x8(%ebp),%eax
8010a35c:	8b 75 10             	mov    0x10(%ebp),%esi
8010a35f:	85 c0                	test   %eax,%eax
8010a361:	0f 84 91 00 00 00    	je     8010a3f8 <unsafe_cg_open+0xa8>
8010a367:	83 f8 01             	cmp    $0x1,%eax
8010a36a:	75 38                	jne    8010a3a4 <unsafe_cg_open+0x54>
8010a36c:	80 3e 00             	cmpb   $0x0,(%esi)
8010a36f:	74 33                	je     8010a3a4 <unsafe_cg_open+0x54>
8010a371:	e8 ea 71 ff ff       	call   80101560 <filealloc>
8010a376:	85 c0                	test   %eax,%eax
8010a378:	89 c7                	mov    %eax,%edi
8010a37a:	74 28                	je     8010a3a4 <unsafe_cg_open+0x54>
8010a37c:	31 db                	xor    %ebx,%ebx
8010a37e:	e8 a0 ae ff ff       	call   80105223 <myproc>
8010a383:	90                   	nop
8010a384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010a388:	8b 54 98 48          	mov    0x48(%eax,%ebx,4),%edx
8010a38c:	85 d2                	test   %edx,%edx
8010a38e:	74 28                	je     8010a3b8 <unsafe_cg_open+0x68>
8010a390:	83 c3 01             	add    $0x1,%ebx
8010a393:	83 fb 10             	cmp    $0x10,%ebx
8010a396:	75 f0                	jne    8010a388 <unsafe_cg_open+0x38>
8010a398:	83 ec 0c             	sub    $0xc,%esp
8010a39b:	57                   	push   %edi
8010a39c:	e8 7f 72 ff ff       	call   80101620 <fileclose>
8010a3a1:	83 c4 10             	add    $0x10,%esp
8010a3a4:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010a3a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010a3ac:	89 d8                	mov    %ebx,%eax
8010a3ae:	5b                   	pop    %ebx
8010a3af:	5e                   	pop    %esi
8010a3b0:	5f                   	pop    %edi
8010a3b1:	5d                   	pop    %ebp
8010a3b2:	c3                   	ret    
8010a3b3:	90                   	nop
8010a3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010a3b8:	89 7c 98 48          	mov    %edi,0x48(%eax,%ebx,4)
8010a3bc:	8b 45 14             	mov    0x14(%ebp),%eax
8010a3bf:	c7 07 03 00 00 00    	movl   $0x3,(%edi)
8010a3c5:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
8010a3cc:	c6 47 09 00          	movb   $0x0,0x9(%edi)
8010a3d0:	89 77 10             	mov    %esi,0x10(%edi)
8010a3d3:	83 e0 01             	and    $0x1,%eax
8010a3d6:	c6 47 14 00          	movb   $0x0,0x14(%edi)
8010a3da:	83 f0 01             	xor    $0x1,%eax
8010a3dd:	88 47 08             	mov    %al,0x8(%edi)
8010a3e0:	83 86 00 02 00 00 01 	addl   $0x1,0x200(%esi)
8010a3e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010a3ea:	89 d8                	mov    %ebx,%eax
8010a3ec:	5b                   	pop    %ebx
8010a3ed:	5e                   	pop    %esi
8010a3ee:	5f                   	pop    %edi
8010a3ef:	5d                   	pop    %ebp
8010a3f0:	c3                   	ret    
8010a3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010a3f8:	8b 45 0c             	mov    0xc(%ebp),%eax
8010a3fb:	e8 50 fc ff ff       	call   8010a050 <get_file_name_constant>
8010a400:	83 f8 ff             	cmp    $0xffffffff,%eax
8010a403:	89 c1                	mov    %eax,%ecx
8010a405:	74 9d                	je     8010a3a4 <unsafe_cg_open+0x54>
8010a407:	8d 40 f3             	lea    -0xd(%eax),%eax
8010a40a:	31 ff                	xor    %edi,%edi
8010a40c:	83 f8 06             	cmp    $0x6,%eax
8010a40f:	77 47                	ja     8010a458 <unsafe_cg_open+0x108>
8010a411:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010a414:	e8 47 71 ff ff       	call   80101560 <filealloc>
8010a419:	85 c0                	test   %eax,%eax
8010a41b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010a41e:	74 84                	je     8010a3a4 <unsafe_cg_open+0x54>
8010a420:	e8 fe ad ff ff       	call   80105223 <myproc>
8010a425:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010a428:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a42b:	31 db                	xor    %ebx,%ebx
8010a42d:	8d 76 00             	lea    0x0(%esi),%esi
8010a430:	83 7c 98 48 00       	cmpl   $0x0,0x48(%eax,%ebx,4)
8010a435:	74 49                	je     8010a480 <unsafe_cg_open+0x130>
8010a437:	83 c3 01             	add    $0x1,%ebx
8010a43a:	83 fb 10             	cmp    $0x10,%ebx
8010a43d:	75 f1                	jne    8010a430 <unsafe_cg_open+0xe0>
8010a43f:	83 ec 0c             	sub    $0xc,%esp
8010a442:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010a447:	52                   	push   %edx
8010a448:	e8 d3 71 ff ff       	call   80101620 <fileclose>
8010a44d:	83 c4 10             	add    $0x10,%esp
8010a450:	e9 54 ff ff ff       	jmp    8010a3a9 <unsafe_cg_open+0x59>
8010a455:	8d 76 00             	lea    0x0(%esi),%esi
8010a458:	8d 41 ff             	lea    -0x1(%ecx),%eax
8010a45b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010a45e:	83 f8 0b             	cmp    $0xb,%eax
8010a461:	19 ff                	sbb    %edi,%edi
8010a463:	83 e7 02             	and    $0x2,%edi
8010a466:	e8 f5 70 ff ff       	call   80101560 <filealloc>
8010a46b:	83 ef 01             	sub    $0x1,%edi
8010a46e:	85 c0                	test   %eax,%eax
8010a470:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010a473:	75 ab                	jne    8010a420 <unsafe_cg_open+0xd0>
8010a475:	e9 2a ff ff ff       	jmp    8010a3a4 <unsafe_cg_open+0x54>
8010a47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010a480:	83 e9 05             	sub    $0x5,%ecx
8010a483:	89 54 98 48          	mov    %edx,0x48(%eax,%ebx,4)
8010a487:	83 f9 0e             	cmp    $0xe,%ecx
8010a48a:	77 2d                	ja     8010a4b9 <unsafe_cg_open+0x169>
8010a48c:	ff 24 8d 8c f6 10 80 	jmp    *-0x7fef0974(,%ecx,4)
8010a493:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a496:	e8 15 2a 00 00       	call   8010ceb0 <cgroup_root>
8010a49b:	39 c6                	cmp    %eax,%esi
8010a49d:	0f 84 01 ff ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a4a3:	0f b6 86 13 03 00 00 	movzbl 0x313(%esi),%eax
8010a4aa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a4ad:	88 42 54             	mov    %al,0x54(%edx)
8010a4b0:	8b 86 50 03 00 00    	mov    0x350(%esi),%eax
8010a4b6:	89 42 58             	mov    %eax,0x58(%edx)
8010a4b9:	8b 45 14             	mov    0x14(%ebp),%eax
8010a4bc:	89 72 10             	mov    %esi,0x10(%edx)
8010a4bf:	c7 02 03 00 00 00    	movl   $0x3,(%edx)
8010a4c5:	c7 42 0c 00 00 00 00 	movl   $0x0,0xc(%edx)
8010a4cc:	83 e0 01             	and    $0x1,%eax
8010a4cf:	83 f0 01             	xor    $0x1,%eax
8010a4d2:	f6 45 14 03          	testb  $0x3,0x14(%ebp)
8010a4d6:	88 42 08             	mov    %al,0x8(%edx)
8010a4d9:	0f 95 c1             	setne  %cl
8010a4dc:	85 ff                	test   %edi,%edi
8010a4de:	0f 95 c0             	setne  %al
8010a4e1:	83 ec 04             	sub    $0x4,%esp
8010a4e4:	83 c2 14             	add    $0x14,%edx
8010a4e7:	21 c8                	and    %ecx,%eax
8010a4e9:	88 42 f5             	mov    %al,-0xb(%edx)
8010a4ec:	6a 40                	push   $0x40
8010a4ee:	ff 75 0c             	pushl  0xc(%ebp)
8010a4f1:	52                   	push   %edx
8010a4f2:	e8 99 c0 ff ff       	call   80106590 <strncpy>
8010a4f7:	83 86 00 02 00 00 01 	addl   $0x1,0x200(%esi)
8010a4fe:	83 c4 10             	add    $0x10,%esp
8010a501:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010a504:	89 d8                	mov    %ebx,%eax
8010a506:	5b                   	pop    %ebx
8010a507:	5e                   	pop    %esi
8010a508:	5f                   	pop    %edi
8010a509:	5d                   	pop    %ebp
8010a50a:	c3                   	ret    
8010a50b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a50e:	e8 9d 29 00 00       	call   8010ceb0 <cgroup_root>
8010a513:	39 c6                	cmp    %eax,%esi
8010a515:	0f 84 89 fe ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a51b:	0f b6 86 13 03 00 00 	movzbl 0x313(%esi),%eax
8010a522:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a525:	88 42 54             	mov    %al,0x54(%edx)
8010a528:	8b 86 40 03 00 00    	mov    0x340(%esi),%eax
8010a52e:	89 42 58             	mov    %eax,0x58(%edx)
8010a531:	8b 86 44 03 00 00    	mov    0x344(%esi),%eax
8010a537:	89 42 5c             	mov    %eax,0x5c(%edx)
8010a53a:	8b 86 48 03 00 00    	mov    0x348(%esi),%eax
8010a540:	89 42 60             	mov    %eax,0x60(%edx)
8010a543:	8b 86 4c 03 00 00    	mov    0x34c(%esi),%eax
8010a549:	89 42 64             	mov    %eax,0x64(%edx)
8010a54c:	e8 6f 8a ff ff       	call   80102fc0 <get_total_memory>
8010a551:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a554:	c1 e0 0c             	shl    $0xc,%eax
8010a557:	89 42 68             	mov    %eax,0x68(%edx)
8010a55a:	e9 5a ff ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a55f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a562:	e8 49 29 00 00       	call   8010ceb0 <cgroup_root>
8010a567:	39 c6                	cmp    %eax,%esi
8010a569:	0f 84 35 fe ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a56f:	0f b6 86 0d 03 00 00 	movzbl 0x30d(%esi),%eax
8010a576:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a579:	88 42 54             	mov    %al,0x54(%edx)
8010a57c:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
8010a582:	89 42 58             	mov    %eax,0x58(%edx)
8010a585:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
8010a58b:	c7 42 60 00 00 00 00 	movl   $0x0,0x60(%edx)
8010a592:	89 42 5c             	mov    %eax,0x5c(%edx)
8010a595:	8b 86 78 03 00 00    	mov    0x378(%esi),%eax
8010a59b:	89 42 64             	mov    %eax,0x64(%edx)
8010a59e:	8b 86 7c 03 00 00    	mov    0x37c(%esi),%eax
8010a5a4:	89 42 68             	mov    %eax,0x68(%edx)
8010a5a7:	8b 86 80 03 00 00    	mov    0x380(%esi),%eax
8010a5ad:	89 42 6c             	mov    %eax,0x6c(%edx)
8010a5b0:	e9 04 ff ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a5b5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a5b8:	e8 f3 28 00 00       	call   8010ceb0 <cgroup_root>
8010a5bd:	39 c6                	cmp    %eax,%esi
8010a5bf:	0f 84 df fd ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a5c5:	0f b6 86 13 03 00 00 	movzbl 0x313(%esi),%eax
8010a5cc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a5cf:	88 42 54             	mov    %al,0x54(%edx)
8010a5d2:	8b 86 54 03 00 00    	mov    0x354(%esi),%eax
8010a5d8:	89 42 58             	mov    %eax,0x58(%edx)
8010a5db:	e9 d9 fe ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a5e0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a5e3:	e8 c8 28 00 00       	call   8010ceb0 <cgroup_root>
8010a5e8:	39 c6                	cmp    %eax,%esi
8010a5ea:	0f 84 b4 fd ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a5f0:	8b 86 34 03 00 00    	mov    0x334(%esi),%eax
8010a5f6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a5f9:	89 42 54             	mov    %eax,0x54(%edx)
8010a5fc:	e9 b8 fe ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a601:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a604:	e8 a7 28 00 00       	call   8010ceb0 <cgroup_root>
8010a609:	39 c6                	cmp    %eax,%esi
8010a60b:	0f 84 93 fd ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a611:	0f b6 86 11 03 00 00 	movzbl 0x311(%esi),%eax
8010a618:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a61b:	88 42 54             	mov    %al,0x54(%edx)
8010a61e:	0f b6 86 30 03 00 00 	movzbl 0x330(%esi),%eax
8010a625:	89 42 58             	mov    %eax,0x58(%edx)
8010a628:	e9 8c fe ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a62d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a630:	e8 7b 28 00 00       	call   8010ceb0 <cgroup_root>
8010a635:	39 c6                	cmp    %eax,%esi
8010a637:	0f 84 67 fd ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a63d:	0f b6 86 0f 03 00 00 	movzbl 0x30f(%esi),%eax
8010a644:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a647:	88 42 54             	mov    %al,0x54(%edx)
8010a64a:	8b 86 2c 03 00 00    	mov    0x32c(%esi),%eax
8010a650:	89 42 58             	mov    %eax,0x58(%edx)
8010a653:	e9 61 fe ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a658:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a65b:	e8 50 28 00 00       	call   8010ceb0 <cgroup_root>
8010a660:	39 c6                	cmp    %eax,%esi
8010a662:	0f 84 3c fd ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a668:	8b 86 70 03 00 00    	mov    0x370(%esi),%eax
8010a66e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a671:	89 42 54             	mov    %eax,0x54(%edx)
8010a674:	8b 86 6c 03 00 00    	mov    0x36c(%esi),%eax
8010a67a:	89 42 58             	mov    %eax,0x58(%edx)
8010a67d:	e9 37 fe ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a682:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010a685:	e8 26 28 00 00       	call   8010ceb0 <cgroup_root>
8010a68a:	39 c6                	cmp    %eax,%esi
8010a68c:	0f 84 12 fd ff ff    	je     8010a3a4 <unsafe_cg_open+0x54>
8010a692:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010a695:	c7 42 54 00 00 00 00 	movl   $0x0,0x54(%edx)
8010a69c:	e9 18 fe ff ff       	jmp    8010a4b9 <unsafe_cg_open+0x169>
8010a6a1:	eb 0d                	jmp    8010a6b0 <unsafe_cg_read>
8010a6a3:	90                   	nop
8010a6a4:	90                   	nop
8010a6a5:	90                   	nop
8010a6a6:	90                   	nop
8010a6a7:	90                   	nop
8010a6a8:	90                   	nop
8010a6a9:	90                   	nop
8010a6aa:	90                   	nop
8010a6ab:	90                   	nop
8010a6ac:	90                   	nop
8010a6ad:	90                   	nop
8010a6ae:	90                   	nop
8010a6af:	90                   	nop

8010a6b0 <unsafe_cg_read>:
8010a6b0:	55                   	push   %ebp
8010a6b1:	89 e5                	mov    %esp,%ebp
8010a6b3:	57                   	push   %edi
8010a6b4:	56                   	push   %esi
8010a6b5:	53                   	push   %ebx
8010a6b6:	83 ec 7c             	sub    $0x7c,%esp
8010a6b9:	8b 45 08             	mov    0x8(%ebp),%eax
8010a6bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010a6bf:	85 c0                	test   %eax,%eax
8010a6c1:	0f 84 e4 02 00 00    	je     8010a9ab <unsafe_cg_read+0x2fb>
8010a6c7:	83 f8 01             	cmp    $0x1,%eax
8010a6ca:	75 1f                	jne    8010a6eb <unsafe_cg_read+0x3b>
8010a6cc:	83 ec 04             	sub    $0x4,%esp
8010a6cf:	68 00 10 00 00       	push   $0x1000
8010a6d4:	6a 00                	push   $0x0
8010a6d6:	68 c0 05 12 80       	push   $0x801205c0
8010a6db:	e8 c0 bc ff ff       	call   801063a0 <memset>
8010a6e0:	8b 47 10             	mov    0x10(%edi),%eax
8010a6e3:	83 c4 10             	add    $0x10,%esp
8010a6e6:	80 38 00             	cmpb   $0x0,(%eax)
8010a6e9:	75 15                	jne    8010a700 <unsafe_cg_read+0x50>
8010a6eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010a6ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010a6f3:	5b                   	pop    %ebx
8010a6f4:	5e                   	pop    %esi
8010a6f5:	5f                   	pop    %edi
8010a6f6:	5d                   	pop    %ebp
8010a6f7:	c3                   	ret    
8010a6f8:	90                   	nop
8010a6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010a700:	31 c0                	xor    %eax,%eax
8010a702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010a708:	c6 80 c0 05 12 80 20 	movb   $0x20,-0x7fedfa40(%eax)
8010a70f:	83 c0 01             	add    $0x1,%eax
8010a712:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010a717:	75 ef                	jne    8010a708 <unsafe_cg_read+0x58>
8010a719:	83 ec 0c             	sub    $0xc,%esp
8010a71c:	be 00 06 12 80       	mov    $0x80120600,%esi
8010a721:	68 d1 e8 10 80       	push   $0x8010e8d1
8010a726:	e8 05 bf ff ff       	call   80106630 <strlen>
8010a72b:	83 c4 0c             	add    $0xc,%esp
8010a72e:	50                   	push   %eax
8010a72f:	68 d1 e8 10 80       	push   $0x8010e8d1
8010a734:	68 c0 05 12 80       	push   $0x801205c0
8010a739:	e8 52 be ff ff       	call   80106590 <strncpy>
8010a73e:	8b 5f 10             	mov    0x10(%edi),%ebx
8010a741:	e8 6a 27 00 00       	call   8010ceb0 <cgroup_root>
8010a746:	83 c4 10             	add    $0x10,%esp
8010a749:	39 c3                	cmp    %eax,%ebx
8010a74b:	74 24                	je     8010a771 <unsafe_cg_read+0xc1>
8010a74d:	83 ec 0c             	sub    $0xc,%esp
8010a750:	68 d0 e8 10 80       	push   $0x8010e8d0
8010a755:	e8 d6 be ff ff       	call   80106630 <strlen>
8010a75a:	83 c4 0c             	add    $0xc,%esp
8010a75d:	50                   	push   %eax
8010a75e:	68 d0 e8 10 80       	push   $0x8010e8d0
8010a763:	56                   	push   %esi
8010a764:	be 40 06 12 80       	mov    $0x80120640,%esi
8010a769:	e8 22 be ff ff       	call   80106590 <strncpy>
8010a76e:	83 c4 10             	add    $0x10,%esp
8010a771:	83 ec 0c             	sub    $0xc,%esp
8010a774:	8d 5e 40             	lea    0x40(%esi),%ebx
8010a777:	68 27 f4 10 80       	push   $0x8010f427
8010a77c:	e8 af be ff ff       	call   80106630 <strlen>
8010a781:	83 c4 0c             	add    $0xc,%esp
8010a784:	50                   	push   %eax
8010a785:	68 27 f4 10 80       	push   $0x8010f427
8010a78a:	56                   	push   %esi
8010a78b:	e8 00 be ff ff       	call   80106590 <strncpy>
8010a790:	8b 47 10             	mov    0x10(%edi),%eax
8010a793:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010a796:	e8 15 27 00 00       	call   8010ceb0 <cgroup_root>
8010a79b:	83 c4 10             	add    $0x10,%esp
8010a79e:	39 45 84             	cmp    %eax,-0x7c(%ebp)
8010a7a1:	0f 84 88 00 00 00    	je     8010a82f <unsafe_cg_read+0x17f>
8010a7a7:	83 ec 0c             	sub    $0xc,%esp
8010a7aa:	68 73 f4 10 80       	push   $0x8010f473
8010a7af:	e8 7c be ff ff       	call   80106630 <strlen>
8010a7b4:	83 c4 0c             	add    $0xc,%esp
8010a7b7:	50                   	push   %eax
8010a7b8:	68 73 f4 10 80       	push   $0x8010f473
8010a7bd:	53                   	push   %ebx
8010a7be:	8d 9e 40 01 00 00    	lea    0x140(%esi),%ebx
8010a7c4:	e8 c7 bd ff ff       	call   80106590 <strncpy>
8010a7c9:	c7 04 24 34 f4 10 80 	movl   $0x8010f434,(%esp)
8010a7d0:	e8 5b be ff ff       	call   80106630 <strlen>
8010a7d5:	83 c4 0c             	add    $0xc,%esp
8010a7d8:	50                   	push   %eax
8010a7d9:	8d 86 80 00 00 00    	lea    0x80(%esi),%eax
8010a7df:	68 34 f4 10 80       	push   $0x8010f434
8010a7e4:	50                   	push   %eax
8010a7e5:	e8 a6 bd ff ff       	call   80106590 <strncpy>
8010a7ea:	c7 04 24 86 f4 10 80 	movl   $0x8010f486,(%esp)
8010a7f1:	e8 3a be ff ff       	call   80106630 <strlen>
8010a7f6:	83 c4 0c             	add    $0xc,%esp
8010a7f9:	50                   	push   %eax
8010a7fa:	8d 86 c0 00 00 00    	lea    0xc0(%esi),%eax
8010a800:	68 86 f4 10 80       	push   $0x8010f486
8010a805:	50                   	push   %eax
8010a806:	e8 85 bd ff ff       	call   80106590 <strncpy>
8010a80b:	c7 04 24 dc f4 10 80 	movl   $0x8010f4dc,(%esp)
8010a812:	e8 19 be ff ff       	call   80106630 <strlen>
8010a817:	83 c4 0c             	add    $0xc,%esp
8010a81a:	50                   	push   %eax
8010a81b:	8d 86 00 01 00 00    	lea    0x100(%esi),%eax
8010a821:	68 dc f4 10 80       	push   $0x8010f4dc
8010a826:	50                   	push   %eax
8010a827:	e8 64 bd ff ff       	call   80106590 <strncpy>
8010a82c:	83 c4 10             	add    $0x10,%esp
8010a82f:	83 ec 0c             	sub    $0xc,%esp
8010a832:	8d b3 c0 00 00 00    	lea    0xc0(%ebx),%esi
8010a838:	68 4b f4 10 80       	push   $0x8010f44b
8010a83d:	e8 ee bd ff ff       	call   80106630 <strlen>
8010a842:	83 c4 0c             	add    $0xc,%esp
8010a845:	50                   	push   %eax
8010a846:	68 4b f4 10 80       	push   $0x8010f44b
8010a84b:	53                   	push   %ebx
8010a84c:	e8 3f bd ff ff       	call   80106590 <strncpy>
8010a851:	c7 04 24 62 f4 10 80 	movl   $0x8010f462,(%esp)
8010a858:	e8 d3 bd ff ff       	call   80106630 <strlen>
8010a85d:	83 c4 0c             	add    $0xc,%esp
8010a860:	50                   	push   %eax
8010a861:	8d 43 40             	lea    0x40(%ebx),%eax
8010a864:	68 62 f4 10 80       	push   $0x8010f462
8010a869:	50                   	push   %eax
8010a86a:	e8 21 bd ff ff       	call   80106590 <strncpy>
8010a86f:	c7 04 24 94 f4 10 80 	movl   $0x8010f494,(%esp)
8010a876:	e8 b5 bd ff ff       	call   80106630 <strlen>
8010a87b:	83 c4 0c             	add    $0xc,%esp
8010a87e:	50                   	push   %eax
8010a87f:	8d 83 80 00 00 00    	lea    0x80(%ebx),%eax
8010a885:	68 94 f4 10 80       	push   $0x8010f494
8010a88a:	50                   	push   %eax
8010a88b:	e8 00 bd ff ff       	call   80106590 <strncpy>
8010a890:	8b 47 10             	mov    0x10(%edi),%eax
8010a893:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010a896:	e8 15 26 00 00       	call   8010ceb0 <cgroup_root>
8010a89b:	83 c4 10             	add    $0x10,%esp
8010a89e:	39 45 84             	cmp    %eax,-0x7c(%ebp)
8010a8a1:	0f 84 24 02 00 00    	je     8010aacb <unsafe_cg_read+0x41b>
8010a8a7:	83 ec 0c             	sub    $0xc,%esp
8010a8aa:	68 ea f4 10 80       	push   $0x8010f4ea
8010a8af:	e8 7c bd ff ff       	call   80106630 <strlen>
8010a8b4:	83 c4 0c             	add    $0xc,%esp
8010a8b7:	50                   	push   %eax
8010a8b8:	68 ea f4 10 80       	push   $0x8010f4ea
8010a8bd:	56                   	push   %esi
8010a8be:	8d b3 80 01 00 00    	lea    0x180(%ebx),%esi
8010a8c4:	e8 c7 bc ff ff       	call   80106590 <strncpy>
8010a8c9:	c7 04 24 b3 f4 10 80 	movl   $0x8010f4b3,(%esp)
8010a8d0:	e8 5b bd ff ff       	call   80106630 <strlen>
8010a8d5:	83 c4 0c             	add    $0xc,%esp
8010a8d8:	50                   	push   %eax
8010a8d9:	8d 83 00 01 00 00    	lea    0x100(%ebx),%eax
8010a8df:	68 b3 f4 10 80       	push   $0x8010f4b3
8010a8e4:	50                   	push   %eax
8010a8e5:	e8 a6 bc ff ff       	call   80106590 <strncpy>
8010a8ea:	c7 04 24 0f f5 10 80 	movl   $0x8010f50f,(%esp)
8010a8f1:	e8 3a bd ff ff       	call   80106630 <strlen>
8010a8f6:	83 c4 0c             	add    $0xc,%esp
8010a8f9:	50                   	push   %eax
8010a8fa:	8d 83 40 01 00 00    	lea    0x140(%ebx),%eax
8010a900:	68 0f f5 10 80       	push   $0x8010f50f
8010a905:	50                   	push   %eax
8010a906:	e8 85 bc ff ff       	call   80106590 <strncpy>
8010a90b:	8b 47 10             	mov    0x10(%edi),%eax
8010a90e:	83 c4 10             	add    $0x10,%esp
8010a911:	80 b8 0d 03 00 00 00 	cmpb   $0x0,0x30d(%eax)
8010a918:	0f 85 5f 01 00 00    	jne    8010aa7d <unsafe_cg_read+0x3cd>
8010a91e:	80 b8 0f 03 00 00 00 	cmpb   $0x0,0x30f(%eax)
8010a925:	0f 85 28 01 00 00    	jne    8010aa53 <unsafe_cg_read+0x3a3>
8010a92b:	80 b8 11 03 00 00 00 	cmpb   $0x0,0x311(%eax)
8010a932:	0f 85 f1 00 00 00    	jne    8010aa29 <unsafe_cg_read+0x379>
8010a938:	80 b8 13 03 00 00 00 	cmpb   $0x0,0x313(%eax)
8010a93f:	0f 85 9c 00 00 00    	jne    8010a9e1 <unsafe_cg_read+0x331>
8010a945:	83 ec 08             	sub    $0x8,%esp
8010a948:	50                   	push   %eax
8010a949:	56                   	push   %esi
8010a94a:	e8 31 2b 00 00       	call   8010d480 <get_cgroup_names_at_path>
8010a94f:	8b 57 0c             	mov    0xc(%edi),%edx
8010a952:	83 c4 10             	add    $0x10,%esp
8010a955:	81 fa ff 0f 00 00    	cmp    $0xfff,%edx
8010a95b:	89 d1                	mov    %edx,%ecx
8010a95d:	0f 87 d7 14 00 00    	ja     8010be3a <unsafe_cg_read+0x178a>
8010a963:	8b 45 14             	mov    0x14(%ebp),%eax
8010a966:	85 c0                	test   %eax,%eax
8010a968:	0f 84 cc 14 00 00    	je     8010be3a <unsafe_cg_read+0x178a>
8010a96e:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010a971:	8b 75 14             	mov    0x14(%ebp),%esi
8010a974:	29 d3                	sub    %edx,%ebx
8010a976:	eb 0c                	jmp    8010a984 <unsafe_cg_read+0x2d4>
8010a978:	90                   	nop
8010a979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010a980:	39 f0                	cmp    %esi,%eax
8010a982:	73 1c                	jae    8010a9a0 <unsafe_cg_read+0x2f0>
8010a984:	0f b6 82 c0 05 12 80 	movzbl -0x7fedfa40(%edx),%eax
8010a98b:	88 04 13             	mov    %al,(%ebx,%edx,1)
8010a98e:	83 c2 01             	add    $0x1,%edx
8010a991:	89 d0                	mov    %edx,%eax
8010a993:	2b 47 0c             	sub    0xc(%edi),%eax
8010a996:	81 fa 00 10 00 00    	cmp    $0x1000,%edx
8010a99c:	89 d1                	mov    %edx,%ecx
8010a99e:	75 e0                	jne    8010a980 <unsafe_cg_read+0x2d0>
8010a9a0:	89 4f 0c             	mov    %ecx,0xc(%edi)
8010a9a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010a9a6:	5b                   	pop    %ebx
8010a9a7:	5e                   	pop    %esi
8010a9a8:	5f                   	pop    %edi
8010a9a9:	5d                   	pop    %ebp
8010a9aa:	c3                   	ret    
8010a9ab:	8d 47 14             	lea    0x14(%edi),%eax
8010a9ae:	e8 9d f6 ff ff       	call   8010a050 <get_file_name_constant>
8010a9b3:	85 c0                	test   %eax,%eax
8010a9b5:	0f 84 30 fd ff ff    	je     8010a6eb <unsafe_cg_read+0x3b>
8010a9bb:	80 7f 08 00          	cmpb   $0x0,0x8(%edi)
8010a9bf:	0f 84 26 fd ff ff    	je     8010a6eb <unsafe_cg_read+0x3b>
8010a9c5:	8b 57 10             	mov    0x10(%edi),%edx
8010a9c8:	80 3a 00             	cmpb   $0x0,(%edx)
8010a9cb:	0f 84 1a fd ff ff    	je     8010a6eb <unsafe_cg_read+0x3b>
8010a9d1:	83 f8 13             	cmp    $0x13,%eax
8010a9d4:	0f 87 54 14 00 00    	ja     8010be2e <unsafe_cg_read+0x177e>
8010a9da:	ff 24 85 c8 f6 10 80 	jmp    *-0x7fef0938(,%eax,4)
8010a9e1:	83 ec 0c             	sub    $0xc,%esp
8010a9e4:	68 f9 f4 10 80       	push   $0x8010f4f9
8010a9e9:	e8 42 bc ff ff       	call   80106630 <strlen>
8010a9ee:	83 c4 0c             	add    $0xc,%esp
8010a9f1:	50                   	push   %eax
8010a9f2:	68 f9 f4 10 80       	push   $0x8010f4f9
8010a9f7:	56                   	push   %esi
8010a9f8:	e8 93 bb ff ff       	call   80106590 <strncpy>
8010a9fd:	c7 04 24 04 f5 10 80 	movl   $0x8010f504,(%esp)
8010aa04:	e8 27 bc ff ff       	call   80106630 <strlen>
8010aa09:	83 c4 0c             	add    $0xc,%esp
8010aa0c:	50                   	push   %eax
8010aa0d:	8d 46 40             	lea    0x40(%esi),%eax
8010aa10:	68 04 f5 10 80       	push   $0x8010f504
8010aa15:	83 ee 80             	sub    $0xffffff80,%esi
8010aa18:	50                   	push   %eax
8010aa19:	e8 72 bb ff ff       	call   80106590 <strncpy>
8010aa1e:	8b 47 10             	mov    0x10(%edi),%eax
8010aa21:	83 c4 10             	add    $0x10,%esp
8010aa24:	e9 1c ff ff ff       	jmp    8010a945 <unsafe_cg_read+0x295>
8010aa29:	83 ec 0c             	sub    $0xc,%esp
8010aa2c:	68 d0 f4 10 80       	push   $0x8010f4d0
8010aa31:	e8 fa bb ff ff       	call   80106630 <strlen>
8010aa36:	83 c4 0c             	add    $0xc,%esp
8010aa39:	50                   	push   %eax
8010aa3a:	68 d0 f4 10 80       	push   $0x8010f4d0
8010aa3f:	56                   	push   %esi
8010aa40:	83 c6 40             	add    $0x40,%esi
8010aa43:	e8 48 bb ff ff       	call   80106590 <strncpy>
8010aa48:	8b 47 10             	mov    0x10(%edi),%eax
8010aa4b:	83 c4 10             	add    $0x10,%esp
8010aa4e:	e9 e5 fe ff ff       	jmp    8010a938 <unsafe_cg_read+0x288>
8010aa53:	83 ec 0c             	sub    $0xc,%esp
8010aa56:	68 bc f4 10 80       	push   $0x8010f4bc
8010aa5b:	e8 d0 bb ff ff       	call   80106630 <strlen>
8010aa60:	83 c4 0c             	add    $0xc,%esp
8010aa63:	50                   	push   %eax
8010aa64:	68 bc f4 10 80       	push   $0x8010f4bc
8010aa69:	56                   	push   %esi
8010aa6a:	83 c6 40             	add    $0x40,%esi
8010aa6d:	e8 1e bb ff ff       	call   80106590 <strncpy>
8010aa72:	8b 47 10             	mov    0x10(%edi),%eax
8010aa75:	83 c4 10             	add    $0x10,%esp
8010aa78:	e9 ae fe ff ff       	jmp    8010a92b <unsafe_cg_read+0x27b>
8010aa7d:	83 ec 0c             	sub    $0xc,%esp
8010aa80:	68 a0 f4 10 80       	push   $0x8010f4a0
8010aa85:	e8 a6 bb ff ff       	call   80106630 <strlen>
8010aa8a:	83 c4 0c             	add    $0xc,%esp
8010aa8d:	50                   	push   %eax
8010aa8e:	68 a0 f4 10 80       	push   $0x8010f4a0
8010aa93:	56                   	push   %esi
8010aa94:	8d b3 00 02 00 00    	lea    0x200(%ebx),%esi
8010aa9a:	e8 f1 ba ff ff       	call   80106590 <strncpy>
8010aa9f:	c7 04 24 ab f4 10 80 	movl   $0x8010f4ab,(%esp)
8010aaa6:	e8 85 bb ff ff       	call   80106630 <strlen>
8010aaab:	83 c4 0c             	add    $0xc,%esp
8010aaae:	50                   	push   %eax
8010aaaf:	8d 83 c0 01 00 00    	lea    0x1c0(%ebx),%eax
8010aab5:	68 ab f4 10 80       	push   $0x8010f4ab
8010aaba:	50                   	push   %eax
8010aabb:	e8 d0 ba ff ff       	call   80106590 <strncpy>
8010aac0:	8b 47 10             	mov    0x10(%edi),%eax
8010aac3:	83 c4 10             	add    $0x10,%esp
8010aac6:	e9 53 fe ff ff       	jmp    8010a91e <unsafe_cg_read+0x26e>
8010aacb:	8b 47 10             	mov    0x10(%edi),%eax
8010aace:	e9 72 fe ff ff       	jmp    8010a945 <unsafe_cg_read+0x295>
8010aad3:	83 ec 0c             	sub    $0xc,%esp
8010aad6:	31 c9                	xor    %ecx,%ecx
8010aad8:	31 d2                	xor    %edx,%edx
8010aada:	68 f7 f5 10 80       	push   $0x8010f5f7
8010aadf:	31 db                	xor    %ebx,%ebx
8010aae1:	31 f6                	xor    %esi,%esi
8010aae3:	31 c0                	xor    %eax,%eax
8010aae5:	66 89 4d b5          	mov    %cx,-0x4b(%ebp)
8010aae9:	66 89 55 aa          	mov    %dx,-0x56(%ebp)
8010aaed:	66 89 5d c0          	mov    %bx,-0x40(%ebp)
8010aaf1:	66 89 75 cb          	mov    %si,-0x35(%ebp)
8010aaf5:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
8010aafc:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
8010ab03:	c7 45 ad 00 00 00 00 	movl   $0x0,-0x53(%ebp)
8010ab0a:	c7 45 b1 00 00 00 00 	movl   $0x0,-0x4f(%ebp)
8010ab11:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
8010ab18:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
8010ab1f:	c7 45 c3 00 00 00 00 	movl   $0x0,-0x3d(%ebp)
8010ab26:	c7 45 c7 00 00 00 00 	movl   $0x0,-0x39(%ebp)
8010ab2d:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010ab34:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010ab3b:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
8010ab3f:	e8 ec ba ff ff       	call   80106630 <strlen>
8010ab44:	89 c3                	mov    %eax,%ebx
8010ab46:	58                   	pop    %eax
8010ab47:	5a                   	pop    %edx
8010ab48:	8d 55 a2             	lea    -0x5e(%ebp),%edx
8010ab4b:	ff 77 58             	pushl  0x58(%edi)
8010ab4e:	52                   	push   %edx
8010ab4f:	89 55 84             	mov    %edx,-0x7c(%ebp)
8010ab52:	e8 29 f4 ff ff       	call   80109f80 <utoa>
8010ab57:	89 c6                	mov    %eax,%esi
8010ab59:	c7 04 24 05 f6 10 80 	movl   $0x8010f605,(%esp)
8010ab60:	8d 5c 33 01          	lea    0x1(%ebx,%esi,1),%ebx
8010ab64:	e8 c7 ba ff ff       	call   80106630 <strlen>
8010ab69:	59                   	pop    %ecx
8010ab6a:	01 c3                	add    %eax,%ebx
8010ab6c:	8d 45 ad             	lea    -0x53(%ebp),%eax
8010ab6f:	5e                   	pop    %esi
8010ab70:	ff 77 5c             	pushl  0x5c(%edi)
8010ab73:	50                   	push   %eax
8010ab74:	e8 07 f4 ff ff       	call   80109f80 <utoa>
8010ab79:	89 c6                	mov    %eax,%esi
8010ab7b:	c7 04 24 1e f6 10 80 	movl   $0x8010f61e,(%esp)
8010ab82:	8d 74 33 01          	lea    0x1(%ebx,%esi,1),%esi
8010ab86:	e8 a5 ba ff ff       	call   80106630 <strlen>
8010ab8b:	01 c6                	add    %eax,%esi
8010ab8d:	58                   	pop    %eax
8010ab8e:	8d 45 b8             	lea    -0x48(%ebp),%eax
8010ab91:	5a                   	pop    %edx
8010ab92:	ff 77 60             	pushl  0x60(%edi)
8010ab95:	50                   	push   %eax
8010ab96:	e8 e5 f3 ff ff       	call   80109f80 <utoa>
8010ab9b:	89 c3                	mov    %eax,%ebx
8010ab9d:	c7 04 24 29 f6 10 80 	movl   $0x8010f629,(%esp)
8010aba4:	8d 5c 1e 01          	lea    0x1(%esi,%ebx,1),%ebx
8010aba8:	e8 83 ba ff ff       	call   80106630 <strlen>
8010abad:	59                   	pop    %ecx
8010abae:	01 c3                	add    %eax,%ebx
8010abb0:	8d 45 c3             	lea    -0x3d(%ebp),%eax
8010abb3:	5e                   	pop    %esi
8010abb4:	ff 77 64             	pushl  0x64(%edi)
8010abb7:	50                   	push   %eax
8010abb8:	e8 c3 f3 ff ff       	call   80109f80 <utoa>
8010abbd:	89 c6                	mov    %eax,%esi
8010abbf:	c7 04 24 37 f6 10 80 	movl   $0x8010f637,(%esp)
8010abc6:	e8 65 ba ff ff       	call   80106630 <strlen>
8010abcb:	8d 4c 33 02          	lea    0x2(%ebx,%esi,1),%ecx
8010abcf:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
8010abd2:	8d 4d ce             	lea    -0x32(%ebp),%ecx
8010abd5:	58                   	pop    %eax
8010abd6:	5a                   	pop    %edx
8010abd7:	ff 77 68             	pushl  0x68(%edi)
8010abda:	51                   	push   %ecx
8010abdb:	89 4d 80             	mov    %ecx,-0x80(%ebp)
8010abde:	e8 9d f3 ff ff       	call   80109f80 <utoa>
8010abe3:	83 c4 0c             	add    $0xc,%esp
8010abe6:	01 d8                	add    %ebx,%eax
8010abe8:	50                   	push   %eax
8010abe9:	6a 00                	push   $0x0
8010abeb:	68 c0 05 12 80       	push   $0x801205c0
8010abf0:	e8 ab b7 ff ff       	call   801063a0 <memset>
8010abf5:	c7 04 24 f7 f5 10 80 	movl   $0x8010f5f7,(%esp)
8010abfc:	e8 2f ba ff ff       	call   80106630 <strlen>
8010ac01:	83 c4 0c             	add    $0xc,%esp
8010ac04:	89 c3                	mov    %eax,%ebx
8010ac06:	50                   	push   %eax
8010ac07:	68 f7 f5 10 80       	push   $0x8010f5f7
8010ac0c:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010ac12:	68 c0 05 12 80       	push   $0x801205c0
8010ac17:	e8 74 b9 ff ff       	call   80106590 <strncpy>
8010ac1c:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010ac1f:	89 14 24             	mov    %edx,(%esp)
8010ac22:	e8 09 ba ff ff       	call   80106630 <strlen>
8010ac27:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010ac2a:	83 c4 0c             	add    $0xc,%esp
8010ac2d:	89 c6                	mov    %eax,%esi
8010ac2f:	50                   	push   %eax
8010ac30:	52                   	push   %edx
8010ac31:	53                   	push   %ebx
8010ac32:	01 f3                	add    %esi,%ebx
8010ac34:	e8 57 b9 ff ff       	call   80106590 <strncpy>
8010ac39:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010ac40:	e8 eb b9 ff ff       	call   80106630 <strlen>
8010ac45:	83 c4 0c             	add    $0xc,%esp
8010ac48:	89 c6                	mov    %eax,%esi
8010ac4a:	50                   	push   %eax
8010ac4b:	68 b3 f3 10 80       	push   $0x8010f3b3
8010ac50:	53                   	push   %ebx
8010ac51:	e8 3a b9 ff ff       	call   80106590 <strncpy>
8010ac56:	01 f3                	add    %esi,%ebx
8010ac58:	c7 04 24 05 f6 10 80 	movl   $0x8010f605,(%esp)
8010ac5f:	e8 cc b9 ff ff       	call   80106630 <strlen>
8010ac64:	83 c4 0c             	add    $0xc,%esp
8010ac67:	89 c6                	mov    %eax,%esi
8010ac69:	50                   	push   %eax
8010ac6a:	68 05 f6 10 80       	push   $0x8010f605
8010ac6f:	53                   	push   %ebx
8010ac70:	01 f3                	add    %esi,%ebx
8010ac72:	e8 19 b9 ff ff       	call   80106590 <strncpy>
8010ac77:	8d 45 ad             	lea    -0x53(%ebp),%eax
8010ac7a:	89 04 24             	mov    %eax,(%esp)
8010ac7d:	e8 ae b9 ff ff       	call   80106630 <strlen>
8010ac82:	83 c4 0c             	add    $0xc,%esp
8010ac85:	89 c6                	mov    %eax,%esi
8010ac87:	50                   	push   %eax
8010ac88:	8d 45 ad             	lea    -0x53(%ebp),%eax
8010ac8b:	50                   	push   %eax
8010ac8c:	53                   	push   %ebx
8010ac8d:	01 f3                	add    %esi,%ebx
8010ac8f:	e8 fc b8 ff ff       	call   80106590 <strncpy>
8010ac94:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010ac9b:	e8 90 b9 ff ff       	call   80106630 <strlen>
8010aca0:	83 c4 0c             	add    $0xc,%esp
8010aca3:	89 c6                	mov    %eax,%esi
8010aca5:	50                   	push   %eax
8010aca6:	68 b3 f3 10 80       	push   $0x8010f3b3
8010acab:	53                   	push   %ebx
8010acac:	01 f3                	add    %esi,%ebx
8010acae:	e8 dd b8 ff ff       	call   80106590 <strncpy>
8010acb3:	c7 04 24 1e f6 10 80 	movl   $0x8010f61e,(%esp)
8010acba:	e8 71 b9 ff ff       	call   80106630 <strlen>
8010acbf:	83 c4 0c             	add    $0xc,%esp
8010acc2:	89 c6                	mov    %eax,%esi
8010acc4:	50                   	push   %eax
8010acc5:	68 1e f6 10 80       	push   $0x8010f61e
8010acca:	53                   	push   %ebx
8010accb:	01 f3                	add    %esi,%ebx
8010accd:	e8 be b8 ff ff       	call   80106590 <strncpy>
8010acd2:	8d 45 b8             	lea    -0x48(%ebp),%eax
8010acd5:	89 04 24             	mov    %eax,(%esp)
8010acd8:	e8 53 b9 ff ff       	call   80106630 <strlen>
8010acdd:	83 c4 0c             	add    $0xc,%esp
8010ace0:	89 c6                	mov    %eax,%esi
8010ace2:	50                   	push   %eax
8010ace3:	8d 45 b8             	lea    -0x48(%ebp),%eax
8010ace6:	50                   	push   %eax
8010ace7:	53                   	push   %ebx
8010ace8:	01 f3                	add    %esi,%ebx
8010acea:	e8 a1 b8 ff ff       	call   80106590 <strncpy>
8010acef:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010acf6:	e8 35 b9 ff ff       	call   80106630 <strlen>
8010acfb:	83 c4 0c             	add    $0xc,%esp
8010acfe:	89 c6                	mov    %eax,%esi
8010ad00:	50                   	push   %eax
8010ad01:	68 b3 f3 10 80       	push   $0x8010f3b3
8010ad06:	53                   	push   %ebx
8010ad07:	01 f3                	add    %esi,%ebx
8010ad09:	e8 82 b8 ff ff       	call   80106590 <strncpy>
8010ad0e:	c7 04 24 29 f6 10 80 	movl   $0x8010f629,(%esp)
8010ad15:	e8 16 b9 ff ff       	call   80106630 <strlen>
8010ad1a:	83 c4 0c             	add    $0xc,%esp
8010ad1d:	89 c6                	mov    %eax,%esi
8010ad1f:	50                   	push   %eax
8010ad20:	68 29 f6 10 80       	push   $0x8010f629
8010ad25:	53                   	push   %ebx
8010ad26:	01 f3                	add    %esi,%ebx
8010ad28:	e8 63 b8 ff ff       	call   80106590 <strncpy>
8010ad2d:	8d 45 c3             	lea    -0x3d(%ebp),%eax
8010ad30:	89 04 24             	mov    %eax,(%esp)
8010ad33:	e8 f8 b8 ff ff       	call   80106630 <strlen>
8010ad38:	83 c4 0c             	add    $0xc,%esp
8010ad3b:	89 c6                	mov    %eax,%esi
8010ad3d:	50                   	push   %eax
8010ad3e:	8d 45 c3             	lea    -0x3d(%ebp),%eax
8010ad41:	50                   	push   %eax
8010ad42:	53                   	push   %ebx
8010ad43:	e8 48 b8 ff ff       	call   80106590 <strncpy>
8010ad48:	01 f3                	add    %esi,%ebx
8010ad4a:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010ad51:	e8 da b8 ff ff       	call   80106630 <strlen>
8010ad56:	83 c4 0c             	add    $0xc,%esp
8010ad59:	89 c6                	mov    %eax,%esi
8010ad5b:	50                   	push   %eax
8010ad5c:	68 b3 f3 10 80       	push   $0x8010f3b3
8010ad61:	53                   	push   %ebx
8010ad62:	01 f3                	add    %esi,%ebx
8010ad64:	e8 27 b8 ff ff       	call   80106590 <strncpy>
8010ad69:	c7 04 24 37 f6 10 80 	movl   $0x8010f637,(%esp)
8010ad70:	e8 bb b8 ff ff       	call   80106630 <strlen>
8010ad75:	83 c4 0c             	add    $0xc,%esp
8010ad78:	89 c6                	mov    %eax,%esi
8010ad7a:	50                   	push   %eax
8010ad7b:	68 41 f6 10 80       	push   $0x8010f641
8010ad80:	53                   	push   %ebx
8010ad81:	01 f3                	add    %esi,%ebx
8010ad83:	e8 08 b8 ff ff       	call   80106590 <strncpy>
8010ad88:	8b 4d 80             	mov    -0x80(%ebp),%ecx
8010ad8b:	89 0c 24             	mov    %ecx,(%esp)
8010ad8e:	89 4d 84             	mov    %ecx,-0x7c(%ebp)
8010ad91:	e8 9a b8 ff ff       	call   80106630 <strlen>
8010ad96:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
8010ad99:	83 c4 0c             	add    $0xc,%esp
8010ad9c:	89 c6                	mov    %eax,%esi
8010ad9e:	50                   	push   %eax
8010ad9f:	51                   	push   %ecx
8010ada0:	53                   	push   %ebx
8010ada1:	01 f3                	add    %esi,%ebx
8010ada3:	e8 e8 b7 ff ff       	call   80106590 <strncpy>
8010ada8:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010adaf:	e8 7c b8 ff ff       	call   80106630 <strlen>
8010adb4:	83 c4 0c             	add    $0xc,%esp
8010adb7:	89 c6                	mov    %eax,%esi
8010adb9:	50                   	push   %eax
8010adba:	68 b3 f3 10 80       	push   $0x8010f3b3
8010adbf:	53                   	push   %ebx
8010adc0:	e8 cb b7 ff ff       	call   80106590 <strncpy>
8010adc5:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010adc8:	8b 47 0c             	mov    0xc(%edi),%eax
8010adcb:	83 c4 10             	add    $0x10,%esp
8010adce:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010add4:	39 c2                	cmp    %eax,%edx
8010add6:	0f 84 55 10 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010addc:	29 c2                	sub    %eax,%edx
8010adde:	3b 55 14             	cmp    0x14(%ebp),%edx
8010ade1:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010ade5:	85 d2                	test   %edx,%edx
8010ade7:	0f 8e 44 10 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010aded:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010adf4:	84 c9                	test   %cl,%cl
8010adf6:	0f 84 35 10 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010adfc:	31 db                	xor    %ebx,%ebx
8010adfe:	8b 75 10             	mov    0x10(%ebp),%esi
8010ae01:	eb 0c                	jmp    8010ae0f <unsafe_cg_read+0x75f>
8010ae03:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010ae0a:	80 
8010ae0b:	84 c9                	test   %cl,%cl
8010ae0d:	74 0a                	je     8010ae19 <unsafe_cg_read+0x769>
8010ae0f:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010ae12:	83 c3 01             	add    $0x1,%ebx
8010ae15:	39 da                	cmp    %ebx,%edx
8010ae17:	75 ea                	jne    8010ae03 <unsafe_cg_read+0x753>
8010ae19:	8b 47 0c             	mov    0xc(%edi),%eax
8010ae1c:	89 da                	mov    %ebx,%edx
8010ae1e:	e9 a3 08 00 00       	jmp    8010b6c6 <unsafe_cg_read+0x1016>
8010ae23:	8d 75 ce             	lea    -0x32(%ebp),%esi
8010ae26:	83 ec 08             	sub    $0x8,%esp
8010ae29:	31 c9                	xor    %ecx,%ecx
8010ae2b:	66 89 4d d6          	mov    %cx,-0x2a(%ebp)
8010ae2f:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010ae36:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010ae3d:	ff b2 38 03 00 00    	pushl  0x338(%edx)
8010ae43:	56                   	push   %esi
8010ae44:	e8 37 f1 ff ff       	call   80109f80 <utoa>
8010ae49:	89 34 24             	mov    %esi,(%esp)
8010ae4c:	e8 df b7 ff ff       	call   80106630 <strlen>
8010ae51:	83 c4 0c             	add    $0xc,%esp
8010ae54:	89 c3                	mov    %eax,%ebx
8010ae56:	50                   	push   %eax
8010ae57:	56                   	push   %esi
8010ae58:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010ae5e:	68 c0 05 12 80       	push   $0x801205c0
8010ae63:	e8 28 b7 ff ff       	call   80106590 <strncpy>
8010ae68:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010ae6f:	e8 bc b7 ff ff       	call   80106630 <strlen>
8010ae74:	83 c4 0c             	add    $0xc,%esp
8010ae77:	89 c6                	mov    %eax,%esi
8010ae79:	50                   	push   %eax
8010ae7a:	68 b3 f3 10 80       	push   $0x8010f3b3
8010ae7f:	53                   	push   %ebx
8010ae80:	e8 0b b7 ff ff       	call   80106590 <strncpy>
8010ae85:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010ae88:	8b 47 0c             	mov    0xc(%edi),%eax
8010ae8b:	83 c4 10             	add    $0x10,%esp
8010ae8e:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010ae94:	39 c2                	cmp    %eax,%edx
8010ae96:	0f 84 95 0f 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010ae9c:	29 c2                	sub    %eax,%edx
8010ae9e:	3b 55 14             	cmp    0x14(%ebp),%edx
8010aea1:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010aea5:	85 d2                	test   %edx,%edx
8010aea7:	0f 8e 84 0f 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010aead:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010aeb4:	84 c9                	test   %cl,%cl
8010aeb6:	0f 84 75 0f 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010aebc:	31 db                	xor    %ebx,%ebx
8010aebe:	8b 75 10             	mov    0x10(%ebp),%esi
8010aec1:	eb 10                	jmp    8010aed3 <unsafe_cg_read+0x823>
8010aec3:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010aeca:	80 
8010aecb:	84 c9                	test   %cl,%cl
8010aecd:	0f 84 46 ff ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010aed3:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010aed6:	83 c3 01             	add    $0x1,%ebx
8010aed9:	39 da                	cmp    %ebx,%edx
8010aedb:	75 e6                	jne    8010aec3 <unsafe_cg_read+0x813>
8010aedd:	e9 37 ff ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010aee2:	8d 75 ce             	lea    -0x32(%ebp),%esi
8010aee5:	83 ec 08             	sub    $0x8,%esp
8010aee8:	31 c0                	xor    %eax,%eax
8010aeea:	66 89 45 ce          	mov    %ax,-0x32(%ebp)
8010aeee:	c6 45 d0 00          	movb   $0x0,-0x30(%ebp)
8010aef2:	ff b2 04 03 00 00    	pushl  0x304(%edx)
8010aef8:	56                   	push   %esi
8010aef9:	e8 d2 ef ff ff       	call   80109ed0 <itoa>
8010aefe:	c7 04 24 dc f5 10 80 	movl   $0x8010f5dc,(%esp)
8010af05:	e8 26 b7 ff ff       	call   80106630 <strlen>
8010af0a:	83 c4 0c             	add    $0xc,%esp
8010af0d:	89 c3                	mov    %eax,%ebx
8010af0f:	50                   	push   %eax
8010af10:	68 dc f5 10 80       	push   $0x8010f5dc
8010af15:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010af1b:	68 c0 05 12 80       	push   $0x801205c0
8010af20:	e8 6b b6 ff ff       	call   80106590 <strncpy>
8010af25:	89 34 24             	mov    %esi,(%esp)
8010af28:	e8 03 b7 ff ff       	call   80106630 <strlen>
8010af2d:	83 c4 0c             	add    $0xc,%esp
8010af30:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010af33:	50                   	push   %eax
8010af34:	56                   	push   %esi
8010af35:	53                   	push   %ebx
8010af36:	e8 55 b6 ff ff       	call   80106590 <strncpy>
8010af3b:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010af3e:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010af45:	01 d3                	add    %edx,%ebx
8010af47:	e8 e4 b6 ff ff       	call   80106630 <strlen>
8010af4c:	83 c4 0c             	add    $0xc,%esp
8010af4f:	89 c6                	mov    %eax,%esi
8010af51:	50                   	push   %eax
8010af52:	68 b3 f3 10 80       	push   $0x8010f3b3
8010af57:	53                   	push   %ebx
8010af58:	e8 33 b6 ff ff       	call   80106590 <strncpy>
8010af5d:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010af60:	8b 47 0c             	mov    0xc(%edi),%eax
8010af63:	83 c4 10             	add    $0x10,%esp
8010af66:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010af6c:	39 c2                	cmp    %eax,%edx
8010af6e:	0f 84 bd 0e 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010af74:	29 c2                	sub    %eax,%edx
8010af76:	3b 55 14             	cmp    0x14(%ebp),%edx
8010af79:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010af7d:	85 d2                	test   %edx,%edx
8010af7f:	0f 8e ac 0e 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010af85:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010af8c:	84 c9                	test   %cl,%cl
8010af8e:	0f 84 9d 0e 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010af94:	31 db                	xor    %ebx,%ebx
8010af96:	8b 75 10             	mov    0x10(%ebp),%esi
8010af99:	eb 10                	jmp    8010afab <unsafe_cg_read+0x8fb>
8010af9b:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010afa2:	80 
8010afa3:	84 c9                	test   %cl,%cl
8010afa5:	0f 84 6e fe ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010afab:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010afae:	83 c3 01             	add    $0x1,%ebx
8010afb1:	39 da                	cmp    %ebx,%edx
8010afb3:	75 e6                	jne    8010af9b <unsafe_cg_read+0x8eb>
8010afb5:	e9 5f fe ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010afba:	31 c0                	xor    %eax,%eax
8010afbc:	8d 75 97             	lea    -0x69(%ebp),%esi
8010afbf:	83 ec 08             	sub    $0x8,%esp
8010afc2:	66 89 45 9f          	mov    %ax,-0x61(%ebp)
8010afc6:	31 c0                	xor    %eax,%eax
8010afc8:	ff 77 58             	pushl  0x58(%edi)
8010afcb:	66 89 45 aa          	mov    %ax,-0x56(%ebp)
8010afcf:	31 c0                	xor    %eax,%eax
8010afd1:	56                   	push   %esi
8010afd2:	66 89 45 b5          	mov    %ax,-0x4b(%ebp)
8010afd6:	31 c0                	xor    %eax,%eax
8010afd8:	c7 45 97 00 00 00 00 	movl   $0x0,-0x69(%ebp)
8010afdf:	66 89 45 c0          	mov    %ax,-0x40(%ebp)
8010afe3:	31 c0                	xor    %eax,%eax
8010afe5:	c7 45 9b 00 00 00 00 	movl   $0x0,-0x65(%ebp)
8010afec:	66 89 45 cb          	mov    %ax,-0x35(%ebp)
8010aff0:	31 c0                	xor    %eax,%eax
8010aff2:	c6 45 a1 00          	movb   $0x0,-0x5f(%ebp)
8010aff6:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
8010affd:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
8010b004:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
8010b008:	c7 45 ad 00 00 00 00 	movl   $0x0,-0x53(%ebp)
8010b00f:	c7 45 b1 00 00 00 00 	movl   $0x0,-0x4f(%ebp)
8010b016:	c6 45 b7 00          	movb   $0x0,-0x49(%ebp)
8010b01a:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
8010b021:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
8010b028:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
8010b02c:	c7 45 c3 00 00 00 00 	movl   $0x0,-0x3d(%ebp)
8010b033:	c7 45 c7 00 00 00 00 	movl   $0x0,-0x39(%ebp)
8010b03a:	c6 45 cd 00          	movb   $0x0,-0x33(%ebp)
8010b03e:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010b045:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010b04c:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
8010b050:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
8010b054:	e8 77 ee ff ff       	call   80109ed0 <itoa>
8010b059:	5a                   	pop    %edx
8010b05a:	8d 45 a2             	lea    -0x5e(%ebp),%eax
8010b05d:	59                   	pop    %ecx
8010b05e:	ff 77 5c             	pushl  0x5c(%edi)
8010b061:	50                   	push   %eax
8010b062:	e8 69 ee ff ff       	call   80109ed0 <itoa>
8010b067:	5b                   	pop    %ebx
8010b068:	8d 4d ad             	lea    -0x53(%ebp),%ecx
8010b06b:	58                   	pop    %eax
8010b06c:	ff 77 60             	pushl  0x60(%edi)
8010b06f:	51                   	push   %ecx
8010b070:	89 4d 80             	mov    %ecx,-0x80(%ebp)
8010b073:	e8 58 ee ff ff       	call   80109ed0 <itoa>
8010b078:	58                   	pop    %eax
8010b079:	8d 45 b8             	lea    -0x48(%ebp),%eax
8010b07c:	5a                   	pop    %edx
8010b07d:	ff 77 64             	pushl  0x64(%edi)
8010b080:	50                   	push   %eax
8010b081:	e8 4a ee ff ff       	call   80109ed0 <itoa>
8010b086:	59                   	pop    %ecx
8010b087:	8d 45 c3             	lea    -0x3d(%ebp),%eax
8010b08a:	5b                   	pop    %ebx
8010b08b:	ff 77 68             	pushl  0x68(%edi)
8010b08e:	50                   	push   %eax
8010b08f:	e8 3c ee ff ff       	call   80109ed0 <itoa>
8010b094:	58                   	pop    %eax
8010b095:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b098:	5a                   	pop    %edx
8010b099:	ff 77 6c             	pushl  0x6c(%edi)
8010b09c:	50                   	push   %eax
8010b09d:	e8 2e ee ff ff       	call   80109ed0 <itoa>
8010b0a2:	c7 04 24 66 f5 10 80 	movl   $0x8010f566,(%esp)
8010b0a9:	e8 82 b5 ff ff       	call   80106630 <strlen>
8010b0ae:	83 c4 0c             	add    $0xc,%esp
8010b0b1:	89 c3                	mov    %eax,%ebx
8010b0b3:	50                   	push   %eax
8010b0b4:	68 66 f5 10 80       	push   $0x8010f566
8010b0b9:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010b0bf:	68 c0 05 12 80       	push   $0x801205c0
8010b0c4:	e8 c7 b4 ff ff       	call   80106590 <strncpy>
8010b0c9:	89 34 24             	mov    %esi,(%esp)
8010b0cc:	e8 5f b5 ff ff       	call   80106630 <strlen>
8010b0d1:	83 c4 0c             	add    $0xc,%esp
8010b0d4:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010b0d7:	50                   	push   %eax
8010b0d8:	56                   	push   %esi
8010b0d9:	53                   	push   %ebx
8010b0da:	e8 b1 b4 ff ff       	call   80106590 <strncpy>
8010b0df:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010b0e2:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b0e9:	01 d3                	add    %edx,%ebx
8010b0eb:	e8 40 b5 ff ff       	call   80106630 <strlen>
8010b0f0:	83 c4 0c             	add    $0xc,%esp
8010b0f3:	89 c6                	mov    %eax,%esi
8010b0f5:	50                   	push   %eax
8010b0f6:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b0fb:	53                   	push   %ebx
8010b0fc:	01 f3                	add    %esi,%ebx
8010b0fe:	e8 8d b4 ff ff       	call   80106590 <strncpy>
8010b103:	c7 04 24 74 f5 10 80 	movl   $0x8010f574,(%esp)
8010b10a:	e8 21 b5 ff ff       	call   80106630 <strlen>
8010b10f:	83 c4 0c             	add    $0xc,%esp
8010b112:	89 c6                	mov    %eax,%esi
8010b114:	50                   	push   %eax
8010b115:	68 74 f5 10 80       	push   $0x8010f574
8010b11a:	53                   	push   %ebx
8010b11b:	01 f3                	add    %esi,%ebx
8010b11d:	e8 6e b4 ff ff       	call   80106590 <strncpy>
8010b122:	8d 45 a2             	lea    -0x5e(%ebp),%eax
8010b125:	89 04 24             	mov    %eax,(%esp)
8010b128:	e8 03 b5 ff ff       	call   80106630 <strlen>
8010b12d:	83 c4 0c             	add    $0xc,%esp
8010b130:	89 c6                	mov    %eax,%esi
8010b132:	50                   	push   %eax
8010b133:	8d 45 a2             	lea    -0x5e(%ebp),%eax
8010b136:	50                   	push   %eax
8010b137:	53                   	push   %ebx
8010b138:	e8 53 b4 ff ff       	call   80106590 <strncpy>
8010b13d:	01 f3                	add    %esi,%ebx
8010b13f:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b146:	e8 e5 b4 ff ff       	call   80106630 <strlen>
8010b14b:	83 c4 0c             	add    $0xc,%esp
8010b14e:	89 c6                	mov    %eax,%esi
8010b150:	50                   	push   %eax
8010b151:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b156:	53                   	push   %ebx
8010b157:	01 f3                	add    %esi,%ebx
8010b159:	e8 32 b4 ff ff       	call   80106590 <strncpy>
8010b15e:	c7 04 24 81 f5 10 80 	movl   $0x8010f581,(%esp)
8010b165:	e8 c6 b4 ff ff       	call   80106630 <strlen>
8010b16a:	83 c4 0c             	add    $0xc,%esp
8010b16d:	89 c6                	mov    %eax,%esi
8010b16f:	50                   	push   %eax
8010b170:	68 81 f5 10 80       	push   $0x8010f581
8010b175:	53                   	push   %ebx
8010b176:	01 f3                	add    %esi,%ebx
8010b178:	e8 13 b4 ff ff       	call   80106590 <strncpy>
8010b17d:	8b 4d 80             	mov    -0x80(%ebp),%ecx
8010b180:	89 0c 24             	mov    %ecx,(%esp)
8010b183:	89 4d 84             	mov    %ecx,-0x7c(%ebp)
8010b186:	e8 a5 b4 ff ff       	call   80106630 <strlen>
8010b18b:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
8010b18e:	83 c4 0c             	add    $0xc,%esp
8010b191:	89 c6                	mov    %eax,%esi
8010b193:	50                   	push   %eax
8010b194:	51                   	push   %ecx
8010b195:	53                   	push   %ebx
8010b196:	01 f3                	add    %esi,%ebx
8010b198:	e8 f3 b3 ff ff       	call   80106590 <strncpy>
8010b19d:	83 c4 10             	add    $0x10,%esp
8010b1a0:	80 7f 54 00          	cmpb   $0x0,0x54(%edi)
8010b1a4:	0f 84 15 01 00 00    	je     8010b2bf <unsafe_cg_read+0xc0f>
8010b1aa:	83 ec 0c             	sub    $0xc,%esp
8010b1ad:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b1b2:	e8 79 b4 ff ff       	call   80106630 <strlen>
8010b1b7:	83 c4 0c             	add    $0xc,%esp
8010b1ba:	89 c6                	mov    %eax,%esi
8010b1bc:	50                   	push   %eax
8010b1bd:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b1c2:	53                   	push   %ebx
8010b1c3:	01 f3                	add    %esi,%ebx
8010b1c5:	e8 c6 b3 ff ff       	call   80106590 <strncpy>
8010b1ca:	c7 04 24 90 f5 10 80 	movl   $0x8010f590,(%esp)
8010b1d1:	e8 5a b4 ff ff       	call   80106630 <strlen>
8010b1d6:	83 c4 0c             	add    $0xc,%esp
8010b1d9:	89 c6                	mov    %eax,%esi
8010b1db:	50                   	push   %eax
8010b1dc:	68 90 f5 10 80       	push   $0x8010f590
8010b1e1:	53                   	push   %ebx
8010b1e2:	01 f3                	add    %esi,%ebx
8010b1e4:	e8 a7 b3 ff ff       	call   80106590 <strncpy>
8010b1e9:	8d 45 b8             	lea    -0x48(%ebp),%eax
8010b1ec:	89 04 24             	mov    %eax,(%esp)
8010b1ef:	e8 3c b4 ff ff       	call   80106630 <strlen>
8010b1f4:	83 c4 0c             	add    $0xc,%esp
8010b1f7:	89 c6                	mov    %eax,%esi
8010b1f9:	50                   	push   %eax
8010b1fa:	8d 45 b8             	lea    -0x48(%ebp),%eax
8010b1fd:	50                   	push   %eax
8010b1fe:	53                   	push   %ebx
8010b1ff:	01 f3                	add    %esi,%ebx
8010b201:	e8 8a b3 ff ff       	call   80106590 <strncpy>
8010b206:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b20d:	e8 1e b4 ff ff       	call   80106630 <strlen>
8010b212:	83 c4 0c             	add    $0xc,%esp
8010b215:	89 c6                	mov    %eax,%esi
8010b217:	50                   	push   %eax
8010b218:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b21d:	53                   	push   %ebx
8010b21e:	01 f3                	add    %esi,%ebx
8010b220:	e8 6b b3 ff ff       	call   80106590 <strncpy>
8010b225:	c7 04 24 9e f5 10 80 	movl   $0x8010f59e,(%esp)
8010b22c:	e8 ff b3 ff ff       	call   80106630 <strlen>
8010b231:	83 c4 0c             	add    $0xc,%esp
8010b234:	89 c6                	mov    %eax,%esi
8010b236:	50                   	push   %eax
8010b237:	68 9e f5 10 80       	push   $0x8010f59e
8010b23c:	53                   	push   %ebx
8010b23d:	01 f3                	add    %esi,%ebx
8010b23f:	e8 4c b3 ff ff       	call   80106590 <strncpy>
8010b244:	8d 45 c3             	lea    -0x3d(%ebp),%eax
8010b247:	89 04 24             	mov    %eax,(%esp)
8010b24a:	e8 e1 b3 ff ff       	call   80106630 <strlen>
8010b24f:	83 c4 0c             	add    $0xc,%esp
8010b252:	89 c6                	mov    %eax,%esi
8010b254:	50                   	push   %eax
8010b255:	8d 45 c3             	lea    -0x3d(%ebp),%eax
8010b258:	50                   	push   %eax
8010b259:	53                   	push   %ebx
8010b25a:	01 f3                	add    %esi,%ebx
8010b25c:	e8 2f b3 ff ff       	call   80106590 <strncpy>
8010b261:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b268:	e8 c3 b3 ff ff       	call   80106630 <strlen>
8010b26d:	83 c4 0c             	add    $0xc,%esp
8010b270:	89 c6                	mov    %eax,%esi
8010b272:	50                   	push   %eax
8010b273:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b278:	53                   	push   %ebx
8010b279:	01 f3                	add    %esi,%ebx
8010b27b:	e8 10 b3 ff ff       	call   80106590 <strncpy>
8010b280:	c7 04 24 ae f5 10 80 	movl   $0x8010f5ae,(%esp)
8010b287:	e8 a4 b3 ff ff       	call   80106630 <strlen>
8010b28c:	83 c4 0c             	add    $0xc,%esp
8010b28f:	89 c6                	mov    %eax,%esi
8010b291:	50                   	push   %eax
8010b292:	68 ae f5 10 80       	push   $0x8010f5ae
8010b297:	53                   	push   %ebx
8010b298:	e8 f3 b2 ff ff       	call   80106590 <strncpy>
8010b29d:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b2a0:	01 f3                	add    %esi,%ebx
8010b2a2:	89 04 24             	mov    %eax,(%esp)
8010b2a5:	e8 86 b3 ff ff       	call   80106630 <strlen>
8010b2aa:	83 c4 0c             	add    $0xc,%esp
8010b2ad:	89 c6                	mov    %eax,%esi
8010b2af:	50                   	push   %eax
8010b2b0:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b2b3:	50                   	push   %eax
8010b2b4:	53                   	push   %ebx
8010b2b5:	01 f3                	add    %esi,%ebx
8010b2b7:	e8 d4 b2 ff ff       	call   80106590 <strncpy>
8010b2bc:	83 c4 10             	add    $0x10,%esp
8010b2bf:	83 ec 0c             	sub    $0xc,%esp
8010b2c2:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b2c7:	e8 64 b3 ff ff       	call   80106630 <strlen>
8010b2cc:	83 c4 0c             	add    $0xc,%esp
8010b2cf:	89 c6                	mov    %eax,%esi
8010b2d1:	50                   	push   %eax
8010b2d2:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b2d7:	53                   	push   %ebx
8010b2d8:	e8 b3 b2 ff ff       	call   80106590 <strncpy>
8010b2dd:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010b2e0:	8b 47 0c             	mov    0xc(%edi),%eax
8010b2e3:	83 c4 10             	add    $0x10,%esp
8010b2e6:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010b2ec:	39 c2                	cmp    %eax,%edx
8010b2ee:	0f 84 3d 0b 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b2f4:	29 c2                	sub    %eax,%edx
8010b2f6:	3b 55 14             	cmp    0x14(%ebp),%edx
8010b2f9:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010b2fd:	85 d2                	test   %edx,%edx
8010b2ff:	0f 8e 2c 0b 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010b305:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010b30c:	84 c9                	test   %cl,%cl
8010b30e:	0f 84 1d 0b 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b314:	31 db                	xor    %ebx,%ebx
8010b316:	8b 75 10             	mov    0x10(%ebp),%esi
8010b319:	eb 10                	jmp    8010b32b <unsafe_cg_read+0xc7b>
8010b31b:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010b322:	80 
8010b323:	84 c9                	test   %cl,%cl
8010b325:	0f 84 ee fa ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010b32b:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010b32e:	83 c3 01             	add    $0x1,%ebx
8010b331:	39 da                	cmp    %ebx,%edx
8010b333:	75 e6                	jne    8010b31b <unsafe_cg_read+0xc6b>
8010b335:	e9 df fa ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010b33a:	8d 75 c3             	lea    -0x3d(%ebp),%esi
8010b33d:	83 ec 04             	sub    $0x4,%esp
8010b340:	6a 03                	push   $0x3
8010b342:	6a 00                	push   $0x0
8010b344:	56                   	push   %esi
8010b345:	e8 56 b0 ff ff       	call   801063a0 <memset>
8010b34a:	8b 47 10             	mov    0x10(%edi),%eax
8010b34d:	59                   	pop    %ecx
8010b34e:	5b                   	pop    %ebx
8010b34f:	ff b0 24 03 00 00    	pushl  0x324(%eax)
8010b355:	56                   	push   %esi
8010b356:	e8 75 eb ff ff       	call   80109ed0 <itoa>
8010b35b:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b35e:	83 c4 0c             	add    $0xc,%esp
8010b361:	6a 03                	push   $0x3
8010b363:	6a 00                	push   $0x0
8010b365:	50                   	push   %eax
8010b366:	e8 35 b0 ff ff       	call   801063a0 <memset>
8010b36b:	58                   	pop    %eax
8010b36c:	8b 47 10             	mov    0x10(%edi),%eax
8010b36f:	5a                   	pop    %edx
8010b370:	ff b0 28 03 00 00    	pushl  0x328(%eax)
8010b376:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b379:	50                   	push   %eax
8010b37a:	e8 51 eb ff ff       	call   80109ed0 <itoa>
8010b37f:	c7 04 24 3c f5 10 80 	movl   $0x8010f53c,(%esp)
8010b386:	e8 a5 b2 ff ff       	call   80106630 <strlen>
8010b38b:	83 c4 0c             	add    $0xc,%esp
8010b38e:	89 c3                	mov    %eax,%ebx
8010b390:	50                   	push   %eax
8010b391:	68 3c f5 10 80       	push   $0x8010f53c
8010b396:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010b39c:	68 c0 05 12 80       	push   $0x801205c0
8010b3a1:	e8 ea b1 ff ff       	call   80106590 <strncpy>
8010b3a6:	89 34 24             	mov    %esi,(%esp)
8010b3a9:	e8 82 b2 ff ff       	call   80106630 <strlen>
8010b3ae:	83 c4 0c             	add    $0xc,%esp
8010b3b1:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010b3b4:	50                   	push   %eax
8010b3b5:	56                   	push   %esi
8010b3b6:	53                   	push   %ebx
8010b3b7:	e8 d4 b1 ff ff       	call   80106590 <strncpy>
8010b3bc:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010b3bf:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b3c6:	01 d3                	add    %edx,%ebx
8010b3c8:	e8 63 b2 ff ff       	call   80106630 <strlen>
8010b3cd:	83 c4 0c             	add    $0xc,%esp
8010b3d0:	89 c6                	mov    %eax,%esi
8010b3d2:	50                   	push   %eax
8010b3d3:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b3d8:	53                   	push   %ebx
8010b3d9:	01 f3                	add    %esi,%ebx
8010b3db:	e8 b0 b1 ff ff       	call   80106590 <strncpy>
8010b3e0:	c7 04 24 4e f5 10 80 	movl   $0x8010f54e,(%esp)
8010b3e7:	e8 44 b2 ff ff       	call   80106630 <strlen>
8010b3ec:	83 c4 0c             	add    $0xc,%esp
8010b3ef:	89 c6                	mov    %eax,%esi
8010b3f1:	50                   	push   %eax
8010b3f2:	68 4e f5 10 80       	push   $0x8010f54e
8010b3f7:	53                   	push   %ebx
8010b3f8:	01 f3                	add    %esi,%ebx
8010b3fa:	e8 91 b1 ff ff       	call   80106590 <strncpy>
8010b3ff:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b402:	89 04 24             	mov    %eax,(%esp)
8010b405:	e8 26 b2 ff ff       	call   80106630 <strlen>
8010b40a:	83 c4 0c             	add    $0xc,%esp
8010b40d:	89 c6                	mov    %eax,%esi
8010b40f:	50                   	push   %eax
8010b410:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b413:	50                   	push   %eax
8010b414:	53                   	push   %ebx
8010b415:	01 f3                	add    %esi,%ebx
8010b417:	e8 74 b1 ff ff       	call   80106590 <strncpy>
8010b41c:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b423:	e8 08 b2 ff ff       	call   80106630 <strlen>
8010b428:	83 c4 0c             	add    $0xc,%esp
8010b42b:	89 c6                	mov    %eax,%esi
8010b42d:	50                   	push   %eax
8010b42e:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b433:	53                   	push   %ebx
8010b434:	e8 57 b1 ff ff       	call   80106590 <strncpy>
8010b439:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010b43c:	8b 47 0c             	mov    0xc(%edi),%eax
8010b43f:	83 c4 10             	add    $0x10,%esp
8010b442:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010b448:	39 c2                	cmp    %eax,%edx
8010b44a:	0f 84 e1 09 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b450:	29 c2                	sub    %eax,%edx
8010b452:	3b 55 14             	cmp    0x14(%ebp),%edx
8010b455:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010b459:	85 d2                	test   %edx,%edx
8010b45b:	0f 8e d0 09 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010b461:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010b468:	84 c9                	test   %cl,%cl
8010b46a:	0f 84 c1 09 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b470:	31 db                	xor    %ebx,%ebx
8010b472:	8b 75 10             	mov    0x10(%ebp),%esi
8010b475:	eb 10                	jmp    8010b487 <unsafe_cg_read+0xdd7>
8010b477:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010b47e:	80 
8010b47f:	84 c9                	test   %cl,%cl
8010b481:	0f 84 92 f9 ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010b487:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010b48a:	83 c3 01             	add    $0x1,%ebx
8010b48d:	39 da                	cmp    %ebx,%edx
8010b48f:	75 e6                	jne    8010b477 <unsafe_cg_read+0xdc7>
8010b491:	e9 83 f9 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010b496:	b8 0a 00 00 00       	mov    $0xa,%eax
8010b49b:	c7 45 ce 70 6f 70 75 	movl   $0x75706f70,-0x32(%ebp)
8010b4a2:	c7 45 d2 6c 61 74 65 	movl   $0x6574616c,-0x2e(%ebp)
8010b4a9:	c7 45 d6 64 20 2d 20 	movl   $0x202d2064,-0x2a(%ebp)
8010b4b0:	c7 45 da 30 0a 66 72 	movl   $0x72660a30,-0x26(%ebp)
8010b4b7:	c7 45 de 6f 7a 65 6e 	movl   $0x6e657a6f,-0x22(%ebp)
8010b4be:	c7 45 e2 20 2d 20 30 	movl   $0x30202d20,-0x1e(%ebp)
8010b4c5:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
8010b4c9:	80 ba 14 03 00 00 00 	cmpb   $0x0,0x314(%edx)
8010b4d0:	74 18                	je     8010b4ea <unsafe_cg_read+0xe3a>
8010b4d2:	83 ec 0c             	sub    $0xc,%esp
8010b4d5:	68 2f f5 10 80       	push   $0x8010f52f
8010b4da:	e8 51 b1 ff ff       	call   80106630 <strlen>
8010b4df:	8b 57 10             	mov    0x10(%edi),%edx
8010b4e2:	c6 44 05 ce 31       	movb   $0x31,-0x32(%ebp,%eax,1)
8010b4e7:	83 c4 10             	add    $0x10,%esp
8010b4ea:	8b b2 34 03 00 00    	mov    0x334(%edx),%esi
8010b4f0:	85 f6                	test   %esi,%esi
8010b4f2:	74 14                	je     8010b508 <unsafe_cg_read+0xe58>
8010b4f4:	8d 45 ce             	lea    -0x32(%ebp),%eax
8010b4f7:	83 ec 0c             	sub    $0xc,%esp
8010b4fa:	50                   	push   %eax
8010b4fb:	e8 30 b1 ff ff       	call   80106630 <strlen>
8010b500:	83 c4 10             	add    $0x10,%esp
8010b503:	c6 44 05 cc 31       	movb   $0x31,-0x34(%ebp,%eax,1)
8010b508:	83 7d 14 1a          	cmpl   $0x1a,0x14(%ebp)
8010b50c:	b9 1a 00 00 00       	mov    $0x1a,%ecx
8010b511:	8b 47 0c             	mov    0xc(%edi),%eax
8010b514:	0f 46 4d 14          	cmovbe 0x14(%ebp),%ecx
8010b518:	85 c9                	test   %ecx,%ecx
8010b51a:	0f 84 11 09 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b520:	8d 74 05 ce          	lea    -0x32(%ebp,%eax,1),%esi
8010b524:	0f b6 16             	movzbl (%esi),%edx
8010b527:	84 d2                	test   %dl,%dl
8010b529:	0f 84 02 09 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b52f:	31 db                	xor    %ebx,%ebx
8010b531:	8b 45 10             	mov    0x10(%ebp),%eax
8010b534:	eb 0c                	jmp    8010b542 <unsafe_cg_read+0xe92>
8010b536:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
8010b53a:	84 d2                	test   %dl,%dl
8010b53c:	0f 84 d7 f8 ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010b542:	88 14 18             	mov    %dl,(%eax,%ebx,1)
8010b545:	83 c3 01             	add    $0x1,%ebx
8010b548:	39 d9                	cmp    %ebx,%ecx
8010b54a:	75 ea                	jne    8010b536 <unsafe_cg_read+0xe86>
8010b54c:	e9 c8 f8 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010b551:	83 ec 04             	sub    $0x4,%esp
8010b554:	31 db                	xor    %ebx,%ebx
8010b556:	6a 40                	push   $0x40
8010b558:	6a 00                	push   $0x0
8010b55a:	68 c0 05 12 80       	push   $0x801205c0
8010b55f:	e8 3c ae ff ff       	call   801063a0 <memset>
8010b564:	8b 47 10             	mov    0x10(%edi),%eax
8010b567:	83 c4 10             	add    $0x10,%esp
8010b56a:	80 b8 0c 03 00 00 00 	cmpb   $0x0,0x30c(%eax)
8010b571:	74 34                	je     8010b5a7 <unsafe_cg_read+0xef7>
8010b573:	83 ec 0c             	sub    $0xc,%esp
8010b576:	68 1b f5 10 80       	push   $0x8010f51b
8010b57b:	e8 b0 b0 ff ff       	call   80106630 <strlen>
8010b580:	83 c4 0c             	add    $0xc,%esp
8010b583:	50                   	push   %eax
8010b584:	68 1b f5 10 80       	push   $0x8010f51b
8010b589:	68 c0 05 12 80       	push   $0x801205c0
8010b58e:	e8 bd ae ff ff       	call   80106450 <memmove>
8010b593:	c7 04 24 1b f5 10 80 	movl   $0x8010f51b,(%esp)
8010b59a:	e8 91 b0 ff ff       	call   80106630 <strlen>
8010b59f:	89 c3                	mov    %eax,%ebx
8010b5a1:	8b 47 10             	mov    0x10(%edi),%eax
8010b5a4:	83 c4 10             	add    $0x10,%esp
8010b5a7:	80 b8 0e 03 00 00 00 	cmpb   $0x0,0x30e(%eax)
8010b5ae:	74 36                	je     8010b5e6 <unsafe_cg_read+0xf36>
8010b5b0:	83 ec 0c             	sub    $0xc,%esp
8010b5b3:	68 20 f5 10 80       	push   $0x8010f520
8010b5b8:	e8 73 b0 ff ff       	call   80106630 <strlen>
8010b5bd:	83 c4 0c             	add    $0xc,%esp
8010b5c0:	50                   	push   %eax
8010b5c1:	8d 83 c0 05 12 80    	lea    -0x7fedfa40(%ebx),%eax
8010b5c7:	68 20 f5 10 80       	push   $0x8010f520
8010b5cc:	50                   	push   %eax
8010b5cd:	e8 7e ae ff ff       	call   80106450 <memmove>
8010b5d2:	c7 04 24 20 f5 10 80 	movl   $0x8010f520,(%esp)
8010b5d9:	e8 52 b0 ff ff       	call   80106630 <strlen>
8010b5de:	01 c3                	add    %eax,%ebx
8010b5e0:	8b 47 10             	mov    0x10(%edi),%eax
8010b5e3:	83 c4 10             	add    $0x10,%esp
8010b5e6:	80 b8 10 03 00 00 00 	cmpb   $0x0,0x310(%eax)
8010b5ed:	74 36                	je     8010b625 <unsafe_cg_read+0xf75>
8010b5ef:	83 ec 0c             	sub    $0xc,%esp
8010b5f2:	68 25 f5 10 80       	push   $0x8010f525
8010b5f7:	e8 34 b0 ff ff       	call   80106630 <strlen>
8010b5fc:	83 c4 0c             	add    $0xc,%esp
8010b5ff:	50                   	push   %eax
8010b600:	8d 83 c0 05 12 80    	lea    -0x7fedfa40(%ebx),%eax
8010b606:	68 25 f5 10 80       	push   $0x8010f525
8010b60b:	50                   	push   %eax
8010b60c:	e8 3f ae ff ff       	call   80106450 <memmove>
8010b611:	c7 04 24 25 f5 10 80 	movl   $0x8010f525,(%esp)
8010b618:	e8 13 b0 ff ff       	call   80106630 <strlen>
8010b61d:	01 c3                	add    %eax,%ebx
8010b61f:	8b 47 10             	mov    0x10(%edi),%eax
8010b622:	83 c4 10             	add    $0x10,%esp
8010b625:	80 b8 12 03 00 00 00 	cmpb   $0x0,0x312(%eax)
8010b62c:	74 33                	je     8010b661 <unsafe_cg_read+0xfb1>
8010b62e:	83 ec 0c             	sub    $0xc,%esp
8010b631:	68 2a f5 10 80       	push   $0x8010f52a
8010b636:	e8 f5 af ff ff       	call   80106630 <strlen>
8010b63b:	83 c4 0c             	add    $0xc,%esp
8010b63e:	50                   	push   %eax
8010b63f:	8d 83 c0 05 12 80    	lea    -0x7fedfa40(%ebx),%eax
8010b645:	68 2a f5 10 80       	push   $0x8010f52a
8010b64a:	50                   	push   %eax
8010b64b:	e8 00 ae ff ff       	call   80106450 <memmove>
8010b650:	c7 04 24 2a f5 10 80 	movl   $0x8010f52a,(%esp)
8010b657:	e8 d4 af ff ff       	call   80106630 <strlen>
8010b65c:	83 c4 10             	add    $0x10,%esp
8010b65f:	01 c3                	add    %eax,%ebx
8010b661:	39 5d 14             	cmp    %ebx,0x14(%ebp)
8010b664:	8b 47 0c             	mov    0xc(%edi),%eax
8010b667:	0f 4e 5d 14          	cmovle 0x14(%ebp),%ebx
8010b66b:	85 db                	test   %ebx,%ebx
8010b66d:	0f 8e be 07 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010b673:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010b67a:	31 d2                	xor    %edx,%edx
8010b67c:	84 c9                	test   %cl,%cl
8010b67e:	0f 84 7e 08 00 00    	je     8010bf02 <unsafe_cg_read+0x1852>
8010b684:	8b 75 10             	mov    0x10(%ebp),%esi
8010b687:	eb 10                	jmp    8010b699 <unsafe_cg_read+0xfe9>
8010b689:	0f b6 8c 10 c0 05 12 	movzbl -0x7fedfa40(%eax,%edx,1),%ecx
8010b690:	80 
8010b691:	84 c9                	test   %cl,%cl
8010b693:	0f 84 a8 07 00 00    	je     8010be41 <unsafe_cg_read+0x1791>
8010b699:	88 0c 16             	mov    %cl,(%esi,%edx,1)
8010b69c:	83 c2 01             	add    $0x1,%edx
8010b69f:	39 d3                	cmp    %edx,%ebx
8010b6a1:	75 e6                	jne    8010b689 <unsafe_cg_read+0xfd9>
8010b6a3:	e9 71 f7 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010b6a8:	8b 57 58             	mov    0x58(%edi),%edx
8010b6ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010b6ae:	83 ec 0c             	sub    $0xc,%esp
8010b6b1:	8d 47 0c             	lea    0xc(%edi),%eax
8010b6b4:	ff 75 14             	pushl  0x14(%ebp)
8010b6b7:	e8 c4 eb ff ff       	call   8010a280 <read_file_mem_max.isra.14>
8010b6bc:	89 c3                	mov    %eax,%ebx
8010b6be:	8b 47 0c             	mov    0xc(%edi),%eax
8010b6c1:	83 c4 10             	add    $0x10,%esp
8010b6c4:	89 da                	mov    %ebx,%edx
8010b6c6:	01 d0                	add    %edx,%eax
8010b6c8:	89 47 0c             	mov    %eax,0xc(%edi)
8010b6cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010b6ce:	89 d8                	mov    %ebx,%eax
8010b6d0:	5b                   	pop    %ebx
8010b6d1:	5e                   	pop    %esi
8010b6d2:	5f                   	pop    %edi
8010b6d3:	5d                   	pop    %ebp
8010b6d4:	c3                   	ret    
8010b6d5:	8b 57 58             	mov    0x58(%edi),%edx
8010b6d8:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010b6db:	83 ec 0c             	sub    $0xc,%esp
8010b6de:	8d 47 0c             	lea    0xc(%edi),%eax
8010b6e1:	ff 75 14             	pushl  0x14(%ebp)
8010b6e4:	e8 97 eb ff ff       	call   8010a280 <read_file_mem_max.isra.14>
8010b6e9:	89 c3                	mov    %eax,%ebx
8010b6eb:	83 c4 10             	add    $0x10,%esp
8010b6ee:	8b 47 0c             	mov    0xc(%edi),%eax
8010b6f1:	89 da                	mov    %ebx,%edx
8010b6f3:	eb d1                	jmp    8010b6c6 <unsafe_cg_read+0x1016>
8010b6f5:	8b 47 54             	mov    0x54(%edi),%eax
8010b6f8:	8d 75 ce             	lea    -0x32(%ebp),%esi
8010b6fb:	83 ec 08             	sub    $0x8,%esp
8010b6fe:	31 db                	xor    %ebx,%ebx
8010b700:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010b707:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010b70e:	66 89 5d d6          	mov    %bx,-0x2a(%ebp)
8010b712:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
8010b716:	50                   	push   %eax
8010b717:	56                   	push   %esi
8010b718:	e8 b3 e7 ff ff       	call   80109ed0 <itoa>
8010b71d:	89 34 24             	mov    %esi,(%esp)
8010b720:	e8 0b af ff ff       	call   80106630 <strlen>
8010b725:	83 c4 0c             	add    $0xc,%esp
8010b728:	89 c3                	mov    %eax,%ebx
8010b72a:	50                   	push   %eax
8010b72b:	56                   	push   %esi
8010b72c:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010b732:	68 c0 05 12 80       	push   $0x801205c0
8010b737:	e8 54 ae ff ff       	call   80106590 <strncpy>
8010b73c:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b743:	e8 e8 ae ff ff       	call   80106630 <strlen>
8010b748:	83 c4 0c             	add    $0xc,%esp
8010b74b:	89 c6                	mov    %eax,%esi
8010b74d:	50                   	push   %eax
8010b74e:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b753:	53                   	push   %ebx
8010b754:	e8 37 ae ff ff       	call   80106590 <strncpy>
8010b759:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010b75c:	8b 47 0c             	mov    0xc(%edi),%eax
8010b75f:	83 c4 10             	add    $0x10,%esp
8010b762:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010b768:	39 c2                	cmp    %eax,%edx
8010b76a:	0f 84 c1 06 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b770:	29 c2                	sub    %eax,%edx
8010b772:	3b 55 14             	cmp    0x14(%ebp),%edx
8010b775:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010b779:	85 d2                	test   %edx,%edx
8010b77b:	0f 8e b0 06 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010b781:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010b788:	84 c9                	test   %cl,%cl
8010b78a:	0f 84 a1 06 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b790:	31 db                	xor    %ebx,%ebx
8010b792:	8b 75 10             	mov    0x10(%ebp),%esi
8010b795:	eb 10                	jmp    8010b7a7 <unsafe_cg_read+0x10f7>
8010b797:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010b79e:	80 
8010b79f:	84 c9                	test   %cl,%cl
8010b7a1:	0f 84 72 f6 ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010b7a7:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010b7aa:	83 c3 01             	add    $0x1,%ebx
8010b7ad:	39 da                	cmp    %ebx,%edx
8010b7af:	75 e6                	jne    8010b797 <unsafe_cg_read+0x10e7>
8010b7b1:	e9 63 f6 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010b7b6:	8b 47 58             	mov    0x58(%edi),%eax
8010b7b9:	31 f6                	xor    %esi,%esi
8010b7bb:	83 ec 08             	sub    $0x8,%esp
8010b7be:	66 89 75 d6          	mov    %si,-0x2a(%ebp)
8010b7c2:	8d 75 ce             	lea    -0x32(%ebp),%esi
8010b7c5:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010b7cc:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010b7d3:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
8010b7d7:	50                   	push   %eax
8010b7d8:	56                   	push   %esi
8010b7d9:	e8 f2 e6 ff ff       	call   80109ed0 <itoa>
8010b7de:	c7 04 24 ec f5 10 80 	movl   $0x8010f5ec,(%esp)
8010b7e5:	e8 46 ae ff ff       	call   80106630 <strlen>
8010b7ea:	83 c4 0c             	add    $0xc,%esp
8010b7ed:	89 c3                	mov    %eax,%ebx
8010b7ef:	50                   	push   %eax
8010b7f0:	68 ec f5 10 80       	push   $0x8010f5ec
8010b7f5:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010b7fb:	68 c0 05 12 80       	push   $0x801205c0
8010b800:	e8 8b ad ff ff       	call   80106590 <strncpy>
8010b805:	89 34 24             	mov    %esi,(%esp)
8010b808:	e8 23 ae ff ff       	call   80106630 <strlen>
8010b80d:	83 c4 0c             	add    $0xc,%esp
8010b810:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010b813:	50                   	push   %eax
8010b814:	56                   	push   %esi
8010b815:	53                   	push   %ebx
8010b816:	e8 75 ad ff ff       	call   80106590 <strncpy>
8010b81b:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010b81e:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b825:	01 d3                	add    %edx,%ebx
8010b827:	e8 04 ae ff ff       	call   80106630 <strlen>
8010b82c:	83 c4 0c             	add    $0xc,%esp
8010b82f:	89 c6                	mov    %eax,%esi
8010b831:	50                   	push   %eax
8010b832:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b837:	53                   	push   %ebx
8010b838:	e8 53 ad ff ff       	call   80106590 <strncpy>
8010b83d:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010b840:	8b 47 0c             	mov    0xc(%edi),%eax
8010b843:	83 c4 10             	add    $0x10,%esp
8010b846:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010b84c:	39 c2                	cmp    %eax,%edx
8010b84e:	0f 84 dd 05 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b854:	29 c2                	sub    %eax,%edx
8010b856:	3b 55 14             	cmp    0x14(%ebp),%edx
8010b859:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010b85d:	85 d2                	test   %edx,%edx
8010b85f:	0f 8e cc 05 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010b865:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010b86c:	84 c9                	test   %cl,%cl
8010b86e:	0f 84 bd 05 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b874:	31 db                	xor    %ebx,%ebx
8010b876:	8b 75 10             	mov    0x10(%ebp),%esi
8010b879:	eb 10                	jmp    8010b88b <unsafe_cg_read+0x11db>
8010b87b:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010b882:	80 
8010b883:	84 c9                	test   %cl,%cl
8010b885:	0f 84 8e f5 ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010b88b:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010b88e:	83 c3 01             	add    $0x1,%ebx
8010b891:	39 da                	cmp    %ebx,%edx
8010b893:	75 e6                	jne    8010b87b <unsafe_cg_read+0x11cb>
8010b895:	e9 7f f5 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010b89a:	8b 47 58             	mov    0x58(%edi),%eax
8010b89d:	8d 75 ce             	lea    -0x32(%ebp),%esi
8010b8a0:	83 ec 08             	sub    $0x8,%esp
8010b8a3:	31 d2                	xor    %edx,%edx
8010b8a5:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010b8ac:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010b8b3:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
8010b8b7:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
8010b8bb:	50                   	push   %eax
8010b8bc:	56                   	push   %esi
8010b8bd:	e8 0e e6 ff ff       	call   80109ed0 <itoa>
8010b8c2:	c7 04 24 ca f5 10 80 	movl   $0x8010f5ca,(%esp)
8010b8c9:	e8 62 ad ff ff       	call   80106630 <strlen>
8010b8ce:	83 c4 0c             	add    $0xc,%esp
8010b8d1:	89 c3                	mov    %eax,%ebx
8010b8d3:	50                   	push   %eax
8010b8d4:	68 ca f5 10 80       	push   $0x8010f5ca
8010b8d9:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010b8df:	68 c0 05 12 80       	push   $0x801205c0
8010b8e4:	e8 a7 ac ff ff       	call   80106590 <strncpy>
8010b8e9:	89 34 24             	mov    %esi,(%esp)
8010b8ec:	e8 3f ad ff ff       	call   80106630 <strlen>
8010b8f1:	83 c4 0c             	add    $0xc,%esp
8010b8f4:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010b8f7:	50                   	push   %eax
8010b8f8:	56                   	push   %esi
8010b8f9:	53                   	push   %ebx
8010b8fa:	e8 91 ac ff ff       	call   80106590 <strncpy>
8010b8ff:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010b902:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010b909:	01 d3                	add    %edx,%ebx
8010b90b:	e8 20 ad ff ff       	call   80106630 <strlen>
8010b910:	83 c4 0c             	add    $0xc,%esp
8010b913:	89 c6                	mov    %eax,%esi
8010b915:	50                   	push   %eax
8010b916:	68 b3 f3 10 80       	push   $0x8010f3b3
8010b91b:	53                   	push   %ebx
8010b91c:	e8 6f ac ff ff       	call   80106590 <strncpy>
8010b921:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010b924:	8b 47 0c             	mov    0xc(%edi),%eax
8010b927:	83 c4 10             	add    $0x10,%esp
8010b92a:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010b930:	39 c2                	cmp    %eax,%edx
8010b932:	0f 84 f9 04 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b938:	29 c2                	sub    %eax,%edx
8010b93a:	3b 55 14             	cmp    0x14(%ebp),%edx
8010b93d:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010b941:	85 d2                	test   %edx,%edx
8010b943:	0f 8e e8 04 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010b949:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010b950:	84 c9                	test   %cl,%cl
8010b952:	0f 84 d9 04 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010b958:	31 db                	xor    %ebx,%ebx
8010b95a:	8b 75 10             	mov    0x10(%ebp),%esi
8010b95d:	eb 10                	jmp    8010b96f <unsafe_cg_read+0x12bf>
8010b95f:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010b966:	80 
8010b967:	84 c9                	test   %cl,%cl
8010b969:	0f 84 aa f4 ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010b96f:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010b972:	83 c3 01             	add    $0x1,%ebx
8010b975:	39 da                	cmp    %ebx,%edx
8010b977:	75 e6                	jne    8010b95f <unsafe_cg_read+0x12af>
8010b979:	e9 9b f4 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010b97e:	83 ec 0c             	sub    $0xc,%esp
8010b981:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010b988:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010b98f:	68 ca f5 10 80       	push   $0x8010f5ca
8010b994:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
8010b99b:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
8010b9a2:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
8010b9a9:	e8 82 ac ff ff       	call   80106630 <strlen>
8010b9ae:	83 c4 0c             	add    $0xc,%esp
8010b9b1:	89 c3                	mov    %eax,%ebx
8010b9b3:	50                   	push   %eax
8010b9b4:	68 ca f5 10 80       	push   $0x8010f5ca
8010b9b9:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010b9bf:	68 c0 05 12 80       	push   $0x801205c0
8010b9c4:	e8 c7 ab ff ff       	call   80106590 <strncpy>
8010b9c9:	59                   	pop    %ecx
8010b9ca:	5e                   	pop    %esi
8010b9cb:	8d 75 ce             	lea    -0x32(%ebp),%esi
8010b9ce:	ff 77 54             	pushl  0x54(%edi)
8010b9d1:	56                   	push   %esi
8010b9d2:	e8 a9 e5 ff ff       	call   80109f80 <utoa>
8010b9d7:	83 c4 0c             	add    $0xc,%esp
8010b9da:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010b9dd:	50                   	push   %eax
8010b9de:	56                   	push   %esi
8010b9df:	53                   	push   %ebx
8010b9e0:	e8 ab ab ff ff       	call   80106590 <strncpy>
8010b9e5:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010b9e8:	c7 04 24 d1 f5 10 80 	movl   $0x8010f5d1,(%esp)
8010b9ef:	01 d3                	add    %edx,%ebx
8010b9f1:	e8 3a ac ff ff       	call   80106630 <strlen>
8010b9f6:	83 c4 0c             	add    $0xc,%esp
8010b9f9:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010b9fc:	50                   	push   %eax
8010b9fd:	68 d1 f5 10 80       	push   $0x8010f5d1
8010ba02:	53                   	push   %ebx
8010ba03:	e8 88 ab ff ff       	call   80106590 <strncpy>
8010ba08:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010ba0b:	58                   	pop    %eax
8010ba0c:	01 d3                	add    %edx,%ebx
8010ba0e:	5a                   	pop    %edx
8010ba0f:	ff 77 58             	pushl  0x58(%edi)
8010ba12:	56                   	push   %esi
8010ba13:	e8 68 e5 ff ff       	call   80109f80 <utoa>
8010ba18:	83 c4 0c             	add    $0xc,%esp
8010ba1b:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010ba1e:	50                   	push   %eax
8010ba1f:	56                   	push   %esi
8010ba20:	53                   	push   %ebx
8010ba21:	e8 6a ab ff ff       	call   80106590 <strncpy>
8010ba26:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010ba29:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010ba30:	01 d3                	add    %edx,%ebx
8010ba32:	e8 f9 ab ff ff       	call   80106630 <strlen>
8010ba37:	83 c4 0c             	add    $0xc,%esp
8010ba3a:	89 c6                	mov    %eax,%esi
8010ba3c:	50                   	push   %eax
8010ba3d:	68 b3 f3 10 80       	push   $0x8010f3b3
8010ba42:	53                   	push   %ebx
8010ba43:	e8 48 ab ff ff       	call   80106590 <strncpy>
8010ba48:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010ba4b:	8b 47 0c             	mov    0xc(%edi),%eax
8010ba4e:	83 c4 10             	add    $0x10,%esp
8010ba51:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010ba57:	39 c2                	cmp    %eax,%edx
8010ba59:	0f 84 d2 03 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010ba5f:	29 c2                	sub    %eax,%edx
8010ba61:	3b 55 14             	cmp    0x14(%ebp),%edx
8010ba64:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010ba68:	85 d2                	test   %edx,%edx
8010ba6a:	0f 8e c1 03 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010ba70:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010ba77:	84 c9                	test   %cl,%cl
8010ba79:	0f 84 b2 03 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010ba7f:	31 db                	xor    %ebx,%ebx
8010ba81:	8b 75 10             	mov    0x10(%ebp),%esi
8010ba84:	eb 10                	jmp    8010ba96 <unsafe_cg_read+0x13e6>
8010ba86:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010ba8d:	80 
8010ba8e:	84 c9                	test   %cl,%cl
8010ba90:	0f 84 83 f3 ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010ba96:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010ba99:	83 c3 01             	add    $0x1,%ebx
8010ba9c:	39 da                	cmp    %ebx,%edx
8010ba9e:	75 e6                	jne    8010ba86 <unsafe_cg_read+0x13d6>
8010baa0:	e9 74 f3 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010baa5:	83 ec 0c             	sub    $0xc,%esp
8010baa8:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
8010baaf:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
8010bab6:	68 c0 f5 10 80       	push   $0x8010f5c0
8010babb:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
8010bac2:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
8010bac9:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
8010bad0:	e8 5b ab ff ff       	call   80106630 <strlen>
8010bad5:	83 c4 0c             	add    $0xc,%esp
8010bad8:	89 c3                	mov    %eax,%ebx
8010bada:	50                   	push   %eax
8010badb:	68 c0 f5 10 80       	push   $0x8010f5c0
8010bae0:	81 c3 c0 05 12 80    	add    $0x801205c0,%ebx
8010bae6:	68 c0 05 12 80       	push   $0x801205c0
8010baeb:	e8 a0 aa ff ff       	call   80106590 <strncpy>
8010baf0:	59                   	pop    %ecx
8010baf1:	8d 55 ce             	lea    -0x32(%ebp),%edx
8010baf4:	5e                   	pop    %esi
8010baf5:	ff 77 54             	pushl  0x54(%edi)
8010baf8:	52                   	push   %edx
8010baf9:	89 55 84             	mov    %edx,-0x7c(%ebp)
8010bafc:	e8 7f e4 ff ff       	call   80109f80 <utoa>
8010bb01:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010bb04:	83 c4 0c             	add    $0xc,%esp
8010bb07:	89 c6                	mov    %eax,%esi
8010bb09:	50                   	push   %eax
8010bb0a:	52                   	push   %edx
8010bb0b:	53                   	push   %ebx
8010bb0c:	01 f3                	add    %esi,%ebx
8010bb0e:	e8 7d aa ff ff       	call   80106590 <strncpy>
8010bb13:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010bb1a:	e8 11 ab ff ff       	call   80106630 <strlen>
8010bb1f:	83 c4 0c             	add    $0xc,%esp
8010bb22:	89 c6                	mov    %eax,%esi
8010bb24:	50                   	push   %eax
8010bb25:	68 b3 f3 10 80       	push   $0x8010f3b3
8010bb2a:	53                   	push   %ebx
8010bb2b:	e8 60 aa ff ff       	call   80106590 <strncpy>
8010bb30:	8d 14 33             	lea    (%ebx,%esi,1),%edx
8010bb33:	8b 47 0c             	mov    0xc(%edi),%eax
8010bb36:	83 c4 10             	add    $0x10,%esp
8010bb39:	81 ea c0 05 12 80    	sub    $0x801205c0,%edx
8010bb3f:	39 c2                	cmp    %eax,%edx
8010bb41:	0f 84 ea 02 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010bb47:	29 c2                	sub    %eax,%edx
8010bb49:	3b 55 14             	cmp    0x14(%ebp),%edx
8010bb4c:	0f 47 55 14          	cmova  0x14(%ebp),%edx
8010bb50:	85 d2                	test   %edx,%edx
8010bb52:	0f 8e d9 02 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010bb58:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010bb5f:	84 c9                	test   %cl,%cl
8010bb61:	0f 84 ca 02 00 00    	je     8010be31 <unsafe_cg_read+0x1781>
8010bb67:	31 db                	xor    %ebx,%ebx
8010bb69:	8b 75 10             	mov    0x10(%ebp),%esi
8010bb6c:	eb 10                	jmp    8010bb7e <unsafe_cg_read+0x14ce>
8010bb6e:	0f b6 8c 18 c0 05 12 	movzbl -0x7fedfa40(%eax,%ebx,1),%ecx
8010bb75:	80 
8010bb76:	84 c9                	test   %cl,%cl
8010bb78:	0f 84 9b f2 ff ff    	je     8010ae19 <unsafe_cg_read+0x769>
8010bb7e:	88 0c 1e             	mov    %cl,(%esi,%ebx,1)
8010bb81:	83 c3 01             	add    $0x1,%ebx
8010bb84:	39 da                	cmp    %ebx,%edx
8010bb86:	75 e6                	jne    8010bb6e <unsafe_cg_read+0x14be>
8010bb88:	e9 8c f2 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010bb8d:	83 ec 04             	sub    $0x4,%esp
8010bb90:	6a 03                	push   $0x3
8010bb92:	6a 00                	push   $0x0
8010bb94:	68 c0 05 12 80       	push   $0x801205c0
8010bb99:	e8 02 a8 ff ff       	call   801063a0 <memset>
8010bb9e:	8b 47 10             	mov    0x10(%edi),%eax
8010bba1:	59                   	pop    %ecx
8010bba2:	5b                   	pop    %ebx
8010bba3:	ff b0 1c 03 00 00    	pushl  0x31c(%eax)
8010bba9:	68 c0 05 12 80       	push   $0x801205c0
8010bbae:	e8 1d e3 ff ff       	call   80109ed0 <itoa>
8010bbb3:	83 c4 10             	add    $0x10,%esp
8010bbb6:	81 7d 14 00 10 00 00 	cmpl   $0x1000,0x14(%ebp)
8010bbbd:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010bbc2:	0f 46 4d 14          	cmovbe 0x14(%ebp),%ecx
8010bbc6:	85 c9                	test   %ecx,%ecx
8010bbc8:	0f 84 60 02 00 00    	je     8010be2e <unsafe_cg_read+0x177e>
8010bbce:	0f b6 05 c0 05 12 80 	movzbl 0x801205c0,%eax
8010bbd5:	84 c0                	test   %al,%al
8010bbd7:	0f 84 6e 02 00 00    	je     8010be4b <unsafe_cg_read+0x179b>
8010bbdd:	31 db                	xor    %ebx,%ebx
8010bbdf:	8b 75 10             	mov    0x10(%ebp),%esi
8010bbe2:	eb 11                	jmp    8010bbf5 <unsafe_cg_read+0x1545>
8010bbe4:	0f b6 83 c0 05 12 80 	movzbl -0x7fedfa40(%ebx),%eax
8010bbeb:	89 da                	mov    %ebx,%edx
8010bbed:	84 c0                	test   %al,%al
8010bbef:	0f 84 5a 02 00 00    	je     8010be4f <unsafe_cg_read+0x179f>
8010bbf5:	88 04 1e             	mov    %al,(%esi,%ebx,1)
8010bbf8:	83 c3 01             	add    $0x1,%ebx
8010bbfb:	39 d9                	cmp    %ebx,%ecx
8010bbfd:	75 e5                	jne    8010bbe4 <unsafe_cg_read+0x1534>
8010bbff:	e9 15 f2 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010bc04:	83 ec 08             	sub    $0x8,%esp
8010bc07:	ff b2 18 03 00 00    	pushl  0x318(%edx)
8010bc0d:	68 c0 05 12 80       	push   $0x801205c0
8010bc12:	e8 b9 e2 ff ff       	call   80109ed0 <itoa>
8010bc17:	83 c4 10             	add    $0x10,%esp
8010bc1a:	81 7d 14 00 10 00 00 	cmpl   $0x1000,0x14(%ebp)
8010bc21:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010bc26:	0f 46 4d 14          	cmovbe 0x14(%ebp),%ecx
8010bc2a:	85 c9                	test   %ecx,%ecx
8010bc2c:	0f 84 fc 01 00 00    	je     8010be2e <unsafe_cg_read+0x177e>
8010bc32:	0f b6 05 c0 05 12 80 	movzbl 0x801205c0,%eax
8010bc39:	84 c0                	test   %al,%al
8010bc3b:	0f 84 0a 02 00 00    	je     8010be4b <unsafe_cg_read+0x179b>
8010bc41:	31 db                	xor    %ebx,%ebx
8010bc43:	8b 75 10             	mov    0x10(%ebp),%esi
8010bc46:	eb 11                	jmp    8010bc59 <unsafe_cg_read+0x15a9>
8010bc48:	0f b6 83 c0 05 12 80 	movzbl -0x7fedfa40(%ebx),%eax
8010bc4f:	89 da                	mov    %ebx,%edx
8010bc51:	84 c0                	test   %al,%al
8010bc53:	0f 84 f6 01 00 00    	je     8010be4f <unsafe_cg_read+0x179f>
8010bc59:	88 04 1e             	mov    %al,(%esi,%ebx,1)
8010bc5c:	83 c3 01             	add    $0x1,%ebx
8010bc5f:	39 d9                	cmp    %ebx,%ecx
8010bc61:	75 e5                	jne    8010bc48 <unsafe_cg_read+0x1598>
8010bc63:	e9 b1 f1 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010bc68:	83 ec 04             	sub    $0x4,%esp
8010bc6b:	31 db                	xor    %ebx,%ebx
8010bc6d:	6a 40                	push   $0x40
8010bc6f:	6a 00                	push   $0x0
8010bc71:	68 c0 05 12 80       	push   $0x801205c0
8010bc76:	e8 25 a7 ff ff       	call   801063a0 <memset>
8010bc7b:	8b 47 10             	mov    0x10(%edi),%eax
8010bc7e:	83 c4 10             	add    $0x10,%esp
8010bc81:	80 b8 0d 03 00 00 00 	cmpb   $0x0,0x30d(%eax)
8010bc88:	74 34                	je     8010bcbe <unsafe_cg_read+0x160e>
8010bc8a:	83 ec 0c             	sub    $0xc,%esp
8010bc8d:	68 1b f5 10 80       	push   $0x8010f51b
8010bc92:	e8 99 a9 ff ff       	call   80106630 <strlen>
8010bc97:	83 c4 0c             	add    $0xc,%esp
8010bc9a:	50                   	push   %eax
8010bc9b:	68 1b f5 10 80       	push   $0x8010f51b
8010bca0:	68 c0 05 12 80       	push   $0x801205c0
8010bca5:	e8 a6 a7 ff ff       	call   80106450 <memmove>
8010bcaa:	c7 04 24 1b f5 10 80 	movl   $0x8010f51b,(%esp)
8010bcb1:	e8 7a a9 ff ff       	call   80106630 <strlen>
8010bcb6:	89 c3                	mov    %eax,%ebx
8010bcb8:	8b 47 10             	mov    0x10(%edi),%eax
8010bcbb:	83 c4 10             	add    $0x10,%esp
8010bcbe:	80 b8 0f 03 00 00 00 	cmpb   $0x0,0x30f(%eax)
8010bcc5:	74 36                	je     8010bcfd <unsafe_cg_read+0x164d>
8010bcc7:	83 ec 0c             	sub    $0xc,%esp
8010bcca:	68 20 f5 10 80       	push   $0x8010f520
8010bccf:	e8 5c a9 ff ff       	call   80106630 <strlen>
8010bcd4:	83 c4 0c             	add    $0xc,%esp
8010bcd7:	50                   	push   %eax
8010bcd8:	8d 83 c0 05 12 80    	lea    -0x7fedfa40(%ebx),%eax
8010bcde:	68 20 f5 10 80       	push   $0x8010f520
8010bce3:	50                   	push   %eax
8010bce4:	e8 67 a7 ff ff       	call   80106450 <memmove>
8010bce9:	c7 04 24 20 f5 10 80 	movl   $0x8010f520,(%esp)
8010bcf0:	e8 3b a9 ff ff       	call   80106630 <strlen>
8010bcf5:	01 c3                	add    %eax,%ebx
8010bcf7:	8b 47 10             	mov    0x10(%edi),%eax
8010bcfa:	83 c4 10             	add    $0x10,%esp
8010bcfd:	80 b8 11 03 00 00 00 	cmpb   $0x0,0x311(%eax)
8010bd04:	74 36                	je     8010bd3c <unsafe_cg_read+0x168c>
8010bd06:	83 ec 0c             	sub    $0xc,%esp
8010bd09:	68 25 f5 10 80       	push   $0x8010f525
8010bd0e:	e8 1d a9 ff ff       	call   80106630 <strlen>
8010bd13:	83 c4 0c             	add    $0xc,%esp
8010bd16:	50                   	push   %eax
8010bd17:	8d 83 c0 05 12 80    	lea    -0x7fedfa40(%ebx),%eax
8010bd1d:	68 25 f5 10 80       	push   $0x8010f525
8010bd22:	50                   	push   %eax
8010bd23:	e8 28 a7 ff ff       	call   80106450 <memmove>
8010bd28:	c7 04 24 25 f5 10 80 	movl   $0x8010f525,(%esp)
8010bd2f:	e8 fc a8 ff ff       	call   80106630 <strlen>
8010bd34:	01 c3                	add    %eax,%ebx
8010bd36:	8b 47 10             	mov    0x10(%edi),%eax
8010bd39:	83 c4 10             	add    $0x10,%esp
8010bd3c:	80 b8 13 03 00 00 00 	cmpb   $0x0,0x313(%eax)
8010bd43:	74 33                	je     8010bd78 <unsafe_cg_read+0x16c8>
8010bd45:	83 ec 0c             	sub    $0xc,%esp
8010bd48:	68 2a f5 10 80       	push   $0x8010f52a
8010bd4d:	e8 de a8 ff ff       	call   80106630 <strlen>
8010bd52:	83 c4 0c             	add    $0xc,%esp
8010bd55:	50                   	push   %eax
8010bd56:	8d 83 c0 05 12 80    	lea    -0x7fedfa40(%ebx),%eax
8010bd5c:	68 2a f5 10 80       	push   $0x8010f52a
8010bd61:	50                   	push   %eax
8010bd62:	e8 e9 a6 ff ff       	call   80106450 <memmove>
8010bd67:	c7 04 24 2a f5 10 80 	movl   $0x8010f52a,(%esp)
8010bd6e:	e8 bd a8 ff ff       	call   80106630 <strlen>
8010bd73:	83 c4 10             	add    $0x10,%esp
8010bd76:	01 c3                	add    %eax,%ebx
8010bd78:	39 5d 14             	cmp    %ebx,0x14(%ebp)
8010bd7b:	8b 47 0c             	mov    0xc(%edi),%eax
8010bd7e:	0f 4e 5d 14          	cmovle 0x14(%ebp),%ebx
8010bd82:	85 db                	test   %ebx,%ebx
8010bd84:	0f 8e a7 00 00 00    	jle    8010be31 <unsafe_cg_read+0x1781>
8010bd8a:	0f b6 88 c0 05 12 80 	movzbl -0x7fedfa40(%eax),%ecx
8010bd91:	31 d2                	xor    %edx,%edx
8010bd93:	84 c9                	test   %cl,%cl
8010bd95:	0f 84 67 01 00 00    	je     8010bf02 <unsafe_cg_read+0x1852>
8010bd9b:	8b 75 10             	mov    0x10(%ebp),%esi
8010bd9e:	eb 10                	jmp    8010bdb0 <unsafe_cg_read+0x1700>
8010bda0:	0f b6 8c 10 c0 05 12 	movzbl -0x7fedfa40(%eax,%edx,1),%ecx
8010bda7:	80 
8010bda8:	84 c9                	test   %cl,%cl
8010bdaa:	0f 84 91 00 00 00    	je     8010be41 <unsafe_cg_read+0x1791>
8010bdb0:	88 0c 16             	mov    %cl,(%esi,%edx,1)
8010bdb3:	83 c2 01             	add    $0x1,%edx
8010bdb6:	39 d3                	cmp    %edx,%ebx
8010bdb8:	75 e6                	jne    8010bda0 <unsafe_cg_read+0x16f0>
8010bdba:	e9 5a f0 ff ff       	jmp    8010ae19 <unsafe_cg_read+0x769>
8010bdbf:	8b 47 0c             	mov    0xc(%edi),%eax
8010bdc2:	89 7d 0c             	mov    %edi,0xc(%ebp)
8010bdc5:	be 67 66 66 66       	mov    $0x66666667,%esi
8010bdca:	89 45 84             	mov    %eax,-0x7c(%ebp)
8010bdcd:	b8 01 00 00 00       	mov    $0x1,%eax
8010bdd2:	89 c7                	mov    %eax,%edi
8010bdd4:	8d 47 ff             	lea    -0x1(%edi),%eax
8010bdd7:	89 45 80             	mov    %eax,-0x80(%ebp)
8010bdda:	8b 84 ba 00 02 00 00 	mov    0x200(%edx,%edi,4),%eax
8010bde1:	85 c0                	test   %eax,%eax
8010bde3:	74 36                	je     8010be1b <unsafe_cg_read+0x176b>
8010bde5:	83 ec 0c             	sub    $0xc,%esp
8010bde8:	bb 01 00 00 00       	mov    $0x1,%ebx
8010bded:	50                   	push   %eax
8010bdee:	e8 54 94 ff ff       	call   80105247 <proc_pid>
8010bdf3:	83 c4 10             	add    $0x10,%esp
8010bdf6:	85 c0                	test   %eax,%eax
8010bdf8:	89 c1                	mov    %eax,%ecx
8010bdfa:	7e 17                	jle    8010be13 <unsafe_cg_read+0x1763>
8010bdfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010be00:	89 c8                	mov    %ecx,%eax
8010be02:	c1 f9 1f             	sar    $0x1f,%ecx
8010be05:	83 c3 01             	add    $0x1,%ebx
8010be08:	f7 ee                	imul   %esi
8010be0a:	c1 fa 02             	sar    $0x2,%edx
8010be0d:	29 ca                	sub    %ecx,%edx
8010be0f:	89 d1                	mov    %edx,%ecx
8010be11:	75 ed                	jne    8010be00 <unsafe_cg_read+0x1750>
8010be13:	39 5d 84             	cmp    %ebx,-0x7c(%ebp)
8010be16:	7c 46                	jl     8010be5e <unsafe_cg_read+0x17ae>
8010be18:	29 5d 84             	sub    %ebx,-0x7c(%ebp)
8010be1b:	83 c7 01             	add    $0x1,%edi
8010be1e:	83 ff 41             	cmp    $0x41,%edi
8010be21:	74 08                	je     8010be2b <unsafe_cg_read+0x177b>
8010be23:	8b 45 0c             	mov    0xc(%ebp),%eax
8010be26:	8b 50 10             	mov    0x10(%eax),%edx
8010be29:	eb a9                	jmp    8010bdd4 <unsafe_cg_read+0x1724>
8010be2b:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010be2e:	8b 47 0c             	mov    0xc(%edi),%eax
8010be31:	31 d2                	xor    %edx,%edx
8010be33:	31 db                	xor    %ebx,%ebx
8010be35:	e9 8c f8 ff ff       	jmp    8010b6c6 <unsafe_cg_read+0x1016>
8010be3a:	31 c0                	xor    %eax,%eax
8010be3c:	e9 5f eb ff ff       	jmp    8010a9a0 <unsafe_cg_read+0x2f0>
8010be41:	8b 47 0c             	mov    0xc(%edi),%eax
8010be44:	89 d3                	mov    %edx,%ebx
8010be46:	e9 7b f8 ff ff       	jmp    8010b6c6 <unsafe_cg_read+0x1016>
8010be4b:	31 d2                	xor    %edx,%edx
8010be4d:	31 db                	xor    %ebx,%ebx
8010be4f:	8b 45 10             	mov    0x10(%ebp),%eax
8010be52:	c6 04 10 0a          	movb   $0xa,(%eax,%edx,1)
8010be56:	8b 47 0c             	mov    0xc(%edi),%eax
8010be59:	e9 68 f8 ff ff       	jmp    8010b6c6 <unsafe_cg_read+0x1016>
8010be5e:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010be61:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
8010be64:	31 db                	xor    %ebx,%ebx
8010be66:	8b 75 80             	mov    -0x80(%ebp),%esi
8010be69:	89 da                	mov    %ebx,%edx
8010be6b:	89 fb                	mov    %edi,%ebx
8010be6d:	39 55 14             	cmp    %edx,0x14(%ebp)
8010be70:	7e 6f                	jle    8010bee1 <unsafe_cg_read+0x1831>
8010be72:	83 fe 40             	cmp    $0x40,%esi
8010be75:	74 6a                	je     8010bee1 <unsafe_cg_read+0x1831>
8010be77:	8b 43 10             	mov    0x10(%ebx),%eax
8010be7a:	8d be 80 00 00 00    	lea    0x80(%esi),%edi
8010be80:	8b 44 b8 04          	mov    0x4(%eax,%edi,4),%eax
8010be84:	85 c0                	test   %eax,%eax
8010be86:	74 72                	je     8010befa <unsafe_cg_read+0x184a>
8010be88:	83 ec 04             	sub    $0x4,%esp
8010be8b:	89 4d 80             	mov    %ecx,-0x80(%ebp)
8010be8e:	89 55 84             	mov    %edx,-0x7c(%ebp)
8010be91:	6a 05                	push   $0x5
8010be93:	6a 00                	push   $0x0
8010be95:	68 c0 05 12 80       	push   $0x801205c0
8010be9a:	e8 01 a5 ff ff       	call   801063a0 <memset>
8010be9f:	58                   	pop    %eax
8010bea0:	8b 43 10             	mov    0x10(%ebx),%eax
8010bea3:	ff 74 b8 04          	pushl  0x4(%eax,%edi,4)
8010bea7:	e8 9b 93 ff ff       	call   80105247 <proc_pid>
8010beac:	5a                   	pop    %edx
8010bead:	59                   	pop    %ecx
8010beae:	50                   	push   %eax
8010beaf:	68 c0 05 12 80       	push   $0x801205c0
8010beb4:	e8 17 e0 ff ff       	call   80109ed0 <itoa>
8010beb9:	8b 4d 80             	mov    -0x80(%ebp),%ecx
8010bebc:	83 c4 10             	add    $0x10,%esp
8010bebf:	8b 55 84             	mov    -0x7c(%ebp),%edx
8010bec2:	39 c8                	cmp    %ecx,%eax
8010bec4:	7e 27                	jle    8010beed <unsafe_cg_read+0x183d>
8010bec6:	0f b6 81 c0 05 12 80 	movzbl -0x7fedfa40(%ecx),%eax
8010becd:	8b 7d 10             	mov    0x10(%ebp),%edi
8010bed0:	83 c1 01             	add    $0x1,%ecx
8010bed3:	88 07                	mov    %al,(%edi)
8010bed5:	83 45 10 01          	addl   $0x1,0x10(%ebp)
8010bed9:	83 c2 01             	add    $0x1,%edx
8010bedc:	39 55 14             	cmp    %edx,0x14(%ebp)
8010bedf:	7f 91                	jg     8010be72 <unsafe_cg_read+0x17c2>
8010bee1:	89 df                	mov    %ebx,%edi
8010bee3:	89 d3                	mov    %edx,%ebx
8010bee5:	8b 47 0c             	mov    0xc(%edi),%eax
8010bee8:	e9 d9 f7 ff ff       	jmp    8010b6c6 <unsafe_cg_read+0x1016>
8010beed:	8b 45 10             	mov    0x10(%ebp),%eax
8010bef0:	83 c6 01             	add    $0x1,%esi
8010bef3:	31 c9                	xor    %ecx,%ecx
8010bef5:	c6 00 0a             	movb   $0xa,(%eax)
8010bef8:	eb db                	jmp    8010bed5 <unsafe_cg_read+0x1825>
8010befa:	83 c6 01             	add    $0x1,%esi
8010befd:	e9 6b ff ff ff       	jmp    8010be6d <unsafe_cg_read+0x17bd>
8010bf02:	31 db                	xor    %ebx,%ebx
8010bf04:	e9 bd f7 ff ff       	jmp    8010b6c6 <unsafe_cg_read+0x1016>
8010bf09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010bf10 <unsafe_cg_write>:
8010bf10:	55                   	push   %ebp
8010bf11:	89 e5                	mov    %esp,%ebp
8010bf13:	57                   	push   %edi
8010bf14:	56                   	push   %esi
8010bf15:	53                   	push   %ebx
8010bf16:	83 ec 5c             	sub    $0x5c,%esp
8010bf19:	8b 45 08             	mov    0x8(%ebp),%eax
8010bf1c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010bf1f:	83 c0 14             	add    $0x14,%eax
8010bf22:	e8 29 e1 ff ff       	call   8010a050 <get_file_name_constant>
8010bf27:	8b 7d 08             	mov    0x8(%ebp),%edi
8010bf2a:	80 7f 09 00          	cmpb   $0x0,0x9(%edi)
8010bf2e:	0f 84 da 00 00 00    	je     8010c00e <unsafe_cg_write+0xfe>
8010bf34:	8b 57 10             	mov    0x10(%edi),%edx
8010bf37:	80 3a 00             	cmpb   $0x0,(%edx)
8010bf3a:	0f 84 ce 00 00 00    	je     8010c00e <unsafe_cg_write+0xfe>
8010bf40:	81 7d 10 00 10 00 00 	cmpl   $0x1000,0x10(%ebp)
8010bf47:	0f 8f c1 00 00 00    	jg     8010c00e <unsafe_cg_write+0xfe>
8010bf4d:	83 f8 01             	cmp    $0x1,%eax
8010bf50:	0f 84 ba 02 00 00    	je     8010c210 <unsafe_cg_write+0x300>
8010bf56:	83 f8 02             	cmp    $0x2,%eax
8010bf59:	0f 84 04 03 00 00    	je     8010c263 <unsafe_cg_write+0x353>
8010bf5f:	83 f8 03             	cmp    $0x3,%eax
8010bf62:	0f 84 4c 04 00 00    	je     8010c3b4 <unsafe_cg_write+0x4a4>
8010bf68:	83 f8 04             	cmp    $0x4,%eax
8010bf6b:	0f 84 8c 04 00 00    	je     8010c3fd <unsafe_cg_write+0x4ed>
8010bf71:	83 f8 06             	cmp    $0x6,%eax
8010bf74:	0f 84 a6 00 00 00    	je     8010c020 <unsafe_cg_write+0x110>
8010bf7a:	83 f8 07             	cmp    $0x7,%eax
8010bf7d:	0f 84 fd 01 00 00    	je     8010c180 <unsafe_cg_write+0x270>
8010bf83:	83 f8 08             	cmp    $0x8,%eax
8010bf86:	0f 85 b4 00 00 00    	jne    8010c040 <unsafe_cg_write+0x130>
8010bf8c:	31 c0                	xor    %eax,%eax
8010bf8e:	80 ba 11 03 00 00 00 	cmpb   $0x0,0x311(%edx)
8010bf95:	0f 84 94 00 00 00    	je     8010c02f <unsafe_cg_write+0x11f>
8010bf9b:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
8010bfa2:	00 
8010bfa3:	83 c0 04             	add    $0x4,%eax
8010bfa6:	83 f8 20             	cmp    $0x20,%eax
8010bfa9:	72 f0                	jb     8010bf9b <unsafe_cg_write+0x8b>
8010bfab:	0f b6 0e             	movzbl (%esi),%ecx
8010bfae:	31 d2                	xor    %edx,%edx
8010bfb0:	8d 45 c8             	lea    -0x38(%ebp),%eax
8010bfb3:	80 f9 2c             	cmp    $0x2c,%cl
8010bfb6:	74 20                	je     8010bfd8 <unsafe_cg_write+0xc8>
8010bfb8:	84 c9                	test   %cl,%cl
8010bfba:	74 1c                	je     8010bfd8 <unsafe_cg_write+0xc8>
8010bfbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010bfc0:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010bfc3:	83 c2 01             	add    $0x1,%edx
8010bfc6:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
8010bfca:	84 c9                	test   %cl,%cl
8010bfcc:	74 0a                	je     8010bfd8 <unsafe_cg_write+0xc8>
8010bfce:	80 f9 2c             	cmp    $0x2c,%cl
8010bfd1:	74 05                	je     8010bfd8 <unsafe_cg_write+0xc8>
8010bfd3:	83 fa 20             	cmp    $0x20,%edx
8010bfd6:	75 e8                	jne    8010bfc0 <unsafe_cg_write+0xb0>
8010bfd8:	83 ec 0c             	sub    $0xc,%esp
8010bfdb:	c6 44 15 c8 00       	movb   $0x0,-0x38(%ebp,%edx,1)
8010bfe0:	50                   	push   %eax
8010bfe1:	e8 9a de ff ff       	call   80109e80 <atoi>
8010bfe6:	83 c4 10             	add    $0x10,%esp
8010bfe9:	83 f8 ff             	cmp    $0xffffffff,%eax
8010bfec:	89 c3                	mov    %eax,%ebx
8010bfee:	74 1e                	je     8010c00e <unsafe_cg_write+0xfe>
8010bff0:	83 ec 08             	sub    $0x8,%esp
8010bff3:	50                   	push   %eax
8010bff4:	8b 45 08             	mov    0x8(%ebp),%eax
8010bff7:	ff 70 10             	pushl  0x10(%eax)
8010bffa:	e8 41 19 00 00       	call   8010d940 <set_cpu_id>
8010bfff:	83 c0 01             	add    $0x1,%eax
8010c002:	83 c4 10             	add    $0x10,%esp
8010c005:	83 f8 01             	cmp    $0x1,%eax
8010c008:	0f 87 d4 00 00 00    	ja     8010c0e2 <unsafe_cg_write+0x1d2>
8010c00e:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010c011:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010c016:	5b                   	pop    %ebx
8010c017:	5e                   	pop    %esi
8010c018:	5f                   	pop    %edi
8010c019:	5d                   	pop    %ebp
8010c01a:	c3                   	ret    
8010c01b:	90                   	nop
8010c01c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010c020:	31 c0                	xor    %eax,%eax
8010c022:	80 ba 0d 03 00 00 00 	cmpb   $0x0,0x30d(%edx)
8010c029:	0f 85 7e 04 00 00    	jne    8010c4ad <unsafe_cg_write+0x59d>
8010c02f:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010c032:	5b                   	pop    %ebx
8010c033:	5e                   	pop    %esi
8010c034:	5f                   	pop    %edi
8010c035:	5d                   	pop    %ebp
8010c036:	c3                   	ret    
8010c037:	89 f6                	mov    %esi,%esi
8010c039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010c040:	83 f8 09             	cmp    $0x9,%eax
8010c043:	0f 84 3f 05 00 00    	je     8010c588 <unsafe_cg_write+0x678>
8010c049:	83 f8 0a             	cmp    $0xa,%eax
8010c04c:	0f 84 a1 00 00 00    	je     8010c0f3 <unsafe_cg_write+0x1e3>
8010c052:	83 f8 0b             	cmp    $0xb,%eax
8010c055:	b8 00 00 00 00       	mov    $0x0,%eax
8010c05a:	75 d3                	jne    8010c02f <unsafe_cg_write+0x11f>
8010c05c:	80 ba 13 03 00 00 00 	cmpb   $0x0,0x313(%edx)
8010c063:	74 ca                	je     8010c02f <unsafe_cg_write+0x11f>
8010c065:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
8010c06c:	00 
8010c06d:	83 c0 04             	add    $0x4,%eax
8010c070:	83 f8 20             	cmp    $0x20,%eax
8010c073:	72 f0                	jb     8010c065 <unsafe_cg_write+0x155>
8010c075:	0f b6 0e             	movzbl (%esi),%ecx
8010c078:	31 d2                	xor    %edx,%edx
8010c07a:	8d 45 c8             	lea    -0x38(%ebp),%eax
8010c07d:	80 f9 2c             	cmp    $0x2c,%cl
8010c080:	74 26                	je     8010c0a8 <unsafe_cg_write+0x198>
8010c082:	84 c9                	test   %cl,%cl
8010c084:	74 22                	je     8010c0a8 <unsafe_cg_write+0x198>
8010c086:	8d 76 00             	lea    0x0(%esi),%esi
8010c089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010c090:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010c093:	83 c2 01             	add    $0x1,%edx
8010c096:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
8010c09a:	84 c9                	test   %cl,%cl
8010c09c:	74 0a                	je     8010c0a8 <unsafe_cg_write+0x198>
8010c09e:	80 f9 2c             	cmp    $0x2c,%cl
8010c0a1:	74 05                	je     8010c0a8 <unsafe_cg_write+0x198>
8010c0a3:	83 fa 20             	cmp    $0x20,%edx
8010c0a6:	75 e8                	jne    8010c090 <unsafe_cg_write+0x180>
8010c0a8:	83 ec 0c             	sub    $0xc,%esp
8010c0ab:	c6 44 15 c8 00       	movb   $0x0,-0x38(%ebp,%edx,1)
8010c0b0:	50                   	push   %eax
8010c0b1:	e8 ca dd ff ff       	call   80109e80 <atoi>
8010c0b6:	83 c4 10             	add    $0x10,%esp
8010c0b9:	83 f8 ff             	cmp    $0xffffffff,%eax
8010c0bc:	89 c3                	mov    %eax,%ebx
8010c0be:	0f 84 4a ff ff ff    	je     8010c00e <unsafe_cg_write+0xfe>
8010c0c4:	83 ec 08             	sub    $0x8,%esp
8010c0c7:	50                   	push   %eax
8010c0c8:	8b 45 08             	mov    0x8(%ebp),%eax
8010c0cb:	ff 70 10             	pushl  0x10(%eax)
8010c0ce:	e8 2d 1b 00 00       	call   8010dc00 <set_min_mem>
8010c0d3:	83 c0 01             	add    $0x1,%eax
8010c0d6:	83 c4 10             	add    $0x10,%esp
8010c0d9:	83 f8 01             	cmp    $0x1,%eax
8010c0dc:	0f 86 2c ff ff ff    	jbe    8010c00e <unsafe_cg_write+0xfe>
8010c0e2:	8b 45 08             	mov    0x8(%ebp),%eax
8010c0e5:	89 58 58             	mov    %ebx,0x58(%eax)
8010c0e8:	8b 45 10             	mov    0x10(%ebp),%eax
8010c0eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010c0ee:	5b                   	pop    %ebx
8010c0ef:	5e                   	pop    %esi
8010c0f0:	5f                   	pop    %edi
8010c0f1:	5d                   	pop    %ebp
8010c0f2:	c3                   	ret    
8010c0f3:	31 c0                	xor    %eax,%eax
8010c0f5:	80 ba 13 03 00 00 00 	cmpb   $0x0,0x313(%edx)
8010c0fc:	0f 84 2d ff ff ff    	je     8010c02f <unsafe_cg_write+0x11f>
8010c102:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
8010c109:	00 
8010c10a:	83 c0 04             	add    $0x4,%eax
8010c10d:	83 f8 20             	cmp    $0x20,%eax
8010c110:	72 f0                	jb     8010c102 <unsafe_cg_write+0x1f2>
8010c112:	0f b6 0e             	movzbl (%esi),%ecx
8010c115:	31 d2                	xor    %edx,%edx
8010c117:	8d 45 c8             	lea    -0x38(%ebp),%eax
8010c11a:	80 f9 2c             	cmp    $0x2c,%cl
8010c11d:	74 21                	je     8010c140 <unsafe_cg_write+0x230>
8010c11f:	84 c9                	test   %cl,%cl
8010c121:	74 1d                	je     8010c140 <unsafe_cg_write+0x230>
8010c123:	90                   	nop
8010c124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010c128:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010c12b:	83 c2 01             	add    $0x1,%edx
8010c12e:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
8010c132:	84 c9                	test   %cl,%cl
8010c134:	74 0a                	je     8010c140 <unsafe_cg_write+0x230>
8010c136:	80 f9 2c             	cmp    $0x2c,%cl
8010c139:	74 05                	je     8010c140 <unsafe_cg_write+0x230>
8010c13b:	83 fa 20             	cmp    $0x20,%edx
8010c13e:	75 e8                	jne    8010c128 <unsafe_cg_write+0x218>
8010c140:	83 ec 0c             	sub    $0xc,%esp
8010c143:	c6 44 15 c8 00       	movb   $0x0,-0x38(%ebp,%edx,1)
8010c148:	50                   	push   %eax
8010c149:	e8 32 dd ff ff       	call   80109e80 <atoi>
8010c14e:	83 c4 10             	add    $0x10,%esp
8010c151:	83 f8 ff             	cmp    $0xffffffff,%eax
8010c154:	89 c3                	mov    %eax,%ebx
8010c156:	0f 84 b2 fe ff ff    	je     8010c00e <unsafe_cg_write+0xfe>
8010c15c:	83 ec 08             	sub    $0x8,%esp
8010c15f:	50                   	push   %eax
8010c160:	8b 45 08             	mov    0x8(%ebp),%eax
8010c163:	ff 70 10             	pushl  0x10(%eax)
8010c166:	e8 85 19 00 00       	call   8010daf0 <set_max_mem>
8010c16b:	83 c0 01             	add    $0x1,%eax
8010c16e:	83 c4 10             	add    $0x10,%esp
8010c171:	83 f8 01             	cmp    $0x1,%eax
8010c174:	0f 87 68 ff ff ff    	ja     8010c0e2 <unsafe_cg_write+0x1d2>
8010c17a:	e9 8f fe ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c17f:	90                   	nop
8010c180:	31 c0                	xor    %eax,%eax
8010c182:	80 ba 0f 03 00 00 00 	cmpb   $0x0,0x30f(%edx)
8010c189:	0f 84 a0 fe ff ff    	je     8010c02f <unsafe_cg_write+0x11f>
8010c18f:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
8010c196:	00 
8010c197:	83 c0 04             	add    $0x4,%eax
8010c19a:	83 f8 20             	cmp    $0x20,%eax
8010c19d:	72 f0                	jb     8010c18f <unsafe_cg_write+0x27f>
8010c19f:	0f b6 0e             	movzbl (%esi),%ecx
8010c1a2:	31 d2                	xor    %edx,%edx
8010c1a4:	8d 45 c8             	lea    -0x38(%ebp),%eax
8010c1a7:	80 f9 2c             	cmp    $0x2c,%cl
8010c1aa:	74 1c                	je     8010c1c8 <unsafe_cg_write+0x2b8>
8010c1ac:	84 c9                	test   %cl,%cl
8010c1ae:	74 18                	je     8010c1c8 <unsafe_cg_write+0x2b8>
8010c1b0:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010c1b3:	83 c2 01             	add    $0x1,%edx
8010c1b6:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
8010c1ba:	84 c9                	test   %cl,%cl
8010c1bc:	74 0a                	je     8010c1c8 <unsafe_cg_write+0x2b8>
8010c1be:	80 f9 2c             	cmp    $0x2c,%cl
8010c1c1:	74 05                	je     8010c1c8 <unsafe_cg_write+0x2b8>
8010c1c3:	83 fa 20             	cmp    $0x20,%edx
8010c1c6:	75 e8                	jne    8010c1b0 <unsafe_cg_write+0x2a0>
8010c1c8:	83 ec 0c             	sub    $0xc,%esp
8010c1cb:	c6 44 15 c8 00       	movb   $0x0,-0x38(%ebp,%edx,1)
8010c1d0:	50                   	push   %eax
8010c1d1:	e8 aa dc ff ff       	call   80109e80 <atoi>
8010c1d6:	83 c4 10             	add    $0x10,%esp
8010c1d9:	83 f8 ff             	cmp    $0xffffffff,%eax
8010c1dc:	89 c3                	mov    %eax,%ebx
8010c1de:	0f 84 2a fe ff ff    	je     8010c00e <unsafe_cg_write+0xfe>
8010c1e4:	83 ec 08             	sub    $0x8,%esp
8010c1e7:	50                   	push   %eax
8010c1e8:	8b 45 08             	mov    0x8(%ebp),%eax
8010c1eb:	ff 70 10             	pushl  0x10(%eax)
8010c1ee:	e8 dd 15 00 00       	call   8010d7d0 <set_max_procs>
8010c1f3:	83 c0 01             	add    $0x1,%eax
8010c1f6:	83 c4 10             	add    $0x10,%esp
8010c1f9:	83 f8 01             	cmp    $0x1,%eax
8010c1fc:	0f 87 e0 fe ff ff    	ja     8010c0e2 <unsafe_cg_write+0x1d2>
8010c202:	e9 07 fe ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c207:	89 f6                	mov    %esi,%esi
8010c209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010c210:	8b 45 10             	mov    0x10(%ebp),%eax
8010c213:	83 ec 04             	sub    $0x4,%esp
8010c216:	50                   	push   %eax
8010c217:	56                   	push   %esi
8010c218:	68 c0 05 12 80       	push   $0x801205c0
8010c21d:	c6 80 c0 05 12 80 00 	movb   $0x0,-0x7fedfa40(%eax)
8010c224:	e8 67 a3 ff ff       	call   80106590 <strncpy>
8010c229:	c7 04 24 c0 05 12 80 	movl   $0x801205c0,(%esp)
8010c230:	e8 4b dc ff ff       	call   80109e80 <atoi>
8010c235:	83 c4 10             	add    $0x10,%esp
8010c238:	85 c0                	test   %eax,%eax
8010c23a:	0f 8e ce fd ff ff    	jle    8010c00e <unsafe_cg_write+0xfe>
8010c240:	83 ec 08             	sub    $0x8,%esp
8010c243:	50                   	push   %eax
8010c244:	8b 45 08             	mov    0x8(%ebp),%eax
8010c247:	ff 70 10             	pushl  0x10(%eax)
8010c24a:	e8 16 9d ff ff       	call   80105f65 <cgroup_move_proc>
8010c24f:	83 c4 10             	add    $0x10,%esp
8010c252:	83 f8 ff             	cmp    $0xffffffff,%eax
8010c255:	0f 84 b3 fd ff ff    	je     8010c00e <unsafe_cg_write+0xfe>
8010c25b:	8b 45 10             	mov    0x10(%ebp),%eax
8010c25e:	e9 cc fd ff ff       	jmp    8010c02f <unsafe_cg_write+0x11f>
8010c263:	8b 45 10             	mov    0x10(%ebp),%eax
8010c266:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
8010c26d:	c6 45 9f 00          	movb   $0x0,-0x61(%ebp)
8010c271:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
8010c275:	c6 45 a5 00          	movb   $0x0,-0x5b(%ebp)
8010c279:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
8010c27d:	85 c0                	test   %eax,%eax
8010c27f:	0f 9f 45 a6          	setg   -0x5a(%ebp)
8010c283:	90                   	nop
8010c284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010c288:	0f b6 06             	movzbl (%esi),%eax
8010c28b:	84 c0                	test   %al,%al
8010c28d:	0f 84 bf 01 00 00    	je     8010c452 <unsafe_cg_write+0x542>
8010c293:	80 7d a6 00          	cmpb   $0x0,-0x5a(%ebp)
8010c297:	0f 84 b5 01 00 00    	je     8010c452 <unsafe_cg_write+0x542>
8010c29d:	83 e8 2b             	sub    $0x2b,%eax
8010c2a0:	a8 fd                	test   $0xfd,%al
8010c2a2:	0f 85 66 fd ff ff    	jne    8010c00e <unsafe_cg_write+0xfe>
8010c2a8:	83 ec 04             	sub    $0x4,%esp
8010c2ab:	6a 10                	push   $0x10
8010c2ad:	6a 00                	push   $0x0
8010c2af:	68 c0 05 12 80       	push   $0x801205c0
8010c2b4:	e8 e7 a0 ff ff       	call   801063a0 <memset>
8010c2b9:	0f b6 56 01          	movzbl 0x1(%esi),%edx
8010c2bd:	83 c4 10             	add    $0x10,%esp
8010c2c0:	8d 46 01             	lea    0x1(%esi),%eax
8010c2c3:	f6 c2 df             	test   $0xdf,%dl
8010c2c6:	0f 84 7a 01 00 00    	je     8010c446 <unsafe_cg_write+0x536>
8010c2cc:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
8010c2d0:	0f 84 70 01 00 00    	je     8010c446 <unsafe_cg_write+0x536>
8010c2d6:	8b 7d 10             	mov    0x10(%ebp),%edi
8010c2d9:	31 db                	xor    %ebx,%ebx
8010c2db:	b9 c0 05 12 80       	mov    $0x801205c0,%ecx
8010c2e0:	01 f7                	add    %esi,%edi
8010c2e2:	eb 08                	jmp    8010c2ec <unsafe_cg_write+0x3dc>
8010c2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010c2e8:	39 f8                	cmp    %edi,%eax
8010c2ea:	74 14                	je     8010c300 <unsafe_cg_write+0x3f0>
8010c2ec:	83 c1 01             	add    $0x1,%ecx
8010c2ef:	83 c0 01             	add    $0x1,%eax
8010c2f2:	88 51 ff             	mov    %dl,-0x1(%ecx)
8010c2f5:	0f b6 10             	movzbl (%eax),%edx
8010c2f8:	83 c3 01             	add    $0x1,%ebx
8010c2fb:	f6 c2 df             	test   $0xdf,%dl
8010c2fe:	75 e8                	jne    8010c2e8 <unsafe_cg_write+0x3d8>
8010c300:	c6 01 00             	movb   $0x0,(%ecx)
8010c303:	80 38 20             	cmpb   $0x20,(%eax)
8010c306:	0f 94 c0             	sete   %al
8010c309:	83 ec 08             	sub    $0x8,%esp
8010c30c:	68 4c f6 10 80       	push   $0x8010f64c
8010c311:	68 c0 05 12 80       	push   $0x801205c0
8010c316:	0f b6 c0             	movzbl %al,%eax
8010c319:	01 c3                	add    %eax,%ebx
8010c31b:	e8 20 a2 ff ff       	call   80106540 <strcmp>
8010c320:	83 c4 10             	add    $0x10,%esp
8010c323:	85 c0                	test   %eax,%eax
8010c325:	75 29                	jne    8010c350 <unsafe_cg_write+0x440>
8010c327:	0f b6 06             	movzbl (%esi),%eax
8010c32a:	c6 45 a7 01          	movb   $0x1,-0x59(%ebp)
8010c32e:	3c 2b                	cmp    $0x2b,%al
8010c330:	74 0a                	je     8010c33c <unsafe_cg_write+0x42c>
8010c332:	3c 2d                	cmp    $0x2d,%al
8010c334:	0f 94 c0             	sete   %al
8010c337:	01 c0                	add    %eax,%eax
8010c339:	88 45 a7             	mov    %al,-0x59(%ebp)
8010c33c:	83 c3 01             	add    $0x1,%ebx
8010c33f:	01 5d a0             	add    %ebx,-0x60(%ebp)
8010c342:	01 de                	add    %ebx,%esi
8010c344:	e9 3f ff ff ff       	jmp    8010c288 <unsafe_cg_write+0x378>
8010c349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010c350:	83 ec 08             	sub    $0x8,%esp
8010c353:	68 50 f6 10 80       	push   $0x8010f650
8010c358:	68 c0 05 12 80       	push   $0x801205c0
8010c35d:	e8 de a1 ff ff       	call   80106540 <strcmp>
8010c362:	83 c4 10             	add    $0x10,%esp
8010c365:	85 c0                	test   %eax,%eax
8010c367:	75 17                	jne    8010c380 <unsafe_cg_write+0x470>
8010c369:	0f b6 06             	movzbl (%esi),%eax
8010c36c:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
8010c370:	3c 2b                	cmp    $0x2b,%al
8010c372:	74 c8                	je     8010c33c <unsafe_cg_write+0x42c>
8010c374:	3c 2d                	cmp    $0x2d,%al
8010c376:	0f 94 c0             	sete   %al
8010c379:	01 c0                	add    %eax,%eax
8010c37b:	88 45 a5             	mov    %al,-0x5b(%ebp)
8010c37e:	eb bc                	jmp    8010c33c <unsafe_cg_write+0x42c>
8010c380:	83 ec 08             	sub    $0x8,%esp
8010c383:	68 54 f6 10 80       	push   $0x8010f654
8010c388:	68 c0 05 12 80       	push   $0x801205c0
8010c38d:	e8 ae a1 ff ff       	call   80106540 <strcmp>
8010c392:	83 c4 10             	add    $0x10,%esp
8010c395:	85 c0                	test   %eax,%eax
8010c397:	0f 85 73 02 00 00    	jne    8010c610 <unsafe_cg_write+0x700>
8010c39d:	0f b6 06             	movzbl (%esi),%eax
8010c3a0:	c6 45 a4 01          	movb   $0x1,-0x5c(%ebp)
8010c3a4:	3c 2b                	cmp    $0x2b,%al
8010c3a6:	74 94                	je     8010c33c <unsafe_cg_write+0x42c>
8010c3a8:	3c 2d                	cmp    $0x2d,%al
8010c3aa:	0f 94 c0             	sete   %al
8010c3ad:	01 c0                	add    %eax,%eax
8010c3af:	88 45 a4             	mov    %al,-0x5c(%ebp)
8010c3b2:	eb 88                	jmp    8010c33c <unsafe_cg_write+0x42c>
8010c3b4:	83 ec 0c             	sub    $0xc,%esp
8010c3b7:	56                   	push   %esi
8010c3b8:	e8 c3 da ff ff       	call   80109e80 <atoi>
8010c3bd:	83 c4 10             	add    $0x10,%esp
8010c3c0:	85 c0                	test   %eax,%eax
8010c3c2:	0f 88 46 fc ff ff    	js     8010c00e <unsafe_cg_write+0xfe>
8010c3c8:	83 ec 0c             	sub    $0xc,%esp
8010c3cb:	56                   	push   %esi
8010c3cc:	e8 5f a2 ff ff       	call   80106630 <strlen>
8010c3d1:	83 c4 10             	add    $0x10,%esp
8010c3d4:	83 f8 02             	cmp    $0x2,%eax
8010c3d7:	0f 8f 31 fc ff ff    	jg     8010c00e <unsafe_cg_write+0xfe>
8010c3dd:	8b 45 08             	mov    0x8(%ebp),%eax
8010c3e0:	83 ec 0c             	sub    $0xc,%esp
8010c3e3:	8b 58 10             	mov    0x10(%eax),%ebx
8010c3e6:	56                   	push   %esi
8010c3e7:	e8 94 da ff ff       	call   80109e80 <atoi>
8010c3ec:	83 c4 10             	add    $0x10,%esp
8010c3ef:	89 83 18 03 00 00    	mov    %eax,0x318(%ebx)
8010c3f5:	8b 45 10             	mov    0x10(%ebp),%eax
8010c3f8:	e9 32 fc ff ff       	jmp    8010c02f <unsafe_cg_write+0x11f>
8010c3fd:	83 ec 0c             	sub    $0xc,%esp
8010c400:	56                   	push   %esi
8010c401:	e8 7a da ff ff       	call   80109e80 <atoi>
8010c406:	83 c4 10             	add    $0x10,%esp
8010c409:	85 c0                	test   %eax,%eax
8010c40b:	0f 88 fd fb ff ff    	js     8010c00e <unsafe_cg_write+0xfe>
8010c411:	83 ec 0c             	sub    $0xc,%esp
8010c414:	56                   	push   %esi
8010c415:	e8 16 a2 ff ff       	call   80106630 <strlen>
8010c41a:	83 c4 10             	add    $0x10,%esp
8010c41d:	83 f8 02             	cmp    $0x2,%eax
8010c420:	0f 8f e8 fb ff ff    	jg     8010c00e <unsafe_cg_write+0xfe>
8010c426:	8b 45 08             	mov    0x8(%ebp),%eax
8010c429:	83 ec 0c             	sub    $0xc,%esp
8010c42c:	8b 58 10             	mov    0x10(%eax),%ebx
8010c42f:	56                   	push   %esi
8010c430:	e8 4b da ff ff       	call   80109e80 <atoi>
8010c435:	83 c4 10             	add    $0x10,%esp
8010c438:	89 83 1c 03 00 00    	mov    %eax,0x31c(%ebx)
8010c43e:	8b 45 10             	mov    0x10(%ebp),%eax
8010c441:	e9 e9 fb ff ff       	jmp    8010c02f <unsafe_cg_write+0x11f>
8010c446:	31 db                	xor    %ebx,%ebx
8010c448:	b9 c0 05 12 80       	mov    $0x801205c0,%ecx
8010c44d:	e9 ae fe ff ff       	jmp    8010c300 <unsafe_cg_write+0x3f0>
8010c452:	80 7d a7 01          	cmpb   $0x1,-0x59(%ebp)
8010c456:	0f 84 08 01 00 00    	je     8010c564 <unsafe_cg_write+0x654>
8010c45c:	80 7d a7 02          	cmpb   $0x2,-0x59(%ebp)
8010c460:	0f 84 da 02 00 00    	je     8010c740 <unsafe_cg_write+0x830>
8010c466:	80 7d a5 01          	cmpb   $0x1,-0x5b(%ebp)
8010c46a:	0f 84 b0 02 00 00    	je     8010c720 <unsafe_cg_write+0x810>
8010c470:	80 7d a5 02          	cmpb   $0x2,-0x5b(%ebp)
8010c474:	0f 84 86 02 00 00    	je     8010c700 <unsafe_cg_write+0x7f0>
8010c47a:	80 7d a4 01          	cmpb   $0x1,-0x5c(%ebp)
8010c47e:	0f 84 5c 02 00 00    	je     8010c6e0 <unsafe_cg_write+0x7d0>
8010c484:	80 7d a4 02          	cmpb   $0x2,-0x5c(%ebp)
8010c488:	0f 84 32 02 00 00    	je     8010c6c0 <unsafe_cg_write+0x7b0>
8010c48e:	80 7d 9f 01          	cmpb   $0x1,-0x61(%ebp)
8010c492:	0f 84 00 02 00 00    	je     8010c698 <unsafe_cg_write+0x788>
8010c498:	80 7d 9f 02          	cmpb   $0x2,-0x61(%ebp)
8010c49c:	0f 84 d5 01 00 00    	je     8010c677 <unsafe_cg_write+0x767>
8010c4a2:	8b 45 10             	mov    0x10(%ebp),%eax
8010c4a5:	2b 45 a0             	sub    -0x60(%ebp),%eax
8010c4a8:	e9 82 fb ff ff       	jmp    8010c02f <unsafe_cg_write+0x11f>
8010c4ad:	c7 44 05 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,1)
8010c4b4:	00 
8010c4b5:	83 c0 04             	add    $0x4,%eax
8010c4b8:	83 f8 20             	cmp    $0x20,%eax
8010c4bb:	72 f0                	jb     8010c4ad <unsafe_cg_write+0x59d>
8010c4bd:	31 c0                	xor    %eax,%eax
8010c4bf:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
8010c4c6:	00 
8010c4c7:	83 c0 04             	add    $0x4,%eax
8010c4ca:	83 f8 20             	cmp    $0x20,%eax
8010c4cd:	72 f0                	jb     8010c4bf <unsafe_cg_write+0x5af>
8010c4cf:	0f b6 16             	movzbl (%esi),%edx
8010c4d2:	31 c0                	xor    %eax,%eax
8010c4d4:	8d 5d a8             	lea    -0x58(%ebp),%ebx
8010c4d7:	80 fa 2c             	cmp    $0x2c,%dl
8010c4da:	74 1e                	je     8010c4fa <unsafe_cg_write+0x5ea>
8010c4dc:	84 d2                	test   %dl,%dl
8010c4de:	74 1a                	je     8010c4fa <unsafe_cg_write+0x5ea>
8010c4e0:	83 c6 01             	add    $0x1,%esi
8010c4e3:	88 14 03             	mov    %dl,(%ebx,%eax,1)
8010c4e6:	83 c0 01             	add    $0x1,%eax
8010c4e9:	0f b6 16             	movzbl (%esi),%edx
8010c4ec:	84 d2                	test   %dl,%dl
8010c4ee:	74 0a                	je     8010c4fa <unsafe_cg_write+0x5ea>
8010c4f0:	80 fa 2c             	cmp    $0x2c,%dl
8010c4f3:	74 05                	je     8010c4fa <unsafe_cg_write+0x5ea>
8010c4f5:	83 f8 20             	cmp    $0x20,%eax
8010c4f8:	75 e6                	jne    8010c4e0 <unsafe_cg_write+0x5d0>
8010c4fa:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
8010c4fe:	31 d2                	xor    %edx,%edx
8010c500:	c6 44 05 a8 00       	movb   $0x0,-0x58(%ebp,%eax,1)
8010c505:	8d 45 c8             	lea    -0x38(%ebp),%eax
8010c508:	84 c9                	test   %cl,%cl
8010c50a:	75 09                	jne    8010c515 <unsafe_cg_write+0x605>
8010c50c:	eb 16                	jmp    8010c524 <unsafe_cg_write+0x614>
8010c50e:	66 90                	xchg   %ax,%ax
8010c510:	83 fa 20             	cmp    $0x20,%edx
8010c513:	74 0f                	je     8010c524 <unsafe_cg_write+0x614>
8010c515:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010c518:	83 c2 01             	add    $0x1,%edx
8010c51b:	0f b6 4c 16 01       	movzbl 0x1(%esi,%edx,1),%ecx
8010c520:	84 c9                	test   %cl,%cl
8010c522:	75 ec                	jne    8010c510 <unsafe_cg_write+0x600>
8010c524:	83 ec 0c             	sub    $0xc,%esp
8010c527:	c6 44 15 c8 00       	movb   $0x0,-0x38(%ebp,%edx,1)
8010c52c:	53                   	push   %ebx
8010c52d:	e8 4e d9 ff ff       	call   80109e80 <atoi>
8010c532:	83 c4 10             	add    $0x10,%esp
8010c535:	83 f8 ff             	cmp    $0xffffffff,%eax
8010c538:	89 c3                	mov    %eax,%ebx
8010c53a:	0f 84 ce fa ff ff    	je     8010c00e <unsafe_cg_write+0xfe>
8010c540:	80 7d c8 00          	cmpb   $0x0,-0x38(%ebp)
8010c544:	0f 85 01 01 00 00    	jne    8010c64b <unsafe_cg_write+0x73b>
8010c54a:	8b 45 08             	mov    0x8(%ebp),%eax
8010c54d:	8b 40 10             	mov    0x10(%eax),%eax
8010c550:	89 98 70 03 00 00    	mov    %ebx,0x370(%eax)
8010c556:	8b 45 08             	mov    0x8(%ebp),%eax
8010c559:	89 58 54             	mov    %ebx,0x54(%eax)
8010c55c:	8b 45 10             	mov    0x10(%ebp),%eax
8010c55f:	e9 cb fa ff ff       	jmp    8010c02f <unsafe_cg_write+0x11f>
8010c564:	8b 45 08             	mov    0x8(%ebp),%eax
8010c567:	83 ec 0c             	sub    $0xc,%esp
8010c56a:	ff 70 10             	pushl  0x10(%eax)
8010c56d:	e8 de 0c 00 00       	call   8010d250 <unsafe_enable_cpu_controller>
8010c572:	83 c4 10             	add    $0x10,%esp
8010c575:	85 c0                	test   %eax,%eax
8010c577:	0f 89 e9 fe ff ff    	jns    8010c466 <unsafe_cg_write+0x556>
8010c57d:	e9 8c fa ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010c588:	31 c0                	xor    %eax,%eax
8010c58a:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
8010c591:	00 
8010c592:	83 c0 04             	add    $0x4,%eax
8010c595:	83 f8 20             	cmp    $0x20,%eax
8010c598:	72 f0                	jb     8010c58a <unsafe_cg_write+0x67a>
8010c59a:	0f b6 0e             	movzbl (%esi),%ecx
8010c59d:	31 d2                	xor    %edx,%edx
8010c59f:	8d 45 c8             	lea    -0x38(%ebp),%eax
8010c5a2:	80 f9 2c             	cmp    $0x2c,%cl
8010c5a5:	74 21                	je     8010c5c8 <unsafe_cg_write+0x6b8>
8010c5a7:	84 c9                	test   %cl,%cl
8010c5a9:	74 1d                	je     8010c5c8 <unsafe_cg_write+0x6b8>
8010c5ab:	90                   	nop
8010c5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010c5b0:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010c5b3:	83 c2 01             	add    $0x1,%edx
8010c5b6:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
8010c5ba:	84 c9                	test   %cl,%cl
8010c5bc:	74 0a                	je     8010c5c8 <unsafe_cg_write+0x6b8>
8010c5be:	80 f9 2c             	cmp    $0x2c,%cl
8010c5c1:	74 05                	je     8010c5c8 <unsafe_cg_write+0x6b8>
8010c5c3:	83 fa 20             	cmp    $0x20,%edx
8010c5c6:	75 e8                	jne    8010c5b0 <unsafe_cg_write+0x6a0>
8010c5c8:	83 ec 0c             	sub    $0xc,%esp
8010c5cb:	c6 44 15 c8 00       	movb   $0x0,-0x38(%ebp,%edx,1)
8010c5d0:	50                   	push   %eax
8010c5d1:	e8 aa d8 ff ff       	call   80109e80 <atoi>
8010c5d6:	83 c4 10             	add    $0x10,%esp
8010c5d9:	83 f8 ff             	cmp    $0xffffffff,%eax
8010c5dc:	89 c3                	mov    %eax,%ebx
8010c5de:	0f 84 2a fa ff ff    	je     8010c00e <unsafe_cg_write+0xfe>
8010c5e4:	83 ec 08             	sub    $0x8,%esp
8010c5e7:	50                   	push   %eax
8010c5e8:	8b 45 08             	mov    0x8(%ebp),%eax
8010c5eb:	ff 70 10             	pushl  0x10(%eax)
8010c5ee:	e8 bd 14 00 00       	call   8010dab0 <frz_grp>
8010c5f3:	83 c0 01             	add    $0x1,%eax
8010c5f6:	83 c4 10             	add    $0x10,%esp
8010c5f9:	83 f8 01             	cmp    $0x1,%eax
8010c5fc:	0f 86 0c fa ff ff    	jbe    8010c00e <unsafe_cg_write+0xfe>
8010c602:	8b 45 08             	mov    0x8(%ebp),%eax
8010c605:	89 58 54             	mov    %ebx,0x54(%eax)
8010c608:	8b 45 10             	mov    0x10(%ebp),%eax
8010c60b:	e9 1f fa ff ff       	jmp    8010c02f <unsafe_cg_write+0x11f>
8010c610:	83 ec 08             	sub    $0x8,%esp
8010c613:	68 d5 e9 10 80       	push   $0x8010e9d5
8010c618:	68 c0 05 12 80       	push   $0x801205c0
8010c61d:	e8 1e 9f ff ff       	call   80106540 <strcmp>
8010c622:	83 c4 10             	add    $0x10,%esp
8010c625:	85 c0                	test   %eax,%eax
8010c627:	0f 85 e1 f9 ff ff    	jne    8010c00e <unsafe_cg_write+0xfe>
8010c62d:	0f b6 06             	movzbl (%esi),%eax
8010c630:	c6 45 9f 01          	movb   $0x1,-0x61(%ebp)
8010c634:	3c 2b                	cmp    $0x2b,%al
8010c636:	0f 84 00 fd ff ff    	je     8010c33c <unsafe_cg_write+0x42c>
8010c63c:	3c 2d                	cmp    $0x2d,%al
8010c63e:	0f 94 c0             	sete   %al
8010c641:	01 c0                	add    %eax,%eax
8010c643:	88 45 9f             	mov    %al,-0x61(%ebp)
8010c646:	e9 f1 fc ff ff       	jmp    8010c33c <unsafe_cg_write+0x42c>
8010c64b:	8d 45 c8             	lea    -0x38(%ebp),%eax
8010c64e:	83 ec 0c             	sub    $0xc,%esp
8010c651:	50                   	push   %eax
8010c652:	e8 29 d8 ff ff       	call   80109e80 <atoi>
8010c657:	83 c4 10             	add    $0x10,%esp
8010c65a:	83 f8 ff             	cmp    $0xffffffff,%eax
8010c65d:	0f 84 ab f9 ff ff    	je     8010c00e <unsafe_cg_write+0xfe>
8010c663:	8b 75 08             	mov    0x8(%ebp),%esi
8010c666:	8b 56 10             	mov    0x10(%esi),%edx
8010c669:	89 82 6c 03 00 00    	mov    %eax,0x36c(%edx)
8010c66f:	89 46 58             	mov    %eax,0x58(%esi)
8010c672:	e9 d3 fe ff ff       	jmp    8010c54a <unsafe_cg_write+0x63a>
8010c677:	8b 45 08             	mov    0x8(%ebp),%eax
8010c67a:	83 ec 0c             	sub    $0xc,%esp
8010c67d:	ff 70 10             	pushl  0x10(%eax)
8010c680:	e8 4b 1b 00 00       	call   8010e1d0 <unsafe_disable_mem_controller>
8010c685:	83 c4 10             	add    $0x10,%esp
8010c688:	85 c0                	test   %eax,%eax
8010c68a:	0f 89 12 fe ff ff    	jns    8010c4a2 <unsafe_cg_write+0x592>
8010c690:	e9 79 f9 ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c695:	8d 76 00             	lea    0x0(%esi),%esi
8010c698:	8b 45 08             	mov    0x8(%ebp),%eax
8010c69b:	83 ec 0c             	sub    $0xc,%esp
8010c69e:	ff 70 10             	pushl  0x10(%eax)
8010c6a1:	e8 9a 1a 00 00       	call   8010e140 <unsafe_enable_mem_controller>
8010c6a6:	83 c4 10             	add    $0x10,%esp
8010c6a9:	85 c0                	test   %eax,%eax
8010c6ab:	0f 89 f1 fd ff ff    	jns    8010c4a2 <unsafe_cg_write+0x592>
8010c6b1:	e9 58 f9 ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c6b6:	8d 76 00             	lea    0x0(%esi),%esi
8010c6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010c6c0:	8b 45 08             	mov    0x8(%ebp),%eax
8010c6c3:	83 ec 0c             	sub    $0xc,%esp
8010c6c6:	ff 70 10             	pushl  0x10(%eax)
8010c6c9:	e8 12 13 00 00       	call   8010d9e0 <unsafe_disable_set_controller>
8010c6ce:	83 c4 10             	add    $0x10,%esp
8010c6d1:	85 c0                	test   %eax,%eax
8010c6d3:	0f 89 b5 fd ff ff    	jns    8010c48e <unsafe_cg_write+0x57e>
8010c6d9:	e9 30 f9 ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c6de:	66 90                	xchg   %ax,%ax
8010c6e0:	8b 45 08             	mov    0x8(%ebp),%eax
8010c6e3:	83 ec 0c             	sub    $0xc,%esp
8010c6e6:	ff 70 10             	pushl  0x10(%eax)
8010c6e9:	e8 82 12 00 00       	call   8010d970 <unsafe_enable_set_controller>
8010c6ee:	83 c4 10             	add    $0x10,%esp
8010c6f1:	85 c0                	test   %eax,%eax
8010c6f3:	0f 89 95 fd ff ff    	jns    8010c48e <unsafe_cg_write+0x57e>
8010c6f9:	e9 10 f9 ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c6fe:	66 90                	xchg   %ax,%ax
8010c700:	8b 45 08             	mov    0x8(%ebp),%eax
8010c703:	83 ec 0c             	sub    $0xc,%esp
8010c706:	ff 70 10             	pushl  0x10(%eax)
8010c709:	e8 62 11 00 00       	call   8010d870 <unsafe_disable_pid_controller>
8010c70e:	83 c4 10             	add    $0x10,%esp
8010c711:	85 c0                	test   %eax,%eax
8010c713:	0f 89 61 fd ff ff    	jns    8010c47a <unsafe_cg_write+0x56a>
8010c719:	e9 f0 f8 ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c71e:	66 90                	xchg   %ax,%ax
8010c720:	8b 45 08             	mov    0x8(%ebp),%eax
8010c723:	83 ec 0c             	sub    $0xc,%esp
8010c726:	ff 70 10             	pushl  0x10(%eax)
8010c729:	e8 d2 10 00 00       	call   8010d800 <unsafe_enable_pid_controller>
8010c72e:	83 c4 10             	add    $0x10,%esp
8010c731:	85 c0                	test   %eax,%eax
8010c733:	0f 89 41 fd ff ff    	jns    8010c47a <unsafe_cg_write+0x56a>
8010c739:	e9 d0 f8 ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c73e:	66 90                	xchg   %ax,%ax
8010c740:	8b 45 08             	mov    0x8(%ebp),%eax
8010c743:	83 ec 0c             	sub    $0xc,%esp
8010c746:	ff 70 10             	pushl  0x10(%eax)
8010c749:	e8 a2 0b 00 00       	call   8010d2f0 <unsafe_disable_cpu_controller>
8010c74e:	83 c4 10             	add    $0x10,%esp
8010c751:	85 c0                	test   %eax,%eax
8010c753:	0f 89 0d fd ff ff    	jns    8010c466 <unsafe_cg_write+0x556>
8010c759:	e9 b0 f8 ff ff       	jmp    8010c00e <unsafe_cg_write+0xfe>
8010c75e:	66 90                	xchg   %ax,%ax

8010c760 <unsafe_cg_close>:
8010c760:	55                   	push   %ebp
8010c761:	89 e5                	mov    %esp,%ebp
8010c763:	53                   	push   %ebx
8010c764:	83 ec 10             	sub    $0x10,%esp
8010c767:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010c76a:	53                   	push   %ebx
8010c76b:	e8 b0 4e ff ff       	call   80101620 <fileclose>
8010c770:	8b 43 10             	mov    0x10(%ebx),%eax
8010c773:	83 c4 10             	add    $0x10,%esp
8010c776:	83 a8 00 02 00 00 01 	subl   $0x1,0x200(%eax)
8010c77d:	8b 43 10             	mov    0x10(%ebx),%eax
8010c780:	8b 90 00 02 00 00    	mov    0x200(%eax),%edx
8010c786:	85 d2                	test   %edx,%edx
8010c788:	75 05                	jne    8010c78f <unsafe_cg_close+0x2f>
8010c78a:	80 38 00             	cmpb   $0x0,(%eax)
8010c78d:	74 11                	je     8010c7a0 <unsafe_cg_close+0x40>
8010c78f:	31 c0                	xor    %eax,%eax
8010c791:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010c794:	c9                   	leave  
8010c795:	c3                   	ret    
8010c796:	8d 76 00             	lea    0x0(%esi),%esi
8010c799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010c7a0:	83 ec 0c             	sub    $0xc,%esp
8010c7a3:	ff b0 08 03 00 00    	pushl  0x308(%eax)
8010c7a9:	e8 22 0e 00 00       	call   8010d5d0 <decrement_nr_dying_descendants>
8010c7ae:	83 c4 10             	add    $0x10,%esp
8010c7b1:	31 c0                	xor    %eax,%eax
8010c7b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010c7b6:	c9                   	leave  
8010c7b7:	c3                   	ret    
8010c7b8:	90                   	nop
8010c7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010c7c0 <get_base_name>:
8010c7c0:	55                   	push   %ebp
8010c7c1:	31 c0                	xor    %eax,%eax
8010c7c3:	b9 80 00 00 00       	mov    $0x80,%ecx
8010c7c8:	89 e5                	mov    %esp,%ebp
8010c7ca:	57                   	push   %edi
8010c7cb:	56                   	push   %esi
8010c7cc:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
8010c7d2:	53                   	push   %ebx
8010c7d3:	81 ec 14 02 00 00    	sub    $0x214,%esp
8010c7d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010c7dc:	f3 ab                	rep stos %eax,%es:(%edi)
8010c7de:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
8010c7e4:	ff 75 08             	pushl  0x8(%ebp)
8010c7e7:	57                   	push   %edi
8010c7e8:	e8 93 04 00 00       	call   8010cc80 <format_path>
8010c7ed:	0f b6 95 e8 fd ff ff 	movzbl -0x218(%ebp),%edx
8010c7f4:	83 c4 10             	add    $0x10,%esp
8010c7f7:	84 d2                	test   %dl,%dl
8010c7f9:	74 52                	je     8010c84d <get_base_name+0x8d>
8010c7fb:	89 f8                	mov    %edi,%eax
8010c7fd:	89 f9                	mov    %edi,%ecx
8010c7ff:	eb 09                	jmp    8010c80a <get_base_name+0x4a>
8010c801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010c808:	89 f0                	mov    %esi,%eax
8010c80a:	80 fa 2f             	cmp    $0x2f,%dl
8010c80d:	0f b6 50 01          	movzbl 0x1(%eax),%edx
8010c811:	8d 70 01             	lea    0x1(%eax),%esi
8010c814:	0f 44 c8             	cmove  %eax,%ecx
8010c817:	84 d2                	test   %dl,%dl
8010c819:	75 ed                	jne    8010c808 <get_base_name+0x48>
8010c81b:	39 f9                	cmp    %edi,%ecx
8010c81d:	74 2e                	je     8010c84d <get_base_name+0x8d>
8010c81f:	39 c1                	cmp    %eax,%ecx
8010c821:	74 2a                	je     8010c84d <get_base_name+0x8d>
8010c823:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
8010c827:	8d 51 01             	lea    0x1(%ecx),%edx
8010c82a:	84 c0                	test   %al,%al
8010c82c:	74 12                	je     8010c840 <get_base_name+0x80>
8010c82e:	66 90                	xchg   %ax,%ax
8010c830:	83 c3 01             	add    $0x1,%ebx
8010c833:	83 c2 01             	add    $0x1,%edx
8010c836:	88 43 ff             	mov    %al,-0x1(%ebx)
8010c839:	0f b6 02             	movzbl (%edx),%eax
8010c83c:	84 c0                	test   %al,%al
8010c83e:	75 f0                	jne    8010c830 <get_base_name+0x70>
8010c840:	c6 03 00             	movb   $0x0,(%ebx)
8010c843:	31 c0                	xor    %eax,%eax
8010c845:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010c848:	5b                   	pop    %ebx
8010c849:	5e                   	pop    %esi
8010c84a:	5f                   	pop    %edi
8010c84b:	5d                   	pop    %ebp
8010c84c:	c3                   	ret    
8010c84d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010c852:	eb f1                	jmp    8010c845 <get_base_name+0x85>
8010c854:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010c85a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

8010c860 <get_dir_name>:
8010c860:	55                   	push   %ebp
8010c861:	31 c0                	xor    %eax,%eax
8010c863:	b9 80 00 00 00       	mov    $0x80,%ecx
8010c868:	89 e5                	mov    %esp,%ebp
8010c86a:	57                   	push   %edi
8010c86b:	56                   	push   %esi
8010c86c:	53                   	push   %ebx
8010c86d:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
8010c873:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
8010c879:	81 ec 14 02 00 00    	sub    $0x214,%esp
8010c87f:	f3 ab                	rep stos %eax,%es:(%edi)
8010c881:	ff 75 08             	pushl  0x8(%ebp)
8010c884:	53                   	push   %ebx
8010c885:	e8 f6 03 00 00       	call   8010cc80 <format_path>
8010c88a:	0f b6 b5 e8 fd ff ff 	movzbl -0x218(%ebp),%esi
8010c891:	83 c4 10             	add    $0x10,%esp
8010c894:	89 f0                	mov    %esi,%eax
8010c896:	84 c0                	test   %al,%al
8010c898:	74 68                	je     8010c902 <get_dir_name+0xa2>
8010c89a:	89 f1                	mov    %esi,%ecx
8010c89c:	89 d8                	mov    %ebx,%eax
8010c89e:	89 da                	mov    %ebx,%edx
8010c8a0:	eb 08                	jmp    8010c8aa <get_dir_name+0x4a>
8010c8a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010c8a8:	89 f8                	mov    %edi,%eax
8010c8aa:	80 f9 2f             	cmp    $0x2f,%cl
8010c8ad:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
8010c8b1:	8d 78 01             	lea    0x1(%eax),%edi
8010c8b4:	0f 44 d0             	cmove  %eax,%edx
8010c8b7:	84 c9                	test   %cl,%cl
8010c8b9:	75 ed                	jne    8010c8a8 <get_dir_name+0x48>
8010c8bb:	39 da                	cmp    %ebx,%edx
8010c8bd:	74 43                	je     8010c902 <get_dir_name+0xa2>
8010c8bf:	39 c2                	cmp    %eax,%edx
8010c8c1:	74 3f                	je     8010c902 <get_dir_name+0xa2>
8010c8c3:	39 da                	cmp    %ebx,%edx
8010c8c5:	76 2b                	jbe    8010c8f2 <get_dir_name+0x92>
8010c8c7:	8b 45 0c             	mov    0xc(%ebp),%eax
8010c8ca:	89 f1                	mov    %esi,%ecx
8010c8cc:	eb 05                	jmp    8010c8d3 <get_dir_name+0x73>
8010c8ce:	66 90                	xchg   %ax,%ax
8010c8d0:	0f b6 0b             	movzbl (%ebx),%ecx
8010c8d3:	83 c3 01             	add    $0x1,%ebx
8010c8d6:	83 c0 01             	add    $0x1,%eax
8010c8d9:	88 48 ff             	mov    %cl,-0x1(%eax)
8010c8dc:	39 da                	cmp    %ebx,%edx
8010c8de:	75 f0                	jne    8010c8d0 <get_dir_name+0x70>
8010c8e0:	8d 45 e8             	lea    -0x18(%ebp),%eax
8010c8e3:	29 c2                	sub    %eax,%edx
8010c8e5:	8b 45 0c             	mov    0xc(%ebp),%eax
8010c8e8:	8d 84 10 00 02 00 00 	lea    0x200(%eax,%edx,1),%eax
8010c8ef:	89 45 0c             	mov    %eax,0xc(%ebp)
8010c8f2:	8b 45 0c             	mov    0xc(%ebp),%eax
8010c8f5:	c6 00 00             	movb   $0x0,(%eax)
8010c8f8:	31 c0                	xor    %eax,%eax
8010c8fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010c8fd:	5b                   	pop    %ebx
8010c8fe:	5e                   	pop    %esi
8010c8ff:	5f                   	pop    %edi
8010c900:	5d                   	pop    %ebp
8010c901:	c3                   	ret    
8010c902:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010c907:	eb f1                	jmp    8010c8fa <get_dir_name+0x9a>
8010c909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010c910 <unsafe_cg_stat>:
8010c910:	55                   	push   %ebp
8010c911:	89 e5                	mov    %esp,%ebp
8010c913:	57                   	push   %edi
8010c914:	56                   	push   %esi
8010c915:	53                   	push   %ebx
8010c916:	83 ec 0c             	sub    $0xc,%esp
8010c919:	8b 45 08             	mov    0x8(%ebp),%eax
8010c91c:	8b 40 10             	mov    0x10(%eax),%eax
8010c91f:	80 38 00             	cmpb   $0x0,(%eax)
8010c922:	0f 84 75 01 00 00    	je     8010ca9d <unsafe_cg_stat+0x18d>
8010c928:	8b 45 08             	mov    0x8(%ebp),%eax
8010c92b:	80 78 14 00          	cmpb   $0x0,0x14(%eax)
8010c92f:	8b 45 0c             	mov    0xc(%ebp),%eax
8010c932:	74 76                	je     8010c9aa <unsafe_cg_stat+0x9a>
8010c934:	ba 04 00 00 00       	mov    $0x4,%edx
8010c939:	66 89 10             	mov    %dx,(%eax)
8010c93c:	8b 45 08             	mov    0x8(%ebp),%eax
8010c93f:	83 c0 14             	add    $0x14,%eax
8010c942:	e8 09 d7 ff ff       	call   8010a050 <get_file_name_constant>
8010c947:	83 f8 01             	cmp    $0x1,%eax
8010c94a:	0f 84 89 00 00 00    	je     8010c9d9 <unsafe_cg_stat+0xc9>
8010c950:	83 f8 0d             	cmp    $0xd,%eax
8010c953:	0f 84 da 00 00 00    	je     8010ca33 <unsafe_cg_stat+0x123>
8010c959:	83 f8 02             	cmp    $0x2,%eax
8010c95c:	0f 84 f7 00 00 00    	je     8010ca59 <unsafe_cg_stat+0x149>
8010c962:	83 f8 0e             	cmp    $0xe,%eax
8010c965:	0f 84 75 01 00 00    	je     8010cae0 <unsafe_cg_stat+0x1d0>
8010c96b:	83 f8 03             	cmp    $0x3,%eax
8010c96e:	0f 84 0b 01 00 00    	je     8010ca7f <unsafe_cg_stat+0x16f>
8010c974:	83 f8 04             	cmp    $0x4,%eax
8010c977:	0f 84 19 02 00 00    	je     8010cb96 <unsafe_cg_stat+0x286>
8010c97d:	83 f8 0f             	cmp    $0xf,%eax
8010c980:	0f 84 8f 01 00 00    	je     8010cb15 <unsafe_cg_stat+0x205>
8010c986:	83 f8 11             	cmp    $0x11,%eax
8010c989:	0f 84 68 01 00 00    	je     8010caf7 <unsafe_cg_stat+0x1e7>
8010c98f:	31 db                	xor    %ebx,%ebx
8010c991:	83 f8 12             	cmp    $0x12,%eax
8010c994:	0f 84 0d 01 00 00    	je     8010caa7 <unsafe_cg_stat+0x197>
8010c99a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010c99d:	89 58 10             	mov    %ebx,0x10(%eax)
8010c9a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010c9a3:	31 c0                	xor    %eax,%eax
8010c9a5:	5b                   	pop    %ebx
8010c9a6:	5e                   	pop    %esi
8010c9a7:	5f                   	pop    %edi
8010c9a8:	5d                   	pop    %ebp
8010c9a9:	c3                   	ret    
8010c9aa:	b9 05 00 00 00       	mov    $0x5,%ecx
8010c9af:	83 ec 0c             	sub    $0xc,%esp
8010c9b2:	66 89 08             	mov    %cx,(%eax)
8010c9b5:	8b 45 08             	mov    0x8(%ebp),%eax
8010c9b8:	ff 70 10             	pushl  0x10(%eax)
8010c9bb:	e8 a0 0b 00 00       	call   8010d560 <cgorup_num_of_immidiate_children>
8010c9c0:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010c9c3:	83 c0 07             	add    $0x7,%eax
8010c9c6:	83 c4 10             	add    $0x10,%esp
8010c9c9:	c1 e0 06             	shl    $0x6,%eax
8010c9cc:	89 47 10             	mov    %eax,0x10(%edi)
8010c9cf:	31 c0                	xor    %eax,%eax
8010c9d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010c9d4:	5b                   	pop    %ebx
8010c9d5:	5e                   	pop    %esi
8010c9d6:	5f                   	pop    %edi
8010c9d7:	5d                   	pop    %ebp
8010c9d8:	c3                   	ret    
8010c9d9:	bf 01 00 00 00       	mov    $0x1,%edi
8010c9de:	31 db                	xor    %ebx,%ebx
8010c9e0:	be 67 66 66 66       	mov    $0x66666667,%esi
8010c9e5:	8d 76 00             	lea    0x0(%esi),%esi
8010c9e8:	8b 45 08             	mov    0x8(%ebp),%eax
8010c9eb:	8b 40 10             	mov    0x10(%eax),%eax
8010c9ee:	8b 84 b8 00 02 00 00 	mov    0x200(%eax,%edi,4),%eax
8010c9f5:	85 c0                	test   %eax,%eax
8010c9f7:	74 2d                	je     8010ca26 <unsafe_cg_stat+0x116>
8010c9f9:	83 ec 0c             	sub    $0xc,%esp
8010c9fc:	50                   	push   %eax
8010c9fd:	e8 45 88 ff ff       	call   80105247 <proc_pid>
8010ca02:	83 c4 10             	add    $0x10,%esp
8010ca05:	85 c0                	test   %eax,%eax
8010ca07:	89 c1                	mov    %eax,%ecx
8010ca09:	74 18                	je     8010ca23 <unsafe_cg_stat+0x113>
8010ca0b:	90                   	nop
8010ca0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010ca10:	89 c8                	mov    %ecx,%eax
8010ca12:	c1 f9 1f             	sar    $0x1f,%ecx
8010ca15:	83 c3 01             	add    $0x1,%ebx
8010ca18:	f7 ee                	imul   %esi
8010ca1a:	c1 fa 02             	sar    $0x2,%edx
8010ca1d:	29 ca                	sub    %ecx,%edx
8010ca1f:	89 d1                	mov    %edx,%ecx
8010ca21:	75 ed                	jne    8010ca10 <unsafe_cg_stat+0x100>
8010ca23:	83 c3 01             	add    $0x1,%ebx
8010ca26:	83 c7 01             	add    $0x1,%edi
8010ca29:	83 ff 41             	cmp    $0x41,%edi
8010ca2c:	75 ba                	jne    8010c9e8 <unsafe_cg_stat+0xd8>
8010ca2e:	e9 67 ff ff ff       	jmp    8010c99a <unsafe_cg_stat+0x8a>
8010ca33:	8b 45 08             	mov    0x8(%ebp),%eax
8010ca36:	8b 50 10             	mov    0x10(%eax),%edx
8010ca39:	80 ba 0c 03 00 00 01 	cmpb   $0x1,0x30c(%edx)
8010ca40:	19 db                	sbb    %ebx,%ebx
8010ca42:	f7 d3                	not    %ebx
8010ca44:	83 e3 03             	and    $0x3,%ebx
8010ca47:	80 ba 0e 03 00 00 00 	cmpb   $0x0,0x30e(%edx)
8010ca4e:	8d 43 03             	lea    0x3(%ebx),%eax
8010ca51:	0f 45 d8             	cmovne %eax,%ebx
8010ca54:	e9 41 ff ff ff       	jmp    8010c99a <unsafe_cg_stat+0x8a>
8010ca59:	8b 45 08             	mov    0x8(%ebp),%eax
8010ca5c:	8b 50 10             	mov    0x10(%eax),%edx
8010ca5f:	80 ba 0d 03 00 00 01 	cmpb   $0x1,0x30d(%edx)
8010ca66:	19 db                	sbb    %ebx,%ebx
8010ca68:	f7 d3                	not    %ebx
8010ca6a:	83 e3 03             	and    $0x3,%ebx
8010ca6d:	80 ba 0f 03 00 00 00 	cmpb   $0x0,0x30f(%edx)
8010ca74:	8d 43 03             	lea    0x3(%ebx),%eax
8010ca77:	0f 45 d8             	cmovne %eax,%ebx
8010ca7a:	e9 1b ff ff ff       	jmp    8010c99a <unsafe_cg_stat+0x8a>
8010ca7f:	8b 45 08             	mov    0x8(%ebp),%eax
8010ca82:	83 ec 0c             	sub    $0xc,%esp
8010ca85:	8b 40 10             	mov    0x10(%eax),%eax
8010ca88:	ff b0 18 03 00 00    	pushl  0x318(%eax)
8010ca8e:	e8 7d d5 ff ff       	call   8010a010 <intlen>
8010ca93:	83 c4 10             	add    $0x10,%esp
8010ca96:	89 c3                	mov    %eax,%ebx
8010ca98:	e9 fd fe ff ff       	jmp    8010c99a <unsafe_cg_stat+0x8a>
8010ca9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010caa2:	e9 2a ff ff ff       	jmp    8010c9d1 <unsafe_cg_stat+0xc1>
8010caa7:	83 ec 0c             	sub    $0xc,%esp
8010caaa:	68 75 f6 10 80       	push   $0x8010f675
8010caaf:	e8 7c 9b ff ff       	call   80106630 <strlen>
8010cab4:	89 c3                	mov    %eax,%ebx
8010cab6:	58                   	pop    %eax
8010cab7:	8b 45 08             	mov    0x8(%ebp),%eax
8010caba:	8b 40 10             	mov    0x10(%eax),%eax
8010cabd:	ff b0 38 03 00 00    	pushl  0x338(%eax)
8010cac3:	e8 48 d5 ff ff       	call   8010a010 <intlen>
8010cac8:	01 c3                	add    %eax,%ebx
8010caca:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010cad1:	e8 5a 9b ff ff       	call   80106630 <strlen>
8010cad6:	83 c4 10             	add    $0x10,%esp
8010cad9:	01 c3                	add    %eax,%ebx
8010cadb:	e9 ba fe ff ff       	jmp    8010c99a <unsafe_cg_stat+0x8a>
8010cae0:	83 ec 0c             	sub    $0xc,%esp
8010cae3:	68 58 f6 10 80       	push   $0x8010f658
8010cae8:	e8 43 9b ff ff       	call   80106630 <strlen>
8010caed:	83 c4 10             	add    $0x10,%esp
8010caf0:	89 c3                	mov    %eax,%ebx
8010caf2:	e9 a3 fe ff ff       	jmp    8010c99a <unsafe_cg_stat+0x8a>
8010caf7:	83 ec 0c             	sub    $0xc,%esp
8010cafa:	68 dc f5 10 80       	push   $0x8010f5dc
8010caff:	e8 2c 9b ff ff       	call   80106630 <strlen>
8010cb04:	89 c3                	mov    %eax,%ebx
8010cb06:	8b 45 08             	mov    0x8(%ebp),%eax
8010cb09:	5a                   	pop    %edx
8010cb0a:	8b 40 10             	mov    0x10(%eax),%eax
8010cb0d:	ff b0 04 03 00 00    	pushl  0x304(%eax)
8010cb13:	eb ae                	jmp    8010cac3 <unsafe_cg_stat+0x1b3>
8010cb15:	83 ec 0c             	sub    $0xc,%esp
8010cb18:	68 3c f5 10 80       	push   $0x8010f53c
8010cb1d:	e8 0e 9b ff ff       	call   80106630 <strlen>
8010cb22:	89 c3                	mov    %eax,%ebx
8010cb24:	8b 45 08             	mov    0x8(%ebp),%eax
8010cb27:	59                   	pop    %ecx
8010cb28:	8b 40 10             	mov    0x10(%eax),%eax
8010cb2b:	ff b0 24 03 00 00    	pushl  0x324(%eax)
8010cb31:	e8 da d4 ff ff       	call   8010a010 <intlen>
8010cb36:	01 c3                	add    %eax,%ebx
8010cb38:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010cb3f:	e8 ec 9a ff ff       	call   80106630 <strlen>
8010cb44:	01 c3                	add    %eax,%ebx
8010cb46:	c7 04 24 4e f5 10 80 	movl   $0x8010f54e,(%esp)
8010cb4d:	e8 de 9a ff ff       	call   80106630 <strlen>
8010cb52:	01 c3                	add    %eax,%ebx
8010cb54:	8b 45 08             	mov    0x8(%ebp),%eax
8010cb57:	5e                   	pop    %esi
8010cb58:	8b 40 10             	mov    0x10(%eax),%eax
8010cb5b:	ff b0 28 03 00 00    	pushl  0x328(%eax)
8010cb61:	e8 aa d4 ff ff       	call   8010a010 <intlen>
8010cb66:	01 c3                	add    %eax,%ebx
8010cb68:	c7 04 24 b3 f3 10 80 	movl   $0x8010f3b3,(%esp)
8010cb6f:	e8 bc 9a ff ff       	call   80106630 <strlen>
8010cb74:	01 c3                	add    %eax,%ebx
8010cb76:	c7 04 24 66 f6 10 80 	movl   $0x8010f666,(%esp)
8010cb7d:	e8 ae 9a ff ff       	call   80106630 <strlen>
8010cb82:	01 c3                	add    %eax,%ebx
8010cb84:	8b 45 08             	mov    0x8(%ebp),%eax
8010cb87:	5f                   	pop    %edi
8010cb88:	8b 40 10             	mov    0x10(%eax),%eax
8010cb8b:	ff b0 04 03 00 00    	pushl  0x304(%eax)
8010cb91:	e9 2d ff ff ff       	jmp    8010cac3 <unsafe_cg_stat+0x1b3>
8010cb96:	8b 45 08             	mov    0x8(%ebp),%eax
8010cb99:	83 ec 0c             	sub    $0xc,%esp
8010cb9c:	8b 40 10             	mov    0x10(%eax),%eax
8010cb9f:	ff b0 1c 03 00 00    	pushl  0x31c(%eax)
8010cba5:	e8 66 d4 ff ff       	call   8010a010 <intlen>
8010cbaa:	83 c4 10             	add    $0x10,%esp
8010cbad:	89 c3                	mov    %eax,%ebx
8010cbaf:	e9 e6 fd ff ff       	jmp    8010c99a <unsafe_cg_stat+0x8a>
8010cbb4:	66 90                	xchg   %ax,%ax
8010cbb6:	66 90                	xchg   %ax,%ax
8010cbb8:	66 90                	xchg   %ax,%ax
8010cbba:	66 90                	xchg   %ax,%ax
8010cbbc:	66 90                	xchg   %ax,%ax
8010cbbe:	66 90                	xchg   %ax,%ax

8010cbc0 <unsafe_cgroup_erase.part.0>:
8010cbc0:	85 c0                	test   %eax,%eax
8010cbc2:	74 4b                	je     8010cc0f <unsafe_cgroup_erase.part.0+0x4f>
8010cbc4:	55                   	push   %ebp
8010cbc5:	89 e5                	mov    %esp,%ebp
8010cbc7:	53                   	push   %ebx
8010cbc8:	90                   	nop
8010cbc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010cbd0:	8b 98 04 03 00 00    	mov    0x304(%eax),%ebx
8010cbd6:	83 eb 01             	sub    $0x1,%ebx
8010cbd9:	89 98 04 03 00 00    	mov    %ebx,0x304(%eax)
8010cbdf:	8b 0a                	mov    (%edx),%ecx
8010cbe1:	29 88 38 03 00 00    	sub    %ecx,0x338(%eax)
8010cbe7:	8b 0a                	mov    (%edx),%ecx
8010cbe9:	81 c1 ff 0f 00 00    	add    $0xfff,%ecx
8010cbef:	c1 e9 0c             	shr    $0xc,%ecx
8010cbf2:	29 88 3c 03 00 00    	sub    %ecx,0x33c(%eax)
8010cbf8:	85 db                	test   %ebx,%ebx
8010cbfa:	75 07                	jne    8010cc03 <unsafe_cgroup_erase.part.0+0x43>
8010cbfc:	c6 80 14 03 00 00 00 	movb   $0x0,0x314(%eax)
8010cc03:	8b 80 08 03 00 00    	mov    0x308(%eax),%eax
8010cc09:	85 c0                	test   %eax,%eax
8010cc0b:	75 c3                	jne    8010cbd0 <unsafe_cgroup_erase.part.0+0x10>
8010cc0d:	5b                   	pop    %ebx
8010cc0e:	5d                   	pop    %ebp
8010cc0f:	f3 c3                	repz ret 
8010cc11:	eb 0d                	jmp    8010cc20 <cginit>
8010cc13:	90                   	nop
8010cc14:	90                   	nop
8010cc15:	90                   	nop
8010cc16:	90                   	nop
8010cc17:	90                   	nop
8010cc18:	90                   	nop
8010cc19:	90                   	nop
8010cc1a:	90                   	nop
8010cc1b:	90                   	nop
8010cc1c:	90                   	nop
8010cc1d:	90                   	nop
8010cc1e:	90                   	nop
8010cc1f:	90                   	nop

8010cc20 <cginit>:
8010cc20:	55                   	push   %ebp
8010cc21:	89 e5                	mov    %esp,%ebp
8010cc23:	83 ec 10             	sub    $0x10,%esp
8010cc26:	68 18 f7 10 80       	push   $0x8010f718
8010cc2b:	68 20 c4 13 80       	push   $0x8013c420
8010cc30:	e8 fb 94 ff ff       	call   80106130 <initlock>
8010cc35:	83 c4 10             	add    $0x10,%esp
8010cc38:	c9                   	leave  
8010cc39:	c3                   	ret    
8010cc3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

8010cc40 <cgroup_lock>:
8010cc40:	55                   	push   %ebp
8010cc41:	89 e5                	mov    %esp,%ebp
8010cc43:	83 ec 14             	sub    $0x14,%esp
8010cc46:	68 20 c4 13 80       	push   $0x8013c420
8010cc4b:	e8 e0 95 ff ff       	call   80106230 <acquire>
8010cc50:	83 c4 10             	add    $0x10,%esp
8010cc53:	c9                   	leave  
8010cc54:	c3                   	ret    
8010cc55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010cc59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010cc60 <cgroup_unlock>:
8010cc60:	55                   	push   %ebp
8010cc61:	89 e5                	mov    %esp,%ebp
8010cc63:	83 ec 14             	sub    $0x14,%esp
8010cc66:	68 20 c4 13 80       	push   $0x8013c420
8010cc6b:	e8 e0 96 ff ff       	call   80106350 <release>
8010cc70:	83 c4 10             	add    $0x10,%esp
8010cc73:	c9                   	leave  
8010cc74:	c3                   	ret    
8010cc75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010cc79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010cc80 <format_path>:
8010cc80:	55                   	push   %ebp
8010cc81:	89 e5                	mov    %esp,%ebp
8010cc83:	57                   	push   %edi
8010cc84:	56                   	push   %esi
8010cc85:	53                   	push   %ebx
8010cc86:	83 ec 1c             	sub    $0x1c,%esp
8010cc89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010cc8c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010cc8f:	e8 8f 85 ff ff       	call   80105223 <myproc>
8010cc94:	80 3b 2f             	cmpb   $0x2f,(%ebx)
8010cc97:	89 fe                	mov    %edi,%esi
8010cc99:	74 35                	je     8010ccd0 <format_path+0x50>
8010cc9b:	8d b0 ac 00 00 00    	lea    0xac(%eax),%esi
8010cca1:	83 ec 0c             	sub    $0xc,%esp
8010cca4:	56                   	push   %esi
8010cca5:	e8 86 99 ff ff       	call   80106630 <strlen>
8010ccaa:	83 c4 0c             	add    $0xc,%esp
8010ccad:	50                   	push   %eax
8010ccae:	56                   	push   %esi
8010ccaf:	57                   	push   %edi
8010ccb0:	e8 db 98 ff ff       	call   80106590 <strncpy>
8010ccb5:	89 34 24             	mov    %esi,(%esp)
8010ccb8:	e8 73 99 ff ff       	call   80106630 <strlen>
8010ccbd:	01 f8                	add    %edi,%eax
8010ccbf:	83 c4 10             	add    $0x10,%esp
8010ccc2:	80 78 ff 2f          	cmpb   $0x2f,-0x1(%eax)
8010ccc6:	89 c6                	mov    %eax,%esi
8010ccc8:	74 06                	je     8010ccd0 <format_path+0x50>
8010ccca:	83 c6 01             	add    $0x1,%esi
8010cccd:	c6 00 2f             	movb   $0x2f,(%eax)
8010ccd0:	83 ec 0c             	sub    $0xc,%esp
8010ccd3:	53                   	push   %ebx
8010ccd4:	e8 57 99 ff ff       	call   80106630 <strlen>
8010ccd9:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
8010ccdd:	83 c4 10             	add    $0x10,%esp
8010cce0:	39 c3                	cmp    %eax,%ebx
8010cce2:	72 17                	jb     8010ccfb <format_path+0x7b>
8010cce4:	e9 98 00 00 00       	jmp    8010cd81 <format_path+0x101>
8010cce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010ccf0:	83 e8 01             	sub    $0x1,%eax
8010ccf3:	39 c3                	cmp    %eax,%ebx
8010ccf5:	0f 84 c5 00 00 00    	je     8010cdc0 <format_path+0x140>
8010ccfb:	80 38 2f             	cmpb   $0x2f,(%eax)
8010ccfe:	74 f0                	je     8010ccf0 <format_path+0x70>
8010cd00:	8d 4f ff             	lea    -0x1(%edi),%ecx
8010cd03:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010cd06:	eb 1d                	jmp    8010cd25 <format_path+0xa5>
8010cd08:	90                   	nop
8010cd09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010cd10:	80 7e ff 2f          	cmpb   $0x2f,-0x1(%esi)
8010cd14:	0f b6 13             	movzbl (%ebx),%edx
8010cd17:	74 17                	je     8010cd30 <format_path+0xb0>
8010cd19:	88 16                	mov    %dl,(%esi)
8010cd1b:	83 c3 01             	add    $0x1,%ebx
8010cd1e:	83 c6 01             	add    $0x1,%esi
8010cd21:	39 c3                	cmp    %eax,%ebx
8010cd23:	77 6b                	ja     8010cd90 <format_path+0x110>
8010cd25:	39 f7                	cmp    %esi,%edi
8010cd27:	72 e7                	jb     8010cd10 <format_path+0x90>
8010cd29:	0f b6 13             	movzbl (%ebx),%edx
8010cd2c:	eb eb                	jmp    8010cd19 <format_path+0x99>
8010cd2e:	66 90                	xchg   %ax,%ax
8010cd30:	80 fa 2e             	cmp    $0x2e,%dl
8010cd33:	75 e4                	jne    8010cd19 <format_path+0x99>
8010cd35:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
8010cd39:	84 c9                	test   %cl,%cl
8010cd3b:	74 7b                	je     8010cdb8 <format_path+0x138>
8010cd3d:	80 f9 2f             	cmp    $0x2f,%cl
8010cd40:	74 76                	je     8010cdb8 <format_path+0x138>
8010cd42:	80 f9 2e             	cmp    $0x2e,%cl
8010cd45:	75 d2                	jne    8010cd19 <format_path+0x99>
8010cd47:	0f b6 4b 02          	movzbl 0x2(%ebx),%ecx
8010cd4b:	84 c9                	test   %cl,%cl
8010cd4d:	74 05                	je     8010cd54 <format_path+0xd4>
8010cd4f:	80 f9 2f             	cmp    $0x2f,%cl
8010cd52:	75 c5                	jne    8010cd19 <format_path+0x99>
8010cd54:	8d 56 fe             	lea    -0x2(%esi),%edx
8010cd57:	39 d7                	cmp    %edx,%edi
8010cd59:	77 21                	ja     8010cd7c <format_path+0xfc>
8010cd5b:	80 7e fe 2f          	cmpb   $0x2f,-0x2(%esi)
8010cd5f:	74 66                	je     8010cdc7 <format_path+0x147>
8010cd61:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010cd64:	eb 0f                	jmp    8010cd75 <format_path+0xf5>
8010cd66:	8d 76 00             	lea    0x0(%esi),%esi
8010cd69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010cd70:	80 3a 2f             	cmpb   $0x2f,(%edx)
8010cd73:	74 52                	je     8010cdc7 <format_path+0x147>
8010cd75:	83 ea 01             	sub    $0x1,%edx
8010cd78:	39 ca                	cmp    %ecx,%edx
8010cd7a:	75 f4                	jne    8010cd70 <format_path+0xf0>
8010cd7c:	c6 07 00             	movb   $0x0,(%edi)
8010cd7f:	eb 19                	jmp    8010cd9a <format_path+0x11a>
8010cd81:	0f 86 79 ff ff ff    	jbe    8010cd00 <format_path+0x80>
8010cd87:	89 f6                	mov    %esi,%esi
8010cd89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010cd90:	8d 46 ff             	lea    -0x1(%esi),%eax
8010cd93:	39 c7                	cmp    %eax,%edi
8010cd95:	72 11                	jb     8010cda8 <format_path+0x128>
8010cd97:	c6 06 00             	movb   $0x0,(%esi)
8010cd9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010cd9d:	5b                   	pop    %ebx
8010cd9e:	5e                   	pop    %esi
8010cd9f:	5f                   	pop    %edi
8010cda0:	5d                   	pop    %ebp
8010cda1:	c3                   	ret    
8010cda2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010cda8:	80 7e ff 2f          	cmpb   $0x2f,-0x1(%esi)
8010cdac:	75 e9                	jne    8010cd97 <format_path+0x117>
8010cdae:	c6 46 ff 00          	movb   $0x0,-0x1(%esi)
8010cdb2:	eb e3                	jmp    8010cd97 <format_path+0x117>
8010cdb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010cdb8:	83 c3 02             	add    $0x2,%ebx
8010cdbb:	e9 61 ff ff ff       	jmp    8010cd21 <format_path+0xa1>
8010cdc0:	89 d8                	mov    %ebx,%eax
8010cdc2:	e9 39 ff ff ff       	jmp    8010cd00 <format_path+0x80>
8010cdc7:	8d 72 01             	lea    0x1(%edx),%esi
8010cdca:	83 c3 03             	add    $0x3,%ebx
8010cdcd:	e9 4f ff ff ff       	jmp    8010cd21 <format_path+0xa1>
8010cdd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010cdd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010cde0 <unsafe_get_cgroup_by_path>:
8010cde0:	55                   	push   %ebp
8010cde1:	89 e5                	mov    %esp,%ebp
8010cde3:	56                   	push   %esi
8010cde4:	53                   	push   %ebx
8010cde5:	8d b5 f8 fd ff ff    	lea    -0x208(%ebp),%esi
8010cdeb:	bb 54 c4 13 80       	mov    $0x8013c454,%ebx
8010cdf0:	81 ec 08 02 00 00    	sub    $0x208,%esp
8010cdf6:	50                   	push   %eax
8010cdf7:	56                   	push   %esi
8010cdf8:	e8 83 fe ff ff       	call   8010cc80 <format_path>
8010cdfd:	83 c4 10             	add    $0x10,%esp
8010ce00:	80 bd f8 fd ff ff 00 	cmpb   $0x0,-0x208(%ebp)
8010ce07:	75 15                	jne    8010ce1e <unsafe_get_cgroup_by_path+0x3e>
8010ce09:	eb 35                	jmp    8010ce40 <unsafe_get_cgroup_by_path+0x60>
8010ce0b:	90                   	nop
8010ce0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010ce10:	81 c3 88 03 00 00    	add    $0x388,%ebx
8010ce16:	81 fb 54 a6 14 80    	cmp    $0x8014a654,%ebx
8010ce1c:	74 22                	je     8010ce40 <unsafe_get_cgroup_by_path+0x60>
8010ce1e:	83 ec 08             	sub    $0x8,%esp
8010ce21:	56                   	push   %esi
8010ce22:	53                   	push   %ebx
8010ce23:	e8 18 97 ff ff       	call   80106540 <strcmp>
8010ce28:	83 c4 10             	add    $0x10,%esp
8010ce2b:	85 c0                	test   %eax,%eax
8010ce2d:	75 e1                	jne    8010ce10 <unsafe_get_cgroup_by_path+0x30>
8010ce2f:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010ce32:	89 d8                	mov    %ebx,%eax
8010ce34:	5b                   	pop    %ebx
8010ce35:	5e                   	pop    %esi
8010ce36:	5d                   	pop    %ebp
8010ce37:	c3                   	ret    
8010ce38:	90                   	nop
8010ce39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010ce40:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010ce43:	31 c0                	xor    %eax,%eax
8010ce45:	5b                   	pop    %ebx
8010ce46:	5e                   	pop    %esi
8010ce47:	5d                   	pop    %ebp
8010ce48:	c3                   	ret    
8010ce49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010ce50 <unsafe_set_cgroup_dir_path>:
8010ce50:	55                   	push   %ebp
8010ce51:	89 e5                	mov    %esp,%ebp
8010ce53:	56                   	push   %esi
8010ce54:	53                   	push   %ebx
8010ce55:	8d 9d f8 fd ff ff    	lea    -0x208(%ebp),%ebx
8010ce5b:	89 c6                	mov    %eax,%esi
8010ce5d:	81 ec 08 02 00 00    	sub    $0x208,%esp
8010ce63:	52                   	push   %edx
8010ce64:	53                   	push   %ebx
8010ce65:	e8 16 fe ff ff       	call   8010cc80 <format_path>
8010ce6a:	0f b6 95 f8 fd ff ff 	movzbl -0x208(%ebp),%edx
8010ce71:	83 c4 10             	add    $0x10,%esp
8010ce74:	84 d2                	test   %dl,%dl
8010ce76:	74 26                	je     8010ce9e <unsafe_set_cgroup_dir_path+0x4e>
8010ce78:	8d 4e 01             	lea    0x1(%esi),%ecx
8010ce7b:	88 16                	mov    %dl,(%esi)
8010ce7d:	b8 01 00 00 00       	mov    $0x1,%eax
8010ce82:	eb 0e                	jmp    8010ce92 <unsafe_set_cgroup_dir_path+0x42>
8010ce84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010ce88:	83 c0 01             	add    $0x1,%eax
8010ce8b:	3d 00 02 00 00       	cmp    $0x200,%eax
8010ce90:	74 0c                	je     8010ce9e <unsafe_set_cgroup_dir_path+0x4e>
8010ce92:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
8010ce96:	84 d2                	test   %dl,%dl
8010ce98:	88 54 01 ff          	mov    %dl,-0x1(%ecx,%eax,1)
8010ce9c:	75 ea                	jne    8010ce88 <unsafe_set_cgroup_dir_path+0x38>
8010ce9e:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010cea1:	5b                   	pop    %ebx
8010cea2:	5e                   	pop    %esi
8010cea3:	5d                   	pop    %ebp
8010cea4:	c3                   	ret    
8010cea5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010cea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010ceb0 <cgroup_root>:
8010ceb0:	55                   	push   %ebp
8010ceb1:	b8 54 c4 13 80       	mov    $0x8013c454,%eax
8010ceb6:	89 e5                	mov    %esp,%ebp
8010ceb8:	5d                   	pop    %ebp
8010ceb9:	c3                   	ret    
8010ceba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

8010cec0 <protect_memory>:
8010cec0:	55                   	push   %ebp
8010cec1:	89 e5                	mov    %esp,%ebp
8010cec3:	57                   	push   %edi
8010cec4:	56                   	push   %esi
8010cec5:	53                   	push   %ebx
8010cec6:	31 ff                	xor    %edi,%edi
8010cec8:	83 ec 1c             	sub    $0x1c,%esp
8010cecb:	8b 45 10             	mov    0x10(%ebp),%eax
8010cece:	8b 75 0c             	mov    0xc(%ebp),%esi
8010ced1:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010ced4:	05 ff 0f 00 00       	add    $0xfff,%eax
8010ced9:	c1 f8 0c             	sar    $0xc,%eax
8010cedc:	81 fe 54 c4 13 80    	cmp    $0x8013c454,%esi
8010cee2:	74 33                	je     8010cf17 <protect_memory+0x57>
8010cee4:	80 be 13 03 00 00 00 	cmpb   $0x0,0x313(%esi)
8010ceeb:	74 2a                	je     8010cf17 <protect_memory+0x57>
8010ceed:	8b 8e 58 03 00 00    	mov    0x358(%esi),%ecx
8010cef3:	85 c9                	test   %ecx,%ecx
8010cef5:	74 20                	je     8010cf17 <protect_memory+0x57>
8010cef7:	8b be 54 03 00 00    	mov    0x354(%esi),%edi
8010cefd:	8d 97 ff 0f 00 00    	lea    0xfff(%edi),%edx
8010cf03:	89 cf                	mov    %ecx,%edi
8010cf05:	c1 ea 0c             	shr    $0xc,%edx
8010cf08:	2b 96 3c 03 00 00    	sub    0x33c(%esi),%edx
8010cf0e:	29 c2                	sub    %eax,%edx
8010cf10:	29 d7                	sub    %edx,%edi
8010cf12:	85 d2                	test   %edx,%edx
8010cf14:	0f 4e f9             	cmovle %ecx,%edi
8010cf17:	31 d2                	xor    %edx,%edx
8010cf19:	81 fb 54 c4 13 80    	cmp    $0x8013c454,%ebx
8010cf1f:	74 09                	je     8010cf2a <protect_memory+0x6a>
8010cf21:	80 bb 13 03 00 00 00 	cmpb   $0x0,0x313(%ebx)
8010cf28:	75 36                	jne    8010cf60 <protect_memory+0xa0>
8010cf2a:	89 d0                	mov    %edx,%eax
8010cf2c:	83 ec 0c             	sub    $0xc,%esp
8010cf2f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010cf32:	29 f8                	sub    %edi,%eax
8010cf34:	50                   	push   %eax
8010cf35:	e8 e6 5f ff ff       	call   80102f20 <increse_protect_counter>
8010cf3a:	83 c4 10             	add    $0x10,%esp
8010cf3d:	85 c0                	test   %eax,%eax
8010cf3f:	75 47                	jne    8010cf88 <protect_memory+0xc8>
8010cf41:	29 be 58 03 00 00    	sub    %edi,0x358(%esi)
8010cf47:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010cf4a:	01 93 58 03 00 00    	add    %edx,0x358(%ebx)
8010cf50:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010cf53:	5b                   	pop    %ebx
8010cf54:	5e                   	pop    %esi
8010cf55:	5f                   	pop    %edi
8010cf56:	5d                   	pop    %ebp
8010cf57:	c3                   	ret    
8010cf58:	90                   	nop
8010cf59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010cf60:	8b 8b 54 03 00 00    	mov    0x354(%ebx),%ecx
8010cf66:	81 c1 ff 0f 00 00    	add    $0xfff,%ecx
8010cf6c:	c1 e9 0c             	shr    $0xc,%ecx
8010cf6f:	01 c8                	add    %ecx,%eax
8010cf71:	2b 83 3c 03 00 00    	sub    0x33c(%ebx),%eax
8010cf77:	85 c0                	test   %eax,%eax
8010cf79:	7e af                	jle    8010cf2a <protect_memory+0x6a>
8010cf7b:	2b 83 58 03 00 00    	sub    0x358(%ebx),%eax
8010cf81:	89 c2                	mov    %eax,%edx
8010cf83:	eb a5                	jmp    8010cf2a <protect_memory+0x6a>
8010cf85:	8d 76 00             	lea    0x0(%esi),%esi
8010cf88:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010cf8b:	b8 01 00 00 00       	mov    $0x1,%eax
8010cf90:	5b                   	pop    %ebx
8010cf91:	5e                   	pop    %esi
8010cf92:	5f                   	pop    %edi
8010cf93:	5d                   	pop    %ebp
8010cf94:	c3                   	ret    
8010cf95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010cf99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010cfa0 <unsafe_cgroup_insert>:
8010cfa0:	55                   	push   %ebp
8010cfa1:	89 e5                	mov    %esp,%ebp
8010cfa3:	57                   	push   %edi
8010cfa4:	56                   	push   %esi
8010cfa5:	53                   	push   %ebx
8010cfa6:	83 ec 0c             	sub    $0xc,%esp
8010cfa9:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010cfac:	8b 75 0c             	mov    0xc(%ebp),%esi
8010cfaf:	80 bb 0f 03 00 00 01 	cmpb   $0x1,0x30f(%ebx)
8010cfb6:	0f 84 0c 01 00 00    	je     8010d0c8 <unsafe_cgroup_insert+0x128>
8010cfbc:	80 bb 13 03 00 00 01 	cmpb   $0x1,0x313(%ebx)
8010cfc3:	0f 84 1f 01 00 00    	je     8010d0e8 <unsafe_cgroup_insert+0x148>
8010cfc9:	31 c0                	xor    %eax,%eax
8010cfcb:	31 ff                	xor    %edi,%edi
8010cfcd:	31 c9                	xor    %ecx,%ecx
8010cfcf:	eb 17                	jmp    8010cfe8 <unsafe_cgroup_insert+0x48>
8010cfd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010cfd8:	39 f2                	cmp    %esi,%edx
8010cfda:	0f 84 d8 00 00 00    	je     8010d0b8 <unsafe_cgroup_insert+0x118>
8010cfe0:	83 c0 01             	add    $0x1,%eax
8010cfe3:	83 f8 40             	cmp    $0x40,%eax
8010cfe6:	74 28                	je     8010d010 <unsafe_cgroup_insert+0x70>
8010cfe8:	85 c9                	test   %ecx,%ecx
8010cfea:	8b 94 83 04 02 00 00 	mov    0x204(%ebx,%eax,4),%edx
8010cff1:	75 e5                	jne    8010cfd8 <unsafe_cgroup_insert+0x38>
8010cff3:	85 d2                	test   %edx,%edx
8010cff5:	75 e1                	jne    8010cfd8 <unsafe_cgroup_insert+0x38>
8010cff7:	89 c7                	mov    %eax,%edi
8010cff9:	83 c0 01             	add    $0x1,%eax
8010cffc:	b9 01 00 00 00       	mov    $0x1,%ecx
8010d001:	83 f8 40             	cmp    $0x40,%eax
8010d004:	75 e2                	jne    8010cfe8 <unsafe_cgroup_insert+0x48>
8010d006:	8d 76 00             	lea    0x0(%esi),%esi
8010d009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010d010:	85 c9                	test   %ecx,%ecx
8010d012:	0f 84 c2 00 00 00    	je     8010d0da <unsafe_cgroup_insert+0x13a>
8010d018:	8b 86 ac 02 00 00    	mov    0x2ac(%esi),%eax
8010d01e:	85 c0                	test   %eax,%eax
8010d020:	74 53                	je     8010d075 <unsafe_cgroup_insert+0xd5>
8010d022:	83 ec 04             	sub    $0x4,%esp
8010d025:	ff 36                	pushl  (%esi)
8010d027:	53                   	push   %ebx
8010d028:	50                   	push   %eax
8010d029:	e8 92 fe ff ff       	call   8010cec0 <protect_memory>
8010d02e:	83 c4 10             	add    $0x10,%esp
8010d031:	85 c0                	test   %eax,%eax
8010d033:	0f 85 a1 00 00 00    	jne    8010d0da <unsafe_cgroup_insert+0x13a>
8010d039:	8b 86 ac 02 00 00    	mov    0x2ac(%esi),%eax
8010d03f:	31 d2                	xor    %edx,%edx
8010d041:	eb 0d                	jmp    8010d050 <unsafe_cgroup_insert+0xb0>
8010d043:	90                   	nop
8010d044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d048:	83 c2 01             	add    $0x1,%edx
8010d04b:	83 fa 40             	cmp    $0x40,%edx
8010d04e:	74 25                	je     8010d075 <unsafe_cgroup_insert+0xd5>
8010d050:	3b b4 90 04 02 00 00 	cmp    0x204(%eax,%edx,4),%esi
8010d057:	75 ef                	jne    8010d048 <unsafe_cgroup_insert+0xa8>
8010d059:	c7 86 ac 02 00 00 54 	movl   $0x8013c454,0x2ac(%esi)
8010d060:	c4 13 80 
8010d063:	c7 84 90 04 02 00 00 	movl   $0x0,0x204(%eax,%edx,4)
8010d06a:	00 00 00 00 
8010d06e:	89 f2                	mov    %esi,%edx
8010d070:	e8 4b fb ff ff       	call   8010cbc0 <unsafe_cgroup_erase.part.0>
8010d075:	89 b4 bb 04 02 00 00 	mov    %esi,0x204(%ebx,%edi,4)
8010d07c:	89 9e ac 02 00 00    	mov    %ebx,0x2ac(%esi)
8010d082:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d088:	83 83 04 03 00 00 01 	addl   $0x1,0x304(%ebx)
8010d08f:	c6 83 14 03 00 00 01 	movb   $0x1,0x314(%ebx)
8010d096:	8b 06                	mov    (%esi),%eax
8010d098:	01 83 38 03 00 00    	add    %eax,0x338(%ebx)
8010d09e:	8b 06                	mov    (%esi),%eax
8010d0a0:	05 ff 0f 00 00       	add    $0xfff,%eax
8010d0a5:	c1 e8 0c             	shr    $0xc,%eax
8010d0a8:	01 83 3c 03 00 00    	add    %eax,0x33c(%ebx)
8010d0ae:	8b 9b 08 03 00 00    	mov    0x308(%ebx),%ebx
8010d0b4:	85 db                	test   %ebx,%ebx
8010d0b6:	75 d0                	jne    8010d088 <unsafe_cgroup_insert+0xe8>
8010d0b8:	31 c0                	xor    %eax,%eax
8010d0ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010d0bd:	5b                   	pop    %ebx
8010d0be:	5e                   	pop    %esi
8010d0bf:	5f                   	pop    %edi
8010d0c0:	5d                   	pop    %ebp
8010d0c1:	c3                   	ret    
8010d0c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d0c8:	8b 83 2c 03 00 00    	mov    0x32c(%ebx),%eax
8010d0ce:	39 83 04 03 00 00    	cmp    %eax,0x304(%ebx)
8010d0d4:	0f 8c e2 fe ff ff    	jl     8010cfbc <unsafe_cgroup_insert+0x1c>
8010d0da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d0df:	eb d9                	jmp    8010d0ba <unsafe_cgroup_insert+0x11a>
8010d0e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010d0e8:	8b 06                	mov    (%esi),%eax
8010d0ea:	03 83 38 03 00 00    	add    0x338(%ebx),%eax
8010d0f0:	3b 83 50 03 00 00    	cmp    0x350(%ebx),%eax
8010d0f6:	0f 86 cd fe ff ff    	jbe    8010cfc9 <unsafe_cgroup_insert+0x29>
8010d0fc:	eb dc                	jmp    8010d0da <unsafe_cgroup_insert+0x13a>
8010d0fe:	66 90                	xchg   %ax,%ax

8010d100 <cgroup_insert>:
8010d100:	55                   	push   %ebp
8010d101:	89 e5                	mov    %esp,%ebp
8010d103:	53                   	push   %ebx
8010d104:	83 ec 10             	sub    $0x10,%esp
8010d107:	68 20 c4 13 80       	push   $0x8013c420
8010d10c:	e8 1f 91 ff ff       	call   80106230 <acquire>
8010d111:	58                   	pop    %eax
8010d112:	5a                   	pop    %edx
8010d113:	ff 75 0c             	pushl  0xc(%ebp)
8010d116:	ff 75 08             	pushl  0x8(%ebp)
8010d119:	e8 82 fe ff ff       	call   8010cfa0 <unsafe_cgroup_insert>
8010d11e:	89 c3                	mov    %eax,%ebx
8010d120:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d127:	e8 24 92 ff ff       	call   80106350 <release>
8010d12c:	89 d8                	mov    %ebx,%eax
8010d12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d131:	c9                   	leave  
8010d132:	c3                   	ret    
8010d133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d140 <calc_dec_dst_protect_pg>:
8010d140:	55                   	push   %ebp
8010d141:	31 c0                	xor    %eax,%eax
8010d143:	89 e5                	mov    %esp,%ebp
8010d145:	8b 55 08             	mov    0x8(%ebp),%edx
8010d148:	81 fa 54 c4 13 80    	cmp    $0x8013c454,%edx
8010d14e:	74 35                	je     8010d185 <calc_dec_dst_protect_pg+0x45>
8010d150:	80 ba 13 03 00 00 00 	cmpb   $0x0,0x313(%edx)
8010d157:	74 2c                	je     8010d185 <calc_dec_dst_protect_pg+0x45>
8010d159:	8b 8a 58 03 00 00    	mov    0x358(%edx),%ecx
8010d15f:	85 c9                	test   %ecx,%ecx
8010d161:	74 22                	je     8010d185 <calc_dec_dst_protect_pg+0x45>
8010d163:	8b 82 54 03 00 00    	mov    0x354(%edx),%eax
8010d169:	05 ff 0f 00 00       	add    $0xfff,%eax
8010d16e:	c1 e8 0c             	shr    $0xc,%eax
8010d171:	2b 82 3c 03 00 00    	sub    0x33c(%edx),%eax
8010d177:	89 c2                	mov    %eax,%edx
8010d179:	2b 55 0c             	sub    0xc(%ebp),%edx
8010d17c:	89 c8                	mov    %ecx,%eax
8010d17e:	29 d0                	sub    %edx,%eax
8010d180:	85 d2                	test   %edx,%edx
8010d182:	0f 4e c1             	cmovle %ecx,%eax
8010d185:	5d                   	pop    %ebp
8010d186:	c3                   	ret    
8010d187:	89 f6                	mov    %esi,%esi
8010d189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d190 <calc_inc_src_protect_pg>:
8010d190:	55                   	push   %ebp
8010d191:	31 c0                	xor    %eax,%eax
8010d193:	89 e5                	mov    %esp,%ebp
8010d195:	53                   	push   %ebx
8010d196:	8b 55 08             	mov    0x8(%ebp),%edx
8010d199:	81 fa 54 c4 13 80    	cmp    $0x8013c454,%edx
8010d19f:	74 2f                	je     8010d1d0 <calc_inc_src_protect_pg+0x40>
8010d1a1:	80 ba 13 03 00 00 00 	cmpb   $0x0,0x313(%edx)
8010d1a8:	74 26                	je     8010d1d0 <calc_inc_src_protect_pg+0x40>
8010d1aa:	8b 8a 54 03 00 00    	mov    0x354(%edx),%ecx
8010d1b0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010d1b3:	81 c1 ff 0f 00 00    	add    $0xfff,%ecx
8010d1b9:	c1 e9 0c             	shr    $0xc,%ecx
8010d1bc:	01 d9                	add    %ebx,%ecx
8010d1be:	2b 8a 3c 03 00 00    	sub    0x33c(%edx),%ecx
8010d1c4:	85 c9                	test   %ecx,%ecx
8010d1c6:	7e 08                	jle    8010d1d0 <calc_inc_src_protect_pg+0x40>
8010d1c8:	89 c8                	mov    %ecx,%eax
8010d1ca:	2b 82 58 03 00 00    	sub    0x358(%edx),%eax
8010d1d0:	5b                   	pop    %ebx
8010d1d1:	5d                   	pop    %ebp
8010d1d2:	c3                   	ret    
8010d1d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d1e0 <cgroup_erase>:
8010d1e0:	55                   	push   %ebp
8010d1e1:	89 e5                	mov    %esp,%ebp
8010d1e3:	56                   	push   %esi
8010d1e4:	53                   	push   %ebx
8010d1e5:	8b 75 0c             	mov    0xc(%ebp),%esi
8010d1e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010d1eb:	83 ec 0c             	sub    $0xc,%esp
8010d1ee:	68 20 c4 13 80       	push   $0x8013c420
8010d1f3:	e8 38 90 ff ff       	call   80106230 <acquire>
8010d1f8:	83 c4 10             	add    $0x10,%esp
8010d1fb:	31 c9                	xor    %ecx,%ecx
8010d1fd:	eb 09                	jmp    8010d208 <cgroup_erase+0x28>
8010d1ff:	90                   	nop
8010d200:	83 c1 01             	add    $0x1,%ecx
8010d203:	83 f9 40             	cmp    $0x40,%ecx
8010d206:	74 27                	je     8010d22f <cgroup_erase+0x4f>
8010d208:	3b b4 8b 04 02 00 00 	cmp    0x204(%ebx,%ecx,4),%esi
8010d20f:	75 ef                	jne    8010d200 <cgroup_erase+0x20>
8010d211:	c7 86 ac 02 00 00 54 	movl   $0x8013c454,0x2ac(%esi)
8010d218:	c4 13 80 
8010d21b:	89 f2                	mov    %esi,%edx
8010d21d:	c7 84 8b 04 02 00 00 	movl   $0x0,0x204(%ebx,%ecx,4)
8010d224:	00 00 00 00 
8010d228:	89 d8                	mov    %ebx,%eax
8010d22a:	e8 91 f9 ff ff       	call   8010cbc0 <unsafe_cgroup_erase.part.0>
8010d22f:	c7 45 08 20 c4 13 80 	movl   $0x8013c420,0x8(%ebp)
8010d236:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010d239:	5b                   	pop    %ebx
8010d23a:	5e                   	pop    %esi
8010d23b:	5d                   	pop    %ebp
8010d23c:	e9 0f 91 ff ff       	jmp    80106350 <release>
8010d241:	eb 0d                	jmp    8010d250 <unsafe_enable_cpu_controller>
8010d243:	90                   	nop
8010d244:	90                   	nop
8010d245:	90                   	nop
8010d246:	90                   	nop
8010d247:	90                   	nop
8010d248:	90                   	nop
8010d249:	90                   	nop
8010d24a:	90                   	nop
8010d24b:	90                   	nop
8010d24c:	90                   	nop
8010d24d:	90                   	nop
8010d24e:	90                   	nop
8010d24f:	90                   	nop

8010d250 <unsafe_enable_cpu_controller>:
8010d250:	55                   	push   %ebp
8010d251:	89 e5                	mov    %esp,%ebp
8010d253:	8b 55 08             	mov    0x8(%ebp),%edx
8010d256:	85 d2                	test   %edx,%edx
8010d258:	74 52                	je     8010d2ac <unsafe_enable_cpu_controller+0x5c>
8010d25a:	80 ba 14 03 00 00 01 	cmpb   $0x1,0x314(%edx)
8010d261:	74 49                	je     8010d2ac <unsafe_enable_cpu_controller+0x5c>
8010d263:	80 ba 0d 03 00 00 00 	cmpb   $0x0,0x30d(%edx)
8010d26a:	75 3c                	jne    8010d2a8 <unsafe_enable_cpu_controller+0x58>
8010d26c:	80 ba 0c 03 00 00 00 	cmpb   $0x0,0x30c(%edx)
8010d273:	74 33                	je     8010d2a8 <unsafe_enable_cpu_controller+0x58>
8010d275:	c6 82 0d 03 00 00 01 	movb   $0x1,0x30d(%edx)
8010d27c:	b8 e4 ca 13 80       	mov    $0x8013cae4,%eax
8010d281:	eb 11                	jmp    8010d294 <unsafe_enable_cpu_controller+0x44>
8010d283:	90                   	nop
8010d284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d288:	05 88 03 00 00       	add    $0x388,%eax
8010d28d:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d292:	74 14                	je     8010d2a8 <unsafe_enable_cpu_controller+0x58>
8010d294:	3b 10                	cmp    (%eax),%edx
8010d296:	75 f0                	jne    8010d288 <unsafe_enable_cpu_controller+0x38>
8010d298:	c6 40 04 01          	movb   $0x1,0x4(%eax)
8010d29c:	05 88 03 00 00       	add    $0x388,%eax
8010d2a1:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d2a6:	75 ec                	jne    8010d294 <unsafe_enable_cpu_controller+0x44>
8010d2a8:	31 c0                	xor    %eax,%eax
8010d2aa:	5d                   	pop    %ebp
8010d2ab:	c3                   	ret    
8010d2ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d2b1:	5d                   	pop    %ebp
8010d2b2:	c3                   	ret    
8010d2b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d2c0 <enable_cpu_controller>:
8010d2c0:	55                   	push   %ebp
8010d2c1:	89 e5                	mov    %esp,%ebp
8010d2c3:	53                   	push   %ebx
8010d2c4:	83 ec 10             	sub    $0x10,%esp
8010d2c7:	68 20 c4 13 80       	push   $0x8013c420
8010d2cc:	e8 5f 8f ff ff       	call   80106230 <acquire>
8010d2d1:	58                   	pop    %eax
8010d2d2:	ff 75 08             	pushl  0x8(%ebp)
8010d2d5:	e8 76 ff ff ff       	call   8010d250 <unsafe_enable_cpu_controller>
8010d2da:	89 c3                	mov    %eax,%ebx
8010d2dc:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d2e3:	e8 68 90 ff ff       	call   80106350 <release>
8010d2e8:	89 d8                	mov    %ebx,%eax
8010d2ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d2ed:	c9                   	leave  
8010d2ee:	c3                   	ret    
8010d2ef:	90                   	nop

8010d2f0 <unsafe_disable_cpu_controller>:
8010d2f0:	55                   	push   %ebp
8010d2f1:	89 e5                	mov    %esp,%ebp
8010d2f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010d2f6:	85 c9                	test   %ecx,%ecx
8010d2f8:	74 2e                	je     8010d328 <unsafe_disable_cpu_controller+0x38>
8010d2fa:	80 b9 0d 03 00 00 00 	cmpb   $0x0,0x30d(%ecx)
8010d301:	b8 e4 ca 13 80       	mov    $0x8013cae4,%eax
8010d306:	89 c2                	mov    %eax,%edx
8010d308:	75 14                	jne    8010d31e <unsafe_disable_cpu_controller+0x2e>
8010d30a:	eb 24                	jmp    8010d330 <unsafe_disable_cpu_controller+0x40>
8010d30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d310:	81 c2 88 03 00 00    	add    $0x388,%edx
8010d316:	81 fa 5c a9 14 80    	cmp    $0x8014a95c,%edx
8010d31c:	74 1a                	je     8010d338 <unsafe_disable_cpu_controller+0x48>
8010d31e:	3b 0a                	cmp    (%edx),%ecx
8010d320:	75 ee                	jne    8010d310 <unsafe_disable_cpu_controller+0x20>
8010d322:	80 7a 05 00          	cmpb   $0x0,0x5(%edx)
8010d326:	74 e8                	je     8010d310 <unsafe_disable_cpu_controller+0x20>
8010d328:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d32d:	5d                   	pop    %ebp
8010d32e:	c3                   	ret    
8010d32f:	90                   	nop
8010d330:	31 c0                	xor    %eax,%eax
8010d332:	5d                   	pop    %ebp
8010d333:	c3                   	ret    
8010d334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d338:	c6 81 0d 03 00 00 00 	movb   $0x0,0x30d(%ecx)
8010d33f:	eb 13                	jmp    8010d354 <unsafe_disable_cpu_controller+0x64>
8010d341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010d348:	05 88 03 00 00       	add    $0x388,%eax
8010d34d:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d352:	74 dc                	je     8010d330 <unsafe_disable_cpu_controller+0x40>
8010d354:	3b 08                	cmp    (%eax),%ecx
8010d356:	75 f0                	jne    8010d348 <unsafe_disable_cpu_controller+0x58>
8010d358:	c6 40 04 00          	movb   $0x0,0x4(%eax)
8010d35c:	eb ea                	jmp    8010d348 <unsafe_disable_cpu_controller+0x58>
8010d35e:	66 90                	xchg   %ax,%ax

8010d360 <disable_cpu_controller>:
8010d360:	55                   	push   %ebp
8010d361:	89 e5                	mov    %esp,%ebp
8010d363:	53                   	push   %ebx
8010d364:	83 ec 10             	sub    $0x10,%esp
8010d367:	68 20 c4 13 80       	push   $0x8013c420
8010d36c:	e8 bf 8e ff ff       	call   80106230 <acquire>
8010d371:	58                   	pop    %eax
8010d372:	ff 75 08             	pushl  0x8(%ebp)
8010d375:	e8 76 ff ff ff       	call   8010d2f0 <unsafe_disable_cpu_controller>
8010d37a:	89 c3                	mov    %eax,%ebx
8010d37c:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d383:	e8 c8 8f ff ff       	call   80106350 <release>
8010d388:	89 d8                	mov    %ebx,%eax
8010d38a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d38d:	c9                   	leave  
8010d38e:	c3                   	ret    
8010d38f:	90                   	nop

8010d390 <set_cgroup_dir_path>:
8010d390:	55                   	push   %ebp
8010d391:	89 e5                	mov    %esp,%ebp
8010d393:	56                   	push   %esi
8010d394:	53                   	push   %ebx
8010d395:	8b 75 0c             	mov    0xc(%ebp),%esi
8010d398:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010d39b:	83 ec 0c             	sub    $0xc,%esp
8010d39e:	68 20 c4 13 80       	push   $0x8013c420
8010d3a3:	e8 88 8e ff ff       	call   80106230 <acquire>
8010d3a8:	89 f2                	mov    %esi,%edx
8010d3aa:	89 d8                	mov    %ebx,%eax
8010d3ac:	e8 9f fa ff ff       	call   8010ce50 <unsafe_set_cgroup_dir_path>
8010d3b1:	c7 45 08 20 c4 13 80 	movl   $0x8013c420,0x8(%ebp)
8010d3b8:	83 c4 10             	add    $0x10,%esp
8010d3bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010d3be:	5b                   	pop    %ebx
8010d3bf:	5e                   	pop    %esi
8010d3c0:	5d                   	pop    %ebp
8010d3c1:	e9 8a 8f ff ff       	jmp    80106350 <release>
8010d3c6:	8d 76 00             	lea    0x0(%esi),%esi
8010d3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d3d0 <get_cgroup_by_path>:
8010d3d0:	55                   	push   %ebp
8010d3d1:	89 e5                	mov    %esp,%ebp
8010d3d3:	53                   	push   %ebx
8010d3d4:	83 ec 10             	sub    $0x10,%esp
8010d3d7:	68 20 c4 13 80       	push   $0x8013c420
8010d3dc:	e8 4f 8e ff ff       	call   80106230 <acquire>
8010d3e1:	8b 45 08             	mov    0x8(%ebp),%eax
8010d3e4:	e8 f7 f9 ff ff       	call   8010cde0 <unsafe_get_cgroup_by_path>
8010d3e9:	89 c3                	mov    %eax,%ebx
8010d3eb:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d3f2:	e8 59 8f ff ff       	call   80106350 <release>
8010d3f7:	89 d8                	mov    %ebx,%eax
8010d3f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d3fc:	c9                   	leave  
8010d3fd:	c3                   	ret    
8010d3fe:	66 90                	xchg   %ax,%ax

8010d400 <set_max_descendants_value>:
8010d400:	55                   	push   %ebp
8010d401:	89 e5                	mov    %esp,%ebp
8010d403:	8b 55 0c             	mov    0xc(%ebp),%edx
8010d406:	8b 45 08             	mov    0x8(%ebp),%eax
8010d409:	89 90 18 03 00 00    	mov    %edx,0x318(%eax)
8010d40f:	5d                   	pop    %ebp
8010d410:	c3                   	ret    
8010d411:	eb 0d                	jmp    8010d420 <set_max_depth_value>
8010d413:	90                   	nop
8010d414:	90                   	nop
8010d415:	90                   	nop
8010d416:	90                   	nop
8010d417:	90                   	nop
8010d418:	90                   	nop
8010d419:	90                   	nop
8010d41a:	90                   	nop
8010d41b:	90                   	nop
8010d41c:	90                   	nop
8010d41d:	90                   	nop
8010d41e:	90                   	nop
8010d41f:	90                   	nop

8010d420 <set_max_depth_value>:
8010d420:	55                   	push   %ebp
8010d421:	89 e5                	mov    %esp,%ebp
8010d423:	8b 55 0c             	mov    0xc(%ebp),%edx
8010d426:	8b 45 08             	mov    0x8(%ebp),%eax
8010d429:	89 90 1c 03 00 00    	mov    %edx,0x31c(%eax)
8010d42f:	5d                   	pop    %ebp
8010d430:	c3                   	ret    
8010d431:	eb 0d                	jmp    8010d440 <set_nr_descendants>
8010d433:	90                   	nop
8010d434:	90                   	nop
8010d435:	90                   	nop
8010d436:	90                   	nop
8010d437:	90                   	nop
8010d438:	90                   	nop
8010d439:	90                   	nop
8010d43a:	90                   	nop
8010d43b:	90                   	nop
8010d43c:	90                   	nop
8010d43d:	90                   	nop
8010d43e:	90                   	nop
8010d43f:	90                   	nop

8010d440 <set_nr_descendants>:
8010d440:	55                   	push   %ebp
8010d441:	89 e5                	mov    %esp,%ebp
8010d443:	8b 55 0c             	mov    0xc(%ebp),%edx
8010d446:	8b 45 08             	mov    0x8(%ebp),%eax
8010d449:	89 90 24 03 00 00    	mov    %edx,0x324(%eax)
8010d44f:	5d                   	pop    %ebp
8010d450:	c3                   	ret    
8010d451:	eb 0d                	jmp    8010d460 <set_nr_dying_descendants>
8010d453:	90                   	nop
8010d454:	90                   	nop
8010d455:	90                   	nop
8010d456:	90                   	nop
8010d457:	90                   	nop
8010d458:	90                   	nop
8010d459:	90                   	nop
8010d45a:	90                   	nop
8010d45b:	90                   	nop
8010d45c:	90                   	nop
8010d45d:	90                   	nop
8010d45e:	90                   	nop
8010d45f:	90                   	nop

8010d460 <set_nr_dying_descendants>:
8010d460:	55                   	push   %ebp
8010d461:	89 e5                	mov    %esp,%ebp
8010d463:	8b 55 0c             	mov    0xc(%ebp),%edx
8010d466:	8b 45 08             	mov    0x8(%ebp),%eax
8010d469:	89 90 28 03 00 00    	mov    %edx,0x328(%eax)
8010d46f:	5d                   	pop    %ebp
8010d470:	c3                   	ret    
8010d471:	eb 0d                	jmp    8010d480 <get_cgroup_names_at_path>
8010d473:	90                   	nop
8010d474:	90                   	nop
8010d475:	90                   	nop
8010d476:	90                   	nop
8010d477:	90                   	nop
8010d478:	90                   	nop
8010d479:	90                   	nop
8010d47a:	90                   	nop
8010d47b:	90                   	nop
8010d47c:	90                   	nop
8010d47d:	90                   	nop
8010d47e:	90                   	nop
8010d47f:	90                   	nop

8010d480 <get_cgroup_names_at_path>:
8010d480:	55                   	push   %ebp
8010d481:	89 e5                	mov    %esp,%ebp
8010d483:	57                   	push   %edi
8010d484:	56                   	push   %esi
8010d485:	53                   	push   %ebx
8010d486:	83 ec 1c             	sub    $0x1c,%esp
8010d489:	8b 45 0c             	mov    0xc(%ebp),%eax
8010d48c:	80 38 00             	cmpb   $0x0,(%eax)
8010d48f:	0f 84 ba 00 00 00    	je     8010d54f <get_cgroup_names_at_path+0xcf>
8010d495:	bb dc c7 13 80       	mov    $0x8013c7dc,%ebx
8010d49a:	be 01 00 00 00       	mov    $0x1,%esi
8010d49f:	eb 19                	jmp    8010d4ba <get_cgroup_names_at_path+0x3a>
8010d4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010d4a8:	83 c6 01             	add    $0x1,%esi
8010d4ab:	81 c3 88 03 00 00    	add    $0x388,%ebx
8010d4b1:	83 fe 40             	cmp    $0x40,%esi
8010d4b4:	0f 84 95 00 00 00    	je     8010d54f <get_cgroup_names_at_path+0xcf>
8010d4ba:	80 3b 00             	cmpb   $0x0,(%ebx)
8010d4bd:	74 e9                	je     8010d4a8 <get_cgroup_names_at_path+0x28>
8010d4bf:	83 ec 08             	sub    $0x8,%esp
8010d4c2:	ff 75 0c             	pushl  0xc(%ebp)
8010d4c5:	ff b3 08 03 00 00    	pushl  0x308(%ebx)
8010d4cb:	e8 70 90 ff ff       	call   80106540 <strcmp>
8010d4d0:	83 c4 10             	add    $0x10,%esp
8010d4d3:	85 c0                	test   %eax,%eax
8010d4d5:	75 d1                	jne    8010d4a8 <get_cgroup_names_at_path+0x28>
8010d4d7:	83 ec 0c             	sub    $0xc,%esp
8010d4da:	ff 75 0c             	pushl  0xc(%ebp)
8010d4dd:	e8 4e 91 ff ff       	call   80106630 <strlen>
8010d4e2:	69 ce 88 03 00 00    	imul   $0x388,%esi,%ecx
8010d4e8:	83 c0 01             	add    $0x1,%eax
8010d4eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010d4ee:	8d bc 08 54 c4 13 80 	lea    -0x7fec3bac(%eax,%ecx,1),%edi
8010d4f5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010d4f8:	89 3c 24             	mov    %edi,(%esp)
8010d4fb:	e8 30 91 ff ff       	call   80106630 <strlen>
8010d500:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010d503:	89 c1                	mov    %eax,%ecx
8010d505:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010d508:	83 c4 10             	add    $0x10,%esp
8010d50b:	0f b6 84 10 54 c4 13 	movzbl -0x7fec3bac(%eax,%edx,1),%eax
8010d512:	80 
8010d513:	84 c0                	test   %al,%al
8010d515:	74 1c                	je     8010d533 <get_cgroup_names_at_path+0xb3>
8010d517:	8b 55 08             	mov    0x8(%ebp),%edx
8010d51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d520:	83 c2 01             	add    $0x1,%edx
8010d523:	83 c7 01             	add    $0x1,%edi
8010d526:	88 42 ff             	mov    %al,-0x1(%edx)
8010d529:	0f b6 07             	movzbl (%edi),%eax
8010d52c:	84 c0                	test   %al,%al
8010d52e:	75 f0                	jne    8010d520 <get_cgroup_names_at_path+0xa0>
8010d530:	89 55 08             	mov    %edx,0x8(%ebp)
8010d533:	b8 40 00 00 00       	mov    $0x40,%eax
8010d538:	83 c6 01             	add    $0x1,%esi
8010d53b:	81 c3 88 03 00 00    	add    $0x388,%ebx
8010d541:	29 c8                	sub    %ecx,%eax
8010d543:	01 45 08             	add    %eax,0x8(%ebp)
8010d546:	83 fe 40             	cmp    $0x40,%esi
8010d549:	0f 85 6b ff ff ff    	jne    8010d4ba <get_cgroup_names_at_path+0x3a>
8010d54f:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010d552:	5b                   	pop    %ebx
8010d553:	5e                   	pop    %esi
8010d554:	5f                   	pop    %edi
8010d555:	5d                   	pop    %ebp
8010d556:	c3                   	ret    
8010d557:	89 f6                	mov    %esi,%esi
8010d559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d560 <cgorup_num_of_immidiate_children>:
8010d560:	55                   	push   %ebp
8010d561:	89 e5                	mov    %esp,%ebp
8010d563:	57                   	push   %edi
8010d564:	56                   	push   %esi
8010d565:	53                   	push   %ebx
8010d566:	83 ec 0c             	sub    $0xc,%esp
8010d569:	8b 7d 08             	mov    0x8(%ebp),%edi
8010d56c:	80 3f 00             	cmpb   $0x0,(%edi)
8010d56f:	74 52                	je     8010d5c3 <cgorup_num_of_immidiate_children+0x63>
8010d571:	bb 54 c4 13 80       	mov    $0x8013c454,%ebx
8010d576:	31 f6                	xor    %esi,%esi
8010d578:	eb 14                	jmp    8010d58e <cgorup_num_of_immidiate_children+0x2e>
8010d57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d580:	81 c3 88 03 00 00    	add    $0x388,%ebx
8010d586:	81 fb 54 a6 14 80    	cmp    $0x8014a654,%ebx
8010d58c:	74 2b                	je     8010d5b9 <cgorup_num_of_immidiate_children+0x59>
8010d58e:	80 3b 00             	cmpb   $0x0,(%ebx)
8010d591:	74 ed                	je     8010d580 <cgorup_num_of_immidiate_children+0x20>
8010d593:	83 ec 08             	sub    $0x8,%esp
8010d596:	57                   	push   %edi
8010d597:	ff b3 08 03 00 00    	pushl  0x308(%ebx)
8010d59d:	e8 9e 8f ff ff       	call   80106540 <strcmp>
8010d5a2:	83 c4 10             	add    $0x10,%esp
8010d5a5:	83 f8 01             	cmp    $0x1,%eax
8010d5a8:	83 d6 00             	adc    $0x0,%esi
8010d5ab:	81 c3 88 03 00 00    	add    $0x388,%ebx
8010d5b1:	81 fb 54 a6 14 80    	cmp    $0x8014a654,%ebx
8010d5b7:	75 d5                	jne    8010d58e <cgorup_num_of_immidiate_children+0x2e>
8010d5b9:	89 f0                	mov    %esi,%eax
8010d5bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010d5be:	5b                   	pop    %ebx
8010d5bf:	5e                   	pop    %esi
8010d5c0:	5f                   	pop    %edi
8010d5c1:	5d                   	pop    %ebp
8010d5c2:	c3                   	ret    
8010d5c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d5c8:	eb f1                	jmp    8010d5bb <cgorup_num_of_immidiate_children+0x5b>
8010d5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

8010d5d0 <decrement_nr_dying_descendants>:
8010d5d0:	55                   	push   %ebp
8010d5d1:	89 e5                	mov    %esp,%ebp
8010d5d3:	8b 45 08             	mov    0x8(%ebp),%eax
8010d5d6:	85 c0                	test   %eax,%eax
8010d5d8:	74 17                	je     8010d5f1 <decrement_nr_dying_descendants+0x21>
8010d5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d5e0:	83 a8 28 03 00 00 01 	subl   $0x1,0x328(%eax)
8010d5e7:	8b 80 08 03 00 00    	mov    0x308(%eax),%eax
8010d5ed:	85 c0                	test   %eax,%eax
8010d5ef:	75 ef                	jne    8010d5e0 <decrement_nr_dying_descendants+0x10>
8010d5f1:	5d                   	pop    %ebp
8010d5f2:	c3                   	ret    
8010d5f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d600 <cg_open>:
8010d600:	55                   	push   %ebp
8010d601:	89 e5                	mov    %esp,%ebp
8010d603:	53                   	push   %ebx
8010d604:	83 ec 10             	sub    $0x10,%esp
8010d607:	68 20 c4 13 80       	push   $0x8013c420
8010d60c:	e8 1f 8c ff ff       	call   80106230 <acquire>
8010d611:	ff 75 14             	pushl  0x14(%ebp)
8010d614:	ff 75 10             	pushl  0x10(%ebp)
8010d617:	ff 75 0c             	pushl  0xc(%ebp)
8010d61a:	ff 75 08             	pushl  0x8(%ebp)
8010d61d:	e8 2e cd ff ff       	call   8010a350 <unsafe_cg_open>
8010d622:	83 c4 14             	add    $0x14,%esp
8010d625:	89 c3                	mov    %eax,%ebx
8010d627:	68 20 c4 13 80       	push   $0x8013c420
8010d62c:	e8 1f 8d ff ff       	call   80106350 <release>
8010d631:	89 d8                	mov    %ebx,%eax
8010d633:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d636:	c9                   	leave  
8010d637:	c3                   	ret    
8010d638:	90                   	nop
8010d639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010d640 <cg_sys_open>:
8010d640:	55                   	push   %ebp
8010d641:	89 e5                	mov    %esp,%ebp
8010d643:	57                   	push   %edi
8010d644:	56                   	push   %esi
8010d645:	53                   	push   %ebx
8010d646:	81 ec 18 04 00 00    	sub    $0x418,%esp
8010d64c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010d64f:	53                   	push   %ebx
8010d650:	e8 7b fd ff ff       	call   8010d3d0 <get_cgroup_by_path>
8010d655:	83 c4 10             	add    $0x10,%esp
8010d658:	85 c0                	test   %eax,%eax
8010d65a:	74 1c                	je     8010d678 <cg_sys_open+0x38>
8010d65c:	ff 75 0c             	pushl  0xc(%ebp)
8010d65f:	50                   	push   %eax
8010d660:	6a 00                	push   $0x0
8010d662:	6a 01                	push   $0x1
8010d664:	e8 97 ff ff ff       	call   8010d600 <cg_open>
8010d669:	83 c4 10             	add    $0x10,%esp
8010d66c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010d66f:	5b                   	pop    %ebx
8010d670:	5e                   	pop    %esi
8010d671:	5f                   	pop    %edi
8010d672:	5d                   	pop    %ebp
8010d673:	c3                   	ret    
8010d674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d678:	8d b5 e8 fb ff ff    	lea    -0x418(%ebp),%esi
8010d67e:	83 ec 08             	sub    $0x8,%esp
8010d681:	56                   	push   %esi
8010d682:	53                   	push   %ebx
8010d683:	e8 d8 f1 ff ff       	call   8010c860 <get_dir_name>
8010d688:	83 c4 10             	add    $0x10,%esp
8010d68b:	85 c0                	test   %eax,%eax
8010d68d:	75 41                	jne    8010d6d0 <cg_sys_open+0x90>
8010d68f:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
8010d695:	83 ec 08             	sub    $0x8,%esp
8010d698:	57                   	push   %edi
8010d699:	53                   	push   %ebx
8010d69a:	e8 21 f1 ff ff       	call   8010c7c0 <get_base_name>
8010d69f:	83 c4 10             	add    $0x10,%esp
8010d6a2:	85 c0                	test   %eax,%eax
8010d6a4:	75 2a                	jne    8010d6d0 <cg_sys_open+0x90>
8010d6a6:	83 ec 0c             	sub    $0xc,%esp
8010d6a9:	56                   	push   %esi
8010d6aa:	e8 21 fd ff ff       	call   8010d3d0 <get_cgroup_by_path>
8010d6af:	83 c4 10             	add    $0x10,%esp
8010d6b2:	85 c0                	test   %eax,%eax
8010d6b4:	74 1a                	je     8010d6d0 <cg_sys_open+0x90>
8010d6b6:	ff 75 0c             	pushl  0xc(%ebp)
8010d6b9:	50                   	push   %eax
8010d6ba:	57                   	push   %edi
8010d6bb:	6a 00                	push   $0x0
8010d6bd:	e8 3e ff ff ff       	call   8010d600 <cg_open>
8010d6c2:	83 c4 10             	add    $0x10,%esp
8010d6c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010d6c8:	5b                   	pop    %ebx
8010d6c9:	5e                   	pop    %esi
8010d6ca:	5f                   	pop    %edi
8010d6cb:	5d                   	pop    %ebp
8010d6cc:	c3                   	ret    
8010d6cd:	8d 76 00             	lea    0x0(%esi),%esi
8010d6d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d6d5:	eb 95                	jmp    8010d66c <cg_sys_open+0x2c>
8010d6d7:	89 f6                	mov    %esi,%esi
8010d6d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d6e0 <cg_read>:
8010d6e0:	55                   	push   %ebp
8010d6e1:	89 e5                	mov    %esp,%ebp
8010d6e3:	53                   	push   %ebx
8010d6e4:	83 ec 10             	sub    $0x10,%esp
8010d6e7:	68 20 c4 13 80       	push   $0x8013c420
8010d6ec:	e8 3f 8b ff ff       	call   80106230 <acquire>
8010d6f1:	ff 75 14             	pushl  0x14(%ebp)
8010d6f4:	ff 75 10             	pushl  0x10(%ebp)
8010d6f7:	ff 75 0c             	pushl  0xc(%ebp)
8010d6fa:	ff 75 08             	pushl  0x8(%ebp)
8010d6fd:	e8 ae cf ff ff       	call   8010a6b0 <unsafe_cg_read>
8010d702:	83 c4 14             	add    $0x14,%esp
8010d705:	89 c3                	mov    %eax,%ebx
8010d707:	68 20 c4 13 80       	push   $0x8013c420
8010d70c:	e8 3f 8c ff ff       	call   80106350 <release>
8010d711:	89 d8                	mov    %ebx,%eax
8010d713:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d716:	c9                   	leave  
8010d717:	c3                   	ret    
8010d718:	90                   	nop
8010d719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010d720 <cg_write>:
8010d720:	55                   	push   %ebp
8010d721:	89 e5                	mov    %esp,%ebp
8010d723:	53                   	push   %ebx
8010d724:	83 ec 10             	sub    $0x10,%esp
8010d727:	68 20 c4 13 80       	push   $0x8013c420
8010d72c:	e8 ff 8a ff ff       	call   80106230 <acquire>
8010d731:	83 c4 0c             	add    $0xc,%esp
8010d734:	ff 75 10             	pushl  0x10(%ebp)
8010d737:	ff 75 0c             	pushl  0xc(%ebp)
8010d73a:	ff 75 08             	pushl  0x8(%ebp)
8010d73d:	e8 ce e7 ff ff       	call   8010bf10 <unsafe_cg_write>
8010d742:	89 c3                	mov    %eax,%ebx
8010d744:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d74b:	e8 00 8c ff ff       	call   80106350 <release>
8010d750:	89 d8                	mov    %ebx,%eax
8010d752:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d755:	c9                   	leave  
8010d756:	c3                   	ret    
8010d757:	89 f6                	mov    %esi,%esi
8010d759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d760 <cg_close>:
8010d760:	55                   	push   %ebp
8010d761:	89 e5                	mov    %esp,%ebp
8010d763:	53                   	push   %ebx
8010d764:	83 ec 10             	sub    $0x10,%esp
8010d767:	68 20 c4 13 80       	push   $0x8013c420
8010d76c:	e8 bf 8a ff ff       	call   80106230 <acquire>
8010d771:	58                   	pop    %eax
8010d772:	ff 75 08             	pushl  0x8(%ebp)
8010d775:	e8 e6 ef ff ff       	call   8010c760 <unsafe_cg_close>
8010d77a:	89 c3                	mov    %eax,%ebx
8010d77c:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d783:	e8 c8 8b ff ff       	call   80106350 <release>
8010d788:	89 d8                	mov    %ebx,%eax
8010d78a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d78d:	c9                   	leave  
8010d78e:	c3                   	ret    
8010d78f:	90                   	nop

8010d790 <cg_stat>:
8010d790:	55                   	push   %ebp
8010d791:	89 e5                	mov    %esp,%ebp
8010d793:	53                   	push   %ebx
8010d794:	83 ec 10             	sub    $0x10,%esp
8010d797:	68 20 c4 13 80       	push   $0x8013c420
8010d79c:	e8 8f 8a ff ff       	call   80106230 <acquire>
8010d7a1:	58                   	pop    %eax
8010d7a2:	5a                   	pop    %edx
8010d7a3:	ff 75 0c             	pushl  0xc(%ebp)
8010d7a6:	ff 75 08             	pushl  0x8(%ebp)
8010d7a9:	e8 62 f1 ff ff       	call   8010c910 <unsafe_cg_stat>
8010d7ae:	89 c3                	mov    %eax,%ebx
8010d7b0:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d7b7:	e8 94 8b ff ff       	call   80106350 <release>
8010d7bc:	89 d8                	mov    %ebx,%eax
8010d7be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d7c1:	c9                   	leave  
8010d7c2:	c3                   	ret    
8010d7c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d7d0 <set_max_procs>:
8010d7d0:	55                   	push   %ebp
8010d7d1:	89 e5                	mov    %esp,%ebp
8010d7d3:	8b 55 08             	mov    0x8(%ebp),%edx
8010d7d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010d7d9:	85 d2                	test   %edx,%edx
8010d7db:	74 14                	je     8010d7f1 <set_max_procs+0x21>
8010d7dd:	31 c0                	xor    %eax,%eax
8010d7df:	83 f9 40             	cmp    $0x40,%ecx
8010d7e2:	77 0b                	ja     8010d7ef <set_max_procs+0x1f>
8010d7e4:	89 8a 2c 03 00 00    	mov    %ecx,0x32c(%edx)
8010d7ea:	b8 01 00 00 00       	mov    $0x1,%eax
8010d7ef:	5d                   	pop    %ebp
8010d7f0:	c3                   	ret    
8010d7f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d7f6:	5d                   	pop    %ebp
8010d7f7:	c3                   	ret    
8010d7f8:	90                   	nop
8010d7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010d800 <unsafe_enable_pid_controller>:
8010d800:	55                   	push   %ebp
8010d801:	89 e5                	mov    %esp,%ebp
8010d803:	8b 55 08             	mov    0x8(%ebp),%edx
8010d806:	85 d2                	test   %edx,%edx
8010d808:	74 52                	je     8010d85c <unsafe_enable_pid_controller+0x5c>
8010d80a:	80 ba 14 03 00 00 01 	cmpb   $0x1,0x314(%edx)
8010d811:	74 49                	je     8010d85c <unsafe_enable_pid_controller+0x5c>
8010d813:	80 ba 0f 03 00 00 00 	cmpb   $0x0,0x30f(%edx)
8010d81a:	75 3c                	jne    8010d858 <unsafe_enable_pid_controller+0x58>
8010d81c:	80 ba 0e 03 00 00 00 	cmpb   $0x0,0x30e(%edx)
8010d823:	74 33                	je     8010d858 <unsafe_enable_pid_controller+0x58>
8010d825:	c6 82 0f 03 00 00 01 	movb   $0x1,0x30f(%edx)
8010d82c:	b8 e4 ca 13 80       	mov    $0x8013cae4,%eax
8010d831:	eb 11                	jmp    8010d844 <unsafe_enable_pid_controller+0x44>
8010d833:	90                   	nop
8010d834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d838:	05 88 03 00 00       	add    $0x388,%eax
8010d83d:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d842:	74 14                	je     8010d858 <unsafe_enable_pid_controller+0x58>
8010d844:	3b 10                	cmp    (%eax),%edx
8010d846:	75 f0                	jne    8010d838 <unsafe_enable_pid_controller+0x38>
8010d848:	c6 40 06 01          	movb   $0x1,0x6(%eax)
8010d84c:	05 88 03 00 00       	add    $0x388,%eax
8010d851:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d856:	75 ec                	jne    8010d844 <unsafe_enable_pid_controller+0x44>
8010d858:	31 c0                	xor    %eax,%eax
8010d85a:	5d                   	pop    %ebp
8010d85b:	c3                   	ret    
8010d85c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d861:	5d                   	pop    %ebp
8010d862:	c3                   	ret    
8010d863:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d870 <unsafe_disable_pid_controller>:
8010d870:	55                   	push   %ebp
8010d871:	89 e5                	mov    %esp,%ebp
8010d873:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010d876:	85 c9                	test   %ecx,%ecx
8010d878:	74 2e                	je     8010d8a8 <unsafe_disable_pid_controller+0x38>
8010d87a:	80 b9 0f 03 00 00 00 	cmpb   $0x0,0x30f(%ecx)
8010d881:	b8 e4 ca 13 80       	mov    $0x8013cae4,%eax
8010d886:	89 c2                	mov    %eax,%edx
8010d888:	75 14                	jne    8010d89e <unsafe_disable_pid_controller+0x2e>
8010d88a:	eb 24                	jmp    8010d8b0 <unsafe_disable_pid_controller+0x40>
8010d88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d890:	81 c2 88 03 00 00    	add    $0x388,%edx
8010d896:	81 fa 5c a9 14 80    	cmp    $0x8014a95c,%edx
8010d89c:	74 1a                	je     8010d8b8 <unsafe_disable_pid_controller+0x48>
8010d89e:	3b 0a                	cmp    (%edx),%ecx
8010d8a0:	75 ee                	jne    8010d890 <unsafe_disable_pid_controller+0x20>
8010d8a2:	80 7a 07 00          	cmpb   $0x0,0x7(%edx)
8010d8a6:	74 e8                	je     8010d890 <unsafe_disable_pid_controller+0x20>
8010d8a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d8ad:	5d                   	pop    %ebp
8010d8ae:	c3                   	ret    
8010d8af:	90                   	nop
8010d8b0:	31 c0                	xor    %eax,%eax
8010d8b2:	5d                   	pop    %ebp
8010d8b3:	c3                   	ret    
8010d8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d8b8:	c6 81 0f 03 00 00 00 	movb   $0x0,0x30f(%ecx)
8010d8bf:	eb 13                	jmp    8010d8d4 <unsafe_disable_pid_controller+0x64>
8010d8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010d8c8:	05 88 03 00 00       	add    $0x388,%eax
8010d8cd:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d8d2:	74 dc                	je     8010d8b0 <unsafe_disable_pid_controller+0x40>
8010d8d4:	3b 08                	cmp    (%eax),%ecx
8010d8d6:	75 f0                	jne    8010d8c8 <unsafe_disable_pid_controller+0x58>
8010d8d8:	c6 40 06 00          	movb   $0x0,0x6(%eax)
8010d8dc:	eb ea                	jmp    8010d8c8 <unsafe_disable_pid_controller+0x58>
8010d8de:	66 90                	xchg   %ax,%ax

8010d8e0 <enable_pid_controller>:
8010d8e0:	55                   	push   %ebp
8010d8e1:	89 e5                	mov    %esp,%ebp
8010d8e3:	53                   	push   %ebx
8010d8e4:	83 ec 10             	sub    $0x10,%esp
8010d8e7:	68 20 c4 13 80       	push   $0x8013c420
8010d8ec:	e8 3f 89 ff ff       	call   80106230 <acquire>
8010d8f1:	58                   	pop    %eax
8010d8f2:	ff 75 08             	pushl  0x8(%ebp)
8010d8f5:	e8 06 ff ff ff       	call   8010d800 <unsafe_enable_pid_controller>
8010d8fa:	89 c3                	mov    %eax,%ebx
8010d8fc:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d903:	e8 48 8a ff ff       	call   80106350 <release>
8010d908:	89 d8                	mov    %ebx,%eax
8010d90a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d90d:	c9                   	leave  
8010d90e:	c3                   	ret    
8010d90f:	90                   	nop

8010d910 <disable_pid_controller>:
8010d910:	55                   	push   %ebp
8010d911:	89 e5                	mov    %esp,%ebp
8010d913:	53                   	push   %ebx
8010d914:	83 ec 10             	sub    $0x10,%esp
8010d917:	68 20 c4 13 80       	push   $0x8013c420
8010d91c:	e8 0f 89 ff ff       	call   80106230 <acquire>
8010d921:	58                   	pop    %eax
8010d922:	ff 75 08             	pushl  0x8(%ebp)
8010d925:	e8 46 ff ff ff       	call   8010d870 <unsafe_disable_pid_controller>
8010d92a:	89 c3                	mov    %eax,%ebx
8010d92c:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010d933:	e8 18 8a ff ff       	call   80106350 <release>
8010d938:	89 d8                	mov    %ebx,%eax
8010d93a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010d93d:	c9                   	leave  
8010d93e:	c3                   	ret    
8010d93f:	90                   	nop

8010d940 <set_cpu_id>:
8010d940:	55                   	push   %ebp
8010d941:	89 e5                	mov    %esp,%ebp
8010d943:	8b 55 08             	mov    0x8(%ebp),%edx
8010d946:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010d949:	85 d2                	test   %edx,%edx
8010d94b:	74 14                	je     8010d961 <set_cpu_id+0x21>
8010d94d:	31 c0                	xor    %eax,%eax
8010d94f:	83 f9 09             	cmp    $0x9,%ecx
8010d952:	77 0b                	ja     8010d95f <set_cpu_id+0x1f>
8010d954:	88 8a 30 03 00 00    	mov    %cl,0x330(%edx)
8010d95a:	b8 01 00 00 00       	mov    $0x1,%eax
8010d95f:	5d                   	pop    %ebp
8010d960:	c3                   	ret    
8010d961:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d966:	5d                   	pop    %ebp
8010d967:	c3                   	ret    
8010d968:	90                   	nop
8010d969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010d970 <unsafe_enable_set_controller>:
8010d970:	55                   	push   %ebp
8010d971:	89 e5                	mov    %esp,%ebp
8010d973:	8b 55 08             	mov    0x8(%ebp),%edx
8010d976:	85 d2                	test   %edx,%edx
8010d978:	74 52                	je     8010d9cc <unsafe_enable_set_controller+0x5c>
8010d97a:	80 ba 14 03 00 00 01 	cmpb   $0x1,0x314(%edx)
8010d981:	74 49                	je     8010d9cc <unsafe_enable_set_controller+0x5c>
8010d983:	80 ba 11 03 00 00 00 	cmpb   $0x0,0x311(%edx)
8010d98a:	75 3c                	jne    8010d9c8 <unsafe_enable_set_controller+0x58>
8010d98c:	80 ba 10 03 00 00 00 	cmpb   $0x0,0x310(%edx)
8010d993:	74 33                	je     8010d9c8 <unsafe_enable_set_controller+0x58>
8010d995:	c6 82 11 03 00 00 01 	movb   $0x1,0x311(%edx)
8010d99c:	b8 e4 ca 13 80       	mov    $0x8013cae4,%eax
8010d9a1:	eb 11                	jmp    8010d9b4 <unsafe_enable_set_controller+0x44>
8010d9a3:	90                   	nop
8010d9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010d9a8:	05 88 03 00 00       	add    $0x388,%eax
8010d9ad:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d9b2:	74 14                	je     8010d9c8 <unsafe_enable_set_controller+0x58>
8010d9b4:	3b 10                	cmp    (%eax),%edx
8010d9b6:	75 f0                	jne    8010d9a8 <unsafe_enable_set_controller+0x38>
8010d9b8:	c6 40 08 01          	movb   $0x1,0x8(%eax)
8010d9bc:	05 88 03 00 00       	add    $0x388,%eax
8010d9c1:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010d9c6:	75 ec                	jne    8010d9b4 <unsafe_enable_set_controller+0x44>
8010d9c8:	31 c0                	xor    %eax,%eax
8010d9ca:	5d                   	pop    %ebp
8010d9cb:	c3                   	ret    
8010d9cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010d9d1:	5d                   	pop    %ebp
8010d9d2:	c3                   	ret    
8010d9d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010d9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010d9e0 <unsafe_disable_set_controller>:
8010d9e0:	55                   	push   %ebp
8010d9e1:	89 e5                	mov    %esp,%ebp
8010d9e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010d9e6:	85 c9                	test   %ecx,%ecx
8010d9e8:	74 2e                	je     8010da18 <unsafe_disable_set_controller+0x38>
8010d9ea:	80 b9 11 03 00 00 00 	cmpb   $0x0,0x311(%ecx)
8010d9f1:	b8 e4 ca 13 80       	mov    $0x8013cae4,%eax
8010d9f6:	89 c2                	mov    %eax,%edx
8010d9f8:	75 14                	jne    8010da0e <unsafe_disable_set_controller+0x2e>
8010d9fa:	eb 24                	jmp    8010da20 <unsafe_disable_set_controller+0x40>
8010d9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010da00:	81 c2 88 03 00 00    	add    $0x388,%edx
8010da06:	81 fa 5c a9 14 80    	cmp    $0x8014a95c,%edx
8010da0c:	74 1a                	je     8010da28 <unsafe_disable_set_controller+0x48>
8010da0e:	3b 0a                	cmp    (%edx),%ecx
8010da10:	75 ee                	jne    8010da00 <unsafe_disable_set_controller+0x20>
8010da12:	80 7a 09 00          	cmpb   $0x0,0x9(%edx)
8010da16:	74 e8                	je     8010da00 <unsafe_disable_set_controller+0x20>
8010da18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010da1d:	5d                   	pop    %ebp
8010da1e:	c3                   	ret    
8010da1f:	90                   	nop
8010da20:	31 c0                	xor    %eax,%eax
8010da22:	5d                   	pop    %ebp
8010da23:	c3                   	ret    
8010da24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010da28:	c6 81 11 03 00 00 00 	movb   $0x0,0x311(%ecx)
8010da2f:	eb 13                	jmp    8010da44 <unsafe_disable_set_controller+0x64>
8010da31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010da38:	05 88 03 00 00       	add    $0x388,%eax
8010da3d:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010da42:	74 dc                	je     8010da20 <unsafe_disable_set_controller+0x40>
8010da44:	3b 08                	cmp    (%eax),%ecx
8010da46:	75 f0                	jne    8010da38 <unsafe_disable_set_controller+0x58>
8010da48:	c6 40 08 00          	movb   $0x0,0x8(%eax)
8010da4c:	eb ea                	jmp    8010da38 <unsafe_disable_set_controller+0x58>
8010da4e:	66 90                	xchg   %ax,%ax

8010da50 <enable_set_controller>:
8010da50:	55                   	push   %ebp
8010da51:	89 e5                	mov    %esp,%ebp
8010da53:	53                   	push   %ebx
8010da54:	83 ec 10             	sub    $0x10,%esp
8010da57:	68 20 c4 13 80       	push   $0x8013c420
8010da5c:	e8 cf 87 ff ff       	call   80106230 <acquire>
8010da61:	58                   	pop    %eax
8010da62:	ff 75 08             	pushl  0x8(%ebp)
8010da65:	e8 06 ff ff ff       	call   8010d970 <unsafe_enable_set_controller>
8010da6a:	89 c3                	mov    %eax,%ebx
8010da6c:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010da73:	e8 d8 88 ff ff       	call   80106350 <release>
8010da78:	89 d8                	mov    %ebx,%eax
8010da7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010da7d:	c9                   	leave  
8010da7e:	c3                   	ret    
8010da7f:	90                   	nop

8010da80 <disable_set_controller>:
8010da80:	55                   	push   %ebp
8010da81:	89 e5                	mov    %esp,%ebp
8010da83:	53                   	push   %ebx
8010da84:	83 ec 10             	sub    $0x10,%esp
8010da87:	68 20 c4 13 80       	push   $0x8013c420
8010da8c:	e8 9f 87 ff ff       	call   80106230 <acquire>
8010da91:	58                   	pop    %eax
8010da92:	ff 75 08             	pushl  0x8(%ebp)
8010da95:	e8 46 ff ff ff       	call   8010d9e0 <unsafe_disable_set_controller>
8010da9a:	89 c3                	mov    %eax,%ebx
8010da9c:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010daa3:	e8 a8 88 ff ff       	call   80106350 <release>
8010daa8:	89 d8                	mov    %ebx,%eax
8010daaa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010daad:	c9                   	leave  
8010daae:	c3                   	ret    
8010daaf:	90                   	nop

8010dab0 <frz_grp>:
8010dab0:	55                   	push   %ebp
8010dab1:	89 e5                	mov    %esp,%ebp
8010dab3:	8b 55 08             	mov    0x8(%ebp),%edx
8010dab6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010dab9:	85 d2                	test   %edx,%edx
8010dabb:	74 20                	je     8010dadd <frz_grp+0x2d>
8010dabd:	31 c0                	xor    %eax,%eax
8010dabf:	83 f9 01             	cmp    $0x1,%ecx
8010dac2:	76 0c                	jbe    8010dad0 <frz_grp+0x20>
8010dac4:	5d                   	pop    %ebp
8010dac5:	c3                   	ret    
8010dac6:	8d 76 00             	lea    0x0(%esi),%esi
8010dac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010dad0:	89 8a 34 03 00 00    	mov    %ecx,0x334(%edx)
8010dad6:	b8 01 00 00 00       	mov    $0x1,%eax
8010dadb:	5d                   	pop    %ebp
8010dadc:	c3                   	ret    
8010dadd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010dae2:	5d                   	pop    %ebp
8010dae3:	c3                   	ret    
8010dae4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010daea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

8010daf0 <set_max_mem>:
8010daf0:	55                   	push   %ebp
8010daf1:	89 e5                	mov    %esp,%ebp
8010daf3:	8b 55 08             	mov    0x8(%ebp),%edx
8010daf6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010daf9:	85 d2                	test   %edx,%edx
8010dafb:	74 1f                	je     8010db1c <set_max_mem+0x2c>
8010dafd:	31 c0                	xor    %eax,%eax
8010daff:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
8010db05:	77 13                	ja     8010db1a <set_max_mem+0x2a>
8010db07:	3b 8a 54 03 00 00    	cmp    0x354(%edx),%ecx
8010db0d:	72 0b                	jb     8010db1a <set_max_mem+0x2a>
8010db0f:	89 8a 50 03 00 00    	mov    %ecx,0x350(%edx)
8010db15:	b8 01 00 00 00       	mov    $0x1,%eax
8010db1a:	5d                   	pop    %ebp
8010db1b:	c3                   	ret    
8010db1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010db21:	5d                   	pop    %ebp
8010db22:	c3                   	ret    
8010db23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010db29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010db30 <set_protect_mem>:
8010db30:	55                   	push   %ebp
8010db31:	89 e5                	mov    %esp,%ebp
8010db33:	57                   	push   %edi
8010db34:	56                   	push   %esi
8010db35:	53                   	push   %ebx
8010db36:	83 ec 0c             	sub    $0xc,%esp
8010db39:	8b 75 08             	mov    0x8(%ebp),%esi
8010db3c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010db3f:	2b 9e 3c 03 00 00    	sub    0x33c(%esi),%ebx
8010db45:	85 db                	test   %ebx,%ebx
8010db47:	7e 2f                	jle    8010db78 <set_protect_mem+0x48>
8010db49:	89 d8                	mov    %ebx,%eax
8010db4b:	2b 86 58 03 00 00    	sub    0x358(%esi),%eax
8010db51:	83 ec 0c             	sub    $0xc,%esp
8010db54:	50                   	push   %eax
8010db55:	e8 c6 53 ff ff       	call   80102f20 <increse_protect_counter>
8010db5a:	83 c4 10             	add    $0x10,%esp
8010db5d:	85 c0                	test   %eax,%eax
8010db5f:	89 c7                	mov    %eax,%edi
8010db61:	75 45                	jne    8010dba8 <set_protect_mem+0x78>
8010db63:	89 9e 58 03 00 00    	mov    %ebx,0x358(%esi)
8010db69:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010db6c:	89 f8                	mov    %edi,%eax
8010db6e:	5b                   	pop    %ebx
8010db6f:	5e                   	pop    %esi
8010db70:	5f                   	pop    %edi
8010db71:	5d                   	pop    %ebp
8010db72:	c3                   	ret    
8010db73:	90                   	nop
8010db74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010db78:	8b 86 58 03 00 00    	mov    0x358(%esi),%eax
8010db7e:	31 ff                	xor    %edi,%edi
8010db80:	85 c0                	test   %eax,%eax
8010db82:	74 e5                	je     8010db69 <set_protect_mem+0x39>
8010db84:	83 ec 0c             	sub    $0xc,%esp
8010db87:	50                   	push   %eax
8010db88:	e8 33 53 ff ff       	call   80102ec0 <decrese_protect_counter>
8010db8d:	c7 86 58 03 00 00 00 	movl   $0x0,0x358(%esi)
8010db94:	00 00 00 
8010db97:	83 c4 10             	add    $0x10,%esp
8010db9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010db9d:	89 f8                	mov    %edi,%eax
8010db9f:	5b                   	pop    %ebx
8010dba0:	5e                   	pop    %esi
8010dba1:	5f                   	pop    %edi
8010dba2:	5d                   	pop    %ebp
8010dba3:	c3                   	ret    
8010dba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010dba8:	bf ff ff ff ff       	mov    $0xffffffff,%edi
8010dbad:	eb ba                	jmp    8010db69 <set_protect_mem+0x39>
8010dbaf:	90                   	nop

8010dbb0 <set_min_mem.part.10>:
8010dbb0:	55                   	push   %ebp
8010dbb1:	89 e5                	mov    %esp,%ebp
8010dbb3:	56                   	push   %esi
8010dbb4:	53                   	push   %ebx
8010dbb5:	89 c3                	mov    %eax,%ebx
8010dbb7:	8d 82 ff 0f 00 00    	lea    0xfff(%edx),%eax
8010dbbd:	89 d6                	mov    %edx,%esi
8010dbbf:	83 ec 08             	sub    $0x8,%esp
8010dbc2:	c1 e8 0c             	shr    $0xc,%eax
8010dbc5:	50                   	push   %eax
8010dbc6:	53                   	push   %ebx
8010dbc7:	e8 64 ff ff ff       	call   8010db30 <set_protect_mem>
8010dbcc:	83 c4 10             	add    $0x10,%esp
8010dbcf:	85 c0                	test   %eax,%eax
8010dbd1:	75 15                	jne    8010dbe8 <set_min_mem.part.10+0x38>
8010dbd3:	89 b3 54 03 00 00    	mov    %esi,0x354(%ebx)
8010dbd9:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010dbdc:	b8 01 00 00 00       	mov    $0x1,%eax
8010dbe1:	5b                   	pop    %ebx
8010dbe2:	5e                   	pop    %esi
8010dbe3:	5d                   	pop    %ebp
8010dbe4:	c3                   	ret    
8010dbe5:	8d 76 00             	lea    0x0(%esi),%esi
8010dbe8:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010dbeb:	31 c0                	xor    %eax,%eax
8010dbed:	5b                   	pop    %ebx
8010dbee:	5e                   	pop    %esi
8010dbef:	5d                   	pop    %ebp
8010dbf0:	c3                   	ret    
8010dbf1:	eb 0d                	jmp    8010dc00 <set_min_mem>
8010dbf3:	90                   	nop
8010dbf4:	90                   	nop
8010dbf5:	90                   	nop
8010dbf6:	90                   	nop
8010dbf7:	90                   	nop
8010dbf8:	90                   	nop
8010dbf9:	90                   	nop
8010dbfa:	90                   	nop
8010dbfb:	90                   	nop
8010dbfc:	90                   	nop
8010dbfd:	90                   	nop
8010dbfe:	90                   	nop
8010dbff:	90                   	nop

8010dc00 <set_min_mem>:
8010dc00:	55                   	push   %ebp
8010dc01:	89 e5                	mov    %esp,%ebp
8010dc03:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010dc06:	8b 55 0c             	mov    0xc(%ebp),%edx
8010dc09:	85 c9                	test   %ecx,%ecx
8010dc0b:	74 20                	je     8010dc2d <set_min_mem+0x2d>
8010dc0d:	31 c0                	xor    %eax,%eax
8010dc0f:	81 fa 00 00 00 80    	cmp    $0x80000000,%edx
8010dc15:	77 08                	ja     8010dc1f <set_min_mem+0x1f>
8010dc17:	3b 91 50 03 00 00    	cmp    0x350(%ecx),%edx
8010dc1d:	76 09                	jbe    8010dc28 <set_min_mem+0x28>
8010dc1f:	5d                   	pop    %ebp
8010dc20:	c3                   	ret    
8010dc21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010dc28:	5d                   	pop    %ebp
8010dc29:	89 c8                	mov    %ecx,%eax
8010dc2b:	eb 83                	jmp    8010dbb0 <set_min_mem.part.10>
8010dc2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010dc32:	5d                   	pop    %ebp
8010dc33:	c3                   	ret    
8010dc34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010dc3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

8010dc40 <cgroup_delete>:
8010dc40:	55                   	push   %ebp
8010dc41:	89 e5                	mov    %esp,%ebp
8010dc43:	56                   	push   %esi
8010dc44:	53                   	push   %ebx
8010dc45:	8b 75 0c             	mov    0xc(%ebp),%esi
8010dc48:	83 ec 0c             	sub    $0xc,%esp
8010dc4b:	68 20 c4 13 80       	push   $0x8013c420
8010dc50:	e8 db 85 ff ff       	call   80106230 <acquire>
8010dc55:	8b 45 08             	mov    0x8(%ebp),%eax
8010dc58:	e8 83 f1 ff ff       	call   8010cde0 <unsafe_get_cgroup_by_path>
8010dc5d:	83 c4 10             	add    $0x10,%esp
8010dc60:	85 c0                	test   %eax,%eax
8010dc62:	0f 84 ec 00 00 00    	je     8010dd54 <cgroup_delete+0x114>
8010dc68:	83 ec 08             	sub    $0x8,%esp
8010dc6b:	89 c3                	mov    %eax,%ebx
8010dc6d:	68 91 f1 10 80       	push   $0x8010f191
8010dc72:	56                   	push   %esi
8010dc73:	e8 c8 88 ff ff       	call   80106540 <strcmp>
8010dc78:	83 c4 10             	add    $0x10,%esp
8010dc7b:	81 fb 54 c4 13 80    	cmp    $0x8013c454,%ebx
8010dc81:	74 08                	je     8010dc8b <cgroup_delete+0x4b>
8010dc83:	85 c0                	test   %eax,%eax
8010dc85:	0f 84 ad 00 00 00    	je     8010dd38 <cgroup_delete+0xf8>
8010dc8b:	83 ec 08             	sub    $0x8,%esp
8010dc8e:	68 0f f1 10 80       	push   $0x8010f10f
8010dc93:	56                   	push   %esi
8010dc94:	e8 a7 88 ff ff       	call   80106540 <strcmp>
8010dc99:	83 c4 10             	add    $0x10,%esp
8010dc9c:	81 fb 54 c4 13 80    	cmp    $0x8013c454,%ebx
8010dca2:	75 08                	jne    8010dcac <cgroup_delete+0x6c>
8010dca4:	85 c0                	test   %eax,%eax
8010dca6:	0f 84 8c 00 00 00    	je     8010dd38 <cgroup_delete+0xf8>
8010dcac:	8b 93 24 03 00 00    	mov    0x324(%ebx),%edx
8010dcb2:	85 d2                	test   %edx,%edx
8010dcb4:	0f 85 7e 00 00 00    	jne    8010dd38 <cgroup_delete+0xf8>
8010dcba:	8b 83 04 03 00 00    	mov    0x304(%ebx),%eax
8010dcc0:	85 c0                	test   %eax,%eax
8010dcc2:	74 54                	je     8010dd18 <cgroup_delete+0xd8>
8010dcc4:	81 fb 54 c4 13 80    	cmp    $0x8013c454,%ebx
8010dcca:	75 6c                	jne    8010dd38 <cgroup_delete+0xf8>
8010dccc:	8b 83 08 03 00 00    	mov    0x308(%ebx),%eax
8010dcd2:	c6 03 00             	movb   $0x0,(%ebx)
8010dcd5:	8b 93 00 02 00 00    	mov    0x200(%ebx),%edx
8010dcdb:	85 c0                	test   %eax,%eax
8010dcdd:	74 1d                	je     8010dcfc <cgroup_delete+0xbc>
8010dcdf:	90                   	nop
8010dce0:	83 a8 24 03 00 00 01 	subl   $0x1,0x324(%eax)
8010dce7:	85 d2                	test   %edx,%edx
8010dce9:	7e 07                	jle    8010dcf2 <cgroup_delete+0xb2>
8010dceb:	83 80 28 03 00 00 01 	addl   $0x1,0x328(%eax)
8010dcf2:	8b 80 08 03 00 00    	mov    0x308(%eax),%eax
8010dcf8:	85 c0                	test   %eax,%eax
8010dcfa:	75 e4                	jne    8010dce0 <cgroup_delete+0xa0>
8010dcfc:	83 ec 0c             	sub    $0xc,%esp
8010dcff:	68 20 c4 13 80       	push   $0x8013c420
8010dd04:	e8 47 86 ff ff       	call   80106350 <release>
8010dd09:	83 c4 10             	add    $0x10,%esp
8010dd0c:	31 c0                	xor    %eax,%eax
8010dd0e:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010dd11:	5b                   	pop    %ebx
8010dd12:	5e                   	pop    %esi
8010dd13:	5d                   	pop    %ebp
8010dd14:	c3                   	ret    
8010dd15:	8d 76 00             	lea    0x0(%esi),%esi
8010dd18:	81 fb 54 c4 13 80    	cmp    $0x8013c454,%ebx
8010dd1e:	74 ac                	je     8010dccc <cgroup_delete+0x8c>
8010dd20:	80 bb 13 03 00 00 00 	cmpb   $0x0,0x313(%ebx)
8010dd27:	74 a3                	je     8010dccc <cgroup_delete+0x8c>
8010dd29:	31 d2                	xor    %edx,%edx
8010dd2b:	89 d8                	mov    %ebx,%eax
8010dd2d:	e8 7e fe ff ff       	call   8010dbb0 <set_min_mem.part.10>
8010dd32:	eb 98                	jmp    8010dccc <cgroup_delete+0x8c>
8010dd34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010dd38:	83 ec 0c             	sub    $0xc,%esp
8010dd3b:	68 20 c4 13 80       	push   $0x8013c420
8010dd40:	e8 0b 86 ff ff       	call   80106350 <release>
8010dd45:	83 c4 10             	add    $0x10,%esp
8010dd48:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010dd4b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
8010dd50:	5b                   	pop    %ebx
8010dd51:	5e                   	pop    %esi
8010dd52:	5d                   	pop    %ebp
8010dd53:	c3                   	ret    
8010dd54:	83 ec 0c             	sub    $0xc,%esp
8010dd57:	68 20 c4 13 80       	push   $0x8013c420
8010dd5c:	e8 ef 85 ff ff       	call   80106350 <release>
8010dd61:	83 c4 10             	add    $0x10,%esp
8010dd64:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010dd69:	eb a3                	jmp    8010dd0e <cgroup_delete+0xce>
8010dd6b:	90                   	nop
8010dd6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

8010dd70 <cgroup_initialize>:
8010dd70:	55                   	push   %ebp
8010dd71:	89 e5                	mov    %esp,%ebp
8010dd73:	53                   	push   %ebx
8010dd74:	83 ec 04             	sub    $0x4,%esp
8010dd77:	8b 45 10             	mov    0x10(%ebp),%eax
8010dd7a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010dd7d:	85 c0                	test   %eax,%eax
8010dd7f:	0f 84 cb 01 00 00    	je     8010df50 <cgroup_initialize+0x1e0>
8010dd85:	89 83 08 03 00 00    	mov    %eax,0x308(%ebx)
8010dd8b:	80 b8 0d 03 00 00 00 	cmpb   $0x0,0x30d(%eax)
8010dd92:	0f 95 83 0c 03 00 00 	setne  0x30c(%ebx)
8010dd99:	80 b8 0f 03 00 00 00 	cmpb   $0x0,0x30f(%eax)
8010dda0:	0f 95 83 0e 03 00 00 	setne  0x30e(%ebx)
8010dda7:	3d 54 c4 13 80       	cmp    $0x8013c454,%eax
8010ddac:	74 0d                	je     8010ddbb <cgroup_initialize+0x4b>
8010ddae:	80 b8 11 03 00 00 00 	cmpb   $0x0,0x311(%eax)
8010ddb5:	0f 84 85 01 00 00    	je     8010df40 <cgroup_initialize+0x1d0>
8010ddbb:	c6 83 10 03 00 00 01 	movb   $0x1,0x310(%ebx)
8010ddc2:	80 b8 13 03 00 00 00 	cmpb   $0x0,0x313(%eax)
8010ddc9:	c6 83 0f 03 00 00 00 	movb   $0x0,0x30f(%ebx)
8010ddd0:	c6 83 0d 03 00 00 00 	movb   $0x0,0x30d(%ebx)
8010ddd7:	c6 83 11 03 00 00 00 	movb   $0x0,0x311(%ebx)
8010ddde:	c6 83 13 03 00 00 00 	movb   $0x0,0x313(%ebx)
8010dde5:	8b 55 0c             	mov    0xc(%ebp),%edx
8010dde8:	0f 95 83 12 03 00 00 	setne  0x312(%ebx)
8010ddef:	8b 80 20 03 00 00    	mov    0x320(%eax),%eax
8010ddf5:	83 c0 01             	add    $0x1,%eax
8010ddf8:	89 83 20 03 00 00    	mov    %eax,0x320(%ebx)
8010ddfe:	89 d8                	mov    %ebx,%eax
8010de00:	e8 4b f0 ff ff       	call   8010ce50 <unsafe_set_cgroup_dir_path>
8010de05:	81 bb 54 03 00 00 00 	cmpl   $0x80000000,0x354(%ebx)
8010de0c:	00 00 80 
8010de0f:	c7 83 00 02 00 00 00 	movl   $0x0,0x200(%ebx)
8010de16:	00 00 00 
8010de19:	c7 83 04 03 00 00 00 	movl   $0x0,0x304(%ebx)
8010de20:	00 00 00 
8010de23:	c6 83 14 03 00 00 00 	movb   $0x0,0x314(%ebx)
8010de2a:	c7 83 38 03 00 00 00 	movl   $0x0,0x338(%ebx)
8010de31:	00 00 00 
8010de34:	c7 83 18 03 00 00 40 	movl   $0x40,0x318(%ebx)
8010de3b:	00 00 00 
8010de3e:	c7 83 1c 03 00 00 40 	movl   $0x40,0x31c(%ebx)
8010de45:	00 00 00 
8010de48:	c7 83 24 03 00 00 00 	movl   $0x0,0x324(%ebx)
8010de4f:	00 00 00 
8010de52:	c7 83 28 03 00 00 00 	movl   $0x0,0x328(%ebx)
8010de59:	00 00 00 
8010de5c:	c7 83 2c 03 00 00 40 	movl   $0x40,0x32c(%ebx)
8010de63:	00 00 00 
8010de66:	c6 83 30 03 00 00 00 	movb   $0x0,0x330(%ebx)
8010de6d:	c7 83 34 03 00 00 00 	movl   $0x0,0x334(%ebx)
8010de74:	00 00 00 
8010de77:	c7 83 40 03 00 00 00 	movl   $0x0,0x340(%ebx)
8010de7e:	00 00 00 
8010de81:	c7 83 44 03 00 00 00 	movl   $0x0,0x344(%ebx)
8010de88:	00 00 00 
8010de8b:	c7 83 48 03 00 00 00 	movl   $0x0,0x348(%ebx)
8010de92:	00 00 00 
8010de95:	c7 83 4c 03 00 00 00 	movl   $0x0,0x34c(%ebx)
8010de9c:	00 00 00 
8010de9f:	77 0a                	ja     8010deab <cgroup_initialize+0x13b>
8010dea1:	c7 83 50 03 00 00 00 	movl   $0x80000000,0x350(%ebx)
8010dea8:	00 00 80 
8010deab:	89 d8                	mov    %ebx,%eax
8010dead:	31 d2                	xor    %edx,%edx
8010deaf:	e8 fc fc ff ff       	call   8010dbb0 <set_min_mem.part.10>
8010deb4:	c7 83 3c 03 00 00 00 	movl   $0x0,0x33c(%ebx)
8010debb:	00 00 00 
8010debe:	c7 83 58 03 00 00 00 	movl   $0x0,0x358(%ebx)
8010dec5:	00 00 00 
8010dec8:	c7 83 74 03 00 00 00 	movl   $0x0,0x374(%ebx)
8010decf:	00 00 00 
8010ded2:	c7 83 68 03 00 00 00 	movl   $0x0,0x368(%ebx)
8010ded9:	00 00 00 
8010dedc:	c7 83 5c 03 00 00 00 	movl   $0x0,0x35c(%ebx)
8010dee3:	00 00 00 
8010dee6:	c7 83 60 03 00 00 00 	movl   $0x0,0x360(%ebx)
8010deed:	00 00 00 
8010def0:	c7 83 64 03 00 00 00 	movl   $0x0,0x364(%ebx)
8010def7:	00 00 00 
8010defa:	c7 83 70 03 00 00 ff 	movl   $0xffffffff,0x370(%ebx)
8010df01:	ff ff ff 
8010df04:	c7 83 6c 03 00 00 a0 	movl   $0x186a0,0x36c(%ebx)
8010df0b:	86 01 00 
8010df0e:	c7 83 78 03 00 00 00 	movl   $0x0,0x378(%ebx)
8010df15:	00 00 00 
8010df18:	c7 83 7c 03 00 00 00 	movl   $0x0,0x37c(%ebx)
8010df1f:	00 00 00 
8010df22:	c7 83 80 03 00 00 00 	movl   $0x0,0x380(%ebx)
8010df29:	00 00 00 
8010df2c:	c6 83 84 03 00 00 00 	movb   $0x0,0x384(%ebx)
8010df33:	83 c4 04             	add    $0x4,%esp
8010df36:	5b                   	pop    %ebx
8010df37:	5d                   	pop    %ebp
8010df38:	c3                   	ret    
8010df39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010df40:	c6 83 10 03 00 00 00 	movb   $0x0,0x310(%ebx)
8010df47:	e9 76 fe ff ff       	jmp    8010ddc2 <cgroup_initialize+0x52>
8010df4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010df50:	c6 83 0c 03 00 00 01 	movb   $0x1,0x30c(%ebx)
8010df57:	c6 83 0d 03 00 00 01 	movb   $0x1,0x30d(%ebx)
8010df5e:	c7 83 20 03 00 00 00 	movl   $0x0,0x320(%ebx)
8010df65:	00 00 00 
8010df68:	c6 03 00             	movb   $0x0,(%ebx)
8010df6b:	c7 83 08 03 00 00 00 	movl   $0x0,0x308(%ebx)
8010df72:	00 00 00 
8010df75:	c6 83 0e 03 00 00 01 	movb   $0x1,0x30e(%ebx)
8010df7c:	c6 83 0f 03 00 00 01 	movb   $0x1,0x30f(%ebx)
8010df83:	c6 83 10 03 00 00 01 	movb   $0x1,0x310(%ebx)
8010df8a:	c6 83 11 03 00 00 00 	movb   $0x0,0x311(%ebx)
8010df91:	c6 83 12 03 00 00 01 	movb   $0x1,0x312(%ebx)
8010df98:	c6 83 13 03 00 00 01 	movb   $0x1,0x313(%ebx)
8010df9f:	e9 61 fe ff ff       	jmp    8010de05 <cgroup_initialize+0x95>
8010dfa4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010dfaa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

8010dfb0 <cgroup_create>:
8010dfb0:	55                   	push   %ebp
8010dfb1:	89 e5                	mov    %esp,%ebp
8010dfb3:	57                   	push   %edi
8010dfb4:	56                   	push   %esi
8010dfb5:	53                   	push   %ebx
8010dfb6:	8d 9d e8 f9 ff ff    	lea    -0x618(%ebp),%ebx
8010dfbc:	8d b5 e8 fb ff ff    	lea    -0x418(%ebp),%esi
8010dfc2:	81 ec 14 06 00 00    	sub    $0x614,%esp
8010dfc8:	ff 75 08             	pushl  0x8(%ebp)
8010dfcb:	53                   	push   %ebx
8010dfcc:	e8 af ec ff ff       	call   8010cc80 <format_path>
8010dfd1:	5a                   	pop    %edx
8010dfd2:	59                   	pop    %ecx
8010dfd3:	56                   	push   %esi
8010dfd4:	53                   	push   %ebx
8010dfd5:	e8 86 e8 ff ff       	call   8010c860 <get_dir_name>
8010dfda:	83 c4 10             	add    $0x10,%esp
8010dfdd:	85 c0                	test   %eax,%eax
8010dfdf:	0f 88 14 01 00 00    	js     8010e0f9 <cgroup_create+0x149>
8010dfe5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
8010dfeb:	83 ec 08             	sub    $0x8,%esp
8010dfee:	50                   	push   %eax
8010dfef:	53                   	push   %ebx
8010dff0:	e8 cb e7 ff ff       	call   8010c7c0 <get_base_name>
8010dff5:	83 c4 10             	add    $0x10,%esp
8010dff8:	85 c0                	test   %eax,%eax
8010dffa:	0f 88 f9 00 00 00    	js     8010e0f9 <cgroup_create+0x149>
8010e000:	83 ec 0c             	sub    $0xc,%esp
8010e003:	68 20 c4 13 80       	push   $0x8013c420
8010e008:	e8 23 82 ff ff       	call   80106230 <acquire>
8010e00d:	89 f0                	mov    %esi,%eax
8010e00f:	e8 cc ed ff ff       	call   8010cde0 <unsafe_get_cgroup_by_path>
8010e014:	83 c4 10             	add    $0x10,%esp
8010e017:	85 c0                	test   %eax,%eax
8010e019:	89 c6                	mov    %eax,%esi
8010e01b:	0f 84 c8 00 00 00    	je     8010e0e9 <cgroup_create+0x139>
8010e021:	89 c2                	mov    %eax,%edx
8010e023:	31 c9                	xor    %ecx,%ecx
8010e025:	8d 76 00             	lea    0x0(%esi),%esi
8010e028:	39 8a 1c 03 00 00    	cmp    %ecx,0x31c(%edx)
8010e02e:	0f 86 cf 00 00 00    	jbe    8010e103 <cgroup_create+0x153>
8010e034:	8b 82 24 03 00 00    	mov    0x324(%edx),%eax
8010e03a:	39 82 18 03 00 00    	cmp    %eax,0x318(%edx)
8010e040:	0f 84 d6 00 00 00    	je     8010e11c <cgroup_create+0x16c>
8010e046:	8b 92 08 03 00 00    	mov    0x308(%edx),%edx
8010e04c:	83 c1 01             	add    $0x1,%ecx
8010e04f:	85 d2                	test   %edx,%edx
8010e051:	75 d5                	jne    8010e028 <cgroup_create+0x78>
8010e053:	ba dc c7 13 80       	mov    $0x8013c7dc,%edx
8010e058:	b9 01 00 00 00       	mov    $0x1,%ecx
8010e05d:	eb 0f                	jmp    8010e06e <cgroup_create+0xbe>
8010e05f:	90                   	nop
8010e060:	83 c1 01             	add    $0x1,%ecx
8010e063:	81 c2 88 03 00 00    	add    $0x388,%edx
8010e069:	83 f9 40             	cmp    $0x40,%ecx
8010e06c:	74 62                	je     8010e0d0 <cgroup_create+0x120>
8010e06e:	80 3a 00             	cmpb   $0x0,(%edx)
8010e071:	75 ed                	jne    8010e060 <cgroup_create+0xb0>
8010e073:	8b 82 00 02 00 00    	mov    0x200(%edx),%eax
8010e079:	85 c0                	test   %eax,%eax
8010e07b:	75 e3                	jne    8010e060 <cgroup_create+0xb0>
8010e07d:	69 c9 88 03 00 00    	imul   $0x388,%ecx,%ecx
8010e083:	83 ec 04             	sub    $0x4,%esp
8010e086:	56                   	push   %esi
8010e087:	53                   	push   %ebx
8010e088:	8d b9 54 c4 13 80    	lea    -0x7fec3bac(%ecx),%edi
8010e08e:	57                   	push   %edi
8010e08f:	e8 dc fc ff ff       	call   8010dd70 <cgroup_initialize>
8010e094:	83 c4 10             	add    $0x10,%esp
8010e097:	89 f6                	mov    %esi,%esi
8010e099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010e0a0:	83 86 24 03 00 00 01 	addl   $0x1,0x324(%esi)
8010e0a7:	8b b6 08 03 00 00    	mov    0x308(%esi),%esi
8010e0ad:	85 f6                	test   %esi,%esi
8010e0af:	75 ef                	jne    8010e0a0 <cgroup_create+0xf0>
8010e0b1:	83 ec 0c             	sub    $0xc,%esp
8010e0b4:	68 20 c4 13 80       	push   $0x8013c420
8010e0b9:	e8 92 82 ff ff       	call   80106350 <release>
8010e0be:	83 c4 10             	add    $0x10,%esp
8010e0c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010e0c4:	89 f8                	mov    %edi,%eax
8010e0c6:	5b                   	pop    %ebx
8010e0c7:	5e                   	pop    %esi
8010e0c8:	5f                   	pop    %edi
8010e0c9:	5d                   	pop    %ebp
8010e0ca:	c3                   	ret    
8010e0cb:	90                   	nop
8010e0cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e0d0:	83 ec 0c             	sub    $0xc,%esp
8010e0d3:	68 20 c4 13 80       	push   $0x8013c420
8010e0d8:	e8 73 82 ff ff       	call   80106350 <release>
8010e0dd:	c7 04 24 88 f7 10 80 	movl   $0x8010f788,(%esp)
8010e0e4:	e8 e7 22 ff ff       	call   801003d0 <panic>
8010e0e9:	83 ec 0c             	sub    $0xc,%esp
8010e0ec:	68 20 c4 13 80       	push   $0x8013c420
8010e0f1:	e8 5a 82 ff ff       	call   80106350 <release>
8010e0f6:	83 c4 10             	add    $0x10,%esp
8010e0f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010e0fc:	31 c0                	xor    %eax,%eax
8010e0fe:	5b                   	pop    %ebx
8010e0ff:	5e                   	pop    %esi
8010e100:	5f                   	pop    %edi
8010e101:	5d                   	pop    %ebp
8010e102:	c3                   	ret    
8010e103:	83 ec 0c             	sub    $0xc,%esp
8010e106:	68 20 c4 13 80       	push   $0x8013c420
8010e10b:	e8 40 82 ff ff       	call   80106350 <release>
8010e110:	c7 04 24 20 f7 10 80 	movl   $0x8010f720,(%esp)
8010e117:	e8 b4 22 ff ff       	call   801003d0 <panic>
8010e11c:	83 ec 0c             	sub    $0xc,%esp
8010e11f:	68 20 c4 13 80       	push   $0x8013c420
8010e124:	e8 27 82 ff ff       	call   80106350 <release>
8010e129:	c7 04 24 4c f7 10 80 	movl   $0x8010f74c,(%esp)
8010e130:	e8 9b 22 ff ff       	call   801003d0 <panic>
8010e135:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010e140 <unsafe_enable_mem_controller>:
8010e140:	55                   	push   %ebp
8010e141:	89 e5                	mov    %esp,%ebp
8010e143:	53                   	push   %ebx
8010e144:	83 ec 04             	sub    $0x4,%esp
8010e147:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010e14a:	85 db                	test   %ebx,%ebx
8010e14c:	74 79                	je     8010e1c7 <unsafe_enable_mem_controller+0x87>
8010e14e:	80 bb 14 03 00 00 01 	cmpb   $0x1,0x314(%ebx)
8010e155:	74 70                	je     8010e1c7 <unsafe_enable_mem_controller+0x87>
8010e157:	80 bb 13 03 00 00 00 	cmpb   $0x0,0x313(%ebx)
8010e15e:	75 60                	jne    8010e1c0 <unsafe_enable_mem_controller+0x80>
8010e160:	8b 83 54 03 00 00    	mov    0x354(%ebx),%eax
8010e166:	05 ff 0f 00 00       	add    $0xfff,%eax
8010e16b:	c1 e8 0c             	shr    $0xc,%eax
8010e16e:	2b 83 3c 03 00 00    	sub    0x33c(%ebx),%eax
8010e174:	85 c0                	test   %eax,%eax
8010e176:	7e 10                	jle    8010e188 <unsafe_enable_mem_controller+0x48>
8010e178:	83 ec 0c             	sub    $0xc,%esp
8010e17b:	50                   	push   %eax
8010e17c:	e8 9f 4d ff ff       	call   80102f20 <increse_protect_counter>
8010e181:	83 c4 10             	add    $0x10,%esp
8010e184:	85 c0                	test   %eax,%eax
8010e186:	75 3f                	jne    8010e1c7 <unsafe_enable_mem_controller+0x87>
8010e188:	80 bb 12 03 00 00 00 	cmpb   $0x0,0x312(%ebx)
8010e18f:	74 2f                	je     8010e1c0 <unsafe_enable_mem_controller+0x80>
8010e191:	c6 83 13 03 00 00 01 	movb   $0x1,0x313(%ebx)
8010e198:	b8 e4 ca 13 80       	mov    $0x8013cae4,%eax
8010e19d:	eb 0d                	jmp    8010e1ac <unsafe_enable_mem_controller+0x6c>
8010e19f:	90                   	nop
8010e1a0:	05 88 03 00 00       	add    $0x388,%eax
8010e1a5:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010e1aa:	74 14                	je     8010e1c0 <unsafe_enable_mem_controller+0x80>
8010e1ac:	3b 18                	cmp    (%eax),%ebx
8010e1ae:	75 f0                	jne    8010e1a0 <unsafe_enable_mem_controller+0x60>
8010e1b0:	c6 40 0a 01          	movb   $0x1,0xa(%eax)
8010e1b4:	05 88 03 00 00       	add    $0x388,%eax
8010e1b9:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010e1be:	75 ec                	jne    8010e1ac <unsafe_enable_mem_controller+0x6c>
8010e1c0:	31 c0                	xor    %eax,%eax
8010e1c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010e1c5:	c9                   	leave  
8010e1c6:	c3                   	ret    
8010e1c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010e1cc:	eb f4                	jmp    8010e1c2 <unsafe_enable_mem_controller+0x82>
8010e1ce:	66 90                	xchg   %ax,%ax

8010e1d0 <unsafe_disable_mem_controller>:
8010e1d0:	55                   	push   %ebp
8010e1d1:	89 e5                	mov    %esp,%ebp
8010e1d3:	56                   	push   %esi
8010e1d4:	53                   	push   %ebx
8010e1d5:	8b 75 08             	mov    0x8(%ebp),%esi
8010e1d8:	85 f6                	test   %esi,%esi
8010e1da:	74 2a                	je     8010e206 <unsafe_disable_mem_controller+0x36>
8010e1dc:	80 be 13 03 00 00 00 	cmpb   $0x0,0x313(%esi)
8010e1e3:	bb e4 ca 13 80       	mov    $0x8013cae4,%ebx
8010e1e8:	89 d8                	mov    %ebx,%eax
8010e1ea:	75 10                	jne    8010e1fc <unsafe_disable_mem_controller+0x2c>
8010e1ec:	eb 22                	jmp    8010e210 <unsafe_disable_mem_controller+0x40>
8010e1ee:	66 90                	xchg   %ax,%ax
8010e1f0:	05 88 03 00 00       	add    $0x388,%eax
8010e1f5:	3d 5c a9 14 80       	cmp    $0x8014a95c,%eax
8010e1fa:	74 24                	je     8010e220 <unsafe_disable_mem_controller+0x50>
8010e1fc:	3b 30                	cmp    (%eax),%esi
8010e1fe:	75 f0                	jne    8010e1f0 <unsafe_disable_mem_controller+0x20>
8010e200:	80 78 0b 00          	cmpb   $0x0,0xb(%eax)
8010e204:	74 ea                	je     8010e1f0 <unsafe_disable_mem_controller+0x20>
8010e206:	5b                   	pop    %ebx
8010e207:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010e20c:	5e                   	pop    %esi
8010e20d:	5d                   	pop    %ebp
8010e20e:	c3                   	ret    
8010e20f:	90                   	nop
8010e210:	5b                   	pop    %ebx
8010e211:	31 c0                	xor    %eax,%eax
8010e213:	5e                   	pop    %esi
8010e214:	5d                   	pop    %ebp
8010e215:	c3                   	ret    
8010e216:	8d 76 00             	lea    0x0(%esi),%esi
8010e219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010e220:	31 d2                	xor    %edx,%edx
8010e222:	c6 86 13 03 00 00 00 	movb   $0x0,0x313(%esi)
8010e229:	89 f0                	mov    %esi,%eax
8010e22b:	e8 80 f9 ff ff       	call   8010dbb0 <set_min_mem.part.10>
8010e230:	81 be 54 03 00 00 00 	cmpl   $0x80000000,0x354(%esi)
8010e237:	00 00 80 
8010e23a:	77 22                	ja     8010e25e <unsafe_disable_mem_controller+0x8e>
8010e23c:	c7 86 50 03 00 00 00 	movl   $0x80000000,0x350(%esi)
8010e243:	00 00 80 
8010e246:	3b 33                	cmp    (%ebx),%esi
8010e248:	74 18                	je     8010e262 <unsafe_disable_mem_controller+0x92>
8010e24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010e250:	81 c3 88 03 00 00    	add    $0x388,%ebx
8010e256:	81 fb 5c a9 14 80    	cmp    $0x8014a95c,%ebx
8010e25c:	74 b2                	je     8010e210 <unsafe_disable_mem_controller+0x40>
8010e25e:	3b 33                	cmp    (%ebx),%esi
8010e260:	75 ee                	jne    8010e250 <unsafe_disable_mem_controller+0x80>
8010e262:	c6 43 0a 00          	movb   $0x0,0xa(%ebx)
8010e266:	eb e8                	jmp    8010e250 <unsafe_disable_mem_controller+0x80>
8010e268:	90                   	nop
8010e269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010e270 <enable_mem_controller>:
8010e270:	55                   	push   %ebp
8010e271:	89 e5                	mov    %esp,%ebp
8010e273:	53                   	push   %ebx
8010e274:	83 ec 10             	sub    $0x10,%esp
8010e277:	68 20 c4 13 80       	push   $0x8013c420
8010e27c:	e8 af 7f ff ff       	call   80106230 <acquire>
8010e281:	58                   	pop    %eax
8010e282:	ff 75 08             	pushl  0x8(%ebp)
8010e285:	e8 b6 fe ff ff       	call   8010e140 <unsafe_enable_mem_controller>
8010e28a:	89 c3                	mov    %eax,%ebx
8010e28c:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010e293:	e8 b8 80 ff ff       	call   80106350 <release>
8010e298:	89 d8                	mov    %ebx,%eax
8010e29a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010e29d:	c9                   	leave  
8010e29e:	c3                   	ret    
8010e29f:	90                   	nop

8010e2a0 <disable_mem_controller>:
8010e2a0:	55                   	push   %ebp
8010e2a1:	89 e5                	mov    %esp,%ebp
8010e2a3:	53                   	push   %ebx
8010e2a4:	83 ec 10             	sub    $0x10,%esp
8010e2a7:	68 20 c4 13 80       	push   $0x8013c420
8010e2ac:	e8 7f 7f ff ff       	call   80106230 <acquire>
8010e2b1:	58                   	pop    %eax
8010e2b2:	ff 75 08             	pushl  0x8(%ebp)
8010e2b5:	e8 16 ff ff ff       	call   8010e1d0 <unsafe_disable_mem_controller>
8010e2ba:	89 c3                	mov    %eax,%ebx
8010e2bc:	c7 04 24 20 c4 13 80 	movl   $0x8013c420,(%esp)
8010e2c3:	e8 88 80 ff ff       	call   80106350 <release>
8010e2c8:	89 d8                	mov    %ebx,%eax
8010e2ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010e2cd:	c9                   	leave  
8010e2ce:	c3                   	ret    
8010e2cf:	90                   	nop

8010e2d0 <cgroup_mem_stat_file_dirty_incr>:
8010e2d0:	55                   	push   %ebp
8010e2d1:	89 e5                	mov    %esp,%ebp
8010e2d3:	8b 45 08             	mov    0x8(%ebp),%eax
8010e2d6:	85 c0                	test   %eax,%eax
8010e2d8:	74 10                	je     8010e2ea <cgroup_mem_stat_file_dirty_incr+0x1a>
8010e2da:	3d 54 c4 13 80       	cmp    $0x8013c454,%eax
8010e2df:	74 09                	je     8010e2ea <cgroup_mem_stat_file_dirty_incr+0x1a>
8010e2e1:	80 b8 14 03 00 00 01 	cmpb   $0x1,0x314(%eax)
8010e2e8:	74 06                	je     8010e2f0 <cgroup_mem_stat_file_dirty_incr+0x20>
8010e2ea:	5d                   	pop    %ebp
8010e2eb:	c3                   	ret    
8010e2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e2f0:	83 80 40 03 00 00 01 	addl   $0x1,0x340(%eax)
8010e2f7:	5d                   	pop    %ebp
8010e2f8:	c3                   	ret    
8010e2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010e300 <cgroup_mem_stat_file_dirty_decr>:
8010e300:	55                   	push   %ebp
8010e301:	89 e5                	mov    %esp,%ebp
8010e303:	8b 45 08             	mov    0x8(%ebp),%eax
8010e306:	85 c0                	test   %eax,%eax
8010e308:	74 10                	je     8010e31a <cgroup_mem_stat_file_dirty_decr+0x1a>
8010e30a:	3d 54 c4 13 80       	cmp    $0x8013c454,%eax
8010e30f:	74 09                	je     8010e31a <cgroup_mem_stat_file_dirty_decr+0x1a>
8010e311:	80 b8 14 03 00 00 01 	cmpb   $0x1,0x314(%eax)
8010e318:	74 06                	je     8010e320 <cgroup_mem_stat_file_dirty_decr+0x20>
8010e31a:	5d                   	pop    %ebp
8010e31b:	c3                   	ret    
8010e31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e320:	83 a8 40 03 00 00 01 	subl   $0x1,0x340(%eax)
8010e327:	5d                   	pop    %ebp
8010e328:	c3                   	ret    
8010e329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010e330 <cgroup_mem_stat_file_dirty_aggregated_incr>:
8010e330:	55                   	push   %ebp
8010e331:	89 e5                	mov    %esp,%ebp
8010e333:	8b 45 08             	mov    0x8(%ebp),%eax
8010e336:	85 c0                	test   %eax,%eax
8010e338:	74 10                	je     8010e34a <cgroup_mem_stat_file_dirty_aggregated_incr+0x1a>
8010e33a:	3d 54 c4 13 80       	cmp    $0x8013c454,%eax
8010e33f:	74 09                	je     8010e34a <cgroup_mem_stat_file_dirty_aggregated_incr+0x1a>
8010e341:	80 b8 14 03 00 00 01 	cmpb   $0x1,0x314(%eax)
8010e348:	74 06                	je     8010e350 <cgroup_mem_stat_file_dirty_aggregated_incr+0x20>
8010e34a:	5d                   	pop    %ebp
8010e34b:	c3                   	ret    
8010e34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e350:	83 80 44 03 00 00 01 	addl   $0x1,0x344(%eax)
8010e357:	5d                   	pop    %ebp
8010e358:	c3                   	ret    
8010e359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010e360 <cgroup_mem_stat_pgfault_incr>:
8010e360:	55                   	push   %ebp
8010e361:	89 e5                	mov    %esp,%ebp
8010e363:	8b 45 08             	mov    0x8(%ebp),%eax
8010e366:	85 c0                	test   %eax,%eax
8010e368:	74 10                	je     8010e37a <cgroup_mem_stat_pgfault_incr+0x1a>
8010e36a:	3d 54 c4 13 80       	cmp    $0x8013c454,%eax
8010e36f:	74 09                	je     8010e37a <cgroup_mem_stat_pgfault_incr+0x1a>
8010e371:	80 b8 14 03 00 00 01 	cmpb   $0x1,0x314(%eax)
8010e378:	74 06                	je     8010e380 <cgroup_mem_stat_pgfault_incr+0x20>
8010e37a:	5d                   	pop    %ebp
8010e37b:	c3                   	ret    
8010e37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e380:	83 80 48 03 00 00 01 	addl   $0x1,0x348(%eax)
8010e387:	5d                   	pop    %ebp
8010e388:	c3                   	ret    
8010e389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

8010e390 <cgroup_mem_stat_pgmajfault_incr>:
8010e390:	55                   	push   %ebp
8010e391:	89 e5                	mov    %esp,%ebp
8010e393:	8b 45 08             	mov    0x8(%ebp),%eax
8010e396:	85 c0                	test   %eax,%eax
8010e398:	74 10                	je     8010e3aa <cgroup_mem_stat_pgmajfault_incr+0x1a>
8010e39a:	3d 54 c4 13 80       	cmp    $0x8013c454,%eax
8010e39f:	74 09                	je     8010e3aa <cgroup_mem_stat_pgmajfault_incr+0x1a>
8010e3a1:	80 b8 14 03 00 00 01 	cmpb   $0x1,0x314(%eax)
8010e3a8:	74 06                	je     8010e3b0 <cgroup_mem_stat_pgmajfault_incr+0x20>
8010e3aa:	5d                   	pop    %ebp
8010e3ab:	c3                   	ret    
8010e3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e3b0:	83 80 4c 03 00 00 01 	addl   $0x1,0x34c(%eax)
8010e3b7:	5d                   	pop    %ebp
8010e3b8:	c3                   	ret    
8010e3b9:	66 90                	xchg   %ax,%ax
8010e3bb:	66 90                	xchg   %ax,%ax
8010e3bd:	66 90                	xchg   %ax,%ax
8010e3bf:	90                   	nop

8010e3c0 <cpu_account_initialize>:
8010e3c0:	55                   	push   %ebp
8010e3c1:	89 e5                	mov    %esp,%ebp
8010e3c3:	8b 45 08             	mov    0x8(%ebp),%eax
8010e3c6:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
8010e3cd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
8010e3d4:	c7 40 04 a0 86 01 00 	movl   $0x186a0,0x4(%eax)
8010e3db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010e3e1:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
8010e3e8:	5d                   	pop    %ebp
8010e3e9:	c3                   	ret    
8010e3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

8010e3f0 <cpu_account_schedule_start>:
8010e3f0:	55                   	push   %ebp
8010e3f1:	89 e5                	mov    %esp,%ebp
8010e3f3:	83 ec 08             	sub    $0x8,%esp
8010e3f6:	e8 45 ba ff ff       	call   80109e40 <steady_clock_now>
8010e3fb:	8b 55 08             	mov    0x8(%ebp),%edx
8010e3fe:	89 02                	mov    %eax,(%edx)
8010e400:	c9                   	leave  
8010e401:	c3                   	ret    
8010e402:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010e409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010e410 <cpu_account_schedule_proc_update>:
8010e410:	55                   	push   %ebp
8010e411:	89 e5                	mov    %esp,%ebp
8010e413:	57                   	push   %edi
8010e414:	56                   	push   %esi
8010e415:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010e418:	53                   	push   %ebx
8010e419:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010e41c:	8b 81 bc 02 00 00    	mov    0x2bc(%ecx),%eax
8010e422:	39 43 08             	cmp    %eax,0x8(%ebx)
8010e425:	76 36                	jbe    8010e45d <cpu_account_schedule_proc_update+0x4d>
8010e427:	8b 73 04             	mov    0x4(%ebx),%esi
8010e42a:	39 b1 b4 02 00 00    	cmp    %esi,0x2b4(%ecx)
8010e430:	89 f7                	mov    %esi,%edi
8010e432:	0f 46 b9 b4 02 00 00 	cmovbe 0x2b4(%ecx),%edi
8010e439:	31 d2                	xor    %edx,%edx
8010e43b:	6b c7 64             	imul   $0x64,%edi,%eax
8010e43e:	f7 f6                	div    %esi
8010e440:	89 81 b8 02 00 00    	mov    %eax,0x2b8(%ecx)
8010e446:	8b 43 08             	mov    0x8(%ebx),%eax
8010e449:	89 81 bc 02 00 00    	mov    %eax,0x2bc(%ecx)
8010e44f:	8b 81 b4 02 00 00    	mov    0x2b4(%ecx),%eax
8010e455:	29 f8                	sub    %edi,%eax
8010e457:	89 81 b4 02 00 00    	mov    %eax,0x2b4(%ecx)
8010e45d:	5b                   	pop    %ebx
8010e45e:	5e                   	pop    %esi
8010e45f:	5f                   	pop    %edi
8010e460:	5d                   	pop    %ebp
8010e461:	c3                   	ret    
8010e462:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010e469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010e470 <cpu_account_schedule_process_decision>:
8010e470:	55                   	push   %ebp
8010e471:	89 e5                	mov    %esp,%ebp
8010e473:	57                   	push   %edi
8010e474:	56                   	push   %esi
8010e475:	53                   	push   %ebx
8010e476:	83 ec 1c             	sub    $0x1c,%esp
8010e479:	8b 45 0c             	mov    0xc(%ebp),%eax
8010e47c:	8b b8 ac 02 00 00    	mov    0x2ac(%eax),%edi
8010e482:	8b 45 08             	mov    0x8(%ebp),%eax
8010e485:	89 78 10             	mov    %edi,0x10(%eax)
8010e488:	e8 b3 e7 ff ff       	call   8010cc40 <cgroup_lock>
8010e48d:	85 ff                	test   %edi,%edi
8010e48f:	0f 84 e7 00 00 00    	je     8010e57c <cpu_account_schedule_process_decision+0x10c>
8010e495:	c6 45 df 01          	movb   $0x1,-0x21(%ebp)
8010e499:	eb 59                	jmp    8010e4f4 <cpu_account_schedule_process_decision+0x84>
8010e49b:	90                   	nop
8010e49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e4a0:	0f b6 9f 0d 03 00 00 	movzbl 0x30d(%edi),%ebx
8010e4a7:	84 db                	test   %bl,%bl
8010e4a9:	0f 84 b0 00 00 00    	je     8010e55f <cpu_account_schedule_process_decision+0xef>
8010e4af:	8b 87 64 03 00 00    	mov    0x364(%edi),%eax
8010e4b5:	3b 87 70 03 00 00    	cmp    0x370(%edi),%eax
8010e4bb:	0f 86 9e 00 00 00    	jbe    8010e55f <cpu_account_schedule_process_decision+0xef>
8010e4c1:	80 bf 84 03 00 00 00 	cmpb   $0x0,0x384(%edi)
8010e4c8:	75 1c                	jne    8010e4e6 <cpu_account_schedule_process_decision+0x76>
8010e4ca:	03 8f 80 03 00 00    	add    0x380(%edi),%ecx
8010e4d0:	83 87 7c 03 00 00 01 	addl   $0x1,0x37c(%edi)
8010e4d7:	c6 87 84 03 00 00 01 	movb   $0x1,0x384(%edi)
8010e4de:	29 c1                	sub    %eax,%ecx
8010e4e0:	89 8f 80 03 00 00    	mov    %ecx,0x380(%edi)
8010e4e6:	8b bf 08 03 00 00    	mov    0x308(%edi),%edi
8010e4ec:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
8010e4f0:	85 ff                	test   %edi,%edi
8010e4f2:	74 75                	je     8010e569 <cpu_account_schedule_process_decision+0xf9>
8010e4f4:	8b 45 08             	mov    0x8(%ebp),%eax
8010e4f7:	8b 8f 6c 03 00 00    	mov    0x36c(%edi),%ecx
8010e4fd:	31 d2                	xor    %edx,%edx
8010e4ff:	8b 00                	mov    (%eax),%eax
8010e501:	f7 f1                	div    %ecx
8010e503:	3b 87 74 03 00 00    	cmp    0x374(%edi),%eax
8010e509:	89 c6                	mov    %eax,%esi
8010e50b:	76 93                	jbe    8010e4a0 <cpu_account_schedule_process_decision+0x30>
8010e50d:	8b 87 64 03 00 00    	mov    0x364(%edi),%eax
8010e513:	0f b6 9f 0d 03 00 00 	movzbl 0x30d(%edi),%ebx
8010e51a:	39 c1                	cmp    %eax,%ecx
8010e51c:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010e51f:	0f 46 c1             	cmovbe %ecx,%eax
8010e522:	84 db                	test   %bl,%bl
8010e524:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010e527:	74 07                	je     8010e530 <cpu_account_schedule_process_decision+0xc0>
8010e529:	83 87 78 03 00 00 01 	addl   $0x1,0x378(%edi)
8010e530:	6b 45 e4 64          	imul   $0x64,-0x1c(%ebp),%eax
8010e534:	31 d2                	xor    %edx,%edx
8010e536:	c6 87 84 03 00 00 00 	movb   $0x0,0x384(%edi)
8010e53d:	89 b7 74 03 00 00    	mov    %esi,0x374(%edi)
8010e543:	f7 f1                	div    %ecx
8010e545:	89 87 68 03 00 00    	mov    %eax,0x368(%edi)
8010e54b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010e54e:	2b 45 e4             	sub    -0x1c(%ebp),%eax
8010e551:	84 db                	test   %bl,%bl
8010e553:	89 87 64 03 00 00    	mov    %eax,0x364(%edi)
8010e559:	0f 85 50 ff ff ff    	jne    8010e4af <cpu_account_schedule_process_decision+0x3f>
8010e55f:	8b bf 08 03 00 00    	mov    0x308(%edi),%edi
8010e565:	85 ff                	test   %edi,%edi
8010e567:	75 8b                	jne    8010e4f4 <cpu_account_schedule_process_decision+0x84>
8010e569:	0f be 5d df          	movsbl -0x21(%ebp),%ebx
8010e56d:	e8 ee e6 ff ff       	call   8010cc60 <cgroup_unlock>
8010e572:	83 c4 1c             	add    $0x1c,%esp
8010e575:	89 d8                	mov    %ebx,%eax
8010e577:	5b                   	pop    %ebx
8010e578:	5e                   	pop    %esi
8010e579:	5f                   	pop    %edi
8010e57a:	5d                   	pop    %ebp
8010e57b:	c3                   	ret    
8010e57c:	bb 01 00 00 00       	mov    $0x1,%ebx
8010e581:	eb ea                	jmp    8010e56d <cpu_account_schedule_process_decision+0xfd>
8010e583:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010e589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010e590 <cpu_account_before_process_schedule>:
8010e590:	55                   	push   %ebp
8010e591:	89 e5                	mov    %esp,%ebp
8010e593:	83 ec 08             	sub    $0x8,%esp
8010e596:	e8 a5 b8 ff ff       	call   80109e40 <steady_clock_now>
8010e59b:	8b 55 08             	mov    0x8(%ebp),%edx
8010e59e:	89 42 0c             	mov    %eax,0xc(%edx)
8010e5a1:	c9                   	leave  
8010e5a2:	c3                   	ret    
8010e5a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010e5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010e5b0 <cpu_account_after_process_schedule>:
8010e5b0:	55                   	push   %ebp
8010e5b1:	89 e5                	mov    %esp,%ebp
8010e5b3:	57                   	push   %edi
8010e5b4:	56                   	push   %esi
8010e5b5:	53                   	push   %ebx
8010e5b6:	83 ec 0c             	sub    $0xc,%esp
8010e5b9:	8b 75 08             	mov    0x8(%ebp),%esi
8010e5bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010e5bf:	8b 5e 10             	mov    0x10(%esi),%ebx
8010e5c2:	e8 79 b8 ff ff       	call   80109e40 <steady_clock_now>
8010e5c7:	89 06                	mov    %eax,(%esi)
8010e5c9:	2b 46 0c             	sub    0xc(%esi),%eax
8010e5cc:	89 46 0c             	mov    %eax,0xc(%esi)
8010e5cf:	01 87 b0 02 00 00    	add    %eax,0x2b0(%edi)
8010e5d5:	8b 46 0c             	mov    0xc(%esi),%eax
8010e5d8:	01 87 b4 02 00 00    	add    %eax,0x2b4(%edi)
8010e5de:	e8 5d e6 ff ff       	call   8010cc40 <cgroup_lock>
8010e5e3:	85 db                	test   %ebx,%ebx
8010e5e5:	74 2d                	je     8010e614 <cpu_account_after_process_schedule+0x64>
8010e5e7:	89 f6                	mov    %esi,%esi
8010e5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
8010e5f0:	8b 46 0c             	mov    0xc(%esi),%eax
8010e5f3:	31 d2                	xor    %edx,%edx
8010e5f5:	01 83 5c 03 00 00    	add    %eax,0x35c(%ebx)
8010e5fb:	11 93 60 03 00 00    	adc    %edx,0x360(%ebx)
8010e601:	8b 46 0c             	mov    0xc(%esi),%eax
8010e604:	01 83 64 03 00 00    	add    %eax,0x364(%ebx)
8010e60a:	8b 9b 08 03 00 00    	mov    0x308(%ebx),%ebx
8010e610:	85 db                	test   %ebx,%ebx
8010e612:	75 dc                	jne    8010e5f0 <cpu_account_after_process_schedule+0x40>
8010e614:	83 c4 0c             	add    $0xc,%esp
8010e617:	5b                   	pop    %ebx
8010e618:	5e                   	pop    %esi
8010e619:	5f                   	pop    %edi
8010e61a:	5d                   	pop    %ebp
8010e61b:	e9 40 e6 ff ff       	jmp    8010cc60 <cgroup_unlock>

8010e620 <cpu_account_schedule_finish>:
8010e620:	55                   	push   %ebp
8010e621:	89 e5                	mov    %esp,%ebp
8010e623:	5d                   	pop    %ebp
8010e624:	c3                   	ret    
8010e625:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010e630 <cpu_account_before_hlt>:
8010e630:	55                   	push   %ebp
8010e631:	89 e5                	mov    %esp,%ebp
8010e633:	5d                   	pop    %ebp
8010e634:	c3                   	ret    
8010e635:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010e639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

8010e640 <cpu_account_after_hlt>:
8010e640:	55                   	push   %ebp
8010e641:	89 e5                	mov    %esp,%ebp
8010e643:	5d                   	pop    %ebp
8010e644:	c3                   	ret    
