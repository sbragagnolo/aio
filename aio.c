#include<stdio.h>
#include<aio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<string.h>
#include <errno.h>
#include <pthread.h>


#define BUFSIZE 256

void handle_read(union sigval sigev_value) {
	printf("handling read!\n");
}
 
void thread_handler(union sigval sv) {
        char *s = sv.sival_ptr;

        /* Will print "5 seconds elapsed." */
        puts(s);
}
 
 
 void
aio_completion_handler(int signo, siginfo_t *info, void *context)
{
 printf("handling read!blblablabl\n");
}


int main (void ) {
	char buffer [BUFSIZE];
	char buffer2 [BUFSIZE];
	
	pthread_attr_t init; 
	int fd; 
	struct aiocb cb; 
	
	pthread_attr_init(&init);
	pthread_attr_setdetachstate (&init, PTHREAD_CREATE_JOINABLE );
	
	fd = open ("/Users/sbragagn/git-repositories/aio_example/file.test", O_RDONLY);
	
	memset( &cb, 0, sizeof(struct aiocb) );
	memset( &buffer, 0, BUFSIZE );
	cb.aio_fildes = fd;
	cb.aio_nbytes = BUFSIZE;
	cb.aio_offset = 0;
	cb.aio_buf = &buffer;
	
    cb.aio_sigevent.sigev_notify = SIGEV_THREAD;           
    cb.aio_sigevent.sigev_notify_function = handle_read;
	cb.aio_sigevent.sigev_notify_attributes = &init;
	
	cb.aio_sigevent.sigev_value.sival_ptr = NULL;
	
   /* 
	cb.aio_sigevent.sigev_signo = SIGIO;
	   cb.aio_sigevent.sigev_value.sival_ptr = (void*)buffer2;
	struct sigaction sig_act;

     sigemptyset(&sig_act.sa_mask);
     sig_act.sa_flags = SA_SIGINFO;
     sig_act.sa_sigaction = aio_completion_handler;

     sigaction(SIGIO, &sig_act, NULL);
	*/
	printf("buffer %s\n", strerror(errno));
	aio_read(&cb);
	printf("buffer %s\n", strerror(errno));
	while(aio_error(&cb) == EINPROGRESS)
		{
			printf("Working...\n");
		}
	
		// success?
	int numBytes = aio_return(&cb);
	buffer [numBytes] = 0;
	printf("buffer %d %s\n",numBytes, buffer);
	printf("buffer %d %s\n",errno, strerror(errno));
	
}