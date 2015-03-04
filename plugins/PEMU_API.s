
PEMU_API.so:     file format elf32-i386


Disassembly of section .init:

00000408 <_init>:
 408:	53                   	push   %ebx
 409:	83 ec 08             	sub    $0x8,%esp
 40c:	e8 00 00 00 00       	call   411 <_init+0x9>
 411:	5b                   	pop    %ebx
 412:	81 c3 e3 1b 00 00    	add    $0x1be3,%ebx
 418:	8b 83 f4 ff ff ff    	mov    -0xc(%ebx),%eax
 41e:	85 c0                	test   %eax,%eax
 420:	74 05                	je     427 <_init+0x1f>
 422:	e8 39 00 00 00       	call   460 <__gmon_start__@plt>
 427:	e8 c4 00 00 00       	call   4f0 <frame_dummy>
 42c:	e8 7f 01 00 00       	call   5b0 <__do_global_ctors_aux>
 431:	83 c4 08             	add    $0x8,%esp
 434:	5b                   	pop    %ebx
 435:	c3                   	ret    

Disassembly of section .plt:

00000440 <__cxa_finalize@plt-0x10>:
 440:	ff b3 04 00 00 00    	pushl  0x4(%ebx)
 446:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 44c:	00 00                	add    %al,(%eax)
	...

00000450 <__cxa_finalize@plt>:
 450:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 456:	68 00 00 00 00       	push   $0x0
 45b:	e9 e0 ff ff ff       	jmp    440 <_init+0x38>

00000460 <__gmon_start__@plt>:
 460:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 466:	68 08 00 00 00       	push   $0x8
 46b:	e9 d0 ff ff ff       	jmp    440 <_init+0x38>

Disassembly of section .text:

00000470 <__do_global_dtors_aux>:
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	56                   	push   %esi
 474:	53                   	push   %ebx
 475:	e8 ad 00 00 00       	call   527 <__i686.get_pc_thunk.bx>
 47a:	81 c3 7a 1b 00 00    	add    $0x1b7a,%ebx
 480:	83 ec 10             	sub    $0x10,%esp
 483:	80 bb 18 00 00 00 00 	cmpb   $0x0,0x18(%ebx)
 48a:	75 5d                	jne    4e9 <__do_global_dtors_aux+0x79>
 48c:	8b 83 f0 ff ff ff    	mov    -0x10(%ebx),%eax
 492:	85 c0                	test   %eax,%eax
 494:	74 0e                	je     4a4 <__do_global_dtors_aux+0x34>
 496:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
 49c:	89 04 24             	mov    %eax,(%esp)
 49f:	e8 ac ff ff ff       	call   450 <__cxa_finalize@plt>
 4a4:	8b 83 1c 00 00 00    	mov    0x1c(%ebx),%eax
 4aa:	8d b3 10 ff ff ff    	lea    -0xf0(%ebx),%esi
 4b0:	8d 93 0c ff ff ff    	lea    -0xf4(%ebx),%edx
 4b6:	29 d6                	sub    %edx,%esi
 4b8:	c1 fe 02             	sar    $0x2,%esi
 4bb:	83 ee 01             	sub    $0x1,%esi
 4be:	39 f0                	cmp    %esi,%eax
 4c0:	73 20                	jae    4e2 <__do_global_dtors_aux+0x72>
 4c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4c8:	83 c0 01             	add    $0x1,%eax
 4cb:	89 83 1c 00 00 00    	mov    %eax,0x1c(%ebx)
 4d1:	ff 94 83 0c ff ff ff 	call   *-0xf4(%ebx,%eax,4)
 4d8:	8b 83 1c 00 00 00    	mov    0x1c(%ebx),%eax
 4de:	39 f0                	cmp    %esi,%eax
 4e0:	72 e6                	jb     4c8 <__do_global_dtors_aux+0x58>
 4e2:	c6 83 18 00 00 00 01 	movb   $0x1,0x18(%ebx)
 4e9:	83 c4 10             	add    $0x10,%esp
 4ec:	5b                   	pop    %ebx
 4ed:	5e                   	pop    %esi
 4ee:	5d                   	pop    %ebp
 4ef:	c3                   	ret    

000004f0 <frame_dummy>:
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
 4f4:	e8 2e 00 00 00       	call   527 <__i686.get_pc_thunk.bx>
 4f9:	81 c3 fb 1a 00 00    	add    $0x1afb,%ebx
 4ff:	83 ec 14             	sub    $0x14,%esp
 502:	8b 93 14 ff ff ff    	mov    -0xec(%ebx),%edx
 508:	85 d2                	test   %edx,%edx
 50a:	74 15                	je     521 <frame_dummy+0x31>
 50c:	8b 83 f8 ff ff ff    	mov    -0x8(%ebx),%eax
 512:	85 c0                	test   %eax,%eax
 514:	74 0b                	je     521 <frame_dummy+0x31>
 516:	8d 93 14 ff ff ff    	lea    -0xec(%ebx),%edx
 51c:	89 14 24             	mov    %edx,(%esp)
 51f:	ff d0                	call   *%eax
 521:	83 c4 14             	add    $0x14,%esp
 524:	5b                   	pop    %ebx
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    

