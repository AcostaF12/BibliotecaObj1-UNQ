!classDefinition: #BibliotecaTests category: 'TrabajoFinal-AcostaUribarri'!
TestCase subclass: #BibliotecaTests
	instanceVariableNames: 'bibliotecaRecienCreada harryPotterEjemplarUno temario1 harryPotter2EjemplarUno harryPotterEjemplarDos harryPotter2EjemplarDos elSeñorDeLosAnillosEjemplarUno temario2 jumanjiEjemplarUno temario3 temario4 cienAñosDeSoledadEjemplarUno socioMaximo socioGaston socioBianca escritor elLibroDeLaSelvaEjemplarUno temario5 lector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!BibliotecaTests methodsFor: 'factory-methods' stamp: 'FA 12/7/2022 15:45:32'!
bibliotecaRegistraTodosLosLibros

	bibliotecaRecienCreada retrocederReloj: (10 * year).
	bibliotecaRecienCreada registrarLibro: elSeñorDeLosAnillosEjemplarUno conPrioridad: 0.
	bibliotecaRecienCreada registrarLibro: harryPotterEjemplarUno conPrioridad: 1.
	bibliotecaRecienCreada avanzarReloj: (5 * year).
	bibliotecaRecienCreada registrarLibro: harryPotter2EjemplarUno conPrioridad: 2.
	bibliotecaRecienCreada registrarLibro: jumanjiEjemplarUno conPrioridad: 0.
	bibliotecaRecienCreada registrarLibro: elLibroDeLaSelvaEjemplarUno conPrioridad: 0.
	bibliotecaRecienCreada avanzarReloj: (5 * year).
	bibliotecaRecienCreada registrarLibro: harryPotter2EjemplarDos conPrioridad: 2.
	bibliotecaRecienCreada registrarLibro: harryPotterEjemplarDos conPrioridad: 1.
	bibliotecaRecienCreada registrarLibro: cienAñosDeSoledadEjemplarUno conPrioridad: 2.! !

!BibliotecaTests methodsFor: 'factory-methods' stamp: 'FA 12/7/2022 14:49:28'!
bibliotecaRegistraTodosLosSocios

	bibliotecaRecienCreada retrocederReloj: 2 * year.
	bibliotecaRecienCreada registrarSocioConNombre: 'Maximo Prieto' conDNI: 20000000.
	bibliotecaRecienCreada avanzarReloj: 1 * year.
	bibliotecaRecienCreada registrarSocioConNombre: 'Gaston Testay' conDNI: 30000000.
	bibliotecaRecienCreada avanzarReloj: 1 * year.
	bibliotecaRecienCreada registrarSocioConNombre: 'Bianca Osores' conDNI: 40000000.
	socioMaximo _ bibliotecaRecienCreada socioConDNI: 20000000.
	socioGaston _ bibliotecaRecienCreada socioConDNI: 30000000.
	socioBianca _ bibliotecaRecienCreada socioConDNI: 40000000.
	! !


!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'GDU 12/3/2022 21:06:45'!
test001_CuandoSeLePreguntaAUnaBibliotecaSinSociosSiTieneSociosRegistradosDevuelveFalso
	
	self assert: bibliotecaRecienCreada sociosRegistrados isEmpty! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 11/10/2022 23:55:36'!
test002_cuandoSeLePreguntaAUnaBibliotecaConUnSocioRegistradoSiTieneSociosRegistradosDevuelveVerdadero
	
	self bibliotecaRegistraTodosLosSocios.
	
	self deny: bibliotecaRecienCreada sociosRegistrados isEmpty! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 11/27/2022 18:59:57'!
test003_cuandoSeLePreguntaAUnaBibliotecaSinLibrosRegistradosSiTieneLibrosRegistradosDevuelveFalso
	
	self assert: bibliotecaRecienCreada librosRegistrados isEmpty! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/2/2022 20:57:30'!
test004_cuandoSeLePreguntaAUnaBibliotecaConLibrosRegistradosSiTieneLibrosRegistradosDevuelveVerdadero
	
	self bibliotecaRegistraTodosLosLibros.
	
	self deny: bibliotecaRecienCreada librosRegistrados isEmpty! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 14:25:46'!
test005_cuandoSeIntentaAgregarDosLibrosConElMismoIsbnLaCantidadDeLibrosRegistradosEsUna
	
	bibliotecaRecienCreada registrarLibro: harryPotterEjemplarUno conPrioridad: 1.
	
	self assert: bibliotecaRecienCreada librosRegistrados size equals: 1.
	self 
		should: [bibliotecaRecienCreada registrarLibro: harryPotterEjemplarUno conPrioridad: 1]
		raise: Error
		withMessageText: 'Este libro ya esta registrado'.! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 14:25:46'!
test006_cuandoAUnaBibliotecaSeLeRegistraOtroEjemplarDeUnLibroRegistradoLaCantidadDeEjemplaresDeDichoLibroAumenta
	
	bibliotecaRecienCreada registrarLibro: harryPotterEjemplarUno conPrioridad: 1.
	bibliotecaRecienCreada registrarLibro: harryPotterEjemplarDos conPrioridad: 1.
	
	self assert: (bibliotecaRecienCreada cantidadEjemplaresDe: harryPotterEjemplarUno) equals: 2! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 14:25:46'!
test008_cuandoSeAgregaUnEjemplarDeUnLibroYSeLePreguntaALaBibliotecaCualEsSuNumeroDeInventarioLoDevuelve
	
	bibliotecaRecienCreada registrarLibro: harryPotterEjemplarUno conPrioridad: 1.
	
	self assert: (bibliotecaRecienCreada numeroDeInventarioDe: harryPotterEjemplarUno) equals: 1.
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:30:47'!
test009_CuandoUnaBibliotecaFiltraLosLibrosPorUnAutorEspecificoLaBibliotecaLosDevuelve

	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorAutor: 'JKRowling' .
	
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarDos.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotter2EjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotter2EjemplarDos.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 4.! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:30:40'!
test010_CuandoUnaBibliotecaFiltraLosLibrosPorUnaListaDeTemasEspecificosLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorTemario: 'Suspenso'.
	
	self assert: filtro librosFiltradosHastaAhora includes: cienAñosDeSoledadEjemplarUno.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 1.
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:30:31'!
test011_CuandoUnaBibliotecaFiltraLosLibrosPorUnaFechaDePublicacionLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorFechaDePublicacionEntre: December/15/1980 y: December/20/1985.
	
	self assert: filtro librosFiltradosHastaAhora includes: jumanjiEjemplarUno.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 1.
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:31:35'!
test012_CuandoUnaBibliotecaFiltraLosLibrosPorUnIdiomaEspecificoLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorIdioma: 'Español'.
	
	self assert: filtro librosFiltradosHastaAhora includes: jumanjiEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: cienAñosDeSoledadEjemplarUno.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 2.
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 17:11:07'!
test013_CuandoUnaBibliotecaFiltraLosLibrosPorUnaCantidadDeEjemplaresLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorCantidadDeEjemplares: 1.
	
	self assert: filtro librosFiltradosHastaAhora includes: jumanjiEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: cienAñosDeSoledadEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: elSeñorDeLosAnillosEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: elLibroDeLaSelvaEjemplarUno.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 4.
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:42:15'!
test014_CuandoSeFiltraLosLibrosPorUnAutorYTemarioEspecificoLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorAutor: 'JKRowling' .
	filtro filtrarLibrosPorTemario: 'Magia'.
	
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarDos.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotter2EjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotter2EjemplarDos.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 4.
	
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:44:34'!
test015_CuandoSeFiltraLosLibrosPorUnAutorYCantidadDeEjemplaresYIdiomaEspecificoLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorAutor: 'JKRowling' .
	filtro filtrarLibrosPorCantidadDeEjemplares: '1'.
	filtro filtrarLibrosPorIdioma: 'Ingles'.
	
	self assert: filtro librosFiltradosHastaAhora isEmpty.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 0.
	
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:46:56'!
test016_CuandoSeFiltraLosLibrosPorUnAutorYCantidadDeEjemplaresYIdiomaEspecificoYFechaDePublicacionLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorAutor: 'JKRowling' .
	filtro filtrarLibrosPorCantidadDeEjemplares: 2.
	filtro filtrarLibrosPorIdioma: 'Ingles'.
	filtro filtrarLibrosPorFechaDePublicacionEntre: June/2/2000 y: June/2/2001.
	
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarDos.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 2.
	
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/5/2022 19:47:18'!
test017_CuandoSeFiltraLosLibrosPorUnAutorYCantidadDeEjemplaresYIdiomaEspecificoYFechaDePublicacionYTemarioLaBibliotecaLosDevuelve
	
	| filtro |
	self bibliotecaRegistraTodosLosLibros.
	filtro _ (FiltrosDeLibros initializePara: bibliotecaRecienCreada).
	
	filtro filtrarLibrosPorAutor: 'JKRowling' .
	filtro filtrarLibrosPorCantidadDeEjemplares: 2.
	filtro filtrarLibrosPorIdioma: 'Ingles'.
	filtro filtrarLibrosPorFechaDePublicacionEntre: June/2/2000 y: June/2/2001.
	filtro filtrarLibrosPorTemario: 'Magia'.
	
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarUno.
	self assert: filtro librosFiltradosHastaAhora includes: harryPotterEjemplarDos.
	self assert: filtro cantidadDeLibrosFiltradosHastaAhora equals: 2.
	
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 17:16:39'!
test018_UnaBibliotecaConoceASusSociosSancionadosCuandoNoTieneNinguno

	self bibliotecaRegistraTodosLosSocios.	
	
	self assert: (bibliotecaRecienCreada sociosSancionados) isEmpty.
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 17:16:53'!
test019_UnaBibliotecaConoceASusSociosSancionadosCuandoTieneDos

	self bibliotecaRegistraTodosLosSocios.	
	bibliotecaRecienCreada sancionarA: socioMaximo.
	bibliotecaRecienCreada sancionarA: socioGaston.
	
	self assert: (bibliotecaRecienCreada sociosSancionados) includes: socioMaximo.
	self assert: (bibliotecaRecienCreada sociosSancionados) includes: socioGaston.! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 17:17:07'!
