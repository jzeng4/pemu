
plugin.so:     file format elf32-i386


Disassembly of section .init:

000004d8 <_init>:
 4d8:	53                   	push   %ebx
 4d9:	83 ec 08             	sub    $0x8,%esp
 4dc:	e8 00 00 00 00       	call   4e1 <_init+0x9>
 4e1:	5b                   	pop    %ebx
 4e2:	81 c3 13 1b 00 00    	add    $0x1b13,%ebx
 4e8:	8b 83 f4 ff ff ff    	mov    -0xc(%ebx),%eax
 4ee:	85 c0                	test   %eax,%eax
 4f0:	74 05                	je     4f7 <_init+0x1f>
 4f2:	e8 79 00 00 00       	call   570 <__gmon_start__@plt>
 4f7:	e8 34 01 00 00       	call   630 <frame_dummy>
 4fc:	e8 af 02 00 00       	call   7b0 <__do_global_ctors_aux>
 501:	83 c4 08             	add    $0x8,%esp
 504:	5b                   	pop    %ebx
 505:	c3                   	ret    

Disassembly of section .plt:

00000510 <fprintf@plt-0x10>:
 510:	ff b3 04 00 00 00    	pushl  0x4(%ebx)
 516:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 51c:	00 00                	add    %al,(%eax)
	...

00000520 <fprintf@plt>:
 520:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 526:	68 00 00 00 00       	push   $0x0
 52b:	e9 e0 ff ff ff       	jmp    510 <_init+0x38>

00000530 <PIN_Init@plt>:
 530:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 536:	68 08 00 00 00       	push   $0x8
 53b:	e9 d0 ff ff ff       	jmp    510 <_init+0x38>

00000540 <getppid@plt>:
 540:	ff a3 14 00 00 00    	jmp    *0x14(%ebx)
 546:	68 10 00 00 00       	push   $0x10
 54b:	e9 c0 ff ff ff       	jmp    510 <_init+0x38>

00000550 <__cxa_finalize@plt>:
 550:	ff a3 18 00 00 00    	jmp    *0x18(%ebx)
 556:	68 18 00 00 00       	push   $0x18
 55b:	e9 b0 ff ff ff       	jmp    510 <_init+0x38>

00000560 <Usage@plt>:
 560:	ff a3 1c 00 00 00    	jmp    *0x1c(%ebx)
 566:	68 20 00 00 00       	push   $0x20
 56b:	e9 a0 ff ff ff       	jmp    510 <_init+0x38>

00000570 <__gmon_start__@plt>:
 570:	ff a3 20 00 00 00    	jmp    *0x20(%ebx)
 576:	68 28 00 00 00       	push   $0x28
 57b:	e9 90 ff ff ff       	jmp    510 <_init+0x38>

00000580 <fwrite@plt>:
 580:	ff a3 24 00 00 00    	jmp    *0x24(%ebx)
 586:	68 30 00 00 00       	push   $0x30
 58b:	e9 80 ff ff ff       	jmp    510 <_init+0x38>

00000590 <printf@plt>:
 590:	ff a3 28 00 00 00    	jmp    *0x28(%ebx)
 596:	68 38 00 00 00       	push   $0x38
 59b:	e9 70 ff ff ff       	jmp    510 <_init+0x38>

000005a0 <INS_InsertCall@plt>:
 5a0:	ff a3 2c 00 00 00    	jmp    *0x2c(%ebx)
 5a6:	68 40 00 00 00       	push   $0x40
 5ab:	e9 60 ff ff ff       	jmp    510 <_init+0x38>

Disassembly of section .text:

000005b0 <__do_global_dtors_aux>:
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	56                   	push   %esi
 5b4:	53                   	push   %ebx
 5b5:	e8 ad 00 00 00       	call   667 <__i686.get_pc_thunk.bx>
 5ba:	81 c3 3a 1a 00 00    	add    $0x1a3a,%ebx
 5c0:	83 ec 10             	sub    $0x10,%esp
 5c3:	80 bb 44 00 00 00 00 	cmpb   $0x0,0x44(%ebx)
 5ca:	75 5d                	jne    629 <__do_global_dtors_aux+0x79>
 5cc:	8b 83 f0 ff ff ff    	mov    -0x10(%ebx),%eax
 5d2:	85 c0                	test   %eax,%eax
 5d4:	74 0e                	je     5e4 <__do_global_dtors_aux+0x34>
 5d6:	8b 83 34 00 00 00    	mov    0x34(%ebx),%eax
 5dc:	89 04 24             	mov    %eax,(%esp)
 5df:	e8 6c ff ff ff       	call   550 <__cxa_finalize@plt>
 5e4:	8b 83 48 00 00 00    	mov    0x48(%ebx),%eax
 5ea:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 5f0:	8d 93 08 ff ff ff    	lea    -0xf8(%ebx),%edx
 5f6:	29 d6                	sub    %edx,%esi
 5f8:	c1 fe 02             	sar    $0x2,%esi
 5fb:	83 ee 01             	sub    $0x1,%esi
 5fe:	39 f0                	cmp    %esi,%eax
 600:	73 20                	jae    622 <__do_global_dtors_aux+0x72>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 608:	83 c0 01             	add    $0x1,%eax
 60b:	89 83 48 00 00 00    	mov    %eax,0x48(%ebx)
 611:	ff 94 83 08 ff ff ff 	call   *-0xf8(%ebx,%eax,4)
 618:	8b 83 48 00 00 00    	mov    0x48(%ebx),%eax
 61e:	39 f0                	cmp    %esi,%eax
 620:	72 e6                	jb     608 <__do_global_dtors_aux+0x58>
 622:	c6 83 44 00 00 00 01 	movb   $0x1,0x44(%ebx)
 629:	83 c4 10             	add    $0x10,%esp
 62c:	5b                   	pop    %ebx
 62d:	5e                   	pop    %esi
 62e:	5d                   	pop    %ebp
 62f:	c3                   	ret    

