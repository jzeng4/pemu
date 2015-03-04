
PEMU_API.so:     file format elf32-i386


Disassembly of section .init:

00000370 <_init>:
 370:	53                   	push   %ebx
 371:	83 ec 08             	sub    $0x8,%esp
 374:	e8 00 00 00 00       	call   379 <_init+0x9>
 379:	5b                   	pop    %ebx
 37a:	81 c3 7b 1c 00 00    	add    $0x1c7b,%ebx
 380:	8b 83 f8 ff ff ff    	mov    -0x8(%ebx),%eax
 386:	85 c0                	test   %eax,%eax
 388:	74 05                	je     38f <_init+0x1f>
 38a:	e8 31 00 00 00       	call   3c0 <__gmon_start__@plt>
 38f:	e8 bc 00 00 00       	call   450 <frame_dummy>
 394:	e8 27 01 00 00       	call   4c0 <__do_global_ctors_aux>
 399:	83 c4 08             	add    $0x8,%esp
 39c:	5b                   	pop    %ebx
 39d:	c3                   	ret    

Disassembly of section .plt:

000003a0 <__cxa_finalize@plt-0x10>:
 3a0:	ff b3 04 00 00 00    	pushl  0x4(%ebx)
 3a6:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 3ac:	00 00                	add    %al,(%eax)
	...

000003b0 <__cxa_finalize@plt>:
 3b0:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 3b6:	68 00 00 00 00       	push   $0x0
 3bb:	e9 e0 ff ff ff       	jmp    3a0 <_init+0x30>

000003c0 <__gmon_start__@plt>:
 3c0:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 3c6:	68 08 00 00 00       	push   $0x8
 3cb:	e9 d0 ff ff ff       	jmp    3a0 <_init+0x30>

Disassembly of section .text:

000003d0 <__do_global_dtors_aux>:
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
 3d5:	e8 ad 00 00 00       	call   487 <__i686.get_pc_thunk.bx>
 3da:	81 c3 1a 1c 00 00    	add    $0x1c1a,%ebx
 3e0:	83 ec 10             	sub    $0x10,%esp
 3e3:	80 bb 18 00 00 00 00 	cmpb   $0x0,0x18(%ebx)
 3ea:	75 5d                	jne    449 <__do_global_dtors_aux+0x79>
 3ec:	8b 83 f4 ff ff ff    	mov    -0xc(%ebx),%eax
 3f2:	85 c0                	test   %eax,%eax
 3f4:	74 0e                	je     404 <__do_global_dtors_aux+0x34>
 3f6:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
 3fc:	89 04 24             	mov    %eax,(%esp)
 3ff:	e8 ac ff ff ff       	call   3b0 <__cxa_finalize@plt>
 404:	8b 83 1c 00 00 00    	mov    0x1c(%ebx),%eax
 40a:	8d b3 18 ff ff ff    	lea    -0xe8(%ebx),%esi
 410:	8d 93 14 ff ff ff    	lea    -0xec(%ebx),%edx
 416:	29 d6                	sub    %edx,%esi
 418:	c1 fe 02             	sar    $0x2,%esi
 41b:	83 ee 01             	sub    $0x1,%esi
 41e:	39 f0                	cmp    %esi,%eax
 420:	73 20                	jae    442 <__do_global_dtors_aux+0x72>
 422:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 428:	83 c0 01             	add    $0x1,%eax
 42b:	89 83 1c 00 00 00    	mov    %eax,0x1c(%ebx)
 431:	ff 94 83 14 ff ff ff 	call   *-0xec(%ebx,%eax,4)
 438:	8b 83 1c 00 00 00    	mov    0x1c(%ebx),%eax
 43e:	39 f0                	cmp    %esi,%eax
 440:	72 e6                	jb     428 <__do_global_dtors_aux+0x58>
 442:	c6 83 18 00 00 00 01 	movb   $0x1,0x18(%ebx)
 449:	83 c4 10             	add    $0x10,%esp
 44c:	5b                   	pop    %ebx
 44d:	5e                   	pop    %esi
 44e:	5d                   	pop    %ebp
 44f:	c3                   	ret    