test020_UnaBibliotecaConoceASusSociosSolidariosCuandoNoTieneNinguno

	self bibliotecaRegistraTodosLosSocios.	
	self bibliotecaRegistraTodosLosLibros.
	
	self assert: bibliotecaRecienCreada sociosSolidarios isEmpty.
	! !

!BibliotecaTests methodsFor: 'biblioteca-tests' stamp: 'FA 12/7/2022 17:17:12'!
test021_UnaBibliotecaConoceASusSociosSolidariosCuandoTieneDos

	self bibliotecaRegistraTodosLosSocios.	
	self bibliotecaRegistraTodosLosLibros.
	
	socioGaston solicitarRenovacionDeMembresia.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
		
	socioGaston pedirPrestamoConvencionalDe: harryPotterEjemplarDos hasta: (FixedGregorianDate today next: 1 * week).
	
	socioBianca devolverLibro: harryPotterEjemplarUno .
	socioGaston devolverLibro: harryPotterEjemplarDos .
	
	self assert: bibliotecaRecienCreada sociosSolidarios size equals: 2.
	self assert: bibliotecaRecienCreada sociosSolidarios includes: socioBianca.
	self assert: bibliotecaRecienCreada sociosSolidarios includes: socioGaston.
	
	! !


!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:13:35'!
test001_UnSocioConoceSuBibliotecaEnLaQueFueRegistrado
	
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: socioBianca bibliotecaDeRegistro equals: bibliotecaRecienCreada.
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:13:54'!
test002_UnSocioConoceSuDNI
	
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: socioMaximo numeroDeDNI equals: 20000000.
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:13:59'!
test003_UnSocioConoceSuNombreYApellido
	
	| nombreYApellidoEsperado |
	nombreYApellidoEsperado _ 'Maximo Prieto'.
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: socioMaximo nombreYApellido equals: nombreYApellidoEsperado.
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:14:05'!
test004_UnSocioConoceSuFechaDeRegistro
	
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: socioMaximo fechaDeRegistro equals: (FixedGregorianDate today previous: 2 * year).
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:14:10'!
test005_CuandoSeRegistraUnSocioSeLeAsignaUnaMembresiaDeUnAño
	
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: (socioGaston expiracionDeMembresia) equals: (FixedGregorianDate today). 
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:14:21'!
test006_CuandoSeLePreguntaAUnSocioRecienInscriptoSiSuMembresiaExpiroEsteRetornaFalso
	
	self bibliotecaRegistraTodosLosSocios.
	
	self deny: socioBianca tieneMembresiaExpirada.
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:14:37'!
test007_CuandoSeLePreguntaAUnSocioInscriptoSiSuMembresiaExpiroEsteRetornaVerdadero
	
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: socioMaximo tieneMembresiaExpirada.
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:17:53'!
test008_CuandoUnSocioRenuevaSuMembresiaLaMismaExtiendeSuVigenciaPorUnAño
	
	self bibliotecaRegistraTodosLosSocios.
	
	socioGaston solicitarRenovacionDeMembresia.
	
	self assert: socioGaston expiracionDeMembresia equals: (FixedGregorianDate today next: 1 * year).
	
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:18:02'!
test009_CuandoUnSocioIntentaRenovarSuMembresiaAntesDeLaFechaDeExpiraciónNoPuede
	
	self bibliotecaRegistraTodosLosSocios.
	
	self
		should: [socioBianca solicitarRenovacionDeMembresia]
		raise: Error
		withMessageText: 'No podes renovar tu membresia, sigue vigente'.
	
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:19:23'!
test010_UnSocioConoceSusLibrosEnPrestamoCuandoNoTiene

	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: socioBianca librosEnPrestamo isEmpty.
	
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:15:15'!
test011_UnSocioConoceSusLibrosEnPrestamoCuandoTieneDos
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: FixedGregorianDate tomorrow.
	socioBianca pedirPrestamoConvencionalDe: harryPotter2EjemplarUno hasta: FixedGregorianDate tomorrow.
	
	self assert: socioBianca librosEnPrestamo includes: harryPotterEjemplarUno.
	self assert: socioBianca librosEnPrestamo includes: harryPotter2EjemplarUno.
	self assert: socioBianca cantidadDeLibrosEnPrestamo equals: 2.
	
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:20:05'!
test012_UnSocioSabeCuandoEsSancionadoPorUnaBiblioteca
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	bibliotecaRecienCreada sancionarA: socioMaximo.
	
	self assert: socioMaximo estaSancionado.
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:20:46'!
test013_UnSocioSabeCuandoEsVetadoPorUnaBiblioteca
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	bibliotecaRecienCreada vetarA: socioMaximo.
	
	self assert: socioMaximo estaVetado.
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:15:39'!
test014_UnSocioQueEstaVetadoNoPuedeSolicitarUnaRenovacionDeMembresia
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	bibliotecaRecienCreada vetarA: socioGaston.
	
	self should: [socioGaston solicitarRenovacionDeMembresia] 
		raise: Error
		withMessageText: 'No podes solicitar la renovacion de membresia, estas vetado'.
	
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:44:33'!
test015_UnSocioQueEstaVetadoNoPuedeSolicitarUnaNuevaRegistracionEnLaBiblioteca
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	bibliotecaRecienCreada vetarA: socioGaston.
	
	self should: [bibliotecaRecienCreada registrarSocioConNombre: 'Gaston Testay' conDNI: 30000000 ]
		raise: Error
		withMessageText: 'No podes volver a registrarte en la biblioteca porque tu DNI esta vetado'.
	
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:44:38'!
test016_UnSocioConoceLosPrestamosQueRecibioEnSuHistorialCuandoNoRecibioNinguno
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	self assert: socioBianca cantidadDeLibrosSolicitadosHistoricos equals: 0.
	
	
	
	! !

!BibliotecaTests methodsFor: 'socio-tests' stamp: 'FA 12/7/2022 15:44:43'!
test017_UnSocioConoceLosPrestamosQueRecibioEnSuHistorialCuandoRecibioDos
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: FixedGregorianDate tomorrow.
	socioBianca pedirPrestamoConvencionalDe: harryPotter2EjemplarUno hasta: FixedGregorianDate tomorrow.
	
	self assert: socioBianca cantidadDeLibrosSolicitadosHistoricos equals: 2.
	
	
	
	! !


!BibliotecaTests methodsFor: 'factory' stamp: 'GU 12/8/2022 16:02:56'!
setUp
	
	temario1 := Set with: 'Magia' with: 'Fantasia'.
	temario2 := Set with: 'Fantasia' with: 'Medieval'.
	temario3 := Set with: 'Infantil' with: 'Estrategia' with: 'Accion'.
	temario4 _ Set with: 'Suspenso'.
	temario5 _ Set with: 'Infantil' with: 'Fantasia'.
	
	harryPotterEjemplarUno := Libro conTitulo: 'Harry Potter' conIsbn: 000 conAutor: 'JKRowling' conFechaPublicacion: (June/2/2000) enIdioma: 'Ingles' conTemario: temario1.
	harryPotterEjemplarDos := Libro conTitulo: 'Harry Potter' conIsbn: 001 conAutor: 'JKRowling' conFechaPublicacion: (June/2/2000) enIdioma: 'Ingles' conTemario: temario1.
	harryPotter2EjemplarUno := Libro conTitulo: 'Harry Potter 2' conIsbn: 237 conAutor: 'JKRowling' conFechaPublicacion: (January/10/2007) enIdioma: 'Ingles' conTemario: temario1.
	harryPotter2EjemplarDos := Libro conTitulo: 'Harry Potter 2' conIsbn: 238 conAutor: 'JKRowling' conFechaPublicacion: (January/10/2007) enIdioma: 'Ingles' conTemario: temario1.
	elSeñorDeLosAnillosEjemplarUno := Libro conTitulo: 'El Señor de los Anillos' conIsbn: 407 conAutor: 'JRTolkien' conFechaPublicacion: (February/1/1970) enIdioma: 'Ingles' conTemario: temario2.
	jumanjiEjemplarUno := Libro conTitulo: 'Jumanji' conIsbn: 601 conAutor: 'Felipe' conFechaPublicacion: (December/15/1980) enIdioma: 'Español' conTemario: temario3.
	cienAñosDeSoledadEjemplarUno _ Libro conTitulo: 'Cien Años de Soledad' conIsbn: 705 conAutor: 'Gabriel Garcia Marquez' conFechaPublicacion: October/28/1997 enIdioma: 'Español' conTemario: temario4.
	elLibroDeLaSelvaEjemplarUno _ Libro conTitulo: 'El Libro de la Selva' conIsbn: 150 conAutor: 'Stephen King' conFechaPublicacion: June/10/2020 enIdioma: 'Frances' conTemario: temario5.
	
	bibliotecaRecienCreada := Biblioteca new.
	
	escritor := RegistradorDeLibroDeBiblioteca new.
	lector := LectorDeLibros new.! !


!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:12:00'!
test001_CuandoUnSocioPidePrestadoUnLibroDeUnaBibliotecaLaMismaSeLoOtorga

	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.

	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 	* week).

	self assert: socioBianca cantidadDeLibrosEnPrestamo equals: 1.
	self assert: socioBianca librosEnPrestamo includes: harryPotterEjemplarUno.! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:12:00'!
test002_CuandoUnSocioPidePrestadoDosLibrosDistintosDeUnaBibliotecaEstaSeLosOtorga
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: cienAñosDeSoledadEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).

	self assert: socioBianca cantidadDeLibrosEnPrestamo equals: 2.
	self assert: socioBianca librosEnPrestamo includes: cienAñosDeSoledadEjemplarUno.
	self assert: socioBianca librosEnPrestamo includes: harryPotterEjemplarUno.! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:37:39'!
