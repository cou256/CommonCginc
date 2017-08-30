using UnityEngine;

public abstract class TestBase : MonoBehaviour
{
    [SerializeField] Shader shader;
    [SerializeField] Transform cpu, gpu;

    float dt;
    Material mat;
    Vector3 cpuInitPos, gpuInitPos;

    void Start ()
    {
        var prefix = GetType().FullName;
        cpu.name = prefix + "Cpu";
        gpu.name = prefix + "Gpu";
        cpuInitPos = cpu.transform.position;
        gpuInitPos = gpu.transform.position;
        mat = gpu.GetComponent<Renderer>().material = new Material(shader);
    }
    void Update()
    {
        TestUpdate(dt, mat, cpu, gpu, cpuInitPos, gpuInitPos);
        dt += Time.deltaTime;
    }
    protected abstract void TestUpdate(float dt, Material mat, Transform cpu, Transform gpu, Vector3 cpuInitPos, Vector3 gpuInitPos);
}