
/home/yufei/hello/hello.ko:     file format elf32-i386


Disassembly of section .text:

00000000 <cleanup_module>:
   0:	c3                   	ret    

00000001 <vmmi_vtop>:
   1:	57                   	push   %edi
   2:	81 ea 00 00 00 40    	sub    $0x40000000,%edx
   8:	56                   	push   %esi
   9:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
   f:	53                   	push   %ebx
  10:	89 c3                	mov    %eax,%ebx
  12:	c1 e8 14             	shr    $0x14,%eax
  15:	83 e0 fc             	and    $0xfffffffc,%eax
  18:	01 c2                	add    %eax,%edx
  1a:	8b 02                	mov    (%edx),%eax
  1c:	84 c0                	test   %al,%al
  1e:	79 11                	jns    31 <vmmi_vtop+0x30>
  20:	89 c6                	mov    %eax,%esi
  22:	bf 00 00 40 00       	mov    $0x400000,%edi
  27:	81 e6 ff 0f c0 ff    	and    $0xffc00fff,%esi
  2d:	31 c0                	xor    %eax,%eax
  2f:	eb 1c                	jmp    4d <vmmi_vtop+0x4c>
  31:	89 c6                	mov    %eax,%esi
  33:	89 d8                	mov    %ebx,%eax
  35:	c1 e8 0a             	shr    $0xa,%eax
  38:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  3e:	25 fc 0f 00 00       	and    $0xffc,%eax
  43:	bf 00 10 00 00       	mov    $0x1000,%edi
  48:	8d 04 06             	lea    (%esi,%eax,1),%eax
  4b:	31 f6                	xor    %esi,%esi
  4d:	56                   	push   %esi
  4e:	4f                   	dec    %edi
  4f:	50                   	push   %eax
  50:	21 df                	and    %ebx,%edi
  52:	52                   	push   %edx
  53:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  59:	68 00 00 00 00       	push   $0x0
  5e:	e8 fc ff ff ff       	call   5f <vmmi_vtop+0x5e>
  63:	8d 04 37             	lea    (%edi,%esi,1),%eax
  66:	83 c4 10             	add    $0x10,%esp
  69:	5b                   	pop    %ebx
  6a:	5e                   	pop    %esi
  6b:	5f                   	pop    %edi
  6c:	c3                   	ret    

0000006d <getCr3>:
  6d:	53                   	push   %ebx
  6e:	83 ec 0c             	sub    $0xc,%esp
  71:	0f 20 c0             	mov    %cr0,%eax
  74:	89 44 24 08          	mov    %eax,0x8(%esp)
  78:	0f 20 d0             	mov    %cr2,%eax
  7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  7f:	0f 20 d8             	mov    %cr3,%eax
  82:	89 04 24             	mov    %eax,(%esp)
  85:	ff 74 24 08          	pushl  0x8(%esp)
  89:	68 23 00 00 00       	push   $0x23
  8e:	e8 fc ff ff ff       	call   8f <getCr3+0x22>
  93:	ff 74 24 0c          	pushl  0xc(%esp)
  97:	68 35 00 00 00       	push   $0x35
  9c:	e8 fc ff ff ff       	call   9d <getCr3+0x30>
  a1:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  a5:	53                   	push   %ebx
  a6:	68 47 00 00 00       	push   $0x47
  ab:	e8 fc ff ff ff       	call   ac <getCr3+0x3f>
  b0:	89 d8                	mov    %ebx,%eax
  b2:	83 c4 24             	add    $0x24,%esp
  b5:	5b                   	pop    %ebx
  b6:	c3                   	ret    