test003_CuandoUnSocioPidePrestadoUnEjemplarDeUnLibroQueYaTieneDeUnaBibliotecaNoSeLoOtorga
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
	
	self
		should: [socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarDos hasta: (FixedGregorianDate 
				today next: 1 * week)]
		raise: Error
		withMessageText: 'Ya tienes el libro, no puedes volver a pedirlo'.
	
	
	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:11:59'!
test004_CuandoUnSocioPidePrestadoUnLibroDeUnaBibliotecaEstaRegistraElPrestamo
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
	
	self assert: (bibliotecaRecienCreada cantidadDePrestamosRegistrados) equals: 1.! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:11:59'!
test005_CuandoUnSocioPidePrestadoDosLibrosDeUnaBibliotecaEstaRegistraLosPrestamos
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
	socioBianca pedirPrestamoConvencionalDe: cienAñosDeSoledadEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
	
	self assert: (bibliotecaRecienCreada cantidadDePrestamosRegistrados) equals: 2.! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:33:23'!
test006_CuandoUnSocioPidePrestadoUnLibroYSuMembresiaEstaVencidaNoSeLeOtorgaElPrestamo
	
	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	self
		should: [socioMaximo pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate tomorrow)]
		raise: Error
		withMessageText: 'No es posible el prestamo, tu membresia esta expirada'.! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:45:09'!
test007_CuandoUnSocioQueTieneCincoLibrosEnPrestamoPidePrestadoUnLibroEsteUltimoNoSeLeOtorga

	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotter2EjemplarUno hasta: FixedGregorianDate tomorrow.
	socioBianca pedirPrestamoConvencionalDe: elLibroDeLaSelvaEjemplarUno hasta: FixedGregorianDate tomorrow.
	socioBianca pedirPrestamoConvencionalDe: cienAñosDeSoledadEjemplarUno hasta: FixedGregorianDate tomorrow.
	socioBianca pedirPrestamoConvencionalDe: jumanjiEjemplarUno hasta: FixedGregorianDate tomorrow.
	socioBianca pedirPrestamoConvencionalDe: elSeñorDeLosAnillosEjemplarUno hasta: FixedGregorianDate tomorrow.
	
	self 
		should: [socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: FixedGregorianDate tomorrow]
		raise: Error
		withMessageText: 'Ya tenes el numero maximo de libros prestados'.
	
	
	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:11:58'!
test008_CuandoUnSocioPidePrestadoUnLibroQueNoEstaEnInventarioEsteNoSeLeOtoroga

	self bibliotecaRegistraTodosLosSocios.
	
	self 
		should: [socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week)]
		raise: Error
		withMessageText: 'Mil disculpas, este libro no esta disponible'.
	
	
	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:46:51'!
test009_UnSocioPideUnPrestamoConvencionalYSeVerificaQueLaFechaDeVencimientoEsLaCorrecta

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: FixedGregorianDate tomorrow.
	
	self assert: (socioBianca prestamoDeLibro: harryPotterEjemplarUno) fechaDeVencimiento equals: FixedGregorianDate tomorrow.
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:46:59'!
test010_UnSocioPideUnPrestamoExtendidoYSeVerificaQueLaFechaDeVencimientoEsLaCorrecta

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: FixedGregorianDate tomorrow.
	
	self assert: (socioBianca prestamoDeLibro: harryPotterEjemplarUno) fechaDeVencimiento equals: FixedGregorianDate tomorrow.
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:12:00'!
test011_CuandoUnSocioPideRenovacionDeUnPrestamoConvencionalEstaSeLeOtorga

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	socioBianca pedirPrestamoConvencionalDe: harryPotter2EjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
	
	socioBianca solicitarRenovacionDePrestamoDeLibro: harryPotter2EjemplarUno .
	
	self assert: (socioBianca prestamoDeLibro: harryPotter2EjemplarUno) fechaDeVencimiento equals: (FixedGregorianDate today next: 2 * week)
	
	
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:52:36'!
test012_CuandoUnSocioPideRenovacionDeUnPrestamoExtendidoEstaNoSeLeOtorga

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	socioBianca pedirPrestamoExtendidoDe: harryPotterEjemplarUno hasta: FixedGregorianDate tomorrow.
	
	self should:[socioBianca solicitarRenovacionDePrestamoDeLibro: harryPotterEjemplarUno]	
		raise: Error
		withMessageText: 'Este tipo de prestamo no se puede renovar'.
	
	
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:50:39'!
test013_CuandoUnSocioPideRenovacionDeUnPrestamoConvencionalFueraDelPlazoDeEntregaNoSeLeOtorgaLaRenovacion

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: 	October/17/2022.
	
	self assert: (socioBianca prestamoDeLibro: harryPotterEjemplarUno) fechaDeVencimiento equals: October/17/2022.
	self should:[socioBianca solicitarRenovacionDePrestamoDeLibro: harryPotterEjemplarUno .]
		raise: Error
		withMessageText:  'No puedes realizar la renovación, estas fuera del plazo de devolución'.
	
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:50:44'!
test014_CuandoUnSocioDevuelveUnLibroLaBibliotecaLoVuelveATenerEnSuInventario

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: 	October/17/2022.
	
	socioBianca devolverLibro: harryPotterEjemplarUno .
	
	self assert: (bibliotecaRecienCreada tieneLibroEnInventario: harryPotterEjemplarUno).
	
	
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:50:50'!
test015_CuandoUnSocioDevuelveUnLibroEnElPlazoPrevistoLaBibliotecaNoLoSanciona

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: 	(FixedGregorianDate today next: 1 * week).
	
	socioBianca devolverLibro: harryPotterEjemplarUno .
	
	self deny: (socioBianca estaSancionado)
	
	
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:50:57'!
test016_CuandoUnSocioDevuelveUnLibroFueraDeLaFechaPrevistaLaBibliotecaLoSancionaAutomaticamente

	self bibliotecaRegistraTodosLosSocios.
	self bibliotecaRegistraTodosLosLibros.
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: 	October/17/2022.
	
	socioBianca devolverLibro: harryPotterEjemplarUno .
	
	self assert: (socioBianca estaSancionado)
	
	
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:51:06'!
test017_CuandoUnSocioQueEstaVetadoSolicitaUnPrestamoEsteNoSeLeConcede

	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	bibliotecaRecienCreada vetarA: socioBianca.

	self should: [socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week)]
	 raise: Error
	 withMessageText: 'No puedes solicitar un prestamo, estas vetado'.
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:51:16'!
test018_CuandoUnSocioSolicitaLaRenovacionDeUnPrestamoDeUnLibroConPrioridadCeroEstaNoSeOtorga

	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: jumanjiEjemplarUno hasta: FixedGregorianDate tomorrow.
	
	self should: [socioBianca solicitarRenovacionDePrestamoDeLibro: jumanjiEjemplarUno ]
	raise: Error
	withMessageText: 'No puedes solicitar la renovacion de este libro, tiene prioridad 0, no se puede renovar'.
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:51:21'!
test019_CuandoUnSocioSolicitaLaRenovacionDeUnPrestamoDeUnLibroConPrioridadUnoEstaSeOtorgaPorUnDia

	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotterEjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
			
	socioBianca solicitarRenovacionDePrestamoDeLibro: harryPotterEjemplarUno .
	
	self assert: ((socioBianca prestamoDeLibro: harryPotterEjemplarUno) fechaDeVencimiento) equals: (FixedGregorianDate today next: 8 * day).
	
	

	! !

!BibliotecaTests methodsFor: 'prestamo-tests' stamp: 'FA 12/7/2022 15:51:37'!
test020_CuandoUnSocioSolicitaLaRenovacionDeUnPrestamoDeUnLibroConPrioridadDosEstaSeOtorgaNormalmente

	self bibliotecaRegistraTodosLosLibros.
	self bibliotecaRegistraTodosLosSocios.
	
	socioBianca pedirPrestamoConvencionalDe: harryPotter2EjemplarUno hasta: (FixedGregorianDate today next: 1 * week).
			
	socioBianca solicitarRenovacionDePrestamoDeLibro: harryPotter2EjemplarUno .
	
	self assert: (socioBianca prestamoDeLibro: harryPotter2EjemplarUno) fechaDeVencimiento equals: (FixedGregorianDate today next: 2 * week)	.
	

	! !


!BibliotecaTests methodsFor: 'lector-tests' stamp: 'GU 12/8/2022 16:04:46'!
test01SeIgnoraLaCabeceraAlLeerElArchivo

	| streamDeLibros libros |
	streamDeLibros _ (ReadStream on: 'ISBN, Autor, Titulo, Idioma, Fecha, Temario, Prioridad, Cant. Ejemplares, Cant. Prestamos').
	
	libros _ lector leer: streamDeLibros.
	
	Assert isTrue: libros isEmpty! !


!BibliotecaTests methodsFor: 'archivo-tests' stamp: 'GU 12/8/2022 16:37:01'!
test001CuandoNoHayLibrosSoloSeImprimeLaCabeceraSinElCuerpo

	| streamDeLibros |
	streamDeLibros _ ArchivoDeMentiraLibros new.
	
	escritor escribirEn: streamDeLibros los: {} de: unaBiblioteca.

	self assert: (streamDeLibros contenidos) equals: 'ISBN, Autor, Titulo, Idioma, Fecha, Temario, Prioridad, Cant. Ejemplares, Cant. Prestamos'! !

!BibliotecaTests methodsFor: 'archivo-tests' stamp: 'GU 12/8/2022 16:04:59'!
test002SeRegistraUnLibroDesdeUnArchivo

	| unArchivo |
	
	unArchivo _ ArchivoDeMentiraLibros new.
	unArchivo forceWriteStreamDo: [:s | 
		s nextPutAll: 'ISBN, Autor, Titulo, Idioma, Fecha, Temario, Prioridad'.
		s newLine.
		s nextPutAll: '950,Stephen King,Tarzan,Aleman,20/October/2008,Infantil Fantasia, 1'
		].
	
	bibliotecaRecienCreada registrarUnLibroUsando: unArchivo.

	self assert: bibliotecaRecienCreada tieneLibros.
	! !

