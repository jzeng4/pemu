
test:     file format elf32-i386


Disassembly of section .init:

08048388 <_init>:
 8048388:	53                   	push   %ebx
 8048389:	83 ec 08             	sub    $0x8,%esp
 804838c:	e8 00 00 00 00       	call   8048391 <_init+0x9>
 8048391:	5b                   	pop    %ebx
 8048392:	81 c3 63 1c 00 00    	add    $0x1c63,%ebx
 8048398:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 804839e:	85 c0                	test   %eax,%eax
 80483a0:	74 05                	je     80483a7 <_init+0x1f>
 80483a2:	e8 39 00 00 00       	call   80483e0 <__gmon_start__@plt>
 80483a7:	e8 e4 00 00 00       	call   8048490 <frame_dummy>
 80483ac:	e8 af 01 00 00       	call   8048560 <__do_global_ctors_aux>
 80483b1:	83 c4 08             	add    $0x8,%esp
 80483b4:	5b                   	pop    %ebx
 80483b5:	c3                   	ret    

Disassembly of section .plt:

080483c0 <PEMU_getpid@plt-0x10>:
 80483c0:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 80483c6:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80483cc:	00 00                	add    %al,(%eax)
	...

080483d0 <PEMU_getpid@plt>:
 80483d0:	ff 25 00 a0 04 08    	jmp    *0x804a000
 80483d6:	68 00 00 00 00       	push   $0x0
 80483db:	e9 e0 ff ff ff       	jmp    80483c0 <_init+0x38>

080483e0 <__gmon_start__@plt>:
 80483e0:	ff 25 04 a0 04 08    	jmp    *0x804a004
 80483e6:	68 08 00 00 00       	push   $0x8
 80483eb:	e9 d0 ff ff ff       	jmp    80483c0 <_init+0x38>

080483f0 <__libc_start_main@plt>:
 80483f0:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80483f6:	68 10 00 00 00       	push   $0x10
 80483fb:	e9 c0 ff ff ff       	jmp    80483c0 <_init+0x38>

Disassembly of section .text:

08048400 <_start>:
 8048400:	31 ed                	xor    %ebp,%ebp
 8048402:	5e                   	pop    %esi
 8048403:	89 e1                	mov    %esp,%ecx
 8048405:	83 e4 f0             	and    $0xfffffff0,%esp
 8048408:	50                   	push   %eax
 8048409:	54                   	push   %esp
 804840a:	52                   	push   %edx
 804840b:	68 50 85 04 08       	push   $0x8048550
 8048410:	68 e0 84 04 08       	push   $0x80484e0
 8048415:	51                   	push   %ecx
 8048416:	56                   	push   %esi
 8048417:	68 b4 84 04 08       	push   $0x80484b4
 804841c:	e8 cf ff ff ff       	call   80483f0 <__libc_start_main@plt>
 8048421:	f4                   	hlt    
 8048422:	90                   	nop
 8048423:	90                   	nop
 8048424:	90                   	nop
 8048425:	90                   	nop
 8048426:	90                   	nop
 8048427:	90                   	nop
 8048428:	90                   	nop
 8048429:	90                   	nop
 804842a:	90                   	nop
 804842b:	90                   	nop
 804842c:	90                   	nop
 804842d:	90                   	nop
 804842e:	90                   	nop
 804842f:	90                   	nop