00000630 <frame_dummy>:
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	53                   	push   %ebx
 634:	e8 2e 00 00 00       	call   667 <__i686.get_pc_thunk.bx>
 639:	81 c3 bb 19 00 00    	add    $0x19bb,%ebx
 63f:	83 ec 14             	sub    $0x14,%esp
 642:	8b 93 10 ff ff ff    	mov    -0xf0(%ebx),%edx
 648:	85 d2                	test   %edx,%edx
 64a:	74 15                	je     661 <frame_dummy+0x31>
 64c:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 652:	85 c0                	test   %eax,%eax
 654:	74 0b                	je     661 <frame_dummy+0x31>
 656:	8d 93 10 ff ff ff    	lea    -0xf0(%ebx),%edx
 65c:	89 14 24             	mov    %edx,(%esp)
 65f:	ff d0                	call   *%eax
 661:	83 c4 14             	add    $0x14,%esp
 664:	5b                   	pop    %ebx
 665:	5d                   	pop    %ebp
 666:	c3                   	ret    

00000667 <__i686.get_pc_thunk.bx>:
 667:	8b 1c 24             	mov    (%esp),%ebx
 66a:	c3                   	ret    
 66b:	90                   	nop

0000066c <docount>:
 66c:	55                   	push   %ebp
 66d:	89 e5                	mov    %esp,%ebp
 66f:	57                   	push   %edi
 670:	56                   	push   %esi
 671:	53                   	push   %ebx
 672:	83 ec 1c             	sub    $0x1c,%esp
 675:	e8 ed ff ff ff       	call   667 <__i686.get_pc_thunk.bx>
 67a:	81 c3 7a 19 00 00    	add    $0x197a,%ebx
 680:	8b 45 08             	mov    0x8(%ebp),%eax
 683:	8b 50 04             	mov    0x4(%eax),%edx
 686:	8b 00                	mov    (%eax),%eax
 688:	89 c6                	mov    %eax,%esi
 68a:	89 d7                	mov    %edx,%edi
 68c:	83 c0 01             	add    $0x1,%eax
 68f:	83 d2 00             	adc    $0x0,%edx
 692:	8b 4d 08             	mov    0x8(%ebp),%ecx
 695:	89 01                	mov    %eax,(%ecx)
 697:	89 51 04             	mov    %edx,0x4(%ecx)
 69a:	8d 93 0e e8 ff ff    	lea    -0x17f2(%ebx),%edx
 6a0:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
 6a6:	8b 00                	mov    (%eax),%eax
 6a8:	89 74 24 08          	mov    %esi,0x8(%esp)
 6ac:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 6b0:	89 54 24 04          	mov    %edx,0x4(%esp)
 6b4:	89 04 24             	mov    %eax,(%esp)
 6b7:	e8 64 fe ff ff       	call   520 <fprintf@plt>
 6bc:	83 c4 1c             	add    $0x1c,%esp
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    

000006c4 <Instruction>:
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	53                   	push   %ebx
 6c8:	83 ec 24             	sub    $0x24,%esp
 6cb:	e8 97 ff ff ff       	call   667 <__i686.get_pc_thunk.bx>
 6d0:	81 c3 24 19 00 00    	add    $0x1924,%ebx
 6d6:	8b 83 f8 ff ff ff    	mov    -0x8(%ebx),%eax
 6dc:	c7 44 24 10 ff ff ff 	movl   $0xffffffff,0x10(%esp)
 6e3:	ff 
 6e4:	8d 93 3c 00 00 00    	lea    0x3c(%ebx),%edx
 6ea:	89 54 24 0c          	mov    %edx,0xc(%esp)
 6ee:	89 44 24 08          	mov    %eax,0x8(%esp)
 6f2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 6f9:	00 
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	89 04 24             	mov    %eax,(%esp)
 700:	e8 9b fe ff ff       	call   5a0 <INS_InsertCall@plt>
 705:	83 c4 24             	add    $0x24,%esp
 708:	5b                   	pop    %ebx
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    