!BibliotecaTests methodsFor: 'archivo-tests' stamp: 'GU 12/8/2022 16:53:28'!
test003SeEscribenEnUnArchivoVariosLibros

	| streamDeLibros unLibro contenidoEsperado |
	
	self bibliotecaRegistraTodosLosLibros.
	unLibro _ jumanjiEjemplarUno. 

	contenidoEsperado _
'ISBN, Autor, Titulo, Idioma, Fecha, Temario, Prioridad, Cant. Ejemplares, Cant. Prestamos
601,Felipe,Jumanji,Español,December 15, 1980,a Set(''Estrategia'' ''Accion'' ''Infantil''),1,0,0'.

	streamDeLibros _ ArchivoDeMentiraLibros new.
	
	escritor escribirEn: streamDeLibros los: {unLibro} de: bibliotecaRecienCreada.

	self assert: streamDeLibros contenidos equals: contenidoEsperado.
	! !


!BibliotecaTests methodsFor: 'libro-tests' stamp: 'FA 12/7/2022 14:45:26'!
test001_UnEjemplarDeUnLibroConoceSuNumeroISBN

	self bibliotecaRegistraTodosLosLibros.
	
	self assert: ((bibliotecaRecienCreada libroConIsbn: 000) isbn) equals: 000.! !

!BibliotecaTests methodsFor: 'libro-tests' stamp: 'FA 12/7/2022 14:46:30'!
test002_UnEjemplarDeUnLibroConoceSuFechaDeRegistro
	
	self bibliotecaRegistraTodosLosLibros.
	
	self assert: ((bibliotecaRecienCreada libroConIsbn: 000) fechaDeRegistro) equals: (FixedGregorianDate today previous: 10 * year).! !

!BibliotecaTests methodsFor: 'libro-tests' stamp: 'FA 12/7/2022 14:46:35'!
test003_UnEjemplarDeUnLibroConoceSuTemario

	self bibliotecaRegistraTodosLosLibros.
	
	self assert: ((bibliotecaRecienCreada libroConIsbn: 000) listaDeTemario) includes: 'Magia'.
	self assert: ((bibliotecaRecienCreada libroConIsbn: 000) listaDeTemario) includes: 'Fantasia'.! !

!BibliotecaTests methodsFor: 'libro-tests' stamp: 'FA 12/7/2022 14:46:40'!
test004_UnEjemplarDeUnLibroConoceSuPrioridad
	
	self bibliotecaRegistraTodosLosLibros.
	
	self assert: ((bibliotecaRecienCreada libroConIsbn: 000) prioridad) equals: 1.! !


!classDefinition: #ArchivoDeMentiraLibros category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #ArchivoDeMentiraLibros
	instanceVariableNames: 'contenido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!ArchivoDeMentiraLibros methodsFor: 'initialize' stamp: 'GU 12/6/2022 20:55:48'!
initialize
	
	contenido _ ReadWriteStream on: ''.! !


!ArchivoDeMentiraLibros methodsFor: 'accessing' stamp: 'GU 12/6/2022 20:56:35'!
contenidos
	
	^ contenido contents.! !


!ArchivoDeMentiraLibros methodsFor: 'action' stamp: 'GU 12/6/2022 21:03:32'!
forceWriteStreamDo: aBlockClosure 
	
	aBlockClosure value: contenido .! !


!classDefinition: #Biblioteca category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #Biblioteca
	instanceVariableNames: 'sociosRegistrados librosRegistrados inventario ultimoCodigoDeInventario prestamosEfectuados listaNegra reloj'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!Biblioteca methodsFor: 'accessing' stamp: 'GU 12/8/2022 16:49:11'!
cantidadDePrestamosDeLibro: unLibro 
	
	^ (sociosRegistrados select: [:unSocio | unSocio tieneElLibro: unLibro]) size.! !

!Biblioteca methodsFor: 'accessing' stamp: 'GDU 11/4/2022 16:07:09'!
inventario
	
	^inventario! !

!Biblioteca methodsFor: 'accessing' stamp: 'GDU 11/3/2022 17:04:23'!
librosRegistrados
	
	^librosRegistrados! !

!Biblioteca methodsFor: 'accessing' stamp: 'GDU 12/3/2022 20:59:29'!
listaNegra
	
	^listaNegra! !

!Biblioteca methodsFor: 'accessing' stamp: 'FA 12/7/2022 15:04:13'!
reloj
	^ reloj.! !

!Biblioteca methodsFor: 'accessing' stamp: 'FA 11/9/2022 17:13:25'!
socioConDNI: unDNI 
	^ sociosRegistrados detect: [: unSocio | unSocio tieneDNI: unDNI].! !

!Biblioteca methodsFor: 'accessing' stamp: 'GDU 11/3/2022 16:28:04'!
sociosRegistrados
	
	^sociosRegistrados! !

!Biblioteca methodsFor: 'accessing' stamp: 'GDU 11/13/2022 14:58:01'!
sociosSancionados
	
	^ sociosRegistrados select:[:unSocio | unSocio estaSancionado]! !


!Biblioteca methodsFor: 'initialize' stamp: 'FA 12/7/2022 14:24:19'!
initialize
	
	sociosRegistrados := Set new.
	librosRegistrados := Set new.
	inventario := Dictionary new.
	ultimoCodigoDeInventario := 0.
	prestamosEfectuados _ OrderedCollection new.
	listaNegra := Set new.
	reloj _ FixedGregorianDate today.! !


!Biblioteca methodsFor: 'actions' stamp: 'GDU 12/3/2022 20:59:48'!
agregarAListaNegra: unDNI 
	
	listaNegra add: unDNI ! !

!Biblioteca methodsFor: 'actions' stamp: 'GU 11/28/2022 19:23:20'!
agregarLibroAInventario: unLibro

	inventario at: self siguienteCodigoDeInventario put: unLibro! !

!Biblioteca methodsFor: 'actions' stamp: 'GU 11/28/2022 19:22:21'!
agregarLibroARegistro: unLibro 
	librosRegistrados add: unLibro.! !

!Biblioteca methodsFor: 'actions' stamp: 'GDU 12/3/2022 20:42:23'!
eliminarSocioDeListaDeRegistro: unSocio 
	
	sociosRegistrados remove: unSocio.! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 14:30:51'!
generarSocioConNombre: conNombre yDNI: unDNI   
	^ Socio conNombreYApellido: conNombre dni: unDNI enBiblioteca: self.! !

!Biblioteca methodsFor: 'actions' stamp: 'GU 11/28/2022 20:10:27'!
noSancionarA: unSocio 
	
	.! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 17:29:17'!
otorgarPrestamoConvencionalA: unSocio sobreLibro: unLibro hasta: unaFecha

	(VerificadorDePrestamos new) realizarVerificacionesPara: self sobre: unLibro conSocio: unSocio.

	inventario removeKey: (self numeroDeInventarioDe: unLibro).
	unSocio agregarLibroPrestado: unLibro.
	
	self registrarPrestamo: (PrestamoConvencional de: unLibro a: unSocio enFecha: reloj hasta: unaFecha).! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 17:29:22'!
otorgarPrestamoExtendidoA: unSocio sobreLibro: unLibro hasta: unaFecha

	(VerificadorDePrestamos new) realizarVerificacionesPara: self sobre: unLibro conSocio: unSocio.

	inventario removeKey: (self numeroDeInventarioDe: unLibro).
	unSocio agregarLibroPrestado: unLibro.
	
	self registrarPrestamo: (PrestamoExtendido de: unLibro a: unSocio enFecha: reloj hasta: unaFecha).! !

!Biblioteca methodsFor: 'actions' stamp: 'GDU 11/20/2022 17:51:35'!
prestamoDe: unLibro sobre: unSocio

	^ prestamosEfectuados detect:[:unPrestamo| (unPrestamo socio = unSocio) & (unPrestamo libro = unLibro)]! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 12:10:23'!
recibirDevolucionDeLibro: unLibro por: unSocio .
	
	self agregarLibroAInventario: unLibro.
	EstadoDeDevolucionDeLibro para: unSocio conLibro: unLibro enFecha: FixedGregorianDate today en: self.! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 14:25:46'!
registrarLibro: unLibro conPrioridad: unaPrioridad 
	
	(VerificadorDeRegistroDeLibro new) realizarVerificacionesPara: self sobre: unLibro.
	
	self agregarLibroARegistro: unLibro.
	unLibro asignarFechaDeRegistro: reloj.
	self agregarLibroAInventario: unLibro.
	
	unLibro asignarPrioridad: unaPrioridad.! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/2/2022 20:56:10'!
registrarPrestamo: unPrestamo 
	prestamosEfectuados add: unPrestamo.! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 15:03:32'!
registrarSocioConNombre: unNombre conDNI: unDNI   
	| socioARegistrar |
	(VerificadorDeRegistroDeSocio new) realizarVerificacionesPara: self sobre: unDNI.
	socioARegistrar _ self generarSocioConNombre: unNombre yDNI: unDNI.
	sociosRegistrados add: (socioARegistrar).
	! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/8/2022 17:43:35'!
registrarUnLibroUsando: unArchivo 
	
	| libros |
	
	libros := LectorDeLibros new leer: unArchivo contenidos.
	
	libros do:[:libro | self registrarLibro: libro conPrioridad: (LectorDeLibros new leerPrioridadDe: libro)].! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 15:11:21'!
renovarMembresiaDe: unSocio  

	(VerificadorDeRenovacionDeMembresia new) realizarVerificacionesPara: self sobre: unSocio enFecha: reloj.
	
	unSocio actualizarMembresiaEnFecha: reloj.! !

