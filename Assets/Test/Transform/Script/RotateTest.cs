using UnityEngine;

public class RotateTest : TestBase
{
    Vector3 rotate;
    protected override void TestUpdate(float dt, Material mat, Transform cpu, Transform gpu, Vector3 cpuInitPos, Vector3 gpuInitPos)
    {
        rotate += Vector3.one;
        cpu.transform.rotation = Quaternion.Euler(rotate);
        mat.SetVector("_Rotate", rotate);
    }
}