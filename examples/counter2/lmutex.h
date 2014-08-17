
class CMutex
{
public:
    class Lockable
    {
        friend class CMutex;
        std::atomic_flag flag;
    public:
        Lockable()
        {
            flag.clear();
        }
    };
private:
    Lockable * resource;
    CMutex(const CMutex &);
public:
    CMutex(Lockable * l)
    {
        resource = l;
        acquire(l);
    }
    CMutex(Lockable & l)
    {
        resource = &l;
        acquire(l);
    }
    CMutex()
        : resource(nullptr)
    {
    }
    ~CMutex()
    {
        if (resource)
            release(resource);
    }
    void acquire(Lockable * l)
    {
        if (!resource)
            resource = l;
        if (!spinLock(2000, resource))
            //explode here
            return;
    }
    void acquire(Lockable & l)
    {
        acquire(&l);
    }
private:
    void release(Lockable * l)
    {
        if (l)
            l->flag.clear();

    }
    static bool spinLock(int ms, Lockable *  bVal)
    {
        using namespace Misc;
        long start;
        int ret;
    loop:
        start = QuickTime();
        while (bVal->flag.test_and_set()) {
            if ((QuickTime() - start) > ms)
                goto time_out;
            // yield thread
            Delay(0);
        }
        // normal exitpoint
        return true;
        // deadlock occurs
    time_out:
        // handle error ...
    }
}
