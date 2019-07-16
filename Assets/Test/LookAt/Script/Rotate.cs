using UnityEngine;

public class Rotate : MonoBehaviour
{
    void Update()
    {
        var euler = transform.localRotation;
        transform.localRotation *=
            Quaternion.AngleAxis(1.0f, Vector3.right) *
            Quaternion.AngleAxis(1.0f, Vector3.up);
    }
}