08048430 <__do_global_dtors_aux>:
 8048430:	55                   	push   %ebp
 8048431:	89 e5                	mov    %esp,%ebp
 8048433:	53                   	push   %ebx
 8048434:	83 ec 04             	sub    $0x4,%esp
 8048437:	80 3d 14 a0 04 08 00 	cmpb   $0x0,0x804a014
 804843e:	75 3f                	jne    804847f <__do_global_dtors_aux+0x4f>
 8048440:	a1 18 a0 04 08       	mov    0x804a018,%eax
 8048445:	bb 18 9f 04 08       	mov    $0x8049f18,%ebx
 804844a:	81 eb 14 9f 04 08    	sub    $0x8049f14,%ebx
 8048450:	c1 fb 02             	sar    $0x2,%ebx
 8048453:	83 eb 01             	sub    $0x1,%ebx
 8048456:	39 d8                	cmp    %ebx,%eax
 8048458:	73 1e                	jae    8048478 <__do_global_dtors_aux+0x48>
 804845a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048460:	83 c0 01             	add    $0x1,%eax
 8048463:	a3 18 a0 04 08       	mov    %eax,0x804a018
 8048468:	ff 14 85 14 9f 04 08 	call   *0x8049f14(,%eax,4)
 804846f:	a1 18 a0 04 08       	mov    0x804a018,%eax
 8048474:	39 d8                	cmp    %ebx,%eax
 8048476:	72 e8                	jb     8048460 <__do_global_dtors_aux+0x30>
 8048478:	c6 05 14 a0 04 08 01 	movb   $0x1,0x804a014
 804847f:	83 c4 04             	add    $0x4,%esp
 8048482:	5b                   	pop    %ebx
 8048483:	5d                   	pop    %ebp
 8048484:	c3                   	ret    
 8048485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048490 <frame_dummy>:
 8048490:	55                   	push   %ebp
 8048491:	89 e5                	mov    %esp,%ebp
 8048493:	83 ec 18             	sub    $0x18,%esp
 8048496:	a1 1c 9f 04 08       	mov    0x8049f1c,%eax
 804849b:	85 c0                	test   %eax,%eax
 804849d:	74 12                	je     80484b1 <frame_dummy+0x21>
 804849f:	b8 00 00 00 00       	mov    $0x0,%eax
 80484a4:	85 c0                	test   %eax,%eax
 80484a6:	74 09                	je     80484b1 <frame_dummy+0x21>
 80484a8:	c7 04 24 1c 9f 04 08 	movl   $0x8049f1c,(%esp)
 80484af:	ff d0                	call   *%eax
 80484b1:	c9                   	leave  
 80484b2:	c3                   	ret    
 80484b3:	90                   	nop

080484b4 <main>:
 80484b4:	55                   	push   %ebp
 80484b5:	89 e5                	mov    %esp,%ebp
 80484b7:	53                   	push   %ebx
 80484b8:	83 e4 f0             	and    $0xfffffff0,%esp
 80484bb:	e8 10 00 00 00       	call   80484d0 <__i686.get_pc_thunk.bx>
 80484c0:	81 c3 34 1b 00 00    	add    $0x1b34,%ebx
 80484c6:	e8 05 ff ff ff       	call   80483d0 <PEMU_getpid@plt>
 80484cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80484ce:	c9                   	leave  
 80484cf:	c3                   	ret    

080484d0 <__i686.get_pc_thunk.bx>:
 80484d0:	8b 1c 24             	mov    (%esp),%ebx
 80484d3:	c3                   	ret    
 80484d4:	90                   	nop
 80484d5:	90                   	nop
 80484d6:	90                   	nop
 80484d7:	90                   	nop
 80484d8:	90                   	nop
 80484d9:	90                   	nop
 80484da:	90                   	nop
 80484db:	90                   	nop
 80484dc:	90                   	nop
 80484dd:	90                   	nop
 80484de:	90                   	nop
 80484df:	90                   	nop