00000450 <frame_dummy>:
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	53                   	push   %ebx
 454:	e8 2e 00 00 00       	call   487 <__i686.get_pc_thunk.bx>
 459:	81 c3 9b 1b 00 00    	add    $0x1b9b,%ebx
 45f:	83 ec 14             	sub    $0x14,%esp
 462:	8b 93 1c ff ff ff    	mov    -0xe4(%ebx),%edx
 468:	85 d2                	test   %edx,%edx
 46a:	74 15                	je     481 <frame_dummy+0x31>
 46c:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 472:	85 c0                	test   %eax,%eax
 474:	74 0b                	je     481 <frame_dummy+0x31>
 476:	8d 93 1c ff ff ff    	lea    -0xe4(%ebx),%edx
 47c:	89 14 24             	mov    %edx,(%esp)
 47f:	ff d0                	call   *%eax
 481:	83 c4 14             	add    $0x14,%esp
 484:	5b                   	pop    %ebx
 485:	5d                   	pop    %ebp
 486:	c3                   	ret    

00000487 <__i686.get_pc_thunk.bx>:
 487:	8b 1c 24             	mov    (%esp),%ebx
 48a:	c3                   	ret    
 48b:	90                   	nop

0000048c <PEMU_getpid>:
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
 48f:	83 ec 10             	sub    $0x10,%esp
 492:	e8 1c 00 00 00       	call   4b3 <__i686.get_pc_thunk.cx>
 497:	81 c1 5d 1b 00 00    	add    $0x1b5d,%ecx
 49d:	8b 81 f0 ff ff ff    	mov    -0x10(%ecx),%eax
 4a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 4a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4a9:	c9                   	leave  
 4aa:	ff e0                	jmp    *%eax
 4ac:	b8 00 00 00 00       	mov    $0x0,%eax
 4b1:	c9                   	leave  
 4b2:	c3                   	ret    

000004b3 <__i686.get_pc_thunk.cx>:
 4b3:	8b 0c 24             	mov    (%esp),%ecx
 4b6:	c3                   	ret    
 4b7:	90                   	nop
 4b8:	90                   	nop
 4b9:	90                   	nop
 4ba:	90                   	nop
 4bb:	90                   	nop
 4bc:	90                   	nop
 4bd:	90                   	nop
 4be:	90                   	nop
 4bf:	90                   	nop

000004c0 <__do_global_ctors_aux>:
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
 4c5:	e8 bd ff ff ff       	call   487 <__i686.get_pc_thunk.bx>
 4ca:	81 c3 2a 1b 00 00    	add    $0x1b2a,%ebx
 4d0:	8b 83 0c ff ff ff    	mov    -0xf4(%ebx),%eax
 4d6:	83 f8 ff             	cmp    $0xffffffff,%eax
 4d9:	74 19                	je     4f4 <__do_global_ctors_aux+0x34>
 4db:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	83 ee 04             	sub    $0x4,%esi
 4eb:	ff d0                	call   *%eax
 4ed:	8b 06                	mov    (%esi),%eax
 4ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 4f2:	75 f4                	jne    4e8 <__do_global_ctors_aux+0x28>
 4f4:	5b                   	pop    %ebx
 4f5:	5e                   	pop    %esi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    

Disassembly of section .fini:

000004f8 <_fini>:
 4f8:	53                   	push   %ebx
 4f9:	83 ec 08             	sub    $0x8,%esp
 4fc:	e8 00 00 00 00       	call   501 <_fini+0x9>
 501:	5b                   	pop    %ebx
 502:	81 c3 f3 1a 00 00    	add    $0x1af3,%ebx
 508:	e8 c3 fe ff ff       	call   3d0 <__do_global_dtors_aux>
 50d:	83 c4 08             	add    $0x8,%esp
 510:	5b                   	pop    %ebx
 511:	c3                   	ret    
