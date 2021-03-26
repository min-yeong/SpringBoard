# Java Language

## 클래스 
객체 지향 프로그래밍에서 변수와 메소드를 정의하는 일종의 틀 
- 상태(멤버 변수), 메소드(함수)로 구성

## 객체 
클래스의 인스턴스 

## 인스턴스
실체화된 객체, 메모리에 할당 

### 클래스, 객체, 인스턴스의 관계
~~~
public class Car { 
    
    // 필드 (멤버변수) : 객체의 데이터, 접근 제어자 default 
    String carName; 
    String carColor;
    int velocity;
    int wheelNum; 
 
    // 메소드 (함수) : 객체의 동작
    public void speedUp() {
        velocity += 1;
    }
 
    public static void main(String args[]) {  // 1. 제일 먼저 실행
        Car c1; // 2. 참조변수 정의
        c1 = new Car(); // 3. 인스턴스 생성
 
        c1.carName = "에쿠스"; // 4. 인스턴스 접근
        c1.carColor = "Black";  
        c1.wheelNum = 4;
        c1.speedUp(); // 5. 메소드 접근 
    }
};
~~~
1. public(동일 패키지 내에 접근 가능) static(클래스가 실행될 때 메모리에 바로 올려서 인스턴스를 생성하지 않고도 멤버변수나 메서드를 사용할 수 있게 함)
   void(처리 후 호출자에게 리턴할 값이 없다) main(String args[])(자바 프로그램에서 가장 먼저 실행되는 메소드로 String args[]라는 한개의 파라미터 값을 갖도록 정의되어있음) 
2. Car이라는 클래스의 참조변수(객체) c1 선언
3. new 연산자로 선언한 c1이 참조하는 Car 클래스의 인스턴스 생성 
4. 생성된 인스턴스 멤버변수 접근 
5. 생성된 인스턴스 메소드 접근 

-> 클래스를 사용해서 코드의 반복을 줄이고 유지보수를 

