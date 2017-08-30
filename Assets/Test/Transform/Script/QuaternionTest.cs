using UnityEngine;

public class QuaternionTest : TestBase
{
    Vector3 rotate;
    protected override void TestUpdate(float dt, Material mat, Transform cpu, Transform gpu, Vector3 cpuInitPos, Vector3 gpuInitPos)
    {
        rotate += Vector3.one * Mathf.Sin(dt);
        var q = Quaternion.Euler(rotate);
        cpu.transform.rotation = q;
        mat.SetVector("_Rotate", new Vector4(q.x, q.y, q.z, q.w));
    }
}