!Biblioteca methodsFor: 'actions' stamp: 'FA 12/7/2022 15:07:56'!
renovarPrestamoPara: unSocio de: unLibro  
	
	(VerificadorDeRenovacionDePrestamo new) realizarVerificacionesPara: self sobre: unLibro de: unSocio enFecha: reloj.
	
	EstadoDePrioridadDeLibro para: unSocio con: unLibro enFecha: reloj en: self.! !

!Biblioteca methodsFor: 'actions' stamp: 'GU 11/28/2022 19:59:43'!
sancionarA: unSocio 
	
	unSocio aplicarSancion.! !

!Biblioteca methodsFor: 'actions' stamp: 'GDU 12/3/2022 21:08:18'!
vetarA: unSocio 
	unSocio aplicarVeto.
	self eliminarSocioDeListaDeRegistro: unSocio.
	self agregarAListaNegra: unSocio numeroDeDNI. ! !


!Biblioteca methodsFor: 'evaluating' stamp: 'FA 11/8/2022 15:50:37'!
cantidadDePrestamosRegistrados
	^ prestamosEfectuados size.! !

!Biblioteca methodsFor: 'evaluating' stamp: 'FA 12/1/2022 16:03:43'!
cantidadDeSociosVetados
	^ self sociosVetados size.! !

!Biblioteca methodsFor: 'evaluating' stamp: 'GDU 11/3/2022 18:35:34'!
cantidadEjemplaresDe: unLibro 
	
	^ (librosRegistrados select:[:unLibroAVerificar| unLibroAVerificar titulo = unLibro titulo ]) size! !

!Biblioteca methodsFor: 'evaluating' stamp: 'FA 11/27/2022 19:07:21'!
libroConIsbn: unNumeroISBN 
	^ librosRegistrados detect: [: unLibro | unLibro numeroIsbn = unNumeroISBN].! !

!Biblioteca methodsFor: 'evaluating' stamp: 'GDU 11/4/2022 14:11:52'!
numeroDeInventarioDe: unLibro 
	
	^ inventario keyAtValue: unLibro.! !

!Biblioteca methodsFor: 'evaluating' stamp: 'FA 12/7/2022 15:29:36'!
prestamosDeSocio: unSocio 
	^ prestamosEfectuados select: [: unPrestamo | unPrestamo socio = unSocio].! !

!Biblioteca methodsFor: 'evaluating' stamp: 'GDU 11/4/2022 14:16:39'!
siguienteCodigoDeInventario
	
	ultimoCodigoDeInventario := ultimoCodigoDeInventario + 1.
	^ ultimoCodigoDeInventario ! !

!Biblioteca methodsFor: 'evaluating' stamp: 'FA 12/7/2022 15:31:44'!
sociosSolidarios
	"Se asume que los socios solidarios deben haber solicitado al menos 1 prestamo en algun momento, de lo contrario no existiria diferencia entre los socios normales y solidarios debido a que un socio pasa a estar 
				sancionado por el simple hecho de no entregar un prestamo en tiempo y forma"
	^ sociosRegistrados select: [: unSocio | (unSocio noEstaSancionado) & (unSocio cantidadDeLibrosSolicitadosHistoricos > 0)].! !


!Biblioteca methodsFor: 'testing' stamp: 'FA 12/7/2022 15:38:53'!
tieneElLibro: unLibro 
	^ librosRegistrados includes: unLibro.! !

!Biblioteca methodsFor: 'testing' stamp: 'FA 11/19/2022 16:06:22'!
tieneLibroEnInventario: unLibro 
	^ inventario includes: unLibro.! !

!Biblioteca methodsFor: 'testing' stamp: 'GU 12/7/2022 19:15:54'!
tieneLibros
	
	^ librosRegistrados notEmpty! !


!Biblioteca methodsFor: 'error' stamp: 'FA 11/28/2022 18:36:54'!
errorFueraDePlazoDevolucion
	self error: 'No puedes realizar la renovación, estas fuera del plazo de devolución'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 12/2/2022 20:07:11'!
errorLibroConPrioridad0
	self error: 'No puedes solicitar la renovacion de este libro, tiene prioridad 0, no se puede renovar'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 11/27/2022 20:21:32'!
errorLibroNoDisponible
	self error: 'Mil disculpas, este libro no esta disponible'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 11/27/2022 18:57:43'!
errorLibroYaRegistrado
	self error: 'Este libro ya esta registrado'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 11/27/2022 20:20:32'!
errorMaximoDeLibrosPrestados
	self error: 'Ya tenes el numero maximo de libros prestados'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 11/27/2022 20:32:13'!
errorMembresiaAunVigente
	^ self error: 'No podes renovar tu membresia, sigue vigente'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 11/27/2022 20:19:34'!
errorMembresiaExpirada
	self error: 'No es posible el prestamo, tu membresia esta expirada'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 12/1/2022 16:48:38'!
errorMembresiaSocioVetado
	self error: 'No podes solicitar la renovacion de membresia, estas vetado'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 11/23/2022 15:10:25'!
errorPrestamoLibroRepetido
	self error: 'Ya tienes el libro, no puedes volver a pedirlo'.! !

!Biblioteca methodsFor: 'error' stamp: 'FA 12/7/2022 15:22:06'!
errorPrestamoSocioVetado
	self error: 'No puedes solicitar un prestamo, estas vetado'.! !


!Biblioteca methodsFor: 'actions - private' stamp: 'FA 12/7/2022 14:35:12'!
avanzarReloj: unaCantidadDeTiempo 
	reloj _ (reloj next: unaCantidadDeTiempo).! !

!Biblioteca methodsFor: 'actions - private' stamp: 'FA 12/7/2022 14:34:50'!
retrocederReloj: unaCantidadDeTiempo
	reloj _ (reloj previous: unaCantidadDeTiempo).! !


!classDefinition: #EstadoDeDevolucionDeLibro category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #EstadoDeDevolucionDeLibro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!EstadoDeDevolucionDeLibro methodsFor: 'handle - double dispatch' stamp: 'GU 11/28/2022 19:56:04'!
gestionarSancionPara: unSocio en: unaBiblioteca 
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeDevolucionDeLibro class' category: 'TrabajoFinal-AcostaUribarri'!
EstadoDeDevolucionDeLibro class
	instanceVariableNames: ''!

!EstadoDeDevolucionDeLibro class methodsFor: 'can handle - double dispatch' stamp: 'GU 11/28/2022 19:35:59'!
para: unSocio conLibro: unLibro enFecha: unaFecha en: unaBiblioteca 
	
	^(self subclasses 
		detect: [: unEstadoDeEntrega | unEstadoDeEntrega puedeHacerseCargoDe: unSocio de: unaBiblioteca conLibro: unLibro enFecha: unaFecha]) new 
		gestionarSancionPara: unSocio en: unaBiblioteca. ! !

!EstadoDeDevolucionDeLibro class methodsFor: 'can handle - double dispatch' stamp: 'FA 12/2/2022 21:07:14'!
puedeHacerseCargoDe: unSocio de: unaBiblioteca conLibro: unLibro enFecha: unaFecha 
	self subclassResponsibility.! !


!classDefinition: #EntregaEnPlazo category: 'TrabajoFinal-AcostaUribarri'!
EstadoDeDevolucionDeLibro subclass: #EntregaEnPlazo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!EntregaEnPlazo methodsFor: 'handle - double dispatch' stamp: 'GU 11/28/2022 20:09:07'!
gestionarSancionPara: unSocio en: unaBiblioteca 
	
	unaBiblioteca noSancionarA: unSocio! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EntregaEnPlazo class' category: 'TrabajoFinal-AcostaUribarri'!
EntregaEnPlazo class
	instanceVariableNames: ''!

!EntregaEnPlazo class methodsFor: 'can-handle' stamp: 'GU 11/28/2022 20:08:37'!
puedeHacerseCargoDe: unSocio de: unaBiblioteca conLibro: unLibro enFecha: unaFecha 
	
	^ unaFecha <= (unaBiblioteca prestamoDe: unLibro sobre: unSocio) fechaDeVencimiento ! !


!classDefinition: #EntregaFueraDePlazo category: 'TrabajoFinal-AcostaUribarri'!
EstadoDeDevolucionDeLibro subclass: #EntregaFueraDePlazo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!EntregaFueraDePlazo methodsFor: 'handle - double dispatch' stamp: 'GU 11/28/2022 19:57:20'!
gestionarSancionPara: unSocio en: unaBiblioteca 
	
	unaBiblioteca sancionarA: unSocio! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EntregaFueraDePlazo class' category: 'TrabajoFinal-AcostaUribarri'!
EntregaFueraDePlazo class
	instanceVariableNames: ''!

!EntregaFueraDePlazo class methodsFor: 'can-handle' stamp: 'GU 11/28/2022 19:55:08'!
puedeHacerseCargoDe: unSocio de: unaBiblioteca conLibro: unLibro enFecha: unaFecha 
	
	^ unaFecha > (unaBiblioteca prestamoDe: unLibro sobre: unSocio) fechaDeVencimiento ! !


!classDefinition: #EstadoDePrioridadDeLibro category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #EstadoDePrioridadDeLibro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!EstadoDePrioridadDeLibro methodsFor: 'handle - double dispatch' stamp: 'FA 12/2/2022 20:47:58'!
gestionarRenovacionDe: unSocio con: unLibro 
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDePrioridadDeLibro class' category: 'TrabajoFinal-AcostaUribarri'!
EstadoDePrioridadDeLibro class
	instanceVariableNames: ''!

!EstadoDePrioridadDeLibro class methodsFor: 'can handle - double dispatch' stamp: 'FA 12/2/2022 20:30:57'!
para: unSocio con: unLibro enFecha: unaFecha en: unaBiblioteca 
	^ (self subclasses 
		detect: [: unEstadoDePrioridad | unEstadoDePrioridad puedeHacerseCargoDe: unSocio con: unLibro enFecha: unaFecha en: unaBiblioteca]) new
			gestionarRenovacionDe: unSocio con: unLibro.! !

!EstadoDePrioridadDeLibro class methodsFor: 'can handle - double dispatch' stamp: 'FA 12/2/2022 20:32:54'!
puedeHacerseCargoDe: unSocio con: unLibro enFecha: unaFecha en: unaBiblioteca 
	self subclassResponsibility.! !


!classDefinition: #EstadoDePrioridadDos category: 'TrabajoFinal-AcostaUribarri'!
EstadoDePrioridadDeLibro subclass: #EstadoDePrioridadDos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!EstadoDePrioridadDos methodsFor: 'handle - double dispatch' stamp: 'FA 12/2/2022 20:48:47'!
gestionarRenovacionDe: unSocio con: unLibro 
	^ (unSocio prestamoDeLibro: unLibro) renovar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDePrioridadDos class' category: 'TrabajoFinal-AcostaUribarri'!
EstadoDePrioridadDos class
	instanceVariableNames: ''!

!EstadoDePrioridadDos class methodsFor: 'can handle' stamp: 'FA 12/2/2022 20:45:47'!
puedeHacerseCargoDe: unSocio con: unLibro enFecha: unaFecha en: unaBiblioteca 
	^ unLibro prioridad = 2.! !


!classDefinition: #EstadoDePrioridadUno category: 'TrabajoFinal-AcostaUribarri'!
EstadoDePrioridadDeLibro subclass: #EstadoDePrioridadUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!EstadoDePrioridadUno methodsFor: 'handle - double dispatch' stamp: 'FA 12/2/2022 20:47:28'!
gestionarRenovacionDe: unSocio con: unLibro 
	^ (unSocio prestamoDeLibro: unLibro) renovarPorUnDia.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDePrioridadUno class' category: 'TrabajoFinal-AcostaUribarri'!
EstadoDePrioridadUno class
	instanceVariableNames: ''!

!EstadoDePrioridadUno class methodsFor: 'can handle' stamp: 'FA 12/2/2022 20:33:30'!
puedeHacerseCargoDe: unSocio con: unLibro enFecha: unaFecha en: unaBiblioteca 
	^ unLibro prioridad = 1.! !


!classDefinition: #FiltrosDeLibros category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #FiltrosDeLibros
	instanceVariableNames: 'librosFiltradosHastaAhora biblioteca'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!FiltrosDeLibros methodsFor: 'actions' stamp: 'FA 12/5/2022 19:18:54'!
filtrarLibrosPorAutor: unAutor   

	librosFiltradosHastaAhora _ (librosFiltradosHastaAhora select: [: unLibro | unLibro autor = unAutor]).! !

!FiltrosDeLibros methodsFor: 'actions' stamp: 'FA 12/5/2022 19:19:06'!
filtrarLibrosPorTemario: unTema
	librosFiltradosHastaAhora _ (librosFiltradosHastaAhora select: [: unLibro | unLibro listaDeTemario includes: unTema]).! !


!FiltrosDeLibros methodsFor: 'initialize' stamp: 'FA 12/5/2022 19:40:40'!
initializePara: unaBiblioteca 

	librosFiltradosHastaAhora := (unaBiblioteca inventario).
	biblioteca _ unaBiblioteca.! !


!FiltrosDeLibros methodsFor: 'accessing' stamp: 'FA 12/5/2022 19:00:45'!
librosFiltradosHastaAhora
	^ librosFiltradosHastaAhora.! !


!FiltrosDeLibros methodsFor: 'evaluating' stamp: 'FA 12/5/2022 19:01:10'!
cantidadDeLibrosFiltradosHastaAhora
	^ librosFiltradosHastaAhora size.! !

!FiltrosDeLibros methodsFor: 'evaluating' stamp: 'FA 12/5/2022 19:40:47'!
filtrarLibrosPorCantidadDeEjemplares: unaCantidadDeEjemplares 
	librosFiltradosHastaAhora _ librosFiltradosHastaAhora select: [: unLibro | (biblioteca cantidadEjemplaresDe: unLibro) = unaCantidadDeEjemplares].! !

!FiltrosDeLibros methodsFor: 'evaluating' stamp: 'FA 12/5/2022 19:29:45'!
filtrarLibrosPorFechaDePublicacionEntre: unaFechaDePublicacionInicial y: unaFechaDePublicacionFinal 
	librosFiltradosHastaAhora _ (librosFiltradosHastaAhora select: [: unLibro | (unLibro fecha >= unaFechaDePublicacionInicial) & (unLibro fecha <= unaFechaDePublicacionFinal)]).! !

!FiltrosDeLibros methodsFor: 'evaluating' stamp: 'FA 12/5/2022 19:32:25'!
filtrarLibrosPorIdioma: unIdioma 
	librosFiltradosHastaAhora _ librosFiltradosHastaAhora select: [: unLibro | unLibro idioma = unIdioma].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiltrosDeLibros class' category: 'TrabajoFinal-AcostaUribarri'!
FiltrosDeLibros class
	instanceVariableNames: ''!

!FiltrosDeLibros class methodsFor: 'instance creation' stamp: 'FA 12/5/2022 18:58:47'!
initializePara: unaBiblioteca 
	^ self new initializePara: unaBiblioteca. ! !


!classDefinition: #LectorDeLibros category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #LectorDeLibros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:22:04'!
leer: unStream 
	
	| contenido |
	
	contenido := unStream contents.
	^contenido lines select: [:linea | self esValida: linea ] thenCollect: [:linea | (self leerDe: linea)] ! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:34:24'!
leerAutorDe: columnas 
	
	^ columnas at: 2! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:31:22'!
leerDe: unaLinea 
	
	| unISBN unAutor unTitulo unIdioma unaFecha unTemario columnas |
	
	columnas _ unaLinea findTokens: self delimitador. 

	unISBN _ self leerISBNDeLibro: columnas.
	unTitulo _ self leerTituloDe: columnas.
	unAutor _ self leerAutorDe: columnas.
	unIdioma _ self leerIdiomaDe: columnas.
	unTemario _ self leerTemarioDe: columnas.
	unaFecha _ self leerFechaDe: columnas.
	
	^ Libro conTitulo: unTitulo conIsbn: unISBN conAutor: unAutor conFechaPublicacion: unaFecha enIdioma: unIdioma conTemario: unTemario.! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:58:48'!
leerFechaDe: columnas 
	
	^(columnas at: 5) asDate .! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:33:18'!
leerISBNDeLibro: columnas 
	
	^ columnas at: 1 asNumber! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:34:49'!
leerIdiomaDe: columnas 
	
	^ columnas at: 4! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 20:08:19'!
leerPrioridadDe: libro 
	
	^ libro prioridad! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:43:19'!
leerTemarioDe: columnas 
	
	^ (columnas at: 6 )substrings asSet ! !

!LectorDeLibros methodsFor: 'action' stamp: 'GU 12/7/2022 19:33:57'!
leerTituloDe: columnas 
	
	^ columnas at: 3.! !


!LectorDeLibros methodsFor: 'testing' stamp: 'GU 12/7/2022 19:13:25'!
esValida: unaLinea 
	
	^(self tieneLasColumnasCorrectas: unaLinea) and: [ self noEsCabecera: unaLinea]! !

!LectorDeLibros methodsFor: 'testing' stamp: 'GU 12/7/2022 19:25:43'!
noEsCabecera: unaLinea 
	
	^ (unaLinea includesSubString: 'ISBN, Autor, Titulo, Idioma, Fecha, Temario, Prioridad') not! !

!LectorDeLibros methodsFor: 'testing' stamp: 'GU 12/7/2022 19:23:19'!
tieneLasColumnasCorrectas: unaLinea 
	
	^ (unaLinea occurrencesOf: self delimitador) == self cantidadDeColumnas! !


!LectorDeLibros methodsFor: 'accessing' stamp: 'GU 12/7/2022 19:19:18'!
cantidadDeColumnas
	
	^ 6.! !

!LectorDeLibros methodsFor: 'accessing' stamp: 'GU 12/7/2022 19:24:26'!
delimitador
	
	^ $,! !


!classDefinition: #Libro category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #Libro
	instanceVariableNames: 'titulo isbn autor fecha idioma temario fechaDeRegistro prioridad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!Libro methodsFor: 'initialize' stamp: 'FA 12/7/2022 14:44:26'!
initializeConTitulo: unTitulo conIsbn: unNumeroIsbn conAutor: unAutor conFechaPublicacion: unaFecha enIdioma: unIdioma conTemario: unListaDeTemario 
	"Se asume que un libro no tiene prioridad por si mismo, es responsabilidad completa de la biblioteca"
	titulo := unTitulo.
	isbn := unNumeroIsbn.
	autor := unAutor.
	fecha := unaFecha.
	idioma := unIdioma.
	temario := unListaDeTemario.
	prioridad _ 2.! !


!Libro methodsFor: 'actions' stamp: 'GDU 11/3/2022 17:53:32'!
asignarFechaDeRegistro: unaFecha 
	
	fechaDeRegistro := unaFecha.! !

!Libro methodsFor: 'actions' stamp: 'FA 12/2/2022 19:56:37'!
asignarPrioridad: unaPrioridad
	prioridad _ unaPrioridad.! !


!Libro methodsFor: 'accessing' stamp: 'GDU 11/4/2022 15:15:33'!
autor
	
	^autor! !

!Libro methodsFor: 'accessing' stamp: 'FA 12/5/2022 19:23:57'!
fecha
	^ fecha.! !

!Libro methodsFor: 'accessing' stamp: 'GDU 11/4/2022 14:07:00'!
fechaDeRegistro
	
	^fechaDeRegistro! !

!Libro methodsFor: 'accessing' stamp: 'GDU 11/4/2022 15:50:26'!
idioma
	
	^idioma! !

!Libro methodsFor: 'accessing' stamp: 'FA 12/7/2022 14:45:46'!
isbn
	^ isbn.! !

!Libro methodsFor: 'accessing' stamp: 'FA 12/7/2022 14:44:26'!
listaDeTemario
	
	^temario! !

!Libro methodsFor: 'accessing' stamp: 'FA 12/7/2022 14:44:20'!
numeroIsbn
	
	^isbn! !