000000b7 <dump_pagetable>:
  b7:	57                   	push   %edi
  b8:	56                   	push   %esi
  b9:	89 c6                	mov    %eax,%esi
  bb:	53                   	push   %ebx
  bc:	ff 15 08 00 00 00    	call   *0x8
  c2:	89 f2                	mov    %esi,%edx
  c4:	c1 ea 16             	shr    $0x16,%edx
  c7:	8d bc 90 00 00 00 c0 	lea    -0x40000000(%eax,%edx,4),%edi
  ce:	8b 07                	mov    (%edi),%eax
  d0:	ff 15 74 00 00 00    	call   *0x74
  d6:	50                   	push   %eax
  d7:	68 59 00 00 00       	push   $0x59
  dc:	e8 fc ff ff ff       	call   dd <dump_pagetable+0x26>
  e1:	8b 07                	mov    (%edi),%eax
  e3:	ff 15 74 00 00 00    	call   *0x74
  e9:	31 d2                	xor    %edx,%edx
  eb:	52                   	push   %edx
  ec:	50                   	push   %eax
  ed:	57                   	push   %edi
  ee:	68 66 00 00 00       	push   $0x66
  f3:	e8 fc ff ff ff       	call   f4 <dump_pagetable+0x3d>
  f8:	8b 07                	mov    (%edi),%eax
  fa:	83 c4 18             	add    $0x18,%esp
  fd:	a8 01                	test   $0x1,%al
  ff:	75 0d                	jne    10e <dump_pagetable+0x57>
 101:	68 82 00 00 00       	push   $0x82
 106:	e8 fc ff ff ff       	call   107 <dump_pagetable+0x50>
 10b:	5a                   	pop    %edx
 10c:	eb 32                	jmp    140 <dump_pagetable+0x89>
 10e:	ff 15 74 00 00 00    	call   *0x74
 114:	c1 ee 0a             	shr    $0xa,%esi
 117:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 11c:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
 122:	8d 9c 06 00 00 00 c0 	lea    -0x40000000(%esi,%eax,1),%ebx
 129:	8b 03                	mov    (%ebx),%eax
 12b:	ff 15 6c 00 00 00    	call   *0x6c
 131:	50                   	push   %eax
 132:	53                   	push   %ebx
 133:	68 8f 00 00 00       	push   $0x8f
 138:	e8 fc ff ff ff       	call   139 <dump_pagetable+0x82>
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	68 a3 00 00 00       	push   $0xa3
 145:	e8 fc ff ff ff       	call   146 <dump_pagetable+0x8f>
 14a:	58                   	pop    %eax
 14b:	89 d8                	mov    %ebx,%eax
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	c3                   	ret    