080484e0 <__libc_csu_init>:
 80484e0:	55                   	push   %ebp
 80484e1:	57                   	push   %edi
 80484e2:	56                   	push   %esi
 80484e3:	53                   	push   %ebx
 80484e4:	e8 e7 ff ff ff       	call   80484d0 <__i686.get_pc_thunk.bx>
 80484e9:	81 c3 0b 1b 00 00    	add    $0x1b0b,%ebx
 80484ef:	83 ec 1c             	sub    $0x1c,%esp
 80484f2:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 80484f6:	8d bb 18 ff ff ff    	lea    -0xe8(%ebx),%edi
 80484fc:	e8 87 fe ff ff       	call   8048388 <_init>
 8048501:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
 8048507:	29 c7                	sub    %eax,%edi
 8048509:	c1 ff 02             	sar    $0x2,%edi
 804850c:	85 ff                	test   %edi,%edi
 804850e:	74 29                	je     8048539 <__libc_csu_init+0x59>
 8048510:	31 f6                	xor    %esi,%esi
 8048512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048518:	8b 44 24 38          	mov    0x38(%esp),%eax
 804851c:	89 2c 24             	mov    %ebp,(%esp)
 804851f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048523:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048527:	89 44 24 04          	mov    %eax,0x4(%esp)
 804852b:	ff 94 b3 18 ff ff ff 	call   *-0xe8(%ebx,%esi,4)
 8048532:	83 c6 01             	add    $0x1,%esi
 8048535:	39 fe                	cmp    %edi,%esi
 8048537:	75 df                	jne    8048518 <__libc_csu_init+0x38>
 8048539:	83 c4 1c             	add    $0x1c,%esp
 804853c:	5b                   	pop    %ebx
 804853d:	5e                   	pop    %esi
 804853e:	5f                   	pop    %edi
 804853f:	5d                   	pop    %ebp
 8048540:	c3                   	ret    
 8048541:	eb 0d                	jmp    8048550 <__libc_csu_fini>
 8048543:	90                   	nop
 8048544:	90                   	nop
 8048545:	90                   	nop
 8048546:	90                   	nop
 8048547:	90                   	nop
 8048548:	90                   	nop
 8048549:	90                   	nop
 804854a:	90                   	nop
 804854b:	90                   	nop
 804854c:	90                   	nop
 804854d:	90                   	nop
 804854e:	90                   	nop
 804854f:	90                   	nop

08048550 <__libc_csu_fini>:
 8048550:	f3 c3                	repz ret 
 8048552:	90                   	nop
 8048553:	90                   	nop
 8048554:	90                   	nop
 8048555:	90                   	nop
 8048556:	90                   	nop
 8048557:	90                   	nop
 8048558:	90                   	nop
 8048559:	90                   	nop
 804855a:	90                   	nop
 804855b:	90                   	nop
 804855c:	90                   	nop
 804855d:	90                   	nop
 804855e:	90                   	nop
 804855f:	90                   	nop

08048560 <__do_global_ctors_aux>:
 8048560:	55                   	push   %ebp
 8048561:	89 e5                	mov    %esp,%ebp
 8048563:	53                   	push   %ebx
 8048564:	83 ec 04             	sub    $0x4,%esp
 8048567:	a1 0c 9f 04 08       	mov    0x8049f0c,%eax
 804856c:	83 f8 ff             	cmp    $0xffffffff,%eax
 804856f:	74 13                	je     8048584 <__do_global_ctors_aux+0x24>
 8048571:	bb 0c 9f 04 08       	mov    $0x8049f0c,%ebx
 8048576:	66 90                	xchg   %ax,%ax
 8048578:	83 eb 04             	sub    $0x4,%ebx
 804857b:	ff d0                	call   *%eax
 804857d:	8b 03                	mov    (%ebx),%eax
 804857f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048582:	75 f4                	jne    8048578 <__do_global_ctors_aux+0x18>
 8048584:	83 c4 04             	add    $0x4,%esp
 8048587:	5b                   	pop    %ebx
 8048588:	5d                   	pop    %ebp
 8048589:	c3                   	ret    
 804858a:	90                   	nop
 804858b:	90                   	nop

Disassembly of section .fini:

0804858c <_fini>:
 804858c:	53                   	push   %ebx
 804858d:	83 ec 08             	sub    $0x8,%esp
 8048590:	e8 00 00 00 00       	call   8048595 <_fini+0x9>
 8048595:	5b                   	pop    %ebx
 8048596:	81 c3 5f 1a 00 00    	add    $0x1a5f,%ebx
 804859c:	e8 8f fe ff ff       	call   8048430 <__do_global_dtors_aux>
 80485a1:	83 c4 08             	add    $0x8,%esp
 80485a4:	5b                   	pop    %ebx
 80485a5:	c3                   	ret    