!Libro methodsFor: 'accessing' stamp: 'FA 12/2/2022 19:57:59'!
prioridad
	^ prioridad.! !

!Libro methodsFor: 'accessing' stamp: 'GDU 11/3/2022 18:35:46'!
titulo
	
	^titulo! !


!Libro methodsFor: 'testing' stamp: 'GDU 11/4/2022 15:46:32'!
fuePublicadoEntre: unaFechaDePublicacion y: otraFechaDePublicacion 
	
	^ (fecha >= unaFechaDePublicacion) & (fecha <= otraFechaDePublicacion)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Libro class' category: 'TrabajoFinal-AcostaUribarri'!
Libro class
	instanceVariableNames: ''!

!Libro class methodsFor: 'instance creation' stamp: 'GDU 11/3/2022 17:52:43'!
conTitulo: unTitulo conIsbn: unNumeroIsbn conAutor: unAutor conFechaPublicacion: unaFecha enIdioma: unIdioma conTemario: unListaDeTemario 
	
	^self new initializeConTitulo: unTitulo conIsbn: unNumeroIsbn conAutor: unAutor conFechaPublicacion: unaFecha enIdioma: unIdioma conTemario: unListaDeTemario ! !


!classDefinition: #Prestamo category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #Prestamo
	instanceVariableNames: 'libro socio fechaDeInicio fechaDeVencimiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!Prestamo methodsFor: 'initialize' stamp: 'GDU 11/20/2022 17:22:54'!
initializeSobre: unLibro a: unSocio enFecha: unaFecha hasta: otraFecha  
	^self subclassResponsibility ! !


!Prestamo methodsFor: 'accessing' stamp: 'GDU 11/20/2022 17:26:21'!
fechaDeVencimiento
	
	^fechaDeVencimiento! !

!Prestamo methodsFor: 'accessing' stamp: 'GDU 11/20/2022 16:31:07'!
libro
	
	^libro! !

!Prestamo methodsFor: 'accessing' stamp: 'GDU 11/20/2022 16:30:59'!
socio
	
	^socio! !


!Prestamo methodsFor: 'actions' stamp: 'GDU 11/20/2022 16:33:47'!
renovar
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prestamo class' category: 'TrabajoFinal-AcostaUribarri'!
Prestamo class
	instanceVariableNames: ''!

!Prestamo class methodsFor: 'instance creation' stamp: 'GDU 11/20/2022 17:13:04'!
de: unLibro a: unSocio enFecha: unaFecha hasta: otraFecha  
	^ self new initializeSobre: unLibro a: unSocio enFecha: unaFecha hasta: otraFecha. ! !


!classDefinition: #PrestamoConvencional category: 'TrabajoFinal-AcostaUribarri'!
Prestamo subclass: #PrestamoConvencional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!PrestamoConvencional methodsFor: 'actions' stamp: 'GDU 11/20/2022 16:46:22'!
renovar
	
	fechaDeVencimiento := fechaDeVencimiento next: (1 * week).! !

!PrestamoConvencional methodsFor: 'actions' stamp: 'FA 12/2/2022 20:36:55'!
renovarPorUnDia
	fechaDeVencimiento := (fechaDeVencimiento next: 1 * day).! !


!PrestamoConvencional methodsFor: 'initialize' stamp: 'FA 12/7/2022 15:49:36'!
initializeSobre: unLibro a: unSocio enFecha: unaFecha hasta: otraFecha  
	libro := unLibro.
	socio := unSocio.
	fechaDeInicio := unaFecha.
	fechaDeVencimiento := otraFecha.! !


!classDefinition: #PrestamoExtendido category: 'TrabajoFinal-AcostaUribarri'!
Prestamo subclass: #PrestamoExtendido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!PrestamoExtendido methodsFor: 'actions' stamp: 'GDU 11/20/2022 16:37:21'!
renovar
	
	^ self error: 'Este tipo de prestamo no se puede renovar'.! !

!PrestamoExtendido methodsFor: 'actions' stamp: 'FA 12/2/2022 20:51:26'!
renovarPorUnDia
	
	^ self error: 'Este tipo de prestamo no se puede renovar'.! !


!PrestamoExtendido methodsFor: 'initialize' stamp: 'GDU 11/20/2022 17:23:43'!
initializeSobre: unLibro a: unSocio enFecha: unaFecha hasta: otraFecha  
	libro := unLibro.
	socio := unSocio.
	fechaDeInicio := unaFecha.
	fechaDeVencimiento := otraFecha! !


!classDefinition: #RegistradorDeLibroDeBiblioteca category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #RegistradorDeLibroDeBiblioteca
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!RegistradorDeLibroDeBiblioteca methodsFor: 'action' stamp: 'GU 12/8/2022 16:37:01'!
escribirEn: unArchivo los: losLibros de: unaBiblioteca  
	
	unArchivo forceWriteStreamDo: [:unStream | 		
		unStream nextPutAll: 'ISBN, Autor, Titulo, Idioma, Fecha, Temario, Prioridad, Cant. Ejemplares, Cant. Prestamos'.
		losLibros do: [:unLibro | 
			unStream newLine.
			unStream nextPutAll: (self informacionDe: unLibro sobre: unaBiblioteca). 
		].	
	].! !

!RegistradorDeLibroDeBiblioteca methodsFor: 'action' stamp: 'GU 12/8/2022 17:11:32'!
informacionDe: unLibro sobre: unaBiblioteca  
	
	^ unLibro numeroIsbn asString, self delimitador, 
	 unLibro autor , self delimitador,
	unLibro titulo, self delimitador,
	unLibro idioma , self delimitador,
	unLibro fecha asString , self delimitador,
	unLibro listaDeTemario asString , self delimitador,
	(unaBiblioteca cantidadEjemplaresDe: unLibro) asString , self delimitador,
	(unaBiblioteca cantidadDePrestamosDeLibro: unLibro) asString , self delimitador,
	unLibro prioridad asString.
	
	! !


!RegistradorDeLibroDeBiblioteca methodsFor: 'accessing' stamp: 'GU 12/6/2022 21:16:57'!
delimitador
	
	^ ','! !


!classDefinition: #Socio category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #Socio
	instanceVariableNames: 'nombreYApellido numeroDeDNI fechaDeRegistro librosEnPrestamo expiracionDeMembresia ultimaRenovacionDeMembresia cantidadDeSanciones bibliotecaDeRegistro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!Socio methodsFor: 'initialize' stamp: 'FA 12/7/2022 15:19:32'!
initializeConNombreYApellido: unNombreYApellido dni: unNumeroDeDni enBiblioteca: unaBiblioteca   
	
	nombreYApellido := unNombreYApellido.
	numeroDeDNI := unNumeroDeDni.
	fechaDeRegistro := unaBiblioteca reloj.
	expiracionDeMembresia := (unaBiblioteca reloj next: (1 * year)).
	ultimaRenovacionDeMembresia := unaBiblioteca reloj.
	cantidadDeSanciones := 0.
	librosEnPrestamo _ Set new.
	bibliotecaDeRegistro _ unaBiblioteca.! !


!Socio methodsFor: 'actions' stamp: 'FA 12/7/2022 15:11:20'!
actualizarMembresiaEnFecha: unaFecha

	expiracionDeMembresia := unaFecha next: (1 * year).
	ultimaRenovacionDeMembresia := unaFecha.! !

!Socio methodsFor: 'actions' stamp: 'FA 11/8/2022 13:55:08'!
agregarLibroPrestado: unLibro 
	librosEnPrestamo add: unLibro.! !

!Socio methodsFor: 'actions' stamp: 'FA 12/2/2022 20:54:30'!
aplicarSancion
	
	cantidadDeSanciones := cantidadDeSanciones + 1.
	! !

!Socio methodsFor: 'actions' stamp: 'FA 12/2/2022 21:04:14'!
aplicarVeto
	cantidadDeSanciones _ (cantidadDeSanciones + 3).! !

!Socio methodsFor: 'actions' stamp: 'FA 12/7/2022 15:11:44'!
devolverLibro: unLibro   
	
	librosEnPrestamo remove: unLibro.
	bibliotecaDeRegistro recibirDevolucionDeLibro: unLibro por: self.! !

!Socio methodsFor: 'actions' stamp: 'FA 12/7/2022 15:11:58'!
pedirPrestamoConvencionalDe: unLibro hasta: unaFecha  
		
	bibliotecaDeRegistro otorgarPrestamoConvencionalA: self sobreLibro: unLibro hasta: unaFecha.
	! !

!Socio methodsFor: 'actions' stamp: 'FA 12/7/2022 15:12:12'!
pedirPrestamoExtendidoDe: unLibro hasta: unaFecha  
		
	bibliotecaDeRegistro otorgarPrestamoExtendidoA: self sobreLibro: unLibro hasta: unaFecha.
	! !

!Socio methodsFor: 'actions' stamp: 'FA 12/7/2022 15:10:41'!
solicitarRenovacionDeMembresia 

	bibliotecaDeRegistro renovarMembresiaDe: self.! !

!Socio methodsFor: 'actions' stamp: 'FA 12/7/2022 15:10:30'!
solicitarRenovacionDePrestamoDeLibro: unLibro     
	
	bibliotecaDeRegistro renovarPrestamoPara: self de: unLibro. ! !


!Socio methodsFor: 'accessing' stamp: 'FA 12/7/2022 15:13:46'!
bibliotecaDeRegistro
	^ bibliotecaDeRegistro.! !

!Socio methodsFor: 'accessing' stamp: 'FA 11/19/2022 14:21:25'!
expiracionDeMembresia
	
	^ expiracionDeMembresia.! !

!Socio methodsFor: 'accessing' stamp: 'GDU 11/4/2022 14:34:39'!
fechaDeRegistro
	
	^fechaDeRegistro! !

!Socio methodsFor: 'accessing' stamp: 'FA 12/7/2022 15:30:40'!
librosEnPrestamo
	^ librosEnPrestamo.! !