00000151 <init_module>:
 151:	55                   	push   %ebp
 152:	57                   	push   %edi
 153:	56                   	push   %esi
 154:	53                   	push   %ebx
 155:	83 ec 04             	sub    $0x4,%esp
 158:	e8 fc ff ff ff       	call   159 <init_module+0x8>
 15d:	68 00 00 00 40       	push   $0x40000000
 162:	68 00 00 00 00       	push   $0x0
 167:	68 a5 00 00 00       	push   $0xa5
 16c:	e8 fc ff ff ff       	call   16d <init_module+0x1c>
 171:	ba d0 00 00 00       	mov    $0xd0,%edx
 176:	b8 30 0c 00 00       	mov    $0xc30,%eax
 17b:	e8 fc ff ff ff       	call   17c <init_module+0x2b>
 180:	8b 3d 34 0c 00 00    	mov    0xc34,%edi
 186:	83 c4 0c             	add    $0xc,%esp
 189:	89 c6                	mov    %eax,%esi
 18b:	83 3d 04 00 00 00 00 	cmpl   $0x0,0x4
 192:	74 28                	je     1bc <init_module+0x6b>
 194:	8b 1d 10 00 00 00    	mov    0x10,%ebx
 19a:	85 db                	test   %ebx,%ebx
 19c:	74 1e                	je     1bc <init_module+0x6b>
 19e:	68 d0 00 00 00       	push   $0xd0
 1a3:	b9 00 10 00 00       	mov    $0x1000,%ecx
 1a8:	89 f2                	mov    %esi,%edx
 1aa:	b8 51 01 00 00       	mov    $0x151,%eax
 1af:	57                   	push   %edi
 1b0:	ff 13                	call   *(%ebx)
 1b2:	83 c3 04             	add    $0x4,%ebx
 1b5:	83 3b 00             	cmpl   $0x0,(%ebx)
 1b8:	5a                   	pop    %edx
 1b9:	59                   	pop    %ecx
 1ba:	eb e0                	jmp    19c <init_module+0x4b>
 1bc:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
 1c2:	ba d0 00 00 00       	mov    $0xd0,%edx
 1c7:	b8 30 0c 00 00       	mov    $0xc30,%eax
 1cc:	e8 fc ff ff ff       	call   1cd <init_module+0x7c>
 1d1:	8b 2d 34 0c 00 00    	mov    0xc34,%ebp
 1d7:	83 3d 04 00 00 00 00 	cmpl   $0x0,0x4
 1de:	89 c7                	mov    %eax,%edi
 1e0:	74 28                	je     20a <init_module+0xb9>
 1e2:	8b 1d 10 00 00 00    	mov    0x10,%ebx
 1e8:	85 db                	test   %ebx,%ebx
 1ea:	74 1e                	je     20a <init_module+0xb9>
 1ec:	68 d0 00 00 00       	push   $0xd0
 1f1:	b9 00 10 00 00       	mov    $0x1000,%ecx
 1f6:	b8 bc 01 00 00       	mov    $0x1bc,%eax
 1fb:	89 fa                	mov    %edi,%edx
 1fd:	55                   	push   %ebp
 1fe:	ff 13                	call   *(%ebx)
 200:	83 c3 04             	add    $0x4,%ebx
 203:	83 3b 00             	cmpl   $0x0,(%ebx)
 206:	59                   	pop    %ecx
 207:	58                   	pop    %eax
 208:	eb e0                	jmp    1ea <init_module+0x99>
 20a:	89 3c 24             	mov    %edi,(%esp)
 20d:	57                   	push   %edi
 20e:	56                   	push   %esi
 20f:	68 c1 00 00 00       	push   $0xc1
 214:	e8 fc ff ff ff       	call   215 <init_module+0xc4>
 219:	89 f0                	mov    %esi,%eax
 21b:	e8 fc ff ff ff       	call   21c <init_module+0xcb>
 220:	8b 18                	mov    (%eax),%ebx
 222:	53                   	push   %ebx
 223:	68 d6 00 00 00       	push   $0xd6
 228:	e8 fc ff ff ff       	call   229 <init_module+0xd8>
 22d:	8b 44 24 14          	mov    0x14(%esp),%eax
 231:	e8 fc ff ff ff       	call   232 <init_module+0xe1>
 236:	89 18                	mov    %ebx,(%eax)
 238:	8b 44 24 14          	mov    0x14(%esp),%eax
 23c:	bb ef be ad de       	mov    $0xdeadbeef,%ebx
 241:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
 247:	8b 44 24 14          	mov    0x14(%esp),%eax
 24b:	0f 01 38             	invlpg (%eax)
 24e:	ff 15 00 00 00 00    	call   *0x0
 254:	89 c1                	mov    %eax,%ecx
 256:	ff 15 08 00 00 00    	call   *0x8
 25c:	0f 20 e0             	mov    %cr4,%eax
 25f:	89 c2                	mov    %eax,%edx
 261:	80 e2 7f             	and    $0x7f,%dl
 264:	0f 22 e2             	mov    %edx,%cr4
 267:	0f 22 e0             	mov    %eax,%cr4
 26a:	89 c8                	mov    %ecx,%eax
 26c:	ff 15 04 00 00 00    	call   *0x4
 272:	8b 44 24 14          	mov    0x14(%esp),%eax
 276:	e8 fc ff ff ff       	call   277 <init_module+0x126>
 27b:	8b 44 24 14          	mov    0x14(%esp),%eax
 27f:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
 285:	8b 44 24 14          	mov    0x14(%esp),%eax
 289:	ff 30                	pushl  (%eax)
 28b:	ff 36                	pushl  (%esi)
 28d:	68 ea 00 00 00       	push   $0xea
 292:	e8 fc ff ff ff       	call   293 <init_module+0x142>
 297:	31 c0                	xor    %eax,%eax
 299:	83 c4 24             	add    $0x24,%esp
 29c:	5b                   	pop    %ebx
 29d:	5e                   	pop    %esi
 29e:	5f                   	pop    %edi
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	00 00                	add    %al,(%eax)
	...
