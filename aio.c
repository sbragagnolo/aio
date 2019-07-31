#include<stdio.h>
#include<aio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<string.h>
#include <errno.h>
#include <pthread.h>
#include <signal.h>


#include <features.h>
#include <sys/types.h>
#define __need_sigevent_t
#include <bits/siginfo.h>
#define __need_timespec
#include <time.h>

#define BUFSIZE 256


char buffer [BUFSIZE];
void thread_handler_example (union sigval sigev_value) {
	printf("Thread handling read!. Thread parameter %s %ld \n",  sigev_value.sival_ptr, pthread_self() );
}
 
void signal_handler_example (int signo, siginfo_t *info, void *context) {
	printf("Signal handling read! %s\n", buffer);
}



void configureForThread (struct aiocb *cb, char* buffer) {
    cb->aio_sigevent.sigev_notify = SIGEV_THREAD;           
    cb->aio_sigevent.sigev_notify_function = thread_handler_example;
    cb->aio_sigevent.sigev_notify_attributes = NULL;
    cb->aio_sigevent.sigev_value.sival_ptr = buffer;
}

void configureForSignal  (struct aiocb *cb, char* buffer) {
     cb->aio_sigevent.sigev_notify = 0;// SIGEV_SIGNAL;    
     cb->aio_sigevent.sigev_signo = SIGIO;
     struct sigaction sig_act;

     sigemptyset(&sig_act.sa_mask);
     sig_act.sa_flags = SA_SIGINFO;
     sig_act.sa_sigaction = signal_handler_example;
     sigaction(SIGIO, &sig_act, NULL);
}

void configureForNone (struct aiocb *cb, char* buffer) {
    cb->aio_sigevent.sigev_notify = 1;// SIGEV_NONE;  
}
int main (void ) {
	
	
	int fd;
	struct aiocb cb; 
	


	printf ("CB sizes all=%d off64_t:%d struct sigevent: %d" , sizeof(struct aiocb), sizeof(long), sizeof(struct sigevent));


	
	fd = open ("/home/santiago/git-repositories/aio/pharo-local/iceberg/sbragagnolo/aio/file.test", O_RDONLY);
	memset( &cb, 0, sizeof(struct aiocb) );
	memset( &buffer, 0, BUFSIZE );
	cb.aio_fildes = fd;
	cb.aio_nbytes = BUFSIZE;
	cb.aio_offset = 0;
	cb.aio_buf = buffer;


	configureForNone(&cb, buffer); 

	aio_read(&cb);

	while(aio_error(&cb) == EINPROGRESS)
		{
	
			printf("Working...\n");
sleep(1);
		}
	
		// success?
	int numBytes = aio_return(&cb);
	if (numBytes > 0) {
		printf("NONE strategy %d %s\n",numBytes, buffer);
	}
	else {
		printf("buffer %d %s\n",errno, strerror(errno));
	}
	
}