0000070b <Fini>:
 70b:	55                   	push   %ebp
 70c:	89 e5                	mov    %esp,%ebp
 70e:	53                   	push   %ebx
 70f:	83 ec 14             	sub    $0x14,%esp
 712:	e8 50 ff ff ff       	call   667 <__i686.get_pc_thunk.bx>
 717:	81 c3 dd 18 00 00    	add    $0x18dd,%ebx
 71d:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
 723:	8b 00                	mov    (%eax),%eax
 725:	89 c2                	mov    %eax,%edx
 727:	8d 83 14 e8 ff ff    	lea    -0x17ec(%ebx),%eax
 72d:	89 54 24 0c          	mov    %edx,0xc(%esp)
 731:	c7 44 24 08 0f 00 00 	movl   $0xf,0x8(%esp)
 738:	00 
 739:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 740:	00 
 741:	89 04 24             	mov    %eax,(%esp)
 744:	e8 37 fe ff ff       	call   580 <fwrite@plt>
 749:	83 c4 14             	add    $0x14,%esp
 74c:	5b                   	pop    %ebx
 74d:	5d                   	pop    %ebp
 74e:	c3                   	ret    

0000074f <Usage>:
 74f:	55                   	push   %ebp
 750:	89 e5                	mov    %esp,%ebp
 752:	b8 00 00 00 00       	mov    $0x0,%eax
 757:	5d                   	pop    %ebp
 758:	c3                   	ret    

00000759 <init_main>:
 759:	55                   	push   %ebp
 75a:	89 e5                	mov    %esp,%ebp
 75c:	53                   	push   %ebx
 75d:	83 ec 14             	sub    $0x14,%esp
 760:	e8 02 ff ff ff       	call   667 <__i686.get_pc_thunk.bx>
 765:	81 c3 8f 18 00 00    	add    $0x188f,%ebx
 76b:	8b 45 0c             	mov    0xc(%ebp),%eax
 76e:	89 44 24 04          	mov    %eax,0x4(%esp)
 772:	8b 45 08             	mov    0x8(%ebp),%eax
 775:	89 04 24             	mov    %eax,(%esp)
 778:	e8 b3 fd ff ff       	call   530 <PIN_Init@plt>
 77d:	85 c0                	test   %eax,%eax
 77f:	74 07                	je     788 <init_main+0x2f>
 781:	e8 da fd ff ff       	call   560 <Usage@plt>
 786:	eb 1c                	jmp    7a4 <init_main+0x4b>
 788:	e8 b3 fd ff ff       	call   540 <getppid@plt>
 78d:	8d 93 24 e8 ff ff    	lea    -0x17dc(%ebx),%edx
 793:	89 44 24 04          	mov    %eax,0x4(%esp)
 797:	89 14 24             	mov    %edx,(%esp)
 79a:	e8 f1 fd ff ff       	call   590 <printf@plt>
 79f:	b8 00 00 00 00       	mov    $0x0,%eax
 7a4:	83 c4 14             	add    $0x14,%esp
 7a7:	5b                   	pop    %ebx
 7a8:	5d                   	pop    %ebp
 7a9:	c3                   	ret    
 7aa:	90                   	nop
 7ab:	90                   	nop
 7ac:	90                   	nop
 7ad:	90                   	nop
 7ae:	90                   	nop
 7af:	90                   	nop

000007b0 <__do_global_ctors_aux>:
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	56                   	push   %esi
 7b4:	53                   	push   %ebx
 7b5:	e8 ad fe ff ff       	call   667 <__i686.get_pc_thunk.bx>
 7ba:	81 c3 3a 18 00 00    	add    $0x183a,%ebx
 7c0:	8b 83 00 ff ff ff    	mov    -0x100(%ebx),%eax
 7c6:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c9:	74 19                	je     7e4 <__do_global_ctors_aux+0x34>
 7cb:	8d b3 00 ff ff ff    	lea    -0x100(%ebx),%esi
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	83 ee 04             	sub    $0x4,%esi
 7db:	ff d0                	call   *%eax
 7dd:	8b 06                	mov    (%esi),%eax
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	75 f4                	jne    7d8 <__do_global_ctors_aux+0x28>
 7e4:	5b                   	pop    %ebx
 7e5:	5e                   	pop    %esi
 7e6:	5d                   	pop    %ebp
 7e7:	c3                   	ret    

Disassembly of section .fini:

000007e8 <_fini>:
 7e8:	53                   	push   %ebx
 7e9:	83 ec 08             	sub    $0x8,%esp
 7ec:	e8 00 00 00 00       	call   7f1 <_fini+0x9>
 7f1:	5b                   	pop    %ebx
 7f2:	81 c3 03 18 00 00    	add    $0x1803,%ebx
 7f8:	e8 b3 fd ff ff       	call   5b0 <__do_global_dtors_aux>
 7fd:	83 c4 08             	add    $0x8,%esp
 800:	5b                   	pop    %ebx
 801:	c3                   	ret    