![image](https://user-images.githubusercontent.com/58197075/108483362-fcd3a600-72dd-11eb-8ed9-556453514857.png)

- Stack : Heap 영역에 생성된 객체 또는 배열 데이터 참조값 할당, 또는 원시타입(int, byte, short 등,,) 데이터들은 직접 할당 (LIFO)
- Heap : 객체 또는 배열 등이 저장되는 영역, 주소값은 stack에서 가지고 있음

1. 참조변수 정의 : 객체 
- 참조변수는 데이터를 넣어두는 변수가 아닌 인스턴스를 가리키는 주소 값을 가진 변수, 초기값은 null 
- 모든 인스턴스는 참조변수를 통해 접근하고 사용 가능 
2. 인스턴스 생성 : 인스턴스
- Car 인스턴스 생성, 인스턴스를 가리키는 주소가 참조변수 c1에 저장 
3. 인스턴스 접근 
- 인스턴스 생성을 통해 객체의 멤버 변수와 메서드 사용 가능 

## 상속 (Inheritance) 
부모 클래스(상위 클래스)와 자식 클래스(하위 클래스)가 있을 때, 자식 클래스는 부모 클래스를 선택해서 그 부모 클래스의 요소들을 상속받아 그대로 쓸 수 있음 
-> 클래스를 재사용, 효율적 
1. 부모 클래스의 private 접근 제한을 갖는 필드 및 메소드는 자식이 상속 받을 수 없음 
2. 부모와 자식 클래스가 서로 다른 패키지에 있다면 부모의 default 접근 제한을 갖는 필드 및 메소드도 자식이 상속받을 수 없음

- 방법
1. extends (class 상속)
~~~
public Class Parent{ .... }; // 부모 클래스
public Class Child extends parent { .... }; // 자식 클래스
~~~
extends 뒤에는 하나의 부모 클래스만 상속 가능 

2. implements (interface 상속)
- 다중상속이 지원되지 않는 대신 사용 
- 사용할 때에는 꼭 오버라이딩 (@Override, 재정의)가 필요

3. abstract (추상클래스)
- 클래스의 전체적인 구성을 다 가지지 않고 설계만 되어있는 클래스, 상속에 의해 자식 클래스에서 완성

=> 정리 
- extends는 일반 클래스와 abstract 클래스 상속에 사용, implement는 interface 상속에 사용
- class가 class를 상속받거나 interface가 interface를 상속받을 땐 extends 사용
- class가 interface를 사용할 땐 implements
- extends는 클래스 한 개만 상속 가능, implemets는 여러 개 가능
- implements한 클래스는 해당 interface의 모든 내용을 다 사용

## Annotation(@)
소스코드에 메타데이터(어떤 목적에 의해 생성된 데이터)를 표현하기 위해 사용
즉, 전체 소스코드의 비지니스 로직에는 영향을 주지 않지만 해당 타겟의 연결 방법이나 소스코드의 구조를 변경 -> 메소드에 특정 옵션을 걸어준다 
클래스, 메소드, 변수 등에 붙여서 사용함  

### 어노테이션 정의 
~~~
public @interface DoRepear { // 어노테이션 인터페이스 생성 
}
~~~

### 어노테이션 적용 Class 생성
~~~
public class Hello {
    @DoRepear 
    public void hello() {
        System.out.println("Hello!");
}
~~~
Hello class에 @DoRepear 어노테이션 적용

## Retention
해당 어노테이션의 유효성 정의
- Source : 컴파일러에서 사용, 소스상에서만 확인 가능함 (주석과 비슷)
- Class : 컴파일러에 의해 class 파일에 저장은 되지만 VM에서 실행시엔 유지될 필요가 없는 경우, Runtime 시에는 존재하지 않음 (Default 값)
- Runtime : 컴파일러시 포함, VM에서 인식 

## Target 
어노테이션이 부여될 위치 지정

### Retention과 Target 정의 
~~~
@Retention(value = RetentionPolicy.RUNTIME)
@Target(value = ElementType.METHOD)
public @interface DoRepeat {
}
~~~
Runtime에 유효하고 Method에만 적용 가능 

### 어노테이션 처리 Class 생성 
~~~
public class Main {
    public static void main(String[] args) {
    
        Hello hello = new Hello();
        
        try {
            Method method = hello.getClass().getDeclaredMethod("hello"); 
            System.out.println("어노테이션이 존재");
            if(method.isAnnotationPresent(DeRepeat.class)) {
                for(int i=0; i<100; i++) 
                    hello.hello();
            }
            else System.out.println("어노테이션이 존재하지 않음");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
~~~
reflection을 이용해 Class의 메소드 정보를 추출, 해당 메소드의 어노테이션이 부여되어 있다면 Hello 클래스 100번 출력 
reflection : 객체를 통해 클래스의 정보를 분석

#### 예외처리 (try/catch/finally)
예외 : 컴파일 과정에서는 문제가 발생되지 않았지만 실행 중에 발생하는 오류사항들 
ex) 범위를 넘어선 배열접근, 정수를 0으로 나누는 경우, Null 포인터 오류 등
- 동작과정
~~~
public class Mathematics { 
    public static void main(String[] args){ 
        int num1, num2; 
        
        num1 = 12; 
        num2 = 0; 
        try { 
            System.out.println(num1/num2); 
        } 
        catch (Exception e) { 
            System.out.println("0으로는 값을 나눌 수가 없습니다."); 
        } 
    } 
}
~~~
try 안에서 에러가 발생한 경우 catch문을 실행

-> 만약 try, catch문을 사용하지 않으면 ArithmeticException(산술 오류, 0으로 나누기) 오류 발생 

- finally : 예외가 발생했던 안했던 실행
- throws : 호출하는 메소드에 예외처리의 책임을 넘긴다 
~~~
public class Main { 
    public static void nanum(int a, int b) throws ArithmeticException { 
        System.out.println(a/b); 
    } 
    public static void main(String[] args) { 
        int num1, num2; 
        num1 = 10; 
        num2 = 0; 
        try { 
            nanum(num1,num2); 
        } 
        catch (ArithmeticException e){ 
            System.out.println("0으로 나눌 수는 없어요.."); 
        } 
    } 
}
~~~
-> ArithmeticException 예외가 발생하면 이 메소드를 사용하는 곳에서 예외처리를 넘겨주라는 뜻, 예외상황에 대해 각각 불러오는 곳에서 다른 방법으로 예외처리를 하고 싶을 때 사용 

- throw : 개발자가 직접 사용자 정의 예외를 발생시키고 싶을 때 
~~~
public class Main { 
    public static void throwExample throws Exception { 
        throw new Exception();
    } 
    public static void main(String[] args) { 
        try { 
            throw new Exception();
        } 
        catch (Exception e){ 
            System.out.println("예외 발생"); 
        } 
    } 
}
~~~
 
## 제어자 

### 접근 제어자
- 사용이유 : 외부로부터 데이터 보호, 데이터 감추기, 캡슐화, 값의 유효성 기능
- 접근 허용도 : private -> default -> protected -> public

![image](https://user-images.githubusercontent.com/58197075/108649130-18b69200-7500-11eb-9991-c98631d5169f.png)

-public : 모든  package, class에서 참조 가능

-protected : 같은 packege 소속이거나 다른 package의 class여도 상속받아서 사용 가능

-default : 같은 package 소속의 class면 사용 가능 

-private : 자신을 포함한 package이고 같은 class에서만 참조 가능


-클래스 : public,default 만 사용 가능 (프로젝트 폴더 내에서 클래스가 분류되는 방법은 패키지 단위이기 때문)

-메서드, 멤버변수 : 접근제어자 모두 사용 가능

-지역변수(메소드 안에서 사용하는 ) : 접근제어자 모두 사용 불가능


- 캡슐화 : 하나의 클래스가 내부에서 어떤 작업을 하는 지가 아닌 어떤 역할을 하는 지에 초점을 두는 개념으로 구현부는 외부에 노출시키지 않고 특정 기능만을 알려주는 것

-> 이를 실현하기 위해서는 정보은닉 (선언된 데이터를 공개여부 등을 어떻게 할 것인지 정확하게 정의) 이 필요

- static (클래스의 공통적인 제어자, 멤버변수, 메서드, 초기화블럭) : 클래스가 실행될 때 메모리에 바로 올려서 인스턴스를 생성하지 않고도 멤버변수나 메서드를 사용할 수 있게 함 

- final (변경될 수 없는 제어자, 클래스, 메서드, 멤버변수, 지역변수)
1. 클래스에 사용하면 상속 x
2. 메서드에 사용하면 오버라이딩을 통해 재정의 x
3. 변수에 사용되면 값을 변경할 수 없는 상수가 됨 (final 변수값은 모든 글자를 대문자로 선언)

오버로딩(Overloading) : 같은 이름의 메소드를 여러 개 가지면서 매개변수의 유형과 개수가 다르게 해서 사용

오버라이딩(Overriding) : 상위 클래스가 가지고 있는 메소드를 하위 클래스가 재정의 해서 사용

## Package, import

### Package : 클래스의 집합 
- Java 프로젝트에서 패키지를 선언하지 않고 소스 파일을 생성해도 default package가 생성된다 (default package는 다른 패키지에 inport불가능) 
-> package가 없으면 java 프로젝트는 사용할 수 없다.  

### import
- 다른 패키지를 사용하고 싶을 때 : import test.*; -> test라는 패키지를 사용
- test 패키지 내의 Bycle 클래스만 사용하고 싶을 때 -> import test.Bycle; 




-----------------------------------------------------------------------------------------------------------------------------------------

# 재정리

![image](https://user-images.githubusercontent.com/58197075/108962499-3892b500-76bc-11eb-8671-edfccd4038db.png)

Class Loader : Java 컴파일러가 자바의 소스코드 (.java파일)를 빌드하면 바이트코드 파일(.class)이 생성 됨, 바이트코드 파일을 Runtime Data Areas에 로딩해 프로그램 구동

Execution Engine : Class Loader에 의해 메모리에 적재된 클래스(바이트 코드)들을 기계어로 변경해 명령어 단위로 실행 

Garbage Collector : Heap 영역에서 참조되지 않는 오브젝트를 제거 

## 클래스란?
객체 지향 프로그래밍에서 변수와 메소드를 정의하는 일종의 틀 
- 멤버변수와 메소드를 가진 틀 

## 클래스 생성자 ( 기본 생성자, 정의 생성자 )
생성자 : new 연산자와 같이 사용되어 클래스로부터 객체를 생성할 때 호출되어 객체의 초기화를 담당 
객체 초기화 : 필드를 초기화하거나 메소드를 호출해서 객체를 사용

### 기본 생성자
- 클래스는 생성자가 반드시 존재하고 여러 개가 존재할 수 있음
- 선언을 하지 않아도 컴파일러가 자동으로 기본 생성자 추가
 
public 클래스() {} 

(생성자 선언이 잇으면 기본 생성자는 생성되지 않음)

### 정의 생성자 
- 생성자는 오버로딩이 가능하기 때문에 매개 변수가 있는 생성자를 만들 수 있음 
- 명시적선언
~~~
...
public 클래스(int s) {
    a = s;   
    b = c = 0; 
}
~~~
~~~
public 클래스(int s, int m) {
    a = s;
    b = m; 
    c = 5;  
}
~~~
~~~
...
public static void main(String[] args) {
    클래스 a = new 클래스(100);   
    클래스 a1 = new 클래스(100, 50);
}
...
~~~

### static 클래스일때 , 변수 일때, 함수 일때
한번 할당되서 프로그램이 끝날 때까지 값이 유지, 공유 데이터
- static 클래스 : 상위 클래스와 분리, 상위클래스의 멤버변수(static 변수면 가능)에 접근할 수 없음, 상위클래스가 생성되지 않아도 외부에서 객체 생성 가능 
- static 메소드 : 객체를 생성하지 않아도 메소드 호출 가능 
- static 변수 : 모든 곳에서 동일하게 공유하며 사용할 수 있음 

### public 클래스일때 , 변수 일때, 함수 일때
모두 동일하게 다른 패키지 내에서 사용할 수 있게 됨 -> 정보 은닉 X

## 상속 3가지 종류의 의미 / 차이점 / 샘플

### extends : 클래스 상속
- 부모의 멤버변수, 메소드를 모두 사용 가능 
- 다중 상속은 불가능
~~~
public class Animal2 {
	int head = 1;
	int speed = 0;
	String tail = "꼬리";
	
	protected void run() {
		speed += 1;
		System.out.println(speed);
	}
}
~~~

~~~
public static void main(String[] args) {
	Animal2 puppy = new Animal2();
	System.out.println("강아지의 속력");
	puppy.run();		
}
~~~	

### implement : 인스턴스 상속
- 인터페이스는 static final만 가질 수 있기 때문에 public static final 이 생략되어있다고 생각할 것
- 구현 객체가 같은 동작을 한다는 것 보장  
~~~
public interface AnimalInterface {
	void sound();
	void age();
	int age = 5;
}

~~~

~~~
public static void main(String[] args) {		
		Lion lion = new Lion();
		lion.sound();
		lion.age();
	}	
	public static class Lion implements AnimalInterface {
		@Override 
		public void sound() {
			System.out.println("흥");
		}
		@Override 
		public void age() {
			System.out.println(age);
		}
	}
~~~

### adstract : 추상클래스 상속
- new 연산자 사용 불가능
- 추상클래스는 일반클래스 상속
- 동일한 부모를 가지는 클래스를 묶는 개념으로 상속받아 기능을 확장 
~~~
public abstract class Animal {
	public abstract void sound();
	public void age() {
		System.out.println("1살");
	}
}
~~~

~~~
public class Main {
	public static class Dog extends Animal {
		public void sound() {
			System.out.println("멍");
		}
	}
	public static class Cat extends Animal {
		public void sound() {
			System.out.println("옹");
		}
	}
	public static void main(String[] args) {
		Dog dog = new Dog();
		Cat cat = new Cat();
		
		dog.sound();
		cat.sound();
		
		dog.age();
		cat.age();
	}
}
~~~

-> 인터페이스와 추상클래스 차이점 
1. 인터페이스는 다중상속, 추상클래스는 단일상속
2. 인터페이스는 구현하는 모든 클래스에 대해 특정한 메서드가 반드시 존재하도록 강제하는 역할, 구현객체가 같은 동작을 함. (메소드에 중괄호를 열어서 구현하면 안됨)
추상클래스는 상속을 받아서 기능을 확장하는 것 

## 예외처리 (Exception)
- 예외 : 에러의 일종으로 발생하면 시스템과 프로그램이 불능상태가 됨, 이를 막기위해 예외처리를 사용해 정상실행 상태로 유지
- 예외처리 : 프로그램 실행 시 발생할 수 있는 예외의 발생에 대비한 코드를 작성하는 것으로 프로그램의 비정상 종료를 막고 정상적인 실행상태를 유지함 
- 종류 
1. 일반예외
컴파일러 체크 예외 (컴파일하는 과정에서 예외 처리 코드가 필요한 지 검사, 안하면 컴파일 오류)
-> 자동으로 일반예외를 감지하고 예외처리 코드를 사용하도록 강제

ex) ClassNotFoundException (해당 클래스가 존재하지 않으면 발생)
~~~
public class ExceptionExample {
	public static void main(String[] args) {
		try {
			Class object = Class.forName("java.lang.test");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println("예외처리 밖");
	}
}
~~~
java.lang.ClassNotFoundException : java.lang.test....
-> test라는 클래스를 찾을 수 없어서 발생

3. 실행예외
컴파일하는 과정에서 예외 처리 코드를 검사하지 않는 예외  

ex) NullPointException (참조 대상이 null인데 참조할 때 발생)
~~~
public class RuntimeExceptionExample {
	public static void main(String[] args) {
		String[] array = null;
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
		}
		System.out.println("Run..");
	}
}
~~~
NullPointException 발생
~~~
public class RuntimeExceptionExample {
	public static void main(String[] args) {
	
		try {
			String[] array = null;

			for(int i=0; i<array.length; i++) {
				System.out.println(array[i]);
			}
		} catch(NullPointException e) {
			String message = e.getMaessage();
			System.out.println("예외 발생 : "+message);
		} finally {
			System.out.println("예외 상관없이 실행");
		}	
		System.out.println("예외처리 밖");
	}
}
~~~
catch로 가서 예외와 관련된 객체 e를 리턴하고 getMessage 메서드를 통해 예외 메세지 확인 가능

## 컴파일 / 런타임 (JVM)
![image](https://user-images.githubusercontent.com/58197075/109161676-b2a96380-77ba-11eb-9330-ba6f174dc11d.png)

- 컴파일 : 소스코드를 컴파일 과정을 통해 기계어코드로 변환되어 실행 가능한 프로그램이 됐을 때

ex) 신택스 오류, 타입체크 오류

- 런타임 : 사용자에 의해 실행되어 응용프로그램이 동작되어지는 때

ex) 0으로 나누기 오류, 널참조 오류, 메모리부족 오류

## @annotation 시점
- SOURCE : 소스상에서만 어노테이션 정보 유지 (소스 분석할때만 의미가 있음)
- CLASS : 바이트 코드 파일까지 어노테이션 정보 유지
- RUNTIME : 바이트 코드 파일까지 어노테이션 정보 유지 (리플렉션으로 어노테이션 정보를 얻을 수 있음)