00000527 <__i686.get_pc_thunk.bx>:
 527:	8b 1c 24             	mov    (%esp),%ebx
 52a:	c3                   	ret    
 52b:	90                   	nop

0000052c <PEMU_getpid>:
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	83 ec 10             	sub    $0x10,%esp
 532:	e8 6a 00 00 00       	call   5a1 <__i686.get_pc_thunk.cx>
 537:	81 c1 bd 1a 00 00    	add    $0x1abd,%ecx
 53d:	8b 81 e8 ff ff ff    	mov    -0x18(%ecx),%eax
 543:	89 45 fc             	mov    %eax,-0x4(%ebp)
 546:	8b 45 fc             	mov    -0x4(%ebp),%eax
 549:	c9                   	leave  
 54a:	ff e0                	jmp    *%eax
 54c:	b8 00 00 00 00       	mov    $0x0,%eax
 551:	c9                   	leave  
 552:	c3                   	ret    

00000553 <PEMU_getppid>:
 553:	55                   	push   %ebp
 554:	89 e5                	mov    %esp,%ebp
 556:	83 ec 10             	sub    $0x10,%esp
 559:	e8 43 00 00 00       	call   5a1 <__i686.get_pc_thunk.cx>
 55e:	81 c1 96 1a 00 00    	add    $0x1a96,%ecx
 564:	8b 81 ec ff ff ff    	mov    -0x14(%ecx),%eax
 56a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 56d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 570:	c9                   	leave  
 571:	ff e0                	jmp    *%eax
 573:	b8 00 00 00 00       	mov    $0x0,%eax
 578:	c9                   	leave  
 579:	c3                   	ret    

0000057a <PEMU_getrlimit>:
 57a:	55                   	push   %ebp
 57b:	89 e5                	mov    %esp,%ebp
 57d:	83 ec 10             	sub    $0x10,%esp
 580:	e8 1c 00 00 00       	call   5a1 <__i686.get_pc_thunk.cx>
 585:	81 c1 6f 1a 00 00    	add    $0x1a6f,%ecx
 58b:	8b 81 fc ff ff ff    	mov    -0x4(%ecx),%eax
 591:	89 45 fc             	mov    %eax,-0x4(%ebp)
 594:	8b 45 fc             	mov    -0x4(%ebp),%eax
 597:	c9                   	leave  
 598:	ff e0                	jmp    *%eax
 59a:	b8 00 00 00 00       	mov    $0x0,%eax
 59f:	c9                   	leave  
 5a0:	c3                   	ret    

000005a1 <__i686.get_pc_thunk.cx>:
 5a1:	8b 0c 24             	mov    (%esp),%ecx
 5a4:	c3                   	ret    
 5a5:	90                   	nop
 5a6:	90                   	nop
 5a7:	90                   	nop
 5a8:	90                   	nop
 5a9:	90                   	nop
 5aa:	90                   	nop
 5ab:	90                   	nop
 5ac:	90                   	nop
 5ad:	90                   	nop
 5ae:	90                   	nop
 5af:	90                   	nop

000005b0 <__do_global_ctors_aux>:
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	56                   	push   %esi
 5b4:	53                   	push   %ebx
 5b5:	e8 6d ff ff ff       	call   527 <__i686.get_pc_thunk.bx>
 5ba:	81 c3 3a 1a 00 00    	add    $0x1a3a,%ebx
 5c0:	8b 83 04 ff ff ff    	mov    -0xfc(%ebx),%eax
 5c6:	83 f8 ff             	cmp    $0xffffffff,%eax
 5c9:	74 19                	je     5e4 <__do_global_ctors_aux+0x34>
 5cb:	8d b3 04 ff ff ff    	lea    -0xfc(%ebx),%esi
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	83 ee 04             	sub    $0x4,%esi
 5db:	ff d0                	call   *%eax
 5dd:	8b 06                	mov    (%esi),%eax
 5df:	83 f8 ff             	cmp    $0xffffffff,%eax
 5e2:	75 f4                	jne    5d8 <__do_global_ctors_aux+0x28>
 5e4:	5b                   	pop    %ebx
 5e5:	5e                   	pop    %esi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    

Disassembly of section .fini:

000005e8 <_fini>:
 5e8:	53                   	push   %ebx
 5e9:	83 ec 08             	sub    $0x8,%esp
 5ec:	e8 00 00 00 00       	call   5f1 <_fini+0x9>
 5f1:	5b                   	pop    %ebx
 5f2:	81 c3 03 1a 00 00    	add    $0x1a03,%ebx
 5f8:	e8 73 fe ff ff       	call   470 <__do_global_dtors_aux>
 5fd:	83 c4 08             	add    $0x8,%esp
 600:	5b                   	pop    %ebx
 601:	c3                   	ret    