!Socio methodsFor: 'accessing' stamp: 'FA 11/23/2022 15:21:24'!
nombreYApellido
	^ nombreYApellido.! !

!Socio methodsFor: 'accessing' stamp: 'FA 11/23/2022 15:20:18'!
numeroDeDNI
	^ numeroDeDNI.! !

!Socio methodsFor: 'accessing' stamp: 'GDU 11/13/2022 14:22:58'!
ultimaRenovacionDeMembresia
	
	^ ultimaRenovacionDeMembresia! !


!Socio methodsFor: 'testing' stamp: 'GU 11/28/2022 20:04:05'!
estaSancionado
	
	^ cantidadDeSanciones > 0! !

!Socio methodsFor: 'testing' stamp: 'FA 12/1/2022 16:37:56'!
estaVetado
	^ cantidadDeSanciones >= 3.! !

!Socio methodsFor: 'testing' stamp: 'FA 12/1/2022 15:23:02'!
noEstaSancionado
	^ self estaSancionado not.! !

!Socio methodsFor: 'testing' stamp: 'FA 11/23/2022 15:19:59'!
tieneDNI: unDNI 
	^ numeroDeDNI = unDNI.! !

!Socio methodsFor: 'testing' stamp: 'FA 12/7/2022 15:43:49'!
tieneElLibro: unLibro 
	^ librosEnPrestamo anySatisfy: [: unLibroABuscar | unLibroABuscar titulo = unLibro titulo].! !

!Socio methodsFor: 'testing' stamp: 'GDU 11/4/2022 14:59:49'!
tieneMembresiaExpirada
	
	^ self expiracionDeMembresia < (FixedGregorianDate today)! !


!Socio methodsFor: 'evaluating' stamp: 'FA 11/8/2022 13:57:16'!
cantidadDeLibrosEnPrestamo
	^ librosEnPrestamo size.! !

!Socio methodsFor: 'evaluating' stamp: 'FA 12/7/2022 15:31:44'!
cantidadDeLibrosSolicitadosHistoricos
	^ self historialPrestamosRecibidos size.! !

!Socio methodsFor: 'evaluating' stamp: 'FA 12/7/2022 15:31:04'!
historialPrestamosRecibidos
	
	^ bibliotecaDeRegistro prestamosDeSocio: self.! !

!Socio methodsFor: 'evaluating' stamp: 'FA 12/7/2022 15:31:05'!
prestamoDeLibro: unLibro
	
	^ (self historialPrestamosRecibidos) detect:[:unPrestamo | unPrestamo libro = unLibro]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Socio class' category: 'TrabajoFinal-AcostaUribarri'!
Socio class
	instanceVariableNames: ''!

!Socio class methodsFor: 'instance creation' stamp: 'FA 12/7/2022 12:39:54'!
conNombreYApellido: unNombreYApellido dni: unNumeroDeDni enBiblioteca: unaBiblioteca  
	
	^ self new initializeConNombreYApellido: unNombreYApellido dni: unNumeroDeDni enBiblioteca: unaBiblioteca.! !


!classDefinition: #VerificadorDePrestamos category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #VerificadorDePrestamos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!VerificadorDePrestamos methodsFor: 'actions' stamp: 'FA 12/2/2022 21:11:28'!
realizarVerificacionesPara: unaBiblioteca sobre: unLibro conSocio: unSocio 

	self verificarLibroRepetidoPara: unaBiblioteca deSocio: unSocio sobre: unLibro.
	self verificarDisponibilidadDeLibroPara: unaBiblioteca sobre: unLibro.
	self verificarVigenciaMembresiaPara: unaBiblioteca sobre: unSocio.
	self verificarCantidadDeLibrosPrestadosPara: unaBiblioteca sobre: unSocio.
	self verificarEstadoDeVetoPara: unaBiblioteca sobre: unSocio.! !

!VerificadorDePrestamos methodsFor: 'actions' stamp: 'FA 11/28/2022 18:39:20'!
verificarCantidadDeLibrosPrestadosPara: unaBiblioteca sobre: unSocio 
	(unSocio cantidadDeLibrosEnPrestamo = 5)
		ifTrue: [unaBiblioteca errorMaximoDeLibrosPrestados].! !

!VerificadorDePrestamos methodsFor: 'actions' stamp: 'FA 11/28/2022 18:39:13'!
verificarDisponibilidadDeLibroPara: unaBiblioteca sobre: unLibro 
	(unaBiblioteca tieneLibroEnInventario: unLibro)
		ifFalse: [unaBiblioteca errorLibroNoDisponible].! !

!VerificadorDePrestamos methodsFor: 'actions' stamp: 'FA 12/7/2022 15:22:06'!
verificarEstadoDeVetoPara: unaBiblioteca sobre: unSocio.
	(unSocio estaVetado)
		ifTrue: [unaBiblioteca errorPrestamoSocioVetado].! !

!VerificadorDePrestamos methodsFor: 'actions' stamp: 'FA 12/7/2022 15:38:21'!
verificarLibroRepetidoPara: unaBiblioteca deSocio: unSocio sobre: unLibro 
	(unSocio tieneElLibro: unLibro)
		ifTrue: [unaBiblioteca errorPrestamoLibroRepetido].! !

!VerificadorDePrestamos methodsFor: 'actions' stamp: 'FA 11/27/2022 20:18:07'!
verificarVigenciaMembresiaPara: unaBiblioteca sobre: unSocio 
	unSocio tieneMembresiaExpirada
		ifTrue: [unaBiblioteca errorMembresiaExpirada].
! !


!classDefinition: #VerificadorDeRegistroDeLibro category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #VerificadorDeRegistroDeLibro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!VerificadorDeRegistroDeLibro methodsFor: 'actions' stamp: 'FA 11/27/2022 20:33:18'!
realizarVerificacionesPara: unaBiblioteca sobre: unLibro 
	self verificarRegistroDeLibroPara: unaBiblioteca sobre: unLibro.! !

!VerificadorDeRegistroDeLibro methodsFor: 'actions' stamp: 'FA 12/7/2022 15:38:53'!
verificarRegistroDeLibroPara: unaBiblioteca sobre: unLibro 
	(unaBiblioteca tieneElLibro: unLibro)
		ifTrue: [unaBiblioteca errorLibroYaRegistrado].! !


!classDefinition: #VerificadorDeRegistroDeSocio category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #VerificadorDeRegistroDeSocio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!VerificadorDeRegistroDeSocio methodsFor: 'actions' stamp: 'FA 12/5/2022 18:23:49'!
realizarVerificacionesPara: unaBiblioteca sobre: unDNI.
	
	self verificarEstadoDeVetoPara: unaBiblioteca sobre: unDNI! !

!VerificadorDeRegistroDeSocio methodsFor: 'actions' stamp: 'GDU 12/3/2022 20:59:15'!
verificarEstadoDeVetoPara: unaBiblioteca sobre: unDNI 
	
	(unaBiblioteca listaNegra includes: unDNI) 
						ifTrue:[Error signal: 'No podes volver a registrarte en la biblioteca porque tu DNI esta vetado']! !


!classDefinition: #VerificadorDeRenovacionDeMembresia category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #VerificadorDeRenovacionDeMembresia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!VerificadorDeRenovacionDeMembresia methodsFor: 'actions' stamp: 'FA 12/2/2022 21:10:18'!
realizarVerificacionesPara: unaBiblioteca sobre: unSocio enFecha: unaFecha
	self verificarVigenciaDeMembresiaPara: unaBiblioteca sobre: unSocio enFecha: unaFecha.
	self verificarEstadoDeVetoPara: unaBiblioteca sobre: unSocio! !

!VerificadorDeRenovacionDeMembresia methodsFor: 'actions' stamp: 'FA 12/1/2022 16:47:39'!
verificarEstadoDeVetoPara: unaBiblioteca sobre: unSocio
	(unSocio estaVetado)
		ifTrue: [unaBiblioteca errorMembresiaSocioVetado].! !

!VerificadorDeRenovacionDeMembresia methodsFor: 'actions' stamp: 'FA 11/27/2022 20:31:51'!
verificarVigenciaDeMembresiaPara: unaBiblioteca sobre: unSocio enFecha: unaFecha
	"Se asume que solo se puede renovar la membresia el dia que se expira"
	(unaFecha < unSocio expiracionDeMembresia)
		ifTrue: [unaBiblioteca errorMembresiaAunVigente].! !


!classDefinition: #VerificadorDeRenovacionDePrestamo category: 'TrabajoFinal-AcostaUribarri'!
Object subclass: #VerificadorDeRenovacionDePrestamo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-AcostaUribarri'!

!VerificadorDeRenovacionDePrestamo methodsFor: 'actions' stamp: 'FA 12/2/2022 20:05:37'!
realizarVerificacionesPara: unaBiblioteca sobre: unLibro de: unSocio enFecha: unaFecha 
	self verificarDePlazoDeEntregaPara: unaBiblioteca sobre: unLibro de: unSocio enFecha: unaFecha.
	self verificarPrioridadDeLibro: unLibro para: unaBiblioteca sobre: unSocio enFecha: unaFecha.! !

!VerificadorDeRenovacionDePrestamo methodsFor: 'actions' stamp: 'FA 11/28/2022 18:39:31'!
verificarDePlazoDeEntregaPara: unaBiblioteca sobre: unLibro de: unSocio enFecha: unaFecha 
	unaFecha <= ((unaBiblioteca prestamoDe: unLibro sobre: unSocio) fechaDeVencimiento) 
		ifFalse:[unaBiblioteca errorFueraDePlazoDevolucion].! !

!VerificadorDeRenovacionDePrestamo methodsFor: 'actions' stamp: 'FA 12/2/2022 20:06:51'!
verificarPrioridadDeLibro: unLibro para: unaBiblioteca sobre: unSocio enFecha: unaFecha
	(unLibro prioridad = 0)
		ifTrue: [unaBiblioteca errorLibroConPrioridad0].! !